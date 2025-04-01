Received: from unicom145.biz-email.net (unicom145.biz-email.net [210.51.26.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 930D245948
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 00:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.51.26.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743468537; cv=none; b=b/nQaxCH7IGVrnAJb8wBK1OXi6sf39iXQpXIK4J9zIOFpdqEV9+XLzkGZLDR33sQMwTAL2BFxaNYuxjUNBc+u8Wrx89bsNieqRwf5zwNu/d+iDzdf/AhnNMGWAShvMVZhwQaN2skrwa5cOyvfRo5smkmhDBu5t41e35m1IeF1/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743468537; c=relaxed/simple;
	bh=h23ucrQaFN0VA3PFjdHtkq13nu6GouaEzfef7kRFpuI=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=LCqAWX++Bc+hgFvpqaU1m22f1k/7aLcAeK3tkw4CEAYM/a8polWNMO+OqWaZrRpvOtg4uq0bC2UY1Xa3rJ6qL9i2IK3PbVGZrEuwH0+EUBHyQkzyiJUoyQgEXXPxNR1nieNhuOJrgIPtg8gcXO0fNdkzCXBQPv1Z85+UGA52fiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=inspur.com; spf=pass smtp.mailfrom=inspur.com; arc=none smtp.client-ip=210.51.26.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=inspur.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inspur.com
Received: from jtjnmail201602.home.langchao.com
        by unicom145.biz-email.net ((D)) with ASMTP (SSL) id 202504010848433556;
        Tue, 01 Apr 2025 08:48:43 +0800
Received: from jtjnmail201604.home.langchao.com (10.100.2.4) by
 jtjnmail201602.home.langchao.com (10.100.2.2) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 1 Apr 2025 08:48:43 +0800
Received: from jtjnmail201604.home.langchao.com ([fe80::2830:53ee:1228:5322])
 by jtjnmail201604.home.langchao.com ([fe80::2830:53ee:1228:5322%5]) with mapi
 id 15.01.2507.039; Tue, 1 Apr 2025 08:48:43 +0800
From: =?utf-8?B?U2ltb24gV2FuZyAo546L5Lyg5Zu9KQ==?= <wangchuanguo@inspur.com>
To: Oscar Salvador <osalvador@suse.de>
CC: Matthew Wilcox <willy@infradead.org>, "akpm@linux-foundation.org"
	<akpm@linux-foundation.org>, "mhiramat@kernel.org" <mhiramat@kernel.org>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] mm: migrate: restore the nmask after successfully
 allocating on the  target node
Thread-Topic: [PATCH] mm: migrate: restore the nmask after successfully
 allocating on the  target node
Thread-Index: Aduin9U7FOXM3G93TEC7jnldR9WiXg==
Date: Tue, 1 Apr 2025 00:48:43 +0000
Message-ID: <bcc3284acf144b0a8c4f175a2f56b3d5@inspur.com>
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
tUid: 2025401084844972ba556c8849b859f4638a2a5780a58
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com

DQo+ID4NCj4gPiA+IE9uIFdlZCwgTWFyIDI2LCAyMDI1IGF0IDExOjEyOjE4QU0gKzA4MDAsIHdh
bmdjaHVhbmd1byB3cm90ZToNCj4gPiA+ID4gSWYgbWVtb3J5IGlzIHN1Y2Nlc3NmdWxseSBhbGxv
Y2F0ZWQgb24gdGhlIHRhcmdldCBub2RlIGFuZCB0aGUNCj4gPiA+ID4gZnVuY3Rpb24gZGlyZWN0
bHkgcmV0dXJucyB3aXRob3V0IHZhbHVlIHJlc3RvcmUgZm9yIG5tYXNrLA0KPiA+ID4gPiBub24t
Zmlyc3QgbWlncmF0aW9uIG9wZXJhdGlvbnMgaW4gbWlncmF0ZV9wYWdlcygpIGJ5IGFnYWluIGxh
YmVsDQo+ID4gPiA+IG1heSBpZ25vcmUgdGhlIG5tYXNrIHNldHRpbmdzLCB0aGVyZWJ5IGFsbG93
aW5nIG5ldyBtZW1vcnkNCj4gPiA+ID4gYWxsb2NhdGlvbnMgZm9yIG1pZ3JhdGlvbiBvbiBhbnkg
bm9kZS4NCj4gPiA+DQo+ID4gPiBJIGhhdmUgbm8gb3BpbmlvbiBvbiB3aGV0aGVyIHRoaXMgaXMg
dGhlIHJpZ2h0IHRoaW5nIHRvIGRvIG9yIG5vdCwNCj4gPiA+IGJ1dCBpZiBpdCBpcw0KPiA+ID4N
Cj4gPg0KPiA+IEkgZG9uJ3QgdGhpbmsgc28uIFdoZW4gbWVtb3J5IGFsbG9jYXRpb24gZmFpbHMg
b24gdGhlIHRhcmdldCBub2RlLCB0aGVyZSBpcw0KPiBhbHJlYWR5IGEgcmVjb3Zlcnkgb3BlcmF0
aW9uIGZvciB0aGUgbm1hc2sgdmFsdWUgYmVsb3cuIFRoZXJlZm9yZSwgdGhlIG5tYXNrDQo+IHZh
bHVlIHNob3VsZCBvbmx5IGJlIHJlc3RvcmVkIHdoZW4gbWVtb3J5IGFsbG9jYXRpb24gaXMgc3Vj
Y2Vzc2Z1bGx5DQo+IGNvbXBsZXRlZCBvbiB0aGUgdGFyZ2V0IG5vZGUuDQo+IA0KPiBCdXQgdGhh
dCBpcyBub3Qgd2hhdCB0aGUgY29kZSBpcyBkb2luZywgaXMgaXQ/IFdpdGggdGhlIGNoYW5nZXMg
YXBwbGllZCBJIG1lYW4uDQo+IFlvdSBhcmUgcmVzdG9yaW5nIG10Yy0+bm1hc2sgaW4gY2FzZSB5
b3UgbWFuYWdlZCB0byBhbGxvY2F0ZSBmb3INCj4gX19HRlBfVEhJU05PREUgYW5kIGFmdGVyIHlv
dSBjbGVhciB0aGUgZmxhZywgc28gd2UgbWlnaHQgYXMgd2VsbCBkbyBpdCBqdXN0DQo+IG9uY2Ug
YXQgdGhlIGJlZ2lubmluZyBhZnRlciBjYWxsaW5nIGFsbG9jX21pZ3JhdGlvbl90YXJnZXQgZm9y
IHRoZSBmaXJzdCB0aW1lLg0KPiANCj4gDQo+IC0tDQo+IE9zY2FyIFNhbHZhZG9yDQo+IFNVU0Ug
TGFicw0KWWVzLCB5b3UncmUgcmlnaHQuIE15IGFwb2xvZ2llc+KAlEkgb3Zlcmxvb2tlZCBhIGxp
bmUgb2YgY29kZSBlYXJsaWVyLg0K
