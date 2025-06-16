Received: from baidu.com (mx24.baidu.com [111.206.215.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 341062E92DB
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 11:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=111.206.215.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750074441; cv=none; b=UWaUr+uZ6wr4ok/pZuTvS2d+KDsT7jssAdpZtFRtQKp4VYYAvX/2DZnSQurXHAZzPgvkskrs7XsnA9tK/rLgcXplV3dzYz1ohnOoG03ixMV3BMqOCXuaZ6gLJ5VOj3FBoYJYWBYKBnPPHr0ewc3dKxtXRygo+qrP3L/WjYdbsXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750074441; c=relaxed/simple;
	bh=7Gw1Y4myJIX8GON3qOXr637A8LTprOV7WLv/0b8wTfI=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=uCrCT7Acc10xM4vUOdU1yfBHpsk6svUfphjHQsjqqBgaUlKwaEYIO3B844zgFuVjytJGLcBkVmdSDIICYAxqWlvwjZI2cDAo5IFPSAULBfwococpyjLdaXzy9rEehNRrETG2RPY4yYBjI53nR1LhnOarD5zEnVa8Qxc6+A5ka7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=baidu.com; spf=pass smtp.mailfrom=baidu.com; arc=none smtp.client-ip=111.206.215.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=baidu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baidu.com
From: "Li,Rongqing" <lirongqing@baidu.com>
To: "mingo@redhat.com" <mingo@redhat.com>, "peterz@infradead.org"
	<peterz@infradead.org>, "juri.lelli@redhat.com" <juri.lelli@redhat.com>,
	"vincent.guittot@linaro.org" <vincent.guittot@linaro.org>,
	"dietmar.eggemann@arm.com" <dietmar.eggemann@arm.com>, "rostedt@goodmis.org"
	<rostedt@goodmis.org>, "bsegall@google.com" <bsegall@google.com>,
	"mgorman@suse.de" <mgorman@suse.de>, "vschneid@redhat.com"
	<vschneid@redhat.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: =?gb2312?B?tPC4tDogW1BBVENIXSBzY2hlZC9jcHV0aW1lOiBGaXggYSBtb3N0bHkgdGhl?=
 =?gb2312?Q?oretical_divide_by_zero?=
Thread-Topic: [PATCH] sched/cputime: Fix a mostly theoretical divide by zero
Thread-Index: AQHb1UB9Uh7C2aJ+ekCiq94zr/3OHrQFtOCg
Date: Mon, 16 Jun 2025 11:46:25 +0000
Message-ID: <54c4aa198131420d9c77542bad5d27e7@baidu.com>
References: <20250604110442.8251-1-lirongqing@baidu.com>
In-Reply-To: <20250604110442.8251-1-lirongqing@baidu.com>
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
X-FEAS-Client-IP: 172.31.51.55
X-FE-Policy-ID: 52:10:53:SYSTEM

PiANCj4gU3VtIG9mIHV0aW1lIGFuZCBzdGltZSBjYW4gb3ZlcmZsb3cgdG8gMCwgd2hlbiBhIHBy
b2Nlc3Mgd2l0aCBtYW55IHRocmVhZHMNCj4gcnVuIG92ZXIgdG90YWwgMl42NCBucw0KPiANCj4g
U2lnbmVkLW9mZi1ieTogTGkgUm9uZ1FpbmcgPGxpcm9uZ3FpbmdAYmFpZHUuY29tPg0KDQoNClBp
bmcNCg0KVGhhbmtzDQoNCi1MaQ0KDQo+IC0tLQ0KPiAga2VybmVsL3NjaGVkL2NwdXRpbWUuYyB8
IDMgKystDQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0p
DQo+IA0KPiBkaWZmIC0tZ2l0IGEva2VybmVsL3NjaGVkL2NwdXRpbWUuYyBiL2tlcm5lbC9zY2hl
ZC9jcHV0aW1lLmMgaW5kZXgNCj4gNmRhYjQ4NTQuLmMzNWZjNGMgMTAwNjQ0DQo+IC0tLSBhL2tl
cm5lbC9zY2hlZC9jcHV0aW1lLmMNCj4gKysrIGIva2VybmVsL3NjaGVkL2NwdXRpbWUuYw0KPiBA
QCAtNTc5LDcgKzU3OSw4IEBAIHZvaWQgY3B1dGltZV9hZGp1c3Qoc3RydWN0IHRhc2tfY3B1dGlt
ZSAqY3Vyciwgc3RydWN0DQo+IHByZXZfY3B1dGltZSAqcHJldiwNCj4gIAkJZ290byB1cGRhdGU7
DQo+ICAJfQ0KPiANCj4gLQlzdGltZSA9IG11bF91NjRfdTY0X2Rpdl91NjQoc3RpbWUsIHJ0aW1l
LCBzdGltZSArIHV0aW1lKTsNCj4gKwlpZiAobGlrZWx5KHN0aW1lICsgdXRpbWUpKQ0KPiArCQlz
dGltZSA9IG11bF91NjRfdTY0X2Rpdl91NjQoc3RpbWUsIHJ0aW1lLCBzdGltZSArIHV0aW1lKTsN
Cj4gIAkvKg0KPiAgCSAqIEJlY2F1c2UgbXVsX3U2NF91NjRfZGl2X3U2NCgpIGNhbiBhcHByb3hp
bWF0ZSBvbiBzb21lDQo+ICAJICogYWNoaXRlY3R1cmVzOyBlbmZvcmNlIHRoZSBjb25zdHJhaW50
IHRoYXQ6IGEqYi8oYitjKSA8PSBhLg0KPiAtLQ0KPiAyLjkuNA0KDQo=
