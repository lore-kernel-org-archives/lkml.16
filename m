Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2074.outbound.protection.outlook.com [40.107.220.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D5092F5C4A
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 23:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751499010; cv=fail; b=PmbinxG9ta0V3tlak3dWoAkbyD3IDZGKAHxfNiUHnZN4BEp9thCgObjNduooVRD3g9NtRLsGf8TrOd4eh0RAOB5FhMerHvx/XSg5jno8MSdOC8FbJJuubgXpHbAbgmamVus7O2V+RneeX8nv6jztUeh3LruQv67rWd7GVk+pPtQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751499010; c=relaxed/simple;
	bh=pQ2XO6qeCGciskKGghhoSZ7Vs1wBbls0Y88Uiimo+vM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=brsiGvGQ8MbU8i6qz8tCEV7zu02r8J9RABPMky2tkBzfrXtLGAbqFvkKkr4KSJR+HnUFh5mhQ+v6k11ivG1UPvQW7SluwP6FvcV310YhZ9qnNnII9xnFO7Exmu/lYnotKCFbDezJXDfPqdWqDEBNSDeuCeNZppgHgtAxrz2GN+8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=O/nzmkIB; arc=fail smtp.client-ip=40.107.220.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="O/nzmkIB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pXaBsZCgkNFTtPzIz7sfUVfX2sDbF/2pfIUHUoOI2NOjI+kAlySrSBaTCH0uYjlojzIttfqcPbxy1UigZWSqNGh8mM/jKIu7D9gg0UEU9Mare3QpFaQ4QC2GceCAkMgBblWSPhKPqD4JkTI6J232LkTn/TeDClOBFNVXuG4RXthayLRIGO2g+QSWmqWnaIRRzhsVFX3Swy2hpMFx0yYdTj5N2FBsL27/ZUGiizzAj/+WKr/BIud6Ip/Di7Dfo8KwedMEt+hrGAi1aPczG7wVLUjBr6MUcyKfncn8nvq5AHchShIVftcNl+Ve00t6Udxum2ZObQ/xLw+JvIkezfHdYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=URjrsI6jULi++OCFOXFE0tGitQls6YSOfXe6pzaDd7g=;
 b=hmldDNI28DBBhwI3EX51MRHFhMBPctJSCJm8D6vseBh5rlgQkoaElAynBX7NbbrNAAoHcv4b1CnA1WEXk/FVE67D/jNMwHW5Pmm9MDUtb7JPewWrax/s4FJLA5+chYxvM5TgCXie2AvLGm6wyS6Wqv+502c336tdM2N5iHS05zkBvMNeHAGnt3rNgEcjfY64REJAycRhZWjXgzt+RI7IQGcVxO0jl1vcColFGqVV4fQAKgNtDpBkuY6VTc3wRAkW+a/uAw4HhZmp23ejunUVd3svUYxCmGd7iOvhkuS3bP0tm2q9L69ljAbIsrde6CKQdjSnoh6gfAv+cRoKxtV49Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=URjrsI6jULi++OCFOXFE0tGitQls6YSOfXe6pzaDd7g=;
 b=O/nzmkIBGVo0lweT28kmF09BpjTChJTzZQXy2NP8M2Cyhb7WPWwrdi1C06HFiMQnPSEJv+zjj8U/gpsNcyTYZ6mQEBRUzrhenFXWDCjQ4IQ9LYrtfnFwbOuq3NA+l7FlcwCQSfQ+eOljrR8T7QmS34F7CGABlELs7RRUwopu+vUHmIuCMqiclwl2mkSC+elnXRDwkhrukPZ3WjSeDhxpKgifK1xBKnn2bZUKpw2+Htubb6Ld7AAKhx3yxMi4QG2ZSXni+qNVafhQnCA0dSzevL+MEv1RwF16M5jfZhwG06EK/N0mJQw3wzT/+vvHCTQfJawqTgSSr2fRkADTruEnoQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by MW6PR12MB7069.namprd12.prod.outlook.com (2603:10b6:303:238::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Wed, 2 Jul
 2025 23:30:04 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%7]) with mapi id 15.20.8901.018; Wed, 2 Jul 2025
 23:30:04 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: linux-kernel@vger.kernel.org,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>
Cc: Joel Fernandes <joelagnelf@nvidia.com>,
	Tejun Heo <tj@kernel.org>,
	David Vernet <void@manifault.com>,
	Andrea Righi <arighi@nvidia.com>,
	Changwoo Min <changwoo@igalia.com>
Subject: [PATCH v6 05/14] sched/deadline: Return EBUSY if dl_bw_cpus is zero
Date: Wed,  2 Jul 2025 19:29:30 -0400
Message-ID: <20250702232944.3221001-6-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250702232944.3221001-1-joelagnelf@nvidia.com>
References: <20250702232944.3221001-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR05CA0024.namprd05.prod.outlook.com
 (2603:10b6:208:c0::37) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|MW6PR12MB7069:EE_
X-MS-Office365-Filtering-Correlation-Id: c9ea9b14-b18d-4d6d-a107-08ddb9c05fac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ODZcAcu4J+9aMDg49UKBtpa/qslQIXjc2+dtFqsnjtUMEXqTV+VKGhtG0PKn?=
 =?us-ascii?Q?9oDA/25L/QSGcp527WseeCik0XA6PDHIIin1JlwnBPLoVzYn3tqFyoCyOQIi?=
 =?us-ascii?Q?1gYPwR8dso6MhYIQkpUM8xfycxsPj6lbvJ0nZ9Ap60eryBeSpcANNLAMCMXc?=
 =?us-ascii?Q?lnSnH5HvyalJD70JWQOk6CdhFdQp3y9nFtsjYkC3gb/wFXvogNYZTCcMJG99?=
 =?us-ascii?Q?Lly52pe7Xwj2nFj0rmc1jGyATS+s6T5tljjStGHLD24+t5NekogWhaRWQlRN?=
 =?us-ascii?Q?lzl4ZUGV4Q+4vg8k0+oWkDhZXUV6/f105TAFuvXpxgrVcweYFloxPfF5OnaM?=
 =?us-ascii?Q?2eAFSEAtIj4JKNipMHVwIp3TbO/PPAkVpVFFOLiqTV4bazdpcX+cmziCiGCA?=
 =?us-ascii?Q?WhagCy2AvkfYZ9IIOTYsRoKRTFC6MOj+ym0+5N0vEzrFERlxyptZ89MG+IIn?=
 =?us-ascii?Q?u5U3VmG66Jyk8wvBTRjRhHehU1F81roasV79kGKZj8DKqHgkLJUedkd3G1dI?=
 =?us-ascii?Q?OuJtatOWBhAFbunbf8JUP3fk6049fnKrtbWRtFsm2QBtvZIVsID4MSr+4xUV?=
 =?us-ascii?Q?VRbvxlAqful/AlQsVnLMbfdluu80iz9dCsjPwQhe6qi8dEd3TAZ/X9s5+Y1R?=
 =?us-ascii?Q?lx5x2ZgR9uyV+xbT220MkDnYK0+Yr6JG325xtTVcAsNLnRokVPP+oby5Ck5W?=
 =?us-ascii?Q?zGmnNWt1Ur3IoSKxfRRsTP27Fih9b4hKYXc6irLgdA+nWVhLQIDQu4CmPWeg?=
 =?us-ascii?Q?j9bh8Pwcvw8RGxDz+c0hlWlEZgzVW3hxzXZub1BxUPXksaNhB0k0+gHXVh39?=
 =?us-ascii?Q?16wQ3GeeaDdyJ4AabAwi0LAheeXVYTe5nzoAHH3RUm6uyBrxdNshdVuQD8vi?=
 =?us-ascii?Q?GsfKM3ZMy2iJ2u29gYovbahookWEJPfSkHHgvlbc6y+wUfFuD1Jrf9FAPayp?=
 =?us-ascii?Q?J2FmD2GLVjtQOJQIHqWIfXKyFMLDsiZCt36xa6N3JtsBQg/lg7n09K97W5jq?=
 =?us-ascii?Q?eHOoGD15ELhYXmmuwlteMqdMa3yO4spA2sNeQxPlOOHoUMeRu4zi1r3tGX2G?=
 =?us-ascii?Q?mm6nO7vnxgf3BbaOEP6TWRuhjfKjTlyREbsch+KvVrgi5WtQmxZUS3W1dJdy?=
 =?us-ascii?Q?kWMCDhKV3NR+bNnzRWHZ5wrEDEK8HEFxcjg7sL6Xydtm6tInYw1qdwZmSPug?=
 =?us-ascii?Q?AHmTaeV+9jqurSztn07BK1fwG9jJ/S6uhuVLs1p3YSEMs1nqTsxp6hVAZlyN?=
 =?us-ascii?Q?2Fuz9OgRUFFvzLx6s/f+SfQxhEV6DUypYmHQhAHEwSLxv477Sy8+fAHNnrIn?=
 =?us-ascii?Q?JjLefv9pHnl7CCwEET8YTnZLjEaD85OAvKM0bszWZ38Crfk8PKmuTfBul442?=
 =?us-ascii?Q?bhnSfkoWE5BkUyO2PUTIPZ0eVaufC0eHOwXzsSYNrkh6iMTJyYwbXNWMydgy?=
 =?us-ascii?Q?fOleTUEJSkidH2UuESuIIngKUcq5zkOd1Sfa6mc4WrNq3txhc3cYEQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB8059.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qiwvuZJGvS1/9FFk1l16R3ONkn1LO3VqMJYKaOoddVl5XqKHRTgRSK9V39qu?=
 =?us-ascii?Q?bQMMcWsDnePzDOrfSPKd8C49nMdRCmtHmYozDgWy0S6ghal0VO8h/1UjTf/K?=
 =?us-ascii?Q?D25e8iETXTuG9YiZBQAymU8dLaPFRHveyiNRAX1l/grdw2YMNjAMn0A6j5a7?=
 =?us-ascii?Q?xfL2P6AXXH9eGaQRoeTUWnzWhVpw4OotvTKCADpiXeuQRxdXNQXiXp1m74mZ?=
 =?us-ascii?Q?41MdoipRr6297AlZUPEpY5pcYLNFN9I9RdhZgacCL4K8bgcd9ocdmfkXjqAG?=
 =?us-ascii?Q?P4WmkEs942o5YaKbof99MYjVcjSS8bl3rVQeqhEojNrJipIkDpzxYOhATS5G?=
 =?us-ascii?Q?0RymQMpvD7juSo8tPHagezyp6IIvi9yyNxZ2u49OOxG80SgYko4bHaqc3HDl?=
 =?us-ascii?Q?vQkauAA7pVDa3UWrj/b/JzyzKfj4eC8+ThgS1aGgJJAcvFmTVqlnzOtbfULL?=
 =?us-ascii?Q?8pH6gq5PR+tW6KcjjHyw/GLMWqOopddHKnKA5F7/WyL+emLSk6AZKSreDFhH?=
 =?us-ascii?Q?ggyhOT4w4+Fxrrky3jVAO6nO7wd33VwD2D5h8QUtRK+fkFw8EqpdfrDH4dwQ?=
 =?us-ascii?Q?pUsL4DnRjjj5CAuPjNO+DquaQc0nyhg9jh6uitU9uqim/9MeVuOmWp73GmaA?=
 =?us-ascii?Q?ZpcCxHFQSqrDfjx6yx7mOA//99l2RTp+ZaDqhw3p9g81HILv8Y+WQx+7Wmlh?=
 =?us-ascii?Q?HFOEzYbm+htZy36J70xHPZmwTYBwK+DoW4zVge9gwVxRTtbuHIoLtwd52ntq?=
 =?us-ascii?Q?qwgPpZ4Qje3/PAOTNtBkUBhe9c08E6Zmdi5NpsL3JEhs/zXLg9XpTaSFbakF?=
 =?us-ascii?Q?2uZFHlJjHG1yNT133AbRhCqA1BcofptHNzbeICE6M70/Ngh2Nf2bPHOGezZz?=
 =?us-ascii?Q?uaEo1FbU5tcKCEq5CMI84dwPpojrlWq8e1Tmv3zC7jya+Czduef1qnYgR3lp?=
 =?us-ascii?Q?atepN3HJyA3gPw6QMTK+2hCuZAWsF3272vsrdMkhzlv4ajbi2CjyV5/gWBBA?=
 =?us-ascii?Q?xRC9vtFRb/4oE14jK7Afu/DnsOncVc6AVfNtI1FUDcPCJuyyCmz76yFClIbo?=
 =?us-ascii?Q?8ubAU94fxb9KOVq+9E4pU8UUwiWQqgMMphXvRfY8oRLsMt3s4snbP4yYSgOg?=
 =?us-ascii?Q?zYrtREPamz6pCdZUaLbYdOz/SGpFmXml8oKQmeiHuxfwMXvh0jQdMmrO13ul?=
 =?us-ascii?Q?GF29d5cGADAoNTCWP9pME8wzGf2AJO8WWOihFxMLXs6vnce5VcNWzID6IzJG?=
 =?us-ascii?Q?+QOPXTGheCHzLbWTNTNcfxijKncQivLfjSkkgOwGAQvf/kHCMUqReg2+GX0U?=
 =?us-ascii?Q?cc4gw89tXb4IqVz7tAeGQrukSxppgTPwteZx0kQ3DrPSuERfAiDm4nVm/RcZ?=
 =?us-ascii?Q?j5wXMgAqHLrcvYtf2zpeZCp59aq5vwkv2dLKuCGTAawk/BAtro3jibQ339iR?=
 =?us-ascii?Q?Z7k9cOpOgTdsnyGNguOgqHJq1H9kiO5TutPTxlx3YW6aE5BXiSWSZesUdLVF?=
 =?us-ascii?Q?amIwscq2Dk2s5Ff17g3Hxp9p+iC6r8cyXLo9enML98yvtgE9Qim1Q7E+cfNL?=
 =?us-ascii?Q?HbqSTzfylJxW0vQQm+TSh/HxxdutTrxB6HQHpSdO?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9ea9b14-b18d-4d6d-a107-08ddb9c05fac
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 23:30:04.7602
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i2i2DeZFGKID7aB6yUlmK+eQ8W8SG4kCB3GKZJHZ455HsBZ4yKtwp8uO6e9GSliEVvnO1u+Thno0taROE40Piw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB7069

Hotplugged CPUs coming online do an enqueue but are not a part of any
root domain containing cpu_active() CPUs. So in this case, don't mess
with accounting and we can retry later. Without this patch, we see
crashes with sched_ext selftest's hotplug test due to divide by zero.

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 kernel/sched/deadline.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
index 7129b61d548b..0e73577257ad 100644
--- a/kernel/sched/deadline.c
+++ b/kernel/sched/deadline.c
@@ -1725,7 +1725,12 @@ int dl_server_apply_params(struct sched_dl_entity *dl_se, u64 runtime, u64 perio
 	cpus = dl_bw_cpus(cpu);
 	cap = dl_bw_capacity(cpu);
 
-	if (__dl_overflow(dl_b, cap, old_bw, new_bw))
+	/*
+	 * Hotplugged CPUs coming online do an enqueue but are not a part of any
+	 * root domain containing cpu_active() CPUs. So in this case, don't mess
+	 * with accounting and we can retry later.
+	 */
+	if (!cpus || __dl_overflow(dl_b, cap, old_bw, new_bw))
 		return -EBUSY;
 
 	if (init) {
-- 
2.34.1

