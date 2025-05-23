using FluentAssertions;
using IdentityModel;
using IdentityServer.IntegrationTests.Common;
using IdentityServer4.Models;
using System;
using System.Collections.Generic;
using System.IO;
using System.Net;
using System.Net.Http;
using System.Text;
using System.Text.Json;
using System.Threading.Tasks;
using Xunit;

namespace IdentityServer.IntegrationTests.Endpoints.DeviceAuthorization
{
    public class DeviceAuthorizationTests
    {
        private const string Category = "Device authorization endpoint";

        private IdentityServerPipeline _mockPipeline = new IdentityServerPipeline();

        public DeviceAuthorizationTests()
        {
            _mockPipeline.Clients.Add(new Client
            {
                ClientId = "client1",
                ClientSecrets = {new Secret("secret".Sha256())},
                AllowedGrantTypes = GrantTypes.DeviceFlow,
                AllowedScopes = {"openid"}
            });

            _mockPipeline.IdentityScopes.AddRange(new IdentityResource[] {
                new IdentityResources.OpenId()
            });

            _mockPipeline.Initialize();
        }

        [Fact]
        [Trait("Category", Category)]
        public async Task Get_should_return_InvalidRequest()
        {
            var response = await _mockPipeline.BackChannelClient.GetAsync(IdentityServerPipeline.DeviceAuthorization);
            response.StatusCode.Should().Be(HttpStatusCode.BadRequest);

            var resultDto = ParseJsonBody<ErrorResultDto>(await response.Content.ReadAsStreamAsync());

            resultDto.Should().NotBeNull();
            resultDto.error.Should().Be(OidcConstants.TokenErrors.InvalidRequest);
        }

        [Fact]
        [Trait("Category", Category)]
        public async Task Wrong_content_type_return_InvalidRequest()
        {
            var form = new Dictionary<string, string>
            {
                {"client_id", Guid.NewGuid().ToString()}
            };
            var response = await _mockPipeline.BackChannelClient.PostAsync(IdentityServerPipeline.DeviceAuthorization,
                new StringContent(@"{""client_id"": ""client1""}", Encoding.UTF8, "application/json"));

            response.StatusCode.Should().Be(HttpStatusCode.BadRequest);

            var resultDto = ParseJsonBody<ErrorResultDto>(await response.Content.ReadAsStreamAsync());

            resultDto.Should().NotBeNull();
            resultDto.error.Should().Be(OidcConstants.TokenErrors.InvalidRequest);
        }

        [Fact]
        [Trait("Category", Category)]
        public async Task Empty_request_should_return_InvalidClient()
        {
            var response = await _mockPipeline.BackChannelClient.PostAsync(IdentityServerPipeline.DeviceAuthorization,
                new FormUrlEncodedContent(new Dictionary<string, string>()));

            response.StatusCode.Should().Be(HttpStatusCode.BadRequest);

            var resultDto = ParseJsonBody<ErrorResultDto>(await response.Content.ReadAsStreamAsync());

            resultDto.Should().NotBeNull();
            resultDto.error.Should().Be(OidcConstants.TokenErrors.InvalidClient);
        }

        [Fact]
        [Trait("Category", Category)]
        public async Task Unknown_client_should_return_InvalidClient()
        {
            var form = new Dictionary<string, string>
            {
                {"client_id", "client1"}
            };
            var response = await _mockPipeline.BackChannelClient.PostAsync(IdentityServerPipeline.DeviceAuthorization, new FormUrlEncodedContent(form));

            response.StatusCode.Should().Be(HttpStatusCode.BadRequest);

            var resultDto = ParseJsonBody<ErrorResultDto>(await response.Content.ReadAsStreamAsync());

            resultDto.Should().NotBeNull();
            resultDto.error.Should().Be(OidcConstants.TokenErrors.InvalidClient);
        }

        [Fact]
        [Trait("Category", Category)]
        public async Task Valid_should_return_json()
        {
            var form = new Dictionary<string, string>
            {
                {"client_id", "client1"},
                {"client_secret", "secret" }
            };
            var response = await _mockPipeline.BackChannelClient.PostAsync(IdentityServerPipeline.DeviceAuthorization, new FormUrlEncodedContent(form));

            response.StatusCode.Should().Be(HttpStatusCode.OK);
            response.Content.Headers.ContentType.MediaType.Should().Be("application/json");
            
            var resultDto = ParseJsonBody<ResultDto>(await response.Content.ReadAsStreamAsync());

            resultDto.Should().NotBeNull();

            resultDto.Should().NotBeNull();
            resultDto.device_code.Should().NotBeNull();
            resultDto.user_code.Should().NotBeNull();
            resultDto.verification_uri.Should().NotBeNull();
            resultDto.verification_uri_complete.Should().NotBeNull();
            resultDto.expires_in.Should().BeGreaterThan(0);
            resultDto.interval.Should().BeGreaterThan(0);
        }

        private T ParseJsonBody<T>(Stream streamBody)
        {
            streamBody.Position = 0;
            using (var reader = new StreamReader(streamBody))
            {
                var jsonString = reader.ReadToEnd();
                return JsonSerializer.Deserialize<T>(jsonString);
            }
        }

        internal class ResultDto
        {
#pragma warning disable IDE1006 // Naming Styles
            public string device_code { get; set; }
            public string user_code { get; set; }
            public string verification_uri { get; set; }
            public string verification_uri_complete { get; set; }
            public int expires_in { get; set; }
            public int interval { get; set; }
#pragma warning restore IDE1006 // Naming Styles
        }

        internal class ErrorResultDto
        {
            public string error { get; set; }
            public string error_description { get; set; }
        }
    }
}