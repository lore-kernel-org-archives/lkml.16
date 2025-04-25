Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2053.outbound.protection.outlook.com [40.107.93.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CD352F2A
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 17:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745603842; cv=fail; b=bCfaSNq/ijwQdXiE+2/Xa43MDo/92imZqTG1hJeatv6d57w/2/o8JtLS6pXKinR1TQD3+OqcdlTSGDwg1dnmKIssJZkt+9uRnHJgEbVm606mIIMGVRKEUmqdROcL9IMZCUa+L9hggzSmXt/Vxx0JJHETw45RZr+ro/dp18O/ctU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745603842; c=relaxed/simple;
	bh=JElmiDUU80GinWi11AE2Zxt/5N+rVMxsGkjA1UlBNtU=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=r5f2+RR54TwgMSCSn2o9sqxnauLLzUTLV/txz5WqK7NtQ/pGsC2grMSDgO0TSZaYqHySMRwTgyzEV8uZSn+fcEgrcB2dna+yqqwh6jJRQDv/9pFf7unThXCApmV18z5OS1HPoDUGpTW05/PwbZCK7BEsG+H3KVKHZQYZiWgSZoQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=HlVqCtgU; arc=fail smtp.client-ip=40.107.93.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="HlVqCtgU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GbBdbL38nRRlStn1a1ChvJRWwqNHFVwAUvmmFoI+1xJKRqL7xj73Jfi1SW1ruHv3syVrtw50dnWMF7nd79Irzz6LIuL0lJobj9ribEl3NWiISweHgbInwMR4VzpWq46mVM7evdUtTBQhEvxXlLeAND2EbDe9LiMh2b5yfSGpesiwqK0SR7QXN7gr+JgzW9BJB1z3k1kRdjDKOjyki4GlmnlpPuAHDm2C4QCq+Wi4kwIgiSefVq9JSCzqG9vCjKa8qvK8zKifE7BKedvdkfgLPeQnI3fAfNp/uSlkRiCXuWQBIHkN7arA0WfxXfLEiaxW2Dqb3iH47cMeJjfqqCwwfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ySq2w74tqrklVTOBjiKUjS/gi6xn2ECoaiIaKJBL+Rw=;
 b=nGYid5fbrat3Ciuxhtv4BlfiBT0LO+V0wVS/gBq/hm+Y449X2q4CN1im9sR5AYcXuDoxn1tXx4/rex/K9VAIOwxWhL3zorkCyfTJxvVprEJyiHmhJ5ejcRMi2M1zp6zjtIQpqDwxUah0O032U9EYIUuziGuzEpuzC2jLsrcrXq+jgNnFyAdt2w9iIvbtEQTfAmkxc4MSVDrpVMkjn8Z/NzUkkb9d0k6cAD5Pm4tuLFlOlFAz/Y2yljb0nqpv+k5cNLekcO/JtLQT3HW1DtTLefN5eHd3lXSs/fiPpAeOYQTNhf2dYX7WMQzk4RMPPKwRAd1nVQEk6ibsXdIl5A2CLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ySq2w74tqrklVTOBjiKUjS/gi6xn2ECoaiIaKJBL+Rw=;
 b=HlVqCtgUvCVOCeV0cAsF2codPDLo61eq9J7Or6otuyLKBjG9qaxqfpEGE/cBU8x1MPK0StfAHuwqSbPj1NlGB9irjZ1srLEUj8HeQHrqQ15qHdWvTGJ34JNB2j25N9lzE1eniCQX0dHdWglgcrE4w0WGRvXa7AshB3b465HgEOXBvCULIGI8OArdb/QnVBZeSGmJ+txUbF5jvxpaNv29c48a5aeoiI8v/uw1AGgTDHNKqKdftB1bICtmYBObUOwbY5TXzPYPiEeZrsGN7KoRBNPKd6XbMqwdq4JVTav2PEFB3uZrabISrF/cXlRyBj1/nLLBTDWCBZjPx7SowaSeKQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CY5PR12MB6405.namprd12.prod.outlook.com (2603:10b6:930:3e::17)
 by PH0PR12MB7838.namprd12.prod.outlook.com (2603:10b6:510:287::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.23; Fri, 25 Apr
 2025 17:57:13 +0000
Received: from CY5PR12MB6405.namprd12.prod.outlook.com
 ([fe80::2119:c96c:b455:53b5]) by CY5PR12MB6405.namprd12.prod.outlook.com
 ([fe80::2119:c96c:b455:53b5%6]) with mapi id 15.20.8678.025; Fri, 25 Apr 2025
 17:57:13 +0000
From: Andrea Righi <arighi@nvidia.com>
To: Tejun Heo <tj@kernel.org>,
	David Vernet <void@manifault.com>,
	Changwoo Min <changwoo@igalia.com>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] sched_ext: Remove duplicate BTF_ID_FLAGS definitions
Date: Fri, 25 Apr 2025 19:57:02 +0200
Message-ID: <20250425175702.1127590-1-arighi@nvidia.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MR1P264CA0128.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:51::10) To CY5PR12MB6405.namprd12.prod.outlook.com
 (2603:10b6:930:3e::17)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6405:EE_|PH0PR12MB7838:EE_
X-MS-Office365-Filtering-Correlation-Id: eea26c93-f11c-4c29-792a-08dd84229b7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?oVbwKNFq9rSfAE83z8fGmQR+jQaWYABdixPkAdhd0n0TqSckkwMC2oV8Kn5w?=
 =?us-ascii?Q?iDcpHY3K3CkOCZqlSskfeglUhaD1MC3b2Xe01CnSF66Cyu+8OC1QY7GNG79R?=
 =?us-ascii?Q?p39XysslxrNhcrw7WkGOPdrJUwvGD3C1siODogt8k5+o8b2pwJnm/YwU2Q8W?=
 =?us-ascii?Q?9fnUNGVfAYbQ2+2XZq4+gGEFM7x8EWIeO2jLtPYD0NhjC2prbQFG9u4WdMkD?=
 =?us-ascii?Q?X2in43jHB/QpxgcmDMZNRzBWxU2JwMPZ79GZf7x80JcRAxVeuYJ2ZxjPSItN?=
 =?us-ascii?Q?9vciONU7wlgnI+Z6d622LUk1f4XkGZAqMDEsroC6GVBv9NvrW92ZqXq/UQ+S?=
 =?us-ascii?Q?JZtDMXr3s+X4yQRCZI6BslBveTrK09VoIfK0H3GuB7YT4pBhb2hyxX+dWcU0?=
 =?us-ascii?Q?2nsKYBQvr/VwldEDazrwKSK//R+xI2bTk7Rsv9neXx+CsPWIKzwgExZ0nOkw?=
 =?us-ascii?Q?nGafKp5lcAePurjnNRTKzfxWt6lwOsupEuEpNhsOHK8rK223cnAw8Ji2YgsO?=
 =?us-ascii?Q?phgQ+divy8YAmU1TAfoHbC0iALAL4EmTJKXgAa2T5zUr5sD7Zaysgt8Grx+P?=
 =?us-ascii?Q?GABL69+uISSNl9FIGjsPXcLxAt7HX09xW5EnSQoMLJnxG9Iea/ueQtQbElB1?=
 =?us-ascii?Q?Um2QfIaeKWWVWMOqVeD5DXj9GSn3rnoii7NDvfB19hdbAAT07ZlxrENX6t9+?=
 =?us-ascii?Q?sLnBGENwc++qsma2WWfFdYNh3nJf1b2ETwsu2AkR7tu98CzZ0E9nESM8I4a5?=
 =?us-ascii?Q?mSl0TAuBxgtfAxZxzvFs3MPp9yAFKM9A7kHUxwGbMuLrBSS+uzmDkjG5KtFT?=
 =?us-ascii?Q?VWw1wZR0WkqEu1EsBJgReIXe/sS9I8vWllQZk/F97W5RjOTgKreOVVHkv1GQ?=
 =?us-ascii?Q?GNSmEuon89j4RpZA/pxnT1083zF/8S7XTgQIi/XraBGOWlPZBN7A3qWIgD+b?=
 =?us-ascii?Q?xpm2L4waHkTI+ncFbNt/HbA0/ZC0ecbgkJk6/8NeY3tRr5TLQAVsrMBN21BX?=
 =?us-ascii?Q?8ypaEUehe25amrSo+MTy8ff5i2Wn7y7/MOGsr2yCVsTEFFpVZnTP0L28usUE?=
 =?us-ascii?Q?U6quER6hi5910oUXvR5bYiWMYJOQTV6x0OAwJ9mgiqmulBaEfz5Hia6O9kdt?=
 =?us-ascii?Q?2+9SaqcM3NTV5LW4pghYR4n1HpjMenuonOUp6PaemqXWg6V/AlSHYT4LxiQn?=
 =?us-ascii?Q?JXissKJGJKGbKKbe/Ps6cWB2aj+NPieRovb2dnlPWttLCaGnYNtDhb3JY5bX?=
 =?us-ascii?Q?3gU+nMtDzqHJdhBfA/5/nEBpqR2vejr9Unrkr3xtCnFXjE1GC8ncxUvEoQhz?=
 =?us-ascii?Q?dea992x/FXR7WVxzACl83o9zA333GgZC2JBhBe9Q5opEgr3rIdw6i0swlnaj?=
 =?us-ascii?Q?vcNVx+ObctKcQV4/yBDJYdoMJr19Cx67bzDwQPOEZWOqTLPKWUXn5rgeap/s?=
 =?us-ascii?Q?ZmnI0rfiLxw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6405.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6+IWEJrrvl96AzOv9/ed3Lzu6XVaPmrQEyeK/LrdIhinQyk0EXdfUsgP01+Z?=
 =?us-ascii?Q?BoAbi2oUuwohqJ4/erOIKtzvukwWjx5/rCz8w4S3k4ESoy3CQUwyWPjsNFz8?=
 =?us-ascii?Q?9MAlf3RSgezA8b1nyj6FSi9+F6Dx70/zfiAv/C7J51LeyDLVnJ9cVHU6f7qx?=
 =?us-ascii?Q?z2v59EsksUeAPp1+86w9/Lbrz4DEGXRk+pwhyEGUuEqDym3eMhcfbgjnlHhh?=
 =?us-ascii?Q?4RiMSwHWLI7hgMA+4HfpGuIofgy8x/jjYYSVgpWPkCL1kMDxq1ciotpxZxaf?=
 =?us-ascii?Q?n2cdmDjVd6yV/cch1M0NXcoZEv7lrlC1qIo8cuhYTYUAv+XVGdyFBnMaBI2g?=
 =?us-ascii?Q?3IZCyJzYFuVnFCcMEZN6mGathYPLPCxKqtzdoGM42juDP4kEQ98dxZpUu0jf?=
 =?us-ascii?Q?fnQrHW2XOu4lY+C6OdHtkEb0PeMnrj/fR6xWC4JMmW8U0sr4TqvaQ/wIfET5?=
 =?us-ascii?Q?horrgMXMeVnWUtUwi/TAwQ3nYSGskDL0iO2gtlIaP3isg16/6Qh71WE9sEC7?=
 =?us-ascii?Q?KshbMwVlULn5esimaC12fFrs9G5v9pwsT6gY+gUAvJkJalhCmjCJKMrC2Vq+?=
 =?us-ascii?Q?9CtVbiuLI1TrwJAxudzHdle6vtLANfECDDzZ0eOT3UGmvhk1MzUPP0O9Nhk7?=
 =?us-ascii?Q?CQH8ZmnN0w1UlTbxqfo08QyDC9yT2/ERGzEhOA8qdU211HWvV+Jt1pGNaCLG?=
 =?us-ascii?Q?1FbJVCJyq/usgT0EhJlSvEgeWWfvz5qqObOyFyvlBN18Gr55jhuxqJLkrsQ4?=
 =?us-ascii?Q?vKuKE99d+4smE0H0gty0E7cjIByLyoqk2/WZK03ixhqqUuwpfQfb5B2StZS+?=
 =?us-ascii?Q?b7RvX9cnFG2wN44yiP6SvSEBX6U5gZWxNeb87uqQ3fBd18NHhMfvgznRcEJX?=
 =?us-ascii?Q?amY0ehFt6YcZgMvWBRiJrn/0V364hR/eLt/F31423hBGpWtDyUc1wgAf5nbc?=
 =?us-ascii?Q?QSHPCYfI2ivBaiZ1A5DK2z2VG1IIvDhLjEiM8hWD1i+NjyldfnKFmM7IRRl/?=
 =?us-ascii?Q?nrnkA+MFPvyCyCfUEQUnKn6/ZbNMov7hvukn8XHFTE7NvK5e6eQHmYBWja7X?=
 =?us-ascii?Q?ixm4j9AV4wWCz1+6axHZU+ITRxplWr32CDx/j54qzbv9dNC6WrmDypcqiX0M?=
 =?us-ascii?Q?Tzdfb6b9XiuI1YAfdyRi3nl2JlFrTs8zrWNxrq3Rv2g1bYQO5SxlRCfsIfJF?=
 =?us-ascii?Q?tbe3mqbi4kMhM5S6AX7NBz2U6lNJubFFuPwKRqSNTW9mAbhOVye+fI9+SVoB?=
 =?us-ascii?Q?IgDM4jUin8V0uO7kHXPJDDGCApPp80KQsD5rlAtPXD7l5TveyIkyEYpJ4Tow?=
 =?us-ascii?Q?C2vsFT9kwVCLy5PYja8Ogebo+tc0dfGnIcQNis/niKozx7drutyB26lu3tSS?=
 =?us-ascii?Q?c+xxy/55wAuqwShV4tnQIZ/PqThuRARvxP/B8rkH2lc1caLKIeUTvcRBgDwY?=
 =?us-ascii?Q?2kB5lAhhMi+mX3kJP603yL+CUkPXfOnAaqWbntn9tYOKIW/kfxVNcJqkL4cp?=
 =?us-ascii?Q?G4GA/xntn4N0ZVvdx5JtiDKyDTNM2EnpodY+i6NBllZWygEObtt1i1JQDGJx?=
 =?us-ascii?Q?gQXiDfobJ3455hz4tLZAqBpaNA4gRZ+eBKDs2DqO?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eea26c93-f11c-4c29-792a-08dd84229b7e
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6405.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2025 17:57:13.1879
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /fJrDoVSzDpv4Rny6JF56anO9wGcBubG7Bwf0BBbaR+wTu930Tdl4P8MhRBnqX0C0bAoc0aNX7NLoFv3g/CrPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7838

Some kfuncs specific to the idle CPU selection policy are registered in
both the scx_kfunc_ids_any and scx_kfunc_ids_idle blocks, even though
they should only be defined in the latter.

Remove the duplicates from scx_kfunc_ids_any.

Fixes: 337d1b354a297 ("sched_ext: Move built-in idle CPU selection policy to a separate file")
Signed-off-by: Andrea Righi <arighi@nvidia.com>
---
 kernel/sched/ext.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/kernel/sched/ext.c b/kernel/sched/ext.c
index 6e530a91e9442..1af53b28f30e9 100644
--- a/kernel/sched/ext.c
+++ b/kernel/sched/ext.c
@@ -7362,12 +7362,6 @@ BTF_ID_FLAGS(func, scx_bpf_nr_cpu_ids)
 BTF_ID_FLAGS(func, scx_bpf_get_possible_cpumask, KF_ACQUIRE)
 BTF_ID_FLAGS(func, scx_bpf_get_online_cpumask, KF_ACQUIRE)
 BTF_ID_FLAGS(func, scx_bpf_put_cpumask, KF_RELEASE)
-BTF_ID_FLAGS(func, scx_bpf_get_idle_cpumask, KF_ACQUIRE)
-BTF_ID_FLAGS(func, scx_bpf_get_idle_smtmask, KF_ACQUIRE)
-BTF_ID_FLAGS(func, scx_bpf_put_idle_cpumask, KF_RELEASE)
-BTF_ID_FLAGS(func, scx_bpf_test_and_clear_cpu_idle)
-BTF_ID_FLAGS(func, scx_bpf_pick_idle_cpu, KF_RCU)
-BTF_ID_FLAGS(func, scx_bpf_pick_any_cpu, KF_RCU)
 BTF_ID_FLAGS(func, scx_bpf_task_running, KF_RCU)
 BTF_ID_FLAGS(func, scx_bpf_task_cpu, KF_RCU)
 BTF_ID_FLAGS(func, scx_bpf_cpu_rq)
-- 
2.49.0

