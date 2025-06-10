Received: from mta22.hihonor.com (mta22.hihonor.com [81.70.192.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3E5F21CA0C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 06:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.70.192.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749536554; cv=none; b=Lhcs+svCtBDRmTPVM97Pdk9S8vWJqFt7enwR3/OrSZh8Exv9Ups4rc8EdbZMxs+754mGwnoVyH9TINCvzx2omtzKMq1Rh3AeajBwCRmN5ReSmzib64SoMWof/wZJJBRzh120r2bflmlktvLwL1oSkr4fHH3DMV/9Hn7pBkjoR6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749536554; c=relaxed/simple;
	bh=VrjH8ot28WmbqF0AcOym44aJ1nqanp04xsSKx25DKUg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=OHJi/SjgRcU8jokrOGLToYaI+UC2dYk7E9wBgca0it/NxRFJAtX44rWIpxTh9Tk/qg28KQaN3dgCBQrc+yPsorOVi+386lj5TEciVFIFWbll4CbOXq99NjMhLvSHWFFYwcqTpTblgYi5fs+e+PSkPe42Y/4enqXMh/KrmReLdJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=honor.com; spf=pass smtp.mailfrom=honor.com; arc=none smtp.client-ip=81.70.192.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=honor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=honor.com
Received: from w012.hihonor.com (unknown [10.68.27.189])
	by mta22.hihonor.com (SkyGuard) with ESMTPS id 4bGdvD2jT9zYl3c0;
	Tue, 10 Jun 2025 14:20:24 +0800 (CST)
Received: from a008.hihonor.com (10.68.30.56) by w012.hihonor.com
 (10.68.27.189) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 10 Jun
 2025 14:22:23 +0800
Received: from a007.hihonor.com (10.68.22.31) by a008.hihonor.com
 (10.68.30.56) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 10 Jun
 2025 14:22:22 +0800
Received: from a007.hihonor.com ([fe80::e866:83ac:f23b:c25c]) by
 a007.hihonor.com ([fe80::e866:83ac:f23b:c25c%10]) with mapi id
 15.02.1544.011; Tue, 10 Jun 2025 14:22:22 +0800
From: liuwenfang <liuwenfang@honor.com>
To: 'Andrea Righi' <arighi@nvidia.com>
CC: 'Tejun Heo' <tj@kernel.org>, 'David Vernet' <void@manifault.com>,
	'Changwoo Min' <changwoo@igalia.com>, 'Ingo Molnar' <mingo@redhat.com>,
	'Peter Zijlstra' <peterz@infradead.org>, 'Juri Lelli'
	<juri.lelli@redhat.com>, 'Vincent Guittot' <vincent.guittot@linaro.org>,
	'Dietmar Eggemann' <dietmar.eggemann@arm.com>, 'Steven Rostedt'
	<rostedt@goodmis.org>, 'Ben Segall' <bsegall@google.com>, 'Mel Gorman'
	<mgorman@suse.de>, 'Valentin Schneider' <vschneid@redhat.com>,
	"'linux-kernel@vger.kernel.org'" <linux-kernel@vger.kernel.org>
Subject: =?gb2312?B?u9i4tDogW1BBVENIXSBzY2hlZF9leHQ6IEZpeCBOVUxMIHBvaW50ZXIgZGVy?=
 =?gb2312?B?ZWZlcmVuY2VzIGluIHB1dF9wcmV2X3Rhc2tfc2N4?=
Thread-Topic: [PATCH] sched_ext: Fix NULL pointer dereferences in
 put_prev_task_scx
Thread-Index: AdvZMqezZvkPdfZnQpOR7atL8hfbkv//gyUA//5KeJA=
Date: Tue, 10 Jun 2025 06:22:22 +0000
Message-ID: <4f5b6cf9dca0492aad16472cbd49a528@honor.com>
References: <dc2d908cd429473a9d46255272231f38@honor.com>
 <aEbO3DmwY4Tg6HT1@gpd4>
In-Reply-To: <aEbO3DmwY4Tg6HT1@gpd4>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

VGhhbmtzIGZvciB5b3VyIGZlZWRiYWNrLg0KVGhpcyBpcyB0cmlnZ2VyZWQgaW4ga2VybmVsIG1v
ZHVsZXMgZGV2ZWxvcGVkIEluIHRoZSBtb2JpbGUgc2NlbmFyaW86IA0KdGFza3Mgb24gcnEgYXJl
IG1pZ3JhdGVkIHdoaWxlIHRoZSBjdXJyZW50IGNwdSBzaG91bGQgYmUgaGFsdGVkIGZvciBwb3dl
ciBzYXZpbmcgcG9saWN5Lg0KSXRzIG1pZ3JhdGlvbiBsb2dpYzoNCmRyYWluX3JxX2NwdV9zdG9w
IC0tIG1pZ3JhdGVfYWxsX3Rhc2tzIDoNCmZvciAoOzspIHsNCglpZiAocnEtPm5yX3J1bm5pbmcg
PT0gMSkNCgkJYnJlYWs7DQoJZm9yX2VhY2hfY2xhc3MoY2xhc3MpIHsNCgkJbmV4dCA9IGNsYXNz
LT5waWNrX25leHRfdGFzayhycSk7DQoJCWlmIChuZXh0KSB7DQoJCQluZXh0LT5zY2hlZF9jbGFz
cy0+cHV0X3ByZXZfdGFzayhycSwgbmV4dCwgTlVMTCk7DQoJCQlicmVhazsNCgkJfQ0KCX0NCglp
ZiAoaXNfaWRsZV90YXNrKG5leHQpKQ0KCQlicmVhazsNCglkZXN0X2NwdSA9IHNlbGVjdF90YXNr
X3JxKG5leHQuLi4pOw0KCW1vdmVfcXVldWVkX3Rhc2socnEsIHJmLCBuZXh0LCBkZXN0X2NwdSk7
DQoJLi4uDQp9DQoNCnB1dF9wcmV2X3Rhc2sgaW4gdGhpcyBmdW5jdGlvbiBpcyBzZWxlY3RlZCB0
byB1cGRhdGUgdXRpbCBhbmQgc3RhdGlzdGljcyBpbmZvIGZvciBlYWNoIHJ1bm5hYmxlIHRhc2tz
LA0KaGVyZSB0aGV5IGFyZSBub3QgZGVxdWV1ZWQgeWV0Lg0KDQpCZXN0IHJlZ2FyZHMsDQogDQo+
IE9uIE1vbiwgSnVuIDA5LCAyMDI1IGF0IDExOjM2OjE1QU0gKzAwMDAsIGxpdXdlbmZhbmcgd3Jv
dGU6DQo+ID4gQXMgcHV0X3ByZXZfdGFzayBjYW4gYmUgdXNlZCBpbiBvdGhlciBrZXJuZWwgbW9k
dWxlcyB3aGljaCBjYW4gbGVhZCB0bw0KPiA+IGEgTlVMTCBwb2ludGVyLiBGaXggdGhpcyBieSBj
aGVja2luZyBmb3IgYSB2YWxpZCBuZXh0Lg0KPiANCj4gQWN0dWFsbHksIHB1dF9wcmV2X3Rhc2so
KSBzaG91bGQgYmUgdXNlZCBvbmx5IHdpdGhpbiBrZXJuZWwvc2NoZWQvIGFuZCwgaW4gdGhlb3J5
LA0KPiB5b3Ugc2hvdWxkIGhhdmUgZG9uZSBhIGRlcXVldWVfdGFzaygpIGJlZm9yZSBwdXRfcHJl
dl90YXNrKCkgaW4gdGhpcyBzY2VuYXJpbywNCj4gc28gU0NYX1RBU0tfUVVFVUVEIHNob3VsZG4n
dCBiZSBzZXQgaW4gcC0+c2N4LmZsYWdzLg0KPiANCj4gVGhlIGNoYW5nZSBtaWdodCBzdGlsbCBt
YWtlIHNlbnNlLCBidXQgY2FuIHlvdSBjbGFyaWZ5IGhvdyB5b3UgdHJpZ2dlcmVkIHRoZQ0KPiBO
VUxMIHBvaW50ZXIgZGVyZWZlcmVuY2U/DQo+IA0KPiBUaGFua3MsDQo+IC1BbmRyZWENCj4gDQo+
ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBsMDAwMTM5NzEgPGwwMDAxMzk3MUBoaWhvbm9yLmNvbT4N
Cj4gPiAtLS0NCj4gPiAga2VybmVsL3NjaGVkL2V4dC5jIHwgMiArLQ0KPiA+ICAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQg
YS9rZXJuZWwvc2NoZWQvZXh0LmMgYi9rZXJuZWwvc2NoZWQvZXh0LmMgaW5kZXgNCj4gPiBmNTEz
MzI0OWYuLjZhNTc5YmFiZCAxMDA2NDQNCj4gPiAtLS0gYS9rZXJuZWwvc2NoZWQvZXh0LmMNCj4g
PiArKysgYi9rZXJuZWwvc2NoZWQvZXh0LmMNCj4gPiBAQCAtMzI2Miw3ICszMjYyLDcgQEAgc3Rh
dGljIHZvaWQgcHV0X3ByZXZfdGFza19zY3goc3RydWN0IHJxICpycSwgc3RydWN0DQo+IHRhc2tf
c3RydWN0ICpwLA0KPiA+ICAJCSAqIG9wcy5lbnF1ZXVlKCkgdGhhdCBAcCBpcyB0aGUgb25seSBv
bmUgYXZhaWxhYmxlIGZvciB0aGlzIGNwdSwNCj4gPiAgCQkgKiB3aGljaCBzaG91bGQgdHJpZ2dl
ciBhbiBleHBsaWNpdCBmb2xsb3ctdXAgc2NoZWR1bGluZyBldmVudC4NCj4gPiAgCQkgKi8NCj4g
PiAtCQlpZiAoc2NoZWRfY2xhc3NfYWJvdmUoJmV4dF9zY2hlZF9jbGFzcywgbmV4dC0+c2NoZWRf
Y2xhc3MpKSB7DQo+ID4gKwkJaWYgKG5leHQgJiYgc2NoZWRfY2xhc3NfYWJvdmUoJmV4dF9zY2hl
ZF9jbGFzcywgbmV4dC0+c2NoZWRfY2xhc3MpKQ0KPiA+ICt7DQo+ID4gIAkJCVdBUk5fT05fT05D
RSghc3RhdGljX2JyYW5jaF91bmxpa2VseSgmc2N4X29wc19lbnFfbGFzdCkpOw0KPiA+ICAJCQlk
b19lbnF1ZXVlX3Rhc2socnEsIHAsIFNDWF9FTlFfTEFTVCwgLTEpOw0KPiA+ICAJCX0gZWxzZSB7
DQo+ID4gLS0NCj4gPiAyLjE3LjENCg==
