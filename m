Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F4CF17A310
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 10:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746699683; cv=none; b=qAOCJmUwLp+fFToTZQSqk3JfENLb2VrxLsuLuwnUQvroyeDYDv6wHa8V0nvTs6kBfCoVjfzTOcWIuQUbBgK0Rnu8l4u5Nphbn/jWYNwf0L1DdyYXHH9uq8azt+r4dURECD5JvxsUr0/Es3W45PiC7KiFozC/rJVW6rLYxVN5/dA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746699683; c=relaxed/simple;
	bh=o5l1PFmthbNbe7ZWUMOjOhMCKHuHeZIvd0T4wfUqVI4=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=JzwPNaT5IAZz4M8730HIzB1es6XktrIz3dwdidYAZDIkh8atd2lKCZAhekcpg5nfMze6db7hXDnMTXW+v/eSfxRaXK7o1XpbF/897FhEXa60il5JNsioR42y6Axd2FMbycAPoamAek0v9s6y+LP2hO8xQS4NHd7h76LDLsQgcR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UdkjO881; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UdkjO881"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ad1d1f57a01so148868466b.2
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 03:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746699679; x=1747304479; darn=vger.kernel.org;
        h=autocrypt:subject:from:cc:to:content-language:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o5l1PFmthbNbe7ZWUMOjOhMCKHuHeZIvd0T4wfUqVI4=;
        b=UdkjO881IoAUWNX6G4NLPoupIWlDU4uC+yaV5WS8yzl/qfOrR0YJ3ZB6lIlM3LMPMt
         C1bfFXLcRxoY8scmDwy4PlX2agR7Vz2bxg84Q1S8xadyqBxMqJgq8d9TIcfKEOYKaO6j
         tkyxcSgAzklD8JZJaISIFKni3cCZDmPJsVRKKNM1mMmDRqZu1E4lm2AJB+s5lUOOWqGm
         muwALnsuGQxKxb0tXlUYGFlcOlDu8A/VKM1z37Umoksp0Ekn2RuxnVyQROyEfRq5ynZ8
         IZvT5A0deev4x2nWwlvBhiMf7bsMrOyOKrRjjfTZ7j/Bpi4G81BSdx3HPOY7Z/YGyu3m
         KcxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746699679; x=1747304479;
        h=autocrypt:subject:from:cc:to:content-language:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=o5l1PFmthbNbe7ZWUMOjOhMCKHuHeZIvd0T4wfUqVI4=;
        b=VvBpfsswx4Nlg1/M6kwRb0KYm1GXJmZWN/6j7tuUIdCRpnR0xMcUqd236jlJMuRX0k
         77cKADAIZ4wdEdEeLqIn2gjTa1IbqHXzhHKyAZ24ywFWNu1opaC+fv2/d2sYOBWp4kmP
         cmyUfAd6dV3ejv01RWmBdMlyxwbgwsvRmbgdvpIteE9/3asBpb1X6ZEait4x3Mpmh4V0
         vgYswRZXd6oir+tKtxUyH4P7zaAdMgBuIlIuhSd46VJgoztfPr4q+zvwTjhZiFt7A4vw
         BX5sHplX9wwpYElBnSGyzxYOyBjKhWF5S6lkz+bgeUGBzS36pjkau1z3Z/0MihVxSW5z
         3evA==
X-Forwarded-Encrypted: i=1; AJvYcCUO8UEg5i9HToVj+JNMXXshLdkkWpPWxOwtoDdz/+cvuVFRYAbco7qua8dzO5JS+ORc3R+H4+p+mJVrz6k=@vger.kernel.org
X-Gm-Message-State: AOJu0YwbfxiJe0y/oCQYKnP6mDxd2mDyCK//Ig0KLe1doJbe5SYJtk3u
	uhvuBzkkvKufk2yszFIcjETyT4xRMKg+eBztDA+w2gLEAbB0w0Sj
X-Gm-Gg: ASbGncu2ndvRGCHcZtOsecHZWH+Zv39F7PxjJrzCfvKiX06LeDFx9Sk9iEkOMT+iF0Q
	RL8HRO5zkXiPzSoCXeTK+FWprBCFGGl8pg+I5rkGV2MEn3o1IGoBnr3187DILqK3uZ+pq6Z69Ha
	Y+2GWJQHyubqyZmtfEuJGENZQNdMPptxRjv2QvdpmGV1ZR6EBOKta9NRR4ifCrICiotM+/GAl4H
	/X0ID0Uvou19QgmwqvdIeNXoJTypVfp9iKwVf1Fm6fKIESofFGAwX+xgsCM/eztPBnY6Ms6FNGg
	bg+P95ViQ1n3AzJIY7Y8pMspE6H8mpT9K8IcEFTZfhCiZZ0=
X-Google-Smtp-Source: AGHT+IHowQdgmKg5BVqd1jR94LIfmtRukxpooLfKmF/IjM3hBRDabrJZEVa32k3Zn9wTSkCHBfk/eA==
X-Received: by 2002:a17:907:97cd:b0:acb:4f4a:cbd0 with SMTP id a640c23a62f3a-ad1e8bc3caemr534554666b.14.1746699679145;
        Thu, 08 May 2025 03:21:19 -0700 (PDT)
Received: from [192.168.1.248] ([87.254.1.131])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-ad1894c02b8sm1050644966b.118.2025.05.08.03.21.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 03:21:18 -0700 (PDT)
Message-ID: <60721f5a-15d2-46a1-aa0c-d6d599244cb2@gmail.com>
Date: Thu, 8 May 2025 11:21:05 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Michael Tretter <m.tretter@pengutronix.de>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Michal Simek <michal.simek@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
From: "Colin King (gmail)" <colin.i.king@gmail.com>
Subject: soc: xilinx: vcu: issue with 2nd null check on pointer divider
Autocrypt: addr=colin.i.king@gmail.com; keydata=
 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
 FVPMkxl2UyaayDvhrO9kNXvl1SKCpdzCMQ==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------ZNVH1caHyGO08rC00OCZtKKe"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------ZNVH1caHyGO08rC00OCZtKKe
Content-Type: multipart/mixed; boundary="------------X8WDFiRZL0EOQHDx40xHNMB8";
 protected-headers="v1"
From: "Colin King (gmail)" <colin.i.king@gmail.com>
To: Michael Tretter <m.tretter@pengutronix.de>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Michal Simek <michal.simek@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Message-ID: <60721f5a-15d2-46a1-aa0c-d6d599244cb2@gmail.com>
Subject: soc: xilinx: vcu: issue with 2nd null check on pointer divider

--------------X8WDFiRZL0EOQHDx40xHNMB8
Content-Type: multipart/mixed; boundary="------------fXtuJGquhu316bEYyR8RZbAh"

--------------fXtuJGquhu316bEYyR8RZbAh
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGksDQoNClRoZXJlIHNlZW1zIHRvIGJlIGFuIGlzc3VlIHdpdGggdGhlIGZvbGxvd2luZyBm
dW5jdGlvbiB3aXRoIHRoZSBzZWNvbmQgDQpjaGVjayBvbiBpZiAoIWRpdmlkZXIpLiBGaXJz
dGx5IHRoaXMgaXMgcmVkdW5kYW50IGNvZGUgc2luY2UgZGl2aWRlciBoYXMNCmFscmVhZHkg
YmVlbiBudWxsIGNoZWNrZWQsIHNvIEkgc3VzcGVjdCBpdCBzaG91bGQgYmUgaW5zdGVhZCBp
ZiAoIW11eCkgDQpidXQgSSdtIHVuc3VyZSBpZiB0aGlzIGlzIGNvcnJlY3Qgc2luY2UgdGhl
IGNhbGwgdG8gDQpjbGtfaHdfdW5yZWdpc3Rlcl9kaXZpZGVyIGlzIG5vdCBtYWRlLiAgQWxz
byBpZiBtdXggaXMgbnVsbCwgaXNuJ3QgdGhlIA0KY2FsbCB0byBjbGtfaHdfdW5yZWdpc3Rl
cl9tdXgoKSBwcm9ibGVtYXRpYyBhcyBhIG51bGwgcG9pbnRlciBpcyBiZWluZyANCnBhc3Nl
ZCB0byBpdC4NCg0Kc3RhdGljIHZvaWQgeHZjdV9jbGtfaHdfdW5yZWdpc3Rlcl9sZWFmKHN0
cnVjdCBjbGtfaHcgKmh3KQ0Kew0KICAgICAgICAgc3RydWN0IGNsa19odyAqZ2F0ZSA9IGh3
Ow0KICAgICAgICAgc3RydWN0IGNsa19odyAqZGl2aWRlcjsNCiAgICAgICAgIHN0cnVjdCBj
bGtfaHcgKm11eDsNCg0KICAgICAgICAgaWYgKCFnYXRlKQ0KICAgICAgICAgICAgICAgICBy
ZXR1cm47DQoNCiAgICAgICAgIGRpdmlkZXIgPSBjbGtfaHdfZ2V0X3BhcmVudChnYXRlKTsN
CiAgICAgICAgIGNsa19od191bnJlZ2lzdGVyX2dhdGUoZ2F0ZSk7DQogICAgICAgICBpZiAo
IWRpdmlkZXIpDQogICAgICAgICAgICAgICAgIHJldHVybjsNCg0KICAgICAgICAgbXV4ID0g
Y2xrX2h3X2dldF9wYXJlbnQoZGl2aWRlcik7DQogICAgICAgICBjbGtfaHdfdW5yZWdpc3Rl
cl9tdXgobXV4KTsNCiAgICAgICAgIGlmICghZGl2aWRlcikNCiAgICAgICAgICAgICAgICAg
cmV0dXJuOw0KDQogICAgICAgICBjbGtfaHdfdW5yZWdpc3Rlcl9kaXZpZGVyKGRpdmlkZXIp
Ow0KfQ0KDQpDb2xpbg0K
--------------fXtuJGquhu316bEYyR8RZbAh
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

--------------fXtuJGquhu316bEYyR8RZbAh--

--------------X8WDFiRZL0EOQHDx40xHNMB8--

--------------ZNVH1caHyGO08rC00OCZtKKe
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEEcGLapPABucZhZwDPaMKH38aoAiYFAmgchZIFAwAAAAAACgkQaMKH38aoAiap
Ng//ZRVvnhAxOJ6JQWn9xKl7K071YHGFnMiBoH8/cJmQzN099CBmnYEJosTrAJKEZ6j1Mracvfxv
mHzzEkwU9GQ1qyUDXip750YUmD+7ZfzgBvIcV0ppixWbxxuUxv9So1PWTYIfe/ha8aVE3sQqRlyZ
EACCjeQWqDFR3qGGYPHt5VvlahDxxPxILBgaECYATo/LxNHw5Dkg+1xs/Y2qsouz/mORGDczeU9r
tZOoe6iQKhQWx7XQV7kSeE3OyhyzyX7CpgL8DJ8gHjkhZZ4/LjbYaUuj1/eh8cK09DHXcbEPl9zT
y2Rj5BtjrEVfWfC3oTlTCX0r1JYSli6ptTfxOALWAoQToiqqd+7Qj2Tdue+dMe5Yk2EIIYBfYGzS
uJwD+9J0S93LW/TDt9nbI5fTurA4B2LKzLcYIpJ3S2IZurgrwAcesi9aZ9VhQ1ftIhyp/BDwvK31
2a0/KqsxzvXzdhz8EtzGmOfA/ahPO72911Y+Ods0iDzYooVDUwzpkmT5metR/BTq6zYRXKQS4Gts
Ve7KtJiLityT/wWJFyxPQ2OGMIKRz1CtLf+kWlQKVZk7cGdZa8RhwSwaspuyyYwlk8S0i8fAavH8
Ual5xLV+yY6tbA/PtJ3gn9l4eAOjNiFcLbaJdu/+PNe7Bz0IkH3OWYc4BQiuv5IPe+ZcGw2oSm4E
2vQ=
=EV0w
-----END PGP SIGNATURE-----

--------------ZNVH1caHyGO08rC00OCZtKKe--
