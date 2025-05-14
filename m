Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 831DC221721
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 15:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747238193; cv=none; b=ejOtZAOQxMUu6ne3GciiLgho7eEjGxgVfmn3ap1MXz3/2UIZyNuaCsewR35U10898jNn7+xquMWRJ9dmwmJOCtzWnW4uG7m/xrrzomqdLBRjci6vYqG4EX6+vQlqZ7ynEF0WXKkeyfEN0wJ66ktOpcxz5adgnzfNKmU/TuqQLJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747238193; c=relaxed/simple;
	bh=jZGT1lD5+P8o4surXWhjLhMIFTmAgabakL1I8TIT7s4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aadLmjovqsvUdnBpXi3UeKJP/4GzlOD/8G1oi1cWxoidejqRmM/XMhgPA/KoX4timZfavrWvm5m+B0DkUgy/r8oToeF/rQ1PRZyg8tdfN5cFshm1d4PA6DeUxzvprAvdTYhIEirqGZfY58IGEpz/7pvwX2hrTtKyjnzXrZ8j+i8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=c1cRKIXy; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="c1cRKIXy"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5fbf007ea38so11506252a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 08:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747238188; x=1747842988; darn=vger.kernel.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jZGT1lD5+P8o4surXWhjLhMIFTmAgabakL1I8TIT7s4=;
        b=c1cRKIXyzHio2PWlINTsv96q9PZKYb3f7vY8P0eyJbFzgzxnd9eY7H71DCi+cEQxGe
         BLVANWFso/xghgFB4WKGWnnUL9KfvoyQp1PjJkSSjqW7icYUS8izGzGeSR/45Gowo0ri
         ChNm/ek4oNHFddXtiyI9hVZNtspTrSvSN1fQJ8H7vnbS8alv60ArbA7MZWz05odcQcMC
         bMcNu73d7NiVG2v++sfRoS0NS0b/DJF0+E4vYAAipz+mIZkBXUw87TMy8uRFN1kk2LXr
         GH++I5JwnFjVBWZoBg4+Bj208zvfaDIuYPJObTB6czFKqI25Jf7fec3T1TGwvLbZPuFH
         yb0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747238188; x=1747842988;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jZGT1lD5+P8o4surXWhjLhMIFTmAgabakL1I8TIT7s4=;
        b=SZ1IeSxjxXQe5nOfPViHennwEC3WClyKwjB6kkzw+7yD0ZQ3DYDcoM8hbAw8q18vVr
         7FgjXCR+fRArGzSgxryfvE6A08ItN3hk2FXaTdI1CF3sfeQY/IYme+1hRp7BXyd//HwZ
         ibg7QrVEolhRhyUCk9UjLv1UXI/CIENR5BpjVFDpJPxIExgjZ2pR6feuDSL8hLiDD9BO
         77iwB094+to6n43f/W9BiutIWkr+IHOIa492VOTfCbGJyChAnxKD0Jlb2/56qw3tRP08
         7+I1u/BgZYiJ6KT7UqlcTa8sFPa6vYJPrRNxwIhi1Y3JRb2poCtwBsNimD2MPBNtMx6E
         HZTw==
X-Forwarded-Encrypted: i=1; AJvYcCXHGaFLj979N+uh5tcEp+wbHPINnH9MEthdSvTuFB2LSzTQiN2QjyEfG1UZHlNiFXf5iuq7Qqr3tE4nnT4=@vger.kernel.org
X-Gm-Message-State: AOJu0YysygVLgpWAlY8hXLQ6YdEgEFFkFLDckvRaDnT1DDSCxrK6+oqA
	Vnu9uf/RSor4I9VsfYqCZ7Pd8XWLM1MLjsu/N11eYVGeCkcwoZuAsL2yruhcUqc=
X-Gm-Gg: ASbGncv1o/g8u18Ux+DF/VH68CKcGrQG4NUu8iNmoVAQeyz44KQBqRp1fDkZPPJw1LA
	3+jJZ6a1cKREmfmTLgmLV0D3yoI7lOc4ySRdmLwm0Ql1hGrQ0avTR6xtVrK3eYHfCHmFGFMNmsA
	SXBCNq0kaAAmkDmfctqwd87SQM72STM2FGdXFZpU1lqTwCxlkojUW6A+i8adgPNd0Ni5Y+oSrEg
	DsB+UuUV0ui0m9lmZlWqxdA2wLHHIkYLLsIgSS0z9xtG8fNQnBlZKyvTEyMcklnLFfADn3QR4lE
	FFQ2X4UJGKW7irNAdRZhKUDMISoWf+FjOSLj8PmMUOR6YNqcdBRWrAzsMqzrJ8uPox47u5MqCOo
	2fhND5+unsiH4UHsqsyDk0iQKARksWvAUIFgzIp1sZ/uepcuaivewkoqWEklAGM6/FRveymN7SV
	+c
X-Google-Smtp-Source: AGHT+IGazqnyNdtpYvI2ZUK+d3wGphF/qroGz/5XaD/CJq/YwGfOc1xEFgU6NcJCQdpGjg+xcG/nQg==
X-Received: by 2002:a05:6402:2811:b0:5fc:9759:379c with SMTP id 4fb4d7f45d1cf-5ff988a59c3mr3613418a12.10.1747238188539;
        Wed, 14 May 2025 08:56:28 -0700 (PDT)
Received: from ?IPV6:2003:e5:872a:8800:5c7b:1ac1:4fa0:423b? (p200300e5872a88005c7b1ac14fa0423b.dip0.t-ipconnect.de. [2003:e5:872a:8800:5c7b:1ac1:4fa0:423b])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fc9d70f51esm8799706a12.79.2025.05.14.08.56.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 May 2025 08:56:28 -0700 (PDT)
Message-ID: <d1d45a72-1506-4b81-a905-b9e94eb52825@suse.com>
Date: Wed, 14 May 2025 17:56:27 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/x86: fix initial memory balloon target
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org
Cc: jason.andryuk@amd.com, John <jw@nuclearfallout.net>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
References: <20250514080427.28129-1-roger.pau@citrix.com>
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
In-Reply-To: <20250514080427.28129-1-roger.pau@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------nqgFyaDVTJItwI4Ej6SU2P0D"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------nqgFyaDVTJItwI4Ej6SU2P0D
Content-Type: multipart/mixed; boundary="------------SMFpqtK4r85d3Z43p0E5K1wt";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org
Cc: jason.andryuk@amd.com, John <jw@nuclearfallout.net>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Message-ID: <d1d45a72-1506-4b81-a905-b9e94eb52825@suse.com>
Subject: Re: [PATCH] xen/x86: fix initial memory balloon target
References: <20250514080427.28129-1-roger.pau@citrix.com>
In-Reply-To: <20250514080427.28129-1-roger.pau@citrix.com>

--------------SMFpqtK4r85d3Z43p0E5K1wt
Content-Type: multipart/mixed; boundary="------------e0BN0WPbep9uHu6k0l4JliVs"

--------------e0BN0WPbep9uHu6k0l4JliVs
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTQuMDUuMjUgMTA6MDQsIFJvZ2VyIFBhdSBNb25uZSB3cm90ZToNCj4gV2hlbiBhZGRp
bmcgZXh0cmEgbWVtb3J5IHJlZ2lvbnMgYXMgYmFsbG9vbmVkIHBhZ2VzIGFsc28gYWRqdXN0
IHRoZSBiYWxsb29uDQo+IHRhcmdldCwgb3RoZXJ3aXNlIHdoZW4gdGhlIGJhbGxvb24gZHJp
dmVyIGlzIHN0YXJ0ZWQgaXQgd2lsbCBwb3B1bGF0ZQ0KPiBtZW1vcnkgdG8gbWF0Y2ggdGhl
IHRhcmdldCB2YWx1ZSBhbmQgY29uc3VtZSBhbGwgdGhlIGV4dHJhIG1lbW9yeSByZWdpb25z
DQo+IGFkZGVkLg0KPiANCj4gVGhpcyBtYWRlIHRoZSB1c2FnZSBvZiB0aGUgWGVuIGBkb20w
X21lbT0sbWF4OmAgY29tbWFuZCBsaW5lIHBhcmFtZXRlciBmb3INCj4gZG9tMCBub3Qgd29y
ayBhcyBleHBlY3RlZCwgYXMgdGhlIHRhcmdldCB3b24ndCBiZSBhZGp1c3RlZCBhbmQgd2hl
biB0aGUNCj4gYmFsbG9vbiBpcyBzdGFydGVkIGl0IHdpbGwgcG9wdWxhdGUgbWVtb3J5IHN0
cmFpZ2h0IHRvIHRoZSAnbWF4OicgdmFsdWUuDQo+IEl0IHdvdWxkIGVxdWFsbHkgYWZmZWN0
IGRvbVVzIHRoYXQgaGF2ZSBtZW1vcnkgIT0gbWF4bWVtLg0KPiANCj4gS2VybmVscyBidWls
dCB3aXRoIENPTkZJR19YRU5fVU5QT1BVTEFURURfQUxMT0MgYXJlIG5vdCBhZmZlY3RlZCwg
YmVjYXVzZQ0KPiB0aGUgZXh0cmEgbWVtb3J5IHJlZ2lvbnMgYXJlIGNvbnN1bWVkIGJ5IHRo
ZSB1bnBvcHVsYXRlZCBhbGxvY2F0aW9uIGRyaXZlciwNCj4gYW5kIHRoZW4gYmFsbG9vbl9h
ZGRfcmVnaW9ucygpIGJlY29tZXMgYSBuby1vcC4NCj4gDQo+IFJlcG9ydGVkLWJ5OiBKb2hu
IDxqd0BudWNsZWFyZmFsbG91dC5uZXQ+DQo+IEZpeGVzOiA4N2FmNjMzNjg5Y2UgKCd4ODYv
eGVuOiBmaXggYmFsbG9vbiB0YXJnZXQgaW5pdGlhbGl6YXRpb24gZm9yIFBWSCBkb20wJykN
Cj4gU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5j
b20+DQoNClJldmlld2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+DQoN
Cg0KSnVlcmdlbg0K
--------------e0BN0WPbep9uHu6k0l4JliVs
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

--------------e0BN0WPbep9uHu6k0l4JliVs--

--------------SMFpqtK4r85d3Z43p0E5K1wt--

--------------nqgFyaDVTJItwI4Ej6SU2P0D
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmgkvSsFAwAAAAAACgkQsN6d1ii/Ey+p
QQf/ZAvSSRLcI4Yh8O3g2SlYkobHbcWTYkNnIAbgL9miZ9mAwaX2THYDL0fwatYrIofEh+ryNc8A
LhqZ+9lBEofTM0+gQZrmpcdvBTYrq4akOo9vOVRMZ2doXN0BoFM3iSWncQ6Wy7VouGpAdfZzE5G1
THAAl8jEnfpb5iBK0YtBHn68i58VPFyWT5zoS3uBL+NKS9dEThORWvyk4j9IdmjNRN3tQGU6VFCL
u7ph4z9HIpe56Rg+nsq0a1MV7BhA9BWU5WApiSPvHE4R0gVgMkYtiBBPHS3ojD2kXeb0sy3v4++E
V7fCsi2RPcpGy8l96VEm0N0TzENQ22JwzYNxJKFTkw==
=xJm3
-----END PGP SIGNATURE-----

--------------nqgFyaDVTJItwI4Ej6SU2P0D--
