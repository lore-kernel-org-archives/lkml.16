Received: from ssh247.corpemail.net (ssh247.corpemail.net [210.51.61.247])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57AEF1372
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 01:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.51.61.247
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743469671; cv=none; b=RZWW0dkV4gCWVUvtk2/t5nPj7CwOx9//PhuwQ5hDiCMu1S2wxErUhJTaScl0E8d+8rvShnHfTAf+5U53uA3J6XX6sZz80fcx4OJd/sTSV9y15NH4nvJn4N74KM/cxf+lDgfV7/B/poyIFctrBuFZUZ7bFtvslTpXeVYfQCZbmFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743469671; c=relaxed/simple;
	bh=Hp83HSM8SEsfIHYJ8LWG/Kw/Ivvyb0P0gG90teU0WmE=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=iab09gwuiyjHAc0/MZg7g7pa70BVCNMfBVSL2TbeB1iBojUoUOttSdsXqmru0W/HuNndfQh+x4+D8Llpd6DGCTY+/p41SkC979x/FiQ+huweJFRbsRdD6z2jwpFvSofl6bxSdUNLoj7yu3SiCg0In9wOzo85ofhNtWFXztqdO3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=inspur.com; spf=pass smtp.mailfrom=inspur.com; arc=none smtp.client-ip=210.51.61.247
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=inspur.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inspur.com
Received: from jtjnmail201602.home.langchao.com
        by ssh247.corpemail.net ((D)) with ASMTP (SSL) id 202504010906338410;
        Tue, 01 Apr 2025 09:06:33 +0800
Received: from jtjnmail201604.home.langchao.com (10.100.2.4) by
 jtjnmail201602.home.langchao.com (10.100.2.2) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 1 Apr 2025 09:06:32 +0800
Received: from jtjnmail201604.home.langchao.com ([fe80::2830:53ee:1228:5322])
 by jtjnmail201604.home.langchao.com ([fe80::2830:53ee:1228:5322%5]) with mapi
 id 15.01.2507.039; Tue, 1 Apr 2025 09:06:32 +0800
From: =?utf-8?B?U2ltb24gV2FuZyAo546L5Lyg5Zu9KQ==?= <wangchuanguo@inspur.com>
To: Oscar Salvador <osalvador@suse.de>
CC: "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	"mhiramat@kernel.org" <mhiramat@kernel.org>, "linux-mm@kvack.org"
	<linux-mm@kvack.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] mm: migrate: restore the nmask after successfully
 allocating on the  target node
Thread-Topic: [PATCH] mm: migrate: restore the nmask after successfully
 allocating on the  target node
Thread-Index: AduinxdVBTRWTLySS1i0fmPidD2b/A==
Date: Tue, 1 Apr 2025 01:06:32 +0000
Message-ID: <80bbb67e8d524aad97fecc99d1eebd52@inspur.com>
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
tUid: 2025401090633dcf6ba47edfaddd902fdc7edd8521fd7
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com

DQoNCj4gDQo+IE9uIFdlZCwgTWFyIDI2LCAyMDI1IGF0IDExOjEyOjE4QU0gKzA4MDAsIHdhbmdj
aHVhbmd1byB3cm90ZToNCj4gPiBJZiBtZW1vcnkgaXMgc3VjY2Vzc2Z1bGx5IGFsbG9jYXRlZCBv
biB0aGUgdGFyZ2V0IG5vZGUgYW5kIHRoZQ0KPiA+IGZ1bmN0aW9uIGRpcmVjdGx5IHJldHVybnMg
d2l0aG91dCB2YWx1ZSByZXN0b3JlIGZvciBubWFzaywgbm9uLWZpcnN0DQo+ID4gbWlncmF0aW9u
IG9wZXJhdGlvbnMgaW4gbWlncmF0ZV9wYWdlcygpIGJ5IGFnYWluIGxhYmVsIG1heSBpZ25vcmUg
dGhlDQo+ID4gbm1hc2sgc2V0dGluZ3MsIHRoZXJlYnkgYWxsb3dpbmcgbmV3IG1lbW9yeSBhbGxv
Y2F0aW9ucyBmb3IgbWlncmF0aW9uDQo+ID4gb24gYW55IG5vZGUuDQo+ID4NCj4gPiBTaWduZWQt
b2ZmLWJ5OiB3YW5nY2h1YW5ndW8gPHdhbmdjaHVhbmd1b0BpbnNwdXIuY29tPg0KPiANCj4gVW5s
ZXNzIEkgYW0gbWlzc2luZyBzb21ldGhpbmcgdGhpcyBsb29rcyByZWFzb25hYmxlLCBidXQgSSB3
aG9uZGVyIHdoeQ0KPiBub2JvZHkgbm90aWNlZCBpdCBiZWZvcmUuDQo+IEl0IGlzIGEgcGF0aCB0
aGF0IHNob3VsZCBiZSBwcmV0dHkgZXhlcmNpc2VkLg0KPiANCj4gDQo+IC0tDQo+IE9zY2FyIFNh
bHZhZG9yDQo+IFNVU0UgTGFicw0KSSB0ZXN0ZWQgaXQsIGFuZCBldmVuIHdoZW4gdGhlIG5tYXNr
IGlzIHNldCB0byBhbGwgemVyb3MsIG1lbW9yeSBhbGxvY2F0aW9uIHN0aWxsIG9jY3VycyBvbiBv
dGhlciBub2Rlcy4gDQpJIHN1c3BlY3QgdGhpcyBpcyBiZWNhdXNlIHRoZSBidWcg4oCLZXhwYW5k
cyB0aGUgcmFuZ2Ugb2YgZWxpZ2libGUgbm9kZXMgZm9yIG1lbW9yeSBhbGxvY2F0aW9uIGluc3Rl
YWQgb2YgY2F1c2luZyBhbGxvY2F0aW9uIGZhaWx1cmVzLCB3aGljaCBpcyB3aHkgaXQgaGFzIGdv
bmUgdW5ub3RpY2VkLg0K
