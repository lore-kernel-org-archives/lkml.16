Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E7A521CFE0
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 11:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747308804; cv=none; b=AwtJ8xoAT18mhGlzu3qbLLnTD8uZ4oyE/Fov7Br73xRyR7qnvywnh8MP4muSThgEYgAJhirqzWuddqYMChkyqywMfF/TmGpMrSCqXoRVHMALx2VF03ezoQXLWVH/zBMnibA1THAtZ/KHKEyGQMEVE9AxiUytUS3V3ISPe969ZHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747308804; c=relaxed/simple;
	bh=/uPC8op9eqfgshTJO3VMTtIZaMAGH6UK0WN0vRIaoxw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XFoMIQ5is2Lm15Uwz1Jw3sA8u1dBzg3tfldkp0G2k9zqBXwJKzip2fcPAZ+1IIVP4tbW6obdIl1jzbrss6+Zs7Ou8poyM6oxy0lvs/632DbOetU+pP6amvgDZG97nVyNpa5jKlobWk7kjbxhlHeAKfLfwvnpmvgfS/6SWg0LYHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=NEdJG9kL; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="NEdJG9kL"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ad1d1f57a01so140571866b.2
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 04:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747308800; x=1747913600; darn=vger.kernel.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/uPC8op9eqfgshTJO3VMTtIZaMAGH6UK0WN0vRIaoxw=;
        b=NEdJG9kLQaLl0P7FCPdwQV2VNoKI1RD9YxQcMq9qF76BxQbofYWs4gDQvcmA4D2Q1k
         0587PLqoz50VqUTCxX52UMEUefCbigQ1+BVlMx2eYaJzFrtU8zC36zZtCVdiix5abTc/
         Zy9SIK27V45kP7IwKW5RViJDc/byOHq/8YBq+fD/dAVgSM44uRhUd3rLUsj+gcivqkwx
         mTagUgy7uXSR8IXIkLGR9OGZHoBbLc+YMOHjxNmuFlbqvUf2KwgQyqr1Wiss1D9SxfJk
         Ahng/SkONTXlpBPj+DEB+N6pp2tOugyxERDeHmbM15Nb6xXs0yJ0VciI/DrsNwMqQvAK
         OnpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747308800; x=1747913600;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/uPC8op9eqfgshTJO3VMTtIZaMAGH6UK0WN0vRIaoxw=;
        b=VYZDx2SLsijb3Lp6c0HqKqRTZo5uobVXvPXbTowW4XzJPRkJkGcDNX+qBqphb0WhBH
         1Z/y/KnHvMwGDuLy/G0pvjSzN0mxAvAtqRnOaGASz7zd7Wk9z8Kwm3QCXMVqjVD9Fu/N
         fifoTOr9/cTF01qSDta74xuCo4naSCyHBdXnztjoifFHneKfCJTyl3fcZVGmQghukY8G
         oEenuFbM5Khdy0sONOxSuLJgRp0Sg1C6jQkNTKcNe8oYu1lsn9dKHd4u7ig7bvNmTJ88
         Xsn+mp+zxABh6JTojzlnkqRWM2WWhWY8JVxhlgWK8iRq2qCU4oSX+wHUMhG1ZkotOf6O
         Pj0w==
X-Forwarded-Encrypted: i=1; AJvYcCVTJmHEYwdYVJ09X6Bn49tHKZYOIb2Ujxh6LKKJn4hfkW+gL7JRioUgyOpoGmi3GRWwLLE+T6c7KAd0sdQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw253Sv+ymSQqScBL+ox03oNi7j+VSaxiJIVj6XJh1hkk2CcNdt
	gSj8vT+JQl/UOg+ASPxleVu6IIG6yib98T71nCss4vUACWSveMqkJx5x3aS07IM=
X-Gm-Gg: ASbGncvDKgL1OODKQcobGqGca1o5pt7I/RA47fdHgJH4XfGow2IQ3MxcYU/AJst42Uj
	M9kD3veg3mpf0QT5WM1GZbb9pUfYfO86un5nFbtojhw9fTBQZp/0cdmf52nb2xEX2bX63vLXWJW
	jEjmlMeyGdBqJV8+OXfWLDt/UTv0YtjWUltu6rhDiSr7i75V+2Zd6PuM4Q5rPeLCtJQALKuup/Q
	bn+pszeQp1lKPkZAPSEDncnzR6/eAj9GUkWmOC4gFpFVUVsSltUXyzf/kr1sP4M6uN9h7H5/31z
	/6t5/1vC30sOg5QwyPqU/vXOnjsnV2TFtdBu3IFJyLhNf3S4DzaeLSKYbTr2bKQuBmGRvxDjKzl
	nv3/vnhitH7Pmi9U/hXYcf4EYdysLvX8bLxL7q7JasRG7eZzuA9LmnLyc0iP4rjt9xid4Vg3guo
	BQ
X-Google-Smtp-Source: AGHT+IHlGVedvpqU0DF0OZhYlDd8LjUzHMxDqxeKfjY7SYS5goDcj5zWvFEkZaJCi2ymr6WdWH6jRA==
X-Received: by 2002:a17:907:60cc:b0:ad4:d069:324b with SMTP id a640c23a62f3a-ad4f70fba45mr731369166b.10.1747308800472;
        Thu, 15 May 2025 04:33:20 -0700 (PDT)
Received: from ?IPV6:2003:e5:872a:8800:5c7b:1ac1:4fa0:423b? (p200300e5872a88005c7b1ac14fa0423b.dip0.t-ipconnect.de. [2003:e5:872a:8800:5c7b:1ac1:4fa0:423b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad2197463e2sm1104637266b.108.2025.05.15.04.33.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 May 2025 04:33:20 -0700 (PDT)
Message-ID: <212b2be3-5841-4e7f-84d7-4b3653054481@suse.com>
Date: Thu, 15 May 2025 13:33:19 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: call uaccess_ttbr0_enable for dm_op hypercall
To: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
Cc: Julien Grall <julien@xen.org>, Bertrand Marquis
 <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 linux-kernel@vger.kernel.org, stable@kernel.org
References: <alpine.DEB.2.22.394.2505121446370.8380@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2505121446370.8380@ubuntu-linux-20-04-desktop>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------2dPoy037AoV5uWm6Nw8JM3Na"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------2dPoy037AoV5uWm6Nw8JM3Na
Content-Type: multipart/mixed; boundary="------------y5MlRn3dT02iY3thmAEmeFaC";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
Cc: Julien Grall <julien@xen.org>, Bertrand Marquis
 <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 linux-kernel@vger.kernel.org, stable@kernel.org
Message-ID: <212b2be3-5841-4e7f-84d7-4b3653054481@suse.com>
Subject: Re: [PATCH] xen/arm: call uaccess_ttbr0_enable for dm_op hypercall
References: <alpine.DEB.2.22.394.2505121446370.8380@ubuntu-linux-20-04-desktop>
In-Reply-To: <alpine.DEB.2.22.394.2505121446370.8380@ubuntu-linux-20-04-desktop>

--------------y5MlRn3dT02iY3thmAEmeFaC
Content-Type: multipart/mixed; boundary="------------k87NbxI1LBnN02LDBuwpuKIA"

--------------k87NbxI1LBnN02LDBuwpuKIA
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTIuMDUuMjUgMjM6NTQsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToNCj4gRnJvbTog
U3RlZmFubyBTdGFiZWxsaW5pIDxzdGVmYW5vLnN0YWJlbGxpbmlAYW1kLmNvbT4NCj4gDQo+
IGRtX29wIGh5cGVyY2FsbHMgbWlnaHQgY29tZSBmcm9tIHVzZXJzcGFjZSBhbmQgcGFzcyBt
ZW1vcnkgYWRkcmVzc2VzIGFzDQo+IHBhcmFtZXRlcnMuIFRoZSBtZW1vcnkgYWRkcmVzc2Vz
IHR5cGljYWxseSBjb3JyZXNwb25kIHRvIGJ1ZmZlcnMNCj4gYWxsb2NhdGVkIGluIHVzZXJz
cGFjZSB0byBob2xkIGV4dHJhIGh5cGVyY2FsbCBwYXJhbWV0ZXJzLg0KPiANCj4gT24gQVJN
LCB3aGVuIENPTkZJR19BUk02NF9TV19UVEJSMF9QQU4gaXMgZW5hYmxlZCwgdGhleSBtaWdo
dCBub3QgYmUNCj4gYWNjZXNzaWJsZSBieSBYZW4sIGFzIGEgcmVzdWx0IGlvcmVxIGh5cGVy
Y2FsbHMgbWlnaHQgZmFpbC4gU2VlIHRoZQ0KPiBleGlzdGluZyBjb21tZW50IGluIGFyY2gv
YXJtNjQveGVuL2h5cGVyY2FsbC5TIHJlZ2FyZGluZyBwcml2Y21kX2NhbGwNCj4gZm9yIHJl
ZmVyZW5jZS4NCj4gDQo+IEZvciBwcml2Y21kX2NhbGwsIExpbnV4IGNhbGxzIHVhY2Nlc3Nf
dHRicjBfZW5hYmxlIGJlZm9yZSBpc3N1aW5nIHRoZQ0KPiBoeXBlcmNhbGwgdGhhbmtzIHRv
IGNvbW1pdCA5Y2YwOWQ2OGI4OWEuIFdlIG5lZWQgdG8gZG8gdGhlIHNhbWUgZm9yDQo+IGRt
X29wLiBUaGlzIHJlc29sdmVzIHRoZSBwcm9ibGVtLg0KPiANCj4gU2lnbmVkLW9mZi1ieTog
U3RlZmFubyBTdGFiZWxsaW5pIDxzdGVmYW5vLnN0YWJlbGxpbmlAYW1kLmNvbT4NCj4gRml4
ZXM6IDljZjA5ZDY4Yjg5YSAoImFybTY0OiB4ZW46IEVuYWJsZSB1c2VyIGFjY2VzcyBiZWZv
cmUgYSBwcml2Y21kDQo+IGh2YyBjYWxsIikNCj4gQ2M6IHN0YWJsZUBrZXJuZWwub3JnDQoN
CkknbSBub3QgYW4gQXJtIHNwZWNpYWxpc3QsIGJ1dCBsb29raW5nIGF0IHRoZSBzdXJyb3Vu
ZGluZyBjb2RlIHRoaXMNCnNlZW1zIHRvIGJlIGNvcnJlY3QuDQoNClJldmlld2VkLWJ5OiBK
dWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+DQoNCg0KSnVlcmdlbg0K
--------------k87NbxI1LBnN02LDBuwpuKIA
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------k87NbxI1LBnN02LDBuwpuKIA--

--------------y5MlRn3dT02iY3thmAEmeFaC--

--------------2dPoy037AoV5uWm6Nw8JM3Na
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmgl0P8FAwAAAAAACgkQsN6d1ii/Ey9y
9gf/Q9/eu+UxUlKAd28X7c6Fc1sPSNE6RyrAYzJaD0oVh8qFklBk4lzk4U8aDHndUYIgEfLRCdwC
ijJfQAApS6wm1ef5ryzET4AV8St1ZDe8mM9vdMq/Qypu1+vKtvKEJyHajPkr+C0IKtdIqmDe8h3B
+r66WqJaFWMZ9j5ViL7wTx0wDa3BKPXzGzIVU3uwnP0jzeemEFnPjwKKDV3A8xpNx1dbF9ajTQQI
DEskoh6X+JYoBCemAeyiqF1G2WGxHcrpaIg6PiKeye8bKIETZl1Gb0opKFMpzbAC1Vr2cqSFFN62
wlOuP2L/MpQWBXZLQkLCjaglGRRfK7PqGot+u+eZWw==
=p318
-----END PGP SIGNATURE-----

--------------2dPoy037AoV5uWm6Nw8JM3Na--
