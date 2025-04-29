Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8290F27602E
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 07:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745912656; cv=none; b=ejht3bkhrJHnMNCZhD0P8/uT8pv0LUqDaox72wVF+3Zk5OaWTnVCDn+eADTmSvjF9YCANoc94m0J6lV6W1ANW1Vm5eU+C3651Y+uy6AZLB/S+sjVJ+HJ5+lAIA8QCyuq/g3hxtLQcBkX1eX6sbGuBFxCk04w6sC6sr47NpxaDdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745912656; c=relaxed/simple;
	bh=i4ZLeezpUr/CUayWHZqWZRaj6uLah+5FedCmXLweGa4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I6ovdkHG0lhL8227SfOftSZpHMLnqONTAxHznVeqZsiV+JOSFXKmCYucUF9/G7pvwJlgScvq1y9V75xo+gq2CsxT3mDKmtR4FJnEy/bPlO0f7x//DbVTlNQ9GDksHUro/FBYJMqYr0sbwzEvmsle03CH9bL1ycCJy5okKl+jTzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=2DqPhZQT; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2DqPhZQT"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6e8f7019422so58474486d6.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 00:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745912653; x=1746517453; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+aYvNY2lEu3Yq6A2ZT7tRfkKlsLlEPF28ME5tylHSzk=;
        b=2DqPhZQTEd4QIcQW30pfQN9zcoDUhbhbAdPRYL2VUTXMeqfd68X6gX9Ay+0Z0/9cpP
         LL1I8RHMnKbvqhqvcVo97FjkL/n9C6Iglm+cQt+nuqNisH1SDOItqcquYTTtmBon+eSv
         ZurYvbVWugXu5ghoY57MW4qKqq1OP4eFF7NwPN+gVkrqw5RFjEMnWE35E3sNtOGxVxhu
         g5WhGFVb4spI1635SOhJHj2tzdAkH0q2VMLf4b3WW7eb1TKWm7VFVj7Iou++ha+mQ1Js
         yOrIqsP0r79hiRAJUCcyVsWdZhyn4AmGXGSM8YIBfuFH1w95Y0TqCWV/p/w9w6lHMhCT
         mLJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745912653; x=1746517453;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+aYvNY2lEu3Yq6A2ZT7tRfkKlsLlEPF28ME5tylHSzk=;
        b=Xtxr6x2aVFBXDtsJR4qkPYD/IVp1Lq7nqpg4iuVoN4k/XMGZgSN8xScNJe4MXhfbCl
         fpbiUjXwFOkh2sWuSiB7iy7d39z9RmySNuIT4nYc7okH3rAdsffcSrs1ibc2ytPD8iEm
         h03fnm6lvZScNJPEm17R37I9TH6U8zpQp6i3t7O/1NQnKdOe2kisiZBl+m2l/pUD72qs
         /UOQmrl7lbtzQ92YpYREC0YPRzotzkHHR8zGQR4w+QA7/QrS+GVBmd3tw6l2BoE5sSsY
         ZPT2X7YiZBgamHjiK4aVFv+VxO505elEp9ui2a+tM97juR22tIn8yMeGpZQGsG7i+5KG
         aA+A==
X-Forwarded-Encrypted: i=1; AJvYcCUJkJwpNpipuSRJiMkiUwx6lGztLsqNS6mfKOmKlzXR+j/Qp/HZsK+UU1FzONbXb82L/pnjY+BvfGIyCRU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxedd7cVf+wYxoTFhIk+QyYS2pvq1aR92ev5KbK+cZsq/YRtuVC
	zIYJNTECz7Vh9oUp9FEM14av58AZqOfGnyvEDgAN4Q3Xo9E4vPtERtOCmRXcVVoRV0pfw2lSWmK
	pqOkNEmpBGTck4WiIko8TRkm/c4lP1zR53k1M
X-Gm-Gg: ASbGncuugJJqWf/TARiI8gU5Fj2cKLuZ7t0aa6/VaaTcGuu8z6y/hB4tQw/NMJziitP
	ryWsMsmJNdG6oBOI47/kV1QXSSFJfkjJf8c4siE3zZL1fV5LKV9U4myBds4uwWy7TCi1GaJ3bo7
	M2siTuOWcV5865P2SPdUcCh9mU/uXoBIp2cQ==
X-Google-Smtp-Source: AGHT+IHelUEyscyQarKuoY3t912ti4kNs8ODnZYdtusFfqBwbQeE4DfZslv6ZALn4IcIacFakO1rKniYgGz4FVzHgK8=
X-Received: by 2002:a05:6214:c2a:b0:6e6:65a6:79a4 with SMTP id
 6a1803df08f44-6f4d1f9e216mr186361416d6.44.1745912653232; Tue, 29 Apr 2025
 00:44:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250427013604.work.926-kees@kernel.org> <20250427013836.877214-2-kees@kernel.org>
In-Reply-To: <20250427013836.877214-2-kees@kernel.org>
From: David Gow <davidgow@google.com>
Date: Tue, 29 Apr 2025 15:44:01 +0800
X-Gm-Features: ATxdqUH8o73n3_NAeG1RX1Q730xFJQWSEjihUzU_Ax5GFg7DEM9ErC40vXwR-Sc
Message-ID: <CABVgOSn1Lrkp96tucPniwPkVbpsBvTRZey=mCVDw7xS+Jro_AA@mail.gmail.com>
Subject: Re: [PATCH 2/3] lib/tests: Add randstruct KUnit test
To: Kees Cook <kees@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Bill Wendling <morbo@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Justin Stitt <justinstitt@google.com>, 
	Petr Mladek <pmladek@suse.com>, Rae Moar <rmoar@google.com>, Tamir Duberstein <tamird@gmail.com>, 
	Diego Vieira <diego.daniel.professional@gmail.com>, Luis Chamberlain <mcgrof@kernel.org>, 
	llvm@lists.linux.dev, "Dr. David Alan Gilbert" <linux@treblig.org>, Mark Brown <broonie@kernel.org>, 
	WangYuli <wangyuli@uniontech.com>, =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, 
	=?UTF-8?Q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Paul Moore <paul@paul-moore.com>, 
	James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, linux-security-module@vger.kernel.org
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="0000000000008827480633e5f794"

--0000000000008827480633e5f794
Content-Type: text/plain; charset="UTF-8"

On Sun, 27 Apr 2025 at 09:38, Kees Cook <kees@kernel.org> wrote:
>
> Perform basic validation about layout randomization and initialization
> tracking when using CONFIG_RANDSTRUCT=y. Tested using:
>
> $ ./tools/testing/kunit/kunit.py run \
>         --kconfig_add CONFIG_RANDSTRUCT_FULL=y \
>         randstruct
> [17:22:30] ================= randstruct (2 subtests) ==================
> [17:22:30] [PASSED] randstruct_layout
> [17:22:30] [PASSED] randstruct_initializers
> [17:22:30] =================== [PASSED] randstruct ====================
> [17:22:30] ============================================================
> [17:22:30] Testing complete. Ran 2 tests: passed: 2
> [17:22:30] Elapsed time: 5.091s total, 0.001s configuring, 4.974s building, 0.086s running
>
> Adding "--make_option LLVM=1" can be used to test Clang, which also
> passes.
>
> Signed-off-by: Kees Cook <kees@kernel.org>
> ---

This works here for me. I'm a little wary of the prospect of the
"unlucky or broken" message making the test fail if we're just
unlucky, but it seems unlikely enough that we can deal with it later
if it ever becomes a problem.

Acked-by: David Gow <davidgow@google.com>

Cheers,
-- David

--0000000000008827480633e5f794
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
pjANBglghkgBZQMEAgEFAKCBxzAvBgkqhkiG9w0BCQQxIgQgkIMqUYidz4o/0sJ+mN0/dJbN3qrU
/IumZytD/S5ndhowGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMjUw
NDI5MDc0NDEzWjBcBgkqhkiG9w0BCQ8xTzBNMAsGCWCGSAFlAwQBKjALBglghkgBZQMEARYwCwYJ
YIZIAWUDBAECMAoGCCqGSIb3DQMHMAsGCSqGSIb3DQEBBzALBglghkgBZQMEAgEwDQYJKoZIhvcN
AQEBBQAEggEAWewXsFFpcHfRhoG9w061vBrnUwxhXCWI7ZR3AtqzrCpKXVvFTp2v5czKPq1u4Uik
JixGBG37AjqBEPlkeHJhV+62IYp7AlQA9nRidqPEmYLLrXotGPeSDiFqVgnHAAPXrs3jltKJcf5t
7rsQpdSvID43tVk5dvhQoKvX9oO+13kqm/eyHg46cEg/rUpUJcWXx9qgBKBufy8mZVmrtAWRSWu5
SWCIKiAkk16NyErKokleQ09sDwm92JvSfr4EJczEGThDIrHo+xFAS39ZgJTtgcHTsq8lDarHHrc3
bjJ9ceP2E5dhOyX2WWXvXvbj/HneGTpa35uuK3dHfuXEb8B/yQ==
--0000000000008827480633e5f794--
