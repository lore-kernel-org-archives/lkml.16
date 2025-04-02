Received: from mail.crpt.ru (mail.crpt.ru [91.236.205.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDFF323AE8B
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 14:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.236.205.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743603797; cv=none; b=DByLuPJ5b4Jqfuu4pnf+cT7me3smuEhSBq5V/8S1/dE4bp8d8YAw4f+z5j2Jro83gVdijBllobPpbt3e7CLzUxz3OaVGctJ4eZHNVv7ixtQFxXA8rYYemUHQONNS7x0X/M1/eZny7qhngmvOxx4e32O1dRiiIogVvbrjkYrrZi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743603797; c=relaxed/simple;
	bh=6PWrRiayky3wtjPN+LAvVDtngWKjutbwbMbRB4bNvY4=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=vAuV8BrOOnWisBjJ4BC4r7rP7IYS7Ni9rAopm/G5GhELYTYFscsVEbCx7bLcPfV1IdPmFkdWnUqtvEnhgch4CmOWFIcYccHv9ZoNtIeNIDUPJUB7R2Mwvq+7MvvFnHbryQRV0S/OR8wGS6zHKB2X2wGyt6ZBYqApmZBhWE9HOA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=crpt.ru; spf=pass smtp.mailfrom=crpt.ru; dkim=pass (2048-bit key) header.d=crpt.ru header.i=@crpt.ru header.b=Bv92W5Xs; arc=none smtp.client-ip=91.236.205.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=crpt.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crpt.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=crpt.ru header.i=@crpt.ru header.b="Bv92W5Xs"
Received: from mail.crpt.ru ([192.168.60.4])
	by mail.crpt.ru  with ESMTP id 532ELdeE011735-532ELdeG011735
	(version=TLSv1.2 cipher=AES256-SHA256 bits=256 verify=OK);
	Wed, 2 Apr 2025 17:21:39 +0300
Received: from EX2.crpt.local (192.168.60.4) by ex2.crpt.local (192.168.60.4)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Wed, 2 Apr
 2025 17:21:40 +0300
Received: from EX2.crpt.local ([192.168.60.4]) by EX2.crpt.local
 ([192.168.60.4]) with mapi id 15.01.2507.044; Wed, 2 Apr 2025 17:21:40 +0300
From: =?utf-8?B?0JLQsNGC0L7RgNC+0L/QuNC9INCQ0L3QtNGA0LXQuQ==?=
	<a.vatoropin@crpt.ru>
To: Harry Wentland <harry.wentland@amd.com>
CC: =?utf-8?B?0JLQsNGC0L7RgNC+0L/QuNC9INCQ0L3QtNGA0LXQuQ==?=
	<a.vatoropin@crpt.ru>, Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira
	<siqueira@igalia.com>, Alex Deucher <alexander.deucher@amd.com>,
	=?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>, David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Alex Hung
	<alex.hung@amd.com>, Dillon Varone <dillon.varone@amd.com>, Roman Li
	<roman.li@amd.com>, Ethan Carter Edwards <ethan@ethancedwards.com>, "Ivan
 Lipski" <ivlipski@amd.com>, Iswara Nagulendran <iswara.nagulendran@amd.com>,
	Hersen Wu <hersenxs.wu@amd.com>, Rafal Ostrowski <rostrows@amd.com>, "Alvin
 Lee" <alvin.lee2@amd.com>, Aric Cyr <aric.cyr@amd.com>, "Dr. David Alan
 Gilbert" <linux@treblig.org>, Srinivasan Shanmugam
	<srinivasan.shanmugam@amd.com>, "amd-gfx@lists.freedesktop.org"
	<amd-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
	<dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "lvc-project@linuxtesting.org"
	<lvc-project@linuxtesting.org>
Subject: [PATCH] drm/amd/display: Remove the redundant NULL check
Thread-Topic: [PATCH] drm/amd/display: Remove the redundant NULL check
Thread-Index: AQHbo9qMmPuxivrTRU6kDAkV7hJQVA==
Date: Wed, 2 Apr 2025 14:21:39 +0000
Message-ID: <20250402142134.375176-1-a.vatoropin@crpt.ru>
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
 bh=6PWrRiayky3wtjPN+LAvVDtngWKjutbwbMbRB4bNvY4=;
 b=Bv92W5XszD82x8OUXlHmeG3WxEyF8/J/xc7a3rLgP9XN7RvSRGP6LCf0oC8G0/C89pAE8sWkcJI/
	ObK291pMPuTLT4qUOmA8JeKaPiKmT76ztfqwuec3lwEv5EVctNjlVDZT0JETAvUhk23sXybV3lne
	McLGNotTjU2XjUiz6txO8BAfj0GAq7ZEPpGpcdIPQAKDwOCEe7Yrbhkb6AAynnaBr8zhJf2LOs3u
	i6yY09Dd+B6hDMA+PHsAkgn5Kpp7CSsP3TiHRahzwz6aEFvCPd2iQX0OEwUX6N3VlNhat/xfXRE2
	dQXjYOpr4gSH8qJcfT61QqqZlLaRa259dHuRYA==

RnJvbTogQW5kcmV5IFZhdG9yb3BpbiA8YS52YXRvcm9waW5AY3JwdC5ydT4NCg0KU3RhdGljIGFu
YWx5c2lzIHNob3dzIHRoYXQgcG9pbnRlciAidGltaW5nIiBjYW5ub3QgYmUgTlVMTCBiZWNhdXNl
IGl0DQpwb2ludHMgdG8gdGhlIG9iamVjdCAic3RydWN0IGRjX2NydGNfdGltaW5nIi4NCg0KUmVt
b3ZlIHRoZSBleHRyYSBOVUxMIGNoZWNrLiBJdCBpcyBtZWFuaW5nbGVzcyBhbmQgaGFybXMgdGhl
IHJlYWRhYmlsaXR5DQpvZiB0aGUgY29kZS4NCg0KRm91bmQgYnkgTGludXggVmVyaWZpY2F0aW9u
IENlbnRlciAobGludXh0ZXN0aW5nLm9yZykgd2l0aCBTVkFDRS4NCg0KU2lnbmVkLW9mZi1ieTog
QW5kcmV5IFZhdG9yb3BpbiA8YS52YXRvcm9waW5AY3JwdC5ydT4NCi0tLQ0KIGRyaXZlcnMvZ3B1
L2RybS9hbWQvZGlzcGxheS9kYy9yZXNvdXJjZS9kY24zMC9kY24zMF9yZXNvdXJjZS5jIHwgMiAt
LQ0KIDEgZmlsZSBjaGFuZ2VkLCAyIGRlbGV0aW9ucygtKQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL3Jlc291cmNlL2RjbjMwL2RjbjMwX3Jlc291cmNlLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvcmVzb3VyY2UvZGNuMzAvZGNuMzBfcmVz
b3VyY2UuYw0KaW5kZXggMTMyMDJjZTMwZDY2Li43NmU4YzRkY2YzMzkgMTAwNjQ0DQotLS0gYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvcmVzb3VyY2UvZGNuMzAvZGNuMzBfcmVzb3Vy
Y2UuYw0KKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL3Jlc291cmNlL2RjbjMw
L2RjbjMwX3Jlc291cmNlLmMNCkBAIC0xODkxLDggKzE4OTEsNiBAQCBzdGF0aWMgaW50IGdldF9y
ZWZyZXNoX3JhdGUoc3RydWN0IGRjX3N0YXRlICpjb250ZXh0KQ0KIA0KIAkvKiBjaGVjayBpZiBy
ZWZyZXNoIHJhdGUgYXQgbGVhc3QgMTIwaHogKi8NCiAJdGltaW5nID0gJmNvbnRleHQtPnN0cmVh
bXNbMF0tPnRpbWluZzsNCi0JaWYgKHRpbWluZyA9PSBOVUxMKQ0KLQkJcmV0dXJuIDA7DQogDQog
CWhfdl90b3RhbCA9IHRpbWluZy0+aF90b3RhbCAqIHRpbWluZy0+dl90b3RhbDsNCiAJaWYgKGhf
dl90b3RhbCA9PSAwKQ0KLS0gDQoyLjQzLjANCg==
