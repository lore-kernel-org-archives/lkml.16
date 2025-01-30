Received: from mail.crpt.ru (mail1.crpt.ru [91.236.205.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5B98C2FB;
	Thu, 30 Jan 2025 07:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.236.205.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738222852; cv=none; b=piafleps+XJvmCo9/ZzL2xzEcJQVbo9OX0prkc7avvyzfULCLbOKTZWIOk+Tb11qnD/Vd4rO0i0nLTo7ZhfrQKcBh5ziCw4846/uTHv6SsZUbSjEVL4c3jX9//CEMHTmV/+Glr2uYv0JfXfKi9IzeylDnuk1pWc/diosEjAqs4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738222852; c=relaxed/simple;
	bh=h2r953js5KMe/res5ngDhGH2T4wfjVJi31+pTjx2Bs8=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=gsxXEOJC3tda6s833GF0mhxWUfailZm9KAdcoqI7ziATIYTwZbT8vy8BWFz1GPDfUpmoE7r4EPRgY5vDHMz3ON1lUaFvvBiI6X0z7GHxYZTgaqU1E6iDOCWxeBirCmLulFQtH2dTP51couuoR0lIuvooJkQqmxn8UMuEgYTpM5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=crpt.ru; spf=pass smtp.mailfrom=crpt.ru; dkim=pass (2048-bit key) header.d=crpt.ru header.i=@crpt.ru header.b=CQivQhkL; arc=none smtp.client-ip=91.236.205.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=crpt.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crpt.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=crpt.ru header.i=@crpt.ru header.b="CQivQhkL"
Received: from mail.crpt.ru ([192.168.60.4])
	by mail.crpt.ru  with ESMTP id 50U7eM0L018830-50U7eM0N018830
	(version=TLSv1.2 cipher=AES256-SHA256 bits=256 verify=OK);
	Thu, 30 Jan 2025 10:40:22 +0300
Received: from EX2.crpt.local (192.168.60.4) by ex2.crpt.local (192.168.60.4)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Thu, 30 Jan
 2025 10:40:22 +0300
Received: from EX2.crpt.local ([192.168.60.4]) by EX2.crpt.local
 ([192.168.60.4]) with mapi id 15.01.2507.044; Thu, 30 Jan 2025 10:40:22 +0300
From: =?koi8-r?B?98HUz9LP0MnOIOHOxNLFyg==?= <a.vatoropin@crpt.ru>
To: Jean Delvare <jdelvare@suse.com>
CC: =?koi8-r?B?98HUz9LP0MnOIOHOxNLFyg==?= <a.vatoropin@crpt.ru>, Guenter Roeck
	<linux@roeck-us.net>, "linux-hwmon@vger.kernel.org"
	<linux-hwmon@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "lvc-project@linuxtesting.org"
	<lvc-project@linuxtesting.org>
Subject: [PATCH] hwmon: Use 64-bit arithmetic instead of 32-bit
Thread-Topic: [PATCH] hwmon: Use 64-bit arithmetic instead of 32-bit
Thread-Index: AQHbcuo3gZrlGSxZTk2kVGyH8yJOOA==
Date: Thu, 30 Jan 2025 07:40:22 +0000
Message-ID: <20250130073949.32154-1-a.vatoropin@crpt.ru>
Accept-Language: ru-RU, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-kse-serverinfo: EX2.crpt.local, 9
x-kse-antivirus-interceptor-info: scan successful
x-kse-antivirus-info: Clean, bases: 1/29/2025 10:00:00 PM
x-kse-attachment-filter-triggered-rules: Clean
x-kse-attachment-filter-triggered-filters: Clean
x-kse-bulkmessagesfiltering-scan-result: protection disabled
Content-Type: text/plain; charset="koi8-r"
Content-Transfer-Encoding: quoted-printable
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
 bh=nH+fCocC71NvxcKmnj5F8xJxc2NZj7A/PmZ+0JCxCps=;
 b=CQivQhkLcG0A1SLRvkWBEuSwGkhTVQ+kHk7gbPpO3Zy82+cC2O4o6UGspJa+AdxIqdLBh+J/lBDv
	Wecb9bZVWxWD2YY6TKi/3JNbBCBeN+uNsKEfpptiSqpQYyPRhIG3UV2z1xPkY291qgQB1AXYfRYs
	mj3rSTIOh5l5l1difHKpTsks6PJB0tvjPdjtuAASXUChSx+xL+B0jZy+q8eIfGxgpJg4Px5WaOAV
	RP3zgwQ0Ec4OPAsYV99xHOTdZjAYa209Iglq+A0yd1Ljty6FON6NC4NNj62JT9miVlgvWsiirdvz
	bF2jXAtVyyvjVVp2uIfDOYNCIKsENxJm4AbMPg==

From: Andrey Vatoropin <a.vatoropin@crpt.ru>

Add suffix ULL to constant 500 in order to give the compiler complete
information about the proper arithmetic to use. Notice that this
constant is used in a context that expects an expression of type
u64 (64 bits, unsigned).

The expression PCC_NUM_RETRIES * pcc_chan->latency, which at
preprocessing time translates to pcc_chan->latency; is currently
being evaluated using 32-bit arithmetic.

This is similar to commit b52f45110502=20
("ACPI / CPPC: Use 64-bit arithmetic instead of 32-bit")

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Signed-off-by: Andrey Vatoropin <a.vatoropin@crpt.ru>
---
 drivers/hwmon/xgene-hwmon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/xgene-hwmon.c b/drivers/hwmon/xgene-hwmon.c
index 1e3bd129a922..43a08ddb964b 100644
--- a/drivers/hwmon/xgene-hwmon.c
+++ b/drivers/hwmon/xgene-hwmon.c
@@ -61,7 +61,7 @@
  * Arbitrary retries in case the remote processor is slow to respond
  * to PCC commands
  */
-#define PCC_NUM_RETRIES			500
+#define PCC_NUM_RETRIES			500ULL
=20
 #define ASYNC_MSG_FIFO_SIZE		16
 #define MBOX_OP_TIMEOUTMS		1000
--=20
2.43.0
