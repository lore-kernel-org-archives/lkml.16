Received: from smtpbgeu2.qq.com (smtpbgeu2.qq.com [18.194.254.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D2357C9F
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 02:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.194.254.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746586603; cv=none; b=R4TTQ8lsRL+Zg6Gzu+YU/xxR1JBUtw4E131mxDs9BgM3FMgzeohmLXBlB7DtCV7wXKV8KLnLsOtk5f0XloFadtLaP0Levri+cWCdBLPWM1oHaCitACpMmcCGq9l5NyaGKAA+3lxYSdpNv7Ff1D7j5zHn0Vr59x4in5HKj8QR3gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746586603; c=relaxed/simple;
	bh=oiB1/PfjqCcQ+7yPYGV0MVy4hltlZT9+IqFolSaBInM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gw2U0XaWO3l1NptrcyY5+qTZm+Z7sHAsdo5DuOp5BOF/aY62rS/86neqQJjM0YOP/orNIY5UFi7XVK0QF8B9rYu2yvW8sDgKd2URJxvqS+S4xYb5JXyZSsBfW2uPYX+tSLw2wA8QkV7CvHDPytUzMcKGlWsub1KapDHMcuGL/94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=cemf43Gi; arc=none smtp.client-ip=18.194.254.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="cemf43Gi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1746586543;
	bh=oiB1/PfjqCcQ+7yPYGV0MVy4hltlZT9+IqFolSaBInM=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=cemf43GiZ7RR5h8dL8JhwdmG0SgCkibmLoA5EZ21sxAxhLSPP6VWw1Chagc78LDgT
	 fAJG0XI6D+IsSHW75dQ+kvbIbKPWirF24sDeBbpOt2t/nexvmaRtF93KHdhGnoNp1X
	 JJgRKxe64zhArD6S4zw3/Pm613hTxGW/JW7mtgmk=
X-QQ-mid: zesmtpip4t1746586534t7f0ef9b6
X-QQ-Originating-IP: KyZelEfd2e9YpTzPSfs0K9MthbL+ozGEiAQKHG92X1M=
Received: from [IPV6:240e:668:120a::212:232] ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 07 May 2025 10:55:32 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 4696384252794236686
EX-QQ-RecipientCnt: 10
Message-ID: <FF9F758FB6DEBA6B+668772f9-2604-4035-bb04-b59eabf9bbd3@uniontech.com>
Date: Wed, 7 May 2025 10:55:31 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm: vmscan: Avoid signedness error for GCC 5.4
To: Matthew Wilcox <willy@infradead.org>, akpm@linux-foundation.org
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, yuzhao@google.com,
 stevensd@chromium.org, kaleshsingh@google.com, zhanjun@uniontech.com,
 niecheng1@uniontech.com, guanwentao@uniontech.com
References: <85050791B887DC13+20250506160238.799984-1-wangyuli@uniontech.com>
 <aBo3W5HNMxLdtV2p@casper.infradead.org>
Content-Language: en-US
From: WangYuli <wangyuli@uniontech.com>
Autocrypt: addr=wangyuli@uniontech.com; keydata=
 xjMEZoEsiBYJKwYBBAHaRw8BAQdAyDPzcbPnchbIhweThfNK1tg1imM+5kgDBJSKP+nX39DN
 IVdhbmdZdWxpIDx3YW5neXVsaUB1bmlvbnRlY2guY29tPsKJBBMWCAAxFiEEa1GMzYeuKPkg
 qDuvxdofMEb0C+4FAmaBLIgCGwMECwkIBwUVCAkKCwUWAgMBAAAKCRDF2h8wRvQL7g0UAQCH
 3mrGM0HzOaARhBeA/Q3AIVfhS010a0MZmPTRGVfPbwD/SrncJwwPAL4GiLPEC4XssV6FPUAY
 0rA68eNNI9cJLArOOARmgSyJEgorBgEEAZdVAQUBAQdA88W4CTLDD9fKwW9PB5yurCNdWNS7
 VTL0dvPDofBTjFYDAQgHwngEGBYIACAWIQRrUYzNh64o+SCoO6/F2h8wRvQL7gUCZoEsiQIb
 DAAKCRDF2h8wRvQL7sKvAP4mBvm7Zn1OUjFViwkma8IGRGosXAvMUFyOHVcl1RTgFQEAuJkU
 o9ERi7qS/hbUdUgtitI89efbY0TVetgDsyeQiwU=
In-Reply-To: <aBo3W5HNMxLdtV2p@casper.infradead.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------jHM03T8zLeVSaGGbMR6adtxv"
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: NwsFSQp7kFPKTVD4q6cvkQRx63Y29KpdntYKH5wc3JrjaJlIXExg8KWY
	f/cNLeM1YLJaX9yxZHRXUfgMvzFF4KehiKTlKnFDbhnlNZBQaCnvO0f9wU/qevSbYIsz/J+
	Pbt4dD8XOIFUATTFPueR2aWxfNeJUpdFuHG+6kqgmBSK1SIUKRWY6r3ekecbV3ZoHLks02A
	6HZxoS3kCYeIoDT7vv2NdMMEsphcgr8HmsIVyWBCVNQzgxjOECc75V6lVhRgjol7SgU8xrq
	6tZobZOb/HKEJfrg83qxgrb3yzhEG5/V4r4eTuybogrussYXq07Sj4yvYkK6x/pmZ7OPocx
	4jvpvhKJ+PG2/XZAHIiShimC+ZyLLj8GI49D7rf6Q9vYEekZKXVosru74zWVkNJQ0lHvavM
	w90r9ULRdo4VxzfeO/wdRR+ATV9OksXEjZqaQCK4yTO0mEP4qSp7yIgQluc1sxTXGPMxObh
	TMv+RSXUBF5WGAnGZhXwvHaMi8az7EG7AxBPbdjdN9Hs4xgYo4O/Dy33ULli0mT7sZwsvUr
	xCv55TwkTBqGfbNBBabTrVSz8EMThB7+Rau2oNxSvE6CaGV6RsXwPDFaKiv5FsX3Rb1R7i9
	fs78F7qwiqZSN7hn+04hWm74nSElI8L4qJObZLS4D5jFVpurVowRwxduWc/nUONFG9E3w+O
	Vm9gQAC/OZT9on0jmZFeDpNEmoByqFJkeSOLMcB9a0wNeq5jRh5ThmTJAfgNDzvHpq7AlnV
	hyitxt1a50XlbYDvCc9o8+k0X7hyYNLZPLkOTjzvwQrIh2j07LSs6sltOtapabfoiDYeZmj
	NrYr8QAp0fedevxTB19BXRZJ7X0sNHSrR6VhHptMzI/v53KGnVPooB7KLEPSEVyf6jmYPsb
	ZXEBxKycTaqOxyLbUsaN58cbLpi/V+6v4RHavbTc6Z5/LKe7Dv94aLAchtBNZCy1it4jNGq
	w0PNk87KvFB2L9opRkLAuu0G5M4rQDUAj62cnG88HRamjqCzcQqQrFuGqv5mnmSnTDwJl9n
	vzeVQx1Hsb0fMHbMDz3EI8g/Cw0jCHxZVDIJWzG+AmEpUp+5d5i35LmwfLHmENChAxKm+M9
	xzootI6GJLdB6/RIfvh16kvSoECEsWd7Q==
X-QQ-XMRINFO: MPJ6Tf5t3I/ycC2BItcBVIA=
X-QQ-RECHKSPAM: 0

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------jHM03T8zLeVSaGGbMR6adtxv
Content-Type: multipart/mixed; boundary="------------OqCfk29SlztYE2Mh4fmYVnAX";
 protected-headers="v1"
From: WangYuli <wangyuli@uniontech.com>
To: Matthew Wilcox <willy@infradead.org>, akpm@linux-foundation.org
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, yuzhao@google.com,
 stevensd@chromium.org, kaleshsingh@google.com, zhanjun@uniontech.com,
 niecheng1@uniontech.com, guanwentao@uniontech.com
Message-ID: <668772f9-2604-4035-bb04-b59eabf9bbd3@uniontech.com>
Subject: Re: [PATCH] mm: vmscan: Avoid signedness error for GCC 5.4
References: <85050791B887DC13+20250506160238.799984-1-wangyuli@uniontech.com>
 <aBo3W5HNMxLdtV2p@casper.infradead.org>
In-Reply-To: <aBo3W5HNMxLdtV2p@casper.infradead.org>

--------------OqCfk29SlztYE2Mh4fmYVnAX
Content-Type: multipart/mixed; boundary="------------5XS5Lw2uw9WzI37F3LQYQA07"

--------------5XS5Lw2uw9WzI37F3LQYQA07
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgTWF0dGhldyBXaWxjb3ggYW5kIEFuZHJldyBNb3J0b24sDQoNCk9uIDIwMjUvNS83IDAw
OjIyLCBNYXR0aGV3IFdpbGNveCB3cm90ZToNCj4gMS4gVGhpcyBoYXMgbm90aGluZyB0byBk
byB3aXRoIHRoZSBjb21waWxlciB2ZXJzaW9uOyB0aGUgdHlwZS1jaGVja2luZw0KPiBpcyBi
dWlsdCBpbnRvIG1pbigpLg0KDQpUaGFuayB5b3UgZm9yIHBvaW50aW5nIHRoYXQgb3V0ISBN
eSBwcmV2aW91cyBzdGF0ZW1lbnQgd2FzIGluY29ycmVjdC4NCg0KVGhlIGVycm9yIGlzIGFj
dHVhbGx5IGZyb20gdGhlIF9fdHlwZXNfb2sgY2hlY2sgd2l0aGluIHRoZSANCl9fY2FyZWZ1
bF9jbXBfb25jZSBtYWNybyBmYWlsaW5nLCB3aGljaCB0cmlnZ2VyZWQgQlVJTERfQlVHX09O
Lg0KDQpCdXQgdGhlbiwgd2h5IGRvIG5ld2VyIGNvbXBpbGVycyBjb21waWxlIHRoaXMgd2l0
aG91dCBlcnJvcj8gSXMgaXQgDQpwZXJoYXBzIGJlY2F1c2UgdGhleSBjb25zaWRlciA0VSAt
IDEgdG8gYmUgc2lnbmVkPw0KDQo+IDIuIFdlIGhhdmUgbWluX3QgZm9yIGEgcmVhc29uDQpZ
ZXMsIHVzaW5nIG1pbl90IGluc3RlYWQgb2YgbWluIGlzIGEgYmV0dGVyIGFwcHJvYWNoLg0K
PiAzLiBXaHkgaXMgYSBzaWduZWQgbWluIHRoZSByaWdodCBhbnN3ZXIgaW5zdGVhZCBvZiBh
biB1bnNpZ25lZCBtaW4/DQo+DQpUaGF0IGlzIGluZGVlZCBmYWxzZS4gSnVzdCBhcyBBbmRy
ZXcgTW9ydG9uIHNhaWQsICJuZWdhdGl2ZSB0aWVyIG51bWJlcnMgDQphcmUgbm9uc2Vuc2lj
YWwiLg0KDQpUaGFuayB5b3UgZm9yIGV2ZXJ5b25lJ3MgY29ycmVjdGlvbnMuIEknbGwgc3Vi
bWl0IGEgdjIgcGF0Y2guDQoNCi0tIA0KV2FuZ1l1bGkNCg==
--------------5XS5Lw2uw9WzI37F3LQYQA07
Content-Type: application/pgp-keys; name="OpenPGP_0xC5DA1F3046F40BEE.asc"
Content-Disposition: attachment; filename="OpenPGP_0xC5DA1F3046F40BEE.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

xjMEZoEsiBYJKwYBBAHaRw8BAQdAyDPzcbPnchbIhweThfNK1tg1imM+5kgDBJSK
P+nX39DNIVdhbmdZdWxpIDx3YW5neXVsaUB1bmlvbnRlY2guY29tPsKJBBMWCAAx
FiEEa1GMzYeuKPkgqDuvxdofMEb0C+4FAmaBLIgCGwMECwkIBwUVCAkKCwUWAgMB
AAAKCRDF2h8wRvQL7g0UAQCH3mrGM0HzOaARhBeA/Q3AIVfhS010a0MZmPTRGVfP
bwD/SrncJwwPAL4GiLPEC4XssV6FPUAY0rA68eNNI9cJLArOOARmgSyJEgorBgEE
AZdVAQUBAQdA88W4CTLDD9fKwW9PB5yurCNdWNS7VTL0dvPDofBTjFYDAQgHwngE
GBYIACAWIQRrUYzNh64o+SCoO6/F2h8wRvQL7gUCZoEsiQIbDAAKCRDF2h8wRvQL
7sKvAP4mBvm7Zn1OUjFViwkma8IGRGosXAvMUFyOHVcl1RTgFQEAuJkUo9ERi7qS
/hbUdUgtitI89efbY0TVetgDsyeQiwU=3D
=3DBlkq
-----END PGP PUBLIC KEY BLOCK-----

--------------5XS5Lw2uw9WzI37F3LQYQA07--

--------------OqCfk29SlztYE2Mh4fmYVnAX--

--------------jHM03T8zLeVSaGGbMR6adtxv
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQRrUYzNh64o+SCoO6/F2h8wRvQL7gUCaBrLpAUDAAAAAAAKCRDF2h8wRvQL7rqW
AQCHika+2XT5+ntLHoW+rbNam6gUvq4k4Lqe7O6qBH8WzQEAuiVQpHWpNsP5J/4OjlkVucdmsASe
CqYaT+MPvGFJ5gk=
=HnaG
-----END PGP SIGNATURE-----

--------------jHM03T8zLeVSaGGbMR6adtxv--
