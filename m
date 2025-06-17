Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2064.outbound.protection.outlook.com [40.107.223.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCFF42EBBAF
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 20:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750190772; cv=fail; b=e9gTA/T/p1hNI8g+2jrWGM0DiMiI8mdTOpVk/DfZv9Rqkvie3XC2kNU/8XmL9cH/xA14F4b+qrhOwXMpvgc741RqYy4x41r39w//mmluB6Ix7YHLlL0r3BRPNZq6RSNYUhsAMK7uZEgMeLJV6hDyXfF+OTiSfLOFcr1UirEgmws=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750190772; c=relaxed/simple;
	bh=1dVR8GPMurVAETb0fCg/m06hWKZW1ZXGPzlcOmsFOPk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=o1eQaNNyrwk7Mowfvw1G19kLs0uY9l8w35uzms3rRHvHR7wOVwsV0EkTz2cGWysFeow7S5yEQ19pJMbDGoXRjRc5Ztq7wZf5EED84ef6+4UrMYEu4fACq5nI3ZEem1OzYiPSHl1uzSdfAv65cuX0fBoaRshdxVm+viuygBbkbVs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=kxFOtPrg; arc=fail smtp.client-ip=40.107.223.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="kxFOtPrg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Row17oSrCuCNCDkBwpWUjoHnRGCji3wOLexjcAJo50XseJ6yNc5T4X8fHMDWSLfF0A9mDb/BXEOtENtE9lQrW0IKghg8tn4omVh0pUYv6xwVwq3tEQAinD/M9IMbB0PsTMWb6/WaRtONW3FtbBO89cxAFE53t6OAXgUEwdKdgZ4bXd43yTgxVdartAl0Ty9ZXqnqysLFx/Zhs9ntDpFO3vSiFFEREhXKQ04O9Jx34PuGK7Au3HUIlWXvkH7GHHYvTHcRKsx/fwJnYCMCv73OojdQpmaAeJ3aVgXwS48MAS287CnA/tzRWk3IgArrw3ncRvqHJuDSrkVbEO5uJAB0sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZjtinnsoCTw3rArvATnLX+39QaSTMe1F66sNLfKUXGQ=;
 b=ZHih3S7bAj7iYkvY43892Bt4Zvaai2ZEU2fbTJCBm2QNwd/MhynMZO0jKIHsIE6cHr+5IwsXZQKLnjzFTuj+HjF+n8q/5/Gnc6Va5PtcNMoGlMGMHBpTFFO8cPGewPv+0mVT0ZaiGFAx21DSgVYKOmGl3WtQ2JpBm0QyWYAwX7Kt0lBrowv4+PkJgp6wEoZR9ryvh90B+31Qeb9U8idUn+XaL3Amv+mKigzM9q9+rEhxNWNYLfv/RDbnJbtvCpSCe3kJP+gYjXcJcxS5j2gaVEV+zjtLt8u1dSTTQUUVWAWsQmaPesKB8YcpKO71g6e5bpHElfXEW2Mo5/c4bnzncw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZjtinnsoCTw3rArvATnLX+39QaSTMe1F66sNLfKUXGQ=;
 b=kxFOtPrg2173rqdm7XjDwoKviPNfuq5kOR1lL0EZoTlrVyi5lBHQyOjJ+wII/3l1Wm5o0Xli3VWf+Bi1fN4g0OPueMrhuNIF90toQCvQhbq542Jt8IBGa9kTkMJMohLt4wU9NtjtUUBNzr9v3KamPLRTJwJHeliqHXU5Bd7LcFaj1bdKODInX7sqdfhDWZTqUVu47Aigsp/uXkpEMUOOGb9dcaILzJSnL9X0TN4a6Y87cO4ynXViXbZKsCNj9yK+F6CsvMd7ORUXZHSEElSEisDEaNFzBVxcVHhCmX1YD0hLe4hfIhX6/RVa2nv3uuQFuJ3rQKezMl0OoHBILWPS+Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by BL1PR12MB5731.namprd12.prod.outlook.com (2603:10b6:208:386::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.30; Tue, 17 Jun
 2025 20:06:08 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.8835.027; Tue, 17 Jun 2025
 20:06:08 +0000
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
Subject: [PATCH v4 02/15] sched/debug: Stop and start server based on if it was active
Date: Tue, 17 Jun 2025 16:05:05 -0400
Message-ID: <20250617200523.1261231-3-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250617200523.1261231-1-joelagnelf@nvidia.com>
References: <20250617200523.1261231-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: IA4P220CA0010.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:208:558::15) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|BL1PR12MB5731:EE_
X-MS-Office365-Filtering-Correlation-Id: cf26808d-249a-49b3-c360-08ddadda65f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|7416014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?R85sLeq3HFCREutYRKz6R8ulQ83o8hQ6ezQq3zMN35i/Tkabh7Iq80C2epm7?=
 =?us-ascii?Q?0pUnLCpoKvD0mJyiJzSJoutd9Nm28wkt+U1mlxGPWwItneOq1iJXGiJ9xXdM?=
 =?us-ascii?Q?nHmyDdpwGx0ngbQiuPx7t9etKYZ6xGXeqXUwfQXTEyXCusnywFPUTOdmJAsG?=
 =?us-ascii?Q?HI0Y7JSc/b3pN/zAhndisGf0TwKBa5C0WYxWC/8q7+JOeJOY0P8MfX7KCQmy?=
 =?us-ascii?Q?C5AUB+QEg0G7u1sfLqzvdsL2AJ48J3dpLlRYh9s94Sz3lvfqub/9/c5sRkJl?=
 =?us-ascii?Q?bVjpRVy6Y9QaxSnBbNZ0fzufaWTcSIRSkMTUDRBmPt/xj04B1oOTjbgervUy?=
 =?us-ascii?Q?pbkX+DcWtFFb/9anjw1wvhGzN2p4tM7z4waPIp0fcU1k7CGgtrAOEgiIa7G5?=
 =?us-ascii?Q?VNZ5AufLABEOuyRYd0S/0u0MIa0n75P/fQ6zBRgBJf8OuLH89H+pS3dD8VmA?=
 =?us-ascii?Q?9yeh+GDWpczZmTjl2lfVEAU35gsVaa1JuAD4QJRjoQ4BDs2iUIE1RbehdqQG?=
 =?us-ascii?Q?uHl1WoOnwHUu41mkAJAR8jAFc/qxSBSswsC7BIS44lXw5Adv6SynoJWnJaIO?=
 =?us-ascii?Q?RM5F9wQ/HXTAWqDusn1Y8n0VeMwBepJagWp2HV/7TxyNYCPu8KuIqxEKj+Gd?=
 =?us-ascii?Q?1tmUu8EUYfjphHRLAyAH76C8WLey6+6IrBZkU1MUwqDTcxGqSmQWaKz9huKw?=
 =?us-ascii?Q?E9/lekQfbplXwBjM7hycZLhvL7VVdcbv519ICaXLg9lpiCVzqPdLywBXphO+?=
 =?us-ascii?Q?xGLvWrALV/rEKmfSKzs+iO+jjLqlhY/iHCbnkhVZ8pdStvmABEvoqHP2duXv?=
 =?us-ascii?Q?F1kQ+GdfrGvfxb98A4In4CkC4L3kw7zrF5W01oInjHP0pMqqzdVMM8Pa08Ra?=
 =?us-ascii?Q?ixMGNX5QhyIZaJ7cHstrRV4WZLkxwn/Npp6SdnyfRYjWrFnSLdPNuytJGdk4?=
 =?us-ascii?Q?04EWUBVqenz2KZBj5dbdSSR7gufLn9OpJxT+SCJXfwJWBENEOXZfR2CbHVIg?=
 =?us-ascii?Q?YRbsaUmFyD95oLZArqO7Z7OPPpi+2xgmA4eShbig4EAQA5qK2zKNKZSVFcHi?=
 =?us-ascii?Q?5/4hnGmDvKxMT/tl/JoZC7D4XEv0qeyOXgVDfrcyXNdWu1/dnZewgdSYFONJ?=
 =?us-ascii?Q?9PzEPqTYAgCMKQTSpFuw+RDjimssA3WDlvIeW0ioEEA5HhORPic0A33eLxE2?=
 =?us-ascii?Q?1sLLzRtqAWG23Eqe7cGIyqzXrCqiQKrznn99P2HogNrnBRBWplnlsujvL2H9?=
 =?us-ascii?Q?AtwpDcEVW74cJ021Cs84GdR6fEKx1kzEAadCExh09yukOlB7GgFuHju37eH5?=
 =?us-ascii?Q?Bf9zG/q74nvauX4YM1Z4TcwzAXe6uzHnWiAInPK3U1CFEjSbcEqP54NOkyIc?=
 =?us-ascii?Q?WDqttzQBIErzW+XdIQX01PczKYoLBuqye4Oy2jVwAI09jaEj5at8BvFxl7zV?=
 =?us-ascii?Q?KzcCzVmCEZ1nd/azEpQ8+h+GVp/4596Z6odP7Em6s0w9HfKzaoOL0w=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB8059.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7416014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ouIZI4onK35zB4vbNzanA+ol4vM/0qjxZlgs1sTZgJJpDs31LSRBJXx/VY2Q?=
 =?us-ascii?Q?/O4HcWUzXZHBgpHP0LmVQ+EkF1xEdxFT0Wq3q4aP8gNeRaBTH41aiScQjVgZ?=
 =?us-ascii?Q?Bb4fidvN6XhFWwtXb5L7nJhOeCvpshG32nG7lnkBjzTX6wdUIkz0ewS0qlgI?=
 =?us-ascii?Q?4GD/ks08hRDaaRlaslSfargcVb7q+FQucZev4HaXkHiCt+04/GrfS1iYm9Z9?=
 =?us-ascii?Q?9D3nMSlSxsHJAbu6rpS88F2Yt72JNWuqo/1fKt/TtEVNbCdc/ebX6TpAKJlN?=
 =?us-ascii?Q?O3mk768NayFCvApbJm+ElQdOJa2Z9l4SBnjb0CKVEqLgJymcyUSkcV6I2YRs?=
 =?us-ascii?Q?ARgcRBXcEQhlF3+4hn1j7mB9V0rP836FfI9YPjt204rmZnv9SStgLkLU6Wqz?=
 =?us-ascii?Q?aVyj7cMFJLN6l7pqv1u35h8pLpS3BvyWDFZ+UBDq6YpuhjO0/pDfCNbDKlmZ?=
 =?us-ascii?Q?ytkPzkA4Jb3BhifNivrhr+n6f23VOW/7H6LiGpTP7IwbF/63fyVqmhQuTDBg?=
 =?us-ascii?Q?CM+alWFLmA98Ys+v1tc2sWBjXqXfqwKz88NMYHJeN/3XW0vecHCgMotfq8w7?=
 =?us-ascii?Q?Kn/qbiLoaPjNt0qdNGVqwiO2LsLi/Nh8NasNAodlG1IwGsAP0WZKMzy1nAE7?=
 =?us-ascii?Q?/iFwxLWMV4Woxzo1fnBFEjS/wZoWBa0m4e0lYKWVi74JddflFyGVeoU1xxU9?=
 =?us-ascii?Q?Np+tsGBZETAPU+68iiEzd3biJ8X9CpFkBT9LGPz8v3IMPIPYaAoAuuvRhmV+?=
 =?us-ascii?Q?99SudtvtMcA6UP5GJZR7mUbDyj9V/rBQNhnWhrIZo/9oLATD0j01BymDtC+t?=
 =?us-ascii?Q?Ixv4SPdjo+7+vfzYowvNxsa8Y9a+YzwJIdWiK5wTkvOfnwyiiFvbrogVS9KG?=
 =?us-ascii?Q?h3bgR/oeFbJXl1QyVcRD1hBigzSX0Ak+Iql88XRl/tUrLoCDr8TbyX200FSC?=
 =?us-ascii?Q?ML4wonVDKr34GUJ8w4MGH/OfVhUWVDtGgL2pYvwjPHHTj18joVXdu/om0Gkm?=
 =?us-ascii?Q?HCFaJXA9Q2w6hQGVMaZ5HPJGKNSmbjTilJgvDjLHRTmPixGEZLwdvo+Ck5Zx?=
 =?us-ascii?Q?6cYLVSTjc+4t9Dq4jQN3Wfk6Y+LQK1k4Q2oZfO7ndW9VlMUL63lutC2N2Hc5?=
 =?us-ascii?Q?tbSIgOm84Fyb0nhKSv/xLu4J2ZLc3Gfcsf3V28SdlrL3Yl457L7FI3lDzM5O?=
 =?us-ascii?Q?rcWPW1RHHx6vgonCOBP0SWMb07+3V6pNuTNM3cF7/IZyuMCHKQCe+Asbh7XV?=
 =?us-ascii?Q?LJm7TO1IjT4dp0Jj3fAF4dVESIt5t9Z6jntO+i/q02G0pju/EfS+nP5LX2mY?=
 =?us-ascii?Q?I18jGD5hY7rgiGgKeF+QDcYV/9BRiVNju4+ZWJldLxNJ87WOOsveLZuBSqy/?=
 =?us-ascii?Q?3dUUQLstGDwRE3XN7bnOj0Hel4hW8wC4t+9je3EkK4fo86cOlAv7hyNIUxze?=
 =?us-ascii?Q?dTZLUraJXntmBxNnjH/XCSuRoWkyigrriXKLW6pdYmGid5inUKE6nmc710q5?=
 =?us-ascii?Q?iBJFTd/IBLITd+zbOj0oWP32wrXoh26AzN9H9Bm6B9V6gF7UxXlNeCbvIxcM?=
 =?us-ascii?Q?33/lN3ZOY9ufsOzD2xNVY1I1ze8UhgOOU4gGLjih?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf26808d-249a-49b3-c360-08ddadda65f6
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 20:06:08.3020
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vz+/F+bti+lwLImkARmMsK7LNyCfvYFU9V8157E/R08xJckyDKBnVHl6DAp/cc/Zyif7F+AlQs8SSgle1K8kXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5731

Currently the DL server interface for applying parameters checks
CFS-internals to identify if the server is active. This is error-prone
and makes it difficult when adding new servers in the future.

Fix it, by using dl_server_active() which is also used by the DL server
code to determine if the DL server was started.

Reviewed-by: Andrea Righi <arighi@nvidia.com>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 kernel/sched/debug.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/kernel/sched/debug.c b/kernel/sched/debug.c
index 9db3fcb4bc8b..276d51a5690a 100644
--- a/kernel/sched/debug.c
+++ b/kernel/sched/debug.c
@@ -349,6 +349,7 @@ static ssize_t sched_fair_server_write(struct file *filp, const char __user *ubu
 {
 	long cpu = (long) ((struct seq_file *) filp->private_data)->private;
 	struct rq *rq = cpu_rq(cpu);
+	bool was_active = false;
 	u64 runtime, period;
 	int retval = 0;
 	size_t err;
@@ -381,7 +382,8 @@ static ssize_t sched_fair_server_write(struct file *filp, const char __user *ubu
 			return  -EINVAL;
 		}
 
-		if (rq->cfs.h_nr_queued) {
+		if (dl_server_active(&rq->fair_server)) {
+			was_active = true;
 			update_rq_clock(rq);
 			dl_server_stop(&rq->fair_server);
 		}
@@ -392,7 +394,7 @@ static ssize_t sched_fair_server_write(struct file *filp, const char __user *ubu
 			printk_deferred("Fair server disabled in CPU %d, system may crash due to starvation.\n",
 					cpu_of(rq));
 
-		if (rq->cfs.h_nr_queued)
+		if (was_active)
 			dl_server_start(&rq->fair_server);
 
 		if (retval < 0)
-- 
2.43.0

