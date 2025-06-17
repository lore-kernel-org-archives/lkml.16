Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2066.outbound.protection.outlook.com [40.107.220.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B380F2F31E1
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 20:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750190796; cv=fail; b=chpZ/FX6LORTs8VBK+KVkOOXe3nKqy+CHC79yi5OXROVr6adxsrjiBCwEoqd2Zartfyxtf/LRRkv11SUZBfq+u5G+YRONbXNmtk3eYKgnLwB+Y1FTsBHGXPOhkfuiLfJwGni6U92d8F03dNcbIzwyyS5kZN9GIEvsC953nbhxAA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750190796; c=relaxed/simple;
	bh=jLbGvf4xyCPG8cZUaOSuu3F2M40DKvJmlarjPL3Yauw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=o1OE0lO/iIJnbPqzIyDQuU+2XVoAfw5dzr1cR8FjQKH5c48x/MhWi9OjC1g62r5C9T3P5d5r5KormhWJg+mvlDIexT2oQnthT8bW2lvcjJwkJ42DvD+/SyR8qUdY937Q27B+Z79Nvs8C+x5apLNO+325r20/qdykRuxZF1IIkig=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=lDQEJUq+; arc=fail smtp.client-ip=40.107.220.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="lDQEJUq+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F5zEvVKnKKePe8ClN/8K/9F7SP8xi5goYcEzLvZ4ZgiAQ4nnvktHS2mYvOkLZa9Inf+SeIsth1MaWuSvz45YVWSghybgVeQYz0k2Ied/6pqx8X3AB80p5+vzxkQct/miboX6twabG02Kq59hc7vwK/bVW58Pz/2Qd5f09GdtfDpkJVFKzI9fDcrDbCb/1fl3iYVrpAm0uMaxHYo2hBMsnFWEZopoHdKFOgopVHRaO9VfqWLj/4mlamS4FR1JWU2qvCUfja/fObMuvFPYRVKyxnmm5BbL523wzU1xk4sps0XmseqrDDHNAiDoY08ZX9XSzAA/k914wSuJ+ZZ7FNquAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PVGj681O3UO/8xjofEud7oMLkTV0nzgFFkk5Ey55cuw=;
 b=Q+V53mUIE7aD6WQn5Bp/ccvkTDFFyk9u2GG4JRvtNJNkdFXEcV2CPrfj39KCmsoEODctr4lOrsfbViSoyVBqnyLz7qbpNrNaIksiAYAxoKEUjpHmsd7J2eItLet5aK8I5H1lu36Q5RVi2usdb7uNGyRd7GY3p6bl28gDMjxctDUOUbbnyP1HjB8iTtEbWabBfeUhSBaflcv/DsA/U0Y1HdX0MrpfYjPi6SogCLIGZfF7EI8WAqxOLjKdMegu+WFiM8huk6xwM1vUof4fBUEXGWIJfn7URy0WLZbZZYovSTunRx89Crw1aGSTaDCqk+Rz24HFlwImf47luWUoZudcYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PVGj681O3UO/8xjofEud7oMLkTV0nzgFFkk5Ey55cuw=;
 b=lDQEJUq+A5gs/pVmT1yDm8cOVwWI31gT8Nqq9UUwzVklcH9T8fZNpF/Vd5XFDP901kNdPL9TyYYSjPKRycEcOZL62WFUcBMaUdIq3gcnAm3Rx4omXFy4SAQwbrd9dU9t46YAzyorwGO+3pcuu20hoqTNjMDvPs0CtUPgBOqOa28rY67c8jc5IuOi/X8zD7GfvhdgLPnK0BPfBl8vQMupjaalv+FHygNnCT6TM/A46aNo/PglKS7AY1lU+UiMvSddzE7Ey2hZadFdcUJfEAW/LctcHvYT1hs13kOrUepIBIv/DyeaGNNjcmD8M9BBm400jYP7c8fp1EfA6SKwoiunxw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by DS0PR12MB6583.namprd12.prod.outlook.com (2603:10b6:8:d1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.19; Tue, 17 Jun
 2025 20:06:28 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.8835.027; Tue, 17 Jun 2025
 20:06:28 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: linux-kernel@vger.kernel.org,
	Tejun Heo <tj@kernel.org>,
	David Vernet <void@manifault.com>,
	Andrea Righi <arighi@nvidia.com>,
	Changwoo Min <changwoo@igalia.com>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>
Cc: Joel Fernandes <joelagnelf@nvidia.com>
Subject: [PATCH v4 12/15] sched_ext: Update rq clock when stopping dl_server
Date: Tue, 17 Jun 2025 16:05:15 -0400
Message-ID: <20250617200523.1261231-13-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250617200523.1261231-1-joelagnelf@nvidia.com>
References: <20250617200523.1261231-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL0PR02CA0011.namprd02.prod.outlook.com
 (2603:10b6:207:3c::24) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|DS0PR12MB6583:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f8771fc-24d8-4acf-93ea-08ddadda71c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?id0ZDAmqRe1XWUmjXMYBd4UhUaRhb2y8CRmex60pXu4SHoxQ+6U8y210Oz1n?=
 =?us-ascii?Q?/VF+fcX+hSs1Ta+wEF27g2ljKzy48Y60gGHB1imReTedjWguAGBF31PtbZc0?=
 =?us-ascii?Q?ORfOEc0vxEnm2LY+Id0nuh9I68KmmAOhiElzrPkmRk9bz8raO3FnFbhCeWpP?=
 =?us-ascii?Q?GApm2YDuhZudbDkwpwEBNsnmIyztc8o7ny1Fs6fJA6XihVc1gapO36gnVWQ7?=
 =?us-ascii?Q?pwyua1AXyoFAyx6meeqxQF4mdbGQotzrN9s2l2Mtj8gewWIgut5xoH4nn8g/?=
 =?us-ascii?Q?N426770hLlNn7G81wpUf9ccncFSZNmLcPXgmiEQDM/1rn3anLwAO+BtZEZ8Y?=
 =?us-ascii?Q?pTVodRgP9LcBSUOLriAad24+85PGr9n7Hipj9WxmghXL185wYVCAnzsIOBne?=
 =?us-ascii?Q?Ac0s0fo7fZDCubxh3eaMbI2oWNbSNOyhrHVZ2IEQ8dTZv40YBQ3zIvj5Bghg?=
 =?us-ascii?Q?YcqJ/xTnseJOX1jHV7ct2Zn96XXe59BczM9kO8A0y0ljZ+pglzVzDexYHZwa?=
 =?us-ascii?Q?qJZzrcw9m8f1SyeawjI6fwWFnPo51Vwg1pZ6QYMwSGGtKB819eB+DQF+IFp3?=
 =?us-ascii?Q?WJkFzd4AxD1/qK6uvuSNO9hSgulFNUCCUGyiEyOi2BvxjnKLd2gNukFkhmG9?=
 =?us-ascii?Q?zxraZTkby0vP091LlrLpIAeSvxsA7BpHdiQ9dE8stey9Hcd1qJomMtDgHOGh?=
 =?us-ascii?Q?K6eI18q9pXogI749vAGoCfWBFiLF0A3fm/fQQNzJ//X5xfRvTjtzHRvnKeW/?=
 =?us-ascii?Q?XVxSdRSTbJcgPS/3S7Mux4z+O2OlhExe1G97vPgNSSg5RP+bs64CvmCtjPmp?=
 =?us-ascii?Q?S3JczSN3PGSvrKP6qybehkbw1ezdRK6EvOEGW+NiWVRZvwLIvcl4nKAmzgmE?=
 =?us-ascii?Q?7iP13WjPTqT5g/qyfZs4T77tAL6Jw9QGUAJnCaBLCIxOPPuFmv8xZLTunlb6?=
 =?us-ascii?Q?GoxdkAMSg8B3TV6R3FaO5F6qL477LPu2myfv8M1Ew8Km//CiQer6GClS2lRF?=
 =?us-ascii?Q?ItQiwqQs0QiveCLp8M/xVEpANIyZXK5PQ/5CegWmFvYPmqzbH6xKQsUtq+bK?=
 =?us-ascii?Q?4R2/zXANv8azqjhtDoz3KslyggkrwCDKyJAos7sF/m4dZ3N8crkVGT9EFiPc?=
 =?us-ascii?Q?SETM8PzIiZITBAvDpSUJo8nX4DgmBgDKmzBH0BDEhxFTokMogQtJGq0Tutf/?=
 =?us-ascii?Q?K4x8JGlkuP0UApzrgAyjtVuPAzVzWohtX6iJ/vW9ZKKCOAtl0pFhCk0ff+4B?=
 =?us-ascii?Q?5LJKYXs9UeTttrn5I0Thhp7y+mpuO8bBq7aH3ock9zVI9zwbxLjnFlBoDq0o?=
 =?us-ascii?Q?I+r/KwMQBZqk4N0UdtPA15F8oMKWdS2kDscTFdXHfM6I4BNocYXHO8fZaU27?=
 =?us-ascii?Q?qIxrUUU0YJGhU59BkwAq6hSLX0+IvGak/6lWn9HIvbFOwA9gW0oVdouKorlJ?=
 =?us-ascii?Q?Ra7T7ReYQpg4ZB7t/iKqGDFkWTVdr6WrL1+D9sSau7LkuBUBKtAOxw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB8059.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?O5G2u7+KBWFRnVyozUSwdVvizKP2RFGascLyQxZkMiIMa9F4B7bS4Q64NFZE?=
 =?us-ascii?Q?alHQcJtrFbX0XiOKRyJdN+X1r5zietMbmewEVveSruyIGATXQW/PgWUtaAEb?=
 =?us-ascii?Q?crYUa2tKGCZtr9PmxvgbAx9D3filQkyWjKKvIyI+VQmWzbjj1uj0b9DHv+yr?=
 =?us-ascii?Q?Rhlbpxu+5wXPk2ws2iUrtwIPGNPlxn/priOu45NCCD4neSn0y/oK9UmHxaz6?=
 =?us-ascii?Q?4++Pk+GNuienKag6DG78MMznJ9MbJH6fanSdQYQJOgkuHtkUPHR7+Tq8fbem?=
 =?us-ascii?Q?TNB8mUak/lm20MnKObhfhb2vFY8X7wdzJM+kPYVb+cxkuZpeRhydBb/Tn2sZ?=
 =?us-ascii?Q?imOaQdjSMg0Xf98/t4MeWCAWmmOtQDh5K6hTyqRh+YNBVJN4n3UsgUqCRb0x?=
 =?us-ascii?Q?saNfLz0XvDuvt5lfClZT5DD5TuAYekvT+D18zPEY8AcuhtHfRwnxXFkiMadB?=
 =?us-ascii?Q?0l263Re8xUZ1ykx1L+lGMKORH4RfZqCC3jWOYssqkAQ5w4ulpHj3MxOKKqnL?=
 =?us-ascii?Q?egDbewnII8GXlhS+KJhmYsfUhwdGf75cduWBnIgauaOD0lwj11zCL5BXvw3y?=
 =?us-ascii?Q?XVbow70Cb871wrLU4ckeeIpZELczEZOXMxJGoF4tiU80OHiXiWjCqI3eQ/jD?=
 =?us-ascii?Q?QPO2pRUzk32XCWbfpixjFeGWEvzCq/LG+D1tkaBMzff6dmL2Bo9vPHCXHCkO?=
 =?us-ascii?Q?zB5yV4oeEtHiCe5xH9A63yHbySyNZZBy4IzyaB7R/SHb3WRxEzasoLP/+8NQ?=
 =?us-ascii?Q?8cH7dxw2eOQjd/8SYKLz/PXdet2pW449CTJUp+ePoQnN0oh8sMcViO2Xj+In?=
 =?us-ascii?Q?jLPtIwgynR3Ih8K9riNU64m5fr+vhTPAaG62EKVrrCX6roUG2SOinbSiDwZE?=
 =?us-ascii?Q?ku7atVgtyYKJ7+Ks26qO1TwtxOvcGO0yImuci+CxCo3uJQ+nAamJjkxZIp+t?=
 =?us-ascii?Q?JlgKijA5sl2OzFPYxtaB9BZghAxgBqv+z/ToKEHfrYn4iAYGYm7c7wlXnRRI?=
 =?us-ascii?Q?uVJpvraZfLq+sqY+qTSD+zo5jsZXuyCiKhxO3RKqkT48ubYUhRwlRT2xxIKD?=
 =?us-ascii?Q?7kUeWgw5ZAEJmRCe3HDROYXi+xDxMi72JnEqlH2EmvKLrhYKP2bSBPX5063m?=
 =?us-ascii?Q?of1nOyCq+I3rwvz+VngYMX71RaOk0Vp25kocCsrll1sYYrN5QOP2wLa/pef5?=
 =?us-ascii?Q?1FLnOqw91WZeLkr3hhvk4iW/NgiyT3nhGdg5u4i4HUXSaCFp67LeFPcWkbtM?=
 =?us-ascii?Q?3CzODfAdLL1TDzWkQyYlJqGJ4MlBZAgGLMZ6bHZDZYXb2asSWeq26THFREYf?=
 =?us-ascii?Q?J8Kv7/r25Diub7ZMYvx8h0ud3IXCcKXJlV7aFRKTbfFDyo2nTZLFegh7bUq+?=
 =?us-ascii?Q?Nt0tSSLHPZLvl2tFmWRagLhbT8KtyqL9i+2A/eHutcfVkgROjdIoz/79JGra?=
 =?us-ascii?Q?Nzi3lyH317xN7o2dvRpo3H90IprdFMq5bg2EUQsGKCtQ9icOcAkJax918rn0?=
 =?us-ascii?Q?ZB3ytGXBjOIKC0786Vc8bfv23d2FN2r71wU7M01KghMas0+4pMdCLMO44Iyf?=
 =?us-ascii?Q?p3g6klM3ApEbqRClJG2WFe/PiMOOYcgyAxF17fVk?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f8771fc-24d8-4acf-93ea-08ddadda71c3
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 20:06:28.0586
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KzZI2Q4UtZ8AHBoT4PomGfqyGYCyGUaAniCP/bIYCqy9cwHQZ/6H8KLcZWIXEU7WK+TgEQfN0jwOoJXeXHwtfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6583

From: Andrea Righi <arighi@nvidia.com>

Call update_rq_clock() before invoking dl_server_stop() to ensure proper
time tracking and behavior.

Signed-off-by: Andrea Righi <arighi@nvidia.com>
---
 kernel/sched/ext.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/kernel/sched/ext.c b/kernel/sched/ext.c
index 562cd28ff42f..84ccab8cb838 100644
--- a/kernel/sched/ext.c
+++ b/kernel/sched/ext.c
@@ -5000,9 +5000,9 @@ static void scx_disable_workfn(struct kthread_work *work)
 		 * server bandwidth will be re-initialized.
 		 */
 		rq_lock_irqsave(rq, &rf);
-		if (dl_server_active(&rq->ext_server)) {
+		update_rq_clock(rq);
+		if (dl_server_active(&rq->ext_server))
 			dl_server_stop(&rq->ext_server);
-		}
 		dl_server_remove_params(&rq->ext_server);
 		rq_unlock_irqrestore(rq, &rf);
 	}
@@ -5754,6 +5754,7 @@ static int scx_enable(struct sched_ext_ops *ops, struct bpf_link *link)
 			 * re-initialized.
 			 */
 			rq_lock_irqsave(rq, &rf);
+			update_rq_clock(rq);
 			if (dl_server_active(&rq->fair_server))
 				dl_server_stop(&rq->fair_server);
 			dl_server_remove_params(&rq->fair_server);
-- 
2.43.0

