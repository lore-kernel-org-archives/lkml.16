Received: from smtpbgau2.qq.com (smtpbgau2.qq.com [54.206.34.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2360F85270
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 07:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.34.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738914913; cv=none; b=nC0kAHs/+2g+nfaU/8dibsQG1vsu7MeFbB+Q8VQilcIrhqx4TjPJSzimR5uRSGjThk+zrkd0Rtw/V7RTyRJ2IaIGatn6I5vktsZgz1WiihpkMylRTqxFc80umkYACudMBIVlRyDJ9QkZFycJCAHuWSLxKKU7FUe7FKhabj9GybY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738914913; c=relaxed/simple;
	bh=wGbqvDznr4VTnrU3MKi8+15deAmB6L1S3KpIwW/VnnI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HhB4Q3LRECa1+IbM/QWRNO6ejhZnNXB4GN2qH/8n689/NlJhq+Ka7e2tM5xLWo6R7AtMCdv65rZh2jKWder9PgJOfkQQL+UQHLKvAU/aJDMphxRbQ/fBah0qI4Z/8RrykJ5tT++ZAmS7sAyYXnC1rJ9oW4feG0BTz8bRYzpaqP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=none smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=HSkqiEvW; arc=none smtp.client-ip=54.206.34.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="HSkqiEvW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1738914879;
	bh=wGbqvDznr4VTnrU3MKi8+15deAmB6L1S3KpIwW/VnnI=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=HSkqiEvWWhkKKvftmNhlNKXQWQQvmcWbfhq+m2FJVjm/zXOfhqO5n8WyBfS3OmUSO
	 OMnpLVHug5JOQ4JmK9r1/fM2ptkeatQcGLQaBhR8PvJ4EOlikM6PuiW8iBrRIi+xXm
	 G5bEP6JxRL4dtRON18nXdKvCxdna1rkbYKuNpkmU=
X-QQ-mid: bizesmtpip2t1738914845t9ygc3f
X-QQ-Originating-IP: L74ayVCyRr8DgXobD8nmZ8Rh1t95u7MFqVBPRySYWWw=
Received: from [IPV6:240e:668:120a::253:10f] ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 07 Feb 2025 15:54:03 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 1342129331751891599
Message-ID: <DD62CDB3C1812AAF+6ce777e6-4a79-4d10-bfaa-65021ba64821@uniontech.com>
Date: Fri, 7 Feb 2025 15:54:03 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] LoongArch: kernel: proc: Use str_yes_no() helper function
To: chenhuacai@kernel.org, kernel@xen0n.name, jiaxun.yang@flygoat.com,
 guanwentao@uniontech.com
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org,
 zhanjun@uniontech.com, chenlinxuan@uniontech.com
References: <FC3B31E885291324+20250207065201.191475-1-wangyuli@uniontech.com>
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
In-Reply-To: <FC3B31E885291324+20250207065201.191475-1-wangyuli@uniontech.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------0dEN4XOE1tK7MKSteKtOyIap"
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: OHRfOczwgzMVIqzhFmMhxk0YUTiZAAzqtwnEzxUwYq+LwsPQuFTg7X72
	hhxgr9xgnCE2PKU1tHsY3adS7T8eG1dAmyMm7ZF5QgHT3n1cjCCaaEQsoZ5W3nFjd4sZpTf
	CcDRm59Wz9ROcRD/sTRyn+ecp9BaK4WVLSr9oqb7G02xCy3OaMuyV/OnFpw4NFni2hTPj1x
	GO/lIHiK9260aGkXTq6rQwDxlAFI4MUsYnHZjv31RV3x3vzk57YcvE4d8gJGDQ523A8NEeW
	Jv+m/IkfQI/OqgUuNkLgunk4+vbsyVhZpL3u1heyHAs2qKpEVjCxeDLE5BRCtcjcl58kQeS
	Q866srFfKT8MViB58bVLymYB6Rmtn0Q8NOW+Ab2+mOoBjI+++mb1D5QWeZDs4bhQZ9+KFmY
	VwZCZvEOM8SW6TPeRz+TFj8xRFiStKIf4YHzTEt3n750J6ZA5ZUGGDvnbMWaW4TkQjfHOno
	pSdxqVp/k40dcEDp6wWzKpQ/qZcCK6a66vxwuBDK5BVsrCODzhUFe4KcTHnYS0i4C1OSBMk
	2L9/CUy8yfS+oVHAOuAffo5HqCfzjwkt/+At557Ml+uHRBddbiD+8Tff/c+gsEO4UVu0Pfh
	2wjKw9UnhgilixRDQTanX6Je9D/oQmICeprmaM/EM2RPqnRpcuZSGP+lppoK9wUgcsZMSRK
	DZf3KW6sDMsuGF/Jn1vP8mv3OZk8LiQIODMxwyy37u7mqW1S9CZesNTmSCZaxP6sByqvNJ0
	Gnl/472xolXZNSjw5ajDt3M6Ixpt1pUEHSbFk0rKQCRkPVbiMasB5LY58NqNrfFweIJTvyh
	/+8icBax/IcPyuwo9bhp6JnNEnCizoA6xOTE8mhLQLsoezRHAB5FiTtl1h3ZoJiPmVqvWsG
	Xg2tfsHO1uvba0zIPe50GKBtM+er0F2YYNkQfd8cDFoNrTpOMvRMYoWndf+HGVehwdU525y
	6/20Svq7+4eETOPyifJdil5PpgV5zGcTaiJsSGURHSG078+9C6QHg7RIk04M1JpYdBOHFV1
	ZEBrwEYCIICCZ7see6JMWlKoeNXzID+TczH6Z1J2n0+tcqkjiywGSpwYtW5kA=
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
X-QQ-RECHKSPAM: 0

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------0dEN4XOE1tK7MKSteKtOyIap
Content-Type: multipart/mixed; boundary="------------3df0ieXDWIFVC60HWoTY0xvS";
 protected-headers="v1"
From: WangYuli <wangyuli@uniontech.com>
To: chenhuacai@kernel.org, kernel@xen0n.name, jiaxun.yang@flygoat.com,
 guanwentao@uniontech.com
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org,
 zhanjun@uniontech.com, chenlinxuan@uniontech.com
Message-ID: <6ce777e6-4a79-4d10-bfaa-65021ba64821@uniontech.com>
Subject: Re: [PATCH] LoongArch: kernel: proc: Use str_yes_no() helper function
References: <FC3B31E885291324+20250207065201.191475-1-wangyuli@uniontech.com>
In-Reply-To: <FC3B31E885291324+20250207065201.191475-1-wangyuli@uniontech.com>

--------------3df0ieXDWIFVC60HWoTY0xvS
Content-Type: multipart/mixed; boundary="------------ET6VDXiHLZdpFkKVNbHCrZKp"

--------------ET6VDXiHLZdpFkKVNbHCrZKp
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

RGVwcmVjYXRlZC4NCg0KT24gMjAyNS8yLzcgMTQ6NTIsIFdhbmdZdWxpIHdyb3RlOg0KPiBS
ZW1vdmUgaGFyZC1jb2RlZCBzdHJpbmdzIGJ5IHVzaW5nIHRoZSBzdHJfeWVzX25vKCkgaGVs
cGVyIGZ1bmN0aW9uLg0KPg0KPiBTaW1pbGFyIHRvIGNvbW1pdCBjNGEwYTRhNDVhNDUgKCJN
SVBTOiBrZXJuZWw6IHByb2M6IFVzZSBzdHJfeWVzX25vKCkNCj4gaGVscGVyIGZ1bmN0aW9u
IikuDQo+DQo+IENvLWRldmVsb3BlZC1ieTogV2VudGFvIEd1YW4gPGd1YW53ZW50YW9AdW5p
b250ZWNoLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogV2VudGFvIEd1YW4gPGd1YW53ZW50YW9A
dW5pb250ZWNoLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogWXVsaSBXYW5nIDx3YW5neXVsaUB1
bmlvbnRlY2guY29tPg0KPiAtLS0NCj4gICBhcmNoL2xvb25nYXJjaC9rZXJuZWwvcHJvYy5j
IHwgNyArKystLS0tDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgNCBk
ZWxldGlvbnMoLSkNCj4NCj4gZGlmZiAtLWdpdCBhL2FyY2gvbG9vbmdhcmNoL2tlcm5lbC9w
cm9jLmMgYi9hcmNoL2xvb25nYXJjaC9rZXJuZWwvcHJvYy5jDQo+IGluZGV4IDZjZTQ2ZDky
ZjFmMS4uNTZhMjMwMjM4YzljIDEwMDY0NA0KPiAtLS0gYS9hcmNoL2xvb25nYXJjaC9rZXJu
ZWwvcHJvYy5jDQo+ICsrKyBiL2FyY2gvbG9vbmdhcmNoL2tlcm5lbC9wcm9jLmMNCj4gQEAg
LTkxLDEwICs5MSw5IEBAIHN0YXRpYyBpbnQgc2hvd19jcHVpbmZvKHN0cnVjdCBzZXFfZmls
ZSAqbSwgdm9pZCAqdikNCj4gICAJaWYgKGNwdV9oYXNfbGJ0X21pcHMpCXNlcV9wcmludGYo
bSwgIiBsYnRfbWlwcyIpOw0KPiAgIAlzZXFfcHJpbnRmKG0sICJcbiIpOw0KPiAgIA0KPiAt
CXNlcV9wcmludGYobSwgIkhhcmR3YXJlIFdhdGNocG9pbnRcdDogJXMiLA0KPiAtCQkgICAg
ICBjcHVfaGFzX3dhdGNoID8gInllcywgIiA6ICJub1xuIik7DQo+ICsJc2VxX3ByaW50Ziht
LCAiSGFyZHdhcmUgV2F0Y2hwb2ludFx0OiAlcyIsIHN0cl95ZXNfbm8oY3B1X2hhc193YXRj
aCkpOw0KPiAgIAlpZiAoY3B1X2hhc193YXRjaCkgew0KPiAtCQlzZXFfcHJpbnRmKG0sICJp
d2F0Y2ggY291bnQ6ICVkLCBkd2F0Y2ggY291bnQ6ICVkXG4iLA0KPiArCQlzZXFfcHJpbnRm
KG0sICIsIGl3YXRjaCBjb3VudDogJWQsIGR3YXRjaCBjb3VudDogJWQiLA0KPiAgIAkJICAg
ICAgY3B1X2RhdGFbbl0ud2F0Y2hfaXJlZ19jb3VudCwgY3B1X2RhdGFbbl0ud2F0Y2hfZHJl
Z19jb3VudCk7DQo+ICAgCX0NCj4gICANCj4gQEAgLTEwNCw3ICsxMDMsNyBAQCBzdGF0aWMg
aW50IHNob3dfY3B1aW5mbyhzdHJ1Y3Qgc2VxX2ZpbGUgKm0sIHZvaWQgKnYpDQo+ICAgCXJh
d19ub3RpZmllcl9jYWxsX2NoYWluKCZwcm9jX2NwdWluZm9fY2hhaW4sIDAsDQo+ICAgCQkJ
CSZwcm9jX2NwdWluZm9fbm90aWZpZXJfYXJncyk7DQo+ICAgDQo+IC0Jc2VxX3ByaW50Ziht
LCAiXG4iKTsNCj4gKwlzZXFfcHJpbnRmKG0sICJcblxuIik7DQo+ICAgDQo+ICAgCXJldHVy
biAwOw0KPiAgIH0NCkJlc3Qgd2lzaGVzLA0KLS0gDQpXYW5nWXVsaQ0K
--------------ET6VDXiHLZdpFkKVNbHCrZKp
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

--------------ET6VDXiHLZdpFkKVNbHCrZKp--

--------------3df0ieXDWIFVC60HWoTY0xvS--

--------------0dEN4XOE1tK7MKSteKtOyIap
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQRrUYzNh64o+SCoO6/F2h8wRvQL7gUCZ6W8GwUDAAAAAAAKCRDF2h8wRvQL7pgq
AP4jUwZ9NkkXkUpQxAYjQapmUry1+Ckzr2nDa33XQ5vH+AEAxc0C7dFKXEanJNyHYbyK5x9cND+J
9rrIr0ccnBWZ1Qo=
=TWX8
-----END PGP SIGNATURE-----

--------------0dEN4XOE1tK7MKSteKtOyIap--
