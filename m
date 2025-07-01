Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66DD41FBEB9
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 07:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751355158; cv=none; b=dL9YIB602NbQsQ6CPJ6zfsuUIZyVI8yXX8CvHHB9DtW89mcWrereESHM0oskvxZpGetP4ytQtBt3voT5ZD3ABl8JlZSXtAJajDfi0dWYYd2oUIFEUTvcM8Fj58BeLcHwcQ7ZSPbfDS6lTagU2APR25iRu/07QqRaZv6UpB9Ipgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751355158; c=relaxed/simple;
	bh=N0Kst1XS/MEmCZqJw4LD4S85UCsgEIlLvJGGStfDB7I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KI9ewJbepOlGNHYuHNgDOPwbjZyawadPxYP4x+S7hpIIzSf/7FEAp1BlmVjGbLO2Fv0J6JRqCUXncPl5is05fE51Q5f6Mi79TGaoKQd9vIXAYTaNhVlbfsWKu2uieE7caHDiWnM0d213W1t0LAj9j70jhjg/8EgmrQDHWYsHPSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=d2XCU5Ka; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="d2XCU5Ka"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ad574992fcaso496368166b.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 00:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751355153; x=1751959953; darn=vger.kernel.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=N0Kst1XS/MEmCZqJw4LD4S85UCsgEIlLvJGGStfDB7I=;
        b=d2XCU5KaEGvKyVGvjkJpQTrSk2zp3Ew8XA49cysV1+Bqkhcw/vmpW9y58b8HlyixR3
         Gq7h3LV7I5SDR4HuvvHLmfBD5yU9eNdwd3DpH/kp9oueoxZ12XGXDnx3N8HpPLz1byL+
         dr6hgRBuWQ0n1sJss0XlEBxT24yNyS3sw3aHs4t9WwimKQK359tTWlaJMYdVyuPhWiag
         +EPnGvO4pzoQ2jHwJiGRSwFDLhKS7dJX1IrroGXlKYvShYqseAWx6RDmTqMJpXaZpc4R
         O+EXIrmnUs7QKYX/IbzgonGRJ7wDjsebcbfm0wuwJdGBoaDeIOLMXXLNbnu2sugcI6er
         zlHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751355153; x=1751959953;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N0Kst1XS/MEmCZqJw4LD4S85UCsgEIlLvJGGStfDB7I=;
        b=bXhrSNIC0nz7WxAO8lj+tn2qmTaocnxVEws37nDzO/o9wMowllrmR6qCOyV6LjVOdi
         bBn0je/lwkPTM0UnYitHBt0jr8XGA+emZpDtlUkH6PeepE9bmAr2LoXsOOUI+wIJ10+e
         qMK9Q9EAO60ft2YT6OLrC7ywf/zq+a5pimeQGDTPrAgetcfKng1zEoxkqUFJJTwO5QYR
         9nJt8DjKzHqsg5eUYPDq8NYo5tngd20mBoE8JjVIy6FKA/qQ22GqsHMWgTMKctnKQL4F
         h4iXjW3+JUyr6qknStqubr/GdidgQhzd60F5W7vwl4sUyhgEUYMfK2N7dZ8+fCmzxI8t
         YRBA==
X-Gm-Message-State: AOJu0Yx1DqmQ8RHP+fpNAs+ukcQb0DPKE2JBEM/Bm81SG7pd80FKe9qr
	Mva/DL1CMpJTsHZsNYvI/92kEWiOGY47AY+a1Kdp3ax8JBw1AmLXa4sBoROmRqtBgGEMvjig0OO
	F3f9O
X-Gm-Gg: ASbGncuBZC0QYmR0KsYY/pkbDFiR+LvUM7VH4FQbAnTgzHX0T6JsjwXRlORDwKXFQEm
	sCJvBEwAR5hPYI5XtNMgTQCBYvsSp4ZHfggfO1krezkd5c/OjlFDKseDk5ip9ofbdd8gvV8cFJ3
	jn5XSnTqxxAYKlJ8iAgxj9gccC5ol4LE0L2fKcimAfbwMy5i8m9Azms+ibaF57XVgMMuBZ4ZYpA
	SmXaNlx2X0Y9uI/HvaQz4Z/prk6VLKNgLkB5ljqzj98F54F34IcsgjLaeaLo8TDXESu7njX43sr
	yUiCupBUMO3bEXL8bgmVQYN6Ke57aL0uGw4KE51Xt0SrvhC4Jh4kS6K/UyM33XB+gxIvHL0NQdY
	3ac2+d/HVDN1+2KaNDDcDIBNULEVgnSkMAhQ34zO4DaWwPNvTqooOU3ukDTAYTu6HhUwuF4VShH
	N0HXS+yj/hIiI3Vn/6ONRRug==
X-Google-Smtp-Source: AGHT+IFNUd0vUYdi7qCXmJR54B9dhjstbdm4BCnVi0cwQ+T03+HKw1mKHov62q14MjF0+dhvlp9ATQ==
X-Received: by 2002:a17:907:9603:b0:ae0:cf36:ea81 with SMTP id a640c23a62f3a-ae34fd1837fmr1483173866b.5.1751355153366;
        Tue, 01 Jul 2025 00:32:33 -0700 (PDT)
Received: from ?IPV6:2003:e5:8707:da00:d162:f2ed:68fb:e69b? (p200300e58707da00d162f2ed68fbe69b.dip0.t-ipconnect.de. [2003:e5:8707:da00:d162:f2ed:68fb:e69b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae353c6bbfdsm816468066b.115.2025.07.01.00.32.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 00:32:32 -0700 (PDT)
Message-ID: <98d87171-741a-4f50-a632-e84dd24c6933@suse.com>
Date: Tue, 1 Jul 2025 09:32:31 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen-pciback: Replace scnprintf() with sysfs_emit_at()
To: Ryan Chung <seokwoo.chung130@gmail.com>, sstabellini@kernel.org,
 oleksandr_tyshchenko@epam.com
Cc: linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev
References: <20250624070443.11740-1-seokwoo.chung130@gmail.com>
Content-Language: en-US
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Autocrypt: addr=jgross@suse.com; keydata=
 xsBNBFOMcBYBCACgGjqjoGvbEouQZw/ToiBg9W98AlM2QHV+iNHsEs7kxWhKMjrioyspZKOB
 ycWxw3ie3j9uvg9EOB3aN4xiTv4qbnGiTr3oJhkB1gsb6ToJQZ8uxGq2kaV2KL9650I1SJve
 dYm8Of8Zd621lSmoKOwlNClALZNew72NjJLEzTalU1OdT7/i1TXkH09XSSI8mEQ/ouNcMvIJ
 NwQpd369y9bfIhWUiVXEK7MlRgUG6MvIj6Y3Am/BBLUVbDa4+gmzDC9ezlZkTZG2t14zWPvx
 XP3FAp2pkW0xqG7/377qptDmrk42GlSKN4z76ELnLxussxc7I2hx18NUcbP8+uty4bMxABEB
 AAHNH0p1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT7CwHkEEwECACMFAlOMcK8CGwMH
 CwkIBwMCAQYVCAIJCgsEFgIDAQIeAQIXgAAKCRCw3p3WKL8TL8eZB/9G0juS/kDY9LhEXseh
 mE9U+iA1VsLhgDqVbsOtZ/S14LRFHczNd/Lqkn7souCSoyWsBs3/wO+OjPvxf7m+Ef+sMtr0
 G5lCWEWa9wa0IXx5HRPW/ScL+e4AVUbL7rurYMfwCzco+7TfjhMEOkC+va5gzi1KrErgNRHH
 kg3PhlnRY0Udyqx++UYkAsN4TQuEhNN32MvN0Np3WlBJOgKcuXpIElmMM5f1BBzJSKBkW0Jc
 Wy3h2Wy912vHKpPV/Xv7ZwVJ27v7KcuZcErtptDevAljxJtE7aJG6WiBzm+v9EswyWxwMCIO
 RoVBYuiocc51872tRGywc03xaQydB+9R7BHPzsBNBFOMcBYBCADLMfoA44MwGOB9YT1V4KCy
 vAfd7E0BTfaAurbG+Olacciz3yd09QOmejFZC6AnoykydyvTFLAWYcSCdISMr88COmmCbJzn
 sHAogjexXiif6ANUUlHpjxlHCCcELmZUzomNDnEOTxZFeWMTFF9Rf2k2F0Tl4E5kmsNGgtSa
 aMO0rNZoOEiD/7UfPP3dfh8JCQ1VtUUsQtT1sxos8Eb/HmriJhnaTZ7Hp3jtgTVkV0ybpgFg
 w6WMaRkrBh17mV0z2ajjmabB7SJxcouSkR0hcpNl4oM74d2/VqoW4BxxxOD1FcNCObCELfIS
 auZx+XT6s+CE7Qi/c44ibBMR7hyjdzWbABEBAAHCwF8EGAECAAkFAlOMcBYCGwwACgkQsN6d
 1ii/Ey9D+Af/WFr3q+bg/8v5tCknCtn92d5lyYTBNt7xgWzDZX8G6/pngzKyWfedArllp0Pn
 fgIXtMNV+3t8Li1Tg843EXkP7+2+CQ98MB8XvvPLYAfW8nNDV85TyVgWlldNcgdv7nn1Sq8g
 HwB2BHdIAkYce3hEoDQXt/mKlgEGsLpzJcnLKimtPXQQy9TxUaLBe9PInPd+Ohix0XOlY+Uk
 QFEx50Ki3rSDl2Zt2tnkNYKUCvTJq7jvOlaPd6d/W0tZqpyy7KVay+K4aMobDsodB3dvEAs6
 ScCnh03dDAFgIq5nsB11j3KPKdVoPlfucX2c7kGNH+LUMbzqV6beIENfNexkOfxHfw==
In-Reply-To: <20250624070443.11740-1-seokwoo.chung130@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------aBnBKtQMG5ZX4YB1kPY44TBi"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------aBnBKtQMG5ZX4YB1kPY44TBi
Content-Type: multipart/mixed; boundary="------------qHHfx0LV2wtmw3env6kkiq1J";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Ryan Chung <seokwoo.chung130@gmail.com>, sstabellini@kernel.org,
 oleksandr_tyshchenko@epam.com
Cc: linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev
Message-ID: <98d87171-741a-4f50-a632-e84dd24c6933@suse.com>
Subject: Re: [PATCH v2] xen-pciback: Replace scnprintf() with sysfs_emit_at()
References: <20250624070443.11740-1-seokwoo.chung130@gmail.com>
In-Reply-To: <20250624070443.11740-1-seokwoo.chung130@gmail.com>

--------------qHHfx0LV2wtmw3env6kkiq1J
Content-Type: multipart/mixed; boundary="------------UbAHbubtLvxZgUlR6F024iD1"

--------------UbAHbubtLvxZgUlR6F024iD1
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjQuMDYuMjUgMDk6MDQsIFJ5YW4gQ2h1bmcgd3JvdGU6DQo+IFRoaXMgY2hhbmdlIHVz
ZXMgc3lzZnNfZW1pdCgpIEFQSSB1c2FnZSBmb3Igc3lzZnMgJ3Nob3cnDQo+IGZ1bmN0aW9u
cyBhcyByZWNvbW1lbmRlZCBmcm9tIERvY3VtZW50YXRpb24vZmlsZXN5c3RlbXMvc3lzZnMu
cnN0Lg0KPiANCj4gTm8gZnVuY3Rpb25hbCBjaGFuZ2UgaW50ZW5kZWQuDQo+IFNpZ25lZC1v
ZmYtYnk6IFJ5YW4gQ2h1bmcgPHNlb2t3b28uY2h1bmcxMzBAZ21haWwuY29tPg0KDQpSZXZp
ZXdlZC1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPg0KDQoNCkp1ZXJnZW4N
Cg==
--------------UbAHbubtLvxZgUlR6F024iD1
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------UbAHbubtLvxZgUlR6F024iD1--

--------------qHHfx0LV2wtmw3env6kkiq1J--

--------------aBnBKtQMG5ZX4YB1kPY44TBi
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmhjjxAFAwAAAAAACgkQsN6d1ii/Ey9b
wAf/SiD6TObfuxdtrU/69pbGFWLGFsVp3TTt2cJf/0x3x8GmQtSBUhmtQIN4CYPLpOhJUHRlgW/W
eyB/yqWMTUJ2vT3TFjg8k+Hvx2i2kWRhovnhWJxqvET7aFR9utY5NUmSiHg9WYTLjt+roRI8lB1V
kKKRo+JRHU0iWmC62+dNEpOZCE/rOI6jHwAxF0h+T9O0v1OUMbRESUuPhY8HFhXECw09DC9iI9sZ
FTabK+YIKMY/bonlEI9MiL4U715S/k4LPkwOCNxQQYAhoLxfee1Yg+9NVyQXHXre4c2LuUEIcNro
KZR7ua83GDDLvsdqbKC1HZDum8yCT5d+/SIfRWsG2g==
=7y7K
-----END PGP SIGNATURE-----

--------------aBnBKtQMG5ZX4YB1kPY44TBi--
