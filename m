Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ECD613635C
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 11:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746702297; cv=none; b=hPcOq8YhYKkzcNGViFa6xPV/QQp+fQrEqbcd8RY27lxJZb1DOgIbVkqIXnb6q3GSz71wqnJqGX3W6M4mnmCPQgIJn5WvxzODdiy1e7rm8AkBWy/HVebXoRucwhMlIZ77Beo5EhHUEt9u1ThGfGYx5jPt+9dQ9Ms1znqsTNcj1Go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746702297; c=relaxed/simple;
	bh=/O1RLN+uXSZ8J/93bE0GkteQTUBzZVRPNNH/zuRf/r4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Gul4AK68NOrXhwU3ySA2axivYiiVyGhlYpCX7Irn4iNoEswF2OobMZGuCNkZQGsECYDOwdu7OW6o0GAM507636vLbpLP2Oc+cvScnWFHJ1OarYFpwqVvJJso8VELTk70zfDCKpx8XPB8imK6KCgh43iAyjVnmbDM3HwfPp8SZNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FzLzZnqt; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FzLzZnqt"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ace333d5f7bso147337766b.3
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 04:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746702293; x=1747307093; darn=vger.kernel.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/O1RLN+uXSZ8J/93bE0GkteQTUBzZVRPNNH/zuRf/r4=;
        b=FzLzZnqtqrw9etUwFgwJEedy9weJ1mLUMD03YL/Cfs0ZDojplFbCksaiBKi5eHxJJ9
         pnsuy9nf6HyBDsQ+RAjcvu0mKhIBhkvvLyA4G+xxdsfkDY3OSQF50ySy5ZBatG3+OsR4
         k0kCmu0HPNHWM4oVEOdTxKLWDrd6QyIwXxHJ+m/i8B7cyHRZJYbBDSOnN1nQYiROmtfi
         piXT//inVNWTLBUD7bM4y/rG1yXp0a+Deik+vETNfx6ZXRWJhOH54deQ5jbQs0UZVkNt
         /8kfFubQxN/0BNS5qCxi9URnC+KAykPy4oR5bpPHsj0dK5rfibgAUqVJlF2tmDdmry5T
         fAFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746702293; x=1747307093;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/O1RLN+uXSZ8J/93bE0GkteQTUBzZVRPNNH/zuRf/r4=;
        b=ae3YT6awbZa2h3bhqnRsKqV1PXCGH41IYsu7QE6qqqTuFAmV7FiTnoZEOIAZ4GNpWM
         vgR/eXT6eohbaflaK+4USxLXonXfo/AW+G5FP+b462K1y0f5E5jb0/1J3SKmajqlnGzR
         dM9knPHpIPntQyOj3cRibZMH4pwTz5rEwGmG5NmbJeHvaQT+5SdRKTk86IiUfdK3ipdA
         tQbc03DB1M+2rETKy+UV95nNdAI22nDClQUKdkvsW1DUPrwLh5Xy3rVHKFU+8bCysxUL
         rsvnf/ALHF+XeHRT5cz1MkxMavP7eqnjmxSeu1C7CfNGKo2tjAdStPsBBfSiKpU42V4G
         VDsA==
X-Forwarded-Encrypted: i=1; AJvYcCVN5J1acSmf8EJsapUWMnuh3ii9OoOFvatcFine2FKvVUkydQh/6c0RAgmkhGYdFBFsvs1cVseGeXIRX1c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyu6UMxvfpZvr8tPEo+E2uX5PM3xgNrEMq8ie89ZeTM1R2y+CbD
	xv2t/MoRMD2czPGABaRmmkckAm7vREC4jwwdkj0iASnE7tHcCP9c
X-Gm-Gg: ASbGnctB0nFKFS007ykCNM9eBD4brEcFG7iOvr2NFIoVe10fXO9sRHyBLTObqqVKRtS
	dJl4xY3A/52ePlA/jlq4H7s8yHh10IxhGBdjT4PyI19JDn6yPf2J4rW6CWs/pG7bW0qye8e/8ju
	1Ys9R+xF5OuqbXOuiZZahVz5wsBEOSrJ0ihElabmKxXH4uHjfEcApcbNeJhW1QjTaNjo//+Ppnf
	n9TL5vB1UJv6TEwQYPOnMtdtRaEO4vpsSve2Ne85HqVWYNfJgx33ER0eZpIoqWY4z1osaU8G1PH
	62jMaz2PCl0/hGcCCE7NONYsmLXgRfUpUj3HmY8PqQVfLUg=
X-Google-Smtp-Source: AGHT+IG1bBa+bhZqxkbOyhR5F+aNiOCALZBO5EmfqGX2WbC13bh++Q+a7uZUxKNjtLcySEShwXdIBw==
X-Received: by 2002:a17:907:6b8e:b0:ace:8389:7c03 with SMTP id a640c23a62f3a-ad1e8bc9494mr706817566b.23.1746702293305;
        Thu, 08 May 2025 04:04:53 -0700 (PDT)
Received: from [192.168.1.248] ([87.254.1.131])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-ad189146f74sm1079207766b.17.2025.05.08.04.04.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 04:04:52 -0700 (PDT)
Message-ID: <b431d19f-c144-44c9-887c-a2f3bef7fc1a@gmail.com>
Date: Thu, 8 May 2025 12:04:41 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: soc: xilinx: vcu: issue with 2nd null check on pointer divider
To: Michael Tretter <m.tretter@pengutronix.de>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, Stephen Boyd <sboyd@kernel.org>,
 Michal Simek <michal.simek@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 kernel@pengutronix.de
References: <60721f5a-15d2-46a1-aa0c-d6d599244cb2@gmail.com>
 <aByOFaMmNqWLNbYM@pengutronix.de>
Content-Language: en-US
From: "Colin King (gmail)" <colin.i.king@gmail.com>
Autocrypt: addr=colin.i.king@gmail.com; keydata=
 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
 FVPMkxl2UyaayDvhrO9kNXvl1SKCpdzCMQ==
In-Reply-To: <aByOFaMmNqWLNbYM@pengutronix.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------l4U0iPq00fDZwQYkabYZnpDQ"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------l4U0iPq00fDZwQYkabYZnpDQ
Content-Type: multipart/mixed; boundary="------------qoAS8hX9JWZ6H3VOdK5aR1dq";
 protected-headers="v1"
From: "Colin King (gmail)" <colin.i.king@gmail.com>
To: Michael Tretter <m.tretter@pengutronix.de>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, Stephen Boyd <sboyd@kernel.org>,
 Michal Simek <michal.simek@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 kernel@pengutronix.de
Message-ID: <b431d19f-c144-44c9-887c-a2f3bef7fc1a@gmail.com>
Subject: Re: soc: xilinx: vcu: issue with 2nd null check on pointer divider
References: <60721f5a-15d2-46a1-aa0c-d6d599244cb2@gmail.com>
 <aByOFaMmNqWLNbYM@pengutronix.de>
In-Reply-To: <aByOFaMmNqWLNbYM@pengutronix.de>

--------------qoAS8hX9JWZ6H3VOdK5aR1dq
Content-Type: multipart/mixed; boundary="------------eNk5a2VFG55F8sbHfn04v7WT"

--------------eNk5a2VFG55F8sbHfn04v7WT
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgTWljaGFlbCwNCg0KdGhhbmtzIGZvciB0aGUgdXBkYXRlLCBJIGZvcmdvdCBJIGFscmVh
ZHkgcmVwb3J0ZWQgdGhpcyBiYWNrIGluIDIwMjEoISkuIA0KUGVyaGFwcyB0aGUgdXBzdHJl
YW0gZm9sayBjYW4gYXBwbHkgeW91ciBwYXRjaCBvbmVkYXkgOi0vDQoNCkNvbGluDQoNCk9u
IDA4LzA1LzIwMjUgMTE6NTcsIE1pY2hhZWwgVHJldHRlciB3cm90ZToNCj4gSGkgQ29saW4s
DQo+IA0KPiBPbiBUaHUsIDA4IE1heSAyMDI1IDExOjIxOjA1ICswMTAwLCBDb2xpbiBLaW5n
IChnbWFpbCkgd3JvdGU6DQo+PiBUaGVyZSBzZWVtcyB0byBiZSBhbiBpc3N1ZSB3aXRoIHRo
ZSBmb2xsb3dpbmcgZnVuY3Rpb24gd2l0aCB0aGUgc2Vjb25kIGNoZWNrDQo+PiBvbiBpZiAo
IWRpdmlkZXIpLiBGaXJzdGx5IHRoaXMgaXMgcmVkdW5kYW50IGNvZGUgc2luY2UgZGl2aWRl
ciBoYXMNCj4+IGFscmVhZHkgYmVlbiBudWxsIGNoZWNrZWQsIHNvIEkgc3VzcGVjdCBpdCBz
aG91bGQgYmUgaW5zdGVhZCBpZiAoIW11eCkgYnV0DQo+PiBJJ20gdW5zdXJlIGlmIHRoaXMg
aXMgY29ycmVjdCBzaW5jZSB0aGUgY2FsbCB0byBjbGtfaHdfdW5yZWdpc3Rlcl9kaXZpZGVy
IGlzDQo+PiBub3QgbWFkZS4gIEFsc28gaWYgbXV4IGlzIG51bGwsIGlzbid0IHRoZSBjYWxs
IHRvIGNsa19od191bnJlZ2lzdGVyX211eCgpDQo+PiBwcm9ibGVtYXRpYyBhcyBhIG51bGwg
cG9pbnRlciBpcyBiZWluZyBwYXNzZWQgdG8gaXQuDQo+Pg0KPj4gc3RhdGljIHZvaWQgeHZj
dV9jbGtfaHdfdW5yZWdpc3Rlcl9sZWFmKHN0cnVjdCBjbGtfaHcgKmh3KQ0KPj4gew0KPj4g
ICAgICAgICAgc3RydWN0IGNsa19odyAqZ2F0ZSA9IGh3Ow0KPj4gICAgICAgICAgc3RydWN0
IGNsa19odyAqZGl2aWRlcjsNCj4+ICAgICAgICAgIHN0cnVjdCBjbGtfaHcgKm11eDsNCj4+
DQo+PiAgICAgICAgICBpZiAoIWdhdGUpDQo+PiAgICAgICAgICAgICAgICAgIHJldHVybjsN
Cj4+DQo+PiAgICAgICAgICBkaXZpZGVyID0gY2xrX2h3X2dldF9wYXJlbnQoZ2F0ZSk7DQo+
PiAgICAgICAgICBjbGtfaHdfdW5yZWdpc3Rlcl9nYXRlKGdhdGUpOw0KPj4gICAgICAgICAg
aWYgKCFkaXZpZGVyKQ0KPj4gICAgICAgICAgICAgICAgICByZXR1cm47DQo+Pg0KPj4gICAg
ICAgICAgbXV4ID0gY2xrX2h3X2dldF9wYXJlbnQoZGl2aWRlcik7DQo+PiAgICAgICAgICBj
bGtfaHdfdW5yZWdpc3Rlcl9tdXgobXV4KTsNCj4+ICAgICAgICAgIGlmICghZGl2aWRlcikN
Cj4+ICAgICAgICAgICAgICAgICAgcmV0dXJuOw0KPj4NCj4+ICAgICAgICAgIGNsa19od191
bnJlZ2lzdGVyX2RpdmlkZXIoZGl2aWRlcik7DQo+PiB9DQo+IA0KPiBJIHNlbnQgYSBwYXRj
aCBbMF0gdG8gcmV3cml0ZSB0aGUgZnVuY3Rpb24gYW5kIG1ha2UgaXQgbW9yZSByZWFkYWJs
ZSBhDQo+IHdoaWxlIGFnby4gVW5mb3J0dW5hdGVseSwgdGhlcmUgd2Fzbid0IGFueSByZWFj
dGlvbiB0byB0aGUgcGF0Y2gsIGFuZA0KPiB0aGVuIEkgZm9yZ290IGFib3V0IGl0Lg0KPiAN
Cj4gTWljaGFlbA0KPiANCj4gWzBdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LWFy
bS1rZXJuZWwvMjAyMTAzMTgxNDQyMzAuMzQzODAwOS0xLW0udHJldHRlckBwZW5ndXRyb25p
eC5kZS8NCg0K
--------------eNk5a2VFG55F8sbHfn04v7WT
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

--------------eNk5a2VFG55F8sbHfn04v7WT--

--------------qoAS8hX9JWZ6H3VOdK5aR1dq--

--------------l4U0iPq00fDZwQYkabYZnpDQ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEEcGLapPABucZhZwDPaMKH38aoAiYFAmgcj8kFAwAAAAAACgkQaMKH38aoAib+
fA//UjO+u1HvrQ2vTBaL1OWCe3JqNF3qEfBVHeUvx2FNbxVffSBZSDkidH9yx0tjVPSBrPk9TCvE
n+Pt7d7lmfrIbI94nDza6iw3KW6VpgUNC0HVYMkQteErD2jWR3Na2kftoRjvSiQDNaTrerUbX9G2
74bqzoPvNiWf3DdDGdP08VnXC5OE55jh0KP7ZXcNeDu8atu2YBtu8DRNfeLK5sWPeCTn7VoLUe3U
HcOwTUL99tfo+S0mDtIriUZewgfxGCwnON56/lCR//5JoCzOyjGTfV3cKcJSJiImUAgZ8RT14zFr
MfI6cWPaUyTIrVVbmwbmTmS5O1R5oH6ShwPMlLJpOUDPfcxlFDnxj6NmupTt3hfkj4Rok+D6XzoD
el6rd/iM3sUhdaGhvABT4pPGPuo+nnWtlje3Gu+Mw7nmfZYPgjRDGLV4ve0DtsC8Y4akDkPa3Tap
SeuoXMtFzIz56ioDezi0xKBq6aDcxxOnBbHkwiUqWSAhfcvMhhv4NIf//eQgfhcUgTfMWwzRRjnL
1uM33GryaJmXZs1N21z5nVUWn04YlrhR+NvjIZPu4J18BJ8/pES3gToRg3Hbnx2GFYI6WE8peeJn
ycwdYDIVEZeguscCSwKFiFLwlBNZ0gMbPB3RDst8GKCJvtwPDyWaIN1Hzuco5c46BwWIf+7IY5Gd
AT4=
=fA30
-----END PGP SIGNATURE-----

--------------l4U0iPq00fDZwQYkabYZnpDQ--
