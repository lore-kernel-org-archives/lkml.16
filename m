Received: from mail.crpt.ru (mail.crpt.ru [91.236.205.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F15523E499;
	Thu, 30 Jan 2025 07:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.236.205.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738220637; cv=none; b=NKVDLB0a1MAahIJ0a4si0ZHuSj6g455dLa6RdsLpizR7jxM/4zD1Evq3O2z78KQypPQbtIrr2qu4iHHHpbqN+qPYBWshM8hx6EjzdKYtw69BB4i4GNmNvv5xolQy/A6xwq2+IOnZgejvmzil5CgSGXlAjowoaSPx2qB1Z16kjw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738220637; c=relaxed/simple;
	bh=S032GrX1Rk0WozHVNrJoPwdgahdXbXlWdo4zYMKndVk=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=s0M4rd3AfVYl4QEvsZ8vX1BJKBVblEl2HCcXNr5tWzjOnKG3ituseKZgdPvLFJeVUNn7ZcnK23NT7gPAvpnbzpXqazAwPiN4DE3q3unZyXyReC3PV43P/SO1dybkH1TTp5CkcIwU4ms7JLe2d7wOET1PuoiKhKVYf0xO1FOpIGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=crpt.ru; spf=pass smtp.mailfrom=crpt.ru; dkim=pass (2048-bit key) header.d=crpt.ru header.i=@crpt.ru header.b=A+SVl32Q; arc=none smtp.client-ip=91.236.205.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=crpt.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crpt.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=crpt.ru header.i=@crpt.ru header.b="A+SVl32Q"
Received: from mail.crpt.ru ([192.168.60.4])
	by mail.crpt.ru  with ESMTP id 50U73WHY012286-50U73WHa012286
	(version=TLSv1.2 cipher=AES256-SHA256 bits=256 verify=OK);
	Thu, 30 Jan 2025 10:03:32 +0300
Received: from EX2.crpt.local (192.168.60.4) by ex2.crpt.local (192.168.60.4)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Thu, 30 Jan
 2025 10:03:32 +0300
Received: from EX2.crpt.local ([192.168.60.4]) by EX2.crpt.local
 ([192.168.60.4]) with mapi id 15.01.2507.044; Thu, 30 Jan 2025 10:03:32 +0300
From: =?koi8-r?B?98HUz9LP0MnOIOHOxNLFyg==?= <a.vatoropin@crpt.ru>
To: Jean Delvare <jdelvare@suse.com>
CC: =?koi8-r?B?98HUz9LP0MnOIOHOxNLFyg==?= <a.vatoropin@crpt.ru>, Guenter Roeck
	<linux@roeck-us.net>, "linux-hwmon@vger.kernel.org"
	<linux-hwmon@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "lvc-project@linuxtesting.org"
	<lvc-project@linuxtesting.org>
Subject: [PATCH] hwmon: Use 64-bit arithmetic instead of 32-bit
Thread-Topic: [PATCH] hwmon: Use 64-bit arithmetic instead of 32-bit
Thread-Index: AQHbcuUSAUo2EvqAckGM6pWd+pAfUA==
Date: Thu, 30 Jan 2025 07:03:32 +0000
Message-ID: <20250130070324.20403-1-a.vatoropin@crpt.ru>
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
 bh=/u8Z2B1i1G2MsGUxKsxzUUF8hmyhVxNkNeP0nG+kJsU=;
 b=A+SVl32QbaodUI0Vi8bdyo6I1AvrUZnbAbPJDA503chYP6I5EA8ARzaIhnUfStFhgbsRrmsagXCV
	Za1elIAYC+opj+9arSTRX0RA1L98X/MOZrthEps40ApU2XQbJVeAFdyFgJXiWuRH/9paofhI/6Wy
	4aN4ADuhmLQCumhJjY/5kFK7VDaElSOfCU3yIUkWg+NFNSsPP7ZlP5Aq6e7JjvwSJchf9VQ44N4J
	bRmXJGsrP1J3FWB9Rq3Clys5oyI/eC/0DBI/tBkUHqIQ0FjRZMt8aLVRrp8j6AgZs8VsbgDCmMmV
	PPtIbw+wOmjiZxOxhpZeqPM9V3q6FTE51o2ApQ==

From: Andrey Vatoropin <a.vatoropin@crpt.ru>

Add suffix ULL to constant 500 in order to give the compiler complete
information about the proper arithmetic to use. Notice that this
constant is used in a context that expects an expression of type
u64 (64 bits, unsigned).

The expression PCC_NUM_RETRIES * cppc_ss->latency, which at
preprocessing time translates to cppc_ss->latency; is currently
being evaluated using 32-bit arithmetic.

This is similar to commit b52f45110502 ("ACPI / CPPC: Use 64-bit
arithmetic instead of 32-bit")

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
