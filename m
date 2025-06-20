Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2052.outbound.protection.outlook.com [40.107.236.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C81F2E975B
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 20:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750451573; cv=fail; b=FYMsUkkrHid+LFNdfVTfo11ZVF6km8gEpJclGASrwdiPGqpmHLZb7oOjlAX3QoRF/CXjveFLTnMUYFWHD73d4JiHW5KIR8TZr3YB/BR4gsKF55sHFRmsmn9vEPb/7wRhU4/csHGisEnJkQWPs5OOUZK0Z1FCywzfBhR6ArlaW24=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750451573; c=relaxed/simple;
	bh=1dVR8GPMurVAETb0fCg/m06hWKZW1ZXGPzlcOmsFOPk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GNi2d81SXyB6Qf3RPEl2Maxvk5lGGFzDp6L5heBEE9C45fBTWs6xSzArZegrSQ3qYiSmGuw7lfJoSJ0zFogmupvnpsyJID6ptx5ZmvIfglOS+KAYa5xZmuC+lRBgJjX+zvAI1oQgQEH9nYf/Ssa489RsVVGuGHiSC9kikgK7Xzg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=kjjtFGNw; arc=fail smtp.client-ip=40.107.236.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="kjjtFGNw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yOEQ3Xa3KVtyccdfmD4gGwaiZCpcuX1nYjI9V9OYfYynD0bE+r2yGDWOf90j0Y0/GkziqMgyR3KOOJ3vY/xVqo/g4UQ+LnhJzBWO1Q6dxF/AU271QnlwMH1cUORofAHmclMUEFpjTaWCnkKNG/zG84LoRY4bo2duZzswq0l4V+i1OCkSfNs5U+ZajbTt8H992VRlQZ6rL6ydxw9n9m9HM7LY8eDdwgMGkIBV25udt5q/MgiIyGBRzyDIwdWjlcblUJg7pYF/d5YWaIBIpvEG78+UQV74PfVaK001jlpRFg9CC8ggpA4viIDoLV2tA9BrBRJWUZUo2SzhUI3SkSV7zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZjtinnsoCTw3rArvATnLX+39QaSTMe1F66sNLfKUXGQ=;
 b=cGBu3mkZPvn3RI0OPBtVem+G6hyVeW3i7CjZo1lQxWhZi1vEJnPE1ylZF29w8x9miTv+50ZFbMZyF+wTAksSYfwFtK/PG58z/78pVjh9NGwQlOnCrVcgQ5wV7XjIyXrM7Iot2Q9XiREhK0+Cho/oxHpn7RkaDsOxPAEnwjnNbksUZkh5yrNe1vq78zpfHw4rSlDzG3wUqhPWPT/fUx6DyVEjoN1cyAGDYm700rBFdmv6mB+rYSmVRYc8m5UrgS93Hr/8RzH/gdIXL1MAiYu0dHiXKozcsbDdrkBMNzsrql5z15sUj8rQB8EJAIdRHgjzZG7ZsWrtFY/NIvKVop1RuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZjtinnsoCTw3rArvATnLX+39QaSTMe1F66sNLfKUXGQ=;
 b=kjjtFGNwyzJizsSPfHZueJIV2byikeOy9CinGHgEZ7B40rf/cApYCEvZRWMW2w4mbOsVYav2LA29LUxANIye00f+dufYjwjDalSP2RmYnn7zv1TYWNdbfGGFz+ELXUhSy1sKRLCDhpiBN00CpVryZtdHAvBL09+efgSRnlEB/KvgeGK/oBTBus8tUSqkg4hVbmR6xu5NLqBheZH+nTSlndkjESZhvv+rySfOkAa+SlMGzWVjmYdb45Dq7zXqnIbE74VbmRJhoKsK73Ya54wXKc+aQBEVMYU+ZnbNrf48daE0s5BYwyeN00OTFcHcYAycFT/NfeVUb8kmG+0NiHEHMQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by SN7PR12MB7273.namprd12.prod.outlook.com (2603:10b6:806:2ac::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.30; Fri, 20 Jun
 2025 20:32:46 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.8835.027; Fri, 20 Jun 2025
 20:32:46 +0000
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
Subject: [PATCH v5 02/14] sched/debug: Stop and start server based on if it was active
Date: Fri, 20 Jun 2025 16:32:17 -0400
Message-ID: <20250620203234.3349930-3-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250620203234.3349930-1-joelagnelf@nvidia.com>
References: <20250620203234.3349930-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN7PR02CA0019.namprd02.prod.outlook.com
 (2603:10b6:408:20::32) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|SN7PR12MB7273:EE_
X-MS-Office365-Filtering-Correlation-Id: 41301844-4a6d-4406-8c64-08ddb0399dce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|366016|376014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wtF7i8HMY1nn45BLehqqqeKEH6brvy0zS8loeY8lwoc6wZy8fLdZgJmOYbJO?=
 =?us-ascii?Q?+vuaBlCxY9XSVyJTizxd13uUoV9zXiFzNKgTUaMF6Gm2FRdzMDEE59TcsrKQ?=
 =?us-ascii?Q?q+sFurZtfFMsVwOOGO7E6hAzdCEG9vtWpEz0yssnnpRvtXYEKqKvYOV1LANj?=
 =?us-ascii?Q?IBkdytX0jGdVzvWp0NSXo5Y7wJmYc7ApQoKyWQq7gJwgWT5HoqQSDTyxeEuQ?=
 =?us-ascii?Q?yPkr/dLqFthx5K3p5s0H4f+/KC3QVXvayly8T75TR7Qc4sBtO9HHj0yOna5k?=
 =?us-ascii?Q?gITTlIO6X0KmS0LtPKrQFgW0sGyEofFcJzRiwHGiXaCqlk+PnlrgDUItI9sg?=
 =?us-ascii?Q?v2dsAJ6RhVMCE/Oi8eRpv7TG2fesnBZNsitWJ/dSNx7zB//gwoyfZzI/AEi7?=
 =?us-ascii?Q?Sj2rh1tA7+jfWaaUrheLfnmG4sv+soY9RcJiEkFuX1PLkg0k8GuI/n5PXTEU?=
 =?us-ascii?Q?s9160+q7qZSb77lVY9fh46TuuTz4EfkURWq3YMwPEDIlBup4yPS+wOn7hJXJ?=
 =?us-ascii?Q?mNK/YsiVSJ2xjdDVmwxyjNbPHzVJLL/hFtN9RsPArzNkDQAhx2PWLvYAAOFE?=
 =?us-ascii?Q?MDQyn+ja3u/ymkPwgdgavLHzD+BXhmZzuKAal8jemEOdU5SdWZpkRK1dMX92?=
 =?us-ascii?Q?K/cnp/G1JPwD4Pf2ud1vFe16JKdQb1whE3qoveUWDd1LCPMGgLciVmZuA6iC?=
 =?us-ascii?Q?h2xgplM5vbfYqsopgFhRc6mglL+I0tOEc/itTBwHlYfi2Hql6Mp8dl4B0vXm?=
 =?us-ascii?Q?ey2vbhGT2F+wwBNfwRVA60ElYCXEDW9x4cekyyA7LcsHm81U7OXhUaZqY4nP?=
 =?us-ascii?Q?DybBEQpaXfvSQFQiIR1I+oYs8ay2wjFUu1hA0OYhZFNNPjLlS0AOoRM/utAo?=
 =?us-ascii?Q?z93W1QEMy0ZLBE6iaB1ppCYt8mDRH/ndwqnBS03OO2Qgxm3H8EdryxkzLUBc?=
 =?us-ascii?Q?Y+RsKPF9rrI42F28llITl2seShGWGc4ew4nQdNJIh3tU1J9u9kM9JwNHCBkv?=
 =?us-ascii?Q?/mzWsiO/662ijkLBOqaNsAhtZHZwCrULM/sY1GQABEL9NlIbeEnm5RhuYzkb?=
 =?us-ascii?Q?zYZkSBQtI8InzqwSQNAo1MmtDt2gtktKxA7AsfHpamstePooGsDnQXpNr1br?=
 =?us-ascii?Q?RFlibNdGbqf1S4p9mZwdkjlyeGHaDvmxIe9A2Yu0OJobH7hCWj4+DFwlxqUr?=
 =?us-ascii?Q?j/LFh51wqcMSTLlTWTh1aOUKb1QOngBF7880cjOQV1RG16VrJmioAXuBYMXU?=
 =?us-ascii?Q?cl+A5lupSszgNl/WBlZY8AxsPptIW7rnNG/gcSGGDAD/d/er+7+10A9PXe3h?=
 =?us-ascii?Q?XLVlNIPgKRPvBV6McJIAFvavKhp/eaGOYlk/lRQsO1DGEwTK2S/FLw4I48Sx?=
 =?us-ascii?Q?cdhMsqyxwct0DDMo6RjFyikxSHxxDM5LwxJin1qhkBSXLuxt9V9kUlyvhKy0?=
 =?us-ascii?Q?8fAei9lFZILXV3cHxr1zGNqKWzWVHPZiaV8p3pqMgz8NYlZ45BLZ/Q=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB8059.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(376014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1/LgEFuHrvPUs/O0WbRCet5k8sQTEwZI79mlobcGPDsPEmMaG/AqZfJ7BOiX?=
 =?us-ascii?Q?EC4Cas2w9yURZkPtPyBOs0Evd2SLTPydoGrC7YM9kXpZcosj7QhhhI05cyUV?=
 =?us-ascii?Q?jfov+wa/WkGa93/ZXUbYBuXwBcbL1zvHMFuY8nEfqTmUEz0vM8PtdlAaz5qW?=
 =?us-ascii?Q?bp8b5KedYkOyMoHG8uNQlBdz8TT5568jhkf1DvU1P4acVrjdxYk3TRvkOOKv?=
 =?us-ascii?Q?P2ABnxgTc7VTdxLiNh9v/DDRVNmQlObC2CYqlZy02t9xvqppiOG/YsgBAleF?=
 =?us-ascii?Q?mBz5fBjh9hvDnksdsiGSZLC4b6ZEfOTxQ1BRtflvcZ87w2A+UaMKWRB1LpHW?=
 =?us-ascii?Q?jkBJRsPoP5UUEnYKf1Y80XeyjfDRm4pyhbxNVageXuRZZXXe5eF4t1dW3fiT?=
 =?us-ascii?Q?bhMz33hwfYMrdezbALUtuUc1ZeRk7V2B8/L9x9gGXxhf1/VB2+3M98yejfUw?=
 =?us-ascii?Q?/nJGPcTpxHUByC0k80YbsBJtttAotf7kBqXZUBQm9WEJSUBL0gzta04vzCIt?=
 =?us-ascii?Q?Cy7H0UV7+x6mcBLTDHS8eBjOOXTEMNVfNDUX90hMcALCjWhcJ77cJDfrWTJ1?=
 =?us-ascii?Q?4mgPKkYoNCoWWdecK7itWuArYJeXEVEzB/vbfQxUz68j2mL2rVQW/AwTKsUI?=
 =?us-ascii?Q?f8S4og6aVRktrJYIpONhz2jmLjOugtTeWKs4Gvq7dyhKGB+zg8NLGF0AzVcR?=
 =?us-ascii?Q?oD58YwKHihBWw+I4Uyg28RjqKiSUzSFF0Ns/6lcJXFrFuNslh3drq/baJ/iE?=
 =?us-ascii?Q?A/+HI22MiQh8W7edffHQSMqxaJ59eOGnrsC6jKEj42mAxVnaouthP4WXECEr?=
 =?us-ascii?Q?N+ilm8ieYSuIyUXGW4jLY19qpN5ChjtHXiJSWEpn/4ODshA4CU7pHmfey9eJ?=
 =?us-ascii?Q?gRwOkWu7ay5oEOFKw1sEor7dmS6tzr4Zg3LepgZLoupJIAiQvIPPhpzPSYlZ?=
 =?us-ascii?Q?2B/em5IrJTOcLd5IbtMht6UNjrzFR1JbJI9/Tud88Q5QG1W5bzYEu5CnorMe?=
 =?us-ascii?Q?U7oVA1DLgvbs5uAZOhJ/m+B4OzXuG1Go9LpK9ilAHYy45/OIQBO298LZQGWt?=
 =?us-ascii?Q?npUS+Ob2nPvMq3h0w2TNFFjU+Ob9XtQldqYzXZvpE6O2i6CZCa6zz317dHUz?=
 =?us-ascii?Q?xH+ebs4a/f6mBFnnT/rH6Fosb+RudBVHNesMrIK7y9THsTwDy87fX96qdixA?=
 =?us-ascii?Q?7xOq2CmGvLlCGg4RsbyhJsjNNm25KOVizVtkEqyfpmtkELziKmgJyPLPKvtt?=
 =?us-ascii?Q?oPhjFfiGhcRg8CcSB+eepffgFgevhFUTCbItGsnGECdMyruqjPVeu6uo5ACr?=
 =?us-ascii?Q?tct8ofapfLkaBmdhkIksj5InQ658Rj0GnMiYef9xdLDtUuciV9YHwUs9NwDI?=
 =?us-ascii?Q?pnDfVEnlqsqdcZNEVFr9W4YnjIGfImMeyKcZec+57fulv6ElO0pu6HxOkgCc?=
 =?us-ascii?Q?gZgGeR+H0EWEfq/3TmT+8pp5adgVIR7ajc0v+DIv18q4RouR2ACYosafWb0z?=
 =?us-ascii?Q?s4mNfhtPrtglFBtZznOBe4lcMwHWdPha5VURR/vjgvK74rb0vP+NkYVSynUA?=
 =?us-ascii?Q?zCQQ4a36SivAB8VZqIi1bGnG2e2FBDnFBnOyZQ5p?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41301844-4a6d-4406-8c64-08ddb0399dce
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2025 20:32:46.4487
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MzKaKXL+gaLx0SsWl0cMK1MJ8rZxoXnzrdORry5+Z0AXV/TUH23f3Pw3lLX45xmpkpqPA9iA8gWrae4ps5nxcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7273

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

