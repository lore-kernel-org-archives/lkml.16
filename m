Received: from mail.crpt.ru (mail.crpt.ru [91.236.205.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69E0D13A258;
	Tue,  4 Feb 2025 09:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.236.205.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738662879; cv=none; b=CaXLfu9rOjax5GBwjIcB4UEKToBJVBy6z0bdxHPcfBQkWBC0Opiy9HorZkoMSlc1DIQx9ULnycfuOuLLJjX3JYzW48pdQO9S7xERaTWjMfpZ/Cdz+F8idfhzGxYv+PEZwHOo2/9Fni5Mo/it4zR5MfkroECQvOmwW6igWhQZ2Oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738662879; c=relaxed/simple;
	bh=2Yo0f8FwCYleUENX3Qi2dldmdHuWItSh7PgfZpXIbhI=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=mlVbAHKx7gdZ6upz0HJ6ZNmoitsw3upJmMb0OGu6Q70FsKiUGHaFhIjkw2HH2+NZA+GvC2ZUQBaSBWIaPPndiVIVZZkRBgXK3UzFcj4u1ny/TyDV3nzj16+tziSJ3kS331yh/0NVqsp3ux1yshopY4a9phDVn6q1KfLc79rJ7rA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=crpt.ru; spf=pass smtp.mailfrom=crpt.ru; dkim=pass (2048-bit key) header.d=crpt.ru header.i=@crpt.ru header.b=DXvtOGFc; arc=none smtp.client-ip=91.236.205.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=crpt.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crpt.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=crpt.ru header.i=@crpt.ru header.b="DXvtOGFc"
Received: from mail.crpt.ru ([192.168.60.3])
	by mail.crpt.ru  with ESMTP id 5149s9bs019526-5149s9bu019526
	(version=TLSv1.2 cipher=AES256-SHA256 bits=256 verify=OK);
	Tue, 4 Feb 2025 12:54:09 +0300
Received: from EX2.crpt.local (192.168.60.4) by ex1.crpt.local (192.168.60.3)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Tue, 4 Feb
 2025 12:54:09 +0300
Received: from EX2.crpt.local ([192.168.60.4]) by EX2.crpt.local
 ([192.168.60.4]) with mapi id 15.01.2507.044; Tue, 4 Feb 2025 12:54:09 +0300
From: =?koi8-r?B?98HUz9LP0MnOIOHOxNLFyg==?= <a.vatoropin@crpt.ru>
To: Jean Delvare <jdelvare@suse.com>
CC: =?koi8-r?B?98HUz9LP0MnOIOHOxNLFyg==?= <a.vatoropin@crpt.ru>, Guenter Roeck
	<linux@roeck-us.net>, "linux-hwmon@vger.kernel.org"
	<linux-hwmon@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "lvc-project@linuxtesting.org"
	<lvc-project@linuxtesting.org>
Subject: [PATCH v2] hwmon: (xgene-hwmon) use appropriate type for the latency
 value
Thread-Topic: [PATCH v2] hwmon: (xgene-hwmon) use appropriate type for the
 latency value
Thread-Index: AQHbduq8jpf+a24QrUGeePF9PvB51A==
Date: Tue, 4 Feb 2025 09:54:08 +0000
Message-ID: <20250204095400.95013-1-a.vatoropin@crpt.ru>
Accept-Language: ru-RU, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-kse-serverinfo: EX1.crpt.local, 9
x-kse-antivirus-interceptor-info: scan successful
x-kse-antivirus-info: Clean, bases: 2/3/2025 11:17:00 PM
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
X-FEAS-Client-IP: 192.168.60.3
X-FE-Policy-ID: 2:4:0:SYSTEM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; d=crpt.ru; s=crpt.ru; c=relaxed/relaxed;
 h=from:to:cc:subject:date:message-id:content-type:mime-version;
 bh=Ns/S9zdLekX4uFaTfuRRtehKlOR68bAUTwpbDYs0F9Q=;
 b=DXvtOGFcI/iCiCiJjN71h2tp3LTF9RStzbc98nIvg2SjeTDBPgQz7E60laFSMn9JDaPIC9SZCDsz
	kv3w6VOCZJWLRZFvwwnnlvYBLvktAnT2fUByZ5u6aZ08bo3itK8h48/FE4LzWnhvZJTYX5+y3LqC
	mVWc3f5QMWYf230FVHCi94Nxb/A5xYZF2xDUHGSgQdOQMGzK4IO4+y5fKvaxlzXExj7QmQEcVDA1
	GWiqRxCk6KaFY7xEUzdqrJM1ompke1ygok8nnIWy+ogTV8dvR0a7UeJeddNIoGSxmmGaiey5X8EM
	1sNBmNMbuPB0Hl65K0o7mjb9TBak0G0Qc29kow==

From: Andrey Vatoropin <a.vatoropin@crpt.ru>

The expression PCC_NUM_RETRIES * pcc_chan->latency is currently being
evaluated using 32-bit arithmetic.

Since a value of type 'u64' is used to store the eventual result,
and this result is later sent to the function usecs_to_jiffies with=20
input parameter unsigned int, the current data type is too wide to=20
store the value of ctx->usecs_lat.

Change the data type of "usecs_lat" to a more suitable (narrower) type.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Signed-off-by: Andrey Vatoropin <a.vatoropin@crpt.ru>
---
v1->v2: rework the patch by utilizing more appropriate data types for
the variables in question as Guenter Roeck noticed.
 drivers/hwmon/xgene-hwmon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/xgene-hwmon.c b/drivers/hwmon/xgene-hwmon.c
index 1e3bd129a922..72ba569dde1c 100644
--- a/drivers/hwmon/xgene-hwmon.c
+++ b/drivers/hwmon/xgene-hwmon.c
@@ -105,7 +105,7 @@ struct xgene_hwmon_dev {
=20
 	phys_addr_t		comm_base_addr;
 	void			*pcc_comm_addr;
-	u64			usecs_lat;
+	unsigned int		usecs_lat;
 };
=20
 /*
--=20
2.43.0=
