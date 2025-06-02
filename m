Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2081.outbound.protection.outlook.com [40.107.94.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5539C229B1F
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 18:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748887297; cv=fail; b=c8dsqTHfjVLyibsThP3v/6QuyulQzOlTkygm46CW0V3tjWqAuz2X0OQDLsy73TO0AhoVYvCAucJX9pLcl7c3lB7ISwcvJhRRD2fjFo8tqxusDLJTOY273DFtYhSnoGkuNzINRRmTdvktf69dG9dCE88itawA5rd7LtDY/mrrZI8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748887297; c=relaxed/simple;
	bh=uphPy0FD3SGpILFnXLRqeJw6IxP3SqD+S+GnECVxcKM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lBBtF+JBizqYWi1aI5ff9esJt7lxidpNS9AVPKT/U3x8nRzcMI7dhjKUNDOKKMSoqpWohlQ4W5utghGkMzCCCjsN8ThEAJSCGBzSZKErqHHqIFvQE9AwTyAIBvACKJobRg6BIaJ2QxocxIbk4xriCXNhQna/clA4AES3arAaGPo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=AMCjNoZM; arc=fail smtp.client-ip=40.107.94.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="AMCjNoZM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BVw1gHrq5qOfD02biQpbAWPCTB7b2gfjx9pnpeumev8yfB04GDuQktMkYQcZPDGbv774yZfKC4XnQlQUFIY0GFVRL1+1CqNX2Rm1OskLpMj6M9IIzXYwh2/5P2263MMhVKARK8Q9GsHdi5aCHqUISB2SKFjUxr0tRj+FpgvAuf1YeYLUwddOl71saSgWmObN56/3WR9OIzahHbCcZfXkEawWUdqP6QWpT8DdOjbr1flPurraSULfI7wcc5F+BxNJiz2QOGcyNkoCiPPuTit5j6m5VZkLRuDpESpZKyg/9dzPVwroPQ+TENFMla9HCIX1AzjHSuufLpnwkKjFWjM8+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fr+XAYKiIWxgZYwT0OfEP2XFCFgEm4uYQHh4XR27oQk=;
 b=UowD+dfW5WWLsN0mEMwOeYHAYW2bQ146HlZcUS88NNeXBoiEiioUNDFp6yRDY6DmQA7CygJVhyKTaclQAysQ8cwlVKH5Q3x+4bjTJNZWm5YJXTcmAT6tkzTNJXv9G8aG1glZ8MZJo7dTMgcm1GFl8F+KxwgibVcZ468kZLRY5ZHVFlyHtC8Cx0JL5NJAhNzVk0J4LPynza95HYcQy+/qOLV8MU9CiaqV2oB0huJKsId/QzIVigGJDWypMEfK7A4iLwiWD8Wyw6MrIY83+aRPdl3UtusAQnkXLJuT+Oa5jD1GJ4DmdgCMWuMMqV5kMbml2I7RuvXSL209ZOAo24i9hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fr+XAYKiIWxgZYwT0OfEP2XFCFgEm4uYQHh4XR27oQk=;
 b=AMCjNoZMADBEYfKYTiKyxOSCSSpN3OyjTMAzjYDsGky9yj2GCUz3r2DCWgAiWDbXPCLzp5KC2dyTm9XIHoqoKKHN5RGK84QJx6RV++IKqxGGiiUSTxqnsUjycsw0OhbiMTk6FboNf8fb8bGitVrriNyFZxSryM3A28+ZTyEB11+qg+POFYXCDsYuVb0SS/vwdOmkwyROSrkJodez969j0YH203PeGfcUKWp6UQZjvbaHj1l1eY17zsq1BVNRjZAEBLBuoZvJtLPz08PaWLnAwtmfq1YuRDgoPdSn5wd3fcXZcO9EAuQwYstjFTnb2MIhKr4C7GbHgrammIUyIrqPjg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by MW3PR12MB4473.namprd12.prod.outlook.com (2603:10b6:303:56::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Mon, 2 Jun
 2025 18:01:32 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.8769.025; Mon, 2 Jun 2025
 18:01:32 +0000
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
Subject: [PATCH v2 04/10] sched/debug: Fix updating of ppos on server write ops
Date: Mon,  2 Jun 2025 14:01:00 -0400
Message-ID: <20250602180110.816225-5-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250602180110.816225-1-joelagnelf@nvidia.com>
References: <20250602180110.816225-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN1PR12CA0004.namprd12.prod.outlook.com
 (2603:10b6:408:e1::9) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|MW3PR12MB4473:EE_
X-MS-Office365-Filtering-Correlation-Id: 30f32802-f593-4321-70d5-08dda1ff819d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?U/t1bnHPZc182lw/wJ8UQHLTXTZrJ9P/IIPgnP6xaYK61Sp1sw0kfmFR2U1L?=
 =?us-ascii?Q?96yh7d9twm3ZIbtWgZC+t6hKhu/v4S7rrfh6igXCmsvKiMrQzEPfGvkjE28E?=
 =?us-ascii?Q?y4YAT3mc+NnkHSktRUjGoyb/CnCufagtKEbk34PTwogR5c8UCVfTWt+iPClZ?=
 =?us-ascii?Q?geYaL+oOw+rqZLG72KD5aDp4CknnhzVJuBwgjbAb9d7z8hYUlo2qjLVqQ3Qe?=
 =?us-ascii?Q?xn2j+52hEm99cnBy60UybGodP8bZTWj7fS2soOKgbxo7+Gc3GZfe365arofc?=
 =?us-ascii?Q?vBi7r+v8PZm4TxIholSGXRaIE5N2KFpV2CLVa2Fp2SNHMcjXAL98WuNMCHaC?=
 =?us-ascii?Q?7XUBbEruMC9Ew/1D+jI0Dt6yB/azto+WgSovF8Z4T2pdo4zkbwNzmvrib6Wy?=
 =?us-ascii?Q?36HK0oxyKOAkMpgMZp7AiYzvQ4OYIdvJa8rZrCc3g3I74v1jYXsABhi5B4go?=
 =?us-ascii?Q?TaZU6UYcQxWRIi2YKSelMUUhUR1zBuvJHKl8ix4XcKRi3/zshND/KZL+/lR+?=
 =?us-ascii?Q?gzBiSGIBLZRrXsZtjEUHnwusLwVJBy26RommmAYeFn/5MkHX/zQ8B9uDXRC6?=
 =?us-ascii?Q?w747bwlLb5EiZ1SS1EBclRZowTV/joXc3MrRq8kJwMYzwuOQDDAnVFgPY8bO?=
 =?us-ascii?Q?KKBxMh8YI7H9lDfD+i5L5RjrLSqj6uw0ehMj3PuNrPTXHrbN9vlAL0u7Sre4?=
 =?us-ascii?Q?eZfohNWsDVjg+t8LXOJ1dD9NaB2JzU3kYgfFqr46FNsVb4Exgkn5JG2KlxVr?=
 =?us-ascii?Q?vmcZYKB1KenujrGrPTJ1jQSKOLaGqtbc1MK4lmBxYSCnJAVzLg3A4BJ7or+k?=
 =?us-ascii?Q?id36G2WjGOdfSBAjd1WNwxFzZXFcXTRWJR0IBL2QEbkdROLvww5WsbC8k7bC?=
 =?us-ascii?Q?tn2HYz06SFSVbkDm/H0sM00L3Hm1prEnRM3cYrbzBzMWHk8EEF+HBAM8CAqz?=
 =?us-ascii?Q?Err5Hr9zjTq7VPwDqlcmI04mncvWHU6hD5+xwQ8z/d9uxwDOaO1FyAGfWUAP?=
 =?us-ascii?Q?Xf9CYSLjOyxfw2jdGPv11MPCC/4Y7hBnjOcoyjmkfonI1lnvWsxWdfgcCtLD?=
 =?us-ascii?Q?mAvB+cllUomVpg/8JiW6h2KpcIJFb0L98YpQ2NyWhZOETj3HDZTyea4sxmtf?=
 =?us-ascii?Q?T6Th9W5SrugoWUpudNSrPVjbWCIHbsS0zz5UBPRoiNzrclPHaOuSTXQVwdZG?=
 =?us-ascii?Q?RLDwdq7UKUhVe6U0BRenGPzzT04fiV5IzTY6S+NLbljM25bp34CLqpNB0BIh?=
 =?us-ascii?Q?c2FJ+BriBJmWthgpZomcagahOXe8MyaPHCRTINP3vGSfdgiblRAZuBDbeJOj?=
 =?us-ascii?Q?n6Su29Wpm+0/QBcB7tZo95T7Ft9/jD94PnQ40UDF1dvh25oPYhmBsKP8t4RR?=
 =?us-ascii?Q?Ozf/rVsQM88pTMtm3x31wqHXR3+O8aweCI2hcZj9P/hvCs2V6lZo12B1q+xm?=
 =?us-ascii?Q?aJCtiqcdxPyxTFZFHa4iumyiRVB6w/+fVZUQ3Gad5So4PGkDNJGD8w=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB8059.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?oJ/r0oxk531iSjjxR6WvWKcjltIrgONMvvCTf4SBUjQxe3OB202koCHRJ2wW?=
 =?us-ascii?Q?jeQG2drNLH1+ZRkjepGNcwpwyyU5n20UhdMDiXtp3QqZEk9hFrNWdkyssHk5?=
 =?us-ascii?Q?5/e8dKWzHvAI764/1XvkWW0b9GJmfuQGaUtN84Ze8Y3ezyE4YsGkaoaRtDQp?=
 =?us-ascii?Q?82pb9GloMSvzgh9fK0FW+xHVl7nG+vdPR/zXXmWkYtNIDp8+BYEeLimyLB8l?=
 =?us-ascii?Q?Ldz8EIMwst73BfXTYF+91hJB41/7tmSLFAYXgziedJVY8t3JqlpedpV0jO+W?=
 =?us-ascii?Q?1Fz4NkvHmvnkj4d7Jh/6RvGT8OCYQPsQYTLb3U+V5olXX6o9nRkJDnnhFYYj?=
 =?us-ascii?Q?wwC0Tl6CKnu/3Ce470fkfCfksS+OBxAb+nWFTvlvr9eZ7evFKL3Pa+3l0+eP?=
 =?us-ascii?Q?BnHgoHQATaXvy2FFN4YNImj7aoYr/Vju4jTN19XzK3fdMjueRP1HNu7kdqmP?=
 =?us-ascii?Q?FKUbwUTDNJXXx68Xs3bGcj4UKfQEIlcMg2rUfcvL5D0gtjph1mfhejl+tROl?=
 =?us-ascii?Q?g58jgfnApMKks44UMC0Zz4yU6BvMOBK7xVVeiIUtNunhD7osgo96pC0c+tt1?=
 =?us-ascii?Q?UpnvUoD4oEievlSg/b214uc1M6pWRxsTPPJvaQk+ounWqVGgctPP6Pipxc2I?=
 =?us-ascii?Q?Nth3UxSKwIGgmTo8EgA6yJesSsUn5HptQF55Ck64uIEu/3MBBtu9c7CMmnSc?=
 =?us-ascii?Q?KDFvXFjx6D8LAwXtLrHmxMTqXodeKz8mpa9F6QksoPzi9IS/ikJrXCqQ67ns?=
 =?us-ascii?Q?m4kXhNSUH3JlU3+Cj8lg6HTJy2K6rS5jrIEzQwjkhqxpqP87qKvv/FHVLAzb?=
 =?us-ascii?Q?tSKKDZ27/G6JB8tpiwmnQdHCcI9fkiet4rYdzmCjWALcg0ai5SvS6mTMuDX4?=
 =?us-ascii?Q?HTmxzNKPkGDnFF9NipGufzmXG8iwWsJ4oygVbPeEgAJy4266+Hh7EhEp3a5U?=
 =?us-ascii?Q?vOU23f4ZSwWX32/k5leaPazHy0js2lB7rxLVsgvtMeGZodFCaRwsqDCMX6CP?=
 =?us-ascii?Q?SySMwLr9Bmqeu+lm7ZWaNP9HKZJcv6WAxgCOamPkpHz/sWqOE0e6pQ2tZpqg?=
 =?us-ascii?Q?sq39xHoMP8auIeA1t233u6A2HSGjzfBvmlS65i4xmf8OWrFCD2HAl384tRZ7?=
 =?us-ascii?Q?V3iRJPgZl3eXXz5j63s21SItCOxYsYfAOVXzBUwvciwpq/9N54HD/w+10ClN?=
 =?us-ascii?Q?Jfdo1g7AuD5ku5rBuHVLg+jfbNAWZPLDSAPZZNUNBnWwtly+KDKzX6RNA6q4?=
 =?us-ascii?Q?XuuOlnlAAvHst5KI+6Ia0ezS4spBP7IsFTUIt1TPpTNhB76W74cAsuY8kuRn?=
 =?us-ascii?Q?pfSGVGh8F8SKXA4OtIuzJg3WSill4CIW2y9Ul+E06DgeHyvneX0pfkxQxiwX?=
 =?us-ascii?Q?3j7qJev/ebGgJz5KjRSTCZR4ZYFIiS07kekfBXs2I9+PuJV8dx1HBOA1+p/L?=
 =?us-ascii?Q?Oc/m5BPitvlZAyUAMOd+5w5dGjPffT8jeJy8giu0Xikj102dkLI0Y21cLHaa?=
 =?us-ascii?Q?YTLWXmU1cntEcb8sRFb2E3tKyHn1GLaT3W7WxuQXX5NvJOOIDz2ZlLx6L74u?=
 =?us-ascii?Q?uKaFLplNAunybfz/auh9pfgJg+bP1VUumY/ve9l7?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30f32802-f593-4321-70d5-08dda1ff819d
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 18:01:32.0741
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YbUKgvndep0SDRMWGWodjNYksXCNfS0L7UesdARArz2+NYf+tObmcYHZCahMnexS/aki2OWNVVGU4fhsTEmVHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4473

Updating "ppos" on error conditions does not make much sense. The pattern
is to return the error code directly without modifying the position, or
modify the position on success and return the number of bytes written.

Since on success, the return value of apply is 0, there is no point in
modifying ppos either. Fix it by removing all this and just returning
error code or number of bytes written on success.

Reviewed-by: Andrea Righi <arighi@nvidia.com>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 kernel/sched/debug.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/kernel/sched/debug.c b/kernel/sched/debug.c
index 557246880a7e..77b5d4bebc59 100644
--- a/kernel/sched/debug.c
+++ b/kernel/sched/debug.c
@@ -350,8 +350,8 @@ static ssize_t sched_fair_server_write(struct file *filp, const char __user *ubu
 	long cpu = (long) ((struct seq_file *) filp->private_data)->private;
 	struct rq *rq = cpu_rq(cpu);
 	u64 runtime, period;
+	int retval = 0;
 	size_t err;
-	int retval;
 	u64 value;
 
 	err = kstrtoull_from_user(ubuf, cnt, 10, &value);
@@ -387,8 +387,6 @@ static ssize_t sched_fair_server_write(struct file *filp, const char __user *ubu
 		}
 
 		retval = dl_server_apply_params(&rq->fair_server, runtime, period, 0);
-		if (retval)
-			cnt = retval;
 
 		if (!runtime)
 			printk_deferred("Fair server disabled in CPU %d, system may crash due to starvation.\n",
@@ -396,6 +394,9 @@ static ssize_t sched_fair_server_write(struct file *filp, const char __user *ubu
 
 		if (rq->cfs.h_nr_queued)
 			dl_server_start(&rq->fair_server);
+
+		if (retval < 0)
+			return retval;
 	}
 
 	*ppos += cnt;
-- 
2.43.0

