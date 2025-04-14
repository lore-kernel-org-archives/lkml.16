Received: from smtpbgsg1.qq.com (smtpbgsg1.qq.com [54.254.200.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE82D26B959;
	Mon, 14 Apr 2025 11:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744629131; cv=none; b=AHMK3Ob/NGMCgZ7sbILBhismSTJRmwUhbLT5FxVlxSvSOW80tG+qbqUHjf04TFmLFzykyWIgM+U1g2HRJ6+dEW1ujbYNdOWcahtQCswz6d+X3HZoBzksVcqtJp98JRcN2TIFPG+hXBc9M4k3XqKQFrnw+yOov/daaV/o4KwaM1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744629131; c=relaxed/simple;
	bh=lORcb9m4t9mzbdgmugR7mPLJcYroDKZKkInsJ6OO9lM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZQBbYrNhRPgr9L3nxAE8/9AXDaRSoW8TNpaqxQ64R9IaQpyghAd5t04p7PHW03IKymlZtZQDbSyxDNjfmRHGk77T+4iDMG0jghdIAjFoWMeH0nUdEzxivgdvQOQw5RKEwwSHnyh+C0uK9Qd4h1R7EgUhSK5/0k0wMtV6Zo6ks1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=ZU699fq5; arc=none smtp.client-ip=54.254.200.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="ZU699fq5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1744629051;
	bh=lORcb9m4t9mzbdgmugR7mPLJcYroDKZKkInsJ6OO9lM=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=ZU699fq5vxkY/aYaTBwcVpg5TzaiUrud7fZshUK8lb0RskHhpfvT3C19wM+gZPzb9
	 T2ny1gC2zOPBQnXFijQST/qLFlxYJ/IlzC/37ywmLuUfIebwiGG4KNPMlE83cMKxcC
	 tSx45VVQzU6RU6aGstuV+yv08z/8gxXIxmdS+d9w=
X-QQ-mid: zesmtpip3t1744629041te8fcaa17
X-QQ-Originating-IP: zm72CyPFSN3HxWel4IMJZZMuN5OE/OD/Wr97GB9Tz5A=
Received: from [IPV6:240e:668:120a::212:232] ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 14 Apr 2025 19:10:39 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 13134516107291588432
EX-QQ-RecipientCnt: 12
Message-ID: <1F0B4039A1EC1361+e24aa199-17e5-4cb3-9218-52412a60924e@uniontech.com>
Date: Mon, 14 Apr 2025 19:10:39 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] ALSA: korg1212: snd_korg1212_prepare: Rename
 del_timer in comment
To: Philipp Stanner <pstanner@redhat.com>
Cc: akpm@linux-foundation.org, guanwentao@uniontech.com,
 linux-kernel@vger.kernel.org, mingo@kernel.org, niecheng1@uniontech.com,
 tglx@linutronix.de, zhanjun@uniontech.com, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Bjorn Helgaas <bhelgaas@google.com>,
 SOUND <linux-sound@vger.kernel.org>
References: <37A1CE32D2AEA134+20250414042251.61846-1-wangyuli@uniontech.com>
 <590769506CF46967+20250414042629.63019-5-wangyuli@uniontech.com>
 <70bb676764099754d10c4be2f095e0fb829f233a.camel@redhat.com>
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
In-Reply-To: <70bb676764099754d10c4be2f095e0fb829f233a.camel@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------sPjNKp0JqAX05b2Dt0lPHU60"
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: N/BaP5J2bFjvMRKaFiRNfFFXWkSTsi195Q8MQKFHtgSYvGxddYOCDzeX
	SOlx7SvUoVseCExqlbF/1DPzV1b8X1TqVD8BcSMNKq1yocBcqF8xC/x2uGtQ68+anWA9+Xy
	HlvAJPsqnxHPT5WcTOeHRdwC8x7dV15nXmqZl6Viq6ZZh8AbB8ccKl7goxiuJdKGu5wt4OS
	wMBeOLPwhkKapkBsRdHep/iwhr7XT1VDua1ubx4Cur7581dzyRR+ZVKtjf+tIJ/I/Dn35Qc
	NBJHS4d5puNTgIRuNfqqIkAV7I54QF8LbsNewXk13eVBMcEsZkMlXH7OcVAOvxGfKVUgN/m
	0DLbb4OyMaQ/mBqWq2EQOI70LaXvEZ2SFNWkT4ETBERXXwFA9yT0lNUmCJsp1Lbo6I9ScG8
	R1yEQvWg0poeUMLfPTsyK46zXwvTWFfAO3jwyLN1M9elaOsTNN90iwOV7Lr7HD56Sj0nbRa
	0qCkfviaB1D4DOm1WW7h+o5K22MSKDeW2NLjYncvzsoCrsXVoM1VTMu84T7/c/SgYQlK6O1
	4MIN8p10DVwRhnX8+dJt8wUlPqcct44oN/bnd1G3JYgs4rJ3iNZRoMRgC7pMZLsSxo2LHb3
	1nceT2xzl0s8rSJJji9Su4woGvakzTxe3XkYtXtrUKHnlnhH8xFwYS8FWg2E1r40DXRT5GD
	zl4E7FAnqCIRSTcTPe65EmCZ8CThoob9kjIH5tXWcOwpIvDnjQBBiPo3yLLHnuJHYLd+Nbv
	J/hX+DP424nQImvCx6BA55i0K4DsQwWtC0q/jfCSDLe6aBpZstz3MtkX0mfxB1aLMgg/qGG
	xCPQ6cbFKAU06I7cWEZoNKuhWwyZCaUEWNdzSk96zCDzIT5+OrWdQFoLX3aveNLDGC+5pJm
	RbrUT4MHJBhsLDl/MrUASr2s16alFHtziJ9J9viICZf6N6g6+qC9aMqmJD8DKFixiG50K+1
	H7fHeG0Dg1J4RCwTvpYbrnKsc8rxUipcvyb0PTcZ4Kf2kDwRJL0hB7ZTzFIj+d0hJAceiDh
	QXiw0GhpP+EiC164nvpjEUNrNSJ3eEBwliuWkWpSopylqaFgLtOXQDhb3yp1TY0uPaniUTm
	0u0GEtRcjxzSEbcoKfaO6i8kcR7yFp0NTWhoLeH7ZVQ
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
X-QQ-RECHKSPAM: 0

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------sPjNKp0JqAX05b2Dt0lPHU60
Content-Type: multipart/mixed; boundary="------------05aqf5MoCRa2ZHVvHIRAzqRJ";
 protected-headers="v1"
From: WangYuli <wangyuli@uniontech.com>
To: Philipp Stanner <pstanner@redhat.com>
Cc: akpm@linux-foundation.org, guanwentao@uniontech.com,
 linux-kernel@vger.kernel.org, mingo@kernel.org, niecheng1@uniontech.com,
 tglx@linutronix.de, zhanjun@uniontech.com, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Bjorn Helgaas <bhelgaas@google.com>,
 SOUND <linux-sound@vger.kernel.org>
Message-ID: <e24aa199-17e5-4cb3-9218-52412a60924e@uniontech.com>
Subject: Re: [PATCH v2 5/5] ALSA: korg1212: snd_korg1212_prepare: Rename
 del_timer in comment
References: <37A1CE32D2AEA134+20250414042251.61846-1-wangyuli@uniontech.com>
 <590769506CF46967+20250414042629.63019-5-wangyuli@uniontech.com>
 <70bb676764099754d10c4be2f095e0fb829f233a.camel@redhat.com>
In-Reply-To: <70bb676764099754d10c4be2f095e0fb829f233a.camel@redhat.com>

--------------05aqf5MoCRa2ZHVvHIRAzqRJ
Content-Type: multipart/mixed; boundary="------------R1Q0LKs0bvWxDHn0Z8pAJmdN"

--------------R1Q0LKs0bvWxDHn0Z8pAJmdN
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgUGhpbGlwcCBTdGFubmVyLA0KDQpPbiAyMDI1LzQvMTQgMTY6MzQsIFBoaWxpcHAgU3Rh
bm5lciB3cm90ZToNCj4gV291bGRuJ3QgaXQgYmUgYmV0dGVyIHRvIGp1c3QgcmVtb3ZlIGFs
bCB0aGF0PyBPciBhdCBsZWFzdCBkb2N1bWVudA0KPiB3aGF0IGl0IGlzIGdvb2QgZm9yPw0K
DQpUaGlzIGNvZGUgY29tZXMgZnJvbSBjb21taXQgNGQ2ZGNmNjBiOSAoIkFMU0EgdXBkYXRl
IMKgwqAtIGRvY3VtZW50YXRpb24gDQogwqDCoC0gY29udHJvbCBBUEkgLSBhZGRlZCBtdWx0
aS1lbGVtZW50cyB0byByZWR1Y2UgbWVtb3J5IHVzYWdlIMKgwqAtIA0KaW1wcm92ZWQgcHJl
YWxsb2NhdGlvbiBvZiBETUEgYnVmZmVycyDCoMKgLSBDUzQ2eHggZHJpdmVyIC0gYWRkZWQg
c3VwcG9ydCANCmZvciBzZWNvbmRhcnkgY29kZWMgwqDCoC0gSERTUCBkcml2ZXIgLSBiaWcg
dXBkYXRlIMKgwqDCoMKgLSBmaXJtd2FyZSBpcyANCmxvYWRlZCB3aXRoIGhkc3B0b29sIG5v
dyDCoMKgLSBwbWFjIGRyaXZlciB1cGRhdGVzIChmaXhlZCBvb3BzIGFuZCBiZWVwIA0Kc3R1
ZmYpIMKgwqAtIFZJQTgyeHggZHJpdmVyIHVwZGF0ZWQgwqDCoC0geW1mcGNpIGRyaXZlciB1
cGRhdGVkIMKgwqAtIGRyaXZlcnMgDQp1cGRhdGVkIHRvIG5ldyBQblAgbGF5ZXIgwqDCoMKg
wqAtIHdhdmVmcm9udCwgYWQxODE2YSwgY3M0MjN4LCBlczE4eHgsIA0KaW50ZXJ3YXZlLCBv
cGwzc2EyLCBjbWk4MzMwIikgaW4gdGhlIGhpc3RvcnkgdHJlZSBbMV0gYXMgcGFydCBvZiBh
IGh1Z2UgDQpwYXRjaC4NCg0KSSBjb3VsZG4ndCBmaW5kIGFueSB1c2VmdWwgaW5mb3JtYXRp
b24gYWJvdXQgdGhpcyBzcGVjaWZpYyBjb2RlIHdpdGhpbiANCnRoYXQgY29tbWl0Lg0KDQpT
aW5jZSBJJ20gdW5jZXJ0YWluIGlmIHdlIHRydWx5IGRvbid0IG5lZWQgaXQgKHRoaXMgY29k
ZSBpcyBtYXJrZWQgd2l0aCANCiJGSVhNRSIgYWJvdmUpLCBJJ3ZlIGtlcHQgdGhpcyBjb21t
ZW50Lg0KDQpGdXJ0aGVybW9yZSwgdGhpcyBkcml2ZXIgaGFzIG90aGVyIHNlY3Rpb25zIG9m
IGNvbW1lbnRlZC1vdXQgY29kZSBhcyANCndlbGwsIHNvIGEgbW9yZSBjb21wcmVoZW5zaXZl
IGNsZWFudXAgb2YgdGhpcyBkcml2ZXIgbWlnaHQgYmUgYSBiZXR0ZXIgDQphcHByb2FjaCBp
biB0aGUgZnV0dXJlLg0KDQpJZiBwb3NzaWJsZSwgSSdkIGFsc28gYmUgaGFwcHkgdG8gY29u
dHJpYnV0ZSB0byB0aGF0IGVmZm9ydC4NCg0KSG93ZXZlciwgdGhpcyBjb21taXQgaXNuJ3Qg
aW50ZW5kZWQgZm9yIHRoYXQgcHVycG9zZS4NCg0KSXRzIHNvbGUgYWltIGlzIHRvIGNsZWFu
IHVwIHRoZSBjb21tZW50IHRoYXQgd2VyZSBtaXNzZWQgYnkgY29tbWl0IA0KOGZhNzI5MmZl
ZTVjICgidHJlZXdpZGU6IFN3aXRjaC9yZW5hbWUgdG8gdGltZXJfZGVsZXRlX3N5bmMiKSBh
bmQgc2hvdWxkIA0KaGF2ZSBiZWVuIHVwZGF0ZWQuDQoNCg0KWzFdLiANCmh0dHBzOi8vd2Vi
LmdpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90Z2x4L2hpc3Rvcnku
Z2l0L2NvbW1pdC8/aWQ9NGQ2ZGNmNjBiOTgwMDBjMjA0YjMwOWI1MjljMTBiMmEzODg0Nzg5
ZQ0KDQoNClRoYW5rcywNCg0KLS0gDQpXYW5nWXVsaQ0K
--------------R1Q0LKs0bvWxDHn0Z8pAJmdN
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

--------------R1Q0LKs0bvWxDHn0Z8pAJmdN--

--------------05aqf5MoCRa2ZHVvHIRAzqRJ--

--------------sPjNKp0JqAX05b2Dt0lPHU60
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQRrUYzNh64o+SCoO6/F2h8wRvQL7gUCZ/ztLwUDAAAAAAAKCRDF2h8wRvQL7o76
AP4vSp2RHZenKwJ+Yu32HKSYi0EElx32Xd/hb6RALXlZogEA1En6z9Tw1+yNPa0hFLuwdkKuuwaw
qS44lwKdZLFzJAg=
=fnlv
-----END PGP SIGNATURE-----

--------------sPjNKp0JqAX05b2Dt0lPHU60--
