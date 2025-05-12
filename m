Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2077.outbound.protection.outlook.com [40.107.236.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E444E2309B3
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 15:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747063090; cv=fail; b=djMkWlxjujzo4EHLHKOCCpeCzkKLKzc3RZmP1s1jrCTun86fxnOpgm08OUI6s+ugEgTIgwL108TSmx4RptgU2D37TFYRVmEyRJP1FClRHyIlkQhkvie/aQtoQU/FFlAf6Ft2U92Ei/kits/j8eH9FYedlP5rbjqpJnEdzIjrNGQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747063090; c=relaxed/simple;
	bh=leYxNYcBGtdbpNPEuCXwBUQoA5OoGPeC8i1hzY6aGaU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WtUFtZG4bCfGtyD8i5lU90hsbYG7PIkyxzj25/VfS2EBG5Au9o2yQuTB+Ot7vw+PUu4abDXdYbezup/BLoMjwyDtudxAkMTj/pQfZW5pcj+d75h2N3k69rye8hyMmnhIOGu7H53fa7ImQEI8UeQKnyPDC23KmcCKLjwhXIFN5vs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Kab+M1E2; arc=fail smtp.client-ip=40.107.236.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Kab+M1E2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YWxZOggb2yut1mGdXvyWK1PxdrDj2itjq/N5PpgQsQF6100pmUyusLiguyqtym7/ALpTwMqLCWmpD1IEOHvN3m6B2B5R+/o/alcbxnX+SLhXf7V5Df7fuG18RQr9WkebcSJgpr0Rcs7VeViy3Q6pw3/5bmCb70VmA26VZzBYx866YTyDPAVBTNuq60Ife3APaZAfvCf2W5J/dNB3OCq0y6CulUxVkJ9zhaoPtSDy2UnqRI0B/onEOar217W+CssbZVR0yMuxv8DXANl8jVWOt6pShlpC/X8La0UPp9P0eB6YGM5dsYLqq0kXmyQvGVOYC3UPN2TwfYzjUgOpupHZ9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JA3+m4kUZ/9KbEEFdyCII6IfCM15KmEbmA76dWtl1BU=;
 b=PPddDh4x/Fxqer2IcbW/VuoSDmKlJ1Zd6P2fJIE9bs69sDAlvJW6loXKlwlwBDfpuwwOdWBoR8LxK6vLcyngT5RXiahjKh+ydHqJgi9SgV56Qoq5HcrNgi0OBy22MAfBKaIsiJcWOqhhYCvGvcABT3zTH0JP1eG3zmI8odKbDrxlseaMpEruSuU0P34tzCrz3lxSP5Bt3e/kAfm8o15IKfncHf7xKdlDPvo+jxsFrUxBWhLWJEkoZDH2cJmcobqk7CLwy3Zgdm68QDYKbrm4Ya5RzqruU9GFP5tbx5uXBBuXSVoUa9Tx+mJ8rmE3vA/sXOsCIGNul6Da5oSsm/okdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JA3+m4kUZ/9KbEEFdyCII6IfCM15KmEbmA76dWtl1BU=;
 b=Kab+M1E2jkAmy0vmYEPKRfG6T9xeaWtEfvD7M454VDdnD8ppdTmsLkk0lny3hJYZUmRtXWOEEQP2P1Srxs5SxJXNnyMyI8JUN23hTvQ8k05R0ngY0nauSVX/KHJo23+Jp7KWYxghflHhAPTUYMmCiMgqZh2eOtaCoROZ1Xs8Pdj48AUhuM3bCEmXT6tYYA9TU2fDmiBqBRF+oB4HekMC2xzjSJGgJ+BucSK3aD+clTyKUnZRVenH6xzUfS9UezqqE41KUJcnx2KFI2RWSaOYtwCoUeXuKW3gVa8lp4xuk2u5z+bHHnSEJkbiEWbZC65wmLsANMKSU9mDq6/nc+Kvww==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by LV8PR12MB9619.namprd12.prod.outlook.com (2603:10b6:408:2a1::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Mon, 12 May
 2025 15:18:04 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::1b59:c8a2:4c00:8a2c]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::1b59:c8a2:4c00:8a2c%7]) with mapi id 15.20.8722.027; Mon, 12 May 2025
 15:18:04 +0000
From: Andrea Righi <arighi@nvidia.com>
To: Tejun Heo <tj@kernel.org>,
	David Vernet <void@manifault.com>,
	Changwoo Min <changwoo@igalia.com>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] sched_ext: Make scx_kf_allowed_if_unlocked() available outside ext.c
Date: Mon, 12 May 2025 17:14:55 +0200
Message-ID: <20250512151743.42988-2-arighi@nvidia.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250512151743.42988-1-arighi@nvidia.com>
References: <20250512151743.42988-1-arighi@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0348.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::23) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|LV8PR12MB9619:EE_
X-MS-Office365-Filtering-Correlation-Id: 5cc7eb7b-6166-4db5-4ac5-08dd916830ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?TWLv4az1tdSJkfUfqtSnqbNbo7YCAvAX2a4Q/m1oN0sGCwIJ213jTfp9yGFN?=
 =?us-ascii?Q?uZP7afJUwu3iACMg5TPqxN84l9twdQzfcmb5F6Icm8ZfT58snycYqzm0HEt5?=
 =?us-ascii?Q?hykZJhlWuCATINk1p9GAM6fLYLoSllzX3h0sg3h6wYqi8xZHmcGmFH+a4y1I?=
 =?us-ascii?Q?qFt9SZ/rlfTwQEJ/pa2d5lLs5E04YmEhJaVQupdVLLzeAhpcDxAMUJrpqled?=
 =?us-ascii?Q?A18xzTtmYhlf3Ua+huW1l29Eo7VU1IjkMMgErQVR1oi+R6xecW8mMBhxIqWB?=
 =?us-ascii?Q?q+P3vuMv/PwUO51mxfrjdRMyfZlQn/UGfYaf7l0uHedtN4Lgaa4tpAguexxy?=
 =?us-ascii?Q?0UwOU91KSUNxvrEDW6u+SPx45UH2OLs7UvvjH46rbek3K3KkIOEZgk5CtSdU?=
 =?us-ascii?Q?bEQy2OCvxzUDNLcQYzhVZQ/ifVPLf4LluAXtKs7XWQvhv2oqkFn/cP4v1+JY?=
 =?us-ascii?Q?aqofAaJrVz6dRFCyJ+HRMhp9t88b+KIBc0O0GwwIqAnwt8xBRLKRwZdY5lqc?=
 =?us-ascii?Q?DuP4+vzyTW6kawXeFO5/qGEpf9Ga+iZRnH6+4S6D23dghMApwzj7OwnOwfPz?=
 =?us-ascii?Q?eWSY+lULqyp+Lqg9N97fCQRNx9chpULl9INUUFxFlCphR8xyt4FYHic5ZMLp?=
 =?us-ascii?Q?e3ACXDAccfXezWxSVbxKRkJXYkiL8xo5JGaFjEWoaXlUyNgcqevGxCRZwOYX?=
 =?us-ascii?Q?hM0oIrPk/Klmsn/4XMrDOtBL4lUNZtqW5NU7XoLoOUa05j8poiEYeGS8tKzk?=
 =?us-ascii?Q?3GN62/cn399qZ51EPDHaODPWfdJoJmvfUItw0uLYEYdz2i0ZHP/2giIbwgfY?=
 =?us-ascii?Q?ajRUbFUIl4ljAbtxOVqc57qsVVJD1ZwRcZfVbKHBJToz5+yXt1cDoEyNf2YU?=
 =?us-ascii?Q?OyqcN581HqslUXlpQQbhzwFnxHVkdaQ385O4OmW11hO7V9ba89T+clcg0RNI?=
 =?us-ascii?Q?NsSvI0EZIMwB4rgd0VdUteMbiSplpaGr26Afci/fCfEuh1vzykWJmMFh0UpZ?=
 =?us-ascii?Q?yCjtI6d51vQ5dwvs8EH4+cczr5OimaUArVjbf+SxrGGKDmrKUjKCeBSP5Xaj?=
 =?us-ascii?Q?ARfJE9GZZj2YvrqLh/MxvcAcRs6xzJ0iQmH5gI/tg1sbl+nl9zQT9DwTMwRZ?=
 =?us-ascii?Q?xKytu7Ni1iH1A0C60blOREfBlI2vWko0PPAULUOviWmr2CaAkBo0lKarcKxA?=
 =?us-ascii?Q?wFzbCmdzJcmIxpa/DKQ59cCkLIAep/LZS3nP//s0SMb38iLZif2Bsldyigxa?=
 =?us-ascii?Q?Br4bdEP/llzAfLLpbnsw+Nz46R6TaX0SgjOriPMt7T8oG4oNyOjdg1dTbG6p?=
 =?us-ascii?Q?fV9OryWDPxxRGC9uWfiKrdy8XVMjV7GKrVD4EoGx5JyvgWu7H/QbJtnH1MTs?=
 =?us-ascii?Q?suedo2YaZ3elwxmkprkygiVLpAoUvvMvIQTFLSTmGCQEy/yAzijdFtlYzw0u?=
 =?us-ascii?Q?44DB6JIqjW4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MapcTep0nfOM0wc48T6A51Vjtg9Jm7WsKWpLQ0wXB9lOIWY5jHKc/5qi792z?=
 =?us-ascii?Q?SAGDZpzDE0iyuQsaBQw/jLed+0SnXGGyGlkXRbb8wVbt2eGakhvUPh9Jkq/e?=
 =?us-ascii?Q?l6xKwcjss6FApggO2SxBTQUIwQSNJ7Dja5Bx2jjvdzFDyGrO8cicO5OzozIp?=
 =?us-ascii?Q?Tzv0Rd70B6OFNYuN8w54CvZKag9xXPEf5j53jsl5DGo2neYt2ruqjxrq7IEJ?=
 =?us-ascii?Q?j0pWWmLk3MCBv/VnwxBATgZ+3RIKM+BEYlfLkfQaG95BO3kbKLIXRok2le0W?=
 =?us-ascii?Q?iuxzBqIcfKPGB8FW05CGRD7kgZA9r2yKLSF4H33HfEQI6PY4u+FqL0DMze4b?=
 =?us-ascii?Q?ZtuvbTqlQYJCv+rvlN44MWLztzO+FvvVy0Yy4kgAgQhnCA1vXgxBqABj0Dhm?=
 =?us-ascii?Q?Ga4PAjjaJI+Dwh3dkrVyv2TgLc1OK79D+WAkCqN4Ya0JcyhCirgkfjX3nQ9w?=
 =?us-ascii?Q?iGjcxUQtbgFPV1E/7Ndxq1xcGAHhh413CUMICMC54E/AoMLsQIIbBagEqqP0?=
 =?us-ascii?Q?EzkYc0k5piL/dteJG0ac1JYyGqqAc4b8NcqinMEwFoeHuY2kC+ZJO4ZmQJ7g?=
 =?us-ascii?Q?B+poO7KidPC3Bi85e1bs1eFKKUUMX2ptdO3DADTK0GRsxWZvCC0Yxd3fT63O?=
 =?us-ascii?Q?fZXVdl9j3uLfV9w6USGKZygYq8BqgXuMD00u/phKNKegcWcvPGQLPcU3whkD?=
 =?us-ascii?Q?gzOlZA5W8Es9gFNBGDXhvwjXg1f72delZWZcbS1I0PCJ/P1N1lCoEyNy1wyx?=
 =?us-ascii?Q?qnjuWt9OPeaiYtFIr/5vCw9oY5W+b0U4vdY6lDWV5qj970A8+todh7bUdHHj?=
 =?us-ascii?Q?x/0DIRuu2pWr9g3JPR+y6WvYB7B5Yer9Ry4+gOIODVBuPimMDq8zlrt89CnY?=
 =?us-ascii?Q?X7nbgCltKiIIZl+RlkRKB3Z4Oez+m91ZuZ3ugLjbprqChhCklo3Hz1qyoni4?=
 =?us-ascii?Q?cUwXySvuLxYi5El25/j03vwo1Lpahif+9Ub2nFFh89Z0ylYljoqpqSaumANz?=
 =?us-ascii?Q?Wyug20mqeJ/c/4IkEUy46Jf6c2L6sMxzUwZw0fPVeTDrKV6lCd+65SdbaAMa?=
 =?us-ascii?Q?VioS6NrDbtjqfMklh9+Jt+Oqo/y//q18qkIu10ZFMkEAfXP+M6CEBdJhVxAs?=
 =?us-ascii?Q?V5HHTzwSIEUrpRfqDC42I0xokhEHA4zF0uTfxX4VrXmZ2bquG6cExxCEVFpu?=
 =?us-ascii?Q?XNyo8lXkM/v652F+jJW1DReiDjMsXCAsERO211unQZa2mDp4Vsx08hLdbYAu?=
 =?us-ascii?Q?FJlCQ5jJXGz/WUImwEVkfPjbBvlka6mis+Y1fS48OLbtZdb86KTysahJwtKG?=
 =?us-ascii?Q?nmXAhczNTjygl7aLGauT397bplUSXS9MFRahKZXE49VzWFOVFS7EWvtO6S2s?=
 =?us-ascii?Q?TAeYTtF2AbN5Cwo1JSl84sneTLiwueB2sRREsPN2iDYXooRWa7mm0UHnvwIv?=
 =?us-ascii?Q?gGg6yJoVVtW+j+C5JhupbgqnKCd+siuarC6NnkWBMlyfPD0b/w3zllv8giKv?=
 =?us-ascii?Q?/BNbmmEdEXOsBDjJyb06rZm5vimQP5n4Tj/HlOSLHOY1lcWEuOpjuUYNqpDb?=
 =?us-ascii?Q?l7zsWby6idte97sezAHmDFXZFp/O071BMN/jUXPc?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cc7eb7b-6166-4db5-4ac5-08dd916830ac
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2025 15:18:03.6555
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PbfuPCBdRbxvHix/lSXjR823ro65qeLMZplh/Z8XLbpPNicBwhBSlZJqz2WrzYWwds75r+yuI4RENavtkHf7nQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9619

Relocate the scx_kf_allowed_if_unlocked(), so it can be used from other
source files (e.g., ext_idle.c).

No functional change.

Signed-off-by: Andrea Righi <arighi@nvidia.com>
---
 kernel/sched/ext.c | 5 -----
 kernel/sched/ext.h | 5 +++++
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/kernel/sched/ext.c b/kernel/sched/ext.c
index 8ccb5c7ff55c9..51623d1bd5d48 100644
--- a/kernel/sched/ext.c
+++ b/kernel/sched/ext.c
@@ -1358,11 +1358,6 @@ static __always_inline bool scx_kf_allowed_on_arg_tasks(u32 mask,
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

