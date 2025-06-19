Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11023073.outbound.protection.outlook.com [40.93.201.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DC60238159
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 03:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750303226; cv=fail; b=Jwry+hDdDUg2AhIIqfYcpKr9ImTmFdCxprXDYUUY5dhH9wHEUenChKfxB9h1XOn/RZH8OTQTab6W+212kecVWCKY3ZqE5ifLlBMgbM8J7LEpl++8BZc2fecQuVFTuDg1mNAZpJFB6H6JEduXQpSRcIqpcZfAnQ/RLxr+a8AvRsc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750303226; c=relaxed/simple;
	bh=txt0Gjk1v9f8XbXdjV8l3Fzkp4q1CoH1Ufc8LEyRbVE=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=bFPD+jnD5C9lZFgwigQoo9i/5iB2emlemAaORMm6kC+BrJ46C2hfP9hLBXPwyUZ6X/GVbdQAgvVdiTL4uj1Iouh9J12PnijWXx6g0TeINRmKMJowrfRLOlkrdHgfSIIM13/1c0Q+uEftMwAYMqw86yFxvhlBroNAiPyJrapA+YQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=os.amperecomputing.com; spf=pass smtp.mailfrom=os.amperecomputing.com; dkim=pass (1024-bit key) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.b=jDcI0pwt; arc=fail smtp.client-ip=40.93.201.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=os.amperecomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=os.amperecomputing.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.b="jDcI0pwt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WFDlzss3owFo5Xqfl63r3eVdXHHg1mbkRdf7eTyXm6q1n3tV2mmobhNKrG8bqvNPrejsuyziM4Clm2uorQEMEYJLI78qoOKkvip1D9AKQq/mfo+kRIVMza6MaYpK++HdSz0BGnnKWEMFlY7JPnDtvId+ZJowTaB/gfQkxqJ9Pel02CSmiIel7P3zIFgnFWClMLY3paY1zuAJP9FVyGFhvSHkPRtJqSLMi2z258F0ifviA5T371oUlaW4gy6iir6qcwQI/27q0bdfvdLCPLdQCUNYfHEKlbf9+kkMqS9Nal2pa6EWa6toaGsY2lK7476nC9dWEkOmXotKms57jz15pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/0gHFotsVKjTxWximSJ39pG4OGpTc8wpx2/QFZtytuQ=;
 b=XvxPsDjMrSqyj2YmVkEGtAcPthafg8Il1cmQYrNwVw1rTQvQOd55upgRq0LmDROQ0sS+2iW42VQgdcf12b34XXB/LumgChfMMqYARK7XsNxyuwSnt8X/06LHlFMAd3b8C2JeMLZ+mCspqf4GXlJgP1lwziIJqRQiZo4I5FEU9WnbdNZFcqQpGF1z/tWKHznZOTzgkV5UwVd6P2Kvp41KLI0/KwFlRUKs9qig8dM5yXk5tN9MvmnbiBLn0FGrsL6y7kr0kvRv4MlkLLDnPYJFUZ+2+EhpCa7+PQ/7KGmCXI6Xy32/CL0CDwrgLMAiOK6wnpDpO1zloSnoPyn7ZU/uhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/0gHFotsVKjTxWximSJ39pG4OGpTc8wpx2/QFZtytuQ=;
 b=jDcI0pwta5PzNVv3altbatnoW8kW4S1BsLaT3p+MPlEgpbALK1c1lUYGK6KtG9zzqFF5tORfMAPSkuuY41PAsVT3iqFGCE00DbefisYCWOjBH9+xPx4zZ6MwOXrr1e7zW//knAznhsHolTijsBrS7io6mPciYX16j8p4n3NjvYY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from PH0PR01MB7975.prod.exchangelabs.com (2603:10b6:510:26d::15) by
 BN5PR01MB9177.prod.exchangelabs.com (2603:10b6:408:2aa::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.29; Thu, 19 Jun 2025 03:20:20 +0000
Received: from PH0PR01MB7975.prod.exchangelabs.com
 ([fe80::6926:a627:118e:8050]) by PH0PR01MB7975.prod.exchangelabs.com
 ([fe80::6926:a627:118e:8050%6]) with mapi id 15.20.8813.020; Thu, 19 Jun 2025
 03:20:20 +0000
From: Huang Shijie <shijie@os.amperecomputing.com>
To: mingo@redhat.com,
	peterz@infradead.org
Cc: patches@amperecomputing.com,
	cl@linux.com,
	yang@os.amperecomputing.com,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	linux-kernel@vger.kernel.org,
	Huang Shijie <shijie@os.amperecomputing.com>
Subject: [PATCH] sched/fair: set the se->vlag strictly following the paper
Date: Thu, 19 Jun 2025 11:19:42 +0800
Message-Id: <20250619031942.25474-1-shijie@os.amperecomputing.com>
X-Mailer: git-send-email 2.40.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SY6PR01CA0064.ausprd01.prod.outlook.com
 (2603:10c6:10:ea::15) To PH0PR01MB7975.prod.exchangelabs.com
 (2603:10b6:510:26d::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR01MB7975:EE_|BN5PR01MB9177:EE_
X-MS-Office365-Filtering-Correlation-Id: 9cf2dd41-a4a0-4c0e-3fb6-08ddaee03865
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?cDmCHxXoKNwXFVrqgTPatgU2GOXuqO5dwjc8WQ7f1hD1TLmrcMXyWyMvLyws?=
 =?us-ascii?Q?NaRIT5LZbMH7lP5aeV6AT8rVQAC6DJeuCPEa7eJMIozwprCzd9cyXDdEgVhv?=
 =?us-ascii?Q?Zqg2Cy1AD6y8kSnNXAoudeEqJYf2dRwtgMk7hfAXXhp9Q6mYEj5Kyd88yXSh?=
 =?us-ascii?Q?AJ/D/rDtNp+NlxVP3/hVI8c0XPJl/Djb3QZD7KTLkn182W9po2SRKOayDkyO?=
 =?us-ascii?Q?H5J851dJgdyZPltBdWjtS0KfxMhETn1+ijGYDObwAnxE6m3jfzUbFKP4kuTo?=
 =?us-ascii?Q?EtHmFzUGn4FeRUf/T3qk7ddDA4Wv8gbBNFsMvTjcYzJy0BO5I1SM8iL47jB5?=
 =?us-ascii?Q?WVIVCMmT1QjoUAMaeXyO9DCwFXKfBC51M4iwKoxjFG7eVBDTDpdYoPzScy8a?=
 =?us-ascii?Q?AZ/qIxLc7CkSoyvqr01fkkSqFphGacj+DWvdCafZetlI6DpLddir0+46FEx6?=
 =?us-ascii?Q?SvZDp205aT6bnZ3lDKJh5DEKtsGFQrmPsl45UfNVfEMqGhw0E4i57ZXMROip?=
 =?us-ascii?Q?qRUP8riiuqgHuhpmG4w58SL7OvJ/2/tJJEW3c9YDqiM7685mPrR3k03GPWcl?=
 =?us-ascii?Q?A4FzX0Ae6xq63ZAb7rrCwnsLYhNifRYqTOFr5+ResqfXCtqEHnO7ciUmNDMO?=
 =?us-ascii?Q?EQrT6QUxywEArUtLf4QfiayWVAKkMT7D7Cd8RjlsnLsPdM2HGsvTPEOUfJqV?=
 =?us-ascii?Q?QeTnwIbpkgFLGVDvikQ/lSIQpo1yqcNQsh2KK39cvKv05ol+iTuZjwL4anGj?=
 =?us-ascii?Q?22YeESbkWaHFJkhiBSooSTU4mzquTc4D9f7Irh12pcufxOOntRp52orS5k8Z?=
 =?us-ascii?Q?hFf1XihwH9IKPBxwiJBDaCWKDC78svYlZo21kg/caNFsk6B6DL/NG/IaI1fj?=
 =?us-ascii?Q?9erLklctfiNvyb6Mg/mWcxu+a4JewWZMn1cWfiFXbWt8FpnA83SA7DX0GC3i?=
 =?us-ascii?Q?eHX1Ylx1Q4sTe8XOgC9KBeC2tumeMwilyepZFQWwnOMLAvAZ/6Y1qPkcqUy+?=
 =?us-ascii?Q?loY5YzIpxFAyASj9hwbWBTjxXpxKuab9fcWbMDNaPTl2kMfLj3+nc2WqQDj8?=
 =?us-ascii?Q?BR+5ZteZZaQ+tcTt2qkBTNKufJA+wAIJ+V7D6NCtsdk0XSWY3HX3V+ianDOD?=
 =?us-ascii?Q?27rlemvvb48aNiRz0zR/WilLoAlY8H3i6tLaxg5S0otGNJmm8u6KdUHOI2iF?=
 =?us-ascii?Q?dw/yFZk/i1xdeoWyma5E0UTqzVhDznWRJcfS/jnyCNSBBFNKvny3FinY5MGr?=
 =?us-ascii?Q?P7Q40QA9ERDlUvH+8JyiowWTrJi+Evcr5pzPTdsrb+cd4pFsP9u6UMpxB205?=
 =?us-ascii?Q?37S+eZfXWKYjyQtryvthrUATGwKCQr4iX860zCwztNWOj54tytujgmxvlvNm?=
 =?us-ascii?Q?k5fVaXqN9g+QVQv6xILPPUcQSMNphEMYD0LbsYAAUkXPgpQQP5bdaJFOEFXJ?=
 =?us-ascii?Q?0btemVr2FD6OcY5q16SOw/603t6dI2b7famCGf1ElOdwKXlQkay3Xw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR01MB7975.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8pQ/kbxQ7YeErihCNdzezt22kL+/slopccwoDnqxAvsAgBKB7jipH+7OH2I9?=
 =?us-ascii?Q?PmrvHLFoEXzW384CX6vewbHWj0Qf+0QLcwGHPUgnuIGO0/IsUoNhA4A0jdW1?=
 =?us-ascii?Q?/gN+4SC1OhSuLDLRdJKWcdFll08u+jQTgKKx4mIybxcB3gKhOhE/4mSaoHnw?=
 =?us-ascii?Q?5OQHvR8qAvu7uSjM7bQsfM7UEwQiJy2CqrXuHxDkdVwKwGrjLOKEkWHGAcxj?=
 =?us-ascii?Q?QPz8Kww4ozflP+qV6vbZwOFiYlXHstyJ6re/VrqGvtzCNryOcOmzrS0ynOtX?=
 =?us-ascii?Q?H710Q6FBQLSyAwwVjutYY1UT3396BRkgY1P6YytmQiErVKYd6JTS0I8eoTNq?=
 =?us-ascii?Q?WTCJSFn/AtwDDYGz3Jt7d/zuXvPr2GWeaVFvntVKJpy3UMLOCulyA/HiBlL5?=
 =?us-ascii?Q?5O+lgS5GriLOgv37mJ12PiWzXrdimp0Myeu/4TtHFnjvNP+wvwH2WC1ZE2gr?=
 =?us-ascii?Q?lDaowqOYvwhEloAEIZYAh4dznd14DPmhcjmBJciG6E1xk+ZrSzM0eVlZJ0of?=
 =?us-ascii?Q?vX+LAG8He6W6iT1WXajT/8WXMLNVmFxLnnuk289P6NOOA+TEXlwg78PhKMaa?=
 =?us-ascii?Q?MjonezDU3dccuPSMlHFvyJRSUE3BsKWNu9rjUE2TvwWZJw+LtLKUimUYKywG?=
 =?us-ascii?Q?3EmP9gywcaGaHSZNRA/HcISWPzgttD1yhUSouBjxyfAHeeW3yZ42KmZEsQB3?=
 =?us-ascii?Q?9nt1Y4fDDcHJXbXomo2ib/FZLHJ6CuH8mN2YMk7n5bp6TkNrfYQo4JCLoOEI?=
 =?us-ascii?Q?VlnaUT+DDbFkShpk2YdMkoBjLXWpD9h8cnW1pXawpmdmIUvglOTSCfnOwxgH?=
 =?us-ascii?Q?ByErW1APk9ZKuzPN+0mJdLZm09BtEQetjvrm8uAaHtkxsVeyeyCzDFWj38jh?=
 =?us-ascii?Q?KlJN0qzeKeHRVYnqOig09YAVufNOjRSZm7Zjb9vffuiSzQ6mPP90DVnVGQLm?=
 =?us-ascii?Q?PB3d+EdHODyaqqZ8YnAcCk8KT0SgrUeK1kZMKkxuYQM+2hnzFpLJN8Z1b16P?=
 =?us-ascii?Q?yYsCWq6FFa3bZrBGXUKHzQEId9BvDN9OxX2sJ1P3reHP1PVulLgyUNysd57z?=
 =?us-ascii?Q?Kmk9YrUOC5JBntd+Z1Da+HbXhuMDzod6WuSbgc+nGcDfxYcUypjXrZ38T1W0?=
 =?us-ascii?Q?6hKnUf6tLCLW2uKbhOpwooUzwGABmwJm0l/WxDHHTeKthT9gOEVqqIU7gSsv?=
 =?us-ascii?Q?3d1fdDh+m/tgND7f6hyxoVsqTIQqhQboYWMmuFtOkJxC+7sEMeImmvV4Zap+?=
 =?us-ascii?Q?92ewgR1YX6UQ1Qe+9jsHnXg7SWYqIscOZAxKQ0Du1xLzbtf+IlnQd++btrko?=
 =?us-ascii?Q?lF5YIge1ezErAcbSizyftHYcYfX/lsqHhLHvJJCLdrpH1CVZNrHv5O+S8OLe?=
 =?us-ascii?Q?st53FpnIQZ8TKfpLotBLGvGTbVsxTVfOJlQT/QbBUJ3529VZ3zHNOJhDXhd8?=
 =?us-ascii?Q?ockgVM9F8oKjI6PX6lfEA6IzT75eqimvwPishwaAy6OiUKcyWjlBLhO8qTSL?=
 =?us-ascii?Q?uOIFtVi7GtzkLL9H7YVz8W5gpuavbKVk+bn5EdB7pFlE6X937p8YwPNEqdFQ?=
 =?us-ascii?Q?H5/37vggIQSQjpr0TKgL1FnPDkbwX38jXg60DgINkZG2e0dcWIelLD2MLfHp?=
 =?us-ascii?Q?dQ2c0i8VjPEVXnk5KMUdNrg=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cf2dd41-a4a0-4c0e-3fb6-08ddaee03865
X-MS-Exchange-CrossTenant-AuthSource: PH0PR01MB7975.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 03:20:20.3162
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QWcFhrQq01xCfr3+yNwgqq1KWIi8LartmTeYt0Ndym/sKpSxmJtjzOiZrNpC/cHWpdTLXVRFm5FfN56AZ3IbMPOx0ydPySXgOnkvswJliH49Py6aiOKH24Z01Re2UWYR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN5PR01MB9177

From the paper, the lag should follow the limit:
     -r_max < lag < max(r_max, q)

But current code makes the lag follow the limit:
     -max(r_max, q) < lag < max(r_max, q)

This patch introduces limit_hi/limit_lo/r_max, and
make the lag follow the paper strictly.

Signed-off-by: Huang Shijie <shijie@os.amperecomputing.com>
---
 kernel/sched/fair.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 83157de5b808..102d263df330 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -694,14 +694,17 @@ u64 avg_vruntime(struct cfs_rq *cfs_rq)
  */
 static void update_entity_lag(struct cfs_rq *cfs_rq, struct sched_entity *se)
 {
-	s64 vlag, limit;
+	s64 vlag, limit_hi, limit_lo, r_max;
 
 	WARN_ON_ONCE(!se->on_rq);
 
 	vlag = avg_vruntime(cfs_rq) - se->vruntime;
-	limit = calc_delta_fair(max_t(u64, 2*se->slice, TICK_NSEC), se);
+	r_max = 2 * se->slice;
 
-	se->vlag = clamp(vlag, -limit, limit);
+	limit_hi = calc_delta_fair(max_t(u64, r_max, TICK_NSEC), se);
+	limit_lo = calc_delta_fair(r_max, se);
+
+	se->vlag = clamp(vlag, -limit_lo, limit_hi);
 }
 
 /*
-- 
2.40.1

