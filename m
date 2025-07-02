Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2050.outbound.protection.outlook.com [40.107.94.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9827278F5D;
	Wed,  2 Jul 2025 10:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751450979; cv=fail; b=PSDSjL4RzPjQ6Ok09bJEfnjh5GF8p7kigvAk9cCAURYhxmRzp04aIHvX+CLPjdz/LeW1V++bqAaZddxoZDPQOlftIZlFSkRcy3B1W7AJ0kMcIJsgI4dyCnTVblifvQdvtCVpIZ5Ih3RqGb2A+/+E1jtq0qvR+jiaoh25b9bEfQE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751450979; c=relaxed/simple;
	bh=JA8EXN93ApSXWsPWx2pl+JqSLR27hsspDqNfz0PbHg8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fUGuDrp2JWa6lMcVmOEMxFhFjx7/ZzD46Gfp8ThqYZ/LVqC8DvHASaMcQwexVCED+4jOzD4F4SJfty6oeN0BecIGoLpnnZN0EtveLolbR0qqeOupJm1vSwrIPouOJyEn3Rz9Dt4kCPZRS/ETaBmMU2JWF2XFl+b8QzCgVRCZQLY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=BRW85q/0; arc=fail smtp.client-ip=40.107.94.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="BRW85q/0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cXkHoBRqS4rXyMm1f8tiEk+CfWLZ0qd3jFXTPxNdLmy0lXE4WIvoRuCEXfx5PB6yWYSF7qV8vfHJCe6fonJqn0xAjfiynW5cpCHjo2SE/HK3MwOILKuQi8NP24hdOeSGb4aBjubB/YEw5xU4mBt1wdWXA7add1gNuUakAF/8tpxQWQipuYsglMPnSoychqFLttiohymL17sScSouCMF/HyRucVn/rCxkvDRjH4tlswRJUE80RhkTvlkvsULEeX3TAJWjEE4nY5k+iKtut8ilDQlyrxPpQqkf4Gk4Edk8G9esw9HVjG1fmOkMUWn4dA27ffNeVITNlsqOUPIfPnOFdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e4ikhJdKu2Ln5A99HTzKL8C3VPBtyMze+yDOoYEcyKQ=;
 b=r458pap6q5KWfhjID+XKM0SoMXy1ydg0lP8I0lgC7hBCSE0FILM3tN+wmovco7Ns74dLYWyrtZlRwxZA89Uj8aedZB7A+BbrjBhJWBaVOsVQeZIlU4VHaNmmeZjdBcqfgOlGU7FwVpLCvJv6Ecwv0meGFwAlbmZVlkTSktmWZS+puKROV/s8rgY2KoV54i+zY2cyIcWS5pr33Pe3ypzqAzpT91YjxAxfLSxZZBqNlKBr2b7ZE6dDjwE4ZLZIUvhQnqUJarqiFBYm2Xvm+gC5VaehCQsMEszYV2guO3bZPoxX4By4oNzE67wAku6LHlkV6N236jRu9TOuw0Ehvkt21g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e4ikhJdKu2Ln5A99HTzKL8C3VPBtyMze+yDOoYEcyKQ=;
 b=BRW85q/0r5hbbBNbVXUGDkZibqX93T3KLSVtKuNUGYtv2VUpWs9QyRAZ+hCnrX7pUO77/4cdXvTM923o06eQHPTcie75dFlnmjLqwAnDoyk94aX1IcfTx2cLlOgkamuyhGib5+7hG8kbRmx2mj0YiolG3MHkpK6rU3F+MS2X/fP6FZVRZtDv8mvCMqOUBehrXoikIeYu9GBJKJETWLK0bgmNLK3dIMRKJdRe+ukYQFJAn2wBe0xbx2QaubrLBzjBviXszPr2aqrUR01bojpHEQjfsgF9BKEsP32isP7RqXtHrnCFDVe9SZhUN/yAn9ZLiPJByB0yJY9utZ0UOhOl2g==
Received: from DM6PR21CA0004.namprd21.prod.outlook.com (2603:10b6:5:174::14)
 by DM4PR12MB5915.namprd12.prod.outlook.com (2603:10b6:8:68::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Wed, 2 Jul
 2025 10:09:35 +0000
Received: from DS2PEPF0000343E.namprd02.prod.outlook.com
 (2603:10b6:5:174:cafe::bf) by DM6PR21CA0004.outlook.office365.com
 (2603:10b6:5:174::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.10 via Frontend Transport; Wed,
 2 Jul 2025 10:09:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS2PEPF0000343E.mail.protection.outlook.com (10.167.18.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.15 via Frontend Transport; Wed, 2 Jul 2025 10:09:34 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 2 Jul 2025
 03:09:22 -0700
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Wed, 2 Jul
 2025 03:09:21 -0700
Received: from vdi.nvidia.com (10.127.8.10) by mail.nvidia.com (10.129.68.10)
 with Microsoft SMTP Server id 15.2.1544.14 via Frontend Transport; Wed, 2 Jul
 2025 03:09:20 -0700
From: Shravan Kumar Ramani <shravankr@nvidia.com>
To: Ilpo Jarvinen <ilpo.jarvinen@linux.intel.com>, Vadim Pasternak
	<vadimp@nvidia.com>, David Thompson <davthompson@nvidia.com>
CC: Shravan Kumar Ramani <shravankr@nvidia.com>,
	<platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 1/2] platform/mellanox: mlxbf-pmc: Remove newline char from event name input
Date: Wed, 2 Jul 2025 06:09:01 -0400
Message-ID: <4978c18e33313b48fa2ae7f3aa6dbcfce40877e4.1751380187.git.shravankr@nvidia.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <cover.1751380187.git.shravankr@nvidia.com>
References: <cover.1751380187.git.shravankr@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343E:EE_|DM4PR12MB5915:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e8c8b4c-f8a4-44f4-7317-08ddb9508bba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0GXJqGJmzxNJeLakRMGEYUm4bsPtTb5ZCdgwYqMYl7tso0GQUT+yseUMwUW9?=
 =?us-ascii?Q?NNBsSW509BcBzkIexfnbIkoPR28hLDIWwb82unoyXKU/NUkaObnodhJeor3t?=
 =?us-ascii?Q?P2rEQ5l1T2GLeXxfIWX5YRRtU13svVJE+JlFiupDQi3VxTEGmNKzuAc7QR46?=
 =?us-ascii?Q?ZTr3ZI7NZ8b/H8JRgJT7PeMc8f/LMdr7usy900UrV7UF2WVGDiwWr63B4XjX?=
 =?us-ascii?Q?W3z4nnu4GeD87GvqT7TLgd3Jwa9SSbY/7UtRX8JG2iHTONADreaV2OmpogNQ?=
 =?us-ascii?Q?2pbnWnNRwbGimG6zMDLblmAs57iUIHTI9cenTxlV1JLndQJperFcWbIuReNo?=
 =?us-ascii?Q?DIsw7wUzZDxY9XIE+45Emukr3FJ9UZ/FhMkPJfi36jwCqn+2P0aBwhgdivkp?=
 =?us-ascii?Q?Obcq3be50p/wV+R456CyJYo1R3sEgpYmVQWPZXjROCq2l4qHbgLdUfSjAU9P?=
 =?us-ascii?Q?SQqB3QZbPBk84D7u+9MZnN9aPbYHDo8txWDbuYoDtSzD34bBAG7dLxLwuqZ4?=
 =?us-ascii?Q?GstQUdz3aL4/pff4+Pr0Qk8H23PJePmQzh1BiDcc9iMsVNjR6x9LlxOVbcwX?=
 =?us-ascii?Q?jZUKJ1csNvfL8HtgXLWNXPN5bjelYvTaPmFjGDj6Xb1Lf99GLn8v07iHYYct?=
 =?us-ascii?Q?j+KBozrGv+uoIfupKj2cVgQTlMeaBUrkUkDz2v0GyoxGoWLEYbnExn/YPavo?=
 =?us-ascii?Q?MK8doF0qBHIGLvm8r6bkUl/SbBPiBwBObCrtZvV7aEh+09ebV5I5MFEaI5OE?=
 =?us-ascii?Q?Wy5vXB23FXbFVId/4c/77agBqml25yqdt5XcdNEEhWAZ/5YPbie2mGwt7ixq?=
 =?us-ascii?Q?yZVscOSlPVRJKb6HnLAPegrZuiEjh2oIaTp3YYBN9CRtdYWtmpDrd8/4Fb1a?=
 =?us-ascii?Q?UaVbQmnDPPkQ4NkprlCDYAx66lwHoY83uay5UeXH8YqE6eOKNw6F1HI/sX7h?=
 =?us-ascii?Q?qHA4go7Rp8AjIpJHm6qFp3B3vfFK9AXqCAAqgq8ZywgaUcMBdi2T9k4z/euD?=
 =?us-ascii?Q?HKswHgBgHkp4jSxFHREzuzRZ3NU2J3hrYkVb7K/aTaZv/HOt5yDgeKztyMFT?=
 =?us-ascii?Q?XGD+HeMyodk45Ri6JIaOh22REP8FbS0xhAyfrlLED6QROQKwTLwhIMxFS+A0?=
 =?us-ascii?Q?jRml6mJIwKLOEe9y6Y9ay43aHzBw3WAMmq0ut+4JfOqhSLWje26V/cC8flnN?=
 =?us-ascii?Q?M/sOyebnO0u5HQibjVVdeu0GQs7+13Ac99QUTHrET0fg++6Ol90FD08GdoL/?=
 =?us-ascii?Q?a+ueYIsFtB34PNUZZYWWZ7oMLKntEcK9hH/ltoYcfeKigk1wkIZ7liSmjnTw?=
 =?us-ascii?Q?Z9ezSCFlD7652B0b8lib+m+NDebYHQqw6iJx/Ym2oL2+JCaBHz82LjboX32o?=
 =?us-ascii?Q?w9hDI2LjeVr+6Y2mjLFzYwGUyvL8WWZKoKnJkQ88gxhbVCVvZPeSqy73UI0q?=
 =?us-ascii?Q?ENvqfympFhcE6/clioTbEjFVP0nVQroxAhEi1JOxi1h7ULHTTw7erJmELRDm?=
 =?us-ascii?Q?4UD4Im2yZmd9jmAH6VHYBHOclGnP9ZszK+iz?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 10:09:34.8216
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e8c8b4c-f8a4-44f4-7317-08ddb9508bba
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF0000343E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5915

Since the input string passed via the command line appends a newline char,
it needs to be removed before comparison with the event_list.

Fixes: 1a218d312e65 ("platform/mellanox: mlxbf-pmc: Add Mellanox BlueField PMC driver")
Signed-off-by: Shravan Kumar Ramani <shravankr@nvidia.com>
Reviewed-by: David Thompson <davthompson@nvidia.com>
---
 drivers/platform/mellanox/mlxbf-pmc.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/mellanox/mlxbf-pmc.c b/drivers/platform/mellanox/mlxbf-pmc.c
index 900069eb186e..9cc3d4ca53cf 100644
--- a/drivers/platform/mellanox/mlxbf-pmc.c
+++ b/drivers/platform/mellanox/mlxbf-pmc.c
@@ -15,6 +15,7 @@
 #include <linux/hwmon.h>
 #include <linux/platform_device.h>
 #include <linux/string.h>
+#include <linux/string_helpers.h>
 #include <uapi/linux/psci.h>
 
 #define MLXBF_PMC_WRITE_REG_32 0x82000009
@@ -1784,6 +1785,7 @@ static ssize_t mlxbf_pmc_event_store(struct device *dev,
 		attr, struct mlxbf_pmc_attribute, dev_attr);
 	unsigned int blk_num, cnt_num;
 	bool is_l3 = false;
+	char *evt_name;
 	int evt_num;
 	int err;
 
@@ -1791,8 +1793,14 @@ static ssize_t mlxbf_pmc_event_store(struct device *dev,
 	cnt_num = attr_event->index;
 
 	if (isalpha(buf[0])) {
+		/* Remove the trailing newline character if present */
+		evt_name = kstrdup_and_replace(buf, '\n', '\0', GFP_KERNEL);
+		if (!evt_name)
+			return -ENOMEM;
+
 		evt_num = mlxbf_pmc_get_event_num(pmc->block_name[blk_num],
-						  buf);
+						  evt_name);
+		kfree(evt_name);
 		if (evt_num < 0)
 			return -EINVAL;
 	} else {
-- 
2.43.2

