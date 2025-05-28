Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E165F9E8
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 05:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748409111; cv=none; b=JAS7+qWHxOCrmOtRJB3/eQhc30Av7QzZLQ/ucgfKYEuOW9L0VJK0Us2lSvLe7ASq0X73QO/EubnWlAFdtBRaTkGZpxFc9tBch0mDUUbMGd5SP9pJkx8cmDgVw6nmACaeiyDsJA8xZREZ+2qtRbKJDGaB2ZNRTJshXxPJZnsOQqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748409111; c=relaxed/simple;
	bh=sH0n0FnKUwtt38HL5bJZ1VIht8EzWCUquUJl2yVegoU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lWUoW9402felKSn8Cs0Ja8IZhqf53rLzQxFRp2uzJAZRdVQLcm1pYKt/utfeIP636w/SMfSHVm+PS8aiOOHSGIXRtF4ussLLO7Zp3gRgSNKz0QU7n2mJp9jmzZBTQCiAhPFUUNtDrXgJOZ8SKXBKvT6T/IrpKUJuJnMooTR/rvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=aUpgaoGl; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="aUpgaoGl"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5fbfdf7d353so5398520a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 22:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748409106; x=1749013906; darn=vger.kernel.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=sH0n0FnKUwtt38HL5bJZ1VIht8EzWCUquUJl2yVegoU=;
        b=aUpgaoGlWGqqhc6rguWT/s+wK8SiROZjd1pOnMIFoeBoucxptC6rNniBSSYrPFKw/X
         TNecuxBvmTrVsLgnsarcEHXFu8yhXnw4twjIpjDgjx5cx0KU/1LvMqq3I1QPVVRyebCQ
         rQ8+ZLfPwe5tC6zUqzyLLcMuDt8Iml/gx+B+LV1FU/immiRFZWRP3LH9AriSw0AWlVIs
         arlR1COEo955fmo9hXZqu1pCRFiPNIY3joA1hiVmiq0VgaHW6pV0Xj3KzAgF55B3KcFl
         nQbxe18USVDTaTr51vIM3hgs3GOkqvM3n6mf9KMTP4sD/q2ykgtyJ3jv1Qas8xThWX0j
         6HZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748409106; x=1749013906;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sH0n0FnKUwtt38HL5bJZ1VIht8EzWCUquUJl2yVegoU=;
        b=Ej5QpZfNUOluI3PaMmpbgYdozwmuZjsud2pSV6sdZIK05GnVlOv7vTQ0e/b4Qquv1c
         5N4oFypYNEgNFhEtZi3xryzXmYU1QhljKpsbV6nNLurbwOe+wZCIWlBP5I+PiMcloL+c
         m7b+DQkIICeUZJb951ugo6MmoxHcvKDQhPmYf9gcqMX2vQTLwrAT/j6/E0Vg8h5Vs61T
         z21I+BKjanisH6X4NF5RujpKKKtPHLuXtq9DdATdY7YS+TWfeKsivc9wMBMmR/7K4roC
         RQTB/BV6HxKA1kfVkUrPYpwBqrWdZ38SceBUS49uez/il+lEJp8UCByXjk50p9CDO2Oq
         yaRA==
X-Forwarded-Encrypted: i=1; AJvYcCXnH0pZTR8srCPS/jIFmmAiq0FueN+h0JMBdNJqxkmPHclC4gwCcZ4jiiONiDJRyFGFvuEcaYLkk09EOr4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwsHm5dAy5la2pWW1JxGUxzz8Fi+aNqlMQegtv7xdVCkOpa48v2
	2RNnO2k0Yq9QSORINbLRgtyDcZywAvjLXKvu23H1vwu8Dl6L3e3T/F9BQtYqkSIG2lM=
X-Gm-Gg: ASbGncvim77tRcKS807LBH2f5X8QS25ZGwsNjJDL4Xn+Z6QSz+ZqapdV2Y9WA5dzkUe
	p88UGg1faFPjm/MU3rL9WSoSEkPI3QxonP7y2FIE0LSBzzC6Uvpiqh2nsjP5yM9jTWaOmhRFzhj
	018knh9l+Z9sRJIFj91xl7ciVEHXbcliByJjpVO1BPTqllXeor43mGReH6jhHXaqOyF8ub5hpP7
	j3uZIDIPgcF8Rw3+69kt6OS8JQQhVfaRdh+ByRcVoUWYArbhpcmSkcnSxtM2Yh90bIa4CKiCgB8
	a8Df59a5GxrT7s3PTOT6TWSC6mLumVEhFRwtQmVFphbVkJbf7MXW0LlxZi9eTbuEzNarogQobOZ
	/Jv1i6TlcvO09ER/qQ4zYjZ5BJOvwyDxq6NdI4HuwLnHmWIbMEh0foXaJcLGfv7aTt7lhZ0W1t6
	cz7L0gVU24nkA=
X-Google-Smtp-Source: AGHT+IGwcijBWIPB7PGHOuMy5xvE1oyDUR9YfrMkQzLT5dI+t8DoWrSMQOlT4g6STh5oXkYEJEGc6g==
X-Received: by 2002:a17:907:868b:b0:ad5:6969:2086 with SMTP id a640c23a62f3a-ad85b1df929mr1348710566b.37.1748409106302;
        Tue, 27 May 2025 22:11:46 -0700 (PDT)
Received: from ?IPV6:2003:e5:872a:8800:5c7b:1ac1:4fa0:423b? (p200300e5872a88005c7b1ac14fa0423b.dip0.t-ipconnect.de. [2003:e5:872a:8800:5c7b:1ac1:4fa0:423b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad8a19c8a45sm42217666b.39.2025.05.27.22.11.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 May 2025 22:11:45 -0700 (PDT)
Message-ID: <227db775-f4ce-4dd3-ba14-30232ab3ab6f@suse.com>
Date: Wed, 28 May 2025 07:11:44 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Bug Report] Linux v6.15-rc7 boot failure on Xen-4.17
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xin Li <xin@zytor.com>
Cc: Gupta Pawan <pawan.kumar.gupta@linux.intel.com>,
 linux-kernel@vger.kernel.org, x86@kernel.org,
 Zijlstra Peter <peterz@infradead.org>,
 Hansen Dave <dave.hansen@linux.intel.com>, alexandre.chartre@oracle.com,
 Zhang Tao1 <tao1.zhang@intel.com>
References: <607917bc-6788-425a-8051-181a078ddb49@suse.com>
 <C28A8745-02AD-489E-B2F3-6DE81C511783@zytor.com>
 <081152ba-79b5-477e-8248-02bf289ff9ce@citrix.com>
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
In-Reply-To: <081152ba-79b5-477e-8248-02bf289ff9ce@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------QImgxXLL0qbfqbhe4k5yO0Tk"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------QImgxXLL0qbfqbhe4k5yO0Tk
Content-Type: multipart/mixed; boundary="------------urrypqYzw2wYJLxlqpAhEpRy";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xin Li <xin@zytor.com>
Cc: Gupta Pawan <pawan.kumar.gupta@linux.intel.com>,
 linux-kernel@vger.kernel.org, x86@kernel.org,
 Zijlstra Peter <peterz@infradead.org>,
 Hansen Dave <dave.hansen@linux.intel.com>, alexandre.chartre@oracle.com,
 Zhang Tao1 <tao1.zhang@intel.com>
Message-ID: <227db775-f4ce-4dd3-ba14-30232ab3ab6f@suse.com>
Subject: Re: [Bug Report] Linux v6.15-rc7 boot failure on Xen-4.17
References: <607917bc-6788-425a-8051-181a078ddb49@suse.com>
 <C28A8745-02AD-489E-B2F3-6DE81C511783@zytor.com>
 <081152ba-79b5-477e-8248-02bf289ff9ce@citrix.com>
In-Reply-To: <081152ba-79b5-477e-8248-02bf289ff9ce@citrix.com>

--------------urrypqYzw2wYJLxlqpAhEpRy
Content-Type: multipart/mixed; boundary="------------pB4HuZjFkc05LzmCO5PG5LY3"

--------------pB4HuZjFkc05LzmCO5PG5LY3
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjcuMDUuMjUgMjE6MjksIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+IE9uIDI3LzA1LzIw
MjUgODoyMSBwbSwgWGluIExpIHdyb3RlOg0KPj4+IE9uIE1heSAyNywgMjAyNSwgYXQgMTE6
MzbigK9BTSwgSsO8cmdlbiBHcm/DnyA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToNCj4+Pg0K
Pj4+IO+7v09uIDI3LjA1LjI1IDE5OjU0LCBYaW4gTGkgd3JvdGU6DQo+Pj4+IE9uIDUvMjcv
MjAyNSAxMDo0NiBBTSwgUGF3YW4gR3VwdGEgd3JvdGU6DQo+Pj4+Pj4gQXR0YWNoZWQgaXMg
dGhlIHNlcmlhbCBjb25zb2xlIGxvZyBhbmQgbXkga2VybmVsIGNvbmZpZy4NCj4+Pj4+IFNl
cmlhbCBsb2dzIGFyZW4ndCB0ZWxsaW5nIG11Y2guIEkgZG8gbm90IGhhdmUgYSBYZW4gc2V0
dXAgdG8gdGVzdCwgd2l0aG91dA0KPj4+Pj4gWGVuIHRoZSBjb25maWcgdGhhdCB5b3UgcHJv
dmlkZWQgaXMgYm9vdGluZyBhIEtWTSBndWVzdCBqdXN0IGZpbmUuDQo+Pj4+IFllYWgsIGFz
IEkgcmVwbGllZCB0byBKdWVyZ2VuLCB0aGUgc2FtZSBrZXJuZWwgYmluYXJ5IGJvb3RzIGZp
bmUgYXMNCj4+Pj4gIm5hdGl2ZSIuDQo+Pj4+IFVuZm9ydHVuYXRlbHkgd2hlbiBib290aW5n
IGFzIGRvbTAgb24gWGVuLCBpdCBrZWVwcyByZWJvb3Rpbmcgdy9vDQo+Pj4+IGhlbHBmdWwg
bG9nLg0KPj4+IFdoYXQgYWJvdXQgYm9vdGluZyBYZW4gb24gYmFyZSBtZXRhbCwgaS5lLiBu
byBLVk0gYmVpbmcgaW52b2x2ZWQ/DQo+PiBUaGUgc2FtZSBleGFjdCBwcm9ibGVtIGhhcHBl
bnMgb24gSW50ZWwgU2ltaWNzLiAgQW5kIEkgZ290IHRvIHNlZSBpdOKAmXMgYSBOWCBwYWdl
IGZhdWx0IGluIGRvbTAga2VybmVsIGR1cmluZyBhcHBseSBhbHRlcm5hdGl2ZXMuDQo+IA0K
PiBJbiB3aGljaCBjYXNlIGl0J3MgbGlrZWx5IHRoYXQgdGhlcmUncyBhbiBvcGVuY29kZWQg
UFRFIHVwZGF0ZSwgcmF0aGVyDQo+IHRoYW4gdXNpbmcgdGhlIGhvb2tzICh3aGljaCBhcmUg
c3VpdGFibHkgcGFyYXZpcnQnZCkuDQoNCkknZCBzdXNwZWN0IGEgYnVnIHdoZW4gTk9UIHVz
aW5nIDJNIHBhZ2VzIGZvciBleGVjbWVtLg0KDQpJJ2xsIGhhdmUgYSBsb29rLg0KDQoNCkp1
ZXJnZW4NCg==
--------------pB4HuZjFkc05LzmCO5PG5LY3
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------pB4HuZjFkc05LzmCO5PG5LY3--

--------------urrypqYzw2wYJLxlqpAhEpRy--

--------------QImgxXLL0qbfqbhe4k5yO0Tk
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmg2mxEFAwAAAAAACgkQsN6d1ii/Ey8T
OAf/b6T0hJN8nww8D/Qd5o63dRVF6fvnGtHfxjoQM4T8FjHVXk10/Rd5sNmfESJXlC656SYXlaVS
BPNajyEc5F20YRht3KJyYqNoCNqymBaJ4oj1dw95ye6nTYhzFhCbA7cOadsVsKWQrLlpUK7OjAm6
2Cl/k4Jz3oegSzgoAVH5a7WYkLe2Tnc8pnXbEBAAe8jEL3OvOUpgSaugtzHwLBefU04TkieoNhgK
OCfHipYcxoMrsIRK4zHwmLOVimQVzh7MB1cMj8ecKgr/xZQnnvaknN4ch3wV7c53+JyHsk5giVB8
qS5CF+XKf/2Xc2XkxK65zCUlChndL5NT7sJmhJ3tTA==
=pvWE
-----END PGP SIGNATURE-----

--------------QImgxXLL0qbfqbhe4k5yO0Tk--
