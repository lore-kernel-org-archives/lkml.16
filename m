Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 208F42AE77
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 10:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743590037; cv=none; b=LyQiqVEfcDIcXOk4je+K2Vyib3LnDHhmwuPKLw/L1QWOwgft8DgY2rnZDAu4Uc5pCKDSTOrnKldilrcoxT89GDYkzM0UvnDAXnrmJFCyGMOVW0f4hvLCO2oFBDoZPgM4AV/RYq5anMc7yqxgmGRBhOJ5yGuwYvVh/jgDMtEKuYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743590037; c=relaxed/simple;
	bh=+c62+BLJfen9Ttm94HHmisCGwfcbkwogtCorMaUFAt8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nblvU2VmQhFr889JZ6RC5qAbybtAZJyrns5w+gurEucOnZzLI6P30Rd4oATrfdnjP7iIoMM5Wemu8Qv1M80uZHniSxLNG//dYyJf4zaw/YdwaLK+aRpX+vNRIaMIIlbfOMEkBG4BWqcGpI8xyMtkyIXz7gGA6c19ilrRYvnHR2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=R/9dczPs; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="R/9dczPs"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-225477548e1so117118615ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 03:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1743590035; x=1744194835; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+c62+BLJfen9Ttm94HHmisCGwfcbkwogtCorMaUFAt8=;
        b=R/9dczPs0VPEjtoDsdkS6e6M3phTNerhxkJvsGbaxfDOhjIaxFzZEF9gdN+tZw+ccB
         yNXpSZywtXcydAdoojxeAPBlw5gQWJGsfTGRjlrWtYZ/2vgb63vXUcQd6e7bjze8HP1E
         b0mMP+cr9XT3W5BOB5TBXA+6Ez7FsteHhHKH4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743590035; x=1744194835;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+c62+BLJfen9Ttm94HHmisCGwfcbkwogtCorMaUFAt8=;
        b=gEpX+vMcP4lw24BGsB4kWu978Es3dxkK+i6VfctmXvgDIm86nKfqHpa+SqGS8/ONbt
         D/57AQZkc7hxafJy9gQidhFEO7XjBqfTxVuhq/sv97ZZLQ166jZVaRz7oCVvfik6w0kA
         WBirsFNChg2JpWChiPMhutxm2mjVXkcU9IcNzDx3RUXb7Qd5AykaAcSKSjasZXHTTFRe
         beXoQry/BdqnmsVFrrt7IwJuS0bQxhKjH8hlie0bNQ/BPk+0RIZJewNWxlFK38VF0K3t
         JYdyoCRvcHnziLpxsR+rIkXHj2cq5PpUXLv7cAy1taD419jn8ZwF49049vSZDZQblsHL
         i0tQ==
X-Forwarded-Encrypted: i=1; AJvYcCXKabNeO8LiTEnhFLyyS6eQNA0lExp/gxK04FHipFhGjE+j0r8GGbfFwdxLkdjNZeblnzMFOG/pmdj4z/c=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBTe/AA0rtHPgHl1Z9y4s3EAgj78cso2967KJxN5jLQl1qVvFd
	cnhpROCRI3fUDy/HSi/2XjiJNwE27G9o9b57fkd8or6v1rU86fFK0SLE0rNabnQV45RTg5WgAyV
	9cjQJE9rvbqHO1mqDauVzvX56On6IrQHfpYpj
X-Gm-Gg: ASbGncvqkemCpVlipMWB9F1tcpXZRmceQMUX07LiBlX8C1Cc9cSLB2Y6fTlD6jkVQwn
	Wkb48y4EC0BlctIWwaZ+raWUdoHFmneCC5XWF9nrOk86U09zCWni85TbZXYLlz11yan9nTCQWBc
	xI5idrpqAZw1CctHH12r7dgZofZYg=
X-Google-Smtp-Source: AGHT+IG7q0m14b0EbRkjX4UxkEapOIV+YmN2OqqxdMH3EGKIGp7LCJxKLEc79QHRw76ytulgD9SGJIYyI6D6yx9GcME=
X-Received: by 2002:a05:6a00:2181:b0:739:56c2:b661 with SMTP id
 d2e1a72fcca58-7398038250fmr23158926b3a.12.1743590035289; Wed, 02 Apr 2025
 03:33:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <b37b02ec-59fb-4b3b-8e51-ae866eb8ecc9@gmail.com> <20250401223503.GA1686962@bhelgaas>
In-Reply-To: <20250401223503.GA1686962@bhelgaas>
From: Pavan Chebbi <pavan.chebbi@broadcom.com>
Date: Wed, 2 Apr 2025 16:03:42 +0530
X-Gm-Features: AQ5f1JrXgc6t4BzK_3N0025H0cL-avvbz3cN-am3DRSvn75xlaHIDiEapM0nCV8
Message-ID: <CALs4sv3awP3oA3-mvjSUmHCk=KZjF5F75SnnaE79ZUGqDC=orw@mail.gmail.com>
Subject: Re: PCI VPD checksum ambiguity
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Heiner Kallweit <hkallweit1@gmail.com>, Michael Chan <mchan@broadcom.com>, 
	Potnuri Bharat Teja <bharat@chelsio.com>, netdev@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Leon Romanovsky <leon@kernel.org>
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="000000000000b69d210631c9309a"

--000000000000b69d210631c9309a
Content-Type: text/plain; charset="UTF-8"

> > >
> > > Any idea how devices in the field populate their VPD?
> > >

I took a quick look at our manufacturing tool, and it does look like
the computation simply starts at address 0.

> > > Can you share any VPD dumps from devices that include an RV keyword
> > > item?

A couple of devices I could find: hope it helps..
000100: 822f0042 726f6164 636f6d20 4e657458 7472656d 65204769 67616269 74204574
000120: 6865726e 65742043 6f6e7472 6f6c6c65 7200904b 00504e08 42434d39 35373230
000140: 45430931 30363637 392d3135 534e0a30 31323334 35363738 394d4e04 31346534
000160: 52561d1d 00000000 00000000 00000000 000000

000100: 822f0042 726f6164 636f6d20 4e657458 7472656d 65204769 67616269 74204574
000120: 6865726e 65742043 6f6e7472 6f6c6c65 7200904b 00504e08 42434d39 35373139
000140: 45430931 30363637 392d3135 534e0a30 31323334 35363738 394d4e04 31346534
000160: 52561d15 00000000 00000000 00000000 00000000 00000000 00000000 00000000

> >
> > I have only very dated devices which likely date back to before
> > the existence of PCIe r6.0. So their VPD dump may not really help.
> >
> > IIRC there's an ongoing discussion regarding making VPD content
> > user-readable on mlx5 devices. Maybe check with the Mellanox/Nvidia
> > guys how they interpret the spec and implemented VPD checksumming.
>
> Good idea, cc'd.

--000000000000b69d210631c9309a
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
DQYJYIZIAWUDBAIBBQCggccwLwYJKoZIhvcNAQkEMSIEIFy/cFTohhczi5nHnQ/475TGTXrWNW/V
OLG4GPLEjOrfMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTI1MDQw
MjEwMzM1NVowXAYJKoZIhvcNAQkPMU8wTTALBglghkgBZQMEASowCwYJYIZIAWUDBAEWMAsGCWCG
SAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQcwCwYJYIZIAWUDBAIBMA0GCSqGSIb3DQEB
AQUABIIBAJuH6kAEjNVpNAkDjHg3hg11ZJ7nIoTZQgJxcmvnCDq+hH3aC8g5ZmHjwgG5o1CBev6j
gS/hKopzxGipYtM82Q+iQ77jWgcF1En8Y5GMgwxf6uZew5Ih205eiibBZxBHDD3W7l3D11tsMc14
+fQYxeb2Ba1ZFMTdCSTrcx8o+wws/X/thgEVQY4YtNmLwXZMx0Gd/7iZ4um1ett9aiMmgjeqX6ZH
5hVdHz8IcdEkQIqVbbaDbSILyuq/Ugcmf0V7HwkUTwJw/1yxP1sUL39B4YNcDZAXPGXU9G36NP/5
+3PVR/i72HDxhbeU1tvS3zWeP4oMsK3N+gMNC+NhAPcc9pg=
--000000000000b69d210631c9309a--
