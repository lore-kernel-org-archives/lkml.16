Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC20E78F52
	for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 06:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744439619; cv=none; b=C8mNPwu7VvmZ8/fC6EXZxy6Gcd81fNHlvr/A+xFGU5i093w4emcQF4xnPLmJ848boF1QqqoJ5DEnAHm93WPkhlehPZs1G+bkA1fWEtGdyzN0qtJdedkyvo4aUafBdaPKRggxWeCJxT1m9nBmm7Wa0vwTC2Q3i0Nsj+a8sfGAodU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744439619; c=relaxed/simple;
	bh=wFeipSnh221X1DW1gS7MAywlYDvPZ0eWyJ0HBRu5V2I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kV5m1ck2oC4L7XF1Di1r9Z1myOX0oEmpj5F2ZPCqPEjb58u7YTNorCUmNdGIpTYCptEQfATDe+lpJsb9pBJ4/IC3zTGrppiCVUfbwccuDEOU3gDTZHu51zy0TVOTDT2cR/JqOkYWw2rdWAOf+CE+CT5dE/lFHt2XT02OxWHla88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=s/CVNUM/; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="s/CVNUM/"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6e8f05acc13so30024236d6.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 23:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744439616; x=1745044416; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bf3RmGI1Up9+DgQmNDbgwl+LW0ONx/xy0E5xM82wbls=;
        b=s/CVNUM/XpoLnoJlBS8JETZ88o+/9UfDy5dbPDg53Lz/h3o3U6HHAhjWNwYL3Nwqjl
         3v7zm1YQL9PMTlOBTCVFa68dTijMXV2DRzXkHVmBQaedbrbPlbRDQqlMjoO4m3UaZbqL
         DpR0EU71ED9YjjQLuYHU3OUP1g+v3fQ5Ekg1BhnBvX+j4g0tjZW1C08Av0rLfUYgU/XO
         BlwthnzJmGheMQm8QY/V1wJEfSAq59quKSIXm8HrN0umJIURAZIirb4F/wU74FsssRLH
         SX01LRfranWogB91zrKIxjdKFskY0zOctMup4pi4NcbyhIcZLS9QUtadSx+emdTzxnv9
         sBUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744439616; x=1745044416;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bf3RmGI1Up9+DgQmNDbgwl+LW0ONx/xy0E5xM82wbls=;
        b=MubcqUgno/6wS7l1+/pKzcrIA4mWsYLn2X1lnpxfSdfdZUuLlTea8NxCx3Rj8ITqHP
         FywVmCCHg3BXqgro0/DHTkFq3oQn9j+1X594ZK+iuGuGHnwyAmdB3Ni2eTAv/kxbfRmC
         Xz13LDxEi566kh5MYqrDyO9Qb1hsB8OtJ358bxlYcPLGMU5jAoYN5j3f/3UXKd6jdIOH
         mKS/GDwDPvGGce9pcqwHM42vFs6FvWwgoGsPEComM81wp61Ehdm1OcJKdSCEo5uyYGng
         3aUa2uYaG5WfUWgJ+C4xvZW64blUnB9vk5PYmpj0ztiYu1hbzpKSj3fuaeyRhn5m4XtZ
         kBTw==
X-Forwarded-Encrypted: i=1; AJvYcCUvvJlTUd+8neM0o7Q9x23xK0CGar9FuTw9LZn/psHdGpDfdWOIbLmDLfKzn23ZCqFDHKDIOvzSBdP9sxs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTNcDah9W5kR6MIpjEQcKQClWzr0Qa+WkMT8ZPON+18cOm6zOE
	RLKJNU26p59OZx/RhnXnQA/QvSw4Brl/JtV8Riq7R7kK7XXt0VmqEo2EUNF6D1c4opAzMSx8RWw
	PZWdy14tH+/7W88uTMlgz63WevJcEDea8G9J3
X-Gm-Gg: ASbGncujAbtwyRJRhImPqyp1jxSGYGbf++X6nwBfsO5DXwKOyuBzjV0IjTHzWby7b5J
	2bS1j07lcnndajEEVAwPtk5lF4qIE/wcEg74iFQWSNXsNCsgwjiJ63liEnjEwT3TnX7FUCSGfDo
	i89FdhEdnxvlozpoMKMeQTYZE=
X-Google-Smtp-Source: AGHT+IGcW+JcRRlTV9aunaNuz8FcK1vpXeR1RPFLG5dc09oJXFxmB744vqR10l8ZoVsvPymVL8JEd5YwtUc5Nu9WL9g=
X-Received: by 2002:ad4:5761:0:b0:6e8:9394:cbbe with SMTP id
 6a1803df08f44-6f230d5131bmr83230056d6.20.1744439616214; Fri, 11 Apr 2025
 23:33:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250411123608.1676462-1-rf@opensource.cirrus.com>
In-Reply-To: <20250411123608.1676462-1-rf@opensource.cirrus.com>
From: David Gow <davidgow@google.com>
Date: Sat, 12 Apr 2025 14:33:23 +0800
X-Gm-Features: ATxdqUGFBU6Zs4ojW6Wl96KMzgoT0zxQwz_GgcUDQnToZ3Ogvu6aVh1O1w83dw0
Message-ID: <CABVgOSnB0C+YbHA4QE1yY4Jzwcxq9F3Jo8wYHDdxDCNE9yPP8A@mail.gmail.com>
Subject: Re: [PATCH 0/3] Fix up building KUnit tests for Cirrus Logic modules
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: broonie@kernel.org, brendan.higgins@linux.dev, rmoar@google.com, 
	npache@redhat.com, linux-kselftest@vger.kernel.org, 
	kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org, 
	patches@opensource.cirrus.com
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="000000000000b2e76d06328eff94"

--000000000000b2e76d06328eff94
Content-Type: text/plain; charset="UTF-8"

On Fri, 11 Apr 2025 at 20:36, Richard Fitzgerald
<rf@opensource.cirrus.com> wrote:
>
> This series fixes the KConfig for cs_dsp and cs-amp-lib tests so that
> CONFIG_KUNIT_ALL_TESTS doesn't cause them to add modules to the build.
>
> Patch 1 adds the ASoC CS35L56 driver to KUnit all_tests.config so that
>         cs_dsp and cs-amp-lib will be included in the test build.
>
> Patch 2 and 3 fixup the KConfig entries for cs_dsp and cs-amp-lib.

This looks great to me.

The series is:
Reviewed-by: David Gow <davidgow@google.com>


Do you want us to take this (either the whole thing, or just the first
patch) via the KUnit tree, or will you take it yourself? Either should
work here.

Cheers,
-- David

>
> Nico Pache (1):
>   firmware: cs_dsp: tests: Depend on FW_CS_DSP rather then enabling it
>
> Richard Fitzgerald (2):
>   kunit: configs: Add some Cirrus Logic modules to all_tests
>   ASoC: cs-amp-lib-test: Don't select SND_SOC_CS_AMP_LIB
>
>  drivers/firmware/cirrus/Kconfig              | 5 +----
>  sound/soc/codecs/Kconfig                     | 5 ++---
>  tools/testing/kunit/configs/all_tests.config | 2 ++
>  3 files changed, 5 insertions(+), 7 deletions(-)
>
> --
> 2.39.5
>

--000000000000b2e76d06328eff94
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIIUnQYJKoZIhvcNAQcCoIIUjjCCFIoCAQExDzANBglghkgBZQMEAgEFADALBgkqhkiG9w0BBwGg
ghIEMIIGkTCCBHmgAwIBAgIQfofDAVIq0iZG5Ok+mZCT2TANBgkqhkiG9w0BAQwFADBMMSAwHgYD
VQQLExdHbG9iYWxTaWduIFJvb3QgQ0EgLSBSNjETMBEGA1UEChMKR2xvYmFsU2lnbjETMBEGA1UE
AxMKR2xvYmFsU2lnbjAeFw0yMzA0MTkwMzUzNDdaFw0zMjA0MTkwMDAwMDBaMFQxCzAJBgNVBAYT
AkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMSowKAYDVQQDEyFHbG9iYWxTaWduIEF0bGFz
IFI2IFNNSU1FIENBIDIwMjMwggIiMA0GCSqGSIb3DQEBAQUAA4ICDwAwggIKAoICAQDYydcdmKyg
4IBqVjT4XMf6SR2Ix+1ChW2efX6LpapgGIl63csmTdJQw8EcbwU9C691spkltzTASK2Ayi4aeosB
mk63SPrdVjJNNTkSbTowej3xVVGnYwAjZ6/qcrIgRUNtd/mbtG7j9W80JoP6o2Szu6/mdjb/yxRM
KaCDlloE9vID2jSNB5qOGkKKvN0x6I5e/B1Y6tidYDHemkW4Qv9mfE3xtDAoe5ygUvKA4KHQTOIy
VQEFpd/ZAu1yvrEeA/egkcmdJs6o47sxfo9p/fGNsLm/TOOZg5aj5RHJbZlc0zQ3yZt1wh+NEe3x
ewU5ZoFnETCjjTKz16eJ5RE21EmnCtLb3kU1s+t/L0RUU3XUAzMeBVYBEsEmNnbo1UiiuwUZBWiJ
vMBxd9LeIodDzz3ULIN5Q84oYBOeWGI2ILvplRe9Fx/WBjHhl9rJgAXs2h9dAMVeEYIYkvW+9mpt
BIU9cXUiO0bky1lumSRRg11fOgRzIJQsphStaOq5OPTb3pBiNpwWvYpvv5kCG2X58GfdR8SWA+fm
OLXHcb5lRljrS4rT9MROG/QkZgNtoFLBo/r7qANrtlyAwPx5zPsQSwG9r8SFdgMTHnA2eWCZPOmN
1Tt4xU4v9mQIHNqQBuNJLjlxvalUOdTRgw21OJAFt6Ncx5j/20Qw9FECnP+B3EPVmQIDAQABo4IB
ZTCCAWEwDgYDVR0PAQH/BAQDAgGGMDMGA1UdJQQsMCoGCCsGAQUFBwMCBggrBgEFBQcDBAYJKwYB
BAGCNxUGBgkrBgEEAYI3FQUwEgYDVR0TAQH/BAgwBgEB/wIBADAdBgNVHQ4EFgQUM7q+o9Q5TSoZ
18hmkmiB/cHGycYwHwYDVR0jBBgwFoAUrmwFo5MT4qLn4tcc1sfwf8hnU6AwewYIKwYBBQUHAQEE
bzBtMC4GCCsGAQUFBzABhiJodHRwOi8vb2NzcDIuZ2xvYmFsc2lnbi5jb20vcm9vdHI2MDsGCCsG
AQUFBzAChi9odHRwOi8vc2VjdXJlLmdsb2JhbHNpZ24uY29tL2NhY2VydC9yb290LXI2LmNydDA2
BgNVHR8ELzAtMCugKaAnhiVodHRwOi8vY3JsLmdsb2JhbHNpZ24uY29tL3Jvb3QtcjYuY3JsMBEG
A1UdIAQKMAgwBgYEVR0gADANBgkqhkiG9w0BAQwFAAOCAgEAVc4mpSLg9A6QpSq1JNO6tURZ4rBI
MkwhqdLrEsKs8z40RyxMURo+B2ZljZmFLcEVxyNt7zwpZ2IDfk4URESmfDTiy95jf856Hcwzdxfy
jdwx0k7n4/0WK9ElybN4J95sgeGRcqd4pji6171bREVt0UlHrIRkftIMFK1bzU0dgpgLMu+ykJSE
0Bog41D9T6Swl2RTuKYYO4UAl9nSjWN6CVP8rZQotJv8Kl2llpe83n6ULzNfe2QT67IB5sJdsrNk
jIxSwaWjOUNddWvCk/b5qsVUROOuctPyYnAFTU5KY5qhyuiFTvvVlOMArFkStNlVKIufop5EQh6p
jqDGT6rp4ANDoEWbHKd4mwrMtvrh51/8UzaJrLzj3GjdkJ/sPWkDbn+AIt6lrO8hbYSD8L7RQDqK
C28FheVr4ynpkrWkT7Rl6npWhyumaCbjR+8bo9gs7rto9SPDhWhgPSR9R1//WF3mdHt8SKERhvtd
NFkE3zf36V9Vnu0EO1ay2n5imrOfLkOVF3vtAjleJnesM/R7v5tMS0tWoIr39KaQNURwI//WVuR+
zjqIQVx5s7Ta1GgEL56z0C5GJoNE1LvGXnQDyvDO6QeJVThFNgwkossyvmMAaPOJYnYCrYXiXXle
A6TpL63Gu8foNftUO0T83JbV/e6J8iCOnGZwZDrubOtYn1QwggWDMIIDa6ADAgECAg5F5rsDgzPD
hWVI5v9FUTANBgkqhkiG9w0BAQwFADBMMSAwHgYDVQQLExdHbG9iYWxTaWduIFJvb3QgQ0EgLSBS
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
YE9NAgMBAAGjggHgMIIB3DAeBgNVHREEFzAVgRNkYXZpZGdvd0Bnb29nbGUuY29tMA4GA1UdDwEB
/wQEAwIFoDAdBgNVHSUEFjAUBggrBgEFBQcDBAYIKwYBBQUHAwIwHQYDVR0OBBYEFHgsCGkO2Hex
N6ybc+GeQEb6790qMFgGA1UdIARRME8wCQYHZ4EMAQUBAjBCBgorBgEEAaAyCgMDMDQwMgYIKwYB
BQUHAgEWJmh0dHBzOi8vd3d3Lmdsb2JhbHNpZ24uY29tL3JlcG9zaXRvcnkvMAwGA1UdEwEB/wQC
MAAwgZoGCCsGAQUFBwEBBIGNMIGKMD4GCCsGAQUFBzABhjJodHRwOi8vb2NzcC5nbG9iYWxzaWdu
LmNvbS9jYS9nc2F0bGFzcjZzbWltZWNhMjAyMzBIBggrBgEFBQcwAoY8aHR0cDovL3NlY3VyZS5n
bG9iYWxzaWduLmNvbS9jYWNlcnQvZ3NhdGxhc3I2c21pbWVjYTIwMjMuY3J0MB8GA1UdIwQYMBaA
FDO6vqPUOU0qGdfIZpJogf3BxsnGMEYGA1UdHwQ/MD0wO6A5oDeGNWh0dHA6Ly9jcmwuZ2xvYmFs
c2lnbi5jb20vY2EvZ3NhdGxhc3I2c21pbWVjYTIwMjMuY3JsMA0GCSqGSIb3DQEBCwUAA4ICAQAs
exV05yVDmPhHRqOq9lAbfWOUvEf8zydxabZUHna6bayb83jD2eb9nMGGEprfuNBRmFg35sgF1TyN
+ieuQakvQYmY8tzK49hhHa2Y3qhGCTqYTHO3ypHvhHsZiGbL0gmdgB9P8ssVIws//34ae99GUOxo
XKTxPwwsQ5Arq42besv3/HXAW+4nRAT8d3ht5ZWCHc5rjL/vdGzu7PaYo3u0da69AZ8Sh4Gf5yoc
QANr2ZkMrxXbLmSmnRvbkQrzlZp2YbTFnczx46429D6q75/FNFOL1vAjxtRAPzkyACvW0eKvchza
TMvvD3IWERLlcBL5yXpENc3rI8/wVjqgAWYxlFg1b/4b/TCgYe2MZC0rx4Uh3zTIbmPNiHdN6QZ9
oDiYzWUcqWZ5jCO4bMKNlVJXeCvdANLHuhcC8FONj5VzNgYXs6gWkp9/Wt6XnQPX4dF4JBa8JdL/
cT46RJIzoiJHEx/8syO5FparZHIKbkunoq6niPsRaQUGeqWc56H4Z1sQXuBJN9fhqkIkG0Ywfrwt
uFrCoYIRlx4rSVHpBIKgnsgdm0SFQK72MPmIkfhfq9Fh0h8AjhF73sLO7K5BfwWkx1gwMySyNY0e
PCRYr6WEVOkUJS0a0fui693ymMPFLQAimmz8EpyFok4Ju066StkYO1dIgUIla4x61auxkWHwnzGC
Al0wggJZAgEBMGgwVDELMAkGA1UEBhMCQkUxGTAXBgNVBAoTEEdsb2JhbFNpZ24gbnYtc2ExKjAo
BgNVBAMTIUdsb2JhbFNpZ24gQXRsYXMgUjYgU01JTUUgQ0EgMjAyMwIQAcDMKctW1GQKDKqEUSh4
pjANBglghkgBZQMEAgEFAKCBxzAvBgkqhkiG9w0BCQQxIgQgANtFe4JLdgxAaYgO0BZ/IFQQW7Wu
sWYIisYL3JvK3zIwGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMjUw
NDEyMDYzMzM2WjBcBgkqhkiG9w0BCQ8xTzBNMAsGCWCGSAFlAwQBKjALBglghkgBZQMEARYwCwYJ
YIZIAWUDBAECMAoGCCqGSIb3DQMHMAsGCSqGSIb3DQEBBzALBglghkgBZQMEAgEwDQYJKoZIhvcN
AQEBBQAEggEAWRlOD8pvfDCC41sTEx9EU28qvUSMcV4W/E6Dc2cIYESjpOxTQstblwuOhUF3jcWE
nnBvjTROfR6byXrQ2On6D9c80v7Wtp8bq5I8xEHWncNyxXm/LHfJCii0zjcata9BcYFVvGIj5PRg
8DdgrpBdZq+VKCshJ1RCuT2b+t8qd1hWGvihrSEdEj3f92FvvC0wkF16d++KnpaP3IHwmqGUd3DH
oS7mAcLe+8fNz4Tt2oxuF+HlqK9aTqEBO8DoB98EvO2ON9NeSSGjCPrTI0gC0syaRRs0EBW2TM3I
3ufMz+3DdHnlDw+spuP1qNCrBA1xxFnRYZDJrF7eTr7KzEypvA==
--000000000000b2e76d06328eff94--
