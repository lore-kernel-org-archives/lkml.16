Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B220261594
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 13:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750858968; cv=none; b=EMkBC48UgUB/yMgnw9tlz3sOByyemh3e1iGZUczdgeEtPsmtMo9IjGghNU36O5QmRx/p5VglQvMIPRKonRIR2JHkPzO9MNm6zaTtlrAPck5TX7tVCCHDLV37qW0KnNApkF2fnYI06e7Hh8tvfQ6uuXGBDH+C6PRuG/6JP1EFmx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750858968; c=relaxed/simple;
	bh=SHOKEj77FBcdtCL+TtbCkAED/bJm3dK9kXKWg6Qrrag=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jrePtwYd3JuvHpWicuGpC+0JCneZfEJfbK2O4JJlzvL5K+nOsjJDeawUzTyzJ3F5oj8TpKwHNR3UmveeSGdk1nkoY9qrWaudVxG2ZHsKs3QRomfp1R3TZfTOgY9PB+RPU8FHaC+LVtdQuSCVUT1pZqRGRgP3tL1pOISbRUTSDAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=B+8Ecziy; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="B+8Ecziy"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-748fe69a7baso1324305b3a.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 06:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1750858966; x=1751463766; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SHOKEj77FBcdtCL+TtbCkAED/bJm3dK9kXKWg6Qrrag=;
        b=B+8EcziyZ7c79eJQbdlPdW3Ey4F/HQTwzgoykb2WIEac2zWoPk8YIz3lZk0kZ4tlKj
         HE0xKQHyHFiPtfQemAilB4EyGgxDqxrEre/ii29qFT9sXtn7OHZR1/0tRWENhQHFQh4H
         R4iWCwOHPWDrXYjvfCNl/SlhTlcKqEHmyYx6M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750858966; x=1751463766;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SHOKEj77FBcdtCL+TtbCkAED/bJm3dK9kXKWg6Qrrag=;
        b=CyVsrSZYS+2sWyMv1FgfG5PgOBMPBYiFrra8nPQUCBvmeccFUO/yUTqPXYvXPUMHNz
         8ayZA96fNxDCEwfuCF2uQt4ROtxmNhI6w83HMwDXS+li5cAjwoferGbgKstOBG7+LvVO
         M2wQMVBUWvEajW75UQU/BQm5W+l5BaUdcOOm/0DRMzJawj9JHEGdAS7FWHHnHF+0AVBs
         DtL+HQd1bReovNinAM2uoOL1k9Ubfl/leD3LBi/HRmGXrinAoyayoLm1niokYgZrRVua
         +6mpKuj9tMvYuPdpxNJe+lu23110dldV23i/Yt4+GTB/aWLki4mA+OGDaIYjHG24ypbO
         976g==
X-Forwarded-Encrypted: i=1; AJvYcCUV26UJxApF+9V+sLMHQ8Y8RTvZ9ORXvipTUtKqqZBv1wfM9OgO34714PPFtCTEDBs61e0ajwbTcgwy7NU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwrTcuZHNl4YSR6DZnaAHSJHXuU5WZTQDVM1RvmLaAmtSOkZ5J1
	wed0E36lVomCGWZsN+ke1QcPiMuBzgvya5N4r3ESjwqHTEoc4Ag+ZWEN4T1OLz6nykK6t20M47o
	HVSkVfYrVbFO+jlyyISmKu4w07Ad0mCzmxuci66+npTNRblqcQpJUEw==
X-Gm-Gg: ASbGncvUXP6lG8D9anBcYzVS2+L9M2f/8DqatDCYxZm7sY9NoYAykdaCcQ8A2kCMp8S
	/lUgqJ3KeyU1dea/tkvT3GSWxqEVpywJ6+r4tqE8DJqioj/ovs4ecWT+4d5EOsfuhObT1fv6ITl
	rmTISVbM3Aqb8YHuCbq+Asu5Zba3DpTYmXhQoSlv4d+1VKCw==
X-Google-Smtp-Source: AGHT+IHcAwi4BgC9md/lcUAjjjxc65SyGczt9+iQF5wN2WMetxO5LQYDmtfl86dXxc1BLEy34edmsbDL+1OjRnaGJhQ=
X-Received: by 2002:a05:6a00:88d:b0:748:e150:ac77 with SMTP id
 d2e1a72fcca58-74ad45c1b7cmr4418391b3a.22.1750858965594; Wed, 25 Jun 2025
 06:42:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250625053005.79845-1-deli.zhang21th@gmail.com>
In-Reply-To: <20250625053005.79845-1-deli.zhang21th@gmail.com>
From: Pavan Chebbi <pavan.chebbi@broadcom.com>
Date: Wed, 25 Jun 2025 19:12:34 +0530
X-Gm-Features: Ac12FXzFz8lpZofQH6j4N7M3YVNxk9VZJ6Kj9WYGgts0S-6HqmPKI6NGZJ1D7jw
Message-ID: <CALs4sv3BmZLTvodCJL-W0MQSAwMgkqfPbxgNt2oDgkgsR+DVbA@mail.gmail.com>
Subject: Re: [PATCH] bnxt_en: Add parameter disable_vf_bind
To: Deli Zhang <deli.zhang21th@gmail.com>
Cc: michael.chan@broadcom.com, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="000000000000b859a10638659e82"

--000000000000b859a10638659e82
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 25, 2025 at 11:01=E2=80=AFAM Deli Zhang <deli.zhang21th@gmail.c=
om> wrote:
>
> In virtualization, VF is usually not bound by native drivers, instead
> should be passthrough to VM. Most PF and VF drivers provide separate
> names, e.g. "igb" and "igbvf", so that the hypervisor can control
> whether to use VF devices locally. The "bnxt_en" driver is a special
> case, it can drive both PF and VF devices, so here add a parameter
> "disable_vf_bind" to allow users to control.

You can always unbind the driver using the sysfs interface, right?
Besides, module params are not acceptable.

--000000000000b859a10638659e82
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
OltyqaGBuzv+bJTUL+bmV7E4QBLIqGt4jVr1R9hJdH6KxXwJdyfHZ9C6qXmoe2NQhiFUyBOJ0wgk
dB9Z1IU7nCwvNKYg2JMoJs93tIgbhPJg/D7pqW8gabkCAwEAAaOCAdowggHWMA4GA1UdDwEB/wQE
AwIFoDCBowYIKwYBBQUHAQEEgZYwgZMwTgYIKwYBBQUHMAKGQmh0dHA6Ly9zZWN1cmUuZ2xvYmFs
c2lnbi5jb20vY2FjZXJ0L2dzZ2NjcjNwZXJzb25hbHNpZ24yY2EyMDIwLmNydDBBBggrBgEFBQcw
AYY1aHR0cDovL29jc3AuZ2xvYmFsc2lnbi5jb20vZ3NnY2NyM3BlcnNvbmFsc2lnbjJjYTIwMjAw
TQYDVR0gBEYwRDBCBgorBgEEAaAyASgKMDQwMgYIKwYBBQUHAgEWJmh0dHBzOi8vd3d3Lmdsb2Jh
bHNpZ24uY29tL3JlcG9zaXRvcnkvMAkGA1UdEwQCMAAwSQYDVR0fBEIwQDA+oDygOoY4aHR0cDov
L2NybC5nbG9iYWxzaWduLmNvbS9nc2djY3IzcGVyc29uYWxzaWduMmNhMjAyMC5jcmwwJAYDVR0R
BB0wG4EZcGF2YW4uY2hlYmJpQGJyb2FkY29tLmNvbTATBgNVHSUEDDAKBggrBgEFBQcDBDAfBgNV
HSMEGDAWgBSWM9HmWBdbNHWKgVZk1b5I3qGPzzAdBgNVHQ4EFgQUEV6y/89alKPoFbKUaJXsvWu5
fdowDQYJKoZIhvcNAQELBQADggEBAEHSIB6g652wVb+r2YCmfHW47Jo+5TuCBD99Hla8PYhaWGkd
9HIyD3NPhb6Vb6vtMWJW4MFGQF42xYRrAS4LZj072DuMotr79rI09pbOiWg0FlRRFt6R9vgUgebu
pWSH7kmwVXcPtY94XSMMak4b7RSKig2mKbHDpD4bC7eGlwl5RxzYkgrHtMNRmHmQor5Nvqe52cFJ
25Azqtwvjt5nbrEd81iBmboNTEnLaKuxbbCtLaMEP8xKeDjAKnNOqHUMps0AsQT8c0EGq39YHpjp
Wn1l67VU0rMShbEFsiUf9WYgE677oinpdm0t2mdCjxr35tryxptoTZXKHDxr/Yy6l6ExggJgMIIC
XAIBATBrMFsxCzAJBgNVBAYTAkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMTEwLwYDVQQD
EyhHbG9iYWxTaWduIEdDQyBSMyBQZXJzb25hbFNpZ24gMiBDQSAyMDIwAgwV/XkICjVscn4SNZMw
DQYJYIZIAWUDBAIBBQCggccwLwYJKoZIhvcNAQkEMSIEIK+2Be4XCER/Wl8sdomJaur4F5DhX9zD
5Jq2D3+WBqRiMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTI1MDYy
NTEzNDI0NlowXAYJKoZIhvcNAQkPMU8wTTALBglghkgBZQMEASowCwYJYIZIAWUDBAEWMAsGCWCG
SAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQcwCwYJYIZIAWUDBAIBMA0GCSqGSIb3DQEB
AQUABIIBAGX7DGn76b/y3J51rqFpoSQYCPd4/UJ/eZGiLVmZl2cuXINHH7wutB9mwwEztH9M2TI5
dlLwouuQB2T1rsDvDWcCOE41BAzYB3XbZYbRh0sL+ifBT1wpHQHeV/+94zGjbO10uidLphdSiZ7C
DwcttpcA6zIU7zatsPciXB8vr+nm+sc7K3bvsHY2DcAe855JdP08++tW53rvKRq5q6oBHt0DdzYU
h/WxCRV/RbAPGO3WBlVWlfKi5jtG33usEP6eb6kVhvEts1ecSLEwqTO8yqDH2fqhVk9mErm/mIuP
gKRreLXgDPyAMbOL82zuXx6QNTNCpsfCg6xyRctvHJI3LPM=
--000000000000b859a10638659e82--
