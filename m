Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2081.outbound.protection.outlook.com [40.107.94.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 958D8227B9A
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 18:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748887294; cv=fail; b=eucNT9wSe0G/Tg8QBDIbi3etCVt+w1OOneBtkhao2Uy73Fw2v8kRdELqbU030S66mDY642woa0NwAjDg0T2otJtOSzQFd79umC89nifT+BtU5kbhSm7TYJtC5MIsuzPBd39nL7roC5o/ZiXAs92cD51T8nbGGF3m17qeUO6WyVo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748887294; c=relaxed/simple;
	bh=5JkYpCOz9tOGqjxAjOISA0FmpdYkUqwHrFRehGIwnjQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nIVo2bI/r11oW+eAW/hl6qPEW4IBgBe87wI/aRIFSKKDtg2JBVlKtPuBGx2D/3LhKFhZVuUmdVXcFrtG5+b0Zobh1Bnq9aECZxuDp1oYKL+KtyQYFZSahMLvD5qg6Cxhf9J6XWh6xR97LyaEAsiitwKhGzr2nVf2PMMJUJBe+yA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=CmVaW9WD; arc=fail smtp.client-ip=40.107.94.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="CmVaW9WD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mPZyQcwcYUhXkYhLBnSpgmIg5p6n/Tl3UgHQud2AmJ0krUgoZAwGl4Q4KutntoS6vHIUrAT4Q9KDFhDNnWUXgAwHAXtMmf59oHpGuvz2wUzKWgTh1lzbUAdJRfku65h7qvQUei5MPnmCAWIIclENpm3hNNjLn5mkgyvwLkcXyxGbu37DWdXN1oFhIrncNAAn8R7Jx1MBpBoLasG+H5Rbmdi0Fo6oh12/Ce7POKJP9+l+VC85cVZYyNlRTPYZ0CZHDr5fYaim5+SDLzqMKTLARStM/ZdHKoVwi3DwWmcyhFWFHmcePuZSKoSAlhXedLtHocuBqCZkmUSV+LG85xtIeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gBV+DFJmC6DCVsHxJtdh69BE/pmIonaQvPCYdPCjOzk=;
 b=T7QhKnVOYAsyVuZ+1yQ0mr+ESvhPc5230DXWd9olBrrTglTXp0vpmy+yj9Y0cIYm1jwMqDCtvvDwdF0yP7Tg1GLEcv6j44dAe228I/jiL0vvQFl8fvV/OaLSNnDgeZP8shNh8KKnm1oy5OgmfrDG2dM5w4+T3pyK6FzzoK0BVqB7c7ENOMe/2dtrXPRwyCBjDjK/zScz4DxynRktWh2TyB9MNJbprEs2lmxZ5VLJs6XVtCIknbQrWp5vwOgKSkOUAjsrEk3Vlln7pFQ+nEGwPmDQkeERj2uiXWWxpAeKinwGwMWjMiXRZx4kxR0My2HSh0N/4s/m5LzW+JmkejkgAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gBV+DFJmC6DCVsHxJtdh69BE/pmIonaQvPCYdPCjOzk=;
 b=CmVaW9WD4SXf+UM/6QqeRIpyKjWawaOxwoK+Q+oXcm5ORST5ChT5k4g7bGwpvQUrUjfa8MPeOsneZSOhKVzrnn6omKbiYA5SQAiP63rCMXth5Eak09TSNh7DTTnoIobgxWWEhJbSsoRqTvZY372964FvHO0zXxczEBJvLOy8Fzqg3QEZqFFl6rOtDTjMzT7EYaHmcWrTEcCE2qX65pRhh0cCIdmfh8Pa4cwEms4nhr1/Suzpoc4N9Je6WeajbenfkdBl017UeJSsOftlYhElB7S9nDqD+jyz2xbacLSPqFRMM+o3R6/a7p9i94g1Y7qLbGNgvz0EPfun72UT1woLzg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by MW3PR12MB4473.namprd12.prod.outlook.com (2603:10b6:303:56::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Mon, 2 Jun
 2025 18:01:28 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.8769.025; Mon, 2 Jun 2025
 18:01:28 +0000
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
Subject: [PATCH v2 02/10] sched: Add a server arg to dl_server_update_idle_time()
Date: Mon,  2 Jun 2025 14:00:58 -0400
Message-ID: <20250602180110.816225-3-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250602180110.816225-1-joelagnelf@nvidia.com>
References: <20250602180110.816225-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN9PR03CA0624.namprd03.prod.outlook.com
 (2603:10b6:408:106::29) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|MW3PR12MB4473:EE_
X-MS-Office365-Filtering-Correlation-Id: a5e2ad30-12db-41ab-852b-08dda1ff7ed3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?TXluwFO01oPGYD6EFTYzrjVN+3boEL5csAjk1zggke90N7W6Q2V22ROoxK73?=
 =?us-ascii?Q?c2bBIsEd/kh5cBslKHyXVINYE/ZKpUaeT4xpO/le6qq7C6W8U7HizRT5jVhb?=
 =?us-ascii?Q?VTn72Q+sNGuX1whdBJWRbHUPQOxr4ee4PLp96XyWcDOID9XOuba6WA1eUGBj?=
 =?us-ascii?Q?ojnaQA76/TLJeBFHDQxpYn+/QNDAnHhX983VoQ7VXqis8ydX0yfbG5Z6T4Xc?=
 =?us-ascii?Q?1XjqYrLWARaIVFC0F3LLuv9TKXe2NXjzZCqYZ4jEeRpZLsTGW1sjm1IHY1jY?=
 =?us-ascii?Q?prJGI8j9zq64Mo8tDaY7Cq8N7vg5dNpO4dT1ZdJsKNBcAYJFMtYe5cpd/4Qm?=
 =?us-ascii?Q?LVVE9uiFxhPWdn+mVZWdbEc11UelHn9ZwcuurXLb+cIbYqyT9nQLKDvlhzAy?=
 =?us-ascii?Q?1oEqPCYfPZowVx5bi6Odg+e1NDDcx3H3vNIg5j1QEUX19vPAI3FT0BO4gZbp?=
 =?us-ascii?Q?s1lWcvPvtsLPvxOt/9CO0yThobHPdBiZMjxk7oG3xq+VXzpdK6S2bFu06HI4?=
 =?us-ascii?Q?MZnQ7Lh8HduLwRuJQyM3YgOPadB2XXAFg6P4rUicN43ZE8lgSX7/Y6EXf19m?=
 =?us-ascii?Q?xyT0bbSxmT7clUJa8XZVk+2tndxE6hc5+a5OINXDtqaHMRgeieW6Khl2FwVe?=
 =?us-ascii?Q?p1HrUk64Gwj96kYycIhp9pD8IojMpIcYdAyexOl8Gyc1scis+f/SOy5B8FxP?=
 =?us-ascii?Q?5aiPVOUkjWeTe82bs9w0Dj5TZp0jSfg+1zKrd6bEbhNpgQLabbAPHoIi+BNx?=
 =?us-ascii?Q?l6sy9f5evegp0YDZqvhYot+6BnA+JHIg6i2egOVatw3n2szavAN5IjbBGiWG?=
 =?us-ascii?Q?zjDfSCJbiKW0hh38ka/l8lZxB7YjXEzIzWO3ydyrzHwrn51LVZpGISssdYRu?=
 =?us-ascii?Q?8HbTjVP8shO3PgKLHx2Mc1f5aAdNNpeoKT9UoLQpEp9NbDMyfRd3FvL3io4d?=
 =?us-ascii?Q?GTM40sQQbSPhqI0Ijh9UQ0GWeG2qiHuhuwHBKHLxwVFikfw6GDCtTqRXFW86?=
 =?us-ascii?Q?Ak2+E80/oXdez8Q0pldTPJGFAqHcqCayowf1Rrzjvv8jWmNfw4+CIJXAXr71?=
 =?us-ascii?Q?KCQdSSIf1sBUa0DIAXwI/uraLwj8BveCIE7C21mpuzR62h5qBJrA3ef1sKGe?=
 =?us-ascii?Q?K1R2ilt9MweJAUebgNT0YuFVN7OrI6a3QGFIVnmGty3Bt265764zJ4IWW3f7?=
 =?us-ascii?Q?dlW/iIqjXwaskDq1RUWARWxxg/yBuZKvLZMQNl0in6GAAJbns26K77hXiaHg?=
 =?us-ascii?Q?Ob8JTkSw0395vczIUx/9NnzCOUwfUDmuMpT74pY7Vw5Z/26dsKZi4/ulqref?=
 =?us-ascii?Q?tQHkednjbZYngyaowrrcumNP3eFoQVbDVEqefu4hCF4cFy2lPD+1zh9xIRmE?=
 =?us-ascii?Q?4D8l/WZJSHd6mcaqdBQBIaxQWq9clMb/RdLse8ECpjSg62Hg7OCzkRRUKoQf?=
 =?us-ascii?Q?4b3ndYh8CU25xUeWqbO8JjgChpPUwXALDG0E0xbfILuu5Sw+DVXmog=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB8059.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yBGdsK0Ys8G/J/MLYw7BVx6gk3oF3x95ShDqYAgtSQL68aWhKpoUvx5lPD2F?=
 =?us-ascii?Q?TCTHsVKq5JG5YydmKBtG5xZbn24F8p0MJEeFfDZzZscjiU9jZ8/RdafvIVcs?=
 =?us-ascii?Q?0JlXrhg5pbEDTwXRw5LTaImg99zeROdWsLGvc4hkHnsaEYET1vmfrSABdFuo?=
 =?us-ascii?Q?iphpnXHkBdFBCs7jvpTnBOhyjHBfa4CwOS7mHcBBRl4/5F/YLNF/6jWGPBuH?=
 =?us-ascii?Q?GWLNHECw4nlZHLlWAnzsEuKZ4CzZbsJcmB7d2Xzadwtzn8SRVKzvhoThvUMm?=
 =?us-ascii?Q?gVzmclnmvt7+7k39CfPXUk6TIE1ZdM8D74RallrNDjFtr6l9ESv1qJyHmQms?=
 =?us-ascii?Q?WFH81A3AKZbvZmrLffAJIIYdyvKgd8ZL7Cu6pJfRY62VAEHcieX3KjFDK3e2?=
 =?us-ascii?Q?lfO4DjQN2nzx9HUZfaY6HTT4XxV81e4Hb0maMf0p7Jx7XdhZV2fZ7N718A20?=
 =?us-ascii?Q?N7Umq/1d/UIxqJ0Uv1FzoaNTtrsbxwEGm2+HdZFB8UDNBJdJ+ZQYTonqYe7K?=
 =?us-ascii?Q?tymopqzm+bkC/w24dgAZibaHSKCcfx9z/QytDfNd+MgCLVNFeBgXVqsbDvj+?=
 =?us-ascii?Q?659r4taf7KMGhrKdYdGENVdPCoBt4oF9CxLFYI3VUYimnCadjdnnIicUplAd?=
 =?us-ascii?Q?LuwN1e0PrsrEpYEV2cDXIPfsDQocDmUHlPoh/dFgb8QGoctA+b42EHcxUhxL?=
 =?us-ascii?Q?TRGpaTmYOVIBqyHcR5sSF1gTxlcDT+AUrs+ycaG1s6L8DLPXW3756QqR0RpO?=
 =?us-ascii?Q?vM6V/2EtDtrRr+a0i52BUjeD5TolKuaDh1PiVX1AueZT23NGIeTlDHTa/Ypr?=
 =?us-ascii?Q?sM6cFruyKejZTU9dR9EjQKrb4tHj6Zx6kKaKvwRfn1r7QtnfJls39hw+Pmgv?=
 =?us-ascii?Q?H1PKl+HEQZxutUCV4j9MANR1SbtIoZZEKsu/yWHb6hIwOyoMYVqNRZgt45R5?=
 =?us-ascii?Q?78yImor2qWcSeZ/DYABv61Va54qZjpoO18yepqKKd+RBK2wyLWzVAvsmyw8p?=
 =?us-ascii?Q?CgaHq8deuuEeRX6MlTZ/5XskJJcm8XzsQ9K0xLKjFIpxcPDcCD8CnaWIkWUW?=
 =?us-ascii?Q?C9F/mKfnYu/8YuSQSikZ9D1C/wSxF1BFN95mbn0oEWBvCWDkCyyoedFdmScG?=
 =?us-ascii?Q?8rEyHVL3/YV/BIftRJkjvrEdulMC3gzCUPlF2r9X2zRHJJdPlSoqX2nEe3t0?=
 =?us-ascii?Q?bxlWzXqtzCITkdCLrr3BUThurfsY1rGAkAtYBQbMzrSAeKy8y1fMDSco8rNO?=
 =?us-ascii?Q?JDZ5yaxAJ15IO88s4Ncz11L8fVgJZe7CE2Afcc0Ix4E6Y2tkPNkItibFD1Iv?=
 =?us-ascii?Q?IEv7S8ZDuoYYlP1RcgksiJSvGruAksHw1CuQ6XeulZB6UZVvvsoIQ6fVxcjM?=
 =?us-ascii?Q?4HwleiOX52Fdkzu4ROPDWsIa7ZKZXDVkvnpzRkBFy5Gu9lJMOV8+xVhFJZdo?=
 =?us-ascii?Q?ed5d+d2HI7nxQgtNJNmobNliaFz1sdpszZtZakviYgow587nps6cmi0kh8DB?=
 =?us-ascii?Q?M9Oknq1dpA2m76FJ+WN4WmeCsmEDbxTLeXiweirGAwstaUBviy2FQL588A3z?=
 =?us-ascii?Q?e4Z5dxzNSPH9pmnnftJX8qGZG058eCr5oInsEGvN?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5e2ad30-12db-41ab-852b-08dda1ff7ed3
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 18:01:27.4173
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c2QqDUgq6RA2gza/b+epwd+stxUcT2HpSYHbcHJ0m5dPHQP6FpolmKvgHMPeoEm+paAwtM5S6EGEf33DQGVNbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4473

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
index fce08e232926..3181384881b8 100644
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
index 2b7958d2fb06..6fd4100fd5db 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -7016,7 +7016,7 @@ enqueue_task_fair(struct rq *rq, struct task_struct *p, int flags)
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
index b4b9c98f0c6d..467e39205ebf 100644
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

