Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7AF11A01D4
	for <linux-kernel@vger.kernel.org>; Sat,  8 Feb 2025 08:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739002220; cv=none; b=KJJlCpSVXEN7irAgkTzXlv/uopMuIAcZPXEJ/gL88LukRzZpcarLO9WTnG3J7hYgWC0FHmZuiRKPlNweEWSb64PHnmouB4MrS876VQVTYoCmcB1b4etP5D4/FPoKSYcM9n6Y/Npcs96zIl3RvmbHPYWaQSuq6hUK5YLWPyEq1xI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739002220; c=relaxed/simple;
	bh=8RPp1PWZNXUpsRNUkJzMdOhjafa6zFgOfeKEx8NBMVU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eKl8CgUyFVO/P9fMsRlhUERKM5rGRojKdi8Lfa2Sn5uyVapIZUQosC6qGFqqIN5xIrwVmETCJ3f2MKHvvNZFJVpO3AUayqEZhEWpqR0fPJLEJ72kgf5a4Ep2PccFRnTvIxsLupEhbVZksHlwXGARJv5dJkoTxrJTkwvehmIeSB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=W870nryc; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="W870nryc"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6e41e17645dso25249976d6.2
        for <linux-kernel@vger.kernel.org>; Sat, 08 Feb 2025 00:10:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739002217; x=1739607017; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dRFXsslZQcTIuBJfD8Bx6DU/SwROmX7m+nrt6lgeHns=;
        b=W870nrycwOYcHZXzZ2nZPug1macuUdPar6YTjUBsZimnLH3ac9zS3hWcUT/qagWKMw
         VyZU8PNiiiSzDOlyD/cPHJPCHo4JN2xIkFeOvZgWDC+xwoehg0DIxvxeaShQwR1jvRNn
         csc5rYRAWchxmZZ0+tzMrfr10k6yQHJxcHTvc/AtZast7RogN0sqJ30s0//mpCishIwl
         4TPQu1qZy80tkrqywlZrjI+VFRpBBOy+9a6DiWoxp7pxMnKylieGIjkE5j6YsH0PKWNb
         7vQWhJNCsJie9M+xpECexB0nwdnSzJeAXgAP5A0g7egSsvMjBd9odfNN0xX3T0c1KceI
         6BlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739002217; x=1739607017;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dRFXsslZQcTIuBJfD8Bx6DU/SwROmX7m+nrt6lgeHns=;
        b=MQmKDzMwNM2ViinvVNdEF/+4LfP7W0MWb65Rw+UEOh+k+Y+Oi/do3niJpKNsPNZytt
         DbimwJ9tIxllDzuyPj3XZ5qs3PiCFZlbJO1YReYOFaPrADU05gfg7wxj7AdsBawtZlK2
         OWzbzKtOdcfsHwqzYncFPbrRfxMWDjJ5QZUkB0WLizstSr0sK5ja4++5Vasz1T7kmMB9
         9e3OA0K3lxIMmJHOSiMfNmAccPZsu7Mr8S7cx/rJh5p86d357HAQtt5v2YBqrMTQ0Hnp
         xGKaXyhbKr4pp9DKaWT3ZC6e606V81U2ONABXHzwnuy0ejgs65wo5N8+U1oD1E0RNjxI
         zsgA==
X-Forwarded-Encrypted: i=1; AJvYcCUxouZJjIaYFZNXomTJH1miLFYz0LNZR6s/x7OeJl0PjjtMGO6t53a+xIiYrMnPCTdU/OnyZEA0u9IdEg0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwgWkqp3Xcc71sI2l72arEwMKsuLfqlXWgBXTGcii+hqw/2qlft
	UPa3t2lHTJGirfaX5gC36/hXToCLrMIaEYIJSeWRBKuSJ070IjAtPPs6/qHqBDeVNOrKM6k4dZm
	10nGoKFoZO0K0KL4d5371AiyWoXXXCI67rafD
X-Gm-Gg: ASbGncuR2mVr4jf+ml6akMrB23TpCBoeVzDkw4frlBzSYBQgUZFjiMSjPnczp2VwzOf
	EgA0RBHPyaJKrgA9f8NpdipIsXH3fhOcJa/DBlhyg+AAG6mrdXBmEhlxZD0oUcnNQDyG9SNp2eg
	==
X-Google-Smtp-Source: AGHT+IF3eOdnj5P8ViYhUQaN65TDIoV84qq2q+dEp0goDYELQT+GL96LEo2D8I+kbDcWStPqWjRTCirRKhNqV/CVlrg=
X-Received: by 2002:ad4:576b:0:b0:6d8:83bd:5cfb with SMTP id
 6a1803df08f44-6e4455d61b7mr102122816d6.10.1739002217594; Sat, 08 Feb 2025
 00:10:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250207-prime_numbers-kunit-convert-v1-0-6067f2b7c713@gmail.com> <20250207-prime_numbers-kunit-convert-v1-1-6067f2b7c713@gmail.com>
In-Reply-To: <20250207-prime_numbers-kunit-convert-v1-1-6067f2b7c713@gmail.com>
From: David Gow <davidgow@google.com>
Date: Sat, 8 Feb 2025 16:10:03 +0800
X-Gm-Features: AWEUYZn8HV0vOf_-RI9Hqt2SR3pMr7iaSpKEF4j6wNPe5wD-2B18Qb_5hrzn9pY
Message-ID: <CABVgOSkkmP8W0HeK7ZzikXABmM5_NNeZ9_95V8pfGRjUuW2UUA@mail.gmail.com>
Subject: Re: [PATCH 1/2] lib/math: Hook up tests/Makefile
To: Tamir Duberstein <tamird@gmail.com>
Cc: Shuah Khan <skhan@linuxfoundation.org>, 
	Luis Felipe Hernandez <luis.hernandez093@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="000000000000771759062d9d010d"

--000000000000771759062d9d010d
Content-Type: text/plain; charset="UTF-8"

On Sat, 8 Feb 2025 at 06:33, Tamir Duberstein <tamird@gmail.com> wrote:
>
> This Makefile has been dead code since it was added in commit
> 7fcc9b53216c ("lib/math: Add int_pow test suite"); the tests worked
> because of the duplicated rules in the parent directory's Makefile. Wire
> up tests/Makefile and remove the duplication.
>
> Fixes: 7fcc9b53216c ("lib/math: Add int_pow test suite")
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> ---

Thanks for fixing this.

Reviewed-by: David Gow <davidgow@google.com>

-- David

>  lib/math/Makefile | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/lib/math/Makefile b/lib/math/Makefile
> index 853f023ae537..d390da9a59fe 100644
> --- a/lib/math/Makefile
> +++ b/lib/math/Makefile
> @@ -5,8 +5,8 @@ obj-$(CONFIG_CORDIC)            += cordic.o
>  obj-$(CONFIG_PRIME_NUMBERS)    += prime_numbers.o
>  obj-$(CONFIG_RATIONAL)         += rational.o
>
> -obj-$(CONFIG_INT_POW_TEST)  += tests/int_pow_kunit.o
>  obj-$(CONFIG_TEST_DIV64)       += test_div64.o
>  obj-$(CONFIG_TEST_MULDIV64)    += test_mul_u64_u64_div_u64.o
>  obj-$(CONFIG_RATIONAL_KUNIT_TEST) += rational-test.o
> -obj-$(CONFIG_INT_SQRT_KUNIT_TEST) += tests/int_sqrt_kunit.o
> \ No newline at end of file
> +
> +obj-y += tests/
>
> --
> 2.48.1
>

--000000000000771759062d9d010d
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIIUqgYJKoZIhvcNAQcCoIIUmzCCFJcCAQExDzANBglghkgBZQMEAgEFADALBgkqhkiG9w0BBwGg
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
AmowggJmAgEBMGgwVDELMAkGA1UEBhMCQkUxGTAXBgNVBAoTEEdsb2JhbFNpZ24gbnYtc2ExKjAo
BgNVBAMTIUdsb2JhbFNpZ24gQXRsYXMgUjYgU01JTUUgQ0EgMjAyMwIQAcDMKctW1GQKDKqEUSh4
pjANBglghkgBZQMEAgEFAKCB1DAvBgkqhkiG9w0BCQQxIgQg8aaloQtRLtmUW9UlyZ424ZO+Q5BV
5ybNLBVBIFKSZtQwGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMjUw
MjA4MDgxMDE3WjBpBgkqhkiG9w0BCQ8xXDBaMAsGCWCGSAFlAwQBKjALBglghkgBZQMEARYwCwYJ
YIZIAWUDBAECMAoGCCqGSIb3DQMHMAsGCSqGSIb3DQEBCjALBgkqhkiG9w0BAQcwCwYJYIZIAWUD
BAIBMA0GCSqGSIb3DQEBAQUABIIBABU5eG3xeNFu3SJs3wtReHYqPoGniatdmumad+vcCrT1ri+H
LjD4hKLduwNi8rUmD3nagY51N5xpkg4hgWAG0R4zbHc9Twc1qUT+TcnC7jCitlwxe5oC42WLwU3G
d49q5aLJHe185ASGR2k7Pq/XfLzeHbqHkvT3AQrpgR3giJn/FkJ3Llther7KRnC/aqaI80b1wEg0
mpdnH3Sqd0E4Yg3IO9j/XhVQt4lsSZ3EUQr0ye5KNK6pHkooHyGuuCWGQKyCK/HNADTOyObDFzSp
tz9Pillh+bnWiB5rfgDHH760i2ZI1HdGY21Rv8/lJfjkFrt5N97XKQbCHmM2YCFv97Q=
--000000000000771759062d9d010d--
