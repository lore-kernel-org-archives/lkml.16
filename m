Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC1122222A0
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 11:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746097797; cv=none; b=Epf1lD/fiA/QQ5HXAnihOOFXUAiFX8ppUG2fWgRSJIbt/3mhLDOuZNOOHFIhF4mYQtMWdwFJDjuqEiov/febX1YIHbRs7pbQToFGQAQneoaeijIbQmAePQX4IGfRzAtKpbnt5szav42njnDXR6bjKz/svrHBQQ450diX5r6Qh9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746097797; c=relaxed/simple;
	bh=49OWtcxTDAvzKf+nIq4K530THpxrsC8/4T31jU12ZtM=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=W4EPjgeZTHfOYU9dTJQcJLF5tv3ST5D3zn+HwH3Gun3ETTpGDmWdS4YF/J6P5ShohR9hyHvux3x3kQfMywnn9b6is/PkD/iPYY6O6f+6Eb+i0UGyi6CSy4h9S4xi2mLXklK1YkZAVzXgv4oleOuVk8h9Jkk5RE6gcC40e7UVZfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L0YbuJ4H; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L0YbuJ4H"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43edb40f357so3486265e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 May 2025 04:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746097794; x=1746702594; darn=vger.kernel.org;
        h=autocrypt:subject:from:cc:to:content-language:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=49OWtcxTDAvzKf+nIq4K530THpxrsC8/4T31jU12ZtM=;
        b=L0YbuJ4Haoqsyq7s4m/ESasTh+JtMCYM2aRSg5hTv9Q3jDiWiTva63nO1Y9tx8ERdH
         ZSCXDfnfJL+VjDhbOoq/Yp7j1sENZSQTdiwcIG5YQKxyUNRnQpqtDXGc9724Ocnoe6SU
         A/twGUp7FV/2No95Hu410QyI1rabdpfebafJJ7YsBDngZzd8D93TiIZsnvs7wp7bIl8E
         GrajjyN1SGFLyKCKZH2rRonjHwO64OXQYvNLwYqbyKXJ4cgk0Nb1s03MGtvqc7EL4Q+u
         ku9eEGwAmjhQQwavuzQI44vpLOLGh1KBW3ssoGgD6f7WZ8ov14+nJFf2ZXNxTmqEvf4z
         kCkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746097794; x=1746702594;
        h=autocrypt:subject:from:cc:to:content-language:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=49OWtcxTDAvzKf+nIq4K530THpxrsC8/4T31jU12ZtM=;
        b=jWIEUs+WAPr7Sf0wtrVOiircfTYQMs4Nw+DeSbZOL7oYZUC1H3ItRv/86qaaEq+AF2
         Qrg4EOQ7OV3vjWTMpnNICY7tj857xa7hN8sJGS4oqWWdItUj96g0z0mJG/UCwJ2IeaT7
         NS+d6Ly3tOBG52Cki1AaobeW+TFYtg4fvJ3wZftkCI7CJw0YwoVb0wrT3ARGph3z+O27
         1NcHSx2Mzfr+pSoURK6OhjQA+TdPMsKpxEkHI7IsZV6iw5fchINoM2VJFSgW5GFYy4WK
         /f6s2obN7BqxTQEFouWNuao1EBOmjOVyFiV+6CmxCKd3zDLhxPQp+KLe2kNH5wZuZKWU
         2eXw==
X-Forwarded-Encrypted: i=1; AJvYcCWiXEn9Y8/+5iYlwl2dlAERUqQwoTaxFjiG0xHzU1ba3vUFBwvIy75Uv06ppP6bvmYFAmqKsSdnpzmb+9k=@vger.kernel.org
X-Gm-Message-State: AOJu0YxfIObrbpjWm/nGy70C8u+BJNdRK4WkU4SxPk809g5GNQEA6rzy
	r40E0eN8hzkju+qpZRpcOslmfDc480+uYTNHGMEOA4CD5sy44JZyP2d3Xq02MgA=
X-Gm-Gg: ASbGncsbYU6NjHsOUvskmbMlwjD61oIu3X+1oI0MVTd2h3OoJK9sEVjmf1DBXbJyDo7
	0WgQDHcIFA/oQUexIpvWyVh0a3uB52EDYrUnqS3a8MxXt3fYYLsDe++2S53FAbLzxGS/4QPO330
	9EkF+ourO8O1mgMbYN4VvdI8uYHN65BH61SpFFWZfMMj3ylGp/PNiXI6v3ZYPcThGmpwXBAbYDh
	uWVFAKeyzvBhrVXcf0iIVTZeO63zNlswtfSQqNc+g/WtO7QkAu2Yx5j4yrUKxa8wfEufPsvkbOt
	18Rn7t3TkPx2A78kT/HUBb90/EHyLTb46y9NlWlrsYfrmFIzKg==
X-Google-Smtp-Source: AGHT+IF12V/sxO5Oc67WJtf7nl0T21a14/5BMCeGuDK0ympd4xHhOywyuzxafjtLxQQqcYGKXQVT4Q==
X-Received: by 2002:a05:600c:b90:b0:43c:f16a:641e with SMTP id 5b1f17b1804b1-441b64ed888mr21075655e9.6.1746097793793;
        Thu, 01 May 2025 04:09:53 -0700 (PDT)
Received: from [192.168.1.248] ([194.120.133.25])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-441b8a2873csm8519515e9.30.2025.05.01.04.09.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 May 2025 04:09:53 -0700 (PDT)
Message-ID: <7a6d0a8a-aa14-488e-9072-0bbafaa84e5e@gmail.com>
Date: Thu, 1 May 2025 12:09:43 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>
Cc: Lee Jones <lee@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
From: "Colin King (gmail)" <colin.i.king@gmail.com>
Subject: re: mfd: adp5585: add support for key events
Autocrypt: addr=colin.i.king@gmail.com; keydata=
 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
 FVPMkxl2UyaayDvhrO9kNXvl1SKCpdzCMQ==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------O7ItIFO2tkadwkrPZTshrV0l"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------O7ItIFO2tkadwkrPZTshrV0l
Content-Type: multipart/mixed; boundary="------------ouPN6xQbKruBRpqnaD4ORfnC";
 protected-headers="v1"
From: "Colin King (gmail)" <colin.i.king@gmail.com>
To: =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>
Cc: Lee Jones <lee@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Message-ID: <7a6d0a8a-aa14-488e-9072-0bbafaa84e5e@gmail.com>
Subject: re: mfd: adp5585: add support for key events

--------------ouPN6xQbKruBRpqnaD4ORfnC
Content-Type: multipart/mixed; boundary="------------XbwCwYGhEDzQcmzFdEw7GMj2"

--------------XbwCwYGhEDzQcmzFdEw7GMj2
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGksDQoNCkkgbm90aWNlZCB0aGF0IHRoZXJlIGlzIGFuIGlzc3VlIHdpdGggdGhlIG5hbWlu
ZyBvZiBkZXZpY2UgdHJlZSBwcm9wZXJ0eSANCmluIHRoZSBjb21taXQ6DQoNCmNvbW1pdCBm
Njc0Y2VhOTlkMDMxOTlhNGZjOWE5NmM2ODE0OWI4ODA0MDUzZjgwDQpBdXRob3I6IE51bm8g
U8OhIDxudW5vLnNhQGFuYWxvZy5jb20+DQpEYXRlOiAgIFR1ZSBBcHIgMTUgMTU6NDk6MjYg
MjAyNSArMDEwMA0KDQogICAgIG1mZDogYWRwNTU4NTogYWRkIHN1cHBvcnQgZm9yIGtleSBl
dmVudHMNCg0KDQpUaGVyZSBpcyBhIHByb3BlcnR5IG5hbWVkICJyc3QtcGFzc3Ryb3VnaC1l
bmFibGUiLCBzaG91bGQgdGhhdCBiZSBpbiANCmZhY3QgInJzdC1wYXNzdGhyb3VnaC1lbmFi
bGUiPyAoYW4gaCBpcyBtaXNzaW5nKQ0KDQpDb2xpbg0K
--------------XbwCwYGhEDzQcmzFdEw7GMj2
Content-Type: application/pgp-keys; name="OpenPGP_0x68C287DFC6A80226.asc"
Content-Disposition: attachment; filename="OpenPGP_0x68C287DFC6A80226.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

xsFNBE6TJCgBEACo6nMNvy06zNKj5tiwDsXXS+LhT+LwtEsy9EnraKYXAf2xwazc
ICSjX06efanlyhB0figzQO0n/tP7BcfMVNG7n1+DC71mSyRK1ZERcG1523ajvdZO
xbBCTvTitYOy3bjs+LXKqeVMhK3mRvdTjjmVpWnWqJ1LL+Hn12ysDVVfkbtuIm2N
oaSEC8Ae8LSSyCMecd22d9PnLR4UeFgrWEkQsqROq6ZDJT9pBLGe1ZS0pVGhkRyB
P9GP65oPev39SmfAx9R92SYJygCy0pPvBMWKvEZS/7bpetPNx6l2xu9UvwoeEbpz
UvH26PHO3DDAv0ynJugPCoxlGPVf3zcfGQxy3otydNTWkP6Wh3Q85m+AlifgKZud
jZLrO6c+fAw/jFu1UMjNuyhgShtFU7NvEzL3RqzFf9O1qM2muj83IeFQ1FZ65QAi
CdTa3npz1vHc7N4uEQBUxyXgXfCI+A5yDnjHwzU0Y3RYS52TA3nfa08yLGPLTf5w
yAREkFYou20vh5vRvPASoXx6auVf1MuxokDShVhxLpryBnlKCobs4voxN54BUO7m
zuERXN8kadsxGFzItAyfKYzEiJrpUB1yhm78AecDyiPlMjl99xXk0zs9lcKriaBy
VUv/NsyJFQj/kmdxox3XHi9K29kopFszm1tFiDwCFr/xumbZcMY17Yi2bQARAQAB
zSdDb2xpbiBJYW4gS2luZyA8Y29saW4uaS5raW5nQGdtYWlsLmNvbT7CwZEEEwEI
ADsCGwMFCwkIBwMFFQoJCAsFFgIDAQACHgECF4AWIQRwYtqk8AG5xmFnAM9owoff
xqgCJgUCY8GcawIZAQAKCRBowoffxqgCJtd/EACIWcaxfVt/MH4qqo5ELsjCFPVp
+RhVpQDWy8v9Np2YbTcZ4AY2Zj4Pq/HrZ3F/Bh02v85C6mNv8BDTKev6Qcq3BYw0
iqw6/xLNvRcSFHM81mQI9xtnAWIWfI9k5hpX19QooPIIP3GOMdMc1uRUGTxTgTFA
AsAswRY3kMzo6k7arQnUs9zbiZ9SmS43qWOIxzGnvneekHHDAcomc/oho7kgj6rK
p/f9qRrhForkgVQwdj6iBlW934yRXzeFVF3wr7Lk5GQNIEkJiNQPZs54ojBS/Kx6
3UTLT1HgOp6UY9RPEi9wubmUR+J6YjLRZMr5PCcA86EYmRoysnnJ8Q/SlBVD8npp
GVEcuvrbH3MBfhmwOPDc3RyLkEtKfSTB92k1hsmRkx9zkyuUzhcSnqQnpWGJD+xt
KHvcHRT7Uxaa+SDwUDM36BjkyVcZQy8c+Is2jA55uwNgPpiA7n82pTeT+FRGd+7i
CLQHaryu6FO6DNDv09RbPBjIiC/q814aeKJaSILP1ld9/PEBrLPdm+6lG6OKOt9D
DV6jPmfR96FydjxcmI1cgZVgPomSxv2JB1erOggB8rmX4hhWYsVQl1AXZs3LdEpJ
6clmCPspn/ufZxHslgR9/WR1EvPMQc8XtssF55p8ehRIcVSXDRcMFr3ZuqMTXcL6
8YbDmv5OGS95O1Gs4c0iQ29saW4gS2luZyA8Y29saW4ua2luZ0B1YnVudHUuY29t
PsLBdwQTAQgAIQUCTwq47wIbAwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgAAKCRBo
woffxqgCJo1bD/4gPIQ0Muy5TGHqTQ/bSiQ9oWjS5rAQvsrsVwcm2Ka7Uo8LzG8e
grZrYieJxn3Qc22b98TiT6/5+sMa3XxhxBZ9FvALve175NPOz+2pQsAV88tR5NWk
5YSzhrpzi7+klkWEVAB71hKFZcT0qNlDSeg9NXfbXOyCVNPDJQJfrtOPEuutuRuU
hrXziaRchqmlhmszKZGHWybmPWnDQEAJdRs2Twwsi68WgScqapqd1vq2+5vWqzUT
JcoHrxVOnlBq0e0IlbrpkxnmxhfQ+tx/Sw9BP9RITgOEFh6tf7uwly6/aqNWMgFL
WACArNMMkWyOsFj8ouSMjk4lglT96ksVeCUfKqvCYRhMMUuXxAe+q/lxsXC+6qok
Jlcd25I5U+hZ52pz3A+0bDDgIDXKXn7VbKooJxTwN1x2g3nsOLffXn/sCsIoslO4
6nbr0rfGpi1YqeXcTdU2Cqlj2riBy9xNgCiCrqrGfX7VCdzVwpQHyNxBzzGG6JOm
9OJ2UlpgbbSh6/GJFReW+I62mzC5VaAoPgxmH38g0mA8MvRT7yVpLep331F3Inmq
4nkpRxLd39dgj6ejjkfMhWVpSEmCnQ/Tw81z/ZCWExFp6+3Q933hGSvifTecKQlO
x736wORwjjCYH/A3H7HK4/R9kKfL2xKzD+42ejmGqQjleTGUulue8JRtpM1AQ29s
aW4gSWFuIEtpbmcgKEludGVsIENvbGluIElhbiBLaW5nIGtleSkgPGNvbGluLmtp
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
=3DQKm6
-----END PGP PUBLIC KEY BLOCK-----

--------------XbwCwYGhEDzQcmzFdEw7GMj2--

--------------ouPN6xQbKruBRpqnaD4ORfnC--

--------------O7ItIFO2tkadwkrPZTshrV0l
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEEcGLapPABucZhZwDPaMKH38aoAiYFAmgTVncFAwAAAAAACgkQaMKH38aoAiam
YxAAp8m99uMI7ZhBAiN7CozX9EjhOc/LrgJBKIHLQpF2MW+b0fUS80OoS6oat+V/M7Ir1wXBR2tZ
vwHeDleXzdaGaR3Q+nL7flXzZIW5xlVKEO9PuIpD7LQGHpbBvS9/VqbPR+GdvI0DRwsdlZO/Gxyv
vqGJ0WXbRSt4yx9ZCyaNS3ajo+a7gtdOHk79J52ozosVwdd901PqvM0NYuB9tX/vb9TjEZ3JrVPB
SZtwAC1QYSDAI/OhbqeyhQY1TjFXzDe+ajIW02znpRZid9Ssi9SjYilnfoMuUsJLMNU+Xz3Uz9YJ
NKfnWpHqssGC2JRcRfKy2IPqtYpYQd05iiBrvOcYdi1Tea2y4XqdWnk0G0KKLP8HWD4UlDmMKb80
N/VSvZPleKvZPm5ZoDTF5Ks1/5qtJz+hWYcpPIWPD9UGDUt4+kiuPGUSS+qanuaHnDPCcpSqOk99
soXkrKT3IeBZrGyDL6VJZFUSLe3Q7RH/bXquCxTA4/2yI876OzLzwmiXGR++xnv70jBdTuXcspbf
oRJLqY3x6XjqfZx0zmdcOJWo2htiRuU9ArvohXEwDCCBvTCRZYZy6MprMbYddbSo4owHxFWzje2m
EGtXzIV3AfkUowGnaGZITXhwM1KRZQDYmCpfb2OfKNl2vVEcfdkTKCAEM9Fpn8oVY40l2Vh8sCkq
zco=
=sSV4
-----END PGP SIGNATURE-----

--------------O7ItIFO2tkadwkrPZTshrV0l--
