Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022092.outbound.protection.outlook.com [52.101.126.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0194418BC3B
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 10:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.92
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750674461; cv=fail; b=GPz1SLzEknHY4lfS3DFBH0Ml1Cq8pR1wWgBc3AKDVMharNG8jEF/xhQSaVAVIMVYc9mKubBVIYB+zc0NGYmeIfBypquw68ejrofzX9YA9WZUzkAq5QRtb66fCJCGt0d6KkX2zOGx6x5jUbLEt53D5mjWcKtsU76lxfiSRg48GO8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750674461; c=relaxed/simple;
	bh=yGBvh7+7GTLHrJBCGEMzZTw8oXTYof1cI/YuQZbnWqI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=CvmFbZH0LbLAnMFoo2UStrj67LkAJJ68d1yuOOc34E7d7UvicBSpjgXi/gDS+pYo2852NsxwmIYznpPTn8RA5xdySXm/dTBFezuF4ud7ispBHefEQ86LrFaMnd1d/6kGpGUnLevvwWhHHwpYufQ2UGIin43/oMbwICU3x5nXtLw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=52.101.126.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RCeU2UsthVpZZtCJ+csToP4JfQJH4zdVWkMcXvW1G9oOrNLcypiNX5G+3Aye2yDYVIhpwkbSS4Kym5CrNBbcHfAH9j437m/OoyZIBKNUyE7qrowNRR15VXzXeQ6UAS7qkgYT2QHY8bYmkPpA2BGGeZ4rRym4Xr+JTQCxhsUyoV05ahVjiOI21G0/MclMWlwcfPZ8EOxMfs9suP0HR0TafaQ1ZnDxTCh9KDW1zPAk75+LL6k5P/A87YR7lXdTFak6Qu751Tn3XWB3p/07UY0HdDXEPHJ59GqtE8IQrSs/b7bcN3zOQ1q2DJpvqY44yHozIs3kfS0T8GvlQXFiSiAyTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qs2zKwjdiDy4fgf7IwKtscfNmHqIxnAgcPR7k8cIFOo=;
 b=Fz6PGlPCkplRkPeJhSyq9CIl1BdT8CQkd+tFnk4YuFwyMTP+1nPuEa549JyK3ckdWhQvzwZDlCCWezznKoB1nYWn4tQJy+D8HksHnlOJVMqsev82kD9mzgY+bF3/CN+dlZEcq2NqQ7kmkMIPbat4DqxyjJxFcZmeVz9n96G7qvCR91KOvVyqqklUD/+MWJIP9CBEhwuWHunsA5hBZkfL/PQkKt0vjM6NOWxozh8DBCfCcWGqefdca9wI3BIc8ZUUTQPFUWsAkJQ66TaPpR9duX4SSxXkTsE/9ZnU1GGMyupiQiOGnTcr1oCaNjLo2pBBTohQ4VXTdYWgY44j1sTQPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from TY4P286CA0021.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:2b0::6)
 by SG2PR06MB5058.apcprd06.prod.outlook.com (2603:1096:4:1c6::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Mon, 23 Jun
 2025 10:27:34 +0000
Received: from TY2PEPF0000AB88.apcprd03.prod.outlook.com
 (2603:1096:405:2b0:cafe::99) by TY4P286CA0021.outlook.office365.com
 (2603:1096:405:2b0::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8857.29 via Frontend Transport; Mon,
 23 Jun 2025 10:27:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB88.mail.protection.outlook.com (10.167.253.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8880.14 via Frontend Transport; Mon, 23 Jun 2025 10:27:33 +0000
Received: from localhost.localdomain (unknown [172.16.64.196])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 4AED440A5BD4;
	Mon, 23 Jun 2025 18:27:32 +0800 (CST)
From: Gary Yang <gary.yang@cixtech.com>
To: gary.yang@cixtech.com,
	peterz@infradead.org
Cc: linux-kernel@vger.kernel.org
Subject: [sched/eevdf] llama-bench performace drop
Date: Mon, 23 Jun 2025 18:27:18 +0800
Message-ID: <20250623102732.3447837-1-gary.yang@cixtech.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB88:EE_|SG2PR06MB5058:EE_
X-MS-Office365-Filtering-Correlation-Id: d9707567-ff23-4302-d15f-08ddb240913e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?RaYl+/rWuqdZ0E3tBM6BENIf+gkkLtQbqg9I9XWqODEqhqYsFIBNUziRRSaU?=
 =?us-ascii?Q?g0CDudnRb3oElxg5iJ46KFzMXMotQdZimtIzFDS2+FvV0YdqY5yPoqB7gs1e?=
 =?us-ascii?Q?YWrcqgVtfb63bEwsrf8Lt5U2fj+umTwBWt9ZxQ9QxWPTNZ1N6SWQ/1vS5kRr?=
 =?us-ascii?Q?iuULoHdre3kKniq74pTWWVhEAdIbLgRMgaTNeXrPnpEVWij+8xV1lLanH0ze?=
 =?us-ascii?Q?8gx4p/wmA9KecF9Qh+oThYXeNQ9X6RWS6DEXcq6WvHN4d7MYJ6s3zaAXOsqy?=
 =?us-ascii?Q?FbXtps9YYP9jPVQ+ITc8c8QGkpEODfnc9jxi4uzWKzAJTpkQ+Dgl9ITVPsB3?=
 =?us-ascii?Q?7gs2PF5TZrVyIbhEZeRycqazDRfOwU//0ha0rxT7XGpgDBrZkhI7SBisx3s1?=
 =?us-ascii?Q?eLwAL2/QEyAAKTx1ziwzo6qiRSraouqXHyqntwAFO7Dr3UDxipRxyQmxKYDT?=
 =?us-ascii?Q?Lqb5jg8NLMO2SpLglz233SLjhIiE3OB0hCCV3s/CokWhM37tJ0SLlEdYtsUm?=
 =?us-ascii?Q?FLo9FKL4a3edvZvej9nAVn4cxEVXikUiHMZE+hD3x210Dd9e3TYJly9NjUo4?=
 =?us-ascii?Q?NMV1AalAd+Kazo3OvRBc4NFJjlSMZHbepQlCGuXDQPTwpwUFIhXHGdhUCZYz?=
 =?us-ascii?Q?swFT1TYK9CEnq7XcKu6p4spWZfPTzg3cPRZRFydBgRn+FVXWloeXqz1NPYPk?=
 =?us-ascii?Q?C6ejYd+5aoNoDBmWvAzRw3q3HaKwhm+vbqh5klBopnGtWf7W7k/7ukM8b11u?=
 =?us-ascii?Q?ISKDhQ1SwQ/dRDwrzFMg2upXgJQTIb66njXW9IdBKFgfhpeKwDJkJyNvVxw5?=
 =?us-ascii?Q?k1gYfEA/Mx6kdBlCc9U+li5WItDafjNagpMuKY5zJ8NcqvwROnCrGa8ITdpr?=
 =?us-ascii?Q?kDbBqleMLfZRFKCdmsxaNuE3CDhA2enYnzaAvrk7YKGZnJGy4N1ZZ4k3Cnt/?=
 =?us-ascii?Q?XE4lI4JqluQmLKhUpCaCkc2PiloBp5fluEYjo7Yn0zA1IXGoAeHYRsJLNotl?=
 =?us-ascii?Q?byj3ON1kMzJybjXarM3BtS7Vjozrewofb6x9VEYED+bJCc4uwED7Xj6m2CoQ?=
 =?us-ascii?Q?aEvAuPD+/9yGdvvHduTWTj6RKGen9tDPjZscs4tkL0C5m840HcMXPZcrUk9Z?=
 =?us-ascii?Q?bD2KErgslx6Ed4mKw+GmTfZAxlvUUdCU13qzyU1JdQQqdkFbpHWv6vWq+99x?=
 =?us-ascii?Q?t43NftLb6HUMQ12c/FfUzj+ahjYikBThS4jBvvl4oFBrTyYscomWjfKCFb3F?=
 =?us-ascii?Q?L6l3kJfH0YiX883uVKXK2BXrWBR2HXbo3JUqErJXoxDMdN4khEc6pxgDZ0Id?=
 =?us-ascii?Q?4X1dR0IEjI8bvdVbjo9gExoLV4HC1A+CUjKeoTc8YXguSiS6862Q9BvnNZk1?=
 =?us-ascii?Q?B78uyQ/HpWH76GQwc6sUtaJVtN7sczj72Q41yuCz6lyxUextb7jWjx3PIFZp?=
 =?us-ascii?Q?m4pyN3frMFE3fhYSTUpn9CGpG5Bwh1oN2JegDMOYG1cSwCLG6hLodkkIltUH?=
 =?us-ascii?Q?mLtxm1jAeAw6aZzZgiZtiAFN0Eo1VJjV3xel?=
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 10:27:33.5620
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d9707567-ff23-4302-d15f-08ddb240913e
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	TY2PEPF0000AB88.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR06MB5058

Problem: The llama-bench test uses cpu to run AI model. It can create a
lot of threads, so it belongs to cpu-bounds type process. It can outputs
three scores. 1st score is primarily influenced by CPU frequency, 2nd score
is primarily influenced by memory, or L1/L2 cache, but 3rd score is influenced
by CPU frequency and memory.

when run llama-bench test on ARM A720 with kernel6.1, it outputs three scores:
root# taskset -c 0,5,6,7,8,9,10,11 llama-bench -m DeepSeek-R1-Distill-Qwen-7B-Q4_0.gguf
-pg 128,128 -t 8
| model         |     size | params | backend | threads |       test |          t/s |
| ------------- |--------: |------: | ------- | ------: |------ ---: | -----------: |

| qwen2 7B Q4_0 | 4.12 GiB | 7.62 B | CPU     |       8 |      pp512 | 58.67 ± 3.08 |
| qwen2 7B Q4_0 | 4.12 GiB | 7.62 B | CPU     |       8 |      tg128 |  9.32 ± 0.22 |
| qwen2 7B Q4_0 | 4.12 GiB | 7.62 B | CPU     |       8 |pp128+tg128 | 15.10 ± 1.08 |

build: 14d627f4 (5288)

when run llama-bench test on ARM A720 with kernel6.6.89, it outputs three scores:
root# taskset -c 0,5,6,7,8,9,10,11 llama-bench -m DeepSeek-R1-Distill-Qwen-7B-Q4_0.gguf
-pg 128,128 -t 8
| model         |     size | params | backend | threads |        test |          t/s |
| --------------|--------: |------: | ------- | ------: | ----------: | -----------: |

| qwen2 7B Q4_0 | 4.12 GiB | 7.62 B | CPU     |       8 |       pp512 | 49.89 ± 3.83 |
| qwen2 7B Q4_0 | 4.12 GiB | 7.62 B | CPU     |       8 |       tg128 |  2.66 ± 1.98 |
| qwen2 7B Q4_0 | 4.12 GiB | 7.62 B | CPU     |       8 | pp128+tg128 |  1.92 ± 0.45 |

build: 14d627f4 (5288)

We find the 2nd and 3rd scores are both lower than kernel6.1. During analyze this issue,
we note there is a new feature on kernel 6.6. It introduces EEVDF scheduler, instand of
CFS used in kernel 6.1. After we try to revert some EEVDF patches below, the two scores
are better, almost near those got from kernel 6.1.

9ef5bc6e07a5 Revert "sched/fair: Commit to EEVDF"
a21eaad7417a Revert "sched/eevdf: Curb wakeup-preemption"
2cf7e10af999 Revert "sched/eevdf: Also update slice on placement"
a19837e0f27b Revert "sched/eevdf: Fix avg_vruntime()"
eae55a336cf3 Revert "sched/eevdf: Fix min_deadline heap integrity"
ba3c4b6b5aa9 Revert "sched/eevdf: Fix pick_eevdf()"
37561f3cdba5 Revert "sched/eevdf: Fix heap corruption more"
9a80e5bf2bb5 Revert "sched/eevdf: Fix vruntime adjustment on reweight"
df483ee656d5 Revert "sched/eevdf: Always update V if se->on_rq when reweighting"
587fe3a23160 Revert "sched/eevdf: Fix miscalculation in reweight_entity() when se is not curr"
65f847ba8cc3 Revert "sched/eevdf: Prevent vlag from going out of bounds in reweight_eevdf()"

Does anyone encounter the similar issue? What suggestions do you have to us?
