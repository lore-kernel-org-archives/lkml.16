Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DFDA22A4E7
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 09:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738747073; cv=none; b=PumSqunCg8Dbq11NLwQyGUGrRYFOmvXjxP8OxCE06UmW6KKvb2hFLiY3T+fCdvASmbZjLOodSviR6H2a4yVDLcmdB+kU8laHmdtGsdUMj/H1DVF19AHJoecyyHMtcoIZ7lo23Ldawl0Bn+airuD9bqFBGjV47zQLiaVLRciv3nY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738747073; c=relaxed/simple;
	bh=gM8AyR3hvUSrR1btMzIS6OKVLgkalIZIKiIQkWxjzbE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YU7iBLyKQ5AzOiwrlOZ/A2oUXfisn6W9xdJH9SoM0tsvpVnEML9OBDonuWlqT2GiSmTj9/mrtqv8Gv+PrAMPogxVjR8APVbJwPuK5VJLONFXtIlcwNHk8vaSpS/0dapbFA8BvMbhHkHE6JRH0jJig1sIjFgSbHnk2o50HY84w2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=OMY9abC5; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="OMY9abC5"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43675b1155bso74614605e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 01:17:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738747069; x=1739351869; darn=vger.kernel.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gM8AyR3hvUSrR1btMzIS6OKVLgkalIZIKiIQkWxjzbE=;
        b=OMY9abC5BCX9z9gBDfWhgj6VaocA3dgSE5GGNnHXV9EtHQN2VTcPCMoY3ybryB+JWe
         tytoizlMnz+KV13s/JTYpix+B3ipnD/zKOapjKGRLfZMF7g3vAbs9WH+/s7YnfXDegLK
         ENsXrqt2abCc/JkbN5OnY/VtIrmJ7uA1rFt9JyzMnQtUSri513DUPXfzelC7+b9RXfxE
         kp2zKNA3kHZSNcis31T6xx8hCBix409gQ9WEW/bdkIjX9c5u32HchPBg5H56cUjh/aN6
         qs1eUBZzY+7s1u68Re8Pc8nw57MXUkDUSutM8EgEBS4GM2U6lUY7axjg4Q2DfXgTiw1g
         sULw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738747069; x=1739351869;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gM8AyR3hvUSrR1btMzIS6OKVLgkalIZIKiIQkWxjzbE=;
        b=PlFXd0vpIr5aIjM/61lR4rQAXHS8XSpeRDtxqkw8uswq94vqzzZq01CoCq5JEcLuZz
         qwP2ftk7WJ+deH3gRdlLcahZemYoXESvc0229ZD4rvhBFYws96BoqY7D2azqHxsnhyQQ
         RyxfegqAVXEPu2wCxUU7Ybz+d4S+Pm6ab0cPHook5RzpNF1UelGwYARSkzuVQ6p4YvX4
         HLSKcvwJj9ekgVdud8m0SSXLfFC7Ny75kJNOVk0m4BWANHOCSILkQx3QUlkqnjmn8T6H
         zh4brsUzEWg848UDz7qoCUSd12NfETB50Q4QKCLR9hqZA+qON8UhPnO9UaX9xPVvVYUO
         JVAg==
X-Forwarded-Encrypted: i=1; AJvYcCXdzFTv534Afjk+nsJ3kMsTsGv8u9APNkMixGjJXnBWvDvnWh4EzlncH4r8KgcUWM7dh8d0PnK/tHODv8c=@vger.kernel.org
X-Gm-Message-State: AOJu0YwdHfs2fiJClB8fT8Fjs1QaENzoY/gy9WSvHPCTbGz1fCMCaFPc
	q61KgMl6cMVbhe4KpprGvd7xpIm5LDLCFawxphmQs5rspgevuermhWq0QOfHE9U=
X-Gm-Gg: ASbGncvO3EYeQ+joQOPqluLYEGBWwLt9NyUkhfau9Vt1GiIPPZvIqd2UDaRYGyXVbQy
	L7nC62p5LHPLHzlvxUZ/GD0r6DfArPGzgOd1Zy39qAwDUYA1BOZND2Yt8bxIeT26dPW7z8aSU5A
	kU8Cr1/DCIfWfPXsWzkOXYqtv4Q4l3XfiLe4IW5za0bH9KghH804mYLQfzafkxNhkQz3eWqnHWA
	DDXRk5QgNicpkfei8zeHqY+2ogeiijr8PZBZTMzSvXZeDDUbINQjbse3SsE6k8kWcSV9aId1KSm
	fPW51Tn4XssHw03Q2csc0APb4VysOAJBNPye+U6mUYEhHekKnkVm0zniasTGiySCRhR4fbTpMzX
	5SYwABWSj1wda5FXFTCUC8Foblm4CjM8qMD65ZQ==
X-Google-Smtp-Source: AGHT+IF/jU3h5poPUwNtAaIGoBlTmeKbAUkjrRC3yeRjvC0ywwiulpx4PNzRX55ctqltiNij82VN3A==
X-Received: by 2002:a5d:47af:0:b0:385:ea2b:12cc with SMTP id ffacd0b85a97d-38db4869274mr1393566f8f.13.1738747069315;
        Wed, 05 Feb 2025 01:17:49 -0800 (PST)
Received: from ?IPV6:2003:e5:8714:500:2aea:6ec9:1d88:c1ef? (p200300e5871405002aea6ec91d88c1ef.dip0.t-ipconnect.de. [2003:e5:8714:500:2aea:6ec9:1d88:c1ef])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c1b5780sm18355580f8f.67.2025.02.05.01.17.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Feb 2025 01:17:48 -0800 (PST)
Message-ID: <3bb7aa63-9acd-4142-b7d6-bde3e92325ef@suse.com>
Date: Wed, 5 Feb 2025 10:17:47 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/xen: fix xen_hypercall_hvm() to not clobber %rbx
To: Andrew Cooper <andrew.cooper3@citrix.com>, linux-kernel@vger.kernel.org,
 x86@kernel.org
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org
References: <20250205091056.17796-1-jgross@suse.com>
 <121c5edb-9268-4258-9735-38e4e0f226ad@citrix.com>
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
In-Reply-To: <121c5edb-9268-4258-9735-38e4e0f226ad@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------4EKPz64cvrbYV0BSPDDtmlvb"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------4EKPz64cvrbYV0BSPDDtmlvb
Content-Type: multipart/mixed; boundary="------------B6dAU0TEgOBRRyBs4DW0h0Z9";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, linux-kernel@vger.kernel.org,
 x86@kernel.org
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org
Message-ID: <3bb7aa63-9acd-4142-b7d6-bde3e92325ef@suse.com>
Subject: Re: [PATCH] x86/xen: fix xen_hypercall_hvm() to not clobber %rbx
References: <20250205091056.17796-1-jgross@suse.com>
 <121c5edb-9268-4258-9735-38e4e0f226ad@citrix.com>
In-Reply-To: <121c5edb-9268-4258-9735-38e4e0f226ad@citrix.com>

--------------B6dAU0TEgOBRRyBs4DW0h0Z9
Content-Type: multipart/mixed; boundary="------------dldE34BvM6erl3e7sY0S5VAc"

--------------dldE34BvM6erl3e7sY0S5VAc
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDUuMDIuMjUgMTA6MTYsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+IE9uIDA1LzAyLzIw
MjUgOToxMCBhbSwgSnVlcmdlbiBHcm9zcyB3cm90ZToNCj4+IHhlbl9oeXBlcmNhbGxfaHZt
KCksIHdoaWNoIGlzIHVzZWQgd2hlbiBydW5uaW5nIGFzIGEgWGVuIFBWSCBndWVzdCBhdA0K
Pj4gbW9zdCBvbmx5IG9uY2UgZHVyaW5nIGVhcmx5IGJvb3QsIGlzIGNsb2JiZXJpbmcgJXJi
eC4gRGVwZW5kaW5nIG9uDQo+PiB3aGV0aGVyIHRoZSBjYWxsZXIgcmVsaWVzIG9uICVyYngg
dG8gYmUgcHJlc2VydmVkIGFjcm9zcyB0aGUgY2FsbCBvcg0KPj4gbm90LCB0aGlzIGNsb2Ji
ZXJpbmcgbWlnaHQgcmVzdWx0IGluIGFuIGVhcmx5IGNyYXNoIG9mIHRoZSBzeXN0ZW0uDQo+
Pg0KPj4gVGhpcyBjYW4gYmUgYXZvaWRlZCBieSBub3QgbW9kaWZ5aW5nICVyYnggaW4geGVu
X2h5cGVyY2FsbF9odm0oKS4NCj4+DQo+PiBGaXhlczogYjQ4NDViYjYzODM4ICgieDg2L3hl
bjogYWRkIGNlbnRyYWwgaHlwZXJjYWxsIGZ1bmN0aW9ucyIpDQo+PiBTaWduZWQtb2ZmLWJ5
OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+DQo+PiAtLS0NCj4+ICAgYXJjaC94
ODYveGVuL3hlbi1oZWFkLlMgfCAzICstLQ0KPj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKyksIDIgZGVsZXRpb25zKC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL2FyY2gveDg2
L3hlbi94ZW4taGVhZC5TIGIvYXJjaC94ODYveGVuL3hlbi1oZWFkLlMNCj4+IGluZGV4IDky
NTI2NTJhZmU1OS4uNDM3OGI4MTdlZDMyIDEwMDY0NA0KPj4gLS0tIGEvYXJjaC94ODYveGVu
L3hlbi1oZWFkLlMNCj4+ICsrKyBiL2FyY2gveDg2L3hlbi94ZW4taGVhZC5TDQo+PiBAQCAt
MTE3LDggKzExNyw3IEBAIFNZTV9GVU5DX1NUQVJUKHhlbl9oeXBlcmNhbGxfaHZtKQ0KPiAN
Cj4gVGhlIDMyYml0IGNhc2UsIG91dCBvZiBjb250ZXh0IHVwIGhlcmUsIGFsc28gY2xvYmJl
cnMgJWVieC4NCj4gDQo+IH5BbmRyZXcNCj4gDQo+PiAgIAlwb3AgJWVieA0KDQpJdCBkb2Vz
IG5vdCwgYXMgdGhpcyBwYXJ0IG9mIHRoZSBjb250ZXh0IGlzIHNob3dpbmcuDQoNCg0KSnVl
cmdlbg0K
--------------dldE34BvM6erl3e7sY0S5VAc
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

xsBNBFOMcBYBCACgGjqjoGvbEouQZw/ToiBg9W98AlM2QHV+iNHsEs7kxWhKMjri
oyspZKOBycWxw3ie3j9uvg9EOB3aN4xiTv4qbnGiTr3oJhkB1gsb6ToJQZ8uxGq2
kaV2KL9650I1SJvedYm8Of8Zd621lSmoKOwlNClALZNew72NjJLEzTalU1OdT7/i
1TXkH09XSSI8mEQ/ouNcMvIJNwQpd369y9bfIhWUiVXEK7MlRgUG6MvIj6Y3Am/B
BLUVbDa4+gmzDC9ezlZkTZG2t14zWPvxXP3FAp2pkW0xqG7/377qptDmrk42GlSK
N4z76ELnLxussxc7I2hx18NUcbP8+uty4bMxABEBAAHNHEp1ZXJnZW4gR3Jvc3Mg
PGpnQHBmdXBmLm5ldD7CwHkEEwECACMFAlOMcBYCGwMHCwkIBwMCAQYVCAIJCgsE
FgIDAQIeAQIXgAAKCRCw3p3WKL8TL0KdB/93FcIZ3GCNwFU0u3EjNbNjmXBKDY4F
UGNQH2lvWAUy+dnyThpwdtF/jQ6j9RwE8VP0+NXcYpGJDWlNb9/JmYqLiX2Q3Tye
vpB0CA3dbBQp0OW0fgCetToGIQrg0MbD1C/sEOv8Mr4NAfbauXjZlvTj30H2jO0u
+6WGM6nHwbh2l5O8ZiHkH32iaSTfN7Eu5RnNVUJbvoPHZ8SlM4KWm8rG+lIkGurq
qu5gu8q8ZMKdsdGC4bBxdQKDKHEFExLJK/nRPFmAuGlId1E3fe10v5QL+qHI3EIP
tyfE7i9Hz6rVwi7lWKgh7pe0ZvatAudZ+JNIlBKptb64FaiIOAWDCx1SzR9KdWVy
Z2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+wsB5BBMBAgAjBQJTjHCvAhsDBwsJ
CAcDAgEGFQgCCQoLBBYCAwECHgECF4AACgkQsN6d1ii/Ey/HmQf/RtI7kv5A2PS4
RF7HoZhPVPogNVbC4YA6lW7DrWf0teC0RR3MzXfy6pJ+7KLgkqMlrAbN/8Dvjoz7
8X+5vhH/rDLa9BuZQlhFmvcGtCF8eR0T1v0nC/nuAFVGy+67q2DH8As3KPu0344T
BDpAvr2uYM4tSqxK4DURx5INz4ZZ0WNFHcqsfvlGJALDeE0LhITTd9jLzdDad1pQ
SToCnLl6SBJZjDOX9QQcyUigZFtCXFst4dlsvddrxyqT1f17+2cFSdu7+ynLmXBK
7abQ3rwJY8SbRO2iRulogc5vr/RLMMlscDAiDkaFQWLoqHHOdfO9rURssHNN8WkM
nQfvUewRz80hSnVlcmdlbiBHcm9zcyA8amdyb3NzQG5vdmVsbC5jb20+wsB5BBMB
AgAjBQJTjHDXAhsDBwsJCAcDAgEGFQgCCQoLBBYCAwECHgECF4AACgkQsN6d1ii/
Ey8PUQf/ehmgCI9jB9hlgexLvgOtf7PJnFOXgMLdBQgBlVPO3/D9R8LtF9DBAFPN
hlrsfIG/SqICoRCqUcJ96Pn3P7UUinFG/I0ECGF4EvTE1jnDkfJZr6jrbjgyoZHi
w/4BNwSTL9rWASyLgqlA8u1mf+c2yUwcGhgkRAd1gOwungxcwzwqgljf0N51N5Jf
VRHRtyfwq/ge+YEkDGcTU6Y0sPOuj4Dyfm8fJzdfHNQsWq3PnczLVELStJNdapwP
OoE+lotufe3AM2vAEYJ9rTz3Cki4JFUsgLkHFqGZarrPGi1eyQcXeluldO3m91NK
/1xMI3/+8jbO0tsn1tqSEUGIJi7ox80eSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1
c2UuZGU+wsB5BBMBAgAjBQJTjHDrAhsDBwsJCAcDAgEGFQgCCQoLBBYCAwECHgEC
F4AACgkQsN6d1ii/Ey+LhQf9GL45eU5vOowA2u5N3g3OZUEBmDHVVbqMtzwlmNC4
k9Kx39r5s2vcFl4tXqW7g9/ViXYuiDXb0RfUpZiIUW89siKrkzmQ5dM7wRqzgJpJ
wK8Bn2MIxAKArekWpiCKvBOB/Cc+3EXE78XdlxLyOi/NrmSGRIov0karw2RzMNOu
5D+jLRZQd1Sv27AR+IP3I8U4aqnhLpwhK7MEy9oCILlgZ1QZe49kpcumcZKORmzB
TNh30FVKK1EvmV2xAKDoaEOgQB4iFQLhJCdP1I5aSgM5IVFdn7v5YgEYuJYx37Io
N1EblHI//x/e2AaIHpzK5h88NEawQsaNRpNSrcfbFmAg987ATQRTjHAWAQgAyzH6
AOODMBjgfWE9VeCgsrwH3exNAU32gLq2xvjpWnHIs98ndPUDpnoxWQugJ6MpMncr
0xSwFmHEgnSEjK/PAjppgmyc57BwKII3sV4on+gDVFJR6Y8ZRwgnBC5mVM6JjQ5x
Dk8WRXljExRfUX9pNhdE5eBOZJrDRoLUmmjDtKzWaDhIg/+1Hzz93X4fCQkNVbVF
LELU9bMaLPBG/x5q4iYZ2k2ex6d47YE1ZFdMm6YBYMOljGkZKwYde5ldM9mo45mm
we0icXKLkpEdIXKTZeKDO+Hdv1aqFuAcccTg9RXDQjmwhC3yEmrmcfl0+rPghO0I
v3OOImwTEe4co3c1mwARAQABwsBfBBgBAgAJBQJTjHAWAhsMAAoJELDendYovxMv
Q/gH/1ha96vm4P/L+bQpJwrZ/dneZcmEwTbe8YFsw2V/Buv6Z4Mysln3nQK5ZadD
534CF7TDVft7fC4tU4PONxF5D+/tvgkPfDAfF77zy2AH1vJzQ1fOU8lYFpZXTXIH
b+559UqvIB8AdgR3SAJGHHt4RKA0F7f5ipYBBrC6cyXJyyoprT10EMvU8VGiwXvT
yJz3fjoYsdFzpWPlJEBRMedCot60g5dmbdrZ5DWClAr0yau47zpWj3enf1tLWaqc
suylWsviuGjKGw7KHQd3bxALOknAp4dN3QwBYCKuZ7AddY9yjynVaD5X7nF9nO5B
jR/i1DG86lem3iBDXzXsZDn8R3/CwO0EGAEIACAWIQSFEmdy6PYElKXQl/ew3p3W
KL8TLwUCWt3w0AIbAgCBCRCw3p3WKL8TL3YgBBkWCAAdFiEEUy2wekH2OPMeOLge
gFxhu0/YY74FAlrd8NAACgkQgFxhu0/YY75NiwD/fQf/RXpyv9ZX4n8UJrKDq422
bcwkujisT6jix2mOOwYBAKiip9+mAD6W5NPXdhk1XraECcIspcf2ff5kCAlG0DIN
aTUH/RIwNWzXDG58yQoLdD/UPcFgi8GWtNUp0Fhc/GeBxGipXYnvuWxwS+Qs1Qay
7/Nbal/v4/eZZaWs8wl2VtrHTS96/IF6q2o0qMey0dq2AxnZbQIULiEndgR625EF
RFg+IbO4ldSkB3trsF2ypYLij4ZObm2casLIP7iB8NKmQ5PndL8Y07TtiQ+Sb/wn
g4GgV+BJoKdDWLPCAlCMilwbZ88Ijb+HF/aipc9hsqvW/hnXC2GajJSAY3Qs9Mib
4Hm91jzbAjmp7243pQ4bJMfYHemFFBRaoLC7ayqQjcsttN2ufINlqLFPZPR/i3IX
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------dldE34BvM6erl3e7sY0S5VAc--

--------------B6dAU0TEgOBRRyBs4DW0h0Z9--

--------------4EKPz64cvrbYV0BSPDDtmlvb
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmejLLsFAwAAAAAACgkQsN6d1ii/Ey+y
Tgf8CXoNynVDZ3ixOTRF0go7j+MsXIzkIOgyJ4G6wEYjJviUQWoxmW+SbNVDEeyct4qmINTPUxvj
w714m3klNQArl6APJz9JNFYoyFpCa9a5DAM/30LyBAKWwPcoBgqAzkWF3abBp2wGcroY6CGVYwNU
XcHIBMwDd1WaEpLE0Q+5nQx6wiDJRrOdYi/+PTGwqr6+GJQVvXQHk1LYQqgsWVxQ7umAMWcKFe2l
xB5AxaP7RLzH0jFdyr1rWjtow17DfdGL8LHoQ0F2Syd9VgSMk++1VJetzfukSRrWOFhOtX1IRZHJ
MqZNTHcx5vHj4RkoQpWW0B/24IcE1eYIlHVgWDQmnA==
=2ebU
-----END PGP SIGNATURE-----

--------------4EKPz64cvrbYV0BSPDDtmlvb--
