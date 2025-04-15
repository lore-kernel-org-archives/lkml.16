Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DDCF275847
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 06:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744700143; cv=none; b=SY4N4BGz83+saQQdxrPrvvLYx4Zy2HMDUQoj70kb4lOJo97icjtPfLRmXUZOfR0p9EBA493TnQfaxlxy8xtRbwMRAkiXJOyYqP3QoXGHRfUDwK24XIS6phyalQsKVea7CdIjB3vFND45dzii/M+VXgyzOS8ALq1Sc8pZFP0PSww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744700143; c=relaxed/simple;
	bh=mH1iHo0oVHEl3wNf7M0lyymD0sny8Au9BwF+SaQ+0yY=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=lwgfJFHkSvWLUvzsdD3USOmbjiQ3W+IQXvVPIWhW5D5dfbVfPp5g1kr3d/T9fepbeY3fp5EAfIZrf4CbnQgf1Q0XEqmBhPELyUwkSpHhO5BWx/DRwugq3z5kbT5TsSSDZjM7D271QTnGy7oHoVXyYoMJRmrFvKpssmQRtLKAQoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=PpWK9UBj; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="PpWK9UBj"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-aaee2c5ee6eso799930766b.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 23:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744700139; x=1745304939; darn=vger.kernel.org;
        h=in-reply-to:autocrypt:from:content-language:references:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mH1iHo0oVHEl3wNf7M0lyymD0sny8Au9BwF+SaQ+0yY=;
        b=PpWK9UBjhYQjwAwxGI+p1ic+8S30wBXR0t/5TOWrIO6d3GLZuphBHsB3ArrI2IMabQ
         0+645ouCW5+SJn13BPCGtxIuWHUPkXfItW/0b6tQ1yLFo6g8sz/HAzgdvnkSR6d9RPCH
         Th3AUGb++lLLMH3r+rS6clYJ3q6NlRMhGqVGulIyHbTcfFXyBCu8+aFqGqWTHKG884X9
         4gYa9rdGgOYKWxWILvWMpf5ztMn86ZOCga8Mj2bmcPN8lZY44w/ZSlWxla8t9b+6fYv2
         lsn1240v2LQ4SEjIcJVzubYabbun8BGAt6nHwPlWWrCAFZcygiug3wsAvloU5eZSM7Pd
         FXvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744700139; x=1745304939;
        h=in-reply-to:autocrypt:from:content-language:references:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mH1iHo0oVHEl3wNf7M0lyymD0sny8Au9BwF+SaQ+0yY=;
        b=X9DoCqK2NgBq3UQ+CMi25v4g97VjD6yA52EwTgafg8hgntYxHFLwQw6sTB5jABim65
         OCAIUHILHNcrcjbyH6VlI6+iLYsP7BRokrxhGV2+oKCU5yiwG4ev0Sp8z/5dgjUFJ7xu
         tDYwAqGBDuOgxbrDVhUkVGZfONaWdy/sTBlWJuwlfrk14hgHQosAQP4nXUbtKcQb2MDq
         klj4vadCM7NH0Py9Dp+tA7ap8LPOdnf6hY89hboMJhIdUHiGA1wMxpMWZ0HM63gDDIXX
         G9Xvp2F0KH3nxcOtLoozU5OyBGuIgM5fVgswVN+F3g4cYEElbMWUVA8MbiXEOxk+X8dt
         e5VQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2FCK1se3EO/u/QdUMKpJW5Q79quGer2ulMiLxkZxf7ltVpAwOyE+UZjUPeJyX85Ce2n3urHdQlmrLVsI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXHdBE+wQeyhxf8xfpfoniuImapKwVtOccE/AjJu6vzmwLIy18
	2yDC4iyqXLlHU8w5aM6jvXgRp/ys0xg/PyIY7j1wY33DHlQba6K4Dehsbd/Uzbk=
X-Gm-Gg: ASbGncvkP1EovyV07QtarC+qE8bXqOLG3I99DSRVURPa4bYEZNzVcgp3azifazdE5Uv
	ULeumt9iCCVUFP0qLR7TQgN8L4oQHHYdkon1MgcVVuNJMtlNotrUbwRUE/GsUK+/74wWXka8hvF
	EGnRvRM6BTKjmtNue9inRd402app8psJlyqOXC5vMdUC16w9X8UF4zJuJcS79hxGoCvIy/MAlPL
	mKKcAe0OAINE0jIFRFCivpqXPq/N3cpaPisgpUqrrT2ursKF6e3YqRMKWttSTKTEbZKWrPF4ETQ
	CfBhqmIvjCAE45exG9wHbEJUFzRwJAhCb1nmPl2Ed5tBKn+FxKJvnV6y80UzMceOJSvps8yA/Ak
	ue47oDx4dkXf7r0NNJVOJt3DRwNMr+COC7la5ORMn5mJ0Iwe90K8LxCURf+bN/Az6NA==
X-Google-Smtp-Source: AGHT+IHfwJashPa+nqtOMRp7LD73ka/YQaxjrS0ijQc96PctD+DEkKhFe9nYhZU4EUJUkHAUKH06Sw==
X-Received: by 2002:a17:907:60d4:b0:ac8:16fb:a291 with SMTP id a640c23a62f3a-acad34869edmr1535103466b.18.1744700139191;
        Mon, 14 Apr 2025 23:55:39 -0700 (PDT)
Received: from ?IPV6:2003:e5:873d:1a00:8e99:ce06:aa4a:2e7b? (p200300e5873d1a008e99ce06aa4a2e7b.dip0.t-ipconnect.de. [2003:e5:873d:1a00:8e99:ce06:aa4a:2e7b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1999d96sm1025891866b.0.2025.04.14.23.55.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Apr 2025 23:55:38 -0700 (PDT)
Message-ID: <49dc22ee-ad72-4c01-bab9-37f405e947d6@suse.com>
Date: Tue, 15 Apr 2025 08:55:38 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-6.15-rc2/drivers/xen/balloon.c:346: Possible int/long mixup
To: David Binderman <dcb314@hotmail.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "oleksandr_tyshchenko@epam.com" <oleksandr_tyshchenko@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <AS8PR02MB1021776B93FEF6D425C7223389CB32@AS8PR02MB10217.eurprd02.prod.outlook.com>
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
In-Reply-To: <AS8PR02MB1021776B93FEF6D425C7223389CB32@AS8PR02MB10217.eurprd02.prod.outlook.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------wY5A2zixIF1bIvSO7tvogJP6"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------wY5A2zixIF1bIvSO7tvogJP6
Content-Type: multipart/mixed; boundary="------------L80Zs1i0UKD0f1eNCgIODbzW";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: David Binderman <dcb314@hotmail.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "oleksandr_tyshchenko@epam.com" <oleksandr_tyshchenko@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Message-ID: <49dc22ee-ad72-4c01-bab9-37f405e947d6@suse.com>
Subject: Re: linux-6.15-rc2/drivers/xen/balloon.c:346: Possible int/long mixup
References: <AS8PR02MB1021776B93FEF6D425C7223389CB32@AS8PR02MB10217.eurprd02.prod.outlook.com>
In-Reply-To: <AS8PR02MB1021776B93FEF6D425C7223389CB32@AS8PR02MB10217.eurprd02.prod.outlook.com>

--------------L80Zs1i0UKD0f1eNCgIODbzW
Content-Type: multipart/mixed; boundary="------------rNOgDUQkUSyo2kvvHmbYIPcQ"

--------------rNOgDUQkUSyo2kvvHmbYIPcQ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTQuMDQuMjUgMTk6NTcsIERhdmlkIEJpbmRlcm1hbiB3cm90ZToNCj4gSGVsbG8gdGhl
cmUsDQo+IA0KPiBTdGF0aWMgYW5hbHlzZXIgY3BwY2hlY2sgc2F5czoNCj4gDQo+IGxpbnV4
LTYuMTUtcmMyL2RyaXZlcnMveGVuL2JhbGxvb24uYzozNDY6MjQ6IHN0eWxlOiBpbnQgcmVz
dWx0IGlzIGFzc2lnbmVkIHRvIGxvbmcgdmFyaWFibGUuIElmIHRoZSB2YXJpYWJsZSBpcyBs
b25nIHRvIGF2b2lkIGxvc3Mgb2YgaW5mb3JtYXRpb24sIHRoZW4geW91IGhhdmUgbG9zcyBv
ZiBpbmZvcm1hdGlvbi4gW3RydW5jTG9uZ0Nhc3RBc3NpZ25tZW50XQ0KPiANCj4gU291cmNl
IGNvZGUgaXMNCj4gDQo+ICAgICAgdW5zaWduZWQgbG9uZyBpLCBzaXplID0gKDEgPDwgb3Jk
ZXIpOw0KPiANCj4gTWF5YmUgYmV0dGVyIGNvZGU6DQo+IA0KPiAgICAgIHVuc2lnbmVkIGxv
bmcgaSwgc2l6ZSA9ICgxVUwgPDwgb3JkZXIpOw0KPiANCg0KV2hpbGUgSSBhZ3JlZSB0aGlz
IHdvdWxkIGJlIGJldHRlciwgdGhlcmUgaXMgbm8gcmVhbCBmYWlsdXJlIHBvc3NpYmxlDQpo
ZXJlLiBGb3IgdGhpcyB0byBjYXVzZSBwcm9ibGVtcyB5b3UnZCBuZWVkIHRvIGhvdHBsdWcg
MTZUQiBvZiBtZW1vcnkNCmluIG9uZSBzaW5nbGUgYmxvY2suDQoNCk5ldmVydGhlbGVzcyB0
aGFua3MgZm9yIHRoZSBub3RpY2UuDQoNCg0KSnVlcmdlbg0K
--------------rNOgDUQkUSyo2kvvHmbYIPcQ
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------rNOgDUQkUSyo2kvvHmbYIPcQ--

--------------L80Zs1i0UKD0f1eNCgIODbzW--

--------------wY5A2zixIF1bIvSO7tvogJP6
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmf+AuoFAwAAAAAACgkQsN6d1ii/Ey/n
kQf/ZtJmR+LeWcIyGU04l61IaqpD67A1ASh+lM+EKBzUAzhmQ1zp2W3s3OPlg/altaQuRys/XNX9
J7R0fhFKlHT8ihOiIIF4uIcaqICAKKiivrxH6yFyWnn1dPyPiz1Xe4C/GmFjagfj/xcCVkymIwgx
6gL51sENPyqbLNzK+sOHDgZOBXfqAaiAl+B1RYtu1HXh9tk8YWbEXkAXXye15VHkYG9urOkZY4f6
oanrsUNR3844AB1SJQ73cKRzv+v/EVXsgqPRTmdII4Ei6jMs2HCiHPKhko1v12yxz1r44JiTjJ4v
eOhfStPjwByvrCJ3+QPg9G/d0fsEXkpc82MZ5sUR+g==
=KJKF
-----END PGP SIGNATURE-----

--------------wY5A2zixIF1bIvSO7tvogJP6--
