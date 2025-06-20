Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2052.outbound.protection.outlook.com [40.107.236.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFADE2ED15D
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 20:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750451582; cv=fail; b=k/I/mNT+ODaeDdNM4CX9ej5vRGwKXGzY/WYuZUtDC10nhtQtZ91wgEcgC2KOFfGxERNyLzMOusWhl7wngtsYyzIuKGFYqiYWDvkVwBC6Awc+6EU+/ZdjkOiA45LVNxEt2WnXzWpNoNB9jJgThniQQXnTwwGNNzHH95V+84oB3Do=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750451582; c=relaxed/simple;
	bh=o7KBEJWgmdRM1L3DLcsrVTOWlRA5ELrSWVK4cmhWrys=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QLnD1Naa56xWm79DLvnd9M9UcNUaRGYJUQJWdpNcu8GIWfxPh7q3OXUGUeMz3OTmlaquo5VxtqRNiKVSdxfj7f/4Vqsa8qLB+Mskdo3wygG6lSqnedNzdK1H+4dKVLKGdi4b5+eayiY/fPLAbXbJOtGUbNEZ19fdeHOIJXTweP0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=TSQJVNSZ; arc=fail smtp.client-ip=40.107.236.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="TSQJVNSZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hty9Kv5lV1nixHTZ/LjmOM0iIlT4sHmqro8+9YwylaoAPGMbnYZ5rBYeJp+d+HkIsTohkAb2n/0+5hOm4rlk73lg0h17238SGTEq7OzeSffR+NVso8BXOr7IVtZvLCGLWoir2aSBruw6V8EoAyHxx/NK22QD+WDLA/6ccuDkCCxs3yl4MOhldnTzLGT2acwwnw7hHtoKkSD+BucNkn3JD9R0NdbUCZw7HFXMRydvFgBipiVqbmeySZ3QfT4C97NQzguOhP+XeG2XmdZU7zJMvDIiY7aOVWwzvwK/OPxYgfii3XassTLnTq7n23Jh81c2XfHjJZvTLd2AO6TN3XZ3Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HCEugULIeG32du8napmciqf42uSPo7UVw836G+sTAFc=;
 b=sq+3pc1+rbnuipdVTggjvXP4wnfNrT65qH+FqDnLPi0TdyeyTotnzMk8zvKt5DBUn+Wjxl9mvz+G54cfVp04RlaU0rKOluMwdviR/2FcrSVZeEUhCct23e/bjtXI08jlZtq49/WDx2bKAj1PML0E1LTpsudRZ6bXA8uj7V05LJIVRpxjHgfOFLDoG0maFqCIGH5pGBHjKG9CmKMzAv6ZC8A9HfDw/t2d7pB4zKiCTr8h5SC/xIgNdgMD3iIejkgMIObD1wbFyRIjstquuBrH1FAQpZ/S2yJP2naRPdxKmaPNABkrwohMvct+nNQdie0KUIemG9EeMtrgx0+c0x2s2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HCEugULIeG32du8napmciqf42uSPo7UVw836G+sTAFc=;
 b=TSQJVNSZiHhYoMmyxP+UzcXyFsLnVCts3Y2puRDqw+iDxBfu+EpTWq8VLIzioc+4ZQvKTVFAD7mQTgINfI2U6SA9N6W/7RXYsWImHwCQXH/jxNWBEMQs5RWeYp5lwhZ3KBwmHKG0mGhFC6PONMOsH/sZtGYa18t8dSD6bGN4UP1N39Otmpg9QKTkUf7t84Kg7yRoqtDn1eiODldaE+r55dkNjy+9OJz335iHoiAsmW9YoYs2M/pvt5EPndgV05wcDwIf2StLIGtDxRo23BGSzuucYLoK9521l8bTgIhYKy0G3pesytGvcUmf0hWHbdPENGGe7TD1wWo3m2+Ui17ZKQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by SN7PR12MB7273.namprd12.prod.outlook.com (2603:10b6:806:2ac::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.30; Fri, 20 Jun
 2025 20:32:56 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.8835.027; Fri, 20 Jun 2025
 20:32:56 +0000
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
Subject: [PATCH v5 07/14] sched: Add a server arg to dl_server_update_idle_time()
Date: Fri, 20 Jun 2025 16:32:22 -0400
Message-ID: <20250620203234.3349930-8-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250620203234.3349930-1-joelagnelf@nvidia.com>
References: <20250620203234.3349930-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN9PR03CA0916.namprd03.prod.outlook.com
 (2603:10b6:408:107::21) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|SN7PR12MB7273:EE_
X-MS-Office365-Filtering-Correlation-Id: 53ebab19-154b-49d7-8682-08ddb039a38d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|366016|376014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nmxwFO3lifllsOSS6tvDNIqFewjTK5h5YbEWskGsyUolTfiBHygZj/So9BmK?=
 =?us-ascii?Q?DTSK5jgpzTRyrrFgbAQXLP1Ufwvh8AnHU/6VD54OcsBE03Y3MxO5b8EBiHvL?=
 =?us-ascii?Q?ZOwCB2CL/coqiYbt8Esbg2Y1vhVhy4tE9VV08l8IufGGcT4Y6Vo54boe/w8L?=
 =?us-ascii?Q?142welDxfNGYWDe2uyJF0/w1E8XNEZinq2PsBeaX+DqiS5OaToVL5QBI0KmA?=
 =?us-ascii?Q?uj/D6s6O5TYcacykz8jTsNKb7XcdV17yjkhSOojtH00FcBAYhnYpnQE5RgYJ?=
 =?us-ascii?Q?lBndbwj2HXdJjIbpehDqrQObm5yqcTXIXTMTZ/KmSKhVyw7YVeURMkmP5w2j?=
 =?us-ascii?Q?fGVGJFeoXdcVI4CSLv+Q1yr5rkh1vtSNfckhe1EJvcwlgZDlzRF75UaZYcJO?=
 =?us-ascii?Q?QsS7l0gcxG3jW43CmiuJxTieGrlN/Dnn6QIWVTPWpvPj1mGvsAcCN/tpZIr+?=
 =?us-ascii?Q?1tuilqmf1yVDPpvfoUmUsPvSl2sY+iKpZ+kB8QP/sKlwhPw/oSQUzoyjJ12Y?=
 =?us-ascii?Q?2vvagXk9juZNuJPJC6gokt5EQ5LSollIXj9jUVh07u03+34O0EOA55DFMe+0?=
 =?us-ascii?Q?gwIWBl0JaOKMexYGQtk77+Xlykc5qlIiqZ+d/mcZBf0en27JhftLywLLe+3c?=
 =?us-ascii?Q?JPhDOPnd1PXhxlViQLaEBc+YKKrWvDXr8gRHoqtwy+K9UFUQTw/QTtFyYpvs?=
 =?us-ascii?Q?/yUnYF8XgabpwfH/Qf4g+wPENfYV0Esqjfn1SawxKg7H0Or0wREOx6ieZLpR?=
 =?us-ascii?Q?8NhrbWK1FpTvms0JVhhbO2W/DU4FVMMXy06VBS7ZoCQlfR2GECEeFXJhrALp?=
 =?us-ascii?Q?llRPqVHxj2ygsGW+UDiyYmdWnw5fC1wE6jbcT/sJ4kJws2qzfuHZb93fh3BN?=
 =?us-ascii?Q?iBPQzi2Ehe2YFOZNdZyJDGNzMd50N6xgb6xhkc1RlgTdA6xXDRm8QMnDFqgv?=
 =?us-ascii?Q?yem2bqhBwFfWaRLs5doktOHAzeG/HadKYWX2nAhyEBjaIuzSwkG829BV/nLr?=
 =?us-ascii?Q?JzxulgJ4fGrVr48RnYOb45+t7/TkpDMZFLeKtLM7M4QnV+WMVSxwtj6/OnHF?=
 =?us-ascii?Q?5JYghFHgq0Wi6PUwvOYbfIxU4WhDcHH6DDvePZMTK5+fPmx3VFw6dxFfONP+?=
 =?us-ascii?Q?9UTYd9y5S207l9brcLEL4ovjM69ZXUS14VKew7MVD6GaF/leZ+QE7V8/btCe?=
 =?us-ascii?Q?uswjtbtVPJTbcG/V1H25s/UrOMQS8BE8BUgtnBNmziZue4ROjzS1DH7DOrE5?=
 =?us-ascii?Q?+2PGk6b8lBnboVRI/T2+h+EiBAnPsFDdeCHo40Btf4BaF5XBajVHjTFGzlH5?=
 =?us-ascii?Q?O97Xh0q1eWsMARtYLJqeTPUbNsmzZmmaJ9EQMervVY4nPcuNqzuYIukmCPcq?=
 =?us-ascii?Q?hSjOMCSQcuBSFDqb2OWVQ/HcQXXw0fVSsZdkaEA0EVcBcfmYw5Xl+bDOHe3+?=
 =?us-ascii?Q?R7qR+Fl+T1VhpvJN2GnHV8BreGF+h1Furs3LrLkNMxuYwLsiZguSMQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB8059.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(376014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xCqDBovF0GO3cTe0YUAVVlRZptRndOzPewUcaF9JpV+ouLvXYnIzeC2DbgXu?=
 =?us-ascii?Q?4j6kpB7q1DQHAwFIzOcOYGSWbVdUMGXlJjD0j4HtMlo/qUaPwNY4+ChrcPUU?=
 =?us-ascii?Q?/FkTLBcXoNHufhaiW6wBtw2/9rTiewzN5ZxMQccn5wZ1sDIQLL9ql5sOymWh?=
 =?us-ascii?Q?As72llOAdOKwqXV9PgDTgianZsRktXPdFfAQo1PcnEOvDs6wiYkiuKRx5QGl?=
 =?us-ascii?Q?NXzyZwHluNtmVSSF6RGX0nzMbc7UBoLjusyYZXC0hPi9VWesdZjdITE9h5uN?=
 =?us-ascii?Q?gbZhz3lQEKfqOIOOQEK3k5hghru54whcP46Ukfh0d6H3vzLBeNiORIz+KOtO?=
 =?us-ascii?Q?x2KQHjn0QoIIjuxOL+Pf+QYWMz68/ywta2IwQgM8JDOUkjz9ukYmvD2dvsGu?=
 =?us-ascii?Q?oZdyAZmIKpty85J16j9xl+GlKE5g+PLE3K0iGvEngGzr3wYKvU0wZEgtUDty?=
 =?us-ascii?Q?pyRloqXKjyjI5koPTE92IX3TZ1kllt+uFRJGysQqAR8gj0/BdSjP3+F4yz37?=
 =?us-ascii?Q?gL9Ehrl7Wmd81mgUhPeKFYzN+sE44pkrFEX9WNdMly7zLSpuqyLmZxV9AfD3?=
 =?us-ascii?Q?1j6tyIRjY9Rn4u6CpEqh1hzbpgOFsyEBR3bQXYdKSzL9kWGW7jga/+7QXaX1?=
 =?us-ascii?Q?8kiheQN93EqVFtBunKYPjpqzQAfw5jzpti9HmphQ0sijx4AKc0OicIhpA/mN?=
 =?us-ascii?Q?zG+EIU5QfgdwgBVyO99FGnPS+l79HGqFusN7K/eX3QfZklFmGhrW0LseVkwd?=
 =?us-ascii?Q?dItQ/yE3yoywK5f67p39WY1EmrHrqXPRoy7q8ebtS15Xgye3oY4m2hemXQ/n?=
 =?us-ascii?Q?bZGbPaxd2JqvqFCYcoZXfG+Xqj4Ia2HZLEre59kF9oJ5uiVMOtCiYPamtIpo?=
 =?us-ascii?Q?XMz3Ojv/UEdD2eHILAVuyrzQMs+cdg8o3hqHzYHDqh0xnJFwGOXCnharQIlo?=
 =?us-ascii?Q?BqgrWi8ZT6UAfl6BMwiScSJrx7SumcSA2QvlfCjSHc2vxwi6ePT1E8LeP6RH?=
 =?us-ascii?Q?rFvktEhfexSTnED+EtJ+k7WS1OqwOFbDnAVlKJg3IdwIQR88889n7U2pqal8?=
 =?us-ascii?Q?j3SZylUy1etNU9lSsed78AMPbloXPQ2QjqhHqoWzC2Ma6pyXWcnigIVzkOpI?=
 =?us-ascii?Q?flhO/AdFNVd6G925E4BuOCx65W3s1KWnWqZwAi6zLoZPG25EC2rzMzgAORAx?=
 =?us-ascii?Q?/gp6045Eufsw+OsX3ky5IW5gTyrZApkX2ttruwlw2ev6HcnbshGZwEjB0X1L?=
 =?us-ascii?Q?+DPxh7rkorASrkzt5MeINTOpiGAMyMiy5QJaWkbQ9syu2lwEF1LO+NkP+VDn?=
 =?us-ascii?Q?zJ+iJ5lpL8gkggx2OmVnt1sJAizzqWeyfjTzPM9oIASv6zb8AMs0tieXgsjR?=
 =?us-ascii?Q?aJGcXB0Bd2M5ze7r4R2rDYDLJ86SERWrdOOvT7M+k0mpJjBsKdTZWCvOwuAr?=
 =?us-ascii?Q?PnC/IhErN/FgckCFBTzJaNTzi8xDvXyWArNWESdx/bvNa78Fm56bIuS/soiK?=
 =?us-ascii?Q?l7vZaujuL570Bjv8b+uxHnDDW4g/Si0mqiLS9ahR12BOs5QoQDcEf9rJo+wa?=
 =?us-ascii?Q?COGixKS9lNRu/reb0uTomrgFf+WiWIuYOegXYjtA?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53ebab19-154b-49d7-8682-08ddb039a38d
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2025 20:32:56.1074
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TlOWvubDhoB8yi3cAvx6ciQpsUaSRKOWl2oniBLiPQ9AGBp+RdKcWh4kZ/br45RbaclS4g2vUuqlkgHNGaRJXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7273

Since we are adding more servers, make dl_server_update_idle_time()
accept a server argument than a specific server.

Reviewed-by: Andrea Righi <arighi@nvidia.com>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 kernel/sched/deadline.c | 17 +++++++++--------
 kernel/sched/fair.c     |  2 +-
 kernel/sched/idle.c     |  2 +-
 kernel/sched/sched.h    |  3 ++-
 4 files changed, 13 insertions(+), 11 deletions(-)

diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
index ca2a31da8107..562e1e7196b1 100644
--- a/kernel/sched/deadline.c
+++ b/kernel/sched/deadline.c
@@ -1609,28 +1609,29 @@ static void update_curr_dl_se(struct rq *rq, struct sched_dl_entity *dl_se, s64
  * as time available for the fair server, avoiding a penalty for the
  * rt scheduler that did not consumed that time.
  */
-void dl_server_update_idle_time(struct rq *rq, struct task_struct *p)
+void dl_server_update_idle_time(struct rq *rq, struct task_struct *p,
+			       struct sched_dl_entity *rq_dl_server)
 {
 	s64 delta_exec, scaled_delta_exec;
 
-	if (!rq->fair_server.dl_defer)
+	if (!rq_dl_server->dl_defer)
 		return;
 
 	/* no need to discount more */
-	if (rq->fair_server.runtime < 0)
+	if (rq_dl_server->runtime < 0)
 		return;
 
 	delta_exec = rq_clock_task(rq) - p->se.exec_start;
 	if (delta_exec < 0)
 		return;
 
-	scaled_delta_exec = dl_scaled_delta_exec(rq, &rq->fair_server, delta_exec);
+	scaled_delta_exec = dl_scaled_delta_exec(rq, rq_dl_server, delta_exec);
 
-	rq->fair_server.runtime -= scaled_delta_exec;
+	rq_dl_server->runtime -= scaled_delta_exec;
 
-	if (rq->fair_server.runtime < 0) {
-		rq->fair_server.dl_defer_running = 0;
-		rq->fair_server.runtime = 0;
+	if (rq_dl_server->runtime < 0) {
+		rq_dl_server->dl_defer_running = 0;
+		rq_dl_server->runtime = 0;
 	}
 
 	p->se.exec_start = rq_clock_task(rq);
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 6bf097e39b4a..033f12ba7f2a 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -7026,7 +7026,7 @@ enqueue_task_fair(struct rq *rq, struct task_struct *p, int flags)
 	if (!rq_h_nr_queued && rq->cfs.h_nr_queued) {
 		/* Account for idle runtime */
 		if (!rq->nr_running)
-			dl_server_update_idle_time(rq, rq->curr);
+			dl_server_update_idle_time(rq, rq->curr, &rq->fair_server);
 		dl_server_start(&rq->fair_server);
 	}
 
diff --git a/kernel/sched/idle.c b/kernel/sched/idle.c
index 01e9612deefe..13a3d20d35e2 100644
--- a/kernel/sched/idle.c
+++ b/kernel/sched/idle.c
@@ -451,7 +451,7 @@ static void wakeup_preempt_idle(struct rq *rq, struct task_struct *p, int flags)
 
 static void put_prev_task_idle(struct rq *rq, struct task_struct *prev, struct task_struct *next)
 {
-	dl_server_update_idle_time(rq, prev);
+	dl_server_update_idle_time(rq, prev, &rq->fair_server);
 	scx_update_idle(rq, false, true);
 }
 
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index 35d7b328a9c7..1ac2fb398982 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -386,7 +386,8 @@ extern void dl_server_init(struct sched_dl_entity *dl_se, struct rq *rq,
 		    dl_server_pick_f pick_task);
 
 extern void dl_server_update_idle_time(struct rq *rq,
-		    struct task_struct *p);
+		    struct task_struct *p,
+		    struct sched_dl_entity *rq_dl_server);
 extern void fair_server_init(struct rq *rq);
 extern void __dl_server_attach_root(struct sched_dl_entity *dl_se, struct rq *rq);
 extern int dl_server_apply_params(struct sched_dl_entity *dl_se,
-- 
2.43.0

