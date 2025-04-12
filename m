Received: from mta22.hihonor.com (mta22.hihonor.com [81.70.192.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03D4D1AAC9
	for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 08:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.70.192.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744446900; cv=none; b=TmvhjhAFuCiylcseAHtYNSWoa8V/KxkjRnnUpx0QW75ZSYzfZ9UJkE5PJ0zte+oLZdnLVd/VhDahbYKdw20pHPJ6ZTntDpqZMsnHwdmWtCHGdhreIzLw8K3YJV1ONp00oMzbbgTBnHDyCAq2snSWDTaddICizK0Le0RYYzRD80o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744446900; c=relaxed/simple;
	bh=dvvVTcBGAdInku0GwbxhuyHBEJr8h6WnyLG05xZ9I9M=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=lanaFZ+tN5EcVAWbjyvqMBcz73rXLxkdcrklgCvz8/fHSjU4NlSsA+sqxkCeaSUYxCzxl0pumTcxJ7+ePMVcietUU24bna0TSeMKawnqfmoxjwalR8BjRWTiKKpQMd2kzhArKnlgBafutXBVq4eoJqs7x5Boz10Wt49+psmi30w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=honor.com; spf=pass smtp.mailfrom=honor.com; arc=none smtp.client-ip=81.70.192.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=honor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=honor.com
Received: from w003.hihonor.com (unknown [10.68.17.88])
	by mta22.hihonor.com (SkyGuard) with ESMTPS id 4ZZRft3ZXpzYlQ6q;
	Sat, 12 Apr 2025 16:34:14 +0800 (CST)
Received: from a001.hihonor.com (10.68.28.182) by w003.hihonor.com
 (10.68.17.88) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Sat, 12 Apr
 2025 16:34:49 +0800
Received: from a007.hihonor.com (10.68.22.31) by a001.hihonor.com
 (10.68.28.182) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Sat, 12 Apr
 2025 16:34:49 +0800
Received: from a007.hihonor.com ([fe80::e866:83ac:f23b:c25c]) by
 a007.hihonor.com ([fe80::e866:83ac:f23b:c25c%10]) with mapi id
 15.02.1544.011; Sat, 12 Apr 2025 16:34:49 +0800
From: gaoxu <gaoxu2@honor.com>
To: Barry Song <21cnbao@gmail.com>, Mike Rapoport <rppt@kernel.org>
CC: Andrew Morton <akpm@linux-foundation.org>, "surenb@google.com"
	<surenb@google.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, yipengxiang
	<yipengxiang@honor.com>
Subject: =?utf-8?B?5Zue5aSNOiBbUEFUQ0hdIG1tOiBzaW1wbGlmeSB6b25lX2lkeCgp?=
Thread-Topic: [PATCH] mm: simplify zone_idx()
Thread-Index: AduqEEHvK6kd7fhKS8Kk+tRXk/ygUf//psiAgAB6Y4D//Ve/sA==
Date: Sat, 12 Apr 2025 08:34:49 +0000
Message-ID: <bdf6988006d546d498ccb2b7c14c6fe0@honor.com>
References: <2d42decac5194c2c8d897b0424f0dcf3@honor.com>
 <Z_fYsyEA9hSEOoxp@kernel.org>
 <CAGsJ_4wACEvWe-Fcx9fShkF8okEVb3srGDVCn0v0QjALq7nneg@mail.gmail.com>
In-Reply-To: <CAGsJ_4wACEvWe-Fcx9fShkF8okEVb3srGDVCn0v0QjALq7nneg@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

PiANCj4gT24gRnJpLCBBcHIgMTEsIDIwMjUgYXQgMjo0MuKAr0FNIE1pa2UgUmFwb3BvcnQgPHJw
cHRAa2VybmVsLm9yZz4gd3JvdGU6DQo+ID4NCj4gPiBIaSwNCj4gPg0KPiA+IE9uIFRodSwgQXBy
IDEwLCAyMDI1IGF0IDEyOjAzOjAwUE0gKzAwMDAsIGdhb3h1IHdyb3RlOg0KPiA+ID4gc3RvcmUg
em9uZV9pZHggZGlyZWN0bHkgaW4gc3RydWN0IHpvbmUgdG8gc2ltcGxpZnkgYW5kIG9wdGltaXpl
IHpvbmVfaWR4KCkNCj4gPg0KPiA+IERvIHlvdSBzZWUgYW4gYWN0dWFsIHNwZWVkIHVwIHNvbWV3
aGVyZT8NCkFsbW9zdCBuZWdsaWdpYmxlLiBteSBzaW1wbGUgY29kZSB0ZXN0cyBzaG93ZWQgdGhl
IHBhdGNoIHByb3ZpZGVzIGFuIGF2ZXJhZ2UgaW1wcm92ZW1lbnQgb2YgfjAuMDIlLg0KVGh1cywg
aW4gdGhlIEFuZHJvaWQgMTUtNi42IGtlcm5lbCwgSSBjb25maWRlbnRseSByZXRhaW5lZCB0aGUg
b3JpZ2luYWwgem9uZV9pZHggZnVuY3Rpb24uDQooaHR0cHM6Ly9hbmRyb2lkLXJldmlldy5nb29n
bGVzb3VyY2UuY29tL2Mva2VybmVsL2NvbW1vbi8rLzM1NzgzMjIvMi9tbS9wYWdlX2FsbG9jLmMj
NzcwKQ0KDQpUaGlzIHBhdGNoIG9ubHkgZWxpbWluYXRlcyAyLTMgYXNzZW1ibHkgaW5zdHJ1Y3Rp
b25zLCBtYWtpbmcgaXQgY2hhbGxlbmdpbmcgdG8NCm9ic2VydmUgbWVhc3VyYWJsZSBwZXJmb3Jt
YW5jZSBiZW5lZml0cy4NCkhvd2V2ZXIsIHNpbmNlIHRoZSB6b25lIHN0cnVjdCBpbmNsdWRlcyBD
QUNIRUxJTkVfUEFERElORyAocmVzZXJ2aW5nIHVudXNlZCBzcGFjZSksDQphZGRpbmcgYSBuZXcg
bWVtYmVyIHZhcmlhYmxlIGRvZXMgbm90IGFsdGVyIHRoZSBzaXplIG9mIHpvbmUuIFRoaXMgbWFr
ZXMgdGhlIHBhdGNoDQplZmZlY3RpdmVseSB6ZXJvLWNvc3Qgd2hpbGUgYWNoaWV2aW5nIGEgY2xl
YW5lciBpbXBsZW1lbnRhdGlvbiBvZiB6b25lX2lkeC4NCj4gDQo+ICsxLiBDdXJpb3VzIGlmIHRo
ZXJlJ3MgZGF0YSBpbmRpY2F0aW5nIHpvbmVfaWR4IGlzIGEgaG90IHBhdGguDQpUaGVyZSBhcmUg
c2V2ZXJhbCBmdW5jdGlvbnMgaW4gdGhlIG1lbW9yeSBtYW5hZ2VtZW50IGNvZGUgdGhhdCBhcmUg
ZnJlcXVlbnRseQ0KZXhlY3V0ZWQgYW5kIHdpbGwgY2FsbCB6b25lX2lkeDoNCnJtcXVldWUoKS0+
d2FrZXVwX2tzd2FwZCgpLT56b25lX2lkeCgpDQphbGxvY19wYWdlc19idWxrX25vcHJvZigpLT5f
X2NvdW50X3ppZF92bV9ldmVudHMoKS0+em9uZV9pZHgoKQ0KDQpUaGUgcGF0Y2ggKGh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL2FsbC8yMDI0MDIyOTE4MzQzNi40MTEwODQ1LTIteXV6aGFvQGdvb2ds
ZS5jb20vKQ0Kd2lsbCBhZGQgbmV3IGhvdHNwb3QgcGF0aHMsIHdpdGggdGhlIGRldGFpbHMgYXMg
Zm9sbG93czoNCl9fem9uZV93YXRlcm1hcmtfb2soKS0+em9uZV9pc19zdWl0YWJsZSgpLT56b25l
X2lkeCgpDQp6b25lX3dhdGVybWFya19mYXN0KCktPnpvbmVfaXNfc3VpdGFibGUoKS0+em9uZV9p
ZHgoKQ0KZ2V0X3BhZ2VfZnJvbV9mcmVlbGlzdCgpLT56b25lX2lzX3N1aXRhYmxlKCktPnpvbmVf
aWR4KCkNCl9fZnJlZV9vbmVfcGFnZSgpLT56b25lX21heF9vcmRlcigpLT56b25lX2lkeCgpDQoN
CkFsdGhvdWdoIFRoZSBwYXRjaCAoaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjQwMjI5
MTgzNDM2LjQxMTA4NDUtMi15dXpoYW9AZ29vZ2xlLmNvbS8pDQpoYXMgbm90IHlldCBtZXJnZWQg
aW50byB0aGUgTGludXggbWFpbmxpbmU7IGl0IGlzIGFscmVhZHkgaW5jbHVkZWQgaW4gQW5kcm9p
ZCAxNS02LjYuDQo+IA0KDQo+ID4NCj4gPiA+IFNpZ25lZC1vZmYtYnk6IGdhbyB4dSA8Z2FveHUy
QGhvbm9yLmNvbT4NCj4gPiA+IC0tLQ0KPiA+ID4gIGluY2x1ZGUvbGludXgvbW16b25lLmggfCAz
ICsrLQ0KPiA+ID4gIG1tL21tX2luaXQuYyAgICAgICAgICAgfCAxICsNCj4gPiA+ICAyIGZpbGVz
IGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiA+ID4NCj4gPiA+IGRp
ZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L21tem9uZS5oIGIvaW5jbHVkZS9saW51eC9tbXpvbmUu
aA0KPiA+ID4gaW5kZXggNGM5NWZjYzllLi43YjE0ZjU3N2QgMTAwNjQ0DQo+ID4gPiAtLS0gYS9p
bmNsdWRlL2xpbnV4L21tem9uZS5oDQo+ID4gPiArKysgYi9pbmNsdWRlL2xpbnV4L21tem9uZS5o
DQo+ID4gPiBAQCAtOTQxLDYgKzk0MSw3IEBAIHN0cnVjdCB6b25lIHsNCj4gPiA+ICAjZW5kaWYN
Cj4gPiA+DQo+ID4gPiAgICAgICBjb25zdCBjaGFyICAgICAgICAgICAgICAqbmFtZTsNCj4gPiA+
ICsgICAgIGVudW0gem9uZV90eXBlICB6b25lX2lkeDsNCj4gPiA+DQo+ID4gPiAgI2lmZGVmIENP
TkZJR19NRU1PUllfSVNPTEFUSU9ODQo+ID4gPiAgICAgICAvKg0KPiA+ID4gQEAgLTE1MzYsNyAr
MTUzNyw3IEBAIHN0YXRpYyBpbmxpbmUgaW50IGxvY2FsX21lbW9yeV9ub2RlKGludCBub2RlX2lk
KQ0KPiB7IHJldHVybiBub2RlX2lkOyB9Ow0KPiA+ID4gIC8qDQo+ID4gPiAgICogem9uZV9pZHgo
KSByZXR1cm5zIDAgZm9yIHRoZSBaT05FX0RNQSB6b25lLCAxIGZvciB0aGUgWk9ORV9OT1JNQUwN
Cj4gem9uZSwgZXRjLg0KPiA+ID4gICAqLw0KPiA+ID4gLSNkZWZpbmUgem9uZV9pZHgoem9uZSkg
ICAgICAgICAgICAgICAoKHpvbmUpIC0NCj4gKHpvbmUpLT56b25lX3BnZGF0LT5ub2RlX3pvbmVz
KQ0KPiA+ID4gKyNkZWZpbmUgem9uZV9pZHgoem9uZSkgICAgICAgICAgICAgICAoKHpvbmUpLT56
b25lX2lkeCkNCj4gPiA+DQo+ID4gPiAgI2lmZGVmIENPTkZJR19aT05FX0RFVklDRQ0KPiA+ID4g
IHN0YXRpYyBpbmxpbmUgYm9vbCB6b25lX2lzX3pvbmVfZGV2aWNlKHN0cnVjdCB6b25lICp6b25l
KQ0KPiA+ID4gZGlmZiAtLWdpdCBhL21tL21tX2luaXQuYyBiL21tL21tX2luaXQuYw0KPiA+ID4g
aW5kZXggOTY1OTY4OWI4Li5hN2Y3MjY0ZjEgMTAwNjQ0DQo+ID4gPiAtLS0gYS9tbS9tbV9pbml0
LmMNCj4gPiA+ICsrKyBiL21tL21tX2luaXQuYw0KPiA+ID4gQEAgLTE0MjUsNiArMTQyNSw3IEBA
IHN0YXRpYyB2b2lkIF9fbWVtaW5pdCB6b25lX2luaXRfaW50ZXJuYWxzKHN0cnVjdA0KPiB6b25l
ICp6b25lLCBlbnVtIHpvbmVfdHlwZSBpZHgsDQo+ID4gPiAgICAgICBhdG9taWNfbG9uZ19zZXQo
JnpvbmUtPm1hbmFnZWRfcGFnZXMsIHJlbWFpbmluZ19wYWdlcyk7DQo+ID4gPiAgICAgICB6b25l
X3NldF9uaWQoem9uZSwgbmlkKTsNCj4gPiA+ICAgICAgIHpvbmUtPm5hbWUgPSB6b25lX25hbWVz
W2lkeF07DQo+ID4gPiArICAgICB6b25lLT56b25lX2lkeCA9IGlkeDsNCj4gPiA+ICAgICAgIHpv
bmUtPnpvbmVfcGdkYXQgPSBOT0RFX0RBVEEobmlkKTsNCj4gPiA+ICAgICAgIHNwaW5fbG9ja19p
bml0KCZ6b25lLT5sb2NrKTsNCj4gPiA+ICAgICAgIHpvbmVfc2VxbG9ja19pbml0KHpvbmUpOw0K
PiA+ID4gLS0NCj4gPiA+IDIuMTcuMQ0KPiA+DQo+ID4gLS0NCj4gPiBTaW5jZXJlbHkgeW91cnMs
DQo+ID4gTWlrZS4NCj4gDQo+IFRoYW5rcw0KPiBCYXJyeQ0K
