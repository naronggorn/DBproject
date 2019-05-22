<?php
use \Firebase\JWT\JWT;

date_default_timezone_set("Asia/Bangkok");

class Auth extends \Firebase\JWT\JWT{
private $publicKey = <<<EOD
-----BEGIN PUBLIC KEY-----
MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAxCMC6p+PupfgK26YwUsR
1m0w/tWZAGcb/5GvTdjf5mM4yoyT363atlLYGN095qmWFgGEyNQxV6S/HrtqaL88
Nic3HG3KNio5++5wMAMVSGjyhYhbw5HTJmjRwwuD74GjbYZcZ/gk4pvZGFDsqCFJ
8R/8CfxStBJYlXz0ZdCNa7G3coJoeGwwBh3yBxFkEUVE/Fon88liPN2GmsLkx8VP
+J2tQFf+3slD8BtbTPhRzR+Z8aK+E/S7aGr1cur9EHKd4lZ6AMwxrRaPOoZgAlSO
lNq0KH2+UkqMHHtl9AoJhdqInKZvvZhTsd9ZgM0yx2z6Alf+hJYIVbZcJ5pkpPOz
qQIDAQAB
-----END PUBLIC KEY-----
EOD;

private $privateKey = <<<EOD
-----BEGIN RSA PRIVATE KEY-----
MIIEpAIBAAKCAQEAxCMC6p+PupfgK26YwUsR1m0w/tWZAGcb/5GvTdjf5mM4yoyT
363atlLYGN095qmWFgGEyNQxV6S/HrtqaL88Nic3HG3KNio5++5wMAMVSGjyhYhb
w5HTJmjRwwuD74GjbYZcZ/gk4pvZGFDsqCFJ8R/8CfxStBJYlXz0ZdCNa7G3coJo
eGwwBh3yBxFkEUVE/Fon88liPN2GmsLkx8VP+J2tQFf+3slD8BtbTPhRzR+Z8aK+
E/S7aGr1cur9EHKd4lZ6AMwxrRaPOoZgAlSOlNq0KH2+UkqMHHtl9AoJhdqInKZv
vZhTsd9ZgM0yx2z6Alf+hJYIVbZcJ5pkpPOzqQIDAQABAoIBABNumJJgPqAw/d+v
tGiqJFlHNix5QxBcJtT6PREMZJpxyCWhKeFmWx3nNUu5V7GrqZgCjIJNK5pQUzMb
RF6eW7vNxNMHOZqGMnp4VBsdoxUqeKSsLtNAdlf+2JFnaanoASYPwsX2OslMwYR8
OAYsTiQalCD1I8h9bNNarugLcodxxoMo5JRsR/YevxVHMED8mGSmpxx93wuoCl14
Evfj/6sE+TUxt/Q5jqBd2fszl96gvrEscseDrgDSeARuIUhdNmd02tGnGm0czuv+
mYCUJQUHro1MRce0fdhMt1TuHFuTCNtC/vWbPpvQLk7wLeCOi/zCy3L86zEtN5ul
FqwjEQECgYEA8QMJsznUdsZV1eqJxZKPG+BzS64CriK/wj7nfJY50pSrqbWImr2x
fvbX9hA5GV5uKtZKpq4FVyyKGgWHTKbe58EtTrnCnth9f4npZxIo/qcH9OK/AGNy
In+pJeBzWP7eO3tQXk7/P0J3uixKG97x5uBAAyobHfFpLbA1kvxefgkCgYEA0FWN
TJe0DnmDsiFoc2TupQTBnHlO3QvC7Rs4AQOnL10PTJgPfmPSnsWYTsMDTuWo57eq
u37Bjo8NBZQuCklijhWtZYfby60A/V00UDkBgmYMU8FvSxUye1LVf3MkdT3LHmW/
fMSow2kGoIIcJxVpMVySl35D8nh41fVBy5Pu8KECgYEAo72JoI9gjpVvCZd/pJBO
1ASosDj3rzECkMjF4rn5bNz+x50CwwaviW/RB2a8NEUYmdfe/eDq1e/3n3g0FNqm
RFPVIVBJLjws/zJGNXV8Do6SdEh8tZnamB+dXpNgKo11lHnR/1CyT1ssFnsymj7c
oBuowb2gkLZL2/OEYmk9FWkCgYBFMqVkM19TD3l2yTHwYi4CEbpdRs2zDh0ItGm9
rIDzcm2Ke1dqG63xnqAgSRXoNtALZy4GaOvRdiJVIArKz+U0XG7jsmSHGkeh4Dto
Cgc+ULb3euCEh93kqHbRhmUtrACzcAhSYN/NSC0zUwQW1z3Bb4YhW4cmGm3IY1Yf
UFulAQKBgQDfNGbewHdI6YMCIEs5quD16aW6KDqAC++gp8RMhMTLaFjJVkMh5mqR
7uqvEbTFRDG1reGHVDnZNm/8g2bRH9X7vwHOm3CY1PBL9oYjUfpcQUpjlwLjvN5F
wYPBfNaBJP+2e45IXHgX0PZaUa2RRtd4LJxSWkH4YJu8OLDbI+NyQQ==
-----END RSA PRIVATE KEY-----
EOD;

    public function signJWT($data) {
        $token = array(
            "data" => $data,
            // "iss" => "example.org",
            // "aud" => "example.com",
            "iat" => time(),
            "nbf" => time(),
            "exp" => time() + (60*30)
        );

        $jwt = JWT::encode($token, $this->privateKey, 'RS256');

        return $jwt;
    }

    public function decodeJWT($jwt) {
        try {
            $decoded = JWT::decode($jwt, $this->publicKey, array('RS256'));

            $decoded_array = (array) $decoded;
            
            return $decoded_array;
        } catch (Exception $e) {
            return $e->getMessage();
        }
    }
}
?>