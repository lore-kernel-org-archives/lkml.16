Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29C202E5424
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 17:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750959747; cv=none; b=rppGbp+Ow5Scxe1MVF9lWMdfOzuQJXh1r0PUAeRkP888oASZ/NCWIIhXb4i9zJGxESQkzp7Ky++5YwK0qIOwnTotWprD8tKrvS3nBkndAZ12wt1E8X8uO//sqtj/kM/PRUtFcPp8dm3QKvAdpiryMkKdcJRN5iykRJ9ptXoH6vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750959747; c=relaxed/simple;
	bh=deSFDnhOJtlWZpe4wHWLJBk0sR8mZVKWxPORbntKWow=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ctOZ4HlBEHaRbvOQbkUhPSf4NIwywaEZhwmtXpRf61nlsgR83rf9CRqZu1dXm1LV2e6XgwjZjiYfapuNLP3I6MMe8HWH7WxmmkDkWFhupXEh5121+bnSe9DdncOQvT3vozOdPgD0YEZBRWirR+xEjC8Ov+sjXKsVzg5vE66MArY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=2C5myPDo; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2C5myPDo"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7c5b8d13f73so135874985a.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 10:42:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750959745; x=1751564545; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=05ZVTwjp2fo6k9Dv0vQyStm7ZU9eypfKCcTPKO8i30Y=;
        b=2C5myPDoR76MZjgNY8X2O2YR3bEn8h3JktKySxmS0Zm+5FCt95kd2SIHLXBMwo26s8
         3Ve9EqcigwEfuVDYURnI7cfJpgD/xyo2DWkFGIroCn/7PmZqxh+mQ99Fj2+DxgszNYmq
         PEaFf2qwS9BKzUX19gOUmGQ0qk7LZAouIRZOv0/RiFthDPJLh302svchze+NK4iY4Zya
         snAtDViL1ZzGjhNHX1tef0oTOsRIRSThATG9oQpH3RnH07YPWyprpwDvGhSJ4LkZoj1p
         NDhP2z0XVKaJaVHiNc2u2RY5NiJmhFjBkHd5xgmtxlP+9m0aPE7aIfBQd/We+30q27Vi
         d9xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750959745; x=1751564545;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=05ZVTwjp2fo6k9Dv0vQyStm7ZU9eypfKCcTPKO8i30Y=;
        b=fVvcGz38WYfKNPPf7Wxt7r8kV2SBXONq7pk1WIWorgNXqw2ff8kqlAMOTGf6oQcTR+
         fADex4cIgCFMl8zTAorrnwJgo7eeptq5iPuhLfl+iio3UQ2mrq5IEAGGckJFt8J3KYFm
         m+p0tiNFbPnRWc7QpHLJuEco9EikAB2owqkcodG53elarLqcjisyopO8tc5ZAWWMuubv
         fT/xZgxMpcY6dIjgw85pA2KXMMZfjXKwV+Xoc+20/OR9winC7AGPYdabhX+FuTLeeFAX
         xGhRtIJ3/+3jSBitTKSv3LjudLJHX8cNQk/3D/lsk2cR2Uk1BlgdvkhSTVS9FaXt9eN6
         Kc1A==
X-Forwarded-Encrypted: i=1; AJvYcCURiCWOCiae8WCTpYPNTnjsqFTXT+wIJ4SerDIQ7VwKQ+4QIvRmd5FdM2sy4uJAcU8tV3Wp0dQQX0KWlEk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTtR/4aB7WIK5tRIBOiBqerkyi7+AjcfELvWIwfHlOXOhJaBhr
	gTELbJGH4H3RzsWRJa5XCX3eStlvC2BpmzhFxtQCnJBYkU+SIKvax0irh2RWaWDiSzRnsoWzBUn
	zzqRMXnbzp3aEtxcvP+jXpbi7qiTQ4/5zesBFSj1s
X-Gm-Gg: ASbGncuZ6WERQSAUN0iE5tafyOjza3bkR82G3lSbJhSdCWwVB6Rh+f6cBnrygBnPMLK
	PsrrsARoUreNVNzye+xTGDw17UZM36G0Afw/WDafxk42EQfTJ2nL9iRe1QPc3S3+h1uWXPTi9KD
	AGUVqey5TWP8IATQZJmQU2FlL8nJVC4z0x2mIl56x85jQ=
X-Google-Smtp-Source: AGHT+IF1NfGEed8NQh5VdjyPsJ2rakPvaFB+q4oUAukGWpLx5KVr8qxKiZpdPtuiHU5DjICk9cIhW8Wa+ZAhStUCtME=
X-Received: by 2002:ad4:5aa7:0:b0:6fd:6095:b126 with SMTP id
 6a1803df08f44-700007fec1fmr8069406d6.19.1750959744644; Thu, 26 Jun 2025
 10:42:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250626171730.1765004-1-marievic@google.com>
In-Reply-To: <20250626171730.1765004-1-marievic@google.com>
From: David Gow <davidgow@google.com>
Date: Fri, 27 Jun 2025 01:42:10 +0800
X-Gm-Features: Ac12FXwZJR7Xu9l7sQtAH8b4DB7Z3hvvQN94GPSNpLBWDcOVRskdheS1yMqVpSU
Message-ID: <CABVgOSkEykW6dKPnWXUDC+QaGk0YA2K+ZjhT-Hiti_6y2OY4wA@mail.gmail.com>
Subject: Re: [PATCH] kunit: Make default kunit_test timeout configurable via
 both a module parameter and a Kconfig option
To: Marie Zhussupova <marievic@google.com>
Cc: rmoar@google.com, shuah@kernel.org, geert@linux-m68k.org, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="000000000000a3569e06387d15f5"

--000000000000a3569e06387d15f5
Content-Type: text/plain; charset="UTF-8"

On Fri, 27 Jun 2025 at 01:17, Marie Zhussupova <marievic@google.com> wrote:
>
> To accommodate varying hardware performance and use cases,
> the default kunit test case timeout (currently 300 seconds)
> is now configurable. Users can adjust the timeout by
> either setting the 'timeout' module parameter or the
> KUNIT_DEFAULT_TIMEOUT Kconfig option to their desired
> timeout in seconds.
>
> Signed-off-by: Marie Zhussupova <marievic@google.com>
> ---

Thanks very much. This works well here!

Reviewed-by: David Gow <davidgow@google.com>

Cheers,
-- David

>
>  lib/kunit/Kconfig | 13 +++++++++++++
>  lib/kunit/test.c  | 15 ++++++++-------
>  2 files changed, 21 insertions(+), 7 deletions(-)
>
> diff --git a/lib/kunit/Kconfig b/lib/kunit/Kconfig
> index a97897edd964..c10ede4b1d22 100644
> --- a/lib/kunit/Kconfig
> +++ b/lib/kunit/Kconfig
> @@ -93,4 +93,17 @@ config KUNIT_AUTORUN_ENABLED
>           In most cases this should be left as Y. Only if additional opt-in
>           behavior is needed should this be set to N.
>
> +config KUNIT_DEFAULT_TIMEOUT
> +       int "Default value of the timeout module parameter"
> +       default 300
> +       help
> +         Sets the default timeout, in seconds, for Kunit test cases. This value
> +         is further multiplied by a factor determined by the assigned speed
> +         setting: 1x for `DEFAULT`, 3x for `KUNIT_SPEED_SLOW`, and 12x for
> +         `KUNIT_SPEED_VERY_SLOW`. This allows slower tests on slower machines
> +         sufficient time to complete.
> +
> +         If unsure, the default timeout of 300 seconds is suitable for most
> +         cases.
> +
>  endif # KUNIT
> diff --git a/lib/kunit/test.c b/lib/kunit/test.c
> index 002121675605..f3c6b11f12b8 100644
> --- a/lib/kunit/test.c
> +++ b/lib/kunit/test.c
> @@ -69,6 +69,13 @@ static bool enable_param;
>  module_param_named(enable, enable_param, bool, 0);
>  MODULE_PARM_DESC(enable, "Enable KUnit tests");
>
> +/*
> + * Configure the base timeout.
> + */
> +static unsigned long kunit_base_timeout = CONFIG_KUNIT_DEFAULT_TIMEOUT;
> +module_param_named(timeout, kunit_base_timeout, ulong, 0644);
> +MODULE_PARM_DESC(timeout, "Set the base timeout for Kunit test cases");
> +
>  /*
>   * KUnit statistic mode:
>   * 0 - disabled
> @@ -393,12 +400,6 @@ static int kunit_timeout_mult(enum kunit_speed speed)
>  static unsigned long kunit_test_timeout(struct kunit_suite *suite, struct kunit_case *test_case)
>  {
>         int mult = 1;
> -       /*
> -        * TODO: Make the default (base) timeout configurable, so that users with
> -        * particularly slow or fast machines can successfully run tests, while
> -        * still taking advantage of the relative speed.
> -        */
> -       unsigned long default_timeout = 300;
>
>         /*
>          * The default test timeout is 300 seconds and will be adjusted by mult
> @@ -409,7 +410,7 @@ static unsigned long kunit_test_timeout(struct kunit_suite *suite, struct kunit_
>                 mult = kunit_timeout_mult(suite->attr.speed);
>         if (test_case->attr.speed != KUNIT_SPEED_UNSET)
>                 mult = kunit_timeout_mult(test_case->attr.speed);
> -       return mult * default_timeout * msecs_to_jiffies(MSEC_PER_SEC);
> +       return mult * kunit_base_timeout * msecs_to_jiffies(MSEC_PER_SEC);
>  }
>
>
> --
> 2.50.0.rc2.761.g2dc52ea45b-goog
>

--000000000000a3569e06387d15f5
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
jmkLAgMBAAGjggHgMIIB3DAeBgNVHREEFzAVgRNkYXZpZGdvd0Bnb29nbGUuY29tMA4GA1UdDwEB
/wQEAwIFoDAdBgNVHSUEFjAUBggrBgEFBQcDBAYIKwYBBQUHAwIwHQYDVR0OBBYEFBp5bTxrTm/d
WMmRETO8lNkA4c7fMFgGA1UdIARRME8wCQYHZ4EMAQUBAjBCBgorBgEEAaAyCgMDMDQwMgYIKwYB
BQUHAgEWJmh0dHBzOi8vd3d3Lmdsb2JhbHNpZ24uY29tL3JlcG9zaXRvcnkvMAwGA1UdEwEB/wQC
MAAwgZoGCCsGAQUFBwEBBIGNMIGKMD4GCCsGAQUFBzABhjJodHRwOi8vb2NzcC5nbG9iYWxzaWdu
LmNvbS9jYS9nc2F0bGFzcjZzbWltZWNhMjAyMzBIBggrBgEFBQcwAoY8aHR0cDovL3NlY3VyZS5n
bG9iYWxzaWduLmNvbS9jYWNlcnQvZ3NhdGxhc3I2c21pbWVjYTIwMjMuY3J0MB8GA1UdIwQYMBaA
FDO6vqPUOU0qGdfIZpJogf3BxsnGMEYGA1UdHwQ/MD0wO6A5oDeGNWh0dHA6Ly9jcmwuZ2xvYmFs
c2lnbi5jb20vY2EvZ3NhdGxhc3I2c21pbWVjYTIwMjMuY3JsMA0GCSqGSIb3DQEBCwUAA4ICAQBF
tO3/N2l9hTaij/K0xCpLwIlrqpNo0nMAvvG5LPQQjSeHnTh06tWTgsPCOJ65GX+bqWRDwGTu8WTq
c5ihCNOikBs25j82yeLkfdbeN/tzRGUb2RD+8n9I3CnyMSG49U2s0ZdncsrIVFh47KW2TpHTF7R8
N1dri01wPg8hw4u0+XoczR2TiBrBOISKmAlkAi+P9ivT31gSHdbopoL4x0V2Ow9IOp0chrQQUZtP
KBytLhzUzd9wIsE0QMNDbw6jeG8+a4sd17zpXSbBywIGw7sEvPtnBjMaf5ib3kznlOne6tuDVx4y
QFExTCSrP3OTMUkNbpIdgzg2CHQ2aB8i8YsTZ8Q8Q8ztPJ+xDNsqBUeYxILLjTjxQQovToqipB3f
6IMyk+lWCdDS+iCLYZULV1BTHSdwp1NM3t4jZ8TMlV+JzAyRqz4lzSl8ptkFhKBJ7w2tDrZ3BEXB
8ASUByRxeh+pC1Z5/HhqfiWMVPjaWmlRRJVlRk+ObKIv2CblwxMYlo2Mn8rrbEDyfum1RTMW55Z6
Vumvw5QTHe29TYxSiusovM6OD5y0I+4zaIaYDx/AtF0mMOFXb1MDyynf1CDxhtkgnrBUseHSOU2e
MYs7IqzRap5xsgpJS+t7cp/P8fdlCNvsXss9zZa279tKwaxR0U2IzGxRGsWKGxDysn1HT6pqMDGC
Al0wggJZAgEBMGgwVDELMAkGA1UEBhMCQkUxGTAXBgNVBAoTEEdsb2JhbFNpZ24gbnYtc2ExKjAo
BgNVBAMTIUdsb2JhbFNpZ24gQXRsYXMgUjYgU01JTUUgQ0EgMjAyMwIQAUXA7LnOuRz2DvkWTeMc
0TANBglghkgBZQMEAgEFAKCBxzAvBgkqhkiG9w0BCQQxIgQgPucYav4/t/OFkqickmXt+w5527HG
NyEzmNLGRC4gRNswGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMjUw
NjI2MTc0MjI1WjBcBgkqhkiG9w0BCQ8xTzBNMAsGCWCGSAFlAwQBKjALBglghkgBZQMEARYwCwYJ
YIZIAWUDBAECMAoGCCqGSIb3DQMHMAsGCSqGSIb3DQEBBzALBglghkgBZQMEAgEwDQYJKoZIhvcN
AQEBBQAEggEApN9htLBv+ZyylRi9UTPbpnLG+/cJ8bH7iMhPGEylbE3lasv8+WlXq78KRsEFerMo
oqP+oRsPdPC3rqCoOCfOSl8qjCW9HSla2iOvU+g0+G1+atW1C2t9DDDsMcYtodiBdEzWWX8G6Ng+
8L9CmkiYlLGz4ID6ZDeibSEY/In31utGFavBmHi262QKT8aaJ2L7Z8h/QAfYH/WEmyfQlDtRdF82
Q+mnxiT9xIgz65rs06Q9q+/WlL387jjntj/nbcgnV79iZDW46SYzyHqYOIN+qKf9rNnVopFrEwXU
cDUxOO+lnKkTpBFFNbnEKpJbyK+kOHn5Ytb8oiKJUxn+IftnJw==
--000000000000a3569e06387d15f5--
