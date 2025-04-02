Received: from mail.crpt.ru (mail1.crpt.ru [91.236.205.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12882202C51
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 15:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.236.205.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743606379; cv=none; b=jw11yT6EHAoN6SuJNjdgw47YbhWav5MJOWKBv3TXm9hLmuFxIc/iVmqmxZ3P3uTxXPMjn2PubIdX3sKKCDobobQ41tmP6hHzZy3zuDNhSAbYfM681M5wRNLFd0AHRQysgkletm9Vya6Sv1qaO85OjngS+1A4LVbpNw/WU6RasmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743606379; c=relaxed/simple;
	bh=CIvEwGy1ZRedZYHOxGiz3Jd0L6LjT1+0QPHuGHOebBU=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=CcTPXUsTPKfus1Japtk5p014jxdv7qg4GR83SSfu0/URJ4yxCXm42ZGuH1Y5VX6SZIoYnezJ6SIIYMdiPPyyLSYHbdowueN52FcVuQwMgaA0c/pjuLDjcrseI06LgG/XUst1ou93YzakwlRCBlmuoSP8xIU7ejm+Hr416gfOynU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=crpt.ru; spf=pass smtp.mailfrom=crpt.ru; dkim=pass (2048-bit key) header.d=crpt.ru header.i=@crpt.ru header.b=Vl+QS9kZ; arc=none smtp.client-ip=91.236.205.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=crpt.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crpt.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=crpt.ru header.i=@crpt.ru header.b="Vl+QS9kZ"
Received: from mail.crpt.ru ([192.168.60.4])
	by mail.crpt.ru  with ESMTP id 532F5uq5011368-532F5uq7011368
	(version=TLSv1.2 cipher=AES256-SHA256 bits=256 verify=OK);
	Wed, 2 Apr 2025 18:05:56 +0300
Received: from EX2.crpt.local (192.168.60.4) by ex2.crpt.local (192.168.60.4)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Wed, 2 Apr
 2025 18:05:55 +0300
Received: from EX2.crpt.local ([192.168.60.4]) by EX2.crpt.local
 ([192.168.60.4]) with mapi id 15.01.2507.044; Wed, 2 Apr 2025 18:05:55 +0300
From: =?utf-8?B?0JLQsNGC0L7RgNC+0L/QuNC9INCQ0L3QtNGA0LXQuQ==?=
	<a.vatoropin@crpt.ru>
To: Kenneth Feng <kenneth.feng@amd.com>
CC: =?utf-8?B?0JLQsNGC0L7RgNC+0L/QuNC9INCQ0L3QtNGA0LXQuQ==?=
	<a.vatoropin@crpt.ru>, Alex Deucher <alexander.deucher@amd.com>,
	=?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>, David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Sunil Khatri
	<sunil.khatri@amd.com>, Jesse Zhang <jesse.zhang@amd.com>, Tim Huang
	<tim.huang@amd.com>, "chr[]" <chris@rudorff.com>, Boyuan Zhang
	<boyuan.zhang@amd.com>, Yang Wang <kevinyang.wang@amd.com>,
	"amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"lvc-patches@linuxtesting.org" <lvc-patches@linuxtesting.org>
Subject: [PATCH] drm/amdgpu: Remove the redundant NULL check for the 'table'
 object
Thread-Topic: [PATCH] drm/amdgpu: Remove the redundant NULL check for the
 'table' object
Thread-Index: AQHbo+C7eZhnXRFWGk6xqFGm4+h7bw==
Date: Wed, 2 Apr 2025 15:05:55 +0000
Message-ID: <20250402150551.388229-1-a.vatoropin@crpt.ru>
Accept-Language: ru-RU, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-kse-serverinfo: EX2.crpt.local, 9
x-kse-antivirus-interceptor-info: scan successful
x-kse-antivirus-info: Clean, bases: 4/2/2025 11:23:00 AM
x-kse-attachment-filter-triggered-rules: Clean
x-kse-attachment-filter-triggered-filters: Clean
x-kse-bulkmessagesfiltering-scan-result: protection disabled
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-FEAS-Client-IP: 192.168.60.4
X-FE-Policy-ID: 2:4:0:SYSTEM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; d=crpt.ru; s=crpt.ru; c=relaxed/relaxed;
 h=from:to:cc:subject:date:message-id:content-type:mime-version;
 bh=CIvEwGy1ZRedZYHOxGiz3Jd0L6LjT1+0QPHuGHOebBU=;
 b=Vl+QS9kZo0yTmuHLtzBDicCq6h0rx5fF3rSZez5KSNnqN7p3TI2tFGEw0o1UwihByu1OmKLKkSFt
	B4mz54E+B0x7blnIFL2XR6c6birkAyWCgw10wJJ/zh1dWdN98pSsNEoIH2Y0GS3RVroTtZUh7/rk
	UcuGet99JYg3aHB06uyXBdyF92jK5I3pDTsw2mumStPFNIdp4WA0lpaSBp6eqDZhJ7FJxMfARDo2
	iptxg2PNJd2VakdmlsI/SV1QDdx2PwszirUxOHbs1QID9Pu+kkpH5kxgD4XFXzZpibK2JWQqBCeU
	M+UaHUaslXbIbpwZqTNGv34xwNCnXpEmvDKtcg==

RnJvbTogQW5kcmV5IFZhdG9yb3BpbiA8YS52YXRvcm9waW5AY3JwdC5ydT4NCg0KU3RhdGljIGFu
YWx5c2lzIHNob3dzIHRoYXQgcG9pbnRlciAidGFibGUiIGNhbm5vdCBiZSBOVUxMIGJlY2F1c2Ug
aXQgDQpwb2ludHMgdG8gdGhlIG9iamVjdCAic3RydWN0IGFtZGdwdV9jYWNfbGVha2FnZV90YWJs
ZSIuDQoNClJlbW92ZSB0aGUgZXh0cmEgTlVMTCBjaGVjay4gSXQgaXMgbWVhbmluZ2xlc3MgYW5k
IGhhcm1zIHRoZSByZWFkYWJpbGl0eQ0Kb2YgdGhlIGNvZGUuDQoNCkZvdW5kIGJ5IExpbnV4IFZl
cmlmaWNhdGlvbiBDZW50ZXIgKGxpbnV4dGVzdGluZy5vcmcpIHdpdGggU1ZBQ0UuDQoNClNpZ25l
ZC1vZmYtYnk6IEFuZHJleSBWYXRvcm9waW4gPGEudmF0b3JvcGluQGNycHQucnU+DQotLS0NCiBk
cml2ZXJzL2dwdS9kcm0vYW1kL3BtL2xlZ2FjeS1kcG0vc2lfZHBtLmMgfCAzIC0tLQ0KIDEgZmls
ZSBjaGFuZ2VkLCAzIGRlbGV0aW9ucygtKQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9wbS9sZWdhY3ktZHBtL3NpX2RwbS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wbS9sZWdh
Y3ktZHBtL3NpX2RwbS5jDQppbmRleCAxYzI1ZjMwMjNlOTMuLmQ2YWI2ZDc3NzdmOSAxMDA2NDQN
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG0vbGVnYWN5LWRwbS9zaV9kcG0uYw0KKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9wbS9sZWdhY3ktZHBtL3NpX2RwbS5jDQpAQCAtMjYzMyw5ICsy
NjMzLDYgQEAgc3RhdGljIGludCBzaV9nZXRfY2FjX3N0ZF92b2x0YWdlX21heF9taW4oc3RydWN0
IGFtZGdwdV9kZXZpY2UgKmFkZXYsDQogCXUzMiBpOw0KIAl1MzIgdjBfbG9hZGxpbmU7DQogDQot
CWlmICh0YWJsZSA9PSBOVUxMKQ0KLQkJcmV0dXJuIC1FSU5WQUw7DQotDQogCSptYXggPSAwOw0K
IAkqbWluID0gMHhGRkZGOw0KIA0KLS0gDQoyLjQzLjANCg==
