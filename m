Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2074.outbound.protection.outlook.com [40.107.220.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33A5C2E03E5
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 23:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751499008; cv=fail; b=W7ooRJWPl9Vb1UKECQVlOiz1CxslNt/4K5koBU4rxIjuUFZjcZzfH1fizMrBPTn7HDrpT0xqOH5OxdwFZyuFbzqdCaM/jiLS7yKTaHNYKU4KdLKQ/n12TRnGsGtLAg648MZCf2LHuiBNGUmZsboNudyazMy9Uo8UUGCksYoKpOw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751499008; c=relaxed/simple;
	bh=+UdE7xUaVn8dFLiN+Jq1QuOV8SjS8ru5rOKgOuKmJOA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VY4nnMvi8oJwfv5tRATnAraZ3y54f+gekPBaW9P3KtMXv3EAhbt8UUbmq0LOdEm4ZmLkEiBwDt9U62wGtzK5vx2RRAA31qO5cyWN0xpSGNFNO4dHFTaF7Yb9rzD7V+VQ+MYjoYcxHVaWZTH83TwG8wznZwZsRapKGgDSuSEgy20=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=C40JS02A; arc=fail smtp.client-ip=40.107.220.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="C40JS02A"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sqdd7DRRNAnC8u47vKIf6DnMDgX91nXg+SdQaI8eHI/UNk/9mBRMG2UVdcEFP4EVUigptYSbMDmO9tvACVHzjJwrTBhtNhY8XvEB5+G+DXjBFtFaudJIZ5XfUDx0ZccS6aQMb7+HHajPypxuKcrlffvpqTppBnsK48ZNUS7S7x/nYJ3DIN4KBtPWohJYuMczqIBg/TDoH16KCOllUzjAJpmh/NMqw3DBb0qgJwZup0aum+MxuUjcABwcEzDGWe0JmD+Xf4J0MKLl+ANk+omtJQeQpyuZ6zClFiLqFj3f8CtbQA1QF5NUFsx7Ob5mIKae3g5lbXDaQqY0K9Uonq86qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SdVgbI3Xt/5e0D5QA2xG5ZKXiFxSIKLaVpNTuuOz3lY=;
 b=gnmWTnDdSI95tkdNAwRVV2mGUbohPkLwmURztijcNh535C+u/0MgShW/v4Io5dTTcTmH27DBdGhtBEG6WWGChrNZnweb4sz8BDYSQmYdYpaaU7v5SzEmGZc2Vb8gGlnUO4Ga7+ad38ld8VSD9gv/I0YBAz++UvphfeVxExBOD3K5aPqZh3l9L9DPZCxVQH+jSW7ndUpW3i/udc+ynZ7FrcgcNRz+WTVkEdAMQY+fXHu+YwSRUG+XWoEutlPaL/6C7zfgfc+82h7Jv2LqpcvSy/2AhZPBdpS7h+STPPiu0TUwgIDXTtoCIdUzNRadd7bBVjAUebAlwI5xi/GvyGduRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SdVgbI3Xt/5e0D5QA2xG5ZKXiFxSIKLaVpNTuuOz3lY=;
 b=C40JS02A0mGqK0exmXBOCMHbqPa5HmuPs11xaPHhTwZAI8NZsJDbFZC+TjYSO96blRMbHezMmCRdbtlvPGBv0HVcBb/8C+kC5aY7ABh4VHH+rZXfJ3l88Pl0UNX5Hqg2Xy1ArAzNpnThXH2GwnXiy7QVSmskb9mWZn0BAS7kEfjburlbCU75avV+lm8uGkLaVf32u52s4eHz8YsqgY6mhdlIAACH/N9Df5dBW/ALN0UICGkUtVBwyfRWV54fdUrG7NqQpnGGLHS6MttFWc0qahKQJLFncBKRHJ+s3HpFm1+LtQvr0Y7MkSmd2J9cpgZu/TV4JKbUKSjfSN7ZKTBjmQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by MW6PR12MB7069.namprd12.prod.outlook.com (2603:10b6:303:238::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Wed, 2 Jul
 2025 23:30:00 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%7]) with mapi id 15.20.8901.018; Wed, 2 Jul 2025
 23:30:00 +0000
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
	Valentin Schneider <vschneid@redhat.com>,
	Daniel Bristot de Oliveira <bristot@kernel.org>
Cc: Joel Fernandes <joelagnelf@nvidia.com>,
	Tejun Heo <tj@kernel.org>,
	David Vernet <void@manifault.com>,
	Andrea Righi <arighi@nvidia.com>,
	Changwoo Min <changwoo@igalia.com>
Subject: [PATCH v6 03/14] sched/deadline: Clear the defer params
Date: Wed,  2 Jul 2025 19:29:28 -0400
Message-ID: <20250702232944.3221001-4-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250702232944.3221001-1-joelagnelf@nvidia.com>
References: <20250702232944.3221001-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0172.namprd13.prod.outlook.com
 (2603:10b6:208:2bd::27) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|MW6PR12MB7069:EE_
X-MS-Office365-Filtering-Correlation-Id: f6e57971-239c-4270-c0f4-08ddb9c05d52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?YcDqncWhFFG3BjejBbS0P5Ngr/xes1FLbrqcDTWnW2QRqQfm+fvjtaZTZD0t?=
 =?us-ascii?Q?3vwWGPTLJIPI3iYEkER/cn3XC70RvzmC6O3vZKE2TTW7gvzQ9tTCZHXujcnN?=
 =?us-ascii?Q?7hP49S2DFmDR+lFaUi1IWBCP3U0eLKGWG6pML4HvBm4Wu8dgLrpInm9yLL8L?=
 =?us-ascii?Q?5bQpRM/8g3hTPkGxiZv/5T3kzHxoOCWPPzP/p/khGtsLwDc5zji/a0xSUyy+?=
 =?us-ascii?Q?BvCzp19e9s4mUucFjo2gDwp9N49qrgdmvVFQhFguDt21vhKB35l+l9vn7fUr?=
 =?us-ascii?Q?XyLqrkUtv3beZMoCizXvKSPYGN+hLfDQDTTi1dPiPjIxLY4WKxGDfG9xNpdY?=
 =?us-ascii?Q?YP9N2Zw3p/A3XJeKdZKZ1wZCk2SNAP2BhFOXIK4CgPV7LwgHK3mT0QXliWVq?=
 =?us-ascii?Q?yZm9oRXdGEVgFmDS3A+VHIt5zRpHgtcnT8rSWov5Yg5/xwHQ5e7+ZVyvBwCi?=
 =?us-ascii?Q?ULMbR4VZYRK9uG0Qwhqd5iBpumeCJJmoUjRivZVYA9PzbL9hnj0Fy0ce2exa?=
 =?us-ascii?Q?WV3pvLKgnrlQL9/ty8mKv2TZUQt6buk6IE5XFG1VhyNV+jbsnluqlGvoApNN?=
 =?us-ascii?Q?5P3ELhxsHHhST6aRyEnKZS2BGlHT9VbslB6fuo7gUGvFrczcNfAQ4PDMCTe4?=
 =?us-ascii?Q?GsvZryag0mbhRvkNpZj/wRTZDFJSyBR2CJmpu/nNy1jkT7f+kdocElyA81C7?=
 =?us-ascii?Q?P8F2zeOOXWI0zVJoPF/mzB8O0VJc7/dlv9VkXZEuMzBlIMawhSiq89uSAGfH?=
 =?us-ascii?Q?Umeu58aCGVIafeovJ5eWRVZ4Z56XCxz4PHIGtkqDucn+BY7m3nAPf2Iwn5UD?=
 =?us-ascii?Q?bAHiNNuh4oqffsPps8sgCBDr6KL9XlSssMYu8h9az8KlQ39j6h8GIIzNrZ17?=
 =?us-ascii?Q?u76NJAjiZMjWgXqPMVKqIIECA6q9MT5IgoWRd/FF8I1KQZSO8z9zsnhWVF3+?=
 =?us-ascii?Q?M9jKkeGDB0zf/DWYBwp08w7gJj3mS7CqMhtJ/VMLB5qxme/iI/+xEA3mfrsO?=
 =?us-ascii?Q?cs+BTiKXquotkHxU5q/MPkpxDP30TDc1LWIKDr04//0NmM6cyxh0YJuWtWoJ?=
 =?us-ascii?Q?3Qs/JsaFBJD9Uh/JDtzafSB2R+DLWrdwL46vrwSfB9riZAnIhlngjbCp7zPq?=
 =?us-ascii?Q?Muzng2VuzdLiEElMVst5yT0dEHAwqR+jD2TCZQCvQqeOxL3fQcpzWpXYi5E6?=
 =?us-ascii?Q?YuPmJzexpqkOoQeQMLyclJg7/bELFcxi2opQpyw8SWUnXtN2dGr6gCX28zYv?=
 =?us-ascii?Q?9hO37OB4S3c+UwzrCleCIlfuvUoFPVKaAO2w6Zjg+xO5Dq14g+MivAqqP7Qg?=
 =?us-ascii?Q?LvXvvFII4k3O1r8i8YjTaDx51koUUFVLGFsaWaqPcOAz6rPhme2vFoiV5o1q?=
 =?us-ascii?Q?VIEvgar+YERUpBbjHleG/uW0RLB97GtZoJW3kIhOwz0KpuzkmbxrBisYVgQ0?=
 =?us-ascii?Q?wIn/SJjJt13xIIEki58BVXTJ6GwAjaNVO/RbBpWqKPnuRuUHZOd18Q=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB8059.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gzap0bn69hph9JuLIh+EQD0lBp3lOxt0ecnr9DYfwWbfelB7GYeVejBGzCnl?=
 =?us-ascii?Q?IQreV2u/rb2BLp8TowAdLBKoJBOJUHoUZFwQvC/ESr1SLLBnWjPUtq4RiaHa?=
 =?us-ascii?Q?Lm1jv13yroRqjzgtGN/Yz7bgwvLhCgD7TMGtma5p+6ACxqKRAk1aqY2jPcDX?=
 =?us-ascii?Q?AoLK8DyakTWOOW+pPPV6uF10+kihQ/6TjyjL1lLaaJKR/OJTNBs4PBIuJnHX?=
 =?us-ascii?Q?uHDl5f8HukunwYTmd0NApHREhasas1+qTeU716bo/dyuQDOV8qL8eMgPNvDo?=
 =?us-ascii?Q?/xdOU4973JP5U0CJZnvGwnTNBXke/OZ2S3lcxnEC5pjDtyg60orX+eTubEkd?=
 =?us-ascii?Q?zXuqVsJKLRBf3w+jMqEc7rEiqgbYov4hCa6yjAnRkdp55ROfsbxvdiArtfeh?=
 =?us-ascii?Q?IinT6gFccVmxjDa3DttTeOZlHmzYjR3bT7Qzbez21Dm9643V/LjvR+vRXRbM?=
 =?us-ascii?Q?6ciwlCvBdQl/zW36PIHKRVAY+mAFv3B8+/t21VEkmQWnLYMr9xA882NXqnbo?=
 =?us-ascii?Q?HzkGc6Gmp/EdVOr82zZJ8GrxZYBiTRBRh7adT3b0MFk7yFkNZo/IuvDnQAY7?=
 =?us-ascii?Q?HyROzeeurlWePNJtzWOb5flvQJhKj3mDiL8WcolwnCE1MjrRvba8nTySaKLT?=
 =?us-ascii?Q?KMiEW2oLVvFK57AL1c2+5WXHbP+7UcRqPAEt0LpsdKA7oIIfyR5oNcr5G3JO?=
 =?us-ascii?Q?GCxwL7wMcIglynsrU1DHgXqm+XNdaCQh3mIc2De9f9vnJr5KFjkLWwHEVPY+?=
 =?us-ascii?Q?UB1AnvF6ZhHkILvJE7yk99EgSmwzyeu94jxfFwDcsBy+9EPmiDY21gngL6w9?=
 =?us-ascii?Q?0X/8sbf6tIdkWQGte7+vZvdW/3CIsqcc4VGw7ep+6djKqYJt+Q/KZc2lt2+1?=
 =?us-ascii?Q?A43fQzs7Sa8qugp3HCP/129qutJWanmNiuLbiF+xwLiVVAaqN7cmLagknAcX?=
 =?us-ascii?Q?adRAYe/pZbzytn7N9n5OAagIOa1vtq3ZeuMRgQjdUSlnBxgC2vw8NxWEQNBv?=
 =?us-ascii?Q?37IiNU+9Y0wtV0q79GWghnI8684Ed6J3Ijxos6dNMSDtt1Glb9VkDyOzj9sg?=
 =?us-ascii?Q?A7e/QFo8Gs8eV0ih7FI6H5qmEXL5G304x3mvJiUa2X1kwJobXHlD/deXexAG?=
 =?us-ascii?Q?bH9BLTUzGGNfirmRrzZe3Um3zsgOitvEwnmf/EsfUoKirWJUWcdB0774sSZX?=
 =?us-ascii?Q?zaT2Xznk7g8WVKru4vnCW1h8Urpwy3SAm9ZEoLdkjgbDO5Ukz7E/zUIvo+Rd?=
 =?us-ascii?Q?VCpjsUYjnNrshn8YiuexGFJMcfqjK66KS61+52h+a6YLnGdW8059O+6oVAjO?=
 =?us-ascii?Q?QzT7APK/M45lOejdemz+t4KJjX016ER8wbF3NQuw7HLNn0zga8nbWb+Bx2KD?=
 =?us-ascii?Q?BKEuhHuSfL8h7MKBtzBebszqdIW5Yr6RRUw8Sm+06HWt/3YXXSxv7+uVGqme?=
 =?us-ascii?Q?sNH4FS8XVboXmxfW06pjsnQx0QtiOlAqx9cWsBVXCJqIP4RhPoUU0eo50ynE?=
 =?us-ascii?Q?97F9f7hLMlO6QRbWqOOaakXcmPE813XowlhQ4lQ+6ZexbbPtud6/EtJG/nwB?=
 =?us-ascii?Q?oaHZxBfCwCYdYTXcmuUvpchkG8L9k0QIB9iXa+Pz?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6e57971-239c-4270-c0f4-08ddb9c05d52
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 23:30:00.8392
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZMceRFldPS6102CUCnayd1HqkbldMIhov3yKwvdmP/PWySdyCspmHuqZLWn2RvTxHa4xPbnNntlBsqf6O2P5Ag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB7069

The defer params were not cleared in __dl_clear_params. Clear them.

Without this is some of my test cases are flaking and the DL timer is
not starting correctly AFAICS.

Fixes: a110a81c52a9 ("sched/deadline: Deferrable dl server")
Reviewed-by: Andrea Righi <arighi@nvidia.com>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 kernel/sched/deadline.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
index ad45a8fea245..c6da2d51667b 100644
--- a/kernel/sched/deadline.c
+++ b/kernel/sched/deadline.c
@@ -3431,6 +3431,9 @@ static void __dl_clear_params(struct sched_dl_entity *dl_se)
 	dl_se->dl_non_contending	= 0;
 	dl_se->dl_overrun		= 0;
 	dl_se->dl_server		= 0;
+	dl_se->dl_defer			= 0;
+	dl_se->dl_defer_running		= 0;
+	dl_se->dl_defer_armed		= 0;
 
 #ifdef CONFIG_RT_MUTEXES
 	dl_se->pi_se			= dl_se;
-- 
2.34.1

