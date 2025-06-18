Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11013051.outbound.protection.outlook.com [52.101.127.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADA5CF9C1
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 01:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750209191; cv=fail; b=BYRf+NprZIWjC56ecrHfINbLuN0CoHi/4APVFZ/sMg/NSLriOD4mlXobIF0zPgShDoFzxApRoHHlrpv9rlM5jlyYQXLULfAu+kjfVOUmEJXjqS/WYMs0TeDRCkN4szzrfvss4ENTbhA/joKEOpo7lLf8U9wNga3/Cs9OQ4hj5lA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750209191; c=relaxed/simple;
	bh=5FDXTu9SkLJ7n48CXvkDZI5TLEr6wDPsf+na/3W8jRw=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=TsSf9OCrKziceI07tNKr2QPjhRT0qRDbsEe4tM0e65PUuFmadWnHKGqaArh0V8ugqvnr/dhx593OKOC8RaXlaFBArFhSXfsDMHj0/MkAggzHrcD2qwqg+eb8AXBQuciv7s6kBA7akEYTdl18DboQ9g8orMMNxWD+4lY8kp/gdjU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=qvhtlmER; arc=fail smtp.client-ip=52.101.127.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="qvhtlmER"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tbBQEvw3hN3U+5UKlQZGUXAV+yu4p8JD61d2TkCgvhjKVSlSa7ceibSAXhilQN/iCaTngQU3r+FyFixmy8RnawH0NHbSSxzBwHhfldAmFFRlShpf91veb+Jkwzymb3VKz0DzBYpLdMdoA/2zvDLCk4YdduWzBEA9A2GhTEqDdnYtA+6hmcxt49LNs3TsMCwSkfu3/hTNh631b5l4wuSpSy3P8hO6BfDiYfv8E6KPmYCIeYXLDscLZEe3EXUfDgb3GhxrKkxiIjrMOG4aNMnnYPTMYYt6ejuKS1mgzUaNv0wOuRtM4WjP1YFnbqn6XU/PwuMU5HEKDqdQzv9kwKil3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RHhfHSQjEjqWvorycDEqJBWRgw6Yn7oF0xmYKmRg1Ow=;
 b=qeqFTWkGmDXFgvMX43Wvw5/5TUUKxsD1ESrEACPtlYC/t7loSH1JEV9E0RLS4DAiBBSlSWENDYmF6fY4I/tC8+92aBg8PzIF6LvKKjTkC4bf8kpzI29WcKcYcvFIN4ed2Ga5ubjrayePhwa8ShVAj5NmoP1rtSRV6Sp0qo9XC2vrV2MmmQf2S5aNXyYfIgpdAZGDYmnXN9pIXbakjX15ySRyDAursgeVdIWMQ+pim2Rydl3SQK4cX0XDJDxhTUqex1wOkF33qfoFAXoyZTVaGrqJEGZdhOog3s2Ac1cbhtoUK197xpIlBCIyPD5nx3zaXyBBVULCjN1DU7QF8f/zww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RHhfHSQjEjqWvorycDEqJBWRgw6Yn7oF0xmYKmRg1Ow=;
 b=qvhtlmERxtz/Q3PB2tWdPeVJ9wiB0ndjuwXRb3yV8DOIiXssPx+lk5qKDnCzAEJH0zHmPRePoojPQCJt29tVSX8MiZkQd1SWq1gH6t5p2ax3xN2+xH2l17OE3d5DsA1vhVvkuMiCU5X4NhK3PnEgSrcQi46Sj1Ns8fXbf3uBCVLpzV2A7vZP24ZlQRb6hHzKLkeTXjndrdEPQ5jKRGtAKT5g3q6U9wzi8aoYMj9m1GnoZB3f4uEMyDYq8b6DW+6NGXxNP0ivJlmUz5NNxM/EYHstpX3nsmQniaJloHT6FZ/urTPAHUGudefwt8utPeAUgcINioSsOb6R+VhPtbg2qA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEYPR06MB5720.apcprd06.prod.outlook.com (2603:1096:101:b8::10)
 by KL1PR06MB5971.apcprd06.prod.outlook.com (2603:1096:820:d5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Wed, 18 Jun
 2025 01:13:06 +0000
Received: from SEYPR06MB5720.apcprd06.prod.outlook.com
 ([fe80::e845:2f1b:eba1:e189]) by SEYPR06MB5720.apcprd06.prod.outlook.com
 ([fe80::e845:2f1b:eba1:e189%3]) with mapi id 15.20.8835.027; Wed, 18 Jun 2025
 01:13:06 +0000
From: Yan Zhen <yanzhen@vivo.com>
To: kenneth.feng@amd.com,
	alexander.deucher@amd.com,
	christian.koenig@amd.com,
	airlied@gmail.com,
	simona@ffwll.ch
Cc: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	opensource.kernel@vivo.com,
	Yan Zhen <yanzhen@vivo.com>
Subject: [PATCH v1] drm/amd/pm: replace manual string choices with standard helpers
Date: Wed, 18 Jun 2025 09:09:03 +0800
Message-Id: <20250618010903.831905-1-yanzhen@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0031.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::11) To SEYPR06MB5720.apcprd06.prod.outlook.com
 (2603:1096:101:b8::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEYPR06MB5720:EE_|KL1PR06MB5971:EE_
X-MS-Office365-Filtering-Correlation-Id: 97d9c001-f365-40fc-dfd7-08ddae05479d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2bddSsbgvWXYTgGQM2NL5NbHJVl5DkAJD1F430E+SUxEVLfSQyAfP5171sIp?=
 =?us-ascii?Q?t1NrDUZCTVGzX6AKurPuAjJPue4UxTk9lkFodfbl0xUuQsSAzCp6ukQHsKVp?=
 =?us-ascii?Q?9zSxtNqp0Zvu8bM2jmsQiFS07Ispqrn3qIzbeQKElPznOZY9t1wV91soNuvr?=
 =?us-ascii?Q?b91ihestYLoKfa2RThg5AtDNP46lWKTtBCjAuM0MAY4yX9DtuDpoRq4KvV7D?=
 =?us-ascii?Q?oW7twosSuGXfGiwsqyruRTDthZ1LvvkTPWLG8NSO97trcGTStQxwy1rlO0Jl?=
 =?us-ascii?Q?qofNvcwRLMI1njgpOunDZrxetlP0OqhYr3h6YpRPojJ1aG7B5uKXJ5qgd8q9?=
 =?us-ascii?Q?KqD5nl4r6dQxqabW+uBjI4EV6xsfgTBmdEmxnCrHapxp6F6qaQ2uPKCRvnQY?=
 =?us-ascii?Q?UxEIFy/kxFS1j92IXmmDIb/t3/iuwhEoHyv8oEODUWGcfTJH3V+07tNS2rjz?=
 =?us-ascii?Q?UfukXKCOFMDi856xUzmbwxLdcZl1/E7M8J05gcrTqS/uTqQUTwhQhq4/kWva?=
 =?us-ascii?Q?/ieIWQKQx+KsBfosKiXVmjnIlgwXyk3NJuXElx31PkAiZq3ssQxRUByBAgu0?=
 =?us-ascii?Q?H8gD8ZMlESiHLE2d7VlqCEHMr3gqvtHj1yqePxm3oCc5mVCwahzSw/Nzg51q?=
 =?us-ascii?Q?sSYKNpgjpCPfpnZjAOyONzMJL/mVTTcqpKa3nlZpm3xbrro7kWYNOI1nSzyr?=
 =?us-ascii?Q?wewKdV13FWloZNaz3e/3nZGPmv8yTPKI4GpQ9RPVh3Zwcy26eQSnGnEnUFkm?=
 =?us-ascii?Q?qR4Cb1sU1mISAAr7npOiYxbGb6PHp0Tj5LdnlIjpX5ChMYg2knKDWhLvgx4B?=
 =?us-ascii?Q?oGmuKH5nD93SJHe/Ohwl5l9tPwXvX0e41Bh1BlYKkXYodfvT9AuKRnpaWz3E?=
 =?us-ascii?Q?XtqfMYl2DtIuAswFaKXiA39R+ghoWM447HpAiSKwqnqhQmxhVBudOw/qmi2b?=
 =?us-ascii?Q?Iz3eL8NfeYk9+wAIBqZvVzzEUviqfQ/l+mOHvX/yXelQdwIeKqVsiqq2Zg+3?=
 =?us-ascii?Q?97oj0ljFGLv6ZerKOK4eoMJ2YCzucgzflEQBv7Jwjg35tOnlwe3x4SpJL3bP?=
 =?us-ascii?Q?AogjZVwc6xMQWIVCJ1zITLYBmvQxaxuEfND+ELucD5awOSH5r4Kmf8ENwFYB?=
 =?us-ascii?Q?JsTGyZhqg3zldK+oKYvFT196N81zSDWckXblUEa+dRZX9j9JybgYRCmA+mEP?=
 =?us-ascii?Q?XI1a/gCtPkHyNf7xn4EehOoXx7k2JqtzBh5PXrmORfe6OyElaUCOCscpzpy0?=
 =?us-ascii?Q?liHjd3FAAFLptxqUA4GStorCYGHgcEwgzw9dDEKwB9HOx9+A8/FBdBE1aX+D?=
 =?us-ascii?Q?gLOpveb1Lubx2yeKKkr2poQ0CHEZTBthXfRwCwttlmKQItMIpbXyHqy47Udd?=
 =?us-ascii?Q?vJNiuLaIVnBktB8f4TaiRAaq66suoLh50VqFm79wD384GAGLvIptK+1Ko6cz?=
 =?us-ascii?Q?ZaGZ+U5kZ38EE86L9gtQkXpgYWUZl0ldzMGL7ZT4f9kMh3+bXojnAA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR06MB5720.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?e52KWUy3Z8bnYp/jozEMVPM+37hr/psbTChgFrU/+d0NwxWwG7PY5Le+T+Mh?=
 =?us-ascii?Q?IZNDkTO+CDEECt1OX45v1AeGVU084eDpQK1vHEN5egyqqi91v34BHz8QZjUE?=
 =?us-ascii?Q?7eYTgncNtGQBmT8STp5zrQ+4RhVObRoPqBV4jtSt5x7XGlkPEtH3xpB5y/lI?=
 =?us-ascii?Q?O50900UKFRXmRRXPZIBrpT6ub0/Je7BMdd6u2C5Z13YnW1ekffZ0yZOHGErs?=
 =?us-ascii?Q?qaNvaapPtxdEs2sBsy9xaZHkwbAgmJNo1bK4bH/Btgp+gJel1+wnKR+8hOjP?=
 =?us-ascii?Q?6wIUs1CO6b/naUZBgprd2rId7HMZOVBRMuJ5g+1lIwOAjqnU21qPHtGiUhL2?=
 =?us-ascii?Q?3OFvbxMY99mEraEzs9crDIS86dboKykx1jM9NbBTeBa8ALxYH9dMwPlfOMzE?=
 =?us-ascii?Q?NRcvy1ERdJfHDBuLQ/Qv5DMbvTMN+3b7ZMj3xvhoEFSGpEnuoqbZ97VPQz9W?=
 =?us-ascii?Q?u0wFdVMV5T0R/HKvoduRo4WnCyX7mf0v1ByzW+D8gc6S1SzNaTtTfqmJkiHG?=
 =?us-ascii?Q?uPUM6SxTIhYxTZy80yRxYRRVyVuifs9x91mv/yjTx8So+g1q/RQC9bZfcyn3?=
 =?us-ascii?Q?vvwrVnKn89gowIkyK4JQEwzqCInJQbq9Z0fbcrKNtBK1mzao2mNgkVcrHTPW?=
 =?us-ascii?Q?4NIOR1GS3J019GcxWcNixgKLDQyeX6MPbgm49TT5IDZhe2kAlrzpghVT810B?=
 =?us-ascii?Q?xQiBlIVKLwZ6yzJMTzYh0hP3HRw7HTg2xorqiF+/SrIfrlT3uy9fGR/7gAP6?=
 =?us-ascii?Q?M+oGPtO0mA18PnL+7GQ+pNtBx+HcJHSML8MBOO+HQU7pASMfLWQf1gS2wVA5?=
 =?us-ascii?Q?e266AMIwaAjrpXn8wACZOzS75/iJBQpMPMFJuIpd64ltN4aRjL3vDNNtTBsX?=
 =?us-ascii?Q?arKxinjp4wUQGHRx9C9L8szs0RhveK3eNYQkTcmYaL+0DNDGJvz/9T2nP1mX?=
 =?us-ascii?Q?7bYkeS8f1pHvnBsjrkpxLUU3sHBgaWg4kTnSaUbR4w2oSVge/B1/mrGN1ItT?=
 =?us-ascii?Q?+NtI7CXlp1ylSFhcuEs2dZRJzS/TbCE39fZK1ed9oYNcoVj5m0pXmODJEkwI?=
 =?us-ascii?Q?cF4tr93lhsJ2umrJKyiRgLxU1sJCL+EJbAfZ275WSJ7HQOHKRakl3aTq9dzr?=
 =?us-ascii?Q?MDRq/s1DyE9o0BDK9t1ccAsHNc4QR3sm+tamYDioAH7i7ogGsbFw9b1taw2p?=
 =?us-ascii?Q?HfEs86GookfJZdXpOEYIZxFy4gPnwi8eigXKUZrrFnpoOl+0rQRyVueAGWe/?=
 =?us-ascii?Q?xVt/2BaqcFJe6p8yMzTJ3M6+G08SJDji79Y5Pb0GPthHSeYFXfXZNh9wJJr5?=
 =?us-ascii?Q?bv8jTbeOtUuIXG0FH0VggilBrXZ21+OLx62DjiLZ/C3YDw/79wdId02jL2Dy?=
 =?us-ascii?Q?zSWUnjzfP9ZSjqRZgKQ6bqNyl5MHAzAItaTwFrWH6CShP2THYMRzdQZ7QdKJ?=
 =?us-ascii?Q?Fq4sEevzTcy2Sb6zv5itBfFTLIwRsTTqaUqa0FDSCOQ2f7nGrifmXDqyq8r2?=
 =?us-ascii?Q?42IKGAmZBgqRZ5PYIUBXpzSTu66RibZvtZN7VHcViEMRNvmWZu9/ouLzIHcP?=
 =?us-ascii?Q?Ps7kJWWIU6gXySHZYtqahdbk73ko27n9wkN26ovb?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97d9c001-f365-40fc-dfd7-08ddae05479d
X-MS-Exchange-CrossTenant-AuthSource: SEYPR06MB5720.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2025 01:13:06.0147
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BFwVFyhoMj5sh4inia5oPPb2eBwnswKZA+lqoUuHd/6c7ApkctaZ3MNz/hHXFYFYDHOE7tyo3yYKabVKRvOZyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB5971

Use Linux kernel-provided helper functions from <linux/string_choices.h>:
- str_enabled_disabled()

to replace manual ternary expressions like:
  enable ? "enabled" : "disabled"

This improves code readability and ensures consistency
with kernel coding style.

No functional change.

Signed-off-by: Yan Zhen <yanzhen@vivo.com>
---
 drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c
index 9ace863792d4..4c8a1fe59b4e 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c
+++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c
@@ -25,7 +25,7 @@
 #include <linux/module.h>
 #include <linux/pci.h>
 #include <linux/slab.h>
-
+#include <linux/string_choices.h>
 #include "hwmgr.h"
 #include "amd_powerplay.h"
 #include "hardwaremanager.h"
@@ -3012,7 +3012,7 @@ static int vega10_enable_disable_PCC_limit_feature(struct pp_hwmgr *hwmgr, bool
 
 	if (data->smu_features[GNLD_PCC_LIMIT].supported) {
 		if (enable == data->smu_features[GNLD_PCC_LIMIT].enabled)
-			pr_info("GNLD_PCC_LIMIT has been %s \n", enable ? "enabled" : "disabled");
+			pr_info("GNLD_PCC_LIMIT has been %s\n", str_enabled_disabled(enable));
 		PP_ASSERT_WITH_CODE(!vega10_enable_smc_features(hwmgr,
 				enable, data->smu_features[GNLD_PCC_LIMIT].smu_feature_bitmap),
 				"Attempt to Enable PCC Limit feature Failed!",
-- 
2.34.1

