Received: from smtpbg151.qq.com (smtpbg151.qq.com [18.169.211.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BDD61F873E
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 14:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.169.211.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744295397; cv=none; b=JpC/2omf4hAcKd773HNKWc9keXmsTKtQo3n831RDiDupGF5xa8cT23mKG9hpbB9ltichsqyw39wkLd/WmCtubVz5Ysfir1+zAbRVetNptMmI/qo4ayAa5a6Nzt9YF/Jr/mUwSw/EC7pirHnhKf01kT+6wOeduzyh88+PGwLH2Xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744295397; c=relaxed/simple;
	bh=dK3IFcM6t2xKK6tgOUAjhKcaHEIUWTzfJ7k6D3zJ1Zw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V+2qq+QBNucnR/Oil4IXSCQZJZtiWbj4h8qUh1nZkFPGu1dNEXGhIYTQdB1dcSLJjKSWq/KkYrPWQog9AM789BqsvlxmLqaQSNP5AWRccHRgyFJ6N8rLDd0yX5z0788TkTKSnvlUCI0+e+Wt0tQAbDP1umRPEcvlNU63DyHQd90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=jP361cUF; arc=none smtp.client-ip=18.169.211.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="jP361cUF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1744295360;
	bh=dK3IFcM6t2xKK6tgOUAjhKcaHEIUWTzfJ7k6D3zJ1Zw=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=jP361cUFTnrPq+bTxkyOWnU9F2McOo6msgtWrhI2QiH3hn00UzEGTGOiyw9GAWy92
	 dbB8DdHj8sKiK8jX6dbDwb3/Icv7mV048QEhJqYfoNbtFyhb+bdUX23wHV9rmH/cDz
	 516r1Hu+h8fu17emWBold6pzofMaB6H5AT6kJsNY=
X-QQ-mid: bizesmtpip3t1744295322tada884
X-QQ-Originating-IP: 6tbrAQ8nmEdhQDr+rciEGdO+mQqzAxSxZ7hWRdv0Pmc=
Received: from [IPV6:240e:668:120a::212:232] ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 10 Apr 2025 22:28:40 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 6705139162891013110
EX-QQ-RecipientCnt: 14
Message-ID: <3A22DFCBC7B91F71+320f58c6-0fc6-4dc4-9fb0-ab0d55be697a@uniontech.com>
Date: Thu, 10 Apr 2025 22:28:39 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] riscv: KGDB: Do not inline arch_kgdb_breakpoint()
To: Alexandre Ghiti <alex@ghiti.fr>, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu
Cc: chenhuacai@kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, vincent.chen@sifive.com,
 palmerdabbelt@google.com, samuel.holland@sifive.com, zhanjun@uniontech.com,
 niecheng1@uniontech.com, guanwentao@uniontech.com,
 Huacai Chen <chenhuacai@loongson.cn>
References: <C5DCACA951B6211D+20250408095454.67390-1-wangyuli@uniontech.com>
 <ccc97669-a4dc-459f-a26f-1fdad8b4a334@ghiti.fr>
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
In-Reply-To: <ccc97669-a4dc-459f-a26f-1fdad8b4a334@ghiti.fr>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------S8JDWGDWHbIEBDkKimBFqtY5"
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: N6g2F2FiE7U+b2+sICsiPaoNjglZcleh9kBUgmt/1NS6UBYrpjx+dgkS
	2XRwjQ6iHyVDy/XkSD2vGTElrcrmrpIEvw5v3SqKgKLVNiDrGIQY8AV3LZ5WL4czF2rwONF
	x98akeAKIC12Wke672rTQG+s/hB9T7ghQeD97MTGCOt9lX9AmD5KAb4CKAsvNylAl+NOqU/
	uInXhysQlmPxSNFZdzSermLjgKBekjjuHzIXBxaXm9iS8mWVZeskksxpcJxo399H1pdO1IX
	o8xw7KH2MkjPEFxsU4s7bwu/tFxzIR/s+44YKskxy4adXA8oVbWPa5gN32Kw9YVi3bjwXJm
	Ah9Wct1svdwXKdBIvInK79bUnl0nUstW4LU8PlvSLAseaQ5YoeVsBJrZFmw/v3wCqIewJw9
	oul5Z3J2raJv7W/LnAGPK4wST6H7a3h6BQI4FNw1I7Hk98zJTYkciXiunnEUmeTSf1UCp+D
	/zma4qcntizEJ9p51G2sfwhQE2Ug0VuD3HPzZlT8zoA6r4HKaPrPuOYTEw9T0WHyRad51zQ
	KidmVjmu+b1IMyxbO8o/RwfFnAKGQw12317VjnKEBA+TmC4yzPZpZ+9n3YmWRBZcKAWXZIS
	dcUpyGM2VjpMyyknPfFleyyocDSQ87DtbiuGXcSx7zRm031OLWUsj1oegEbGrHpgaYuw6/1
	jjFr+CVJNxeBCZkRtIqCRyoESYcAn1KHQ3JINPT0UrUzlZOyQ9MzHHJC28XArRFXSZWhwJe
	r6H17vSdxg4j0/hn4O1N5XIWX6EWXJDbRWbcdlb1BmCh77+UXyNn3BEXYte77NWSvMNJR1Y
	QNtG0tLDl+HSXd24ub12iuk3fh9u7RxWV7nSo/+t64ZkF3h9/t5OLMruja1Ce5+aceIhJdw
	jmB+SU8KZTuDNe84Gkbe9UUKc74Vw6vOaFNiKtkeX2UhDfA7M8xawe/Du8r+PePWDpJKEct
	I7jzqb/k1w6CtbHmCq3l8s+6BqckKrRwkam8aVgGXio1L2dWz/4Aja9eQ/+kv9aUh4gO39G
	IVwJzBHnZD2+zQYq01xEXeMExDXimc7Y/yBAQGWc4ATDBas7BpgQGtWFRobADRzmrarEps3
	R5XaIFgrtEBhTv4wmfY4fFVCdC/R5VhHIWV3cf+6Rmn
X-QQ-XMRINFO: OWPUhxQsoeAVDbp3OJHYyFg=
X-QQ-RECHKSPAM: 0

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------S8JDWGDWHbIEBDkKimBFqtY5
Content-Type: multipart/mixed; boundary="------------GZrFkP1m02835N825iTtcfFp";
 protected-headers="v1"
From: WangYuli <wangyuli@uniontech.com>
To: Alexandre Ghiti <alex@ghiti.fr>, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu
Cc: chenhuacai@kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, vincent.chen@sifive.com,
 palmerdabbelt@google.com, samuel.holland@sifive.com, zhanjun@uniontech.com,
 niecheng1@uniontech.com, guanwentao@uniontech.com,
 Huacai Chen <chenhuacai@loongson.cn>
Message-ID: <320f58c6-0fc6-4dc4-9fb0-ab0d55be697a@uniontech.com>
Subject: Re: [PATCH v3] riscv: KGDB: Do not inline arch_kgdb_breakpoint()
References: <C5DCACA951B6211D+20250408095454.67390-1-wangyuli@uniontech.com>
 <ccc97669-a4dc-459f-a26f-1fdad8b4a334@ghiti.fr>
In-Reply-To: <ccc97669-a4dc-459f-a26f-1fdad8b4a334@ghiti.fr>

--------------GZrFkP1m02835N825iTtcfFp
Content-Type: multipart/mixed; boundary="------------AAARt9CDF6qOlbhSthz4SPYx"

--------------AAARt9CDF6qOlbhSthz4SPYx
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgQWxleA0KDQpPbiAyMDI1LzQvMTAgMjE6NDIsIEFsZXhhbmRyZSBHaGl0aSB3cm90ZToN
Cj4gSGkgV2FuZ1l1bGksDQo+DQo+DQo+IFlvdSBmb3Jnb3QgdG8gcmVwbGFjZSBrZ2RiX2Jy
ZWFraW5zdCBpbnRvIGtnZGJfY29tcGlsZWRfYnJlYWsuDQoNCk9LLCBJJ2xsIGZpeCBpdC4N
Cg0KVGhhbmtzLA0KDQo+DQo+IFlvdSBhcmUgZml4aW5nIDIgdGhpbmdzIGhlcmUsIHlvdSBu
ZWVkIHRvIHNwbGl0IHRoaXMgcGF0Y2ggaW50byAyLiANCk9LLA0KPiBBbmQgYXMgbm90ZWQg
YnkgUGFsbWVyLCB3ZSBhY3R1YWxseSBkb24ndCBuZWVkIG5vcnZjIGhlcmUsIHNvIHlvdSBj
YW4gDQo+IHJlbW92ZSBpdCBpbnN0ZWFkLg0KDQpJIGhhdmUgc29tZSBxdWVzdGlvbnMgcmVn
YXJkaW5nIHRoaXMuDQoNCklmIC5vcHRpb24gbm9ydmMgaXMgdW5uZWNlc3NhcnksIHdoYXQg
aXMgdGhlIHNpZ25pZmljYW5jZSBvZiAub3B0aW9uIA0KcHVzaC8ub3B0aW9uIHBvcD8NCg0K
U2hvdWxkIHRoZXkgYWxzbyBiZSByZW1vdmVkIGFzIHdlbGw/DQoNCkhvd2V2ZXIsIHdpbGwg
dGhpcyBzdGlsbCBmdW5jdGlvbiBwcm9wZXJseSB3aGVuIHRoZSBSSVNDLVYgQyBleHRlbnNp
b24gDQppcyBhY3RpdmU/DQoNCg0KVGhhbmtzLA0KDQotLSANCldhbmdZdWxpDQo=
--------------AAARt9CDF6qOlbhSthz4SPYx
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

--------------AAARt9CDF6qOlbhSthz4SPYx--

--------------GZrFkP1m02835N825iTtcfFp--

--------------S8JDWGDWHbIEBDkKimBFqtY5
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQRrUYzNh64o+SCoO6/F2h8wRvQL7gUCZ/fVmAUDAAAAAAAKCRDF2h8wRvQL7vAN
AP9ZXkyUlyPteWqXNYNbevQBuHewVnNCVFEP3Xxc82UKsgD+NVYB0kwhtpeDGhFXmHN7qLW6PAe0
bKpMwIJMipD2aAI=
=L7I4
-----END PGP SIGNATURE-----

--------------S8JDWGDWHbIEBDkKimBFqtY5--
