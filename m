Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 833F1224AF7
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 12:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750334507; cv=none; b=TKmh+cZxhU3AiBvC09pGF7oC3/yvwBVXHrd9/IdVoGP4dxxeR8RT6IqvPl/occWRhKy1oXKCFqYLJ7Ik3su8XAahizQdC+T4q/w3bfwOXyqPSdHmf8LNois1EPo3Rdeb6/QPuhZ8bdgOb8Xyo6mRixvOUkmHTTUyf4m3PafF6+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750334507; c=relaxed/simple;
	bh=mQWBFKCcIjI+2GHAUqIjc/JzGfVN0510KNIBphtLO/o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lsAkSei0nhY/NWrY5RqLupEqslXkFd8qi5kIgcgIAG1r/XUm/HBW85rULRanPvNeRNYFoZ8YrihPmcvlkUyGTs6PF7oky/AiGL/CSu3copqu5O3ST4pf2ttxW6RLzB4Mkj6ZX88d9IQHjJV5HraBQ5SBgxX2XQDU2pBYy8H03O4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=aHslSebo; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="aHslSebo"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6077d0b9bbeso1177706a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 05:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750334503; x=1750939303; darn=vger.kernel.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mQWBFKCcIjI+2GHAUqIjc/JzGfVN0510KNIBphtLO/o=;
        b=aHslSebo9o8QL0f/5XdiYlfzibvcYV8LrQyLfVEvixKwMTI/vsi6yMs0DZrhz/GHDY
         T+YiNtd3Ijj8zBGCXSGShefj6Svdfucu3f3cvdHWARHnFZ7ER5gYCKIK1lbVigDX6gyI
         mUITXiF0+CXeAp/iqMqcJPJj2jw4ybZ4f/U08JjsWYGPTNC6wfeuKZfGYeuFAP1rjsb0
         OzM9ZUlrvB15S5yRos2bT+5CTF0la3w5s/3EN0FZcyO8j4HLwsqn0BQqe9/V7QQikpKV
         st82S4Wyd05KGNZgQ9tZY69yMxHtBiA1suS6a679Uuup+nDz80BT9CPnUgwrAC2Qfy2E
         boKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750334503; x=1750939303;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mQWBFKCcIjI+2GHAUqIjc/JzGfVN0510KNIBphtLO/o=;
        b=baKiHVdKb3+IqmwEpNc5KEIzzmz+d7cm5Nn6S9EBtwomq621N2KLP3HAfQyTkf51Sg
         nJgDzCAejtgfxY5q8yXVJWy7/o7J0WD9do95Ky9232CT3sXWLQ5G5ogcF7f49cI4hNPC
         tmpVdFDPcGyykm6TV0cFzU6Eci39Vv/CYBS46B7TSPUuXNpjwMP4j8zC58BG5xRg+O7y
         z1zCbQbSZ1nvnQUkpDg22ov5l/dIiLMpDz0KzAQQzzAhkL990L6cuk8IW3Ls1iV4jn70
         chNGSDUvtQNJ7L39Hahyf7s4npPja6ycQIeMEvsoGmBFfD+g/ssBgx+0MXAHvicAXn7Q
         hyVQ==
X-Forwarded-Encrypted: i=1; AJvYcCWYr/BYwX94nCMiEz189nXyXzcBV6G6OA1wUz73wIDwMi4uILuII15KJAKjvjHMZ1/6bFEjgwfyrZpyWZA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxkHPH4EDrO9v11vkNlSBMN0095hY4YG6CAWr1qYLonT04gYg5H
	eO+ay9H86fIZuAimcm/mYNUGLPuDlkTg+g/izC1xqRGsCD1HC45Kd9Af5IFV+C7qAcQ=
X-Gm-Gg: ASbGnctKmeHdvSLpnjto8oe8vJ8Z92JNJhXSkcvA1Cptef+UxrzJHkmCiNCLBw5ScOV
	c7U1FOPpGO+LH9VSMcrqJbVGIZ/LoIvORJXMTsxGDRiDIPiIZTiUhZNC6wOPSU6PsA3gLIIDJNB
	TWPj9NsqDtSyvoxwHE4W329BdysHPoOJ4BIxgnEDnzoTGcplJUXwaBsNzoq7ySapjfEE+UVE7x5
	i5ctqXcvBf5KykEWEr6W1qFE9bCfK1xLDyN/wTYLOJMn7rLTZgJpBWXQNCUlISbHDaf3SPS9iZw
	Yb3fAtWkxXEY/LcR6iLUCKua4A1RG3wNdh7b0YDBz6v+pM5DIQr80hOnk181SxoBzkx2Tei4Rb/
	3BBlAB5cxd8Vm11pw5SL+y2oETCNIVSLAmOAP6zwdlthIWdvzqxtIHp8fs2DwjPs3OUABcOHNI/
	ENWgZaWJliKno=
X-Google-Smtp-Source: AGHT+IFAc7aaeyQR+u3Qp6ZZL9xjGS0gaH8Cw0VO5A8C8IUvcBemrixfTptopbsWKNVAAqY+ZncUOA==
X-Received: by 2002:a17:907:6e91:b0:ad5:c462:3f60 with SMTP id a640c23a62f3a-adfad325b26mr2166147366b.16.1750334502423;
        Thu, 19 Jun 2025 05:01:42 -0700 (PDT)
Received: from ?IPV6:2003:e5:872a:8800:5c7b:1ac1:4fa0:423b? (p200300e5872a88005c7b1ac14fa0423b.dip0.t-ipconnect.de. [2003:e5:872a:8800:5c7b:1ac1:4fa0:423b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adfd0720ab5sm823538066b.185.2025.06.19.05.01.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jun 2025 05:01:42 -0700 (PDT)
Message-ID: <0f535bed-f4d4-4565-8f21-b10070f793e8@suse.com>
Date: Thu, 19 Jun 2025 14:01:41 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/xenbus: fix W=1 build warning in xenbus_va_dev_error
 function
To: jiang.peng9@zte.com.cn
Cc: sstabellini@kernel.org, oleksandr_tyshchenko@epam.com,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 xu.xin16@zte.com.cn, yang.yang29@zte.com.cn
References: <20250618100153468I5faNUAhCdtMA01OuuTKC@zte.com.cn>
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
In-Reply-To: <20250618100153468I5faNUAhCdtMA01OuuTKC@zte.com.cn>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------pIbwnhlV2pr3af8slEfk65pC"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------pIbwnhlV2pr3af8slEfk65pC
Content-Type: multipart/mixed; boundary="------------9LoeFzoPI9I8CWJIybO0v1mD";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: jiang.peng9@zte.com.cn
Cc: sstabellini@kernel.org, oleksandr_tyshchenko@epam.com,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 xu.xin16@zte.com.cn, yang.yang29@zte.com.cn
Message-ID: <0f535bed-f4d4-4565-8f21-b10070f793e8@suse.com>
Subject: Re: [PATCH] xen/xenbus: fix W=1 build warning in xenbus_va_dev_error
 function
References: <20250618100153468I5faNUAhCdtMA01OuuTKC@zte.com.cn>
In-Reply-To: <20250618100153468I5faNUAhCdtMA01OuuTKC@zte.com.cn>

--------------9LoeFzoPI9I8CWJIybO0v1mD
Content-Type: multipart/mixed; boundary="------------SFR1VYhggWr44jaU2dH900x1"

--------------SFR1VYhggWr44jaU2dH900x1
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTguMDYuMjUgMDQ6MDEsIGppYW5nLnBlbmc5QHp0ZS5jb20uY24gd3JvdGU6DQo+IEZy
b206IFBlbmcgSmlhbmcgPGppYW5nLnBlbmc5QHp0ZS5jb20uY24+DQo+IA0KPiANCj4gVGhp
cyBwYXRjaCBmaXhlcyBhIFc9MSBmb3JtYXQtc3RyaW5nIHdhcm5pbmcgcmVwb3J0ZWQgYnkg
R0NDIDEyLjMuMA0KPiANCj4gYnkgYW5ub3RhdGluZyB4ZW5idXNfc3dpdGNoX2ZhdGFsKCkg
YW5kIHhlbmJ1c192YV9kZXZfZXJyb3IoKQ0KPiANCj4gd2l0aCB0aGUgX19wcmludGYgYXR0
cmlidXRlLiBUaGUgYXR0cmlidXRlIGVuYWJsZXMgY29tcGlsZS10aW1lDQo+IA0KPiB2YWxp
ZGF0aW9uIG9mIHByaW50Zi1zdHlsZSBmb3JtYXQgc3RyaW5ncyBpbiB0aGVzZSBmdW5jdGlv
bnMuDQo+IA0KPiANCj4gVGhlIG9yaWdpbmFsIHdhcm5pbmcgdHJhY2U6DQo+IA0KPiBkcml2
ZXJzL3hlbi94ZW5idXMveGVuYnVzX2NsaWVudC5jOjMwNDo5OiB3YXJuaW5nOiBmdW5jdGlv
biANCj4gJ3hlbmJ1c192YV9kZXZfZXJyb3InIG1pZ2h0IGJlDQo+IA0KPiBhIGNhbmRpZGF0
ZSBmb3IgJ2dudV9wcmludGYnIGZvcm1hdCBhdHRyaWJ1dGUgWy1Xc3VnZ2VzdC1hdHRyaWJ1
dGU9Zm9ybWF0XQ0KPiANCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFBlbmcgSmlhbmcgPGppYW5n
LnBlbmc5QHp0ZS5jb20uY24+DQoNCkknbSBmaW5lIHdpdGggdGhlIGNoYW5nZXMgYXMgc3Vj
aCwgYnV0IHBsZWFzZSBzZW5kIHRoZSBwYXRjaCBhcyBhDQpwbGFpbiB0ZXh0IGVtYWlsIChu
byBIVE1MKS4gT3RoZXJ3aXNlIEknbSBub3QgYWJsZSB0byBhcHBseSBpdC4NCg0KWW91IHNo
b3VsZCBsb29rIGludG8gRG9jdW1lbnRhdGlvbi9wcm9jZXNzL2VtYWlsLWNsaWVudHMucnN0
IGluIHRoZQ0Ka2VybmVsIHNvdXJjZSB0cmVlLg0KDQoNCkp1ZXJnZW4NCg==
--------------SFR1VYhggWr44jaU2dH900x1
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------SFR1VYhggWr44jaU2dH900x1--

--------------9LoeFzoPI9I8CWJIybO0v1mD--

--------------pIbwnhlV2pr3af8slEfk65pC
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmhT/CUFAwAAAAAACgkQsN6d1ii/Ey9e
iwgAjZ0P99yv3gxBPu4tRQ+wBr7DMe6QJn+0mYoOICGYadN7nb0dZ1ZpQfIxigE1OJ+T5801s+GU
mQtsqSo2xA6ZG7wP3wa/e498fMDxW2CXZjQNY41HkzdaSMI/K++Rm48Uf0vbhNcBWQ+0EaOnXtvP
VWY6tlDH6CTXyscvu3C6ft1Lc8m6l0SRjkLTgEIiMFXNZu78qiDeOd2LPRmDDBfAHih8Vq3XESo2
TkglfJtq3rlQjLYKKLO29vdTEM/56hYSGhln/9salr/EHlBJlVlOrKptbyskS21H6mLn2CA+Q6xU
gXwTIcVI4JkEO+XtltKLIVyflcFrvHDmzTWmirLQ2g==
=v/9o
-----END PGP SIGNATURE-----

--------------pIbwnhlV2pr3af8slEfk65pC--
