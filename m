Received: from mta21.hihonor.com (mta21.hihonor.com [81.70.160.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB3C420103A
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 11:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.70.160.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745321981; cv=none; b=NH5UUOgTjtNJq0XS3EsqekoKGNsRokFwU6nLX0aykAEy8MS4L8b+uZqS9eA2FYxRR/juN5ZTTrCfgwPGAUdJz374fqaZl69dgrHh9dN+AwIvrnmumtRubbReBeyR5CIXu2YXfQoaBGcnHQ1n6QTTt1YjGIBkL4D1hCY5Dph1H4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745321981; c=relaxed/simple;
	bh=JuS9LrdXRFa4vONOB2S8X765dkWQDfWn2EXLAI54SSM=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=fFD8fT+uJmHf+/QYC2WtUb0AOw83GnDSZnjeUkfEP5SM9dr0IlJ75Rlrg0uqdbA1daJB2l+s+NfhawzdJCYUnrgzAQMowta148eSQoMv3A3G2+kJDdMl+oN65Pl6VrrcRU2FCVM4Xvd2inZsGov52ya4Onk+U2EB/HNX2U65Fhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=honor.com; spf=pass smtp.mailfrom=honor.com; arc=none smtp.client-ip=81.70.160.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=honor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=honor.com
Received: from w012.hihonor.com (unknown [10.68.27.189])
	by mta21.hihonor.com (SkyGuard) with ESMTPS id 4ZhgGF0d7KzYr1F0;
	Tue, 22 Apr 2025 19:37:57 +0800 (CST)
Received: from a009.hihonor.com (10.68.30.244) by w012.hihonor.com
 (10.68.27.189) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 22 Apr
 2025 19:39:31 +0800
Received: from a007.hihonor.com (10.68.22.31) by a009.hihonor.com
 (10.68.30.244) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 22 Apr
 2025 19:39:30 +0800
Received: from a007.hihonor.com ([fe80::e866:83ac:f23b:c25c]) by
 a007.hihonor.com ([fe80::e866:83ac:f23b:c25c%10]) with mapi id
 15.02.1544.011; Tue, 22 Apr 2025 19:39:30 +0800
From: gaoxu <gaoxu2@honor.com>
To: Andrew Morton <akpm@linux-foundation.org>, Dennis Zhou
	<dennis@kernel.org>, Tejun Heo <tj@kernel.org>, Christoph Lameter
	<cl@linux.com>
CC: "linux-mm@kvack.org" <linux-mm@kvack.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "surenb@google.com" <surenb@google.com>,
	yipengxiang <yipengxiang@honor.com>, gaoxu <gaoxu2@honor.com>
Subject: mm: percpu: increase PERCPU_MODULE_RESERVE to avoid allocation
 failure
Thread-Topic: mm: percpu: increase PERCPU_MODULE_RESERVE to avoid allocation
 failure
Thread-Index: Aduzek2qZlvd+/bbQUCcTHfEW2xOUQ==
Date: Tue, 22 Apr 2025 11:39:30 +0000
Message-ID: <bcfb90b2cecf43d7a0760ebaddde10d8@honor.com>
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

SW4gYW5kcm9pZDE2LTYuMTIsIGVuYWJsaW5nIENPTkZJR19NRU1fQUxMT0NfUFJPRklMSU5HIGNh
dXNlcyBzb21lIG1vZHVsZXMNCnRvIGZhaWwgdG8gbG9hZCBkdXJpbmcgYm9vdCBiZWNhdXNlIG9m
IGZhaWxlZCBwZXJjcHUgbWVtb3J5IGFsbG9jYXRpb24uDQoNCls4MTE6bW9kcHJvYmVdcGVyY3B1
OiBhbGxvY2F0aW9uIGZhaWxlZCwgc2l6ZT01MjAwIGFsaWduPTggYXRvbWljPTAsIGFsbG9jDQpm
cm9tIHJlc2VydmVkIGNodW5rIGZhaWxlZA0KWzgxMTptb2Rwcm9iZV1DYWxsIHRyYWNlOg0KWzgx
MTptb2Rwcm9iZV0gZHVtcF9iYWNrdHJhY2UrMHhmYy8weDE3Yw0KWzgxMTptb2Rwcm9iZV0gc2hv
d19zdGFjaysweDE4LzB4MjgNCls4MTE6bW9kcHJvYmVdIGR1bXBfc3RhY2tfbHZsKzB4NDAvMHhj
MA0KWzgxMTptb2Rwcm9iZV0gZHVtcF9zdGFjaysweDE4LzB4MjQNCls4MTE6bW9kcHJvYmVdIHBj
cHVfYWxsb2Nfbm9wcm9mKzB4OTZjLzB4YjU4DQpbODExOm1vZHByb2JlXSBwZXJjcHVfbW9kYWxs
b2MrMHg1MC8weGVjDQpbODExOm1vZHByb2JlXSBsb2FkX21vZHVsZSsweDExNTgvMHgxNTNjDQpb
ODExOm1vZHByb2JlXSBfX2FybTY0X3N5c19maW5pdF9tb2R1bGUrMHgyM2MvMHgzNDANCls4MTE6
bW9kcHJvYmVdIGludm9rZV9zeXNjYWxsKzB4NTgvMHgxMGMNCls4MTE6bW9kcHJvYmVdIGVsMF9z
dmNfY29tbW9uKzB4YTgvMHhkYw0KWzgxMTptb2Rwcm9iZV0gZG9fZWwwX3N2YysweDFjLzB4MjgN
Cls4MTE6bW9kcHJvYmVdIGVsMF9zdmMrMHg0MC8weDkwDQpbODExOm1vZHByb2JlXSBlbDB0XzY0
X3N5bmNfaGFuZGxlcisweDcwLzB4YmMNCls4MTE6bW9kcHJvYmVdIGVsMHRfNjRfc3luYysweDFh
OC8weDFhYw0KWzgxMTptb2Rwcm9iZV1pcGFtOiBDb3VsZCBub3QgYWxsb2NhdGUgNTIwMCBieXRl
cyBwZXJjcHUgZGF0YQ0KDQpJbmNyZWFzZSBQRVJDUFVfTU9EVUxFX1JFU0VSVkUgdG8gcmVzb2x2
ZSB0aGlzIGlzc3VlLg0KDQpTaWduZWQtb2ZmLWJ5OiBnYW8geHUgPGdhb3h1MkBob25vci5jb20+
DQotLS0NCiBpbmNsdWRlL2xpbnV4L3BlcmNwdS5oIHwgMiArLQ0KIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KDQpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51
eC9wZXJjcHUuaCBiL2luY2x1ZGUvbGludXgvcGVyY3B1LmgNCmluZGV4IDUyYjVlYTY2My4uNzY1
YzdmNTYyIDEwMDY0NA0KLS0tIGEvaW5jbHVkZS9saW51eC9wZXJjcHUuaA0KKysrIGIvaW5jbHVk
ZS9saW51eC9wZXJjcHUuaA0KQEAgLTE2LDcgKzE2LDcgQEANCiAvKiBlbm91Z2ggdG8gY292ZXIg
YWxsIERFRklORV9QRVJfQ1BVcyBpbiBtb2R1bGVzICovDQogI2lmZGVmIENPTkZJR19NT0RVTEVT
DQogI2lmZGVmIENPTkZJR19NRU1fQUxMT0NfUFJPRklMSU5HDQotI2RlZmluZSBQRVJDUFVfTU9E
VUxFX1JFU0VSVkUJCSg4IDw8IDEzKQ0KKyNkZWZpbmUgUEVSQ1BVX01PRFVMRV9SRVNFUlZFCQko
OCA8PCAxNCkNCiAjZWxzZQ0KICNkZWZpbmUgUEVSQ1BVX01PRFVMRV9SRVNFUlZFCQkoOCA8PCAx
MCkNCiAjZW5kaWYNCi0tIA0KMi4xNy4xDQo=
