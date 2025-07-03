Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2133.outbound.protection.outlook.com [40.107.92.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0D1A2D879A;
	Thu,  3 Jul 2025 09:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.133
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751535825; cv=fail; b=m0lmgWPJVTGowyqNt9idcAYGgihh17lsqHsJDGj2gifS60RsngCqdkRkOJB4ICWG/PHc7ttxEuvnHAOHyDpkrgNOWcpktHy/+N0b0YS9hPzwLORmLwfVp2poLBNWW9AzV6M0+xGGzmbzuoCFvaoPYkk2F8tO0Xy6Ix7tPyvMQ0g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751535825; c=relaxed/simple;
	bh=tOfLWJgRsw5+yz6KxP1dmMc8l4K+D1BElpD+fbBBn7Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MjImZt39tQs/zuxIwmGaVvOtt+EwdNZAv+3XzB13PaMURpJVELwn5In3+M7a+oXpMAG1mygpz8+o8xCkCKnOO5DhUkbq3PknJVFhBSuBDBtLQwPgIP1We97I6JviBfct/WEiWoJk5BZV9Sul3GNQ5/a3L4cJ/oN01LeOqhfjzV4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=os.amperecomputing.com; spf=pass smtp.mailfrom=os.amperecomputing.com; dkim=pass (1024-bit key) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.b=rMT1XGN8; arc=fail smtp.client-ip=40.107.92.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=os.amperecomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=os.amperecomputing.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.b="rMT1XGN8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JPvLgISJV2j1Z93Vp8hXfZ4n90x7wannHSj9SWdkhu6PHvNcW159pYxMktsZcCCM+df3aG0YCxpQiY1CoG0FH8nmJmnV3DEapFXMNMQ4mu4vLtHPx+ZULyDe6BRrEGtIE9ymNpKiSZBWN4BX+6APwjpP3h+w1yVI4A169AwtfUn7T19diX8VMpwJ3lv8qfvih1sQEgeJaI2HJ/uv7qDO/wgIVimS7z/EJurrFLHpALZ3IvKEyhhciiHjx7EM6dwF0dDJayJHgav83mMDLw5phG2apehPDijFAwYAJR6iUzCigpfxpH87pM+ozG+GfA9hea1hWsR+EqgdqSl3oFaqyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N+GaD3PcX+zPp21KQe4vDXPP3fIWkmZALgd1bQoB0lE=;
 b=jj+GP29bcUYknZRb8ULKfpcatCqN40Fjln+H0ld4Frq7qbdD/3Zq8Hao9L/pllpq6trxTB8ruZHI3GrrDqRZvK52Bhj8ze4XlHnY7s9pYeN55rCWRssnHS8v6uKRGtuFWoco2Pe6g3ZLtBHAi3dKILEdtdFxToppFCyJaaG4uoxtt0AISqSXzlSq+Nuol6sz8Xy8EKhujcokcM8kWwcMyaa6dEof+IvZpEwaJLqUy9dmYI1Q1Gz7UqTPSNO/bnJbZMU1htu0OSsJxHoNdmXHoL/w4ec4z7EtGGl/2d35WloO7uRLjs8aK12JGoZCwFxRK0grcCGmfvcGCpBxA5ZN9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N+GaD3PcX+zPp21KQe4vDXPP3fIWkmZALgd1bQoB0lE=;
 b=rMT1XGN8ciVo0pLQz7c74PwUxtuszmqa2FpYAfwykCyS+eifHRloEivY5RpR5nSeWD/pyV5iWcoDSTInTvJQrDLZToV2fSyFuFqSh0JTuJqYuFgd6aY21wzUfXAy23a4dg0SsFxdws2hMc61meS8j8jbXkuykmZGAXyz4t1cgx0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from PH0PR01MB7975.prod.exchangelabs.com (2603:10b6:510:26d::15) by
 SJ0PR01MB6399.prod.exchangelabs.com (2603:10b6:a03:298::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.20; Thu, 3 Jul 2025 09:43:41 +0000
Received: from PH0PR01MB7975.prod.exchangelabs.com
 ([fe80::6926:a627:118e:8050]) by PH0PR01MB7975.prod.exchangelabs.com
 ([fe80::6926:a627:118e:8050%6]) with mapi id 15.20.8857.026; Thu, 3 Jul 2025
 09:43:41 +0000
From: Huang Shijie <shijie@os.amperecomputing.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	corbet@lwn.net
Cc: patches@amperecomputing.com,
	cl@linux.com,
	yang@os.amperecomputing.com,
	akpm@linux-foundation.org,
	paulmck@kernel.org,
	rostedt@goodmis.org,
	Neeraj.Upadhyay@amd.com,
	bp@alien8.de,
	ardb@kernel.org,
	anshuman.khandual@arm.com,
	suzuki.poulose@arm.com,
	gshan@redhat.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	rdunlap@infradead.org,
	Huang Shijie <shijie@os.amperecomputing.com>,
	Christoph Lameter <cl@gentwo.org>
Subject: [PATCH V6 2/2] arm64/Kconfig: Remove CONFIG_RODATA_FULL_DEFAULT_ENABLED
Date: Thu,  3 Jul 2025 17:42:12 +0800
Message-Id: <20250703094212.20294-3-shijie@os.amperecomputing.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20250703094212.20294-1-shijie@os.amperecomputing.com>
References: <20250703094212.20294-1-shijie@os.amperecomputing.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0014.apcprd02.prod.outlook.com
 (2603:1096:4:194::19) To PH0PR01MB7975.prod.exchangelabs.com
 (2603:10b6:510:26d::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR01MB7975:EE_|SJ0PR01MB6399:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b3feb63-e29c-4eed-b841-08ddba1617dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Jt6oE1If1GMkOmkZFxdk3beguc8VmIx224LgXVnwtNXBaiFYCtMQtBMA/ws/?=
 =?us-ascii?Q?9X4bInPIT5V7azsAr4lG6mzk7NAofHwOK5BxykIbMkDmIDA09Nq/h34U9ms6?=
 =?us-ascii?Q?EQhoen6RnFVqy7J3K7FQoBWZ+crbdiwDNbYndvrk24NIsOqPyYWk3zhtZEIa?=
 =?us-ascii?Q?xx26NkGoRXbtnUMhVeAtyfobYOn82ItAslCK1C53RYKSStjNFGsisBmR6Tug?=
 =?us-ascii?Q?fGSKQuc1+xrAsRErkm8l0GHuGABO22p9QBsAtgY1f0bDW2xmKshGHebHGp6J?=
 =?us-ascii?Q?hpWrLj2JQeo5wrnHaOF0C3IFMDKfRRfcJ43njqHVLAElHeVgZpux2EZomZ27?=
 =?us-ascii?Q?0SYs+p+B4i5KpYNazc7t+2J9sBtQDRzfQq9FSgPXpNtdEjfW5NbSt1EAyKRo?=
 =?us-ascii?Q?FzDV8rmH4z4f80V8SGZXJ2/Z5OAH6EzRYDEq2XVM9P7p7psySnv8IiKDuuRe?=
 =?us-ascii?Q?nIsGJ+7LGlQG7HPw7bkRgGEM+LbZoayfHYvuzI9Y2lf5aJj/aJGZbopOmTuq?=
 =?us-ascii?Q?FE7u5yoKF5865i/6hFs896jOt7hzpg9MqMjiw0e53/Yk4gT/OftdENPjE+bR?=
 =?us-ascii?Q?+FPnG+qIi2PmSRrqg/NDZWHZHeR30pimT9e+cXijERp3Qu2CK1u31ZCMKMeH?=
 =?us-ascii?Q?9bCRxqIqFBf3Gzo5s1AOqCeFaVxXAkw2wabZTQU4Rtc3lUqi3S6baG/H53Vh?=
 =?us-ascii?Q?G5Otr3H/AjAcBBLFvFlwcU6H4DZ0oz50W54xFBY1OgEtovih+uageOVJD8Sf?=
 =?us-ascii?Q?xm+E4kr5FkZISvzcKe1GAG1VhtMogm+Y5lNTK4841+45KJfZpWqnRc+4/P0B?=
 =?us-ascii?Q?Z8TjlY53iEsmemlWGza/rBgSSF02GvdmheF1xXO6YTDKvtb0uoHb9O62PJm4?=
 =?us-ascii?Q?7Ku1LlcZkJmZntBu2HPkIalAvMjCXwSIAdOZC4W4pX7Am2tL/iD0YP9gx6eU?=
 =?us-ascii?Q?xpE0Y51W49x6lqnW5tp3PsIlwAYp136V9nzrn52w9R0Dm7zTmUNj8DeQ9t1s?=
 =?us-ascii?Q?dzzIUcOLnc8UaYXgamVbc2Pk+jC09FtyyZuIIcv/KPOayJ9Qgw3MXZ8gZFr+?=
 =?us-ascii?Q?jXa+o16ZoMfvMCn2ocNHoFYYYdssyKVitdAixBQ7QEV1haYf182sSRz6lvH+?=
 =?us-ascii?Q?0xk6fARztfM8yhgHYQtdh9hfVEEK63cQIOWg77aZX50xz1FFMmBCxXZQls7a?=
 =?us-ascii?Q?HL0adxJ4pfwxfGJcdSHK+RyPDcCjwmKP/ZXDLKOkuUyN3Uda83BfzX9yY3M+?=
 =?us-ascii?Q?VlE8KhcMSGIk/Sd3h+S/6y7JaA1CbCVT0wPtBTbYyupYPn+LejmWYopj11bc?=
 =?us-ascii?Q?h9wzclfDqgk20tg6xXvEN/zxPxEIXd1/dTJa2rzi9xFq5g5+GVKSn8dPoJkM?=
 =?us-ascii?Q?vWtxDoR2XEuOH46s+mNx73tvmy2mrXg+aNAxcpMNk2iNjTovkLP/FPFuZQ+u?=
 =?us-ascii?Q?sqEuzm+Jz9pnoO7aFnmNO2YNfo8aGqiphdbb13i2PRTwOOGHqiKDwg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR01MB7975.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(52116014)(376014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uFhOl2htd24ofHvtT6AUyfqf91o3NO9nvxbcoacifol9/QbD0t+pxcMvUjTi?=
 =?us-ascii?Q?dKqIRepjIXubBQh5a86b4pIDuZBdHVRXLgn9q7Gr2LH0712f+I+pQEfuS7XA?=
 =?us-ascii?Q?WidDIK9NQ0QbHOpuOguQRyPOJvZq1MJGM40fNLRSJ/FPq/nzDWh5h5Nl1A41?=
 =?us-ascii?Q?asjVXvK52EnTO3X57SzCSNWbc6AqY+dsYbv9ImRq32H7HS1Vo50BITp6lvFv?=
 =?us-ascii?Q?wWyVAflnCBEuwlTfMYLJHAMxxz8u4aKnZ7Q///mO1TW7+S19Rcmis49zLuNm?=
 =?us-ascii?Q?w0ycXZvpNz6I7ysC33IZMIbDH1/g+WtS1K8GCZVOgfpRnIw/XiiToGKBdFd2?=
 =?us-ascii?Q?VXL611BjoRXIwAADEVz+H8vdFiE8vys764HvHNH8q8JH86kn2QAIAVIEVF0y?=
 =?us-ascii?Q?B/aXdUlGOYzC4cPo02znekhTuQna3c5it+vkI4XO5ab+bnEucLE1CLHgZcbv?=
 =?us-ascii?Q?a31myIFVyBaCXFTm9UvZHqNyYJGX0drlyq7r0IvNh6BM7P1tj2oT9mnO7ZJy?=
 =?us-ascii?Q?mT/og2d6IDBYCKdPFsc/wCmUMmk1HX5ii1pKyw+ipgkHRgSOnsMBt4lFEpKv?=
 =?us-ascii?Q?xLPt5KRxMs5M8Fmj/NV4eLea1kvuiSHk5zdljEb/8TjbHcIZM9W+p4ea/iIq?=
 =?us-ascii?Q?1swXqVJnE025LTSRLspzdGpjp1B3zH3jdvdDyKFA7y6UIN3rssVkWEjI3GtB?=
 =?us-ascii?Q?KKM2/bTIbd97tI0GoJeXncCqoDFWX5e//uxbFrX0LWmxpSEPBua87nJTDWZn?=
 =?us-ascii?Q?vrv30FBR7ntRDW2csKcSXAAQjAzPHBOjIbN/NDtU4qVKS5y8u3VOfCxcpF8u?=
 =?us-ascii?Q?9Oov+SbWT4ZQE34DQkHB2kIj/x9EyZ3oIN6XKWInTLlOyfWbRDPFKYdLtG2R?=
 =?us-ascii?Q?YEjFD4L4iIWi3CxEbUxprwqyI4Gk/1IERemG5n1n2IPyiAzNaEiIK5IYEXPS?=
 =?us-ascii?Q?CilijDHdZrmI0OWczhQNXHsSyf0sM10RY16HJiMKFZMIWP07mbaLmpEcnIpf?=
 =?us-ascii?Q?/qz6z/o7h6FZqrWyPFG/RL7TsEti52+EAMQjrFpGUGU6KtJR9ozl+nDINMF4?=
 =?us-ascii?Q?qkFasc5WqlBUsfMrcnES7igcWqVDWz6gu3+vZdJ4PomXKddyTlP9vrqdk73K?=
 =?us-ascii?Q?5VeN+zDi9lPut0fUd64t/o3iG8/XBklugJ/VDedQbx75ushN3+w5xjsjk+Zs?=
 =?us-ascii?Q?9XhMztV4zWtHJ50WGerMPRvsWHg80VxP5wBXm9Ix1+Y9gbZJZ2pC//hGEN28?=
 =?us-ascii?Q?mE+Ca2tw7bZGS3OjIMTgdFksqZ7hgRn5IXRu5cQbgtzV0oApeuGrgdDRs9N3?=
 =?us-ascii?Q?I6G/U1bAxFR7ClySwJ1pHtkDXs9YQ3acyRFS/5IOJw5H2EY7/QWUHqZpIwVf?=
 =?us-ascii?Q?dp3iCo+8hflzBChoqo/onlW+0FfYx/hAiA5+ImpJ+g940Lig8MpijWGHunzv?=
 =?us-ascii?Q?8DhuQBbWEAcZd1Y5x4yiO6Tedm235j5wJRV/8G9nfo9DhDBNwZdpQ6X5pMuf?=
 =?us-ascii?Q?hEGIz6uddn6K6PHyfqjQ07xVQ0DeKNIjiSxodGD2pADCNJdM6U3+XH1JTlqA?=
 =?us-ascii?Q?kpp0ppmOYRj9d7RBvZKfzDLlTfNHPR93vGiAJ7BR5PTGtojNC9IQ/mSzvdI4?=
 =?us-ascii?Q?QNpYYKfFlkeTp6kbHpCE+Yg=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b3feb63-e29c-4eed-b841-08ddba1617dc
X-MS-Exchange-CrossTenant-AuthSource: PH0PR01MB7975.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 09:43:41.2656
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IqgQahw32ovO+RqJeXobuoMDicXblhMKZeZG46s2faJuLDjzqKNQSM1AJp9WgqByhBev66ldw3QK1/YYRlglR4/yGacYjOPCcMOpMt0RhOCyb0tv1vSh4pTU7kCEI4/J
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR01MB6399

After patch "arm64: refacotr the rodata=xxx",
the "rodata=on" becomes the default.

     ......................................
	if (!strcmp(arg, "on")) {
		rodata_enabled = rodata_full = true;
		return true;
	}
     ......................................

The rodata_full is always "true" via "rodata=on" and does not
depend on the config RODATA_FULL_DEFAULT_ENABLED anymore,
so it can be dropped.

Reviewed-by: Christoph Lameter (Ampere) <cl@gentwo.org>
Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
Signed-off-by: Huang Shijie <shijie@os.amperecomputing.com>
---
 arch/arm64/Kconfig       | 14 --------------
 arch/arm64/mm/pageattr.c |  2 +-
 2 files changed, 1 insertion(+), 15 deletions(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index f9f988c2cab7..12a70f10f7bb 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -1694,20 +1694,6 @@ config MITIGATE_SPECTRE_BRANCH_HISTORY
 	  When taking an exception from user-space, a sequence of branches
 	  or a firmware call overwrites the branch history.
 
-config RODATA_FULL_DEFAULT_ENABLED
-	bool "Apply r/o permissions of VM areas also to their linear aliases"
-	default y
-	help
-	  Apply read-only attributes of VM areas to the linear alias of
-	  the backing pages as well. This prevents code or read-only data
-	  from being modified (inadvertently or intentionally) via another
-	  mapping of the same memory page. This additional enhancement can
-	  be turned off at runtime by passing rodata=[off|on] (and turned on
-	  with rodata=full if this option is set to 'n')
-
-	  This requires the linear region to be mapped down to pages,
-	  which may adversely affect performance in some cases.
-
 config ARM64_SW_TTBR0_PAN
 	bool "Emulate Privileged Access Never using TTBR0_EL1 switching"
 	depends on !KCSAN
diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
index 04d4a8f676db..667aff1efe49 100644
--- a/arch/arm64/mm/pageattr.c
+++ b/arch/arm64/mm/pageattr.c
@@ -20,7 +20,7 @@ struct page_change_data {
 	pgprot_t clear_mask;
 };
 
-bool rodata_full __ro_after_init = IS_ENABLED(CONFIG_RODATA_FULL_DEFAULT_ENABLED);
+bool rodata_full __ro_after_init = true;
 
 bool can_set_direct_map(void)
 {
-- 
2.40.1

