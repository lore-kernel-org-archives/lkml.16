Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2069.outbound.protection.outlook.com [40.107.94.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFB2828C2C3
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 19:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747336666; cv=fail; b=gr3Jr+Ea70BpNlMq4YqGJm9cTVsG/nA6WgTqDLVgND0c2sTXTA+wMKH7RImLuj1VPtlqDFhZWEyH8dQG1CCgT7waqNODUgmX7SIqNx1eE589YaUm4R1PXbvMnSMnBjZMlWGF7Fg4r/ZSRuJxqMpCwMlTKehXz3EqKg8Ba5dzm0E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747336666; c=relaxed/simple;
	bh=Fugc4yxPAa/Tn5c6Yxr3SfShnaTufa9+j4M6+Ahu91Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XHzK/qia3sKZlQq3rvyyw5AOuA1uklwS3g/qho1sk6tOxCg3mwlytuiy44v/xWYO2qMDINhj7m1VeclFEVXNejNBBT8W0yMtNnR5+m4cH2mgrUb0bAaRTxmyw8dPEtOn8lrC0uhWkWbgOn0MMm6e0Rs9ZTdkKaLxLEmCqFaX9wU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=oZtNPhex; arc=fail smtp.client-ip=40.107.94.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="oZtNPhex"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g317HAIYKiKA9iWH8+ah9wovrlvmAFzV09QEBy06YhPGEx5ruMIDWDdm6Yr7M01GSvz+wgS+N8UXthq8uu437gU/zVIyOlGyQP1+25fOpTRtzj54Ez6//JI6g/4YEM3y/wCWleceDdT3amA6wiT5l9a91BsLbGjqRqRzhFVrcn0aJZyx5ZgOOjhR/AMCLDU2OjUXwPx+Znyi9l0/3gxCPw/YGXxNJRAkG09XBfs/26bRpvNj4fTlUSGHCvR/NaWvZWCKCs1xheVyqc7Z32LVgj9SD83jtWp5OO5efDGkUyvew9+unke1aBtQcbVR9n7CO0AvFN6R8eK//KL5I/m0ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y+kwBwk4aMjSMxB9xko5MhczqC4y5MH9Zc3MuHaYf5w=;
 b=Pe/nKcca1UsTR7bZVDffs1gpC8yhqYvU6rgO0tDbjJ6iTyaf2q7+iftNP1UTKoMlnDRJaIA5iz45iBy0PN/Gd6vPSFr3M/q51aGzgOyz3anxsGeuzVh8eainPvc3CGdJ4vj/oR/DX9YmR78VmhjCdSsAEksuJtwx9zIGDmzNPlZHHQRfPZjnhAsWTj3OD7S9PzlXzJekO754VvZBLqtlCM2HdENeIDNbaCchYfyxR0jfLr65LZ0TDIALEdl54qDK250THo7VHRKw0sgSoSeptAU/vJ5hdJcFMGQloEHXfr8QQxRH1Dxr8Wc8OBw8y2W0JRD9KyqJPYoE0qFYThnjGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y+kwBwk4aMjSMxB9xko5MhczqC4y5MH9Zc3MuHaYf5w=;
 b=oZtNPhexKqngwmry5NccMSuUtXNNq03ZZktNSk12TTeH5KXghx7MmETOnABrp8rnDMUc7VGr0jqaEX+hFfAa8sMQA19Co9bMazVwu7mEhH3IsbhczkrxjodkOcc9AmORfIKBya6KlPi7LmnmgY7hgxnNDyIqgqHjoR8ahU4eRHdjxlT1sgEzw80ff5xRKyJCwl/Wq8ThpNgiYdNEnSjgCFaXsHTScRbp+7tLMFrwCgObCoEQrRdt+GZ6N4wH2TD25V5sSLobOCn8AHDbF+mO2bPjzO0Wn00NCn5dMTFAv+PIbySWBxPpEmsZ9bFN5ztpyb/Vp8cEvONFvJtWHP/Mtg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS2PR12MB9615.namprd12.prod.outlook.com (2603:10b6:8:275::18)
 by MW4PR12MB7192.namprd12.prod.outlook.com (2603:10b6:303:22a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.28; Thu, 15 May
 2025 19:17:39 +0000
Received: from DS2PR12MB9615.namprd12.prod.outlook.com
 ([fe80::ae0:e4b5:9c68:2ea4]) by DS2PR12MB9615.namprd12.prod.outlook.com
 ([fe80::ae0:e4b5:9c68:2ea4%3]) with mapi id 15.20.8722.027; Thu, 15 May 2025
 19:17:39 +0000
From: Andrea Righi <arighi@nvidia.com>
To: Tejun Heo <tj@kernel.org>,
	David Vernet <void@manifault.com>,
	Changwoo Min <changwoo@igalia.com>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] sched_ext: Make scx_kf_allowed_if_unlocked() available outside ext.c
Date: Thu, 15 May 2025 21:11:42 +0200
Message-ID: <20250515191716.327518-2-arighi@nvidia.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250515191716.327518-1-arighi@nvidia.com>
References: <20250515191716.327518-1-arighi@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0P220CA0025.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::16) To DS2PR12MB9615.namprd12.prod.outlook.com
 (2603:10b6:8:275::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9615:EE_|MW4PR12MB7192:EE_
X-MS-Office365-Filtering-Correlation-Id: 349254f4-48a0-4ff8-1714-08dd93e52846
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?sn+2HG5cQmdZkP3Ku5RY82lBAM7mLwcMYwVtmB14QsiEIlV33SdwHZRsi8rv?=
 =?us-ascii?Q?YGvY4OOsiWLt0Xz+kHQ5InpbJJdh9L7+U27NMWxmakGp90uBORoBescFjW71?=
 =?us-ascii?Q?TSJheMv3jz0cXhJtk4Xg7dz7+7yBlZOw3H2DG30Jzv+9FgK6mYIW3L8B9aJC?=
 =?us-ascii?Q?17sqMoulgOcPnTvMX0C3SiDjslD71k0zryy9nlDzdCThvjO1Kw0DZIAAr+ql?=
 =?us-ascii?Q?HojuOGoqUneoo1+70hRH5PBNKZyQurcLa12U8g6T8lWokqbsi1Ocf+Pnar4v?=
 =?us-ascii?Q?MqchWttO+X5eCweQvQnAAYouvSR3EPwJJWgWxjZ0RXONEtyLWutYIa+0cSKQ?=
 =?us-ascii?Q?bCSdl+MBjPhaR5JoN4p1vEARJ2R+TEOIlTajzK4k5N3Lzs7F9K/JkyCXKKEH?=
 =?us-ascii?Q?nLpJZd1T1gGj60GSeJm+yHRwyz69UCrdUmdXpF7GzeCBE24zHotqHBvMEN0k?=
 =?us-ascii?Q?wTZMNR3wRu1qaIl33E757YCvloNX0VBbRwI7b2zJ3iJoDKLb2d2jYzb3OkiR?=
 =?us-ascii?Q?lvaeW53LdvsJWruUOSlJ01V7BtRLymZtZjUvOegrA3KvOXatReibRUX1YsYK?=
 =?us-ascii?Q?j1p+T39VKwIWFhUPEG0QlyJrveKsFhZmAxkj6NYb0LWDPm0Gs9DnehUatgGx?=
 =?us-ascii?Q?L3TAT5bhUuOunB93iLAeVhV3QX7VNw/9RsjU4XlASH662B0G4ZVGMeQJ+Fnc?=
 =?us-ascii?Q?SDulOzk0lKJferbUzd/V94VAj3DuZLGmT3Zc1h0db7bjIWsQ4S2pzGEMG0Li?=
 =?us-ascii?Q?WAprvueT+AWFCcGfChsx2dYfd4sC8QPVQV7eGRKWfp13RphUw/QVMISevwnm?=
 =?us-ascii?Q?fwPfyUVpzQGwcZgIEnl4aQl+DQxiUCRvacWHEXEzcNYWdsB+tLCwUgH8PJoh?=
 =?us-ascii?Q?uYYxUjQyI2GZXoylblIoVa5YW1Yod8yIv8202L+AjHsARFoSyd/bSntO18IQ?=
 =?us-ascii?Q?TIvRGkknibOV2uJYt2trBB0OBxv9lfd8h88mY0lBSzoq/AV5tl6h2baUmuRo?=
 =?us-ascii?Q?pHKmY4nu2OqgAL05AenXgvvMNxvw6gm6uc4RghE2R09U8LHMQIf5Zwv6yzat?=
 =?us-ascii?Q?GUbhKhm1RBFonkR3aMbMRUOr48zxVcqxbRDlOt3OI/rWrmAU4/qun9+Jd20U?=
 =?us-ascii?Q?dVojQdIwGOqKoSa9Zitn9a3yHbF6OdNJnxCgTLTKarBQ+ix4jQrmoVFfL2uZ?=
 =?us-ascii?Q?ABf8kdw94i+myVFtqVqnSDkieYzLupmWJKwQpvO3nCBZ0/YB5wi0u9i3ZnpH?=
 =?us-ascii?Q?KAlbdvM9NoZ7bDYABswmF+29XNVfrVMKmb3D8zxCwjSikZ6PrX1E8YYsOjbE?=
 =?us-ascii?Q?7TKVVj3jvUsKGB9V71Ysk35AgmXuqpbzroNKU/ChaSVxx36Rnkf5PfjEnLPR?=
 =?us-ascii?Q?Xm2OAM2vnlH2BPhQHB9KJQm4FtfQr9d/QZAwfjx38ZNvJ15+6DQ0oFu614LC?=
 =?us-ascii?Q?EwAfJ6cdtJY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9615.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?x9JucErJBAszz8noCGJEKeOr7yK5kyk5/FCz/26hmuiHpGhVUMVJE3Dsmb9Z?=
 =?us-ascii?Q?8HnIwdWMmgVMxAhAZ0l1Olg/fM9ZN/xw+mn6xjDaBGzkONZq2c0cWGo9Bwmy?=
 =?us-ascii?Q?94dJ5ClcJkXHPB9MjDdGV9M9M8PKfexxofixNUisye1iVbRUOC/OFDIu9KEA?=
 =?us-ascii?Q?SjYOqlL0/lB3RZLOp4tjHmjfIljdMmzqOEzY5AZq7qBWRgjHFl106xo4TmMT?=
 =?us-ascii?Q?3hAC5M3CJx/32RCyGGQOAvnpOXpJfQ44b4bvzsR7P93MGOLUHo9qbxgUgDlp?=
 =?us-ascii?Q?5/xlRpnw947BDfRbPObpsDs/bmBYBUOATaDypbaAZxIQAsOA31OMjK+Q/Z20?=
 =?us-ascii?Q?NOeDYhMRJFm37cTg1Tv+KC1XqfhdVEb3V2nskOcDCA3/KYtQtKD40HVJRUOA?=
 =?us-ascii?Q?x8KpD7dGuJ6XK2KoKbfYFyY3Jdc3212bWlZycHmk1TwBlt8rbFmXSJohOrya?=
 =?us-ascii?Q?imtsAIPIMVedNyKU6CdQMiLComIUFWd1AfLy5RXdKwpXmyU6hAhuOyjQ51zR?=
 =?us-ascii?Q?r9oXK1ABCEIWLxxdMiZPxIKIpwMV1QhApe+y42FXDEa55fwH/kulpfNEluZt?=
 =?us-ascii?Q?zfF6WT0DsmxZxOHUnlgErnx8khf4EIXvbLgtaInKeM622SLqjrFRmv25n7nu?=
 =?us-ascii?Q?kRxD3LK+12e35kIRyNlvPEGMOb+vk85x4ZmcCLLrETMDLw9jHPxWP5qmBENx?=
 =?us-ascii?Q?6gAjvTsM2R/ePnTVO4r6KnSdYWRciC9SLf0KvUPn7KbsFZJs8UoADUPULyD2?=
 =?us-ascii?Q?9UU6/Kb8vOCXGPGojC6dCgAce8zbh35UKvItkXebalz235v4GHWjZkylntkx?=
 =?us-ascii?Q?lK4ziIezxrqju125JN8S2XFCk/UtExkQXRJlP6X9Rd9GF6F+JH1vZInitQfZ?=
 =?us-ascii?Q?uZB8ZvOJYjoR+Xns0ZBrNHoRpu8bUvoISZvXRutNsxoa/Gv3xuuWl6CCgtUJ?=
 =?us-ascii?Q?2L61zwZYK5Ez9ZLa5Wca9fLVoPkPfxtgW/zDlDHYkjatryowS0ja14+HtYq2?=
 =?us-ascii?Q?ZP04mReuWmAnyDyCoxRHoKKc3ywsFQ9EtELlMPMTuzEt8zy2cJ09P/wfzzex?=
 =?us-ascii?Q?ganq6BEQhUTEjAkoeT6xa7ZB7zs+x9uu94LmlPrQZe4a7GfhjLxELBkInOtg?=
 =?us-ascii?Q?Whr6JZ1g20XNpDcT2q3VaMEvhNHLGx1arJREx++YlAvzLB7ybDGuMzNdhZc2?=
 =?us-ascii?Q?fylP4CORLh3EyX2K6R8q8W/SMSsWfUIY8lA9w/gLjlvADsCpeV2dxPcq0q1x?=
 =?us-ascii?Q?G8YeuvGp05jpg/5ZWk6oBUuVSzSw7gL+VzF5P5DtYn2qrGC4BC/CCo4aPwez?=
 =?us-ascii?Q?6D18yVqzJ1v+JyxVgU78wzbI0C3pQ3N/BmWDdoRxe9nYzC9lrwpfJDGACxG9?=
 =?us-ascii?Q?Kbb/UlSv166UMBLrxdmwQlAah+FvSEX2g+0DzmNcckoctoP5RfqfdUGhO2Wa?=
 =?us-ascii?Q?4CyZ0W4Y9oa7fqajuEL1Tl8dkk7c0q1c0BoiCYTBnIDSzt07PJtPAwOvJfFJ?=
 =?us-ascii?Q?9aT9cc01dicCefowcBT8+GnaQD9CaayczZ5Rd04IJonwxFic1XpIbf5ojY9g?=
 =?us-ascii?Q?bAtdVOiLrxX5tAIxQrOGarVgxdO7j14DJDyJ734y?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 349254f4-48a0-4ff8-1714-08dd93e52846
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9615.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 19:17:39.2736
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YXZhzI2sUiDLUSGn7YA35dkCI6yHWpRThykc/hO6zT6NCLiOJi/d48uMt1CbcC/Sh+1TYLHrvDua+RPG/TV8Aw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7192

Relocate the scx_kf_allowed_if_unlocked(), so it can be used from other
source files (e.g., ext_idle.c).

No functional change.

Signed-off-by: Andrea Righi <arighi@nvidia.com>
---
 kernel/sched/ext.c | 5 -----
 kernel/sched/ext.h | 5 +++++
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/kernel/sched/ext.c b/kernel/sched/ext.c
index 52e0f9553e730..793e288f63cf4 100644
--- a/kernel/sched/ext.c
+++ b/kernel/sched/ext.c
@@ -1387,11 +1387,6 @@ static __always_inline bool scx_kf_allowed_on_arg_tasks(u32 mask,
 	return true;
 }
 
-static bool scx_kf_allowed_if_unlocked(void)
-{
-	return !current->scx.kf_mask;
-}
-
 /**
  * nldsq_next_task - Iterate to the next task in a non-local DSQ
  * @dsq: user dsq being iterated
diff --git a/kernel/sched/ext.h b/kernel/sched/ext.h
index 3053cdd61eb9c..6e5072f577718 100644
--- a/kernel/sched/ext.h
+++ b/kernel/sched/ext.h
@@ -8,6 +8,11 @@
  */
 #ifdef CONFIG_SCHED_CLASS_EXT
 
+static inline bool scx_kf_allowed_if_unlocked(void)
+{
+	return !current->scx.kf_mask;
+}
+
 DECLARE_STATIC_KEY_FALSE(scx_ops_allow_queued_wakeup);
 
 void scx_tick(struct rq *rq);
-- 
2.49.0

