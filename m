Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3149B19DF9A
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 00:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744763545; cv=none; b=SeulRBIVWU6DgPTpFxruWkY12j8wNcyfhW6ay4zlinNYKB6nKRcaJJc7/QYDuNn2xPZ3OnLgAjoYtLTPN646KlMxkFZBC3nisutWq3Z8QNH9b0Ao3T/r09ZHfPmYBPFFfmX6IxXHq8gx4Nd7hjwnx3gvatDZMAVmfwNY6ENAKkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744763545; c=relaxed/simple;
	bh=V1espzPBfHlvmiscjgDNIQyvawx2+qHn/zD0GUO37L4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QeKMDaRpeR9G2xmPoYIZj1VBAdCRiWTE9eU5MhLNZUZ2r/8rd3KIkYF6AQF46H2Z3Unp2yUaSe6MFz0NcEDzyWnYwG2pW1nPnB8EhrgxH7KygWMYq/Yj2B52i069Ervb71wX+OMoQ8pLW/SVn0qDcRTwv7WPZqg7KtF+VPPr0VM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=b5FhrEDw; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="b5FhrEDw"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6ecf99dd567so77879196d6.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 17:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744763543; x=1745368343; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=V1espzPBfHlvmiscjgDNIQyvawx2+qHn/zD0GUO37L4=;
        b=b5FhrEDwrlVWYHlHmhXZFaEszvw+VHUnx2CIZeVuFuhjAQz3Gp5x31kOB4AZfgNl84
         1VZ7QvySGS8awPwQNHeSAu9Lw+ImfUfWFqQhKDuszm97vLpgT6CkRfGXRM+K6uux1gKF
         AoKBX32rYCMPVer4izlN0jgfq7jh4ncKQxnX/Ramn7pSBNRi56VhEESMwR+2/m78TDXt
         eJmwA45pZKFruGNBRY7XWCQH4AmxBHFcMMxV/4ytUMFiJFyFSbjaeuxUFxAQjm7Pbyy+
         L7qlow5yMZe0beEDogIey7i3tSJffJv9x1fcKHNoM/R3ZlGcBqGthIWbQ4ThxWMYinzG
         w9Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744763543; x=1745368343;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V1espzPBfHlvmiscjgDNIQyvawx2+qHn/zD0GUO37L4=;
        b=TSd7hiKUnK6xfbERJC+54XONv+Ez71g91XrK64RviA7VETentqqouIhhmoeHNaFUSN
         IN/eFdzmnf4qoPu1h1vyG07eHxiOJiOuR56kR6E1kQEupOcFAbZHuyAcROwv/baH6CYF
         IJhgjRv/vT3jEugR33snY4THCxijQqRUGz5756Iar+6StGhNUpLeGRhPoxqmApEn7FPB
         nf0qen7gOvu7nZGh+84GeIuAHyFRJGSs0eLMUkwA0OlM3lkPrdPyhgkEw5ROU8gVxnjJ
         cNGXgQfbXUGrNkCit+7dxZabDIljaSs1OVLnKQh51YcWfWAEvieTLzlrZmZSYDb2iALI
         lpaw==
X-Forwarded-Encrypted: i=1; AJvYcCVH5S1fNNk2VuM7QRVYsWwohr8TSMmPhyFC/SaoG+qHCSgN97hGLtCCsE2tdC5qI84s8KaapzDa52tDS0s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4IQ7EWIOdDW54uLf6U5CfmbY6koQddBF3xHYzFb/KHn7NnCF1
	DzvMDpGtNDcnuLHhs68lc0YaC6dB02nRs67A5fYuWHsmUmW0dYmKP1thx6m/96xUbpxAubweWzS
	AjgIUrkRC6suuxCMCzjHBps+/TpCPWFlcVRkh
X-Gm-Gg: ASbGncsVFQAKXwH9QXm51H8esmPF+S5WGIs0EtCcOjf3xNv4mUqHPSNP5FTRGbhUfvN
	74oHA66fFDOPn6JmSs0OVOYqbBW+pYzY0G2oqic+yJfhlB6vTsq/iGWk/MbNiureWuxmq8yTjwk
	XQ/VVgiawdt3cOhvrU4QY41WA=
X-Google-Smtp-Source: AGHT+IF6EXexHsq0soosS6qSfZYtPDAzsTxo4DnKE8WRavTT+TAqoCmgtkNmoBzifyZzsDsCp+6Op4xKCYYZiHBc5SM=
X-Received: by 2002:ad4:5965:0:b0:6eb:2fd4:30b0 with SMTP id
 6a1803df08f44-6f2ad8be68cmr26940856d6.13.1744763542832; Tue, 15 Apr 2025
 17:32:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <7c5f9e2a-2e9d-46f2-89b2-83e0d68d3113@linuxfoundation.org>
 <20250414230047.GHZ_2Tnysv9zCD6-tX@fat_crate.local> <995cfca8-c261-4cf0-96f6-b33ca5403ee5@linuxfoundation.org>
 <20250415180128.GJZ_6e-B3yFuwmqWWS@fat_crate.local> <8b08e040-fee7-4344-8ba6-bbbd4f73e318@linuxfoundation.org>
 <20250415221702.GMZ_7a3meDh4e0L11s@fat_crate.local> <88a4052c-ac37-4958-af2a-a3066e8b82bd@linuxfoundation.org>
In-Reply-To: <88a4052c-ac37-4958-af2a-a3066e8b82bd@linuxfoundation.org>
From: David Gow <davidgow@google.com>
Date: Wed, 16 Apr 2025 08:32:08 +0800
X-Gm-Features: ATxdqUHqVaHTXK2iPMhlf76z4fFzBd5OZbFW4VIaAbEi89cVtnsJUZOjA_EFEGA
Message-ID: <CABVgOSmXfoEonJ6w33sj1sb5F2Ak5Kek0AxskSmjq=d=D=PiVw@mail.gmail.com>
Subject: Re: sev_es_trampoline_start undefined symbol referenced errors during
 kunit run
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: Borislav Petkov <bp@alien8.de>, thomas.lendacky@amd.com, 
	"x86@kernel.org" <x86@kernel.org>, Brendan Higgins <brendan.higgins@linux.dev>, linux-kernel@vger.kernel.org, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="0000000000003794b50632da6b3f"

--0000000000003794b50632da6b3f
Content-Type: text/plain; charset="UTF-8"

On Wed, 16 Apr 2025 at 06:30, Shuah Khan <skhan@linuxfoundation.org> wrote:
>
> On 4/15/25 16:17, Borislav Petkov wrote:
> > On Tue, Apr 15, 2025 at 01:06:49PM -0600, Shuah Khan wrote:
> >> Does your arch/x86/realmode/rm/pasyms.h has reference to sev_es_trampoline_start?
> >>
> >> The one in my tree has it.
> >>
> >> arch/x86/realmode/rm/pasyms.h:pa_sev_es_trampoline_start = sev_es_trampoline_start
> >
> >
> > # ./tools/testing/kunit/kunit.py run --arch x86_64
> > ...
> >
> > [00:15:36] Elapsed time: 58.840s total, 2.096s configuring, 53.170s building, 3.487s running
> >
> > # cat arch/x86/realmode/rm/pasyms.h
> > cat: arch/x86/realmode/rm/pasyms.h: No such file or directory
> >
> > Could explain why I don't see the issue...
> >
>
> I see arch/x86/realmode/rm/pasyms.h on my system. It is a generated
> file from arch/x86/realmode/rm Makefile
>

Aha: I've been able to reproduce this, albeit by not cleaning the tree properly.

- make ARCH=x86_64 # Build an x86_64 kernel in-tree, with
CONFIG_AMD_MEM_ENCRYPT=y
- ./tools/testing/kunit/kunit.py run # Attempt to build and run KUnit
on a UML kernel (built out-of-tree in the .kunit directory)
# This will fail, telling you to clean the tree with 'make ARCH=um mrproper'
- make ARCH=um mrproper # Clean the source tree, but incompletely, as
the original kernel was built with ARCH=x86_64, not ARCH=um
# As a result, the pasyms.h file will be left in the tree, as it's not
part of the UML build
- ./tools/testing/kunit/kunit.py run --arch x86_64 # Attempt to
build/run an out-of-tree x86_64 kernel.
# This will not tell you to clean the source tree, as it was
(incorrectly) cleaned for the wrong architecture, but will fail due to
the wrong pasyms.h still being present.

I'm not sure if this is the same cause as what you're seeing, Shuah,
but it seems plausible enough. If so, this is really an issue with the
Makefiles suggesting the wrong make mrproper command (assuming that
the architecture hasn't changed), or failing to detect that the source
tree still isn't clean. Maybe that's something we could work around in
either the arch/um makefiles or in kunit.py (or at least the
documentation), if we don't want to rework how dirty trees are
detected.

Either way, this should work after running `make ARCH=x86_64
mrproper`. Does that work for you?

Cheers,
-- David

--0000000000003794b50632da6b3f
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
pjANBglghkgBZQMEAgEFAKCBxzAvBgkqhkiG9w0BCQQxIgQgw9HgAp0+mtQokm9hKrvn4OuKxLTu
y8LThUSOZrkvgB0wGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMjUw
NDE2MDAzMjIzWjBcBgkqhkiG9w0BCQ8xTzBNMAsGCWCGSAFlAwQBKjALBglghkgBZQMEARYwCwYJ
YIZIAWUDBAECMAoGCCqGSIb3DQMHMAsGCSqGSIb3DQEBBzALBglghkgBZQMEAgEwDQYJKoZIhvcN
AQEBBQAEggEAh4fjmoDp4cGqQhHuk15HWtl/2G84wg24dpSL5VccfXrzJEOBeVuB/6NOM5GCaLtA
KmZvFiBEbBm7AkXQacmIFsyY7qtJ73bX4iKYdpI5vzhAy1N9/nSqipUF8/RDNb9EoIR7mX/OihDz
ha9cD7Dkj1zsbKOMR543L/e0AsDSUnP9GEWzbVIuajynkHmAyJRsXp7vQcsmEtoykVlMArL8oqtM
IkOVMKOYCxDd6r5YRI5x7crb1opw6sBIbIfCpPvLvMWpZ+0BIxN2DY5flchSkIC8qUMTJy5fy5Ud
GFX4s0BstE0IYpjYiBzgBiGOIG88W4WjXTXM1Gjjk8KUnFf+GA==
--0000000000003794b50632da6b3f--
