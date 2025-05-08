Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8645D1D416E;
	Thu,  8 May 2025 15:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746717479; cv=none; b=S5RU0cnwZPyorBTdBkAxBFIM1TfiLdNgrOpj3XgmatWWfj1MTkpZVbHfMXAH+rkLCod+NouOTgjEGADxeAVbrKRlSzGlV1PEQWvgPEvRw2tcuFJ7mYgABtYvn6lnPVh6i1kjypm6puzKKJyMzKN6kiIqjysed82bcxCaxIHFI6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746717479; c=relaxed/simple;
	bh=EIMrVNLlQ5gp+UeX3/Xy8F87NxnoEFd3XJ5c/nBufuE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FsbbhKu+mQZmZNVxu1kkHlIl0FGk0py4jHyo7vgJ8kNVe17QWnxASrnc6pBvhQWQBqgCU4OwKn52FPqKxGT/hMQLhoDIHEn930I+bNODISO2LRYt29iJvVZwqNmVnPEzS2nYewXIVgFYoZFYobFAQINRYKenw9dKtcKvANRaNOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lN//VMVG; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lN//VMVG"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5f6214f189bso2082937a12.2;
        Thu, 08 May 2025 08:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746717476; x=1747322276; darn=vger.kernel.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=EIMrVNLlQ5gp+UeX3/Xy8F87NxnoEFd3XJ5c/nBufuE=;
        b=lN//VMVG6uPwL478yoSDyK9y9khtdS3+iIkdwN9eRGTKHikatcZP4txE+vzuVOFd2B
         3REDUFo6WJVYy9pZpsKHPTij/hlBNEILRfyvcBx+8O1iOcmuEIki+xA7QBhsuo6q1Qie
         AfdeCYxt/sYvHwLuJBfcbOhbuhWLI+Ly8D0extZTV2IlWw9uCZkMsHJOaoh2KBAANYm8
         sDY17DjB8PSMgkpmkJUknzKQu9qymy+4eLOeI7WU9BjIQUntRoauN/gtxRzzsHRljbN4
         BTTalKQgFFR+rdbFl6qNHYMCO5wn2GiqsAh/a3OjGBClHu+Vq0pK2Q8a0gOE3SHduWZa
         6Kzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746717476; x=1747322276;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EIMrVNLlQ5gp+UeX3/Xy8F87NxnoEFd3XJ5c/nBufuE=;
        b=LIUCatFKrKHKl+136TAqNk0Q5ZEHtetIeo6AZ26E/nldP87+E11/SCJkDCN+crk257
         5IshJ96Cg2A2Wo7c74YVQJbaipUa9EeShFhKk8ZitgQ8Twj6mdnTNTard056SNZ13aq5
         aOu1nNYg2o62Vqe3ddf+ZCCkFqLlEbf+BhwO2m36MzdTqPtbvByNpbSL5L+Js/z599J8
         8yryZOkypIaXheMLNxT9hLZl+U3RYBZLggwgMdII+67g4HJDvUCOax8u5TBF0E2/zZTi
         oEzxMpFsLzYuuqis66hR2VfqN96U38K+wZhtowHUK3Mhfl5s3qVjwoh7tZEsN6mLUqjb
         jbuQ==
X-Forwarded-Encrypted: i=1; AJvYcCX8ZbqcaxNYqXBzHdIefbWohS73vI6jw4ui1ihB80YX3klRQvZKVxHlQAKcS3VPwn7FwIqqwrVszvYHEUk=@vger.kernel.org, AJvYcCXpB7I8APSyzkfTt0phT13swqASRETW0/nUZbYt1BgC2pex59S1MVLkUVO4trNAg0HpRF2tboMEFu18/0o=@vger.kernel.org
X-Gm-Message-State: AOJu0YxV3GC//UsXryQcT5KhzBRKfs+jbcIGNA03bUSzTfILZ+WfweG/
	zsnFw0R6b9HzKbaWRn0eBifLwkvBe7BhZdId3ztVZD7fjT3BtA1w
X-Gm-Gg: ASbGncuf+V5Xeiyg8ZjIe4jgBwAGtV4gMIWxedCoXO45KGdVa9Kg1FPP3r3hIcuORJF
	m47q7vLS9GomKpIaZOa5FeWokBjCNwpNWaRddSVShsCu53aeK1QnoYIzTcS4J1CZOlG6NaOw7Hk
	ywYlt95srIZxYVmfc321D7gRoB+5PzsSNI1suVwBnh/05tg4Sa5xqOEzmwIojqE5LQRh75afh4O
	LFBehZDrzB69UEBDPqYn6eteYTw/yxdLJLDAHclGSELu8fHeL1w74Eh+zpdk+2VGMyogDhrwamu
	mYqzFvaWWsCn9jiuZvCgTwTTaiMgsJRdqaLz6ULJdBzIDXY=
X-Google-Smtp-Source: AGHT+IFswzw6+N+zZ2kxh7yJJJlrqoWUt0n2Uf2f6V8sgncBDbxssN3i5Ai2EOrG4h7VARV9s4HtZg==
X-Received: by 2002:a05:6402:51cb:b0:5f3:f04b:5663 with SMTP id 4fb4d7f45d1cf-5fbe9f4eff8mr7078272a12.24.1746717475504;
        Thu, 08 May 2025 08:17:55 -0700 (PDT)
Received: from [192.168.1.248] ([87.254.1.131])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-5fb9c00ddd8sm4706896a12.58.2025.05.08.08.17.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 08:17:54 -0700 (PDT)
Message-ID: <a1f5fa12-1e0d-429c-bc15-79911c2571d1@gmail.com>
Date: Thu, 8 May 2025 16:17:42 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH][V2][next] ASoC: rt712-sdca: remove redundant else path of
 if statement
To: Mark Brown <broonie@kernel.org>, Oder Chiou <oder_chiou@realtek.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 christophe.jaillet@wanadoo.fr
References: <20250508084527.316380-1-colin.i.king@gmail.com>
 <174671514156.7345.16339489109303663127.b4-ty@kernel.org>
Content-Language: en-US
From: "Colin King (gmail)" <colin.i.king@gmail.com>
Autocrypt: addr=colin.i.king@gmail.com; keydata=
 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
 FVPMkxl2UyaayDvhrO9kNXvl1SKCpdzCMQ==
In-Reply-To: <174671514156.7345.16339489109303663127.b4-ty@kernel.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------p3qcs9yBrdpXIG9VCPHs0kvH"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------p3qcs9yBrdpXIG9VCPHs0kvH
Content-Type: multipart/mixed; boundary="------------aczClFZrqNVMn7iINuLqinRW";
 protected-headers="v1"
From: "Colin King (gmail)" <colin.i.king@gmail.com>
To: Mark Brown <broonie@kernel.org>, Oder Chiou <oder_chiou@realtek.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 christophe.jaillet@wanadoo.fr
Message-ID: <a1f5fa12-1e0d-429c-bc15-79911c2571d1@gmail.com>
Subject: Re: [PATCH][V2][next] ASoC: rt712-sdca: remove redundant else path of
 if statement
References: <20250508084527.316380-1-colin.i.king@gmail.com>
 <174671514156.7345.16339489109303663127.b4-ty@kernel.org>
In-Reply-To: <174671514156.7345.16339489109303663127.b4-ty@kernel.org>

--------------aczClFZrqNVMn7iINuLqinRW
Content-Type: multipart/mixed; boundary="------------FmEAujzWJSm0fR6Vlyq8wfAo"

--------------FmEAujzWJSm0fR6Vlyq8wfAo
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgTWFyaywNCg0KTG9va2luZyBhdCB5b3VyIHJlcG8gSSB0aGluayB5b3UgYXBwbGllZCB0
aGUgVjEgb2YgdGhlIHBhdGNoIGFuZCBub3QgdGhlIA0KVjIuDQoNCkNvbGluDQoNCk9uIDA4
LzA1LzIwMjUgMTU6MzksIE1hcmsgQnJvd24gd3JvdGU6DQo+IE9uIFRodSwgMDggTWF5IDIw
MjUgMDk6NDU6MjcgKzAxMDAsIENvbGluIElhbiBLaW5nIHdyb3RlOg0KPj4gVGhlcmUgaXMg
YW4gaWYvZWxzZSBjaGVjayB3aGVyZSB0aGUgZWxzZSBwYXJ0IGlzIGV4ZWN1dGVkIGlmDQo+
PiBhZGNfdm9sX2ZsYWcgaXMgdHJ1ZSwgdGhpcyBlbHNlIHBhdGggY2hlY2tzIGlmIGFkY192
b2xfZmxhZw0KPj4gaXMgdHJ1ZSAod2hpY2ggaXMgYSByZWR1bmRhbnQgc2Vjb25kIGNoZWNr
KSBhbmQgdGhlIGlmIHBhdGggaXMNCj4+IGFsd2F5cyB0YWtlbi4gUmVtb3ZlIHRoZSByZWR1
bmRhbnQgY2hlY2sgYW5kIHJlbW92ZSB0aGUgZWxzZQ0KPj4gcGF0aCBzaW5jZSB0aGF0IGNh
biBuZXZlciBvY2N1ci4NCj4+DQo+Pg0KPj4gWy4uLl0NCj4gDQo+IEFwcGxpZWQgdG8NCj4g
DQo+ICAgICBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dp
dC9icm9vbmllL3NvdW5kLmdpdCBmb3ItbmV4dA0KPiANCj4gVGhhbmtzIQ0KPiANCj4gWzEv
MV0gQVNvQzogcnQ3MTItc2RjYTogcmVtb3ZlIHJlZHVuZGFudCBlbHNlIHBhdGggb2YgaWYg
c3RhdGVtZW50DQo+ICAgICAgICBjb21taXQ6IDgxNDdlNzViZDVmMDk3N2Y2ZDM4OWY2Y2Ri
NGYxMDk1NmNjM2Q4OGYNCj4gDQo+IEFsbCBiZWluZyB3ZWxsIHRoaXMgbWVhbnMgdGhhdCBp
dCB3aWxsIGJlIGludGVncmF0ZWQgaW50byB0aGUgbGludXgtbmV4dA0KPiB0cmVlICh1c3Vh
bGx5IHNvbWV0aW1lIGluIHRoZSBuZXh0IDI0IGhvdXJzKSBhbmQgc2VudCB0byBMaW51cyBk
dXJpbmcNCj4gdGhlIG5leHQgbWVyZ2Ugd2luZG93IChvciBzb29uZXIgaWYgaXQgaXMgYSBi
dWcgZml4KSwgaG93ZXZlciBpZg0KPiBwcm9ibGVtcyBhcmUgZGlzY292ZXJlZCB0aGVuIHRo
ZSBwYXRjaCBtYXkgYmUgZHJvcHBlZCBvciByZXZlcnRlZC4NCj4gDQo+IFlvdSBtYXkgZ2V0
IGZ1cnRoZXIgZS1tYWlscyByZXN1bHRpbmcgZnJvbSBhdXRvbWF0ZWQgb3IgbWFudWFsIHRl
c3RpbmcNCj4gYW5kIHJldmlldyBvZiB0aGUgdHJlZSwgcGxlYXNlIGVuZ2FnZSB3aXRoIHBl
b3BsZSByZXBvcnRpbmcgcHJvYmxlbXMgYW5kDQo+IHNlbmQgZm9sbG93dXAgcGF0Y2hlcyBh
ZGRyZXNzaW5nIGFueSBpc3N1ZXMgdGhhdCBhcmUgcmVwb3J0ZWQgaWYgbmVlZGVkLg0KPiAN
Cj4gSWYgYW55IHVwZGF0ZXMgYXJlIHJlcXVpcmVkIG9yIHlvdSBhcmUgc3VibWl0dGluZyBm
dXJ0aGVyIGNoYW5nZXMgdGhleQ0KPiBzaG91bGQgYmUgc2VudCBhcyBpbmNyZW1lbnRhbCB1
cGRhdGVzIGFnYWluc3QgY3VycmVudCBnaXQsIGV4aXN0aW5nDQo+IHBhdGNoZXMgd2lsbCBu
b3QgYmUgcmVwbGFjZWQuDQo+IA0KPiBQbGVhc2UgYWRkIGFueSByZWxldmFudCBsaXN0cyBh
bmQgbWFpbnRhaW5lcnMgdG8gdGhlIENDcyB3aGVuIHJlcGx5aW5nDQo+IHRvIHRoaXMgbWFp
bC4NCj4gDQo+IFRoYW5rcywNCj4gTWFyaw0KPiANCg0K
--------------FmEAujzWJSm0fR6Vlyq8wfAo
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

--------------FmEAujzWJSm0fR6Vlyq8wfAo--

--------------aczClFZrqNVMn7iINuLqinRW--

--------------p3qcs9yBrdpXIG9VCPHs0kvH
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEEcGLapPABucZhZwDPaMKH38aoAiYFAmgcyxcFAwAAAAAACgkQaMKH38aoAiZj
ow/+KPDslF7trDshJONBvc1ZlLZnZcbwTHJ1zGWXhDe8LbpdsRtwWTMbtWlB4+gsDeJstUw9UQn3
hMf7vZ8X3mMvvgDz7ddzGY3IvH+ZZOXyJuq+/6pKl296gzaQlH+fnz/a3iuq4M4hyhzkITmTJexr
1OrjnSsNIr9wrhTYYLMtPBGNG3Iz4p4Q+q9P6oSuiJSLwmYg5zJsimdMAT7DBFNClC9AYCWgxhHL
kuM8UeURALKMS6AwNNGXq+YfCOh1Q2RZ5AJvQaxdE6/5cLquXhetMBQWCXo26+EDBLmgtQFeLM/z
cEwM1BCgLdZdlbK29oWxlsQYgCosXn3A3II5FIoKQjF0uPrgKM0EUlqL3yVPui3XmuUkBTWUCPvx
kPdehbNosH7vPZojAGHJ7vjM2DP0QFmaCxtuyHZZpbTQIL5H7uRYh6JmNzeOOFc/K7YmNxnus3AH
SuKDxW7UpNvrdMxKT51W0GhfoOT8vCmwCULbKOJRSUn4JBVxRQIK4MW8BqGDfcOZ1WUxTzMTiaqq
5CzN/GAkXim7goif6FbznyOvTmB4LE/SPWghxXVhguX9QRait0NtMKwtRLPg0H+CA9dH7qMXpOxt
IeWssJ/tqaxe9RtTNYMLlG5MIo/SvxqdUq4Wjf942eEhotqZtUMMwVRkFSxBUQRVa4770nSIUBT4
FRo=
=1Hn8
-----END PGP SIGNATURE-----

--------------p3qcs9yBrdpXIG9VCPHs0kvH--
