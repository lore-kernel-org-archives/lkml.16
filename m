Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2054.outbound.protection.outlook.com [40.107.92.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8AAE258CF8
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 05:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749791891; cv=fail; b=VCw0IH9GVnHEvHgV9XZk3635n6kJoOI3aNyZZeqFAIIC5E+ocTRP+ERbQ9GDjSOawuiw4kIWXTejtmo1PIMVBQUnQ3IX77SEY3kHSVUWKxeV7FuOERsb6HZe43TYHiEoxc5AyQi9giAlPJ8JcV7up5IfyfETSDu27UDwnsWXFuk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749791891; c=relaxed/simple;
	bh=v0VhznKmTBjQPkqEgrKc91UPnRflPAvGzB4o1m7lcf0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KISRWuHkvFhSHyvKcTz2ndEzsss/HEb4I65VQzipvnn2KJ81ttcXuxEvAXUjLpzacT/5w9gZhGf0NMut4UVS9S+FGN7D7uhURSFQO3cWA824p7eg68i2/WSz1W3iRpzpOISINyd24wJ/Anc4/lNIeTVwYgkFiOm82EFmXsG7eH4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=cZmAgHDE; arc=fail smtp.client-ip=40.107.92.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="cZmAgHDE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xUL4iNvm8DwP/eDhNhCI3LJaGs93/rnz195zYzG6NrYWnRVlkgFqU/zZeqUcEX2nQKvzy6gzgE/u1JgHrEmYOfnXr3kbEQ7sHsfp6NzEz2/i6R0xC1mQfJNqEeaG17mlrj0qXV0DDwLcc40yzr9CIm5Dx4lpGvwW6v8t2PX3KliLg4zb8ECaazEjAcFmHsd/7oOdT8CDdfT1Mf0Zce5ZGDHhujKaas4GKUSjRt6x9HotDBGQLqO1mbrREykPdrHZHz0WuxNaJijpFnTqPFSn3cN6lNE47HH84SWLySHCiipay6BUrx+sw6sBbrtbgBX6CcMkZtg8641gKVG3nL7ayA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JzGHLxM6UFYo0FtdEyCFPHAW5iQ6j7k0PF4HtObReWk=;
 b=YcNLpRXeRvRuzJiEmfTm4o5Pl1bswg8ZE+c7hgqFFHk7ew11a3kSQESzjZVnRc44BcOYCsofZBH3WvAaVYyyWmqegPMSaEfGwvmSNb1uZArcUR3pGFLZ38McJTQVue7L2KoJRdOBWpDbjM58t3fHJ6aA+ZmH5hjptreI4To/y75xOShJP5DkNLJEjLVIzSuV66eA+CbTUAmo7yCeP1Us1PyK22p3iKTzYVsnv73U4XQDdt/B+lpqtR5VLMzY5012OFPtYgXvuAPZPJnqsPbVXa9QHAZpO7Yl36guFjvF26mwp4xCR2RauA9V4azvs4pSsx3ASRZyuUy/iPKmULXXkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JzGHLxM6UFYo0FtdEyCFPHAW5iQ6j7k0PF4HtObReWk=;
 b=cZmAgHDEz6x0BfKJ1HevO7FSAFIJY+SPqr0yEJT9FYCI43euH9bpLGbsOZhuTuOz+88Bdw+ZbGwc+otXMPds767KMGNp2fjjZBGBdo7fhSVX5ZtKhSs0CgMpVL/xQcNSDqO4pw16eVwG1CmRTi4OSoVfVBBP2lme9b8SFk9VUit1P7UzK7nttEzhZ9BFBCdHfoCCE8wdW/MLiHN9z53YY61ldzVp01vgOhuJ3bG957ubErjM1bdAZ1vgEJYxbhkKzkw0gLBSkj1q8/7jetDiAVJhlAF+j3gM9MtuIhD63K0SB4zbofalzPgqBsutIS5ijNrUW9Efqnqdq4LOzs25jQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by DM4PR12MB8571.namprd12.prod.outlook.com (2603:10b6:8:187::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Fri, 13 Jun
 2025 05:18:07 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.8792.034; Fri, 13 Jun 2025
 05:18:07 +0000
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
Subject: [PATCH v3 06/10] sched/ext: Add a DL server for sched_ext tasks
Date: Fri, 13 Jun 2025 01:17:26 -0400
Message-ID: <20250613051734.4023260-7-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250613051734.4023260-1-joelagnelf@nvidia.com>
References: <20250613051734.4023260-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LV3P220CA0016.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:408:234::32) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|DM4PR12MB8571:EE_
X-MS-Office365-Filtering-Correlation-Id: 44a2b300-6986-43df-79dc-08ddaa39ae8c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|7416014|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?RPabK1EJQy7jX/qZcyAD4NG1yA5gndT4SkymoU013YeB/Vhbm2h7oAZsDPOZ?=
 =?us-ascii?Q?iythkEJJ0zVYVzcyCc1MGClDO8Bhjih3UnJKN63bC3IT19NrITrOgNLlY1C0?=
 =?us-ascii?Q?2cLFvUHji6uh9As0NL5b8K4DoofYX2ABkaTnUD15FnveCdlsyNLLAxXoGy2q?=
 =?us-ascii?Q?UAc/7HZwL3BF1IPi4HbGoPW4SpQlCGJ/Yf+0mtHGGUIuTZXn49VHitmQcB1W?=
 =?us-ascii?Q?wn/lHpv0PSd8UfgKxy1xUTZjZBOM0rwWnOrLTgAdCp69JRXo5rqQJcc3Lglx?=
 =?us-ascii?Q?f6fthVw+Ms+NLkFfGVRFZbX1Ub5M///So4XGnLItxJxaZ8PVy9Ggm/X+cE0a?=
 =?us-ascii?Q?DGBrA/2EFgaVRoXv8FnOs+0d4WVanPTVRakhonYtlp4fbLxvyEQaDWAAGY2X?=
 =?us-ascii?Q?/nTmUnf4gE3047XH36xvQBj51hLiKWAq36kCQBvl/12og97PwjHuRCRMCmp/?=
 =?us-ascii?Q?/oXfDRgT/7SZySMTmcLjJvIq8LwO/bAQ4+WLTs5boHPgadTQUjf80+aq7Ycc?=
 =?us-ascii?Q?+GWnYuUm7kPEui9bo1zQWiXVzI76NQHVfEglKUhBrObDaKnNx+zr/IFdCJ9/?=
 =?us-ascii?Q?i7FkBxvjBaq/+uWdJ8vZuri9GUmNYbZ1nD9q1k/k5ilKOTFwO/bE1dKrv1wJ?=
 =?us-ascii?Q?bkWI5r6Q9skIK5IrF6/cKgh2arZdlrciPt9ISKCALs+nwF070G60Igte3R9/?=
 =?us-ascii?Q?7K1JU+DXBAdmHyIkdIf35/RmkFKDjSgWYX3Ory9EfoDpj2ySfD8Vyq0FDF9o?=
 =?us-ascii?Q?EKuQ/A171srBMKsfbyGDlglUxIaJ3vDUnrKE/q3ZpJ4mudhnMyRNY0rXGjaI?=
 =?us-ascii?Q?H2mWVuGrAG/zbMzQzbnITJY0PfWrpRuuo6SGtrfvbHaRNGuapttUNSMOmaxg?=
 =?us-ascii?Q?bhOHL77ZY9Hg20U0I8CjIOKaIHSXtxOd4oVlIzYMgSZeQwIz6dibH1V1CJze?=
 =?us-ascii?Q?l+cMgma0RVuALeT3f9tGTB2NXG3grl0kksF8o30n9lb6iuwwPtPvEhwqZb1B?=
 =?us-ascii?Q?6XLm3AAje/uDezMUJnrcK/bukjmOHGfeR5bmNqfav/agZUMv554+mv0hHULz?=
 =?us-ascii?Q?UDBLAhk20bHShegi7poLgipreQV7bz2mpjJGSSG3zFfSs4m+v2siWxM9JWzm?=
 =?us-ascii?Q?npSUHvsqxGnfrDzEV6+FMFTPIX2yhOzF90nSMRK20hVOVU0sX/S9yk3WhDwD?=
 =?us-ascii?Q?U0ulnYJaflAhkDNPq3F4M2J07ppbcCPKZGD1CsLcLc/cr7xF1Gb+F6ITwrpz?=
 =?us-ascii?Q?lJVJTsD0fYTdg3PVdsLZkrfkLATI2yccHUyR2Fogvjl+OAdM0KWnuw+StaUz?=
 =?us-ascii?Q?/DMLZeqUfXVVvziDYShSrQ/+cIh/c78p3aNK8huJMkBcdEVGvPbWRHDRcBDO?=
 =?us-ascii?Q?UKnzLQB3rhmvydDBGxaA/mvk1DHSdgWhij9f1gf+IGn/fw3FDDs5XzQIRPo8?=
 =?us-ascii?Q?IFjJRUyTLAzjQU4uQUpF25n0ddxJKm2BRXqiXnCu3F82WlakZd1Ilw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB8059.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6M559kLpq1ae2oX4PZ/g12WU2cEqYfcMwhlvi9zbEEBxoHS6BjSd4vwsgxoz?=
 =?us-ascii?Q?jrdrRUnEwpyZ9D3y15VUdT2A4lvOdwa7E4HDlMmX1NjWA6eF2A8pNeRCpWdg?=
 =?us-ascii?Q?xqqqUMYdk7iV1A+DTpgEdX+XtWhtI6pH0o+RsV26Qdu73kd9CByFLYePUrwy?=
 =?us-ascii?Q?JZMga4WONF8I/lYlsp8kY9OS5clde8s1HcmWysvhUSaRIDIkApsG7cd9dQ2O?=
 =?us-ascii?Q?yLdpHA1LF0ej5f1rZqWWAkn5yTi1BEXiBfxpTnTr79Ovjx1xGgqsbM4IFu7N?=
 =?us-ascii?Q?olUGBvtcptT7ukvFwbHxQ/8eVncSxJRMw9+FSB2Vmct+1VxVgqqGJAb8xbDm?=
 =?us-ascii?Q?dpgiEtd3FqlHxHfMpbBubN9jt3AVwzHeF8UxgOw3O0vF+LvECNXrn9sLD4Jt?=
 =?us-ascii?Q?AdBHt28z9OM/6Uv5SdddsiNQ0SW2bNgTMpMiACsur4k7gEP1KVqSN2v2KtbB?=
 =?us-ascii?Q?N8RQSGR1aGe8nDdDWxfa2TbBPCMWnLeWwsyQaNyejVtqavBkXslxI45EhCKc?=
 =?us-ascii?Q?6VbJNQ/eUIPPhv9XHyJZEOzoq2rUNN00ihnkKjeChYC8fqpv1mzmkqDlRXFs?=
 =?us-ascii?Q?PmV9LXKRIMNwKCVXqYYRv3ipAw2czuvDRcaMQr/U/ad2+MjeawFJKm3zNdGo?=
 =?us-ascii?Q?5uBb6Vhq+rnUM9pA5R/DVN7t53bgKX6/qXdhQ7aexzTIHoALP8WQebIyuee+?=
 =?us-ascii?Q?M2XK2RblazYp0LIuFFT7jEeCN9dKsimXCJBJjHxutHzPVHbVzjfshnlO1x7P?=
 =?us-ascii?Q?L1Y7BdfO5GHwpZIQUElIdO4lWWinXeqseQz9M/iGdYfNhz4PQKUQeul3Jkuo?=
 =?us-ascii?Q?tkPknmEXJKJu7dvrW9gBIy/pOaar4F6oZ/A6UaXU2TOCslws2v1hO8Fw37mA?=
 =?us-ascii?Q?g0N2+MsH3bKW5zpEcCXl8B6HRx0smzw1TnKgp3ldr1y8jUnx4yYOEHafflwR?=
 =?us-ascii?Q?MHxNIoYcXRbgEHLabXrJSvqJd0+g1Phfn7Go1/eVKTc/bdb/uBCbTdQ2tpPB?=
 =?us-ascii?Q?8H9zaTjhkNgBjJY1jYXK5VCizSkBZkdJtrUDDPgLzIDFJlwsQUQsqXoLcIab?=
 =?us-ascii?Q?otJ3My8C8lQGyQSVMu500xX46uvD2Df6ips6UkidJL3rbGte/phFVsri/CgF?=
 =?us-ascii?Q?bgTD0NS1sJqD6j4WmLSZP+IcfzgUd40XDCZK3vxVwCiCrfbvrGaMLAPIwqlE?=
 =?us-ascii?Q?XGmPqkr3P/pOvb3IV1GylppdHuQnJdzK2CiWTVxzlHBI/NGBPdaumZudRu7I?=
 =?us-ascii?Q?qwB4hWvc+RGLjPXRt6b8ZAXK8j0NBJzfLuQnv9RLgC8ATKb7pzmH0I9atPR4?=
 =?us-ascii?Q?alGnMVrH5FAisnqAwwmOP7ondtkKsyvgsxa42soKe4Ydd0/BOK4iq5BGx6IT?=
 =?us-ascii?Q?km+nFAxwblwiZHswhGQL8OU+QD6g8hmxBSphqAL1HJvSfHUyww1tV/OaYTlk?=
 =?us-ascii?Q?03j/EvgICRygGCzEzjmRhDZAMa+8X2NRzyS+spUyiLAqBu21FkaZyP5Gch/n?=
 =?us-ascii?Q?mptN7a+Q7iViaUCPL1mPgAWGJaw31RKCna8QTG7WKMT//xH/nXXWbcUdtguj?=
 =?us-ascii?Q?kqagI6OCywsZYwjXzKIxiXv/SNz1bLP973WKMU/6?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44a2b300-6986-43df-79dc-08ddaa39ae8c
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 05:18:07.5925
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qcL3e7dm++Jfk5TBieNQVZP50EZ6nsDROHp3WSw0Qfj1ls2ghe+5q9ifsYMmlPegCSS2tq/f/CXVQ73o7d0Xxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8571

sched_ext currently suffers starvation due to RT. The same workload when
converted to EXT can get zero runtime if RT is 100% running, causing EXT
processes to stall. Fix it by adding a DL server for EXT.

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
index eb2521584f15..4ed61266f3ea 100644
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
2.34.1

