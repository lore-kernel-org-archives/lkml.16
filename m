Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2073.outbound.protection.outlook.com [40.107.93.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E410719F40B
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 21:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745442142; cv=fail; b=robZER6XZkjbY6isjKrKh2nSYtWm02Bqjhon+JWiSkD3vK7qrAHiq2Sd6tYHYsIf1/PHkPP3eid1M9kMewC/H7A1K2ukByJf1txE8wwrYq60hgGiKdaEzrIU4g9QQgzhlvFLxNhw6aBdi1Gan3lohjbhVJ1AQh0hrv8L3VS2gXU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745442142; c=relaxed/simple;
	bh=DT0dvhFwZG6VzdQr/O7T5fQ2mWSvoVWpmxktRhf6qzY=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Cm0fMGGmJZvj4KpSFtgwD9h5UH8hf8cebFBgY1RUjvxI0qIfAgdu7V1S+3MVVKtitGPAlnHiz7fXkaBmWzvosGqrnoRdb8DVA3j902l30C+T9vKdHrI9L8SzqiB+tPE5UD3awq/ZMsX5K5ocPujl75CoezzJX49k1rKZCUx0SlA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=K2NAgScZ; arc=fail smtp.client-ip=40.107.93.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="K2NAgScZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FkUxduALiCmFGWrg7uWiSV3PUvqQcicLT4cdfOXchero4czCxCkDOWvcOS6LtjAMgYO6jMqEeVCkCdxnwylsqAX8VK5/4BD3G4iHv9fiaEx6lpGD07T0lJZ+3eCiQEHuhzdhARqYpYFByIjNXrYKHD1wN4Dt963mVcphm4y7wmSPq6kABjlXZGiKNL7vPYrbP3vslJdKpm77R/5/30Ejdk8sncgGyWsP9S9+Fo9JMS+bdxf5P1fDPB4S1aXUnrhGZYdIGGkgiLqHNI++znHG3wWgmznIWtiQHZuZq3RNct341cRocvB4jW4qDaBTPCwrQy7Sm+eIWLRc8SxN025JMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=odXnAi+2yoAHyI1F+r15CJlkkojzbtxVPf8qggrHsDw=;
 b=TU42+aVMYopVXikHdgYoL4Ben3rxe97QdKEcK/CkQxFtT6Ze915pIklUpMQF1sabjZ7+zH64mR6BHdA+hhVEKerK/Gxv49BNsliSOWhJmSvTejBl8sOHNBm0x1UdF6pnyEZ1CfTBqAV6KOg8AS2mYB+0ZCZZXLy6BewePAFiLOjQFrWwimjm/JqZsXFE/zDBho3eqSxIAsz84VdG7INWNGHNMT80aeO+wBkziyw6/nAzDxFOxaH8Iwk6Tec2WxvGbJi0foOFPQm05iMIcO+lV6Sgl3j9K3e6Sexz1WLTxfpt9MIPp/pjJyOmeMeugGJo4cdgPW4ABaFoPzqFUN2nNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=odXnAi+2yoAHyI1F+r15CJlkkojzbtxVPf8qggrHsDw=;
 b=K2NAgScZJNkBPqrKBe7rMxA4mGyebwxxCSLc4Y1JAfyv7Ibewf8zgCvsmO1b5lsJLrDdjpm93AL06aIB+TP5cOWje4nfHFoumVO/XgXN+M2e2M53vEVxOJoQU4z3ubynWRcp+nisDBbHM2M3gpVFFxuDs4INYtcsaQUcYKocbIU7ngZ9x+CtEQ0ACzBE8angVRCmCKC32E/Yyk7MAVVGajHSgjdbRK0m+FhubS1dT3TVFWsrzsvlusFiJ4ZU+te5qobYbMuMnR0r9bmkw1QvDRIUx9x0wrVnYxmi75gIA66DB2cmuC4/9Si+CYew7rBhANi4nGOWw6ZVv7SnhGWa+A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CY5PR12MB6405.namprd12.prod.outlook.com (2603:10b6:930:3e::17)
 by SJ0PR12MB5635.namprd12.prod.outlook.com (2603:10b6:a03:42a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Wed, 23 Apr
 2025 21:02:17 +0000
Received: from CY5PR12MB6405.namprd12.prod.outlook.com
 ([fe80::2119:c96c:b455:53b5]) by CY5PR12MB6405.namprd12.prod.outlook.com
 ([fe80::2119:c96c:b455:53b5%6]) with mapi id 15.20.8678.021; Wed, 23 Apr 2025
 21:02:17 +0000
From: Andrea Righi <arighi@nvidia.com>
To: Tejun Heo <tj@kernel.org>,
	David Vernet <void@manifault.com>,
	Changwoo Min <changwoo@igalia.com>
Cc: Jake Hillion <jake@hillion.co.uk>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] sched_ext: Clarify CPU context for running/stopping callbacks
Date: Wed, 23 Apr 2025 23:02:05 +0200
Message-ID: <20250423210205.281689-1-arighi@nvidia.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR0P278CA0217.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:6a::15) To CY5PR12MB6405.namprd12.prod.outlook.com
 (2603:10b6:930:3e::17)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6405:EE_|SJ0PR12MB5635:EE_
X-MS-Office365-Filtering-Correlation-Id: d18fcd85-4d0b-4d0d-fabe-08dd82aa20d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?AUCkcg28n5MUba/vpyNDLkI9CBe6F+wZ9XPi5ebcZoU+smtgMKFFTtm1/Awu?=
 =?us-ascii?Q?4gcD+1ZvjpZjtHZSsq+MRso6UebML/w1zHTu6Ov1cF7+UzD4Qsj9tymoJJs/?=
 =?us-ascii?Q?05YefRs9RrVYtyXylXC+yJUd1TfOC7ukJrjMjLvhr6gQBM/I5PAX/LGXRimO?=
 =?us-ascii?Q?QHL5KG61akxVMeG7gYX5TtNgBSYM16XoL10s/CKxuRIpBtLFwHKUPfQIfwWV?=
 =?us-ascii?Q?zFdEme+wXS5GcQ4bkFi9ibjQXnvcQTdYLvxn6DSiRJ4Z5KyBv4TyPosZ3tbO?=
 =?us-ascii?Q?KVTwV5PTNbfBFG6Pb+wKef3qOwLLOwJqtTrcd2NJWS2I1oSC2JrpB+3/La9K?=
 =?us-ascii?Q?pESrbN9vLF7O7ywCncNDamOqORqOJKJzhWpbm7KyVF6PVD5+GveDxl8I3Zrz?=
 =?us-ascii?Q?n7Kd4v1wYaDI06Jv7C+fjklW+Hu0tzkJlzDovspzgZYyhE48RqneRP1NAud0?=
 =?us-ascii?Q?QZ1ra4HcqeGX5EqnYWAxYKEDW4kxShrwFCyOsG37cjhRajWoRom7C1X2YCF5?=
 =?us-ascii?Q?VW83fPcF64Kk82/gvToE6y0OggBXukYjc9fx8A++n+W8qid51O7J/Lj3sd/3?=
 =?us-ascii?Q?KyikDu2wGjVdG9gwvPHktbZhBrhbuYfy7PUtzvvZknB8E9lSlMXufyilDrvV?=
 =?us-ascii?Q?xJeBevJLHOeejpTW9xalxq45+FfhWdKipL2tYxCmQe2WnycTYqwbWY9gQBJ3?=
 =?us-ascii?Q?gYf3L24KUIzRObxc3bhakDqg3MWtwscX+YA5JJCHZue+dIOszlqSGt0Sllb1?=
 =?us-ascii?Q?6TBPDykHptTCc8XC2PX1adjdhmXft7+5eODUSFlQejTiduGUVuGVm0R/vSEX?=
 =?us-ascii?Q?Aet1mIIlB0jUDhaXhpO+hujtoLZYNhxzgpwQSANWyrO7VS6i1W115H1hwyuL?=
 =?us-ascii?Q?6DR5hA+bnwKG2pn5qx691xBgMAersmgZ36HM+BALk6gp0VutlqEMsbIvhzRq?=
 =?us-ascii?Q?ciBl5UWo4wvYv5eTxc6+wcl1U39e52pGGyvGUbrNk9gI/KAM6kt9gKDXyXkp?=
 =?us-ascii?Q?4iu/BfcxxR6jjvJQj7gOeFcEb/J0zYuZQ9qgy0np/Wso6CGiw2GXKFkWzJvt?=
 =?us-ascii?Q?En4NScesSzPk3G6MJnWJZzBJmwDRLuM6yA+NQpUgoeMZOrVbuuENiGxsIY80?=
 =?us-ascii?Q?W6yYMzHTkHnhcT5HstCUDxs34qaNpqOV7shWJnaa2d8Lw1ZSO+vajPJH8Z60?=
 =?us-ascii?Q?91cIFeZUQkgaI0wPfE+Ixh0QrI+5rLokZ7kMMI9CQRi3qopg1gEM7Rd2qLef?=
 =?us-ascii?Q?C5SMTQ7YkE626zH0Zq3oPh0bduUrSvEZy9lwecUM7ycL0VBoDs95b6Xr7EsV?=
 =?us-ascii?Q?I13d55X0od6I5B0k8D95TRgTFBn7o7OfqDeNHswli7Pzdhm/g7dM1MtCZD2P?=
 =?us-ascii?Q?6wBjGJp2sfgSyNtjUmfPWew1xKAVQTyCce/BPLH/YXflAGVjYEPyXwHPCWmf?=
 =?us-ascii?Q?QhMSjaVI3WE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6405.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZjaXQ5XFNagNTSFB+yyFQP6wTJ12dVAjUU5qlJ7VLt5XE7v1IgTNbc++pjhX?=
 =?us-ascii?Q?CeztkU4/fJfWp55An94r5PH5zPo2phi0425aHkm+vzfniJaQ6Jr/btep3WTF?=
 =?us-ascii?Q?P4SEOkpS6XJq5TVaQWN3lGIsIvryoQ+rh6w+kw8hWhg2/YQpUJmrxjRcq+4r?=
 =?us-ascii?Q?vnx7knDX4p802psRLVtCsImkhJaQPXGQIjVA1GUu2QbnRaGNzJ+vVpoKX+HB?=
 =?us-ascii?Q?xUTCOFVryGwWToJIPXg0LVSAXIUVk5VSmehIVtRcv0HdeeH50gy8AMuG5wUA?=
 =?us-ascii?Q?jbsVnczCZx97SXsmymYopUtN9cjc57T/CWbgfkPHxgbOFUpgz7ZWpEIUkUiC?=
 =?us-ascii?Q?FkEZlmkxVRpGVdrfMY4yTRTerCHN/QgCproQyDaB7TPEkGg0PnaOgbt93D6l?=
 =?us-ascii?Q?sYFR1zmaHanGr8YKAD7yP4IQ0VEY4GfJI5DU2P/5S78/8Ak6TjBn097kk65g?=
 =?us-ascii?Q?KEHcYNG3iv5FNOy4RhSSryVeXX+hcJdwTkrsNEzi4A67Ejt8BrsGh9UkUQMs?=
 =?us-ascii?Q?3kLYRwMmjQml9cbN56D6xz3s1+hv0OBPnKqmzi3KTNgmgovilARJIRIRTbbv?=
 =?us-ascii?Q?zR5r7JQUEmK5U66Iabw0NeXlo1uHXgsSPzUIyL+OLaGjJuP86g5o2MJzmyO0?=
 =?us-ascii?Q?h3i4I8QcYVlEsmpgOCDkG6abYkTkWJVbTE+WdRUnKBcyIYFK7oiTnm8DzEPX?=
 =?us-ascii?Q?SpgmBa6HOT9CvH50R423bHIiwDNorFI0lmapEJ/dKK6/TIDb1SdMYmlZdLyr?=
 =?us-ascii?Q?ATgkrGF4i2hmPQct6L648ygkb89kraBoaNBnm9QEkAjk5f9YKDLxnFqNZEsi?=
 =?us-ascii?Q?tQR8utroIw2HawhMRpSNwBFCv3xibE7cy0NH5oaaMRK5nY2ElbJq/Bvgk2qd?=
 =?us-ascii?Q?86PGcaOVfetlSKkyIeoaIzYBLWzJ2H0oQdvuSbwfEl8qnehvV9MHCwXJnZnx?=
 =?us-ascii?Q?MQ/4KB1F93p19xN7suswwp6MMGMahWncAf+0lPir2rXsOu8yMOYt4Mo3n2qb?=
 =?us-ascii?Q?t7dDaG1PQTQTbbqYrpfYodb0r+Com1nj4uZYqHHeTUvrAmVNjTNeLbcsYrm+?=
 =?us-ascii?Q?VbKXvXkZ6t6J9Jm2AU1ezICWX9JUu6kwFW95/ZFjjMVwl1qsrdrXg7JE1kbo?=
 =?us-ascii?Q?/pcUtB7EOhOxFkAznvdVTzF8Baz/asslf5XDvsMIHlZCZzBibfFhr/rhdNit?=
 =?us-ascii?Q?BxPJVO9/LvfC4jzFWcbb5b+YNmbKAcu/kg+p8nP+rLrUm0JG9euI3drEwDD+?=
 =?us-ascii?Q?gCPP19KtmEmofodTiZWWCpN8Rd579aH4+MNvvxj9jGP6EErAucFwdGhzRVGM?=
 =?us-ascii?Q?3OY9qfSk43TP4PRIykn3brwbMxWCDYsPyrgLyFL2cu6Fq+wBuyjfL8s067fd?=
 =?us-ascii?Q?BIUFMR13zqhUmX/5if3zhWYxIwXC3PTLugsJ5/PYnmmc7wavY0CJnt5LpAWp?=
 =?us-ascii?Q?NFd0hVvLcRV9aGpdJb0oTx3azmfc9fD/ELfejRnPQOxMwwqb31k4tobR4PDH?=
 =?us-ascii?Q?2ipaDzmEP8LQJBbW58soD4qEsYoA0d1dLc5irTjk7afby74SWExZwF/DOfqR?=
 =?us-ascii?Q?Dm17f4Q0c871T+a1Tdi2ecod7ohfFxzsRCbgmdVI?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d18fcd85-4d0b-4d0d-fabe-08dd82aa20d1
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6405.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2025 21:02:16.9367
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ngeon8+vrG/YBbND4+VLQgyuRMdoy1+q3nLXhP11CXddXHBZwt9CmiSI7ogECCgGk96+j84wgzNb/Lx/FPJhpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5635

The ops.running() and ops.stopping() callbacks can be invoked from a CPU
other than the one the task is assigned to, particularly when a task
property is changed, as both scx_next_task_scx() and dequeue_task_scx() may
run on CPUs different from the task's target CPU.

This behavior can lead to confusion or incorrect assumptions if not
properly clarified, potentially resulting in bugs (see [1]).

Therefore, update the documentation to clarify this aspect and advise
users to use scx_bpf_task_cpu() to determine the actual CPU the task
will run on or was running on.

[1] https://github.com/sched-ext/scx/pull/1728

Cc: Jake Hillion <jake@hillion.co.uk>
Cc: Changwoo Min <changwoo@igalia.com>
Signed-off-by: Andrea Righi <arighi@nvidia.com>
---
 kernel/sched/ext.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

Changes in v2:
 - clarify the scenario a bit more in the code comments
 - link to v1: https://lore.kernel.org/all/20250423190059.270236-1-arighi@nvidia.com/

diff --git a/kernel/sched/ext.c b/kernel/sched/ext.c
index ac79067dc87e6..a83232a032aa4 100644
--- a/kernel/sched/ext.c
+++ b/kernel/sched/ext.c
@@ -368,6 +368,15 @@ struct sched_ext_ops {
 	 * @running: A task is starting to run on its associated CPU
 	 * @p: task starting to run
 	 *
+	 * Note that this callback may be called from a CPU other than the
+	 * one the task is going to run on. This can happen when a task
+	 * property is changed (i.e., affinity), since scx_next_task_scx(),
+	 * which triggers this callback, may run on a CPU different from
+	 * the task's assigned CPU.
+	 *
+	 * Therefore, always use scx_bpf_task_cpu(@p) to determine the
+	 * target CPU the task is going to use.
+	 *
 	 * See ->runnable() for explanation on the task state notifiers.
 	 */
 	void (*running)(struct task_struct *p);
@@ -377,6 +386,15 @@ struct sched_ext_ops {
 	 * @p: task stopping to run
 	 * @runnable: is task @p still runnable?
 	 *
+	 * Note that this callback may be called from a CPU other than the
+	 * one the task was running on. This can happen when a task
+	 * property is changed (i.e., affinity), since dequeue_task_scx(),
+	 * which triggers this callback, may run on a CPU different from
+	 * the task's assigned CPU.
+	 *
+	 * Therefore, always use scx_bpf_task_cpu(@p) to retrieve the CPU
+	 * the task was running on.
+	 *
 	 * See ->runnable() for explanation on the task state notifiers. If
 	 * !@runnable, ->quiescent() will be invoked after this operation
 	 * returns.
-- 
2.49.0

