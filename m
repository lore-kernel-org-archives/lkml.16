Received: from smtpbgbr1.qq.com (smtpbgbr1.qq.com [54.207.19.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D49C20297C
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 15:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.19.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747322030; cv=none; b=sDRi0Q9FtEZDj0UK3/M+3PxPj/OtZd5ZsmN6BzKQgkDvAM0Juo10VCA1Yc0No7C8S1d82nbgAHziFiWntfN2WTcb+Gcp4koTLMT6QwRey9ZCrHuR/0Lu1IWYIIpk19FQSPnCtrr0yEz9HYudTTPGiQiFQTNYzkBH9vigqP8dV2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747322030; c=relaxed/simple;
	bh=5MMJuVluFmfWh8yzeoLAFlerzf1UBspzoQLusknihCY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tMYgHn5SaKuqiV9iYbGGotw1sGR600skr70XHNc7L7LB3l1hT4eyZ8G5X0BPdz9ZPVf+x7d11SAzpuA3K4BdUQhrXgO//dyUHxpAaPXGU8KhwaF00inB0L5j7ZKwoerlt8yOf4kLtw8TBrSMZ1bsPlw6hzXE5IlExQqNFLnF1iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=ZFVaJlbJ; arc=none smtp.client-ip=54.207.19.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="ZFVaJlbJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1747321907;
	bh=5MMJuVluFmfWh8yzeoLAFlerzf1UBspzoQLusknihCY=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=ZFVaJlbJyy2UO/OW/ddgqTWM53yZGvElXXAEB91rAXcPzrB9hXEX+4t0Vo6z7O6jH
	 zBkB4qmIudd7pXEy4jpADXyem+EWPCFAptxJODwYmSGIXNkDXRrPYgnpeLjhrzMOKb
	 QDqY3WQs0NK1K0ioU1nmeNrz/M4ahn5Qk76GNFoc=
X-QQ-mid: zesmtpip4t1747321869tf4fc534d
X-QQ-Originating-IP: jWprH5ntMYNRrxPOyL7VxfVWxHkMrvwmaS4IlrjOn2A=
Received: from [IPV6:240e:668:120a::212:232] ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 15 May 2025 23:11:07 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 6442505970655113230
EX-QQ-RecipientCnt: 12
Message-ID: <3E7C55B094E45D50+384fb80c-9d7d-408f-bef4-05d3f508c308@uniontech.com>
Date: Thu, 15 May 2025 23:11:07 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm: vmscan: Avoid signedness error for GCC 5.4
To: David Laight <david.laight.linux@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, yuzhao@google.com,
 stevensd@chromium.org, kaleshsingh@google.com, zhanjun@uniontech.com,
 niecheng1@uniontech.com, guanwentao@uniontech.com,
 Matthew Wilcox <willy@infradead.org>, Nathan Chancellor <nathan@kernel.org>
References: <85050791B887DC13+20250506160238.799984-1-wangyuli@uniontech.com>
 <20250506162438.91fffc7ef924d9653ed0f503@linux-foundation.org>
 <74D5BC8AD7E5511A+13242b55-13e5-463a-9422-f863d58b6af6@uniontech.com>
 <20250510112419.749652a7@pumpkin>
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
In-Reply-To: <20250510112419.749652a7@pumpkin>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------b4tZn80DjacMEE6mZnoMOHqA"
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: M72q9RTiR0RXM2WODWc4MFdTJWG4JEmIwPmtKMaXKVmF/qh7eSmNaJRA
	fUoRT0I6jrwYkFHDZsJc1d5Z1oNoHLTY0memQhAz0yrriWNvvSY/ojUUi6NR39udHS+0iDC
	mhiSWXDFs+1k4tiFjanFSHkmVoTXoULHEpmLOlyfRU1Ck6RhmZX6JnEDq/0c8TnvIMJVaAl
	GHIZlkfecYMV0Y1cz+ZcnZk/hXmDUEuJFvtOSuVJ7XPgzYCceGNfes3G1DKl3br6Lr1G1vW
	6L6/o+eVjsjnqEjZr1wcenR+LM/TM6yUfu/pZYftmloLIqGlTFfOTd1YvwzvnXJkzjLFyF+
	nsx14WB3OGZCnJJknZbyYqG0Q19jWDDESXi0zYoKC7Fq9rOLKnGPqXJdzYlkS49EdQCluOd
	Io4ib5+6gmDFJtf5bnSycNef7x6nJqfYLvCxwkg9I+jPkKUtHui+HH2Pk83+pvmdeh7sYbK
	FdbvRtMnHqzjba1cQ8264nTC3Oo7KRvQPgU+bW5TveqBXJ5/1QphsvfyvlwLF/s5s/iHrqv
	1L/U7woVv2X5gmtcQpvcTpWOS8ujP4z144xB8tMUEVc3Waowm6yFSSU57DIL2uGbFGzfz5U
	wbuupJg7nj3AFhISpc4Ecq61y019vpIPOP7diU6/OOik/ZzC5GOAUMbF0YKZ4d80yBH3sa9
	bkp1u3ylrM2ISluYAfDZXsTNmmEOvO/8o/z97eSE5/LdXkEHpSeXDFOFpWFVe00p7e/5o5M
	fuhf9ctNWXsVKo9aTP29zTeDt8D5wcfpOnkbRcIDJkw9cCe16oNPCROKOTLzAkQdoA1PbZJ
	+m17gIOSEIIz+gS87PBpzyTO2WhF6hOXm58qDf3v2dciiVZgwJhauwDVN6EmfifTo1s0sTZ
	OU447MPyjuGDPhR6tIAt786whyxq3k1rG435T+4zm2WwK/WgmIqOt1uAX4K7h6QKK9Cq4Ib
	Aj7bkBmD82gKgew8k9FoTbmZGLcJqcucz2I9OlKs71B0IYtaUeJPVBn7KemK3WMxY0D7tnH
	RL7VfnI5GxQ8TQNSTwVLTVA4Pn3SXGHyCjxxYyFKvt57x3U8aCVXVxsughd0IK5D7iJTSbi
	1LtCMDGZOjcQV98E1RFH473TAL7JexzlD/vt8iEABmP8VwyUqhzvWE=
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
X-QQ-RECHKSPAM: 0

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------b4tZn80DjacMEE6mZnoMOHqA
Content-Type: multipart/mixed; boundary="------------m4ETDRhQ4Wf0XTAfyPoUw0dA";
 protected-headers="v1"
From: WangYuli <wangyuli@uniontech.com>
To: David Laight <david.laight.linux@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, yuzhao@google.com,
 stevensd@chromium.org, kaleshsingh@google.com, zhanjun@uniontech.com,
 niecheng1@uniontech.com, guanwentao@uniontech.com,
 Matthew Wilcox <willy@infradead.org>, Nathan Chancellor <nathan@kernel.org>
Message-ID: <384fb80c-9d7d-408f-bef4-05d3f508c308@uniontech.com>
Subject: Re: [PATCH] mm: vmscan: Avoid signedness error for GCC 5.4
References: <85050791B887DC13+20250506160238.799984-1-wangyuli@uniontech.com>
 <20250506162438.91fffc7ef924d9653ed0f503@linux-foundation.org>
 <74D5BC8AD7E5511A+13242b55-13e5-463a-9422-f863d58b6af6@uniontech.com>
 <20250510112419.749652a7@pumpkin>
In-Reply-To: <20250510112419.749652a7@pumpkin>

--------------m4ETDRhQ4Wf0XTAfyPoUw0dA
Content-Type: multipart/mixed; boundary="------------58xP3Dg6OuI4051EX5ej3BKg"

--------------58xP3Dg6OuI4051EX5ej3BKg
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgYWxsLA0KDQpBcG9sb2dpZXMgZm9yIHRoZSBkZWxheWVkIHJlc3BvbnNlLg0KDQpGaXJz
dCwgdGhhbmsgeW91IGFsbCBmb3IgeW91ciByZW1pbmRlcnMgd2hpY2ggaGVscGVkIG1lIHVu
ZGVyc3RhbmQgDQpleGFjdGx5IHdoYXQgY2F1c2VkIHRoZSBHQ0MgNS40IGNvbXBpbGUgZXJy
b3IsIHRoZSBwcm9wZXIgZml4LCBhbmQgdGhlIA0KaXNzdWUgZGVzY3JpcHRpb24uDQoNCkhv
d2V2ZXIsIHRoaXMgY2hhbmdlIG1pZ2h0IGJlIHVubmVjZXNzYXJ5IG5vdy4NCg0KVGhhbmtz
IHRvIE5hdGhhbiBDaGFuY2VsbG9yJ3Mgbm90ZSBpbiBhbm90aGVyIGVtYWlsIHRoYXQgdGhl
IG1pbmltdW0gDQp2ZXJzaW9uIG9mIEdDQyBpcyBiZWluZyBidW1wZWQgdG8gOC4xLlsxXQ0K
DQpNeSB0ZXN0aW5nIGNvbmZpcm1zIHRoYXQgR0NDIDguMSBubyBsb25nZXIgZXhoaWJpdHMg
dGhpcyBpc3N1ZS4NCg0KWzFdLiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNTA1
MDgxNjMxMzguR0E4MzQzMzhAYXgxNjIvDQoNClRoYW5rcywNCi0tIA0KV2FuZ1l1bGkNCg==

--------------58xP3Dg6OuI4051EX5ej3BKg
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

--------------58xP3Dg6OuI4051EX5ej3BKg--

--------------m4ETDRhQ4Wf0XTAfyPoUw0dA--

--------------b4tZn80DjacMEE6mZnoMOHqA
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQRrUYzNh64o+SCoO6/F2h8wRvQL7gUCaCYECwUDAAAAAAAKCRDF2h8wRvQL7qAT
AQClN3rmnucFabXg6oSPzxu2515V1t0DMMbzLhYokJzrwAD/Z/5FyPS24iQhB3v6+tKXMKZ/gqn8
Xbn3N4uRzmVmtgo=
=O07e
-----END PGP SIGNATURE-----

--------------b4tZn80DjacMEE6mZnoMOHqA--
