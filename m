Received: from baidu.com (mx24.baidu.com [111.206.215.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA99B288C39
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 06:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=111.206.215.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750142303; cv=none; b=L+TXN8CYqUpiLRBlCmJZrmXY3ErgY7Ar0dmQg4NGXsUBKFdzYjxeHVYIaC5ulA1v8YChqaOLmBxuOEehnO2qqChdVz50eH+yAdbKp765wTSgx+QeGfAmHTvkdrSpgWN5nk+zS1664H2nmZ4pq77IFmf4bIvvKDBq4arKSVIa/DI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750142303; c=relaxed/simple;
	bh=SqrDemTKsCW272OVpEmXBQqwurVhef25klcLb23F5N8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=YeWyTNybE0rMQXOglDyvq9j155oaX+Am1/oxgNJAZYjEihj0eGCXM2nWmoiF6t0A3jV4+G+XBMtboVp9IPO5n+yIqPANgQizczMHu4VhYO0kCAPdgRiuRE1s+1HWK9LNbjImvBuywkWZbkPyFNMVJVnU3pGMu3wkSjPyPAV3sxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=baidu.com; spf=pass smtp.mailfrom=baidu.com; arc=none smtp.client-ip=111.206.215.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=baidu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baidu.com
From: "Li,Rongqing" <lirongqing@baidu.com>
To: Vincent Guittot <vincent.guittot@linaro.org>
CC: "mingo@redhat.com" <mingo@redhat.com>, "peterz@infradead.org"
	<peterz@infradead.org>, "juri.lelli@redhat.com" <juri.lelli@redhat.com>,
	"dietmar.eggemann@arm.com" <dietmar.eggemann@arm.com>, "rostedt@goodmis.org"
	<rostedt@goodmis.org>, "bsegall@google.com" <bsegall@google.com>,
	"mgorman@suse.de" <mgorman@suse.de>, "vschneid@redhat.com"
	<vschneid@redhat.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: =?utf-8?B?562U5aSNOiBb5aSW6YOo6YKu5Lu2XSBSZTogW1BBVENIXSBzY2hlZC9jcHV0?=
 =?utf-8?Q?ime:_Fix_a_mostly_theoretical_divide_by_zero?=
Thread-Topic: =?utf-8?B?W+WklumDqOmCruS7tl0gUmU6IFtQQVRDSF0gc2NoZWQvY3B1dGltZTogRml4?=
 =?utf-8?Q?_a_mostly_theoretical_divide_by_zero?=
Thread-Index: AQHb1UB9Uh7C2aJ+ekCiq94zr/3OHrQFtOCg//+VZACAAXsLkA==
Date: Tue, 17 Jun 2025 06:36:37 +0000
Message-ID: <4709b236e32a41158994dae282f2be75@baidu.com>
References: <20250604110442.8251-1-lirongqing@baidu.com>
 <54c4aa198131420d9c77542bad5d27e7@baidu.com>
 <CAKfTPtBKm7WgwcUHcMXnH3PL3KFSniy02mb6Ag4eQ1fA3e+H3g@mail.gmail.com>
In-Reply-To: <CAKfTPtBKm7WgwcUHcMXnH3PL3KFSniy02mb6Ag4eQ1fA3e+H3g@mail.gmail.com>
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
X-FEAS-Client-IP: 172.31.50.11
X-FE-Policy-ID: 52:10:53:SYSTEM

PiBUaGVvcmV0aWNhbCBpcyB0aGUgcmlnaHQgd29yZDsgSWYgYWxsIDJeMzIgcG9zc2libGUgdGhy
ZWFkcyBiZWxvbmcgdG8gdGhlIHByb2Nlc3MsDQo+IHdlIGNhbiBnZXQgYW4gb3ZlcmZsb3cgdG8g
MCBhZnRlciB+NHNlYyBydW4gdGltZSBvZiBlYWNoIHRocmVhZC4gQnV0IHRoZW4gaG93DQo+IGxv
bmcgd2lsbCBpdCB0YWtlIHRvIGhhdmUgdGhvc2UgMl4zMiB0aHJlYWRzIHJ1biA0c2VjIG9uIGEg
c3lzdGVtIC4uLg0KPiANCj4gSXQgd291bGQgYmUgZ29vZCB0byBnZXQgbnVtYmVyIHRvIHNob3cg
aG93IHJlYWxpc3RpYyBvciBub3QgaXQgY291bGQgYmUgdG8NCj4gcmVhY2ggdGhpcyB2YWx1ZQ0K
PiANCj4NCg0KVGhlIDJeNjQgbnMgaXMgNTg0IHllYXJzLCBpZiBhIHByb2Nlc3Mgd2l0aCAxMDAw
IGJ1c3kgcG9sbGluZyB0aHJlYWRzIGlzIHJ1bm5pbmcgaW4gYSBtYWNoaW5lIHdpdGggbW9yZSB0
aGFuIDEwMDAgQ1BVcywgdGhlIHJ1bnRpbWUgd2lsbCBvdmVyZmxvdyBhYm91dCBoYWxmIHllYXIN
Cg0KVGhhbmsNCi1MSQ0KDQo=
