Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64C8B29AAF7
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 09:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750843806; cv=none; b=lSF6wbiEHXmTDkLTWQyx6q5ywbGUyUFReZuBWDL2ReIJauhgYu+BUMdc+4FeTfZAbuwE8mB5Y4+m3hNQnopWYTLPknQf43iZx5odKcHVitE/SZE0VsJJyb8LQJuSx15zDrXyUq1V3olE1iunB4pHpSSmhkdOOYdNHKrUB6SQfEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750843806; c=relaxed/simple;
	bh=/gyIwejZq5RtXSV4ylcQYg6u7tsUkL75UBpjBDUoInQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=txn8whet619nxZByvYGgaDm5+i2cmi4eAsBSNm/PYZnlLmKoCQESLJq7jjQujqglPCaUy6eVA4cn/Ia91xylqGFTgE2ZIKFkGSAytoVWHvT0QpU3wd02XvdGsyo/eX9tDkdrUxbZ/7yHHgXCzXf5uBVz197Pv+59OXe4Fzx6wrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=I5HgFNg8; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="I5HgFNg8"
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-53169549df9so880761e0c.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 02:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1750843804; x=1751448604; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZgtCdD+dTJ1ZChVWAVtYLIcVpf/4Njhz6dfOU2XhO5U=;
        b=I5HgFNg8dm5pHrkob11KOyVt2GilLEbej/ZGGkamxapdz8mA6xSn1LKdVcJQ7L3/Xi
         kxoXS8tF+zawd4KWHV2geQhxlBOFXAJIuXnizKBiPmfvqyCCTHoCnrFDQXqA85qyvj+r
         CH/vbZNzKuY+e9Z+4W7l+EsyHqbFWTrPSr86c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750843804; x=1751448604;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZgtCdD+dTJ1ZChVWAVtYLIcVpf/4Njhz6dfOU2XhO5U=;
        b=LSWlssupQjoiFLm0/58Z6GWirOa5uzcuAW93ValOx77ItNxkVnevnTBy1gpOiONC7q
         BKS9Znpsz6bL2oFSSudMuVfYnZ3jMB74Zv67rsAcbciHYygLW+Zv9ok4zqB8VKDY847t
         +/b4q4anNM9dRwfQOKq0X/9xFYmAFZ1zNAR/HEIyDancS8kTusbHkoJ+iZ3hE3OgNBjN
         UcO4Nv5RP99dFZVUb8aUqpKryTQ3vcLC8hJQ66KVeJwZN5QG2gAWgC5gPlMOe/sJjoxk
         BYK8AR0hlUl304Hp4w9nhVD3SZF99BZOluV3hQP9T2oeEU7ILXDgFQp0jsi3u8E4j3sh
         4Hwg==
X-Forwarded-Encrypted: i=1; AJvYcCVii0Kj9qDY4baaLO+zoHJNfTusSAmO28QoFU7opVfQF22aFBJPF6b5dfUR3tlDnS6aGaTJMr8rtmU5ck8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZcHcKG8VR1JYqPYrjTsITFPPEXQJXHx35JMHAUHhMx/yC1IHX
	UkmnSeWhX5Btrp3k0K6RL8yL5mJiCMRBVTH1XgufPEkffVTtj7qgWo5UylqK4jRXZy/2yrnWXCf
	x2w87bmSdjJedWagkGyFqcTbYRuViKIA4DJ/FjCrB
X-Gm-Gg: ASbGnctoyCOKrYZ5GIhHE519QSwCBX4BStItNzNDH3XRUxULb44Fguvwo3jryIZuT8X
	1y5IKcDslaf85X0zQKTPukD/iwRpmOQf2aXfnYYBaXfJln0vsTJQ09JKwHuAc9t7+XZazmBEFp8
	USuz/37nmJuQv3D2QR43I6b+pOuMaxmDvZYHTc6MzO36xpUCFsc/E1UKo=
X-Google-Smtp-Source: AGHT+IEHh+8qNXjrE7ZRMJFhl4gbryOZLhoC8UReKGbXzA7o8E/nT/8MoSYE44saX5qyS5H+WspT2U4lS8xCC6EfOvE=
X-Received: by 2002:a05:6122:421b:b0:531:2906:7525 with SMTP id
 71dfb90a1353d-532ef6730fbmr1246458e0c.6.1750843804218; Wed, 25 Jun 2025
 02:30:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250618144743.843815-1-vikas.gupta@broadcom.com>
 <20250618144743.843815-5-vikas.gupta@broadcom.com> <4bf20b00-19bd-48f3-9d0c-3c8bde56ec47@linux.dev>
 <CAHLZf_u2e7Cm8-hkAy-bfcQ6QThwanYAFuRemi-FcNgh+rVprg@mail.gmail.com> <8d7d7d5b-c4f2-4063-81d6-8d17ec729c2c@linux.dev>
In-Reply-To: <8d7d7d5b-c4f2-4063-81d6-8d17ec729c2c@linux.dev>
From: Vikas Gupta <vikas.gupta@broadcom.com>
Date: Wed, 25 Jun 2025 14:59:51 +0530
X-Gm-Features: Ac12FXyud9WQgS17X3rxjQJce-KvSAuYxRXco1K59ein1Y-iP4T3Exs-DYd5kGY
Message-ID: <CAHLZf_svEKdeQPpvXrKGt-uKXQ0Zo-d+E3UvGYzH9h6fXudpVA@mail.gmail.com>
Subject: Re: [net-next, 04/10] bng_en: Add initial interaction with firmware
To: Vadim Fedorenko <vadim.fedorenko@linux.dev>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org, 
	pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	michael.chan@broadcom.com, pavan.chebbi@broadcom.com, 
	vsrama-krishna.nemani@broadcom.com, 
	Bhargava Chenna Marreddy <bhargava.marreddy@broadcom.com>, 
	Rajashekar Hudumula <rajashekar.hudumula@broadcom.com>
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="00000000000006f0ef06386217b1"

--00000000000006f0ef06386217b1
Content-Type: text/plain; charset="UTF-8"

Hi Vadim,

> >>> +     req->year = cpu_to_le16(1900 + tm.tm_year);
> >>> +     req->month = 1 + tm.tm_mon;
> >>> +     req->day = tm.tm_mday;
> >>> +     req->hour = tm.tm_hour;
> >>> +     req->minute = tm.tm_min;
> >>> +     req->second = tm.tm_sec;
> >>> +     return hwrm_req_send(bd, req);
> >>> +}
> >>
> >> This whole function looks like copy-paste from bnxt, did you consider
> >> merging these parts?
> >
> > Both the bnxt and bnge drivers follow the same protocol to send the
> > requests to  the firmware,
> > so some functions may appear similar. However, we do not plan to share
> > the code, as certain
> >   fundamental data structures will differ.
>
> But at the same time some data structures are completely the same. Why
> do you think code duplication will work better on long run?

In the long run, maintaining this driver for future hardware is more practical
for us than integrating code into the BNXT driver.
Nevertheless, we are making a concerted effort to minimize duplication
wherever feasible.
So currently, we share the HSI (bnxt_hsi.h) as the driver to firmware
protocol remains largely unchanged.
While data structures are currently identical, but not all, we
recognize this is due to the fundamental
architectural similarities between the new and previous chip generations.
Newer chip features will definitely change the data structures and
related implementations.

Does this clarify your concern?

Thanks,
Vikas

--00000000000006f0ef06386217b1
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIIQXQYJKoZIhvcNAQcCoIIQTjCCEEoCAQExDzANBglghkgBZQMEAgEFADALBgkqhkiG9w0BBwGg
gg3BMIIFDTCCA/WgAwIBAgIQeEqpED+lv77edQixNJMdADANBgkqhkiG9w0BAQsFADBMMSAwHgYD
VQQLExdHbG9iYWxTaWduIFJvb3QgQ0EgLSBSMzETMBEGA1UEChMKR2xvYmFsU2lnbjETMBEGA1UE
AxMKR2xvYmFsU2lnbjAeFw0yMDA5MTYwMDAwMDBaFw0yODA5MTYwMDAwMDBaMFsxCzAJBgNVBAYT
AkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMTEwLwYDVQQDEyhHbG9iYWxTaWduIEdDQyBS
MyBQZXJzb25hbFNpZ24gMiBDQSAyMDIwMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA
vbCmXCcsbZ/a0fRIQMBxp4gJnnyeneFYpEtNydrZZ+GeKSMdHiDgXD1UnRSIudKo+moQ6YlCOu4t
rVWO/EiXfYnK7zeop26ry1RpKtogB7/O115zultAz64ydQYLe+a1e/czkALg3sgTcOOcFZTXk38e
aqsXsipoX1vsNurqPtnC27TWsA7pk4uKXscFjkeUE8JZu9BDKaswZygxBOPBQBwrA5+20Wxlk6k1
e6EKaaNaNZUy30q3ArEf30ZDpXyfCtiXnupjSK8WU2cK4qsEtj09JS4+mhi0CTCrCnXAzum3tgcH
cHRg0prcSzzEUDQWoFxyuqwiwhHu3sPQNmFOMwIDAQABo4IB2jCCAdYwDgYDVR0PAQH/BAQDAgGG
MGAGA1UdJQRZMFcGCCsGAQUFBwMCBggrBgEFBQcDBAYKKwYBBAGCNxQCAgYKKwYBBAGCNwoDBAYJ
KwYBBAGCNxUGBgorBgEEAYI3CgMMBggrBgEFBQcDBwYIKwYBBQUHAxEwEgYDVR0TAQH/BAgwBgEB
/wIBADAdBgNVHQ4EFgQUljPR5lgXWzR1ioFWZNW+SN6hj88wHwYDVR0jBBgwFoAUj/BLf6guRSSu
TVD6Y5qL3uLdG7wwegYIKwYBBQUHAQEEbjBsMC0GCCsGAQUFBzABhiFodHRwOi8vb2NzcC5nbG9i
YWxzaWduLmNvbS9yb290cjMwOwYIKwYBBQUHMAKGL2h0dHA6Ly9zZWN1cmUuZ2xvYmFsc2lnbi5j
b20vY2FjZXJ0L3Jvb3QtcjMuY3J0MDYGA1UdHwQvMC0wK6ApoCeGJWh0dHA6Ly9jcmwuZ2xvYmFs
c2lnbi5jb20vcm9vdC1yMy5jcmwwWgYDVR0gBFMwUTALBgkrBgEEAaAyASgwQgYKKwYBBAGgMgEo
CjA0MDIGCCsGAQUFBwIBFiZodHRwczovL3d3dy5nbG9iYWxzaWduLmNvbS9yZXBvc2l0b3J5LzAN
BgkqhkiG9w0BAQsFAAOCAQEAdAXk/XCnDeAOd9nNEUvWPxblOQ/5o/q6OIeTYvoEvUUi2qHUOtbf
jBGdTptFsXXe4RgjVF9b6DuizgYfy+cILmvi5hfk3Iq8MAZsgtW+A/otQsJvK2wRatLE61RbzkX8
9/OXEZ1zT7t/q2RiJqzpvV8NChxIj+P7WTtepPm9AIj0Keue+gS2qvzAZAY34ZZeRHgA7g5O4TPJ
/oTd+4rgiU++wLDlcZYd/slFkaT3xg4qWDepEMjT4T1qFOQIL+ijUArYS4owpPg9NISTKa1qqKWJ
jFoyms0d0GwOniIIbBvhI2MJ7BSY9MYtWVT5jJO3tsVHwj4cp92CSFuGwunFMzCCA18wggJHoAMC
AQICCwQAAAAAASFYUwiiMA0GCSqGSIb3DQEBCwUAMEwxIDAeBgNVBAsTF0dsb2JhbFNpZ24gUm9v
dCBDQSAtIFIzMRMwEQYDVQQKEwpHbG9iYWxTaWduMRMwEQYDVQQDEwpHbG9iYWxTaWduMB4XDTA5
MDMxODEwMDAwMFoXDTI5MDMxODEwMDAwMFowTDEgMB4GA1UECxMXR2xvYmFsU2lnbiBSb290IENB
IC0gUjMxEzARBgNVBAoTCkdsb2JhbFNpZ24xEzARBgNVBAMTCkdsb2JhbFNpZ24wggEiMA0GCSqG
SIb3DQEBAQUAA4IBDwAwggEKAoIBAQDMJXaQeQZ4Ihb1wIO2hMoonv0FdhHFrYhy/EYCQ8eyip0E
XyTLLkvhYIJG4VKrDIFHcGzdZNHr9SyjD4I9DCuul9e2FIYQebs7E4B3jAjhSdJqYi8fXvqWaN+J
J5U4nwbXPsnLJlkNc96wyOkmDoMVxu9bi9IEYMpJpij2aTv2y8gokeWdimFXN6x0FNx04Druci8u
nPvQu7/1PQDhBjPogiuuU6Y6FnOM3UEOIDrAtKeh6bJPkC4yYOlXy7kEkmho5TgmYHWyn3f/kRTv
riBJ/K1AFUjRAjFhGV64l++td7dkmnq/X8ET75ti+w1s4FRpFqkD2m7pg5NxdsZphYIXAgMBAAGj
QjBAMA4GA1UdDwEB/wQEAwIBBjAPBgNVHRMBAf8EBTADAQH/MB0GA1UdDgQWBBSP8Et/qC5FJK5N
UPpjmove4t0bvDANBgkqhkiG9w0BAQsFAAOCAQEAS0DbwFCq/sgM7/eWVEVJu5YACUGssxOGhigH
M8pr5nS5ugAtrqQK0/Xx8Q+Kv3NnSoPHRHt44K9ubG8DKY4zOUXDjuS5V2yq/BKW7FPGLeQkbLmU
Y/vcU2hnVj6DuM81IcPJaP7O2sJTqsyQiunwXUaMld16WCgaLx3ezQA3QY/tRG3XUyiXfvNnBB4V
14qWtNPeTCekTBtzc3b0F5nCH3oO4y0IrQocLP88q1UOD5F+NuvDV0m+4S4tfGCLw0FREyOdzvcy
a5QBqJnnLDMfOjsl0oZAzjsshnjJYS8Uuu7bVW/fhO4FCU29KNhyztNiUGUe65KXgzHZs7XKR1g/
XzCCBUkwggQxoAMCAQICDAwWGBCozl6YWmxLnDANBgkqhkiG9w0BAQsFADBbMQswCQYDVQQGEwJC
RTEZMBcGA1UEChMQR2xvYmFsU2lnbiBudi1zYTExMC8GA1UEAxMoR2xvYmFsU2lnbiBHQ0MgUjMg
UGVyc29uYWxTaWduIDIgQ0EgMjAyMDAeFw0yMjA5MTAwODI4NTVaFw0yNTA5MTAwODI4NTVaMIGM
MQswCQYDVQQGEwJJTjESMBAGA1UECBMJS2FybmF0YWthMRIwEAYDVQQHEwlCYW5nYWxvcmUxFjAU
BgNVBAoTDUJyb2FkY29tIEluYy4xFDASBgNVBAMTC1Zpa2FzIEd1cHRhMScwJQYJKoZIhvcNAQkB
Fhh2aWthcy5ndXB0YUBicm9hZGNvbS5jb20wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIB
AQCxitxy5SHFDazxTJLvP/im3PzbzyTnOcoE1o5prXLiE6zHn0Deda3D6EovNC0fvonRJQ8niP6v
q6vTwQoZ/W8o/qhmX04G/SwcTxTc1mVpX5qk80uqpEAronNBpmRf7zv7OtF4/wPQLarSG+qPyT19
TDQl4+3HHDyHte/Lk0xie1aVYZ8AunPjUEQi0tURx/GpcBtv39TQKwK77QY2k5PkY0EBtt6s1EVq
1Z53HzleM75CAMHDl8NYGve9BgWmJRrMksHjn8TcXwOoXQ4QkkBXnMc3Gl+XSbAXXNw1oU96EW5r
k0vJWVnbznBdI0eiFVP+mokagWcF65WhrJr1gzlBAgMBAAGjggHZMIIB1TAOBgNVHQ8BAf8EBAMC
BaAwgaMGCCsGAQUFBwEBBIGWMIGTME4GCCsGAQUFBzAChkJodHRwOi8vc2VjdXJlLmdsb2JhbHNp
Z24uY29tL2NhY2VydC9nc2djY3IzcGVyc29uYWxzaWduMmNhMjAyMC5jcnQwQQYIKwYBBQUHMAGG
NWh0dHA6Ly9vY3NwLmdsb2JhbHNpZ24uY29tL2dzZ2NjcjNwZXJzb25hbHNpZ24yY2EyMDIwME0G
A1UdIARGMEQwQgYKKwYBBAGgMgEoCjA0MDIGCCsGAQUFBwIBFiZodHRwczovL3d3dy5nbG9iYWxz
aWduLmNvbS9yZXBvc2l0b3J5LzAJBgNVHRMEAjAAMEkGA1UdHwRCMEAwPqA8oDqGOGh0dHA6Ly9j
cmwuZ2xvYmFsc2lnbi5jb20vZ3NnY2NyM3BlcnNvbmFsc2lnbjJjYTIwMjAuY3JsMCMGA1UdEQQc
MBqBGHZpa2FzLmd1cHRhQGJyb2FkY29tLmNvbTATBgNVHSUEDDAKBggrBgEFBQcDBDAfBgNVHSME
GDAWgBSWM9HmWBdbNHWKgVZk1b5I3qGPzzAdBgNVHQ4EFgQUQUO4R8Bg/yLjD8B1Jr9JLitNMlIw
DQYJKoZIhvcNAQELBQADggEBACj8NkM/SQOdFy4b+Kn9Q/IE8KHCkf/qubyurG45FhIIv8eUflaW
ZkYiC3z+qo7iXxFvNJ4irfvMtG+idVVrOEFa56FKvixdXk2mlzsojV7lNPlVtn8X2mry47rVMq0G
AQPU6HuihzH/SrKdypyxv+4QqSGpLs587FN3ydGrrw8J96rBt0qqzFMt65etOx73KyU/LylBqQ+6
oCSF3t69LpmLmIwRkXxtqIrB7m9OjROeMnXWS9+b5krW8rnUbgqiJVvWldgtno3kiKdEwnOwVjY+
gZdPq7+WE2Otw7O0i1ReJKwnmWksFwr/sT4LYfFlJwA0LlYRHmhR+lhz9jj0iXkxggJgMIICXAIB
ATBrMFsxCzAJBgNVBAYTAkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMTEwLwYDVQQDEyhH
bG9iYWxTaWduIEdDQyBSMyBQZXJzb25hbFNpZ24gMiBDQSAyMDIwAgwMFhgQqM5emFpsS5wwDQYJ
YIZIAWUDBAIBBQCggccwLwYJKoZIhvcNAQkEMSIEIBx6/N0X+TYx1OoFaV7I3CJjB/C48c75sBU3
8s1kfNdyMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTI1MDYyNTA5
MzAwNFowXAYJKoZIhvcNAQkPMU8wTTALBglghkgBZQMEASowCwYJYIZIAWUDBAEWMAsGCWCGSAFl
AwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQcwCwYJYIZIAWUDBAIBMA0GCSqGSIb3DQEBAQUA
BIIBAHAAbhk3bWjqcHyFUYShkU0pXoiOB7W4A5XPgdITozXD70XWJqpgywcziSf5/t+mrZgzBNHj
7qJ10aZ+K6j2G1EODCzH+dXevz8zsafTBeIYafKHJlc3E1BUxjQonEqBowebW2/IY+BzfHijWI1W
K/WSuePzPmS5gNqPv8W4/bG4/uKtIvDfy5osADIsUwulHaPHQbJKUrJ4LQQk8XS2THpZCACBR2Jp
VCpz558nI9pnrNxU5LEjKnLrSrc+RpQXQDCDFzN44ywwI9prqS/NFQ1pG0BwA5O5x1xJKkwJHpz8
JP1fhqiMQ1tkXsmRyBayTd1Xo0TOcrBKKrqCVW+fbYo=
--00000000000006f0ef06386217b1--
