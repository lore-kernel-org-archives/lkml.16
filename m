Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2081.outbound.protection.outlook.com [40.107.94.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FE4B227EA7
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 18:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748887296; cv=fail; b=POhh1PWVIC/i3S6eA+4Cd0c56hl9zLZb6OVEuw3tnU+p3YHJGst9Sx1JxeDCef4kXZwxmPNg+2/bI3ESp16P4JICbIXbSgiFFbtuOgbDhaRFmCoCR2xzpsOW3KwE3u1XKIfJ9au3RCugteqf6MVbxEhHb9FAl4KnfFKSyHfY8so=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748887296; c=relaxed/simple;
	bh=weKEvNh8TYsGl6bbW9L/xtMomUzZxv10RGjn5xFG9jc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tNntcFGodSOkkvTQ//VSmcioZ8+KgLu6cA0ynTQ7lQOmYmfY+Dss3SJhqQPdFqT8pRsHggft26G6WZj4ls1815S/072vc9r5FLrdot2taDr5VIpDClqV1+Fu2R9zv7ZQt4tDQG6DzfWcm6E1ez1a1uCxVgHO8KnVhQ4Sg7hEXWE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Oj/typ31; arc=fail smtp.client-ip=40.107.94.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Oj/typ31"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gerKyC50Rh56I3Zp5NiBno28bT3GtCueujaJmAHPRLxjoKi02VpF0SoQ+62nJehXfkoM2pBinncz+MLjC6dyfm78qDbugRXlX2BACO135GXxv3SHdsyqWh1Rq6whOCXUFXAaI3Obwx01b3ScJvUSgoKNT5d0wiuNmi5pjfyRpbBpvccKEetiTO6X4LXZ0RLWqgnaozdfsFAYo1xlRG2pcmX0/ICmBRJmh3pB7zYIl+nasI5H/c0eOpg9WijEqEDY+muR7CIMvBTwiE2b1FJ8jiVivus2H9FnmXvUibNzKKy5ePINpf5s7is3j/vY0FmJEp9ClSlAvcbG4Gg31UoSjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y4qpVmPK6J09+lmgoJy+itbjOBRl9Z3wjyxyO3Ut+vQ=;
 b=UnRhwZF82/LKk8ynxvdTy07VTzUlu5NgJJq3Z5Ys/xxLmH2uLvEDvzLfr5slC9TShtv+2f/HXrgb5w4VE31TfFPFAYiIsqXqY8ITL0bg9m5ZIbjGp1iwBI+O4mK5XvEVUbGR1U2PMBX6prtVk8knc7GJYHF/5s/NGCfFcY5TSLKW9cdLtanJZu++nyaPfUErQXCCgeupf+NWkTGHaDLhKOJZG2oUnDLVoD0qk4VTswurPh5Hv3K/9Htvr3eizro2ZrIb3JdVv/fn/TwnhvOM1EYB8CXeKOP8U9iHfba6u4XqsSvZTEkQDYcZ8iEO0uB89uAuo4knBKoV1GSKLVj12w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y4qpVmPK6J09+lmgoJy+itbjOBRl9Z3wjyxyO3Ut+vQ=;
 b=Oj/typ31NSpL9cdbdhGHpG67p20TmIT0FYI5FTumSIliPUpvjrBmujSXHt+d0D6i+aA8Njgl+wu4PUNoyp4ioctf9hlXJOJbG90x9vB+HiUOrBfii43ldm8/36DoEMRcmQFD5E+zHkBO6xR42d5IREtt0W5v7nNBxEmDLimHBbhA+odXI0hYwEUhKbNqO3v+f1SZZXaTDWL/B7mbDgBnAjepozP2O9fwbzQIla6Xlj8Kw8i0RzBc7eIyft/tzcDxg4P48d4zzc3jBjzC0KJJDrq4hksFFZZzP7Hg2cw0A5NyVFUNFZ1skNqXMF00rbqLgEoTeCrKwL2uuWA88tEI+w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by MW3PR12MB4473.namprd12.prod.outlook.com (2603:10b6:303:56::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Mon, 2 Jun
 2025 18:01:30 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.8769.025; Mon, 2 Jun 2025
 18:01:29 +0000
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
	Tejun Heo <tj@kernel.org>,
	David Vernet <void@manifault.com>,
	Andrea Righi <arighi@nvidia.com>,
	Changwoo Min <changwoo@igalia.com>
Cc: Joel Fernandes <joelagnelf@nvidia.com>,
	Luigi De Matteis <ldematteis123@gmail.com>
Subject: [PATCH v2 03/10] sched/ext: Add a DL server for sched_ext tasks
Date: Mon,  2 Jun 2025 14:00:59 -0400
Message-ID: <20250602180110.816225-4-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250602180110.816225-1-joelagnelf@nvidia.com>
References: <20250602180110.816225-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0158.namprd13.prod.outlook.com
 (2603:10b6:208:2bd::13) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|MW3PR12MB4473:EE_
X-MS-Office365-Filtering-Correlation-Id: 43945b64-f503-49f6-04d7-08dda1ff804e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?okMxQqhJotfhMDAtWYHYJaGOiTSXC1m8e4BpbPbWJiYB1b7QSP7H7/29Y+AH?=
 =?us-ascii?Q?CHwMvQSy5JFmmzv+LFWbO9gzgRECVTtR175lbUKDY0mhI5cPuZHLvNI/Y1HY?=
 =?us-ascii?Q?NqQ6dLHl/2hX/gsn4xLWQ8sr1q3i4jPHfK7XzuQC3LFCad2/cZ5SCPm8A69b?=
 =?us-ascii?Q?89LKV3F/Cyx/2E5C2wnJclaiLUevBpGukCsLu0G2oMyYoJVSvkmzNACfHYpK?=
 =?us-ascii?Q?Qsvgnwwp6NOMGWVOTQzmu40vd/0YEZjKhGuT6qoYy7pU62B1HMW00F1UIsqd?=
 =?us-ascii?Q?5iPcx/Y6F/KniaVSIn6i+zHgoIuMPSXT8+7amxlq507rLwyt5K9labwCrYck?=
 =?us-ascii?Q?9dXj8g2M5l9hant4FxgN7nXhExW73/Dkdhonma3XqIsVt9LEk9qXZEyX3wh8?=
 =?us-ascii?Q?NnShtF05XSoa0RdyYwFQv9M/ZJjf8ZruLJEcb7BcJMm2GvKkzma50cTbUpbp?=
 =?us-ascii?Q?6fBjmPSGkujl8INMOFsGhajP9vobgxSMNhUnSBtu+nujnK1Dufkl3Re4odJM?=
 =?us-ascii?Q?Ute0nydqvn1IpaBaBe4evFrq6+p9BgIlYSNlxP9yPgXvaAHAXqRMA6n6i4NC?=
 =?us-ascii?Q?kiIp9HA3Guq1I+pubWxwTHUQPAUjO4Lflg+gxtkmbGgfpBidMKAH1dOQpqck?=
 =?us-ascii?Q?iTkT4lUKrH7Vc5yQGSmeBA5YWmnp888a7VWESx5N8Nc2/rzStFUiYYjFTZHx?=
 =?us-ascii?Q?ea3Bqf3seMdCmmbEgRgapFOOKVGT1/SJRYgOE0iufghb/ldJWWK3vtsPV4js?=
 =?us-ascii?Q?HPzCpihAuEY/K30P5WY4KPIaPyZG/325SfARCFB3RZeg7S+D7ud/oncOYk3u?=
 =?us-ascii?Q?FVl6/WHqRYEsPYZ7R+aLiJXM0bJkWhOk8L49JgRd3MPLyddP2lz3QtaapfFQ?=
 =?us-ascii?Q?rp7cKc80w+QUnSGZD/xJFfJqF2N/J6rQ8pAmDIT86j9FmEkDOLh0xImaDF3z?=
 =?us-ascii?Q?PyAVnjfigND0pnVTP4npwXrnpzOOaA1Zjcd09r/KVdOF0S6yshqZMbk++Q8z?=
 =?us-ascii?Q?lpqn4WoZL7D1yiDdZEVzB/uM30kRBWL909TGVsv5jVJi7KGryw4UonDCriGF?=
 =?us-ascii?Q?lLg51sXeVtPh9Vxwov7TawA0m+TpXc4OMcbV5vFYRZrhKTkKLzZHDTw/qpJ6?=
 =?us-ascii?Q?N18WPlSoKvgcxKs3zKJsgvLkCo3Q5NeD72FFk8tJwDWAJ8GrUloH51KMVSQq?=
 =?us-ascii?Q?fUW0Ml00QRblc4P6V0U8moVlfQ44KqZTVxKJ9W64UaiMVsfIFo2lXHU57fXx?=
 =?us-ascii?Q?OEWkHQ+OVquwyO6rOwY0hIHo/8fwssrLTfTcpI6CLUeFY2ueqhKm2yoBDVFi?=
 =?us-ascii?Q?k18EIzfI2lF+XBVg28WMhXaDpXWWYFLQyoWL5CHshdQebF4G82mLm52bM3qi?=
 =?us-ascii?Q?qkl3azBJKJ7ktsWY3U+R6ZqcwINi3uFGlajdOgscdDwTh/FcPkaGHBruzcrk?=
 =?us-ascii?Q?8NeP8YZQX0LZCCTbLbf+O3f2+rEkRCLY284KX+K3oPErYnlPoC/Xig=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB8059.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0ac6qce0IxdS8MPofGI2TFbATI5rBKoIAmCe2Q5+NV1QGRRqjINHFt0KHYcn?=
 =?us-ascii?Q?5FnGDohZCFhG5YKZbueqGi3+kTKc86JJmoti+2SMGRGDyE/hiCOrU6t4Lkb9?=
 =?us-ascii?Q?2v5JoroLrlhfwtaVt0bDKigc++SAIRIVl1dvT5svddxH/OySKILnmQVTWjBm?=
 =?us-ascii?Q?gZxL9Yz2K3L8PrzMWOjlzRwjBraqPO4xjLiFzCokznU4AYyJygwrWaW9PZHI?=
 =?us-ascii?Q?c/WgzqymfYNQjwSvwv3evwnp7qWX6knaVRaQLQ34lut5B8TEurPO7EBZY9MP?=
 =?us-ascii?Q?GvfZPwJEWpkuhAaZUduQ3AzGxbryYtsXlF1dtgxQf/c2IuNOEaDITJYBSDZo?=
 =?us-ascii?Q?On6ZCbK5PY7dkWEUQUlDOI+9vAP5Btq/YcTTLwsSjA/kGxFDUpbimyNbHUoo?=
 =?us-ascii?Q?rbgm5Z5hC9hcbF6AWiMluQQssApUIPAAQHlfNaHuUR/a14g0XKds8njqsmts?=
 =?us-ascii?Q?hU+w7zEYesLDZA8ukNUk2OOCsUMXHArjr97BboHXTTFM2LbwCef+3BG5N492?=
 =?us-ascii?Q?G6MSkxpG1puwNDmoGdkJDbN3iYhNtI/tDxXeTY/Fdw12hQhtQrt3K4dJoPC3?=
 =?us-ascii?Q?523vTz2o61BP26hXjMkFa4h/i5K9a3DayX3DVA7HA1eS8wKzJ+/n/EAzpyq9?=
 =?us-ascii?Q?f+bvUg03en9hz422mGz7gbYXKIT0+OdmNP8G2FwCSVteEVCfPk1f4DgeHUVk?=
 =?us-ascii?Q?4t64UlB6QFrKbw3djl0VtzQpVBii/sKRFMyqaUhIFOdCFmP9Gs/fapycTHWT?=
 =?us-ascii?Q?bZ2M9GHQZgXa/3z4OJ3TeULBcJ2rFM4LmfbBv0yTXxtyx/zTWCiHQRF+G8el?=
 =?us-ascii?Q?jGLk4zrjxU/KVdHUaBtSZl1MBvcXCdO+IF+QpevQzs+zpondQwUfalaNDJGh?=
 =?us-ascii?Q?3O0mufpcizixIjfYhkuG4yWafaYgXRFFgjVKra/mdd6CC7/jLObqiIsTYWjl?=
 =?us-ascii?Q?UWGO2OBTwqDSU61YwbNDR1iZ+EEj1RynTj4MuvUikulXdoYLmsfyCRliIfU2?=
 =?us-ascii?Q?o9auUQcDJaE+oOmfYROWtd2cf1OHTRF7GfJkDXKlsCHUrduy/FeJ8DVyqS4Q?=
 =?us-ascii?Q?+N0Cg9iPT5x4rfa13hdw7k4swgpxD/D/wCw9j6Dl94vZR02RvOx21z4aqkbu?=
 =?us-ascii?Q?nBdo5I/ozZfLFT9lo+29WlmEHE/4FncVAWcrum6YZi8zONg2Uy8xC5U75jxF?=
 =?us-ascii?Q?W+RrLkOB/0UIb0RpcblwvpEaOpQCM6jxmbnvo0SabakCSyfrDum05H+rSZZj?=
 =?us-ascii?Q?+ZZ7af3uaxATZLj/WYW0iNkHB/z1arWRLLM78ow/AHe2knzQBp9bzjEVfOi5?=
 =?us-ascii?Q?csv3GPR+yAkthT3q30TaBVqlkw+LPRH6HJ3LIGCmz8kLHclUTg6SToPB4NSY?=
 =?us-ascii?Q?Die1l7Le6CXPHbQABSi+lMJc9ypLMfWVhZBdM6AcvnQBA7sQKQgFEHTbrBje?=
 =?us-ascii?Q?8ZRGfPeiyjL0qDkIyt714Ic2RjgSR0PdVd88xme2SPmxrK5iECVG6Cy65yzI?=
 =?us-ascii?Q?smsFfdsoV7uae/EHNPkp8FkOt2Xjl7FbsuzgcZEL8jYR0qAg2KnQf9ypowvI?=
 =?us-ascii?Q?G94oOdDIMO/z/7+Q3avltdssK3ZTTcflDIvAd9Ac?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43945b64-f503-49f6-04d7-08dda1ff804e
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 18:01:29.8877
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LM67qwd0UWSqLSRRJZqkUJwsgVJV69occR1TNjJxFJVrlriCZWkXe9SuMftN2o18PgDVchSuV4MPAqwmtlrv1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4473

sched_ext currently suffers starvation due to RT. The same workload when
converted to EXT can get zero runtime if RT is 100% running, causing EXT
processes to stall. Fix it by adding a DL server for EXT.

Only either the EXT or the CFS DL-servers are active at a time. The
bandwidth of them is added and removed accordingly, when sched_ext
programs are loaded/unloaded.

A kselftest is also provided later to verify:

./runner -t rt_stall
===== START =====
TEST: rt_stall
DESCRIPTION: Verify that RT tasks cannot stall SCHED_EXT tasks
OUTPUT:
TAP version 13
1..1
ok 1 PASS: CFS task got more than 4.00% of runtime

Cc: Luigi De Matteis <ldematteis123@gmail.com>
Reviewed-by: Andrea Righi <arighi@nvidia.com>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 kernel/sched/core.c     |  3 ++
 kernel/sched/deadline.c |  2 +-
 kernel/sched/ext.c      | 62 +++++++++++++++++++++++++++++++++++++++--
 kernel/sched/sched.h    |  2 ++
 4 files changed, 66 insertions(+), 3 deletions(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 19b393b0b096..17e7cab0ddf5 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -8645,6 +8645,9 @@ void __init sched_init(void)
 		hrtick_rq_init(rq);
 		atomic_set(&rq->nr_iowait, 0);
 		fair_server_init(rq);
+#ifdef CONFIG_SCHED_CLASS_EXT
+		ext_server_init(rq);
+#endif
 
 #ifdef CONFIG_SCHED_CORE
 		rq->core = rq;
diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
index 3181384881b8..b703cbf627c1 100644
--- a/kernel/sched/deadline.c
+++ b/kernel/sched/deadline.c
@@ -1570,7 +1570,7 @@ static void update_curr_dl_se(struct rq *rq, struct sched_dl_entity *dl_se, s64
 	 * The fair server (sole dl_server) does not account for real-time
 	 * workload because it is running fair work.
 	 */
-	if (dl_se == &rq->fair_server)
+	if (dl_se == &rq->fair_server || dl_se == &rq->ext_server)
 		return;
 
 #ifdef CONFIG_RT_GROUP_SCHED
diff --git a/kernel/sched/ext.c b/kernel/sched/ext.c
index d765379cd94c..52f98c3944ed 100644
--- a/kernel/sched/ext.c
+++ b/kernel/sched/ext.c
@@ -1830,6 +1830,9 @@ static void update_curr_scx(struct rq *rq)
 		if (!curr->scx.slice)
 			touch_core_sched(rq, curr);
 	}
+
+	if (dl_server_active(&rq->ext_server))
+		dl_server_update(&rq->ext_server, delta_exec);
 }
 
 static bool scx_dsq_priq_less(struct rb_node *node_a,
@@ -2308,6 +2311,15 @@ static void enqueue_task_scx(struct rq *rq, struct task_struct *p, int enq_flags
 	if (enq_flags & SCX_ENQ_WAKEUP)
 		touch_core_sched(rq, p);
 
+	if (rq->scx.nr_running == 1) {
+		/* Account for idle runtime */
+		if (!rq->nr_running)
+			dl_server_update_idle_time(rq, rq->curr, &rq->ext_server);
+
+		/* Start dl_server if this is the first task being enqueued */
+		dl_server_start(&rq->ext_server);
+	}
+
 	do_enqueue_task(rq, p, enq_flags, sticky_cpu);
 out:
 	rq->scx.flags &= ~SCX_RQ_IN_WAKEUP;
@@ -2403,6 +2415,11 @@ static bool dequeue_task_scx(struct rq *rq, struct task_struct *p, int deq_flags
 	sub_nr_running(rq, 1);
 
 	dispatch_dequeue(rq, p);
+
+	/* Stop the server if this was the last task */
+	if (rq->scx.nr_running == 0)
+		dl_server_stop(&rq->ext_server);
+
 	return true;
 }
 
@@ -3894,6 +3911,15 @@ static void switching_to_scx(struct rq *rq, struct task_struct *p)
 static void switched_from_scx(struct rq *rq, struct task_struct *p)
 {
 	scx_ops_disable_task(p);
+
+	/*
+	 * After class switch, if the DL server is still active, restart it so
+	 * that DL timers will be queued, in case SCX switched to higher class.
+	 */
+	if (dl_server_active(&rq->ext_server)) {
+		dl_server_stop(&rq->ext_server);
+		dl_server_start(&rq->ext_server);
+	}
 }
 
 static void wakeup_preempt_scx(struct rq *rq, struct task_struct *p,int wake_flags) {}
@@ -7106,8 +7132,8 @@ __bpf_kfunc u32 scx_bpf_cpuperf_cur(s32 cpu)
  * relative scale between 0 and %SCX_CPUPERF_ONE. This determines how the
  * schedutil cpufreq governor chooses the target frequency.
  *
- * The actual performance level chosen, CPU grouping, and the overhead and
- * latency of the operations are dependent on the hardware and cpufreq driver in
+ * The actual performance level chosen, CPU grouping, and the overhead and latency
+ * of the operations are dependent on the hardware and cpufreq driver in
  * use. Consult hardware and cpufreq documentation for more information. The
  * current performance level can be monitored using scx_bpf_cpuperf_cur().
  */
@@ -7385,6 +7411,38 @@ BTF_ID_FLAGS(func, scx_bpf_now)
 BTF_ID_FLAGS(func, scx_bpf_events, KF_TRUSTED_ARGS)
 BTF_KFUNCS_END(scx_kfunc_ids_any)
 
+/*
+ * Check if ext scheduler has tasks ready to run.
+ */
+static bool ext_server_has_tasks(struct sched_dl_entity *dl_se)
+{
+	return !!dl_se->rq->scx.nr_running;
+}
+
+/*
+ * Select the next task to run from the ext scheduling class.
+ */
+static struct task_struct *ext_server_pick_task(struct sched_dl_entity *dl_se,
+						void *flags)
+{
+	struct rq_flags *rf = flags;
+
+	balance_scx(dl_se->rq, dl_se->rq->curr, rf);
+	return pick_task_scx(dl_se->rq, rf);
+}
+
+/*
+ * Initialize the ext server deadline entity.
+ */
+void ext_server_init(struct rq *rq)
+{
+	struct sched_dl_entity *dl_se = &rq->ext_server;
+
+	init_dl_entity(dl_se);
+
+	dl_server_init(dl_se, rq, ext_server_has_tasks, ext_server_pick_task);
+}
+
 static const struct btf_kfunc_id_set scx_kfunc_set_any = {
 	.owner			= THIS_MODULE,
 	.set			= &scx_kfunc_ids_any,
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index 467e39205ebf..d206421b1146 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -389,6 +389,7 @@ extern void dl_server_update_idle_time(struct rq *rq,
 		    struct task_struct *p,
 		    struct sched_dl_entity *rq_dl_server);
 extern void fair_server_init(struct rq *rq);
+extern void ext_server_init(struct rq *rq);
 extern void __dl_server_attach_root(struct sched_dl_entity *dl_se, struct rq *rq);
 extern int dl_server_apply_params(struct sched_dl_entity *dl_se,
 		    u64 runtime, u64 period, bool init);
@@ -1137,6 +1138,7 @@ struct rq {
 #endif
 
 	struct sched_dl_entity	fair_server;
+	struct sched_dl_entity	ext_server;
 
 #ifdef CONFIG_FAIR_GROUP_SCHED
 	/* list of leaf cfs_rq on this CPU: */
-- 
2.43.0

