Received: from mta22.hihonor.com (mta22.honor.com [81.70.192.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B216D281505
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 12:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.70.192.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744286586; cv=none; b=cuSmxq32gwxDB+68HyHgEfXZ6K9dRnONzlLQ2l8L3LfFUa09L7r1zKgDU6kDxpOmMKTggfnKt9nxPfJT53ZPJb0wa9DgTscfq0dyx/Ts0OWBE63195sGeh9a/My7g8NMOVXr7ibLuJa33eZts7DV5wBsrdohXhUq0g+SOFC1MR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744286586; c=relaxed/simple;
	bh=2HJEpfvBQlz7dQT60A81j7d32Y9ZWDLfKF+1y5GeKIg=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=GJA8HQ2vy3iNy5j8XuzGjW3oDi+0NH8HrtkxvQgPdqtfslLwJ4OVJrxH45AoE0hIrj9lC/Na7tdUbDjlHemPxGpgG3B018jKqJRlAJzKZKkgT0ksEv3N7Z8Mw125yZNOiBgNdovuR0620TzgA+aFiOTqmB9y5DI5Ey4Bqi6HDfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=honor.com; spf=pass smtp.mailfrom=honor.com; arc=none smtp.client-ip=81.70.192.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=honor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=honor.com
Received: from w011.hihonor.com (unknown [10.68.20.122])
	by mta22.hihonor.com (SkyGuard) with ESMTPS id 4ZYJN20YBlzYl25P;
	Thu, 10 Apr 2025 20:02:26 +0800 (CST)
Received: from a003.hihonor.com (10.68.18.8) by w011.hihonor.com
 (10.68.20.122) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 10 Apr
 2025 20:03:00 +0800
Received: from a007.hihonor.com (10.68.22.31) by a003.hihonor.com (10.68.18.8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 10 Apr
 2025 20:03:00 +0800
Received: from a007.hihonor.com ([fe80::e866:83ac:f23b:c25c]) by
 a007.hihonor.com ([fe80::e866:83ac:f23b:c25c%10]) with mapi id
 15.02.1544.011; Thu, 10 Apr 2025 20:03:00 +0800
From: gaoxu <gaoxu2@honor.com>
To: Andrew Morton <akpm@linux-foundation.org>
CC: Mike Rapoport <rppt@kernel.org>, "surenb@google.com" <surenb@google.com>,
	Barry Song <21cnbao@gmail.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, yipengxiang
	<yipengxiang@honor.com>
Subject: [PATCH] mm: simplify zone_idx()
Thread-Topic: [PATCH] mm: simplify zone_idx()
Thread-Index: AduqEEHvK6kd7fhKS8Kk+tRXk/ygUQ==
Date: Thu, 10 Apr 2025 12:03:00 +0000
Message-ID: <2d42decac5194c2c8d897b0424f0dcf3@honor.com>
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

c3RvcmUgem9uZV9pZHggZGlyZWN0bHkgaW4gc3RydWN0IHpvbmUgdG8gc2ltcGxpZnkgYW5kIG9w
dGltaXplIHpvbmVfaWR4KCkNCg0KU2lnbmVkLW9mZi1ieTogZ2FvIHh1IDxnYW94dTJAaG9ub3Iu
Y29tPg0KLS0tDQogaW5jbHVkZS9saW51eC9tbXpvbmUuaCB8IDMgKystDQogbW0vbW1faW5pdC5j
ICAgICAgICAgICB8IDEgKw0KIDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRl
bGV0aW9uKC0pDQoNCmRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L21tem9uZS5oIGIvaW5jbHVk
ZS9saW51eC9tbXpvbmUuaA0KaW5kZXggNGM5NWZjYzllLi43YjE0ZjU3N2QgMTAwNjQ0DQotLS0g
YS9pbmNsdWRlL2xpbnV4L21tem9uZS5oDQorKysgYi9pbmNsdWRlL2xpbnV4L21tem9uZS5oDQpA
QCAtOTQxLDYgKzk0MSw3IEBAIHN0cnVjdCB6b25lIHsNCiAjZW5kaWYNCiANCiAJY29uc3QgY2hh
cgkJKm5hbWU7DQorCWVudW0gem9uZV90eXBlCXpvbmVfaWR4Ow0KIA0KICNpZmRlZiBDT05GSUdf
TUVNT1JZX0lTT0xBVElPTg0KIAkvKg0KQEAgLTE1MzYsNyArMTUzNyw3IEBAIHN0YXRpYyBpbmxp
bmUgaW50IGxvY2FsX21lbW9yeV9ub2RlKGludCBub2RlX2lkKSB7IHJldHVybiBub2RlX2lkOyB9
Ow0KIC8qDQogICogem9uZV9pZHgoKSByZXR1cm5zIDAgZm9yIHRoZSBaT05FX0RNQSB6b25lLCAx
IGZvciB0aGUgWk9ORV9OT1JNQUwgem9uZSwgZXRjLg0KICAqLw0KLSNkZWZpbmUgem9uZV9pZHgo
em9uZSkJCSgoem9uZSkgLSAoem9uZSktPnpvbmVfcGdkYXQtPm5vZGVfem9uZXMpDQorI2RlZmlu
ZSB6b25lX2lkeCh6b25lKQkJKCh6b25lKS0+em9uZV9pZHgpDQogDQogI2lmZGVmIENPTkZJR19a
T05FX0RFVklDRQ0KIHN0YXRpYyBpbmxpbmUgYm9vbCB6b25lX2lzX3pvbmVfZGV2aWNlKHN0cnVj
dCB6b25lICp6b25lKQ0KZGlmZiAtLWdpdCBhL21tL21tX2luaXQuYyBiL21tL21tX2luaXQuYw0K
aW5kZXggOTY1OTY4OWI4Li5hN2Y3MjY0ZjEgMTAwNjQ0DQotLS0gYS9tbS9tbV9pbml0LmMNCisr
KyBiL21tL21tX2luaXQuYw0KQEAgLTE0MjUsNiArMTQyNSw3IEBAIHN0YXRpYyB2b2lkIF9fbWVt
aW5pdCB6b25lX2luaXRfaW50ZXJuYWxzKHN0cnVjdCB6b25lICp6b25lLCBlbnVtIHpvbmVfdHlw
ZSBpZHgsDQogCWF0b21pY19sb25nX3NldCgmem9uZS0+bWFuYWdlZF9wYWdlcywgcmVtYWluaW5n
X3BhZ2VzKTsNCiAJem9uZV9zZXRfbmlkKHpvbmUsIG5pZCk7DQogCXpvbmUtPm5hbWUgPSB6b25l
X25hbWVzW2lkeF07DQorCXpvbmUtPnpvbmVfaWR4ID0gaWR4Ow0KIAl6b25lLT56b25lX3BnZGF0
ID0gTk9ERV9EQVRBKG5pZCk7DQogCXNwaW5fbG9ja19pbml0KCZ6b25lLT5sb2NrKTsNCiAJem9u
ZV9zZXFsb2NrX2luaXQoem9uZSk7DQotLSANCjIuMTcuMQ0K
