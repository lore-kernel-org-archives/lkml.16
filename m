Received: from smtpbguseast2.qq.com (smtpbguseast2.qq.com [54.204.34.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0488D1A3160;
	Tue, 15 Apr 2025 15:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744729816; cv=none; b=icofpjQyrbGJupM2exAyiovN1R345Nbe/XatyY6GJ/9Z4UcFhHk1FLOokb05sSicg4Y7XPQuICTNFsbWQ1x/8LnEXWrTx5KzgT1ZeZdy6V5uYEUSbzoKZ/un62VBqdnWCv/VdN0NuUXyf9Qe9EQbnldjH2PEm9OH2K/I30TRZ1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744729816; c=relaxed/simple;
	bh=YzBPupIzIE3olUJLaZrFCV3IDRNSdvCv+HlsMCjlAvE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cbKqGLe33V18yhECPe7RZ/wsqHx55Gh0TYay4fWcDzV8/GS1emeQDBAn3hr0UKmfqeySe4FNW/1UOtPedehKlTDg9rdaz7WKbTWUDAxSgP1YphenR/jnYXtOx/00gbARsdWigzNtsFlpM/ZH7g8vlIQEQW/n+Dx61b3jihy/Muo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=ae6ADcWT; arc=none smtp.client-ip=54.204.34.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="ae6ADcWT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1744729790;
	bh=YzBPupIzIE3olUJLaZrFCV3IDRNSdvCv+HlsMCjlAvE=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=ae6ADcWTgZFv93SqnXm6cCCKOPwuv9OOuygoMIiZXrBnAcp9P+fHWBBpjMVtJBZkY
	 zjyqZ8aaimWYDiSsl3fLQh3JFvh/thdL7dOLLg2IHEDAjjN9cB5vS1HwYkW3PbwEci
	 l63I3qWkwu2i21fEvy6SIqRhHeGkRc/xFiJRgJ10=
X-QQ-mid: zesmtpip2t1744729780t0dbbf6a9
X-QQ-Originating-IP: rTFwT3p1Lt7ir1CwAmPkdNI8Hx294LLO15b6yZVH9k8=
Received: from [IPV6:240e:668:120a::212:232] ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 15 Apr 2025 23:09:37 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 13868571241981791234
EX-QQ-RecipientCnt: 19
Message-ID: <6FA8AEB5634BC9F0+99411846-6783-44bf-80c4-8b46ad9d046b@uniontech.com>
Date: Tue, 15 Apr 2025 23:09:37 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mseal sysmap: enable LoongArch
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: corbet@lwn.net, chenhuacai@kernel.org, kernel@xen0n.name,
 akpm@linux-foundation.org, jeffxu@chromium.org, Liam.Howlett@oracle.com,
 kees@kernel.org, hca@linux.ibm.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, xry111@xry111.site,
 tglx@linutronix.de, thomas.weissschuh@linutronix.de, Jason@zx2c4.com,
 zhanjun@uniontech.com, niecheng1@uniontech.com, guanwentao@uniontech.com
References: <433B5132A1535C98+20250415134933.531084-1-wangyuli@uniontech.com>
 <3de559d6-be19-44bc-ba8f-4c52d4bca684@lucifer.local>
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
In-Reply-To: <3de559d6-be19-44bc-ba8f-4c52d4bca684@lucifer.local>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------qxeJIoDL6ag0P77WHSUGvJWb"
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: N6VZ0oGM3c0LGFoSDW5NMNoQVJqwy+NUFnKL2woLBHdH/MYHrcXWiNnR
	aj4dO1oc5X2iZDuBLHbXfIF1hpthKa5LS+pHpBlJ0iqgvmDXT9bj3zMFWQ+ILOi2we69Qwn
	STpy4U2eFc4FexvxT2QBpiBOFKd1uVXix0LY/wxvH51jEJ75T/euAeogkTpxhMcqJ7cp3cy
	DrQxlAj9v3VMH3SgCnNfzxkOaDTqtk2mnL1/+8aMSa5ox7LKLWm6uHPFUh95+2NKAyKnJpA
	HacrWGduffc5POzoyZCJ1CUWjECaboOS5ezJARUGH17fLxaWqtTFglf+Igf+Kl7oTFBMsio
	9wj12sTOW0mtrMnYm1n0yRNoo33SiPQFtWJQ2IGLJREhD0inKkG6BcTK5nlETCsaJm7m3X5
	otMLjUUQuvaR4x2AWu1oKRBxBabn3OvTtBH3Q73s0G23DuSYiaRpDtLRrTBWrvDODSOXby+
	sz0YgMI8XUWE8nKhxET2qAjANdvmRhaLGFn6XNh3+MnYQJcZUqzxxsD3osctr7VVn8/5yal
	NEz6q9xSD3X576sq0jiixobx7MIGbyE/vBtkkXoTDlW4eOsx2W0D/g3pZvfD55rv3MFLNF3
	SnLNn0KcNq3qMwDk5wkvCFc0boApXYkr0B4G6wLAt/w2S4Q23FwZG/ociJ5sVGLHTYctH/O
	Mj3LQ+nggtB4CZ0ToRVhRPGv0y412eeaTfouHRX0Npy75ad2yjeI0JmJwcer0b2eIK4i813
	/nfn+HuRE5BQ8TWp2JeNWRpYy8C/yJ0TSP+qVvx1wwWeTZv54hl5pP0POVau8RN4xpPr961
	C5YMz+sdF2BB24hcTPwX0mBHtPDQ3i7HAsYsSMhpnbeamelxGo3S/TuI7xE32SVpNR4bp/e
	K5ZxN6omQ595tveYe0bj3fW2EVdhs9Y5PwWQoG27ewD/y3fpcaSfwaiSSKiUfODUJLoFHzM
	xEq3WVNH6IR/5RdFfC6uf+9F6aIQKlpCkMTi4jIzcrCJlDrprqcKR2VKzvToFAqUR6Ocaih
	32db7Dsv/PEDSYIwBjDk7ri5XSgkdwl0Nu/T2FXmM1LIpm4t2Nx0qht2K3iKwXyZFT5TCYD
	TfqYPwgEGaE
X-QQ-XMRINFO: Nq+8W0+stu50PRdwbJxPCL0=
X-QQ-RECHKSPAM: 0

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------qxeJIoDL6ag0P77WHSUGvJWb
Content-Type: multipart/mixed; boundary="------------0Mgo3dQXuQGeXIjHqoBmYfqo";
 protected-headers="v1"
From: WangYuli <wangyuli@uniontech.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: corbet@lwn.net, chenhuacai@kernel.org, kernel@xen0n.name,
 akpm@linux-foundation.org, jeffxu@chromium.org, Liam.Howlett@oracle.com,
 kees@kernel.org, hca@linux.ibm.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, xry111@xry111.site,
 tglx@linutronix.de, thomas.weissschuh@linutronix.de, Jason@zx2c4.com,
 zhanjun@uniontech.com, niecheng1@uniontech.com, guanwentao@uniontech.com
Message-ID: <99411846-6783-44bf-80c4-8b46ad9d046b@uniontech.com>
Subject: Re: [PATCH] mseal sysmap: enable LoongArch
References: <433B5132A1535C98+20250415134933.531084-1-wangyuli@uniontech.com>
 <3de559d6-be19-44bc-ba8f-4c52d4bca684@lucifer.local>
In-Reply-To: <3de559d6-be19-44bc-ba8f-4c52d4bca684@lucifer.local>

--------------0Mgo3dQXuQGeXIjHqoBmYfqo
Content-Type: multipart/mixed; boundary="------------rvgDtAGELhvjk2xX0XuctW51"

--------------rvgDtAGELhvjk2xX0XuctW51
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgTG9yZW56byBTdG9ha2VzLA0KDQpPbiAyMDI1LzQvMTUgMjE6NTgsIExvcmVuem8gU3Rv
YWtlcyB3cm90ZToNCj4gSSdtIHN1cmUgaXQncyBmaW5lLCBidXQgSSBhbSB5ZXQgdG8gZW5j
b3VudGVyIHNvbWVib2R5IGVuYWJsaW5nIHRoaXMgZm9yIGFuDQo+IGFyY2ggYW5kIHNheWlu
ZyAnSSBoYXZlIGNoZWNrZWQgdG8gZW5zdXJlIHdlIGluIG5vIHdheSByZWx5IG9uIHJlbWFw
cGluZw0KPiB0aGUgVkRTTywgVlZBUiBvciBhbnkgb3RoZXIgc3BlY2lhbCBtYXBwaW5nJy4N
Cj4NCj4gQmVjYXVzZSBpZiB5b3UgaGF2ZW4ndCwgZG9pbmcgdGhpcyBicmVha3MgeW91ciBh
cmNoLg0KPg0KPiBJIGhhdGUgdG8gc291bmQgbGlrZSBhIGdydW1weSBtYWludGFpbmVyLCBi
dXQgY291bGQgSSBqdXN0IGFzayB0byBjaGVjaw0KPiB3aGV0aGVyIHlvdSBoYXZlLCBpbmRl
ZWQsIGNvbmZpcm1lZCB0aGlzPyA6KQ0KDQpJJ3ZlIGRvbmUgc29tZSByZWFsLXdvcmxkIHRl
c3RpbmcgYmVmb3JlIHN1Ym1pdHRpbmcuDQoNCkJlZm9yZSBlbmFibGluZyBNU0VBTF9TWVNU
RU1fTUFQUElOR1MsIHZkc28vdnZhciBpcyBub3Qgc2VhbGVkOyBhZnRlciANCmVuYWJsaW5n
IE1TRUFMX1NZU1RFTV9NQVBQSU5HUywgdmRzby92dmFyIGlzIHNlYWxlZC4NCg0KSSB0ZXN0
ZWQgdGhlIGJvb3QgYW5kIHNodXRkb3duIG9mIHRoZSBEZWVwaW4gMjMgZGlzdHJpYnV0aW9u
LCB3ZWIgQnJvd3NlIA0Kd2l0aCBGaXJlZm94LCBhbmQgZG9jdW1lbnQgZWRpdGluZyB3aXRo
IExpYnJlT2ZmaWNlIGJvdGggYmVmb3JlIGFuZCANCmFmdGVyIGVuYWJsaW5nIGl0LCBhbmQg
SSBkaWRuJ3QgZW5jb3VudGVyIGFueSBpc3N1ZXMgDQooTVNFQUxfU1lTVEVNX01BUFBJTkdT
IGRvZXMgY2F1c2UgYSBub3RpY2VhYmxlIHBlcmZvcm1hbmNlIGRyb3Agd2hlbiANCm91dHB1
dHRpbmcgaW1hZ2VzIHZpYSBzaW1wbGVfZHJtLCBidXQgSSB0aGluayB0aGlzIGlzIGV4cGVj
dGVkKS4NCg0KT2YgY291cnNlLCBJIGFsc28gcmFuIHRoZSBzZWxmLXRlc3RzIHByb3ZpZGVk
IGJ5IA0KdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvbXNlYWxfc3lzdGVtX21hcHBpbmdzLCBh
bmQgYWxsIHRlc3RzIHBhc3NlZC4NCg0KSSB3YW50ZWQgdG8gY29uZmlybSBpZiAiYnJlYWtz
IHlvdXIgYXJjaCIgcmVmZXJzIHRvIHRoZSBhYm92ZT8NCg0KRG8gSSBuZWVkIHRvIHBlcmZv
cm0gYW55IG90aGVyIGtpbmRzIG9mIHRlc3RzIHRvIGVuc3VyZSB0aGUgdmFsaWRpdHkgb2Yg
DQp0aGlzIHN1Ym1pc3Npb24/DQoNCj4gSWYgc28gdGhlbiBhbGwgZ29vZC4NCj4NCj4gSSBh
bHNvIHRoaW5rIHdlIGhhdmUgYSB0YWJsZSBzb21ld2hlcmUgaW4gYSBkb2MgdGhhdCBuZWVk
cyB1cGRhdGluZyB0aGVuPw0KPiBKZWZmLCBjYW4geW91IGNvbmZpcm0/DQo+DQo+IFRoYW5r
cyENCj4NClRoYW5rcyENCg0KLS0gDQpXYW5nWXVsaQ0K
--------------rvgDtAGELhvjk2xX0XuctW51
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

--------------rvgDtAGELhvjk2xX0XuctW51--

--------------0Mgo3dQXuQGeXIjHqoBmYfqo--

--------------qxeJIoDL6ag0P77WHSUGvJWb
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQRrUYzNh64o+SCoO6/F2h8wRvQL7gUCZ/52sQUDAAAAAAAKCRDF2h8wRvQL7t26
AP9g8eC6pE/UHxSiRciVWD3NRZ1j75nHUptxYK9xZRgztQD/b4iqClisFDRwOIRdTxN34fmswXGi
YvcGB9A1WHXM9QQ=
=eoXb
-----END PGP SIGNATURE-----

--------------qxeJIoDL6ag0P77WHSUGvJWb--
