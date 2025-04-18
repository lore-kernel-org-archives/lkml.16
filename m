Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2082.outbound.protection.outlook.com [40.107.93.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B15DB26AA85
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 08:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744963924; cv=fail; b=EAdQ3894CZkrj6jvyzLqdU22+6qc/cyP8FzKpxDNY6Z7OrvAcipKPru60VOQLOA20uOUqoNePqESFC6BvkUPKDd42h8M5dqi8DkM21bVe9Aa4sBpjm7+ukWkkc3Pb9DSrfhp0x1GUcHZ0En3dxbRG6zfud4jWkMLysXNtOUFCy0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744963924; c=relaxed/simple;
	bh=iDLPrsf/Fa4Td0G0BaXfqBZrLnNfpmh+AEx2g/EXco8=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=MxcS+7FOJ7tLNcm3kCFmkEsyzBblO57iA+yy+IxShi60pbFCYsRkO2iDqtWFK/MlA01E5NmdCxv8GFK3zgSz976YH7n+LGOfl6BVmbqBWz5MNcTMJVuMtFntp7T/3o0T3si+WED7RJDNd9auW4Gr2QHHfkMc7Boae4whZ4mzEEI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=jMO/rG4m; arc=fail smtp.client-ip=40.107.93.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="jMO/rG4m"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KnRQhf232RScbVrIP8neNnRJKBujw4jxe/oqss103H+Mw3QFv/xchMhbikAxxSII31Ia1TyB+T74fqzepbCcKtW2pNBkCau29LqkOOXIpeh5UJYVkvx05JcvWXsU83NZD5rd3DYxrlsj3dOkwHN7TPgTs4hQXfQf5KXTSKpu+cLvUsGQ1POuBtlVvWA5t6n41AiGXsKzFTflFtmlP9rLaWEgLPCyGO+ybvKHGNV/ASiaDPgSFe7pIt0TwRh7Xq0hQauDKN+CkcB+brwe3W1kv9hl+0+TWj+wTY+iIkF8Uznu0ip81RAWZy/Fj/QDPHjbGMptdKj4DEWr2tPhqlhZ9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=owAkVlO6xHGINO5l7QV7ITVSTUUwmWmhMvi5N0uqv4U=;
 b=yw4tuwNz8NSCNYSfHpWeUBh65b12sM8dVQeWRG/H0ZWjTwlEYc1Sk9qgBEU7qLPDyOwkmKSE6PANH7cQHjBVECRDqDXWHUsvcVu+CHbPOc74dauQm4cSFH6S8Rq3L4gA06TL6rOJQ/gOwZCAOqM+6ftS+mIUMWVNMLDDGrSjAzrb0D68+Sa9WHf2Ad8Xh26gV81RDvn6z6V69O8wwOijRu+5jJ5LVgk/RNzPTgnXeQzmXzy2xOTJwkuFwLOi15a84QRDEoAklmuLqcy7FlNmc+ZgeupV6OUt05i9LgYpUA5yragac7mktYCrdZN7Rne+h3idPXBY9N875dw+sW00sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=owAkVlO6xHGINO5l7QV7ITVSTUUwmWmhMvi5N0uqv4U=;
 b=jMO/rG4mDjwCpFhkSMc2rDg1Haa5v7J9FzoMPFT5EgTGmrUkJ/PzYLkHdJWU2qWc1slZ5J4lkGEI5s+2fliNFXPwawi1g9GrcCAF6kSUZWRg4Ghw9gYqbBB2M+4NIRndAawdW+57FHaiT014dMsMcpQFi1kUyx343oUMkc1bNrK+DShn6EK3z1O0YJ2KcnD7P2/aWK7K12bRubP5e5mdT3/JrmfFHLv9LFfrqx8gek0B95lbf5qLqzM4JDzjAMa55/08e3vKCHxROAysV7xFCiyes8Wypn+0IlqGz3van/iEeDzKmdoa7GVEGkhasmqQ9EQWeEjJTMu92+nuJ99v7Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CY5PR12MB6405.namprd12.prod.outlook.com (2603:10b6:930:3e::17)
 by PH7PR12MB6859.namprd12.prod.outlook.com (2603:10b6:510:1b5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.22; Fri, 18 Apr
 2025 08:11:59 +0000
Received: from CY5PR12MB6405.namprd12.prod.outlook.com
 ([fe80::2119:c96c:b455:53b5]) by CY5PR12MB6405.namprd12.prod.outlook.com
 ([fe80::2119:c96c:b455:53b5%6]) with mapi id 15.20.8655.022; Fri, 18 Apr 2025
 08:11:59 +0000
From: Andrea Righi <arighi@nvidia.com>
To: Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] sched/core: Remove obsolete comment about SCHED_DEBUG
Date: Fri, 18 Apr 2025 10:11:48 +0200
Message-ID: <20250418081148.83343-1-arighi@nvidia.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MI2P293CA0011.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:45::11) To CY5PR12MB6405.namprd12.prod.outlook.com
 (2603:10b6:930:3e::17)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6405:EE_|PH7PR12MB6859:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ac51ee7-d3dd-4487-9bba-08dd7e50b11c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7nFRh4tu0a5ta7ugNxZcQeLqDmvahJ1AwDxsmItYL5MmzNtXwA/7g3tovR/Z?=
 =?us-ascii?Q?YozWXZGvZDiYFDSfwzWI2HY5X+QvVfrCZbBkH+KrrcnQI9uKcuUwzaY38a7G?=
 =?us-ascii?Q?iuzKPYU1PfR0uwAgQdecmTcyqu8/pWkQhNKVxd+Ng4NMzmsULo1vMt2VskJ7?=
 =?us-ascii?Q?mNWbSfXl+kaSVDmcVfoWUTKUm7pE0AcwItCE+bPAblNRyfZK2VaV1SBTOT6l?=
 =?us-ascii?Q?qaQ/lwlL1i3kFrrUl+axqSi0qx/POk4tBoRNS9fX0U5Ob+wz5SPe+PHyWW6t?=
 =?us-ascii?Q?/y5FAKTtz4+bipwOkzMf9XJBJlsMuwEkALBR48nzAWPF/2JrhEXUp9r5n3wn?=
 =?us-ascii?Q?/pFWuipeluMh2LVoGaej4phzMrT2LViymrg2OW/Owmb38G/pgmzkqWVCJIbg?=
 =?us-ascii?Q?AU3Z45NOxRr8VDwftJP2g2ITWMIZXtpqaX+H+gV32+qHfL8QFSstg+wgyTyg?=
 =?us-ascii?Q?V4Zwq8djzVKzfrD+DRMOyXFrCsW4POr40jIP4416lpnp5H7dMRs2iQ8AwDWx?=
 =?us-ascii?Q?INixa0RgGMMaZ3Dh3Dk/czxodaaSfSUGuXiQJbOxd8pFSfRjZHXEQzvE2VBt?=
 =?us-ascii?Q?U6OY4FyTbcS8lTk5DpY6HkBR3C7+l74yZsn7oC9o/L6tpmizL7TnmS+aOaw5?=
 =?us-ascii?Q?lP7TI56JAzLFSlZYgvhN1BTmT5LJr9sAK+MqHfDKgboT3zXQFu67BcpGreYa?=
 =?us-ascii?Q?Yi1fNQyZk4IvgxGL9TQhbwahFhj/sEf+m1lFutvpgMTZUWRS8iUHKkckt9s6?=
 =?us-ascii?Q?qjmsDoJT/DzQgD0pZzI31434WnWygHPW8zF9cBrWjLNc3Qcdzct5zJbjUhsp?=
 =?us-ascii?Q?jR3MjYTvEvb62txfdBiIa7ja/pJOUjCoGfuxNBijDSmTji9J2t53DKinQtsT?=
 =?us-ascii?Q?zFjHWbfTpjnI9QanRwBnzcc1qT/ls7pXmSGq+L/n67LjQC0JcaOusJqjp3GV?=
 =?us-ascii?Q?5e/lXuOFsAnfMZHMSIUrnAnrsF3JC+rPi2nBT+nkHiqCsWyV84G1hD9X3FnX?=
 =?us-ascii?Q?7mgqxLMeZwb2YGK6V08qMdiZjJr8TFWPEODUKlBymQlxKvsj/RidZPkhwE2T?=
 =?us-ascii?Q?rGuj/MAI8zLvqmxdDMSp2bI8+XfMEsKdGBp8kTNJGMXVMEltIt6l135/umFY?=
 =?us-ascii?Q?5vuFJ1SW/kGDqS3HJswntVN4q1ObZYrWsJojEph+p+S8KhXAYtnIMHCLmpNU?=
 =?us-ascii?Q?3eP6wXtKSkLrOAYvxn29gRyVgZyaJesA4t1hzA6ESgUCZGRrsJkAG/etku2m?=
 =?us-ascii?Q?YraMw+zuUq7UGCMN22hn02NCQQSXxwO0Ezmcx+hx8c/I4YmcoRfF65iAEPZq?=
 =?us-ascii?Q?1FzP292cOMicmvxZzLYS7164pB6UJSLkra3QdYMSMRi8UzEdfENwgYwoeBj1?=
 =?us-ascii?Q?ErbcDa/XRFSYmbrq8otwc+Jjx2lxTA6y3ncK1eFuXZwA5d+jtw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6405.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?71hBr0vX2Bl773NejMDV9A7FL2+LYKXx5BSKytHfX02Hc5aaAPFnIF4gn4f3?=
 =?us-ascii?Q?tP8a9q3iQYBM7u+MdfR/qu0gENc7NYsudl1K3jR0n7sKBNP/CmB1BE/XE9l9?=
 =?us-ascii?Q?K61gkbIx6ZNCxjZ8W06dpjB8S5eunIQN+WsNBsAOP1FVLr/zlM35XPS4Tx+4?=
 =?us-ascii?Q?u93iXsSnbrZ1I4uZJcBfVJE0hCSJsEXCYDlAC8IKXGIGctq5TWz8ZVe5ZIkA?=
 =?us-ascii?Q?fTPdpl2pO+xyHRsSxUoRpQ7WdAFsDlqketW2Myylw43wSUotP+djD5OXaUxc?=
 =?us-ascii?Q?rQ0V32qEJZAOaO40haAH09R20f+wZv3UETmdA35zYhl47ko+KH+ysTTkjn/r?=
 =?us-ascii?Q?HgkR6JcMkQR1DLeN9mmfJMX4ux6MIS6OC7jYleD/QW53oNyPWx+qWVE7xrhB?=
 =?us-ascii?Q?wlTeEx62y6VG+9uHYpZhrzNgGtQvoD3QfdjlCjoe3nvxWg+pgfKl/5x9JYt0?=
 =?us-ascii?Q?whQnYwkQBOK18LR2UAXeOlMXv6C/gsaDRadoT0EFI6w9qeypa9o2bOdKMeVe?=
 =?us-ascii?Q?0qhVjHyKFEWnmlYcYO3I3yZ6wd0g/YDYgbhrH51ueL3eWaruvaWhQQ81JyXz?=
 =?us-ascii?Q?aN2oB0s8goTBf7gZtbDS/DAyfAYWt1s0oSnax5j1B4bMbDfBqee6RDqroHkJ?=
 =?us-ascii?Q?D6oVzKJYLBb0dsFtaonQmOLfqSW/d6slDjXdAJfn90/XlOEtSRZMrrX5O8GK?=
 =?us-ascii?Q?zeaXGQo0oBpbczRz83hq2hRlVTzCUEbMtjpBEPKR3MfaiaQLpynMZxbwFVn6?=
 =?us-ascii?Q?d76ppclyUxLObJ9GFguI0mf4u8n7aYqMOKxkboa3CT+l1s+Y9v0fhL+UhoKt?=
 =?us-ascii?Q?BwmiPez0A+H4WcuiEFN+5CjMBXqds4/3SIm+LgwUmsJU5uubMKsuiiiT6VHn?=
 =?us-ascii?Q?bcbtVsfbuOnyGNc3FRy9YrJxgCHF4wNE0iS5rJuxpTuU6qkX4qw/2jwsAghy?=
 =?us-ascii?Q?rGBKpgIFK8+iZjWvLzPqvHCmBIQDupCsrjFfUjalHaQNgWk0HIKSX2tJ2xKi?=
 =?us-ascii?Q?wFtxOzycw4y5HW0M4voN7nxIMw8s2t0SQDI+ygXoI5Qmf5JBkli5l6x6PIZH?=
 =?us-ascii?Q?lB/TZem5ejsrnx23U//f5vvCIIhDbRFPMfvdmA96EwyJm/GMlh/n85czASV3?=
 =?us-ascii?Q?P5oWCpsPuTfJlOrKp4wiFDI1x7oKA6x2RRhMwdF6eRa4Wxwfv5RdwMScCYz0?=
 =?us-ascii?Q?FK4YZHZHn3f+lSqXOO2Uhyg4+8wzxMhWmRcQWjV31L4+UMQNqjlqOVMZb8Ht?=
 =?us-ascii?Q?PSZUCHRQmWQrYD+VbOLAsQFgO4s6t86kJUcUKVI8QlXpm/WI+dkNkOKEJfqI?=
 =?us-ascii?Q?1ItYu5ibCHk2kxFhs6vjF1YVmWfJ65R8WJ0rsSnCQhxEZx5PgcBKREb9jUzA?=
 =?us-ascii?Q?Q7GAEtZdt+b7JYl2HJfEQAPFvkE6U7CH3HQFqDKZk8aDEA2Jl8IaCcmRgdEs?=
 =?us-ascii?Q?ghNQ/6La2HA6puh1ERjJkn7bgCJu1UiGeCkMPxmmMXlwT5ryGgkjcL+NmtlL?=
 =?us-ascii?Q?p+AVCs6blEenO9/mKNazU4s4LQTWGtFC1F6wUPeTIun1v1wnrDo0qpB8c+6o?=
 =?us-ascii?Q?tgV5cFAnOtXNXrJrgGm8qhdI1hG8F4Ql23IycWDL?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ac51ee7-d3dd-4487-9bba-08dd7e50b11c
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6405.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2025 08:11:59.1568
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TZLImCCL1IG4+lSYbLqRzaY79LycmaaBkE80NLgf5ejm0AKAJN++8wtSSrJl93Q4kkE2xhl5MaPSyW7ddd/5fQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6859

Now that SCHED_DEBUG is always implicitly enabled, the comment about
having multiple sysctl_sched_features in each compilation unit is no
longer accurate and it can be misleading, so drop it for clarity.

Fixes: dd5bdaf2b72da ("sched/debug: Make CONFIG_SCHED_DEBUG functionality unconditional")
Signed-off-by: Andrea Righi <arighi@nvidia.com>
---
 kernel/sched/core.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index c81cf642dba05..51370ab9fe7e4 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -120,10 +120,6 @@ DEFINE_PER_CPU_SHARED_ALIGNED(struct rq, runqueues);
 
 /*
  * Debugging: various feature bits
- *
- * If SCHED_DEBUG is disabled, each compilation unit has its own copy of
- * sysctl_sched_features, defined in sched.h, to allow constants propagation
- * at compile time and compiler optimization based on features default.
  */
 #define SCHED_FEAT(name, enabled)	\
 	(1UL << __SCHED_FEAT_##name) * enabled |
-- 
2.49.0

