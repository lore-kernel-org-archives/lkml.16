Received: from mta22.hihonor.com (mta22.honor.com [81.70.192.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 898FB19E7D1
	for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 09:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.70.192.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744450049; cv=none; b=JC3sea1BjSOB46L1vDgOhRjEexXEGWi49yDELIiw/b+KJXBCDQIt0TDvlMH9J3i+yMVGX9vRSwwPjQjsUa28j7XmR2Mu0OWTCNMMnhZ2JAg73Lrx9S06/3vZN1E6qSxgfA5hjTC2YaMqgY/p6iBhkgxdd2e8JM0tBxCYROVwn8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744450049; c=relaxed/simple;
	bh=aHaxYJw7U3M6z1AeLhbj2tutvSnufIN1DJL5TgdSHWM=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=n/M/uhwX2NkBTQJmDBol6glSY50prGmmCVceHTMuzWIYwxNAM4dy0jBAI/x/rgEs8RcmNn2oO6TmNpejzFE3jLeHYl2qWK0iMRJ0aC+Lz3x9PoEE/rEiU7QhycD5hVLLNGZqYxA0vRrHUrsYT+nZG4gEeJ0vu/t4bJj8O2590Go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=honor.com; spf=pass smtp.mailfrom=honor.com; arc=none smtp.client-ip=81.70.192.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=honor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=honor.com
Received: from w002.hihonor.com (unknown [10.68.28.120])
	by mta22.hihonor.com (SkyGuard) with ESMTPS id 4ZZSqY69PZzYl82l;
	Sat, 12 Apr 2025 17:26:49 +0800 (CST)
Received: from a004.hihonor.com (10.68.27.131) by w002.hihonor.com
 (10.68.28.120) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Sat, 12 Apr
 2025 17:27:25 +0800
Received: from a007.hihonor.com (10.68.22.31) by a004.hihonor.com
 (10.68.27.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Sat, 12 Apr
 2025 17:27:24 +0800
Received: from a007.hihonor.com ([fe80::e866:83ac:f23b:c25c]) by
 a007.hihonor.com ([fe80::e866:83ac:f23b:c25c%10]) with mapi id
 15.02.1544.011; Sat, 12 Apr 2025 17:27:24 +0800
From: gaoxu <gaoxu2@honor.com>
To: Andrew Morton <akpm@linux-foundation.org>
CC: Mike Rapoport <rppt@kernel.org>, "surenb@google.com" <surenb@google.com>,
	Yu Zhao <yuzhao@google.com>, Barry Song <21cnbao@gmail.com>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, yipengxiang <yipengxiang@honor.com>, gaoxu
	<gaoxu2@honor.com>
Subject: [PATCH] mm: add nr_free_highatomic in show_free_areas
Thread-Topic: [PATCH] mm: add nr_free_highatomic in show_free_areas
Thread-Index: AdurjPRi5/gMqGJtQ1mzYKHhymGbQw==
Date: Sat, 12 Apr 2025 09:27:24 +0000
Message-ID: <d92eeff74f7a4578a14ac777cfe3603a@honor.com>
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

VGhlIGNvbW1pdCBjOTI4ODA3ZjZmNmI2KCJtbS9wYWdlX2FsbG9jOiBrZWVwIHRyYWNrIG9mIGZy
ZWUgaGlnaGF0b21pYyIpDQphZGRzIGEgbmV3IHZhcmlhYmxlIG5yX2ZyZWVfaGlnaGF0b21pYywg
d2hpY2ggaXMgdXNlZnVsIGZvciBhbmFseXppbmcgbG93DQptZW0gaXNzdWVzLiBhZGQgbnJfZnJl
ZV9oaWdoYXRvbWljIGluIHNob3dfZnJlZV9hcmVhcy4NCg0KU2lnbmVkLW9mZi1ieTogZ2FvIHh1
IDxnYW94dTJAaG9ub3IuY29tPg0KLS0tDQogbW0vc2hvd19tZW0uYyB8IDIgKysNCiAxIGZpbGUg
Y2hhbmdlZCwgMiBpbnNlcnRpb25zKCspDQoNCmRpZmYgLS1naXQgYS9tbS9zaG93X21lbS5jIGIv
bW0vc2hvd19tZW0uYw0KaW5kZXggYWQzNzNiNGI2Li4wM2U4ZDk2OGYgMTAwNjQ0DQotLS0gYS9t
bS9zaG93X21lbS5jDQorKysgYi9tbS9zaG93X21lbS5jDQpAQCAtMzA1LDYgKzMwNSw3IEBAIHN0
YXRpYyB2b2lkIHNob3dfZnJlZV9hcmVhcyh1bnNpZ25lZCBpbnQgZmlsdGVyLCBub2RlbWFza190
ICpub2RlbWFzaywgaW50IG1heF96DQogCQkJIiBsb3c6JWx1a0IiDQogCQkJIiBoaWdoOiVsdWtC
Ig0KIAkJCSIgcmVzZXJ2ZWRfaGlnaGF0b21pYzolbHVLQiINCisJCQkiIGZyZWVfaGlnaGF0b21p
YzolbHVLQiINCiAJCQkiIGFjdGl2ZV9hbm9uOiVsdWtCIg0KIAkJCSIgaW5hY3RpdmVfYW5vbjol
bHVrQiINCiAJCQkiIGFjdGl2ZV9maWxlOiVsdWtCIg0KQEAgLTMyNiw2ICszMjcsNyBAQCBzdGF0
aWMgdm9pZCBzaG93X2ZyZWVfYXJlYXModW5zaWduZWQgaW50IGZpbHRlciwgbm9kZW1hc2tfdCAq
bm9kZW1hc2ssIGludCBtYXhfeg0KIAkJCUsobG93X3dtYXJrX3BhZ2VzKHpvbmUpKSwNCiAJCQlL
KGhpZ2hfd21hcmtfcGFnZXMoem9uZSkpLA0KIAkJCUsoem9uZS0+bnJfcmVzZXJ2ZWRfaGlnaGF0
b21pYyksDQorCQkJSyh6b25lLT5ucl9mcmVlX2hpZ2hhdG9taWMpLA0KIAkJCUsoem9uZV9wYWdl
X3N0YXRlKHpvbmUsIE5SX1pPTkVfQUNUSVZFX0FOT04pKSwNCiAJCQlLKHpvbmVfcGFnZV9zdGF0
ZSh6b25lLCBOUl9aT05FX0lOQUNUSVZFX0FOT04pKSwNCiAJCQlLKHpvbmVfcGFnZV9zdGF0ZSh6
b25lLCBOUl9aT05FX0FDVElWRV9GSUxFKSksDQotLSANCjIuMTcuMQ0K
