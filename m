Received: from outboundhk.mxmail.xiaomi.com (outboundhk.mxmail.xiaomi.com [118.143.206.90])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38EC13074BF
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 03:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=118.143.206.90
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750820808; cv=none; b=WLKll200bpugVxbDTvgbfQ+1ya1r1cAkK2n11mAMyFMbyO99XVAReawWFv0HQyAMybj/fE5rJCZkix7OdIL4zVKUKvUNEgR5XKlGQjJKvYUGJdaN47W3G/oyDNO0sbkoPZKvXclOxEW8TIDegZ51OCQTmoOhwnQgJF64oxPnz30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750820808; c=relaxed/simple;
	bh=/nvn8sGirlYLcE4sgPudY9wrp9atW0WJBPYbWZk257c=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=kExzZSsBu0XLgR6SPUbbX8FlSHCs4MWS7Zpeon/qJRF30A4pw/xK3yPaVzbG58EwuwonjDY0Nt2a/ifBVUGrVuG5minTS3cFxfi61frkl7Zry6NXpmfR+rvDEE6l0wpq7ig/nWs2TjAnlU7ZZSQp8eIxms6mF9qSLaMHcbx26Z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=xiaomi.com; spf=pass smtp.mailfrom=xiaomi.com; arc=none smtp.client-ip=118.143.206.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=xiaomi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xiaomi.com
X-CSE-ConnectionGUID: 6GE/u/CcQSCHQrYibRIOSA==
X-CSE-MsgGUID: lZBYxcdjQCu8ISDLQ3vnEQ==
X-IronPort-AV: E=Sophos;i="6.16,263,1744041600"; 
   d="scan'208";a="118501602"
From: Huang Jianan <huangjianan@xiaomi.com>
To: "linux-f2fs-devel@lists.sourceforge.net"
	<linux-f2fs-devel@lists.sourceforge.net>, "chao@kernel.org"
	<chao@kernel.org>, "jaegeuk@kernel.org" <jaegeuk@kernel.org>
CC: =?utf-8?B?546L6L6J?= <wanghui33@xiaomi.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	=?utf-8?B?55ub5YuH?= <shengyong1@xiaomi.com>
Subject: Re: [PATCH v2] f2fs: avoid splitting bio when reading multiple pages
Thread-Topic: [PATCH v2] f2fs: avoid splitting bio when reading multiple pages
Thread-Index: AQHb4Clh9I6efU1o50+xgPlNPKHQtrQStZiA
Date: Wed, 25 Jun 2025 03:05:32 +0000
Message-ID: <2af57d55-1dd8-44ab-85fe-7ad181a42434@xiaomi.com>
References: <20250617055542.218681-1-huangjianan@xiaomi.com>
 <20250618081705.260239-1-huangjianan@xiaomi.com>
In-Reply-To: <20250618081705.260239-1-huangjianan@xiaomi.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="utf-8"
Content-ID: <6E81B61A40C2BC49AAF723C7BD7D9A78@xiaomi.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

T24gMjAyNS82LzE4IDE2OjE3LCBKaWFuYW4gSHVhbmcgd3JvdGU6DQo+IFdoZW4gZmV3ZXIgcGFn
ZXMgYXJlIHJlYWQsIG5yX3BhZ2VzIG1heSBiZSBzbWFsbGVyIHRoYW4gbnJfY3BhZ2VzLiBEdWUN
Cj4gdG8gdGhlIG5yX3ZlY3MgbGltaXQsIHRoZSBjb21wcmVzc2VkIHBhZ2VzIHdpbGwgYmUgc3Bs
aXQgaW50byBtdWx0aXBsZQ0KPiBiaW9zIGFuZCB0aGVuIG1lcmdlZCBhdCB0aGUgYmxvY2sgbGV2
ZWwuIEluIHRoaXMgY2FzZSwgbnJfY3BhZ2VzIHNob3VsZA0KPiBiZSB1c2VkIHRvIHByZS1hbGxv
Y2F0ZSBidmVjcy4NCj4gVG8gaGFuZGxlIHRoaXMgY2FzZSwgYWxpZ24gbWF4X25yX3BhZ2VzIHRv
IGNsdXN0ZXJfc2l6ZSwgd2hpY2ggc2hvdWxkIGJlDQo+IGVub3VnaCBmb3IgYWxsIGNvbXByZXNz
ZWQgcGFnZXMuDQo+DQo+IFNpZ25lZC1vZmYtYnk6IEppYW5hbiBIdWFuZyA8aHVhbmdqaWFuYW5A
eGlhb21pLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogU2hlbmcgWW9uZyA8c2hlbmd5b25nMUB4aWFv
bWkuY29tPg0KPiAtLS0NCj4gQ2hhbmdlcyBzaW5jZSB2MToNCj4gLSBVc2UgYWxpZ25lZCBucl9w
YWdlcyBpbnN0ZWFkIG9mIG5yX2NwYWdlcyB0byBwcmUtYWxsb2NhdGUgYnZlY3MuDQo+DQo+ICAg
ZnMvZjJmcy9kYXRhLmMgfCAxMiArKysrKysrKystLS0NCj4gICAxIGZpbGUgY2hhbmdlZCwgOSBp
bnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9k
YXRhLmMgYi9mcy9mMmZzL2RhdGEuYw0KPiBpbmRleCAzMWU4OTI4NDI2MjUuLjJkOTQ4NTg2ZmVh
MCAxMDA2NDQNCj4gLS0tIGEvZnMvZjJmcy9kYXRhLmMNCj4gKysrIGIvZnMvZjJmcy9kYXRhLmMN
Cj4gQEAgLTIzMDMsNyArMjMwMyw3IEBAIGludCBmMmZzX3JlYWRfbXVsdGlfcGFnZXMoc3RydWN0
IGNvbXByZXNzX2N0eCAqY2MsIHN0cnVjdCBiaW8gKipiaW9fcmV0LA0KPiAgIAkJfQ0KPiAgIA0K
PiAgIAkJaWYgKCFiaW8pIHsNCj4gLQkJCWJpbyA9IGYyZnNfZ3JhYl9yZWFkX2Jpbyhpbm9kZSwg
YmxrYWRkciwgbnJfcGFnZXMsDQo+ICsJCQliaW8gPSBmMmZzX2dyYWJfcmVhZF9iaW8oaW5vZGUs
IGJsa2FkZHIsIG5yX3BhZ2VzIC0gaSwNCj4gICAJCQkJCWYyZnNfcmFfb3BfZmxhZ3MocmFjKSwN
Cj4gICAJCQkJCWZvbGlvLT5pbmRleCwgZm9yX3dyaXRlKTsNCj4gICAJCQlpZiAoSVNfRVJSKGJp
bykpIHsNCj4gQEAgLTIzNzAsMTIgKzIzNzAsMTggQEAgc3RhdGljIGludCBmMmZzX21wYWdlX3Jl
YWRwYWdlcyhzdHJ1Y3QgaW5vZGUgKmlub2RlLA0KPiAgIAkJLm5yX2NwYWdlcyA9IDAsDQo+ICAg
CX07DQo+ICAgCXBnb2ZmX3QgbmNfY2x1c3Rlcl9pZHggPSBOVUxMX0NMVVNURVI7DQo+IC0JcGdv
ZmZfdCBpbmRleDsNCj4gKwlwZ29mZl90IGluZGV4ID0gcmFjID8gcmVhZGFoZWFkX2luZGV4KHJh
YykgOiBmb2xpby0+aW5kZXg7DQo+ICAgI2VuZGlmDQo+ICAgCXVuc2lnbmVkIG5yX3BhZ2VzID0g
cmFjID8gcmVhZGFoZWFkX2NvdW50KHJhYykgOiAxOw0KPiAgIAl1bnNpZ25lZCBtYXhfbnJfcGFn
ZXMgPSBucl9wYWdlczsNCj4gICAJaW50IHJldCA9IDA7DQo+ICAgDQo+ICsjaWZkZWYgQ09ORklH
X0YyRlNfRlNfQ09NUFJFU1NJT04NCj4gKwlpZiAoZjJmc19jb21wcmVzc2VkX2ZpbGUoaW5vZGUp
KQ0KPiArCQltYXhfbnJfcGFnZXMgPSByb3VuZF91cChpbmRleCArIG5yX3BhZ2VzLCBjYy5jbHVz
dGVyX3NpemUpIC0NCj4gKwkJCQlyb3VuZF9kb3duKGluZGV4LCBjYy5jbHVzdGVyX3NpemUpOw0K
PiArI2VuZGlmDQo+ICsNCj4gICAJbWFwLm1fcGJsayA9IDA7DQo+ICAgCW1hcC5tX2xibGsgPSAw
Ow0KPiAgIAltYXAubV9sZW4gPSAwOw0KPiBAQCAtMjM4NSw3ICsyMzkxLDcgQEAgc3RhdGljIGlu
dCBmMmZzX21wYWdlX3JlYWRwYWdlcyhzdHJ1Y3QgaW5vZGUgKmlub2RlLA0KPiAgIAltYXAubV9z
ZWdfdHlwZSA9IE5PX0NIRUNLX1RZUEU7DQo+ICAgCW1hcC5tX21heV9jcmVhdGUgPSBmYWxzZTsN
Cj4gICANCj4gLQlmb3IgKDsgbnJfcGFnZXM7IG5yX3BhZ2VzLS0pIHsNCj4gKwlmb3IgKDsgbnJf
cGFnZXM7IG5yX3BhZ2VzLS0sIG1heF9ucl9wYWdlcy0tKSB7DQo+ICAgCQlpZiAocmFjKSB7DQo+
ICAgCQkJZm9saW8gPSByZWFkYWhlYWRfZm9saW8ocmFjKTsNCj4gICAJCQlwcmVmZXRjaHcoJmZv
bGlvLT5mbGFncyk7DQoNCnBpbmd+DQoNCg==
