Received: from smtpbg151.qq.com (smtpbg151.qq.com [18.169.211.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBEDD1A9B23;
	Fri,  7 Feb 2025 08:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.169.211.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738917860; cv=none; b=cWsHseaA9nOwabL82sZ364luJxJAlfi2Xy8+DMGULbrn4wri34tiNWlecoO6uc7zKgj36FDxyKL4BhoZbjUy/8RVgCPquPeUHmHFCmg216yILs+XNbTUmTIQpfOFYVpF/xKnaEM68drA4lK7PLN6qfDNqiR5N8VB5EFz/Eebpug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738917860; c=relaxed/simple;
	bh=4AMVKnA4Yl9VxnoZHymOByxuJ0NjohQqFooKmFgj2l4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tadfXDhCgUo6/jNu9dX3OOKQA6EFfG08PWaNkAmDoZtlo/lx4SCx/aow0jsYy7OFqBOnPsiz/GKz9j5GyjD1qnpZx7P5nZotnfSPirZDD0RUcx+q2U3SmXR8x2Wk3ZqWy5i3JdpEsrUit7BwG2Y8eOM3EOFJ8m3fD7MyNV3gsNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=WR2d6udS; arc=none smtp.client-ip=18.169.211.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="WR2d6udS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1738917806;
	bh=4AMVKnA4Yl9VxnoZHymOByxuJ0NjohQqFooKmFgj2l4=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=WR2d6udSkWrihIYIzMZ1yhfxC1TBEXMD3YCWDPYTsm8pHYxueu0YBbKcsClXUd9W3
	 pbBrrbiFg2aH7Uqxq0tDOIhI5juPdSSpXDR7JnXN3FNKyn+cZrGFyxvrwciJvTSmvc
	 kuBGEN/gv3puwPBCWQtDxWlCil4AvgxeDIWu9fZE=
X-QQ-mid: bizesmtpip4t1738917773t7qcvwr
X-QQ-Originating-IP: aQmi5+1bY/uehK58/CAnbsc6+7yO2zQA6RLCQs5rDek=
Received: from [IPV6:240e:668:120a::253:10f] ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 07 Feb 2025 16:42:51 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 4169232281569066851
Message-ID: <F8B5E18BC516C367+a0f1236a-bd3b-43b8-8861-dc5f4c0dcfe8@uniontech.com>
Date: Fri, 7 Feb 2025 16:42:51 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] docs/zh_CN: Update the translation of dev-tools/ubsan
 to v6.14-rc1
To: Yanteng Si <si.yanteng@linux.dev>, alexs@kernel.org, corbet@lwn.net,
 dzm91@hust.edu.cn
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 horms@kernel.org, zhanjun@uniontech.com, guanwentao@uniontech.com,
 chenlinxuan@uniontech.com
References: <EE89209B6353C426+20250207031812.15023-1-wangyuli@uniontech.com>
 <fb3c5ec4-eabc-48c0-bf0b-d20cad978b4f@linux.dev>
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
In-Reply-To: <fb3c5ec4-eabc-48c0-bf0b-d20cad978b4f@linux.dev>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------AMdez96DqXl9pgQhSGFaW310"
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: NhW0RaXPB1Ljml702OJWiJwt9r5aar9Os3FbRygzpRpFdpIeCb+vAM6N
	oCmJYRmhR+aA78w3caA6wmQTGmCDAK0Ji9hEA0s4qlV7aX1D7lGOcCDkGEfQqeP7RB6c90b
	NDk9WKMeqLPzHV+oxJ/Y8+2D9bsY+8E8viXi40kApkwWpCHcVSpji8HF7BXupUTuiF2j4c5
	o4hERZka8NxIWXnzVtD64vbsWBWGwwaa3SX4p7aenwgjvPKErOmlx/mNEVN5lGdxiStAocr
	7O2tkxtj4jPsPbY7RpADUs0ZNxKTNWa8uKmM7pCjpPndQjehGZYPs+OfP605ef2vJcpr5Ol
	XfJVLoZkNfLXrJI7NgCsv0pfSyQIUVE+aGvnZfpn0X1Ctlo7mhpsHjC2b5xPUgVKRE4axV4
	GDyNTGnIU2ZqhTWfkLMTrgv6BW0XXb0LwfutzmLsR+nbQR0komTWp+f64CbP38gJliRZNty
	eA5w2N6I8ZBk8wDnPFJeXTskfGopRcOtXqCG3FoN0bMr7JrLULxZFS05opaogWF9VRKi2tV
	LavVe48NrqWM2SsMVVw5oxO6HaNroyzM4qsl3WvAxADZxs7OV/2urQ9U/Cf/aZfazgXmYvX
	Y8RRc3D8dejaZKXX1s96h/rHJPL639BGKVAQvdcSuyGe/rRgNE88cS/QAnPKS69Aed61g/F
	fw5qDStlD0h1qiUV9g+Tuprw0ctd94i2ENfsGUUF4ZV9gmoADXoPnY9jigpaXWLx7tnOqj8
	m5gHFJVJuiIdMlHeuXjA/x1N0r1GcNeZkyvdOqdGuAb0t/Uul31fq26Bhp4KznCmmMh/9Yg
	7B7u8riLAHgHLWwDJAbf/9sIG+L/CqbrkbgnU2M4Tg8vweU+1thN5ZoKg2Gssy+aDg9Dx+F
	OoH8enkKTUuxpFtWVwjuWt6jI0IRhF+m8p8HKbc5kY5crB2cfndtTiNre4e0ZwYBhUP7NGd
	Owjxl/RX5cyO2pn/1Ck+Hv6av722ClXVbEaNr5j2H7Kq2woV90B9Eii32yYLwcoj/2gZOM7
	l2RgHwDDBx/m306uFwIa+EfptZOBUliQxRUvQCKT45kDLJut1lmj8oLSeM6wmnlt+JVVyK9
	ZaXalQ9LPo13jDHvcWZcl06t+UYAllWhVJnFpG6wkF/
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
X-QQ-RECHKSPAM: 0

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------AMdez96DqXl9pgQhSGFaW310
Content-Type: multipart/mixed; boundary="------------b4sOYHXODrU0YHePDnnnDNUh";
 protected-headers="v1"
From: WangYuli <wangyuli@uniontech.com>
To: Yanteng Si <si.yanteng@linux.dev>, alexs@kernel.org, corbet@lwn.net,
 dzm91@hust.edu.cn
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 horms@kernel.org, zhanjun@uniontech.com, guanwentao@uniontech.com,
 chenlinxuan@uniontech.com
Message-ID: <a0f1236a-bd3b-43b8-8861-dc5f4c0dcfe8@uniontech.com>
Subject: Re: [PATCH v2] docs/zh_CN: Update the translation of dev-tools/ubsan
 to v6.14-rc1
References: <EE89209B6353C426+20250207031812.15023-1-wangyuli@uniontech.com>
 <fb3c5ec4-eabc-48c0-bf0b-d20cad978b4f@linux.dev>
In-Reply-To: <fb3c5ec4-eabc-48c0-bf0b-d20cad978b4f@linux.dev>

--------------b4sOYHXODrU0YHePDnnnDNUh
Content-Type: multipart/mixed; boundary="------------V4Zpgc4Ie0BYFZljWPt6Ol30"

--------------V4Zpgc4Ie0BYFZljWPt6Ol30
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjAyNS8yLzcgMTY6MzcsIFlhbnRlbmcgU2kgd3JvdGU6DQoNCj4NCj4+ICsuLiBfY25f
dWJzYW46DQo+IHdlIGRvbid0IG5lZWQgdGhlIHRhZy4NCk9LLCB3aWxsIHNlbmQgcGF0Y2gg
djMuDQo+PiDCoCDCoCDmnKrlrprkuYnooYzkuLrmtojmr5LliYIgLSBVQlNBTg0KPj4gwqAg
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09DQo+PiBAQCAtNTUsMzAgKzY0
LDIwIEBAIEdDQ+iHqjQuOS54IFsxX10g77yI6K+m6KeBIGBgLWZzYW5pdGl6ZT11bmRlZmlu
ZWRgYCANCj4+IOmAiemhueWPiuWFtuWtkOmAiemhue+8ieeJiA0KPj4gwqAgwqAg5L2/55So
5aaC5LiL5YaF5qC46YWN572u5ZCv55SoVUJTQU46Og0KPj4gwqAgLcKgwqDCoCBDT05GSUdf
VUJTQU49eQ0KPj4gLQ0KPj4gLeS9v+eUqOWmguS4i+WGheaguOmFjee9ruajgOafpeaVtOS4
quWGheaguDo6DQo+PiAtDQo+DQo+PiAtwqDCoMKgwqDCoMKgwqAgQ09ORklHX1VCU0FOX1NB
TklUSVpFX0FMTD15DQo+PiArwqAgQ09ORklHX1VCU0FOPXkNCj4NCj4gUGxlYXNlIGtlZXAg
dGhlIGluZGVudGF0aW9uIGxlbmd0aCBjb25zaXN0ZW50IHdpdGggdGhlIG9yaWdpbmFsIG9u
ZS4NCj4NCj4NCkl0IGFscmVhZHkgZG9lcy4NCg0KUGxlYXNlIHNlZSBjb21taXQgOTE4MzI3
ZTliN2ZmYjQ1MzIxY2JiNGI5Yjg2YjU4ZWM1NTVmZTZiMyAoInVic2FuOiBSZW1vdmUNCg0K
Q09ORklHX1VCU0FOX1NBTklUSVpFX0FMTCIpJ3MgY2hhbmdlIG9mIA0KRG9jdW1lbnRhdGlv
bi9kZXYtdG9vbHMvdWJzYW4ucnN0IGZvcg0KDQp0aGUgZGV0YWlscy4NCg0KDQpUaGFua3Ms
DQoNCi0tIA0KV2FuZ1l1bGkNCg==
--------------V4Zpgc4Ie0BYFZljWPt6Ol30
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

--------------V4Zpgc4Ie0BYFZljWPt6Ol30--

--------------b4sOYHXODrU0YHePDnnnDNUh--

--------------AMdez96DqXl9pgQhSGFaW310
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQRrUYzNh64o+SCoO6/F2h8wRvQL7gUCZ6XHiwUDAAAAAAAKCRDF2h8wRvQL7jAR
AP9c0n8n2XmIBpq+7Fxt2lxtuSRdudSiWj/mEJra6mnciwEAkExH+ysItjfxSJ+uXmKrtHMcjjpt
0SEiJEh+YOn2iQg=
=PUt8
-----END PGP SIGNATURE-----

--------------AMdez96DqXl9pgQhSGFaW310--
