Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2081.outbound.protection.outlook.com [40.107.94.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D61F722A4E3
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 18:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748887299; cv=fail; b=s8Nn3AyKsA0ZCWbiS0HYDLast1MQ0dBp9iJJ9GZ74z4EYRcIL0u8z76CqfRtGDFUCe4LEPhzsXeR1yVMLNyuJF91iJDpPn0Ihe4IQ2a8XzzTHHhYYR5aRjxkFhBjGWUMso60XcWswomBKK9m41yBTZt147+3FGvOujwufHRHR0g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748887299; c=relaxed/simple;
	bh=egmMf54J/EQgfGdTOskQFSTYJF/feoPalUj0W06tuvE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=X/33TRriVr2jEtszyX6Y2xPipbCd5WQNiqTn6snjePwxz/yJJgEDzSxtjBNmWdoEq1QgsDUYKwg8uTir1VcTo6IXy0dmVHUCkIhsi8U+OfvPhlAxUoj55ibC5o1K5/XAbEhB9B6/GSLrCWTHJOXKfBcft6vLxePY/T+jrjp+FnA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=fsbm+vE+; arc=fail smtp.client-ip=40.107.94.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="fsbm+vE+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AIy4JdpQpRKFp37slIodFR383tgtOqNo5oMT07fjTMPDBEagzItWJpShAGGxC6sU2ZelomD2YHVhHC2qpyp+JNRmbnN/cFyDe5SeNG+49e2bBC5itxZS6L2pjgI1pyGmGQpoexLpzLFpihkdG4F/7BH9sQmKf39XfVaf+VwxQj1d++ihlhBwWm0pvJosEquE/1YyKH+nbsJdy7ccmcm7NcLwglU2l2gwuqCB4vE3nK0BLS3RFDYpmbLN5dq9KTrN/DQFswgWfHruwP7Qe2RyLfgtynxEzHGYQ4I5ZmnnzjQleDs+9u7l43QbFUkMeef9dkF6qScA/yj36gMUjX67Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dlnydhBq9UupCu5gCbGMU8x9D+QgCQVEyA3iHHy95Tg=;
 b=fykT/fwtVMicJaCLLDR97ygEXb8YfeGG+/iArFd7xHW4SkIvwJxN733BvkY/KgCJ7vh096rsgFF6I2XROqIkeX1yWIUzjS435gGdENBykE01zeJ4Dh0X2WuPKTKH0rIMLCbTgaQ+sWAsS7FSIi3iC7VO10v9j8rRN+Mq1iEIXAVl9mRmBWNN8PrFnd4I8JOlxKfv8PkWDSA1p2oSzWDAv7SwuOIIuxkd20BFApEAlSsZkgBwRzrPSta+qtheLNlIxseJGYV2P2jtVjGShUIk2i/3PbIDcHfyW7z4P6fL+Ef3pwQn4GTGG9R+qBwu8ZxF8+P0N2H/8uhw5rcJjBZgCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dlnydhBq9UupCu5gCbGMU8x9D+QgCQVEyA3iHHy95Tg=;
 b=fsbm+vE+1ru62AS4pp6opdMsCEGkmye7ZNajWRA6klBsHUYcB/8qrg+/dx45A012LqWU01U4PH3evs11GWp8SoZRENfl8rRTr0+xXbAQI0gxKo1nGUzeU78DdzkbKwdDqBstsHXNFb60zRj4xIbbDdTWu92XB8qedIQA6wOfNRh5du97j5FR144IUvTBJQYPlogSC3ZCNOvoW8kIM2BGfj+laXBsYe4SAQnbm+g2ur6YUnTPid6FzqxF/RA7mHHAQBlcjVbF9MeqXWt5ZAg/E+f+jYwipP4vutm2/WAFuNo64tiWMme5en/ksfFqg1gpg9Ta7237PspVcSXb2UGeaA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by MW3PR12MB4473.namprd12.prod.outlook.com (2603:10b6:303:56::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Mon, 2 Jun
 2025 18:01:34 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.8769.025; Mon, 2 Jun 2025
 18:01:34 +0000
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
Subject: [PATCH v2 05/10] sched/debug: Stop and start server based on if it was active
Date: Mon,  2 Jun 2025 14:01:01 -0400
Message-ID: <20250602180110.816225-6-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250602180110.816225-1-joelagnelf@nvidia.com>
References: <20250602180110.816225-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN1PR12CA0014.namprd12.prod.outlook.com
 (2603:10b6:408:e1::19) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|MW3PR12MB4473:EE_
X-MS-Office365-Filtering-Correlation-Id: 726404c6-3daf-4a88-0213-08dda1ff82f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?exba85Mty2IopcVyRw3FJXFx6VrB3H9dAgBDJvs7JNEf6RGeGYZ/YsVmQbK+?=
 =?us-ascii?Q?rD1ukqGD85tiC4vu1DriUV9jljo9sPIfX6aXgjIhErFMyaHbG82VRoVpUTET?=
 =?us-ascii?Q?PdhBE4oFTc37Ri0QNuuyLNc/fL41b2U4rVOimvZFnW5cr9s5xV2LVhJpIK0Y?=
 =?us-ascii?Q?cBxMJA53I3VjD15HZ/ae5VdxSeGiaYvRGc2ngWbO+XPXYEjuydNVzJUDHdqF?=
 =?us-ascii?Q?Oi2fbNGrDBpi9clru+5aNXSKMIDvNnLEJl8xtHsXAnTzKC9/KGfeXs4zt7xs?=
 =?us-ascii?Q?0ksqqTb6JqZrCu2OoguuJDcA0m6RkLOSmMHr00kr+xxsqI4nfzXdRDGKNN5E?=
 =?us-ascii?Q?RRftc6lKdz+0SiPhuT3fa+SaEd+hI62pGttWQiXKmwi/9vI34MaqF0c/fOFD?=
 =?us-ascii?Q?qdqoJR05s1Q+p0PhK5g8aasZvS3cu6FfKodcdDpT5IrM1jnI9uzrac5yXlBQ?=
 =?us-ascii?Q?CAP7IY9ws1Fvhs6sVty9ZR0ICkT+Op/u1f16jKed76ipMdMLt5KaNl+Yp8nl?=
 =?us-ascii?Q?eGJ/E4syrgeU7eSp+7L2RUQlDAdb4pfIoR48/IhURd3m+tTP5hJ4sbcKd6KR?=
 =?us-ascii?Q?3pSGlCUJJBoyzBdSYOHKVCAu1wK0RlJ+WpRD8rJu5BzO74RjnZiD07B/BLWk?=
 =?us-ascii?Q?HJzKAFhInXa073J3LMcPrvo2Ppr72yM8pwzIrfoQPYB4gue7ctO55YWDmZRH?=
 =?us-ascii?Q?Dl33uROCpkTjuRep29Rp48RnLDVT6fqbELHw9OcHVWbx83v96yxGGlH58OCz?=
 =?us-ascii?Q?SqOFSIBwtWHI9etGVSXdPDraQIEmE6k8IjkOiHzAm5csyScXRvJ9Z3ZAvZcx?=
 =?us-ascii?Q?OsZXaT2x5uiT/9NLoKmWc/EvIxZ+F9NRetfZwRYuMONBeulooxGcoXSqp9wj?=
 =?us-ascii?Q?8FAaV90DFINLH3T2ZfSo/GT7q9fLiB3wj7ppzkec0Yn/CwScq4rLJ3DURl1F?=
 =?us-ascii?Q?oqwRKyJIZMKyDYDsBevKwPOhORhsQr+Jkf9tR2m00p6i5+31p/iBLPy4fih9?=
 =?us-ascii?Q?CXMc++tTpvPB8XJb5cWyYmKiubslyp+OdTZNMkykdcf7yGBO/VMBzNCOvAFe?=
 =?us-ascii?Q?LYSTphmBpre3N7WpyYHnd+Kg8DvRLhXLJyOYSHM9TUItq/vOwJ+MO+G9ObPt?=
 =?us-ascii?Q?6AY7Xk2kca5BQzt5Ye/jGdWRdCJ6udQ4o0Efh1XRzJLr0S9qmK70dPav5QDb?=
 =?us-ascii?Q?r1znsOaAiawnNoBLHW0QI04IXOxUmHhAn/cYcraJm1ncTShhzLTZ2ggbeaiz?=
 =?us-ascii?Q?gl/J8EXAZBavfDAkTC/3AGB/VCVXyYHIPBzZbyt2FAtM/4AgAwkIhiwf27cs?=
 =?us-ascii?Q?j6px/n2njXaVLAVUTaz0ThU/Q24tOkqzS6+aQJcDXfdt1xus/prZl0+v7P7G?=
 =?us-ascii?Q?fHoGyywT/Om3GP5lMZm68Zxx+HrgJ98uR28fCHKpIBX5yII9zMYt9zTuPAIH?=
 =?us-ascii?Q?fxM8xSOHKf2JWstWzvN3+NPLl0vUb4wN4WM9s5hX7gLU+67iJ8kbkA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB8059.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PYi6PLR6tWNEZ0h++W85/4katQw2HliigdWC8sWFblrsx2zCFayhnMl5mphp?=
 =?us-ascii?Q?7VPjc04Q8fjhM01YVp8JevOoXD5lAlbXqvGTTyNJSAOGuKj3/v/lNa/e6wcX?=
 =?us-ascii?Q?UuS+2+Q9TvhQr16xvGYuZr4HV85TTbegexFWlttDAZGAIzrz3nXekxZsYkzn?=
 =?us-ascii?Q?4z5q7khpVifOk23WgfJl0R2Ykw+L16ol0pHISAjluu6g4/T4Y563Aj7A2BKv?=
 =?us-ascii?Q?MBT9//FRuXtPG8cx8E0yP7IFMnhCXExJdwjLahhSd8Y8iZudCdgWOfv68rxR?=
 =?us-ascii?Q?TnM8MieTgJ3sEJcKGfy+FzD9yfrXQ6HsUkMx+mPf95aIE7bLMLmuTEHjhVRs?=
 =?us-ascii?Q?/kn9QCt9Itj+Sme70Sd74ApseD4mfriljPIoleFCQwFMpCj4mno7q1Fo+5as?=
 =?us-ascii?Q?Gwqw5pYtvke5cggJPSpNLTbaEi5Y5FTYk2eqWzEn4ifMC1Zf0p0xuC0q6X/z?=
 =?us-ascii?Q?p9PsYaHDexpeXbESYwweJzmM9eQAre4pyfZzHO5G+LsuS5u4htR6p16pn1dd?=
 =?us-ascii?Q?DNlNUbRNxlD2d4eTxUZuiRKORnc1rw8ZKjhVhLNL7pUy8RZ/txTtA05YVy1F?=
 =?us-ascii?Q?3j7AFdWDP8o9hfwPcENwWsZPtO3XG2KlpUZ4ZsKeE8DcJdO47Jdl7Z9fLFDg?=
 =?us-ascii?Q?gWJ7rSZ8KC+igH/nSl7sd5Va48dhKpksp09Jr/RApw1YNbAwfJvplgCKZNqI?=
 =?us-ascii?Q?cqHmHt+/U6z/Yj8H3JagzzQGO+ta2HYUTt67/9jymtl+nYN5Diylz+r2/s0j?=
 =?us-ascii?Q?FjUKN0Buj1Vpe4JuMVd5Bm9SKCVWoQidPiQnACPAeglnqZoI9oXVGlOQksh1?=
 =?us-ascii?Q?/TtDfhKyK7JHUtnk96JkjmcDTOCXx0f6/tLQmNZwx+/8ITpO4J1Ek2NyMnMd?=
 =?us-ascii?Q?lnDCc7j9OsMQNGdTMKBFCXki5giFxVZJWbWtYw8fhovzqv+4Msn5IxPRiEcU?=
 =?us-ascii?Q?8UvkMuiy6YkIhxJk1L6u9fmhnZVv4MldKmGnQ8qmYkNszPSqs2lQJ3z2xuV/?=
 =?us-ascii?Q?dVhKZD1qSOYNMPjfe2PIuT2S++KmwPM193qS8gQwllGAulaTlFz9GjEM0V6d?=
 =?us-ascii?Q?5BYa8/Zc0uJM2GsJQ5sALi9qRVjoz3ggNnOoWtR5bDqPnUA9q8/v7Fe3Qprw?=
 =?us-ascii?Q?8e8MfG+ZbtVVlNncNfeyJUaSwhE1SSIBk+HPB+M3XkB5Zc9Xb14cCtPlwyox?=
 =?us-ascii?Q?TKQK1kAayNOXjgwiX75xg4bkn+Y10KL6DPKeqtbqQAICnJm/kDHFRhzFM6aj?=
 =?us-ascii?Q?deG0SZvbCWtTWAPeUHNa15XtJ0y03iEgRz8KS+gZDEWw/o6qELCEIX+3NVGm?=
 =?us-ascii?Q?SY7Fw1GwWPHkUWjDEXZ3lD/ycHSQIw53luR9nw11E3pwNSkWRGGhxwY43lUr?=
 =?us-ascii?Q?ZJc/rHNyQk0dKwnmI/Csays6je00hBNf+mB23hhzkw7A+uV61F4eMZ+9uWyn?=
 =?us-ascii?Q?GpkmNOvIhj/TiD+bwdsFSI/R7qQWCZyOSq1sEXXrJD2iTsvER6Y6qhvJRtPT?=
 =?us-ascii?Q?1ZaOlv+uYcS2eTDj1uhTlQjvTwjWsHM1sECvocDV+OyasdJGiygdE96kVIYo?=
 =?us-ascii?Q?HZRmGIasLcBx7pAwVgXgpDRf1e8u8hQ8YtR2Ikz8?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 726404c6-3daf-4a88-0213-08dda1ff82f0
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 18:01:34.3528
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yXsQNZQGufbsPJgtEiJSNF0eo/6fNR+Xne2axd2MUz3Q8d77Khk4zF4TnTMg2q67tWvkUyRWEt5u+2yEqJZriw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4473

Currently the DL server interface for applying parameters checkfs
CFS-internals to identify if the server is active. This is error-prone
and make it difficult when adding new servers in the future.

Fix it, by using dl_server_active() which is also used by the DL server
code to determine if the DL server was started.

Reviewed-by: Andrea Righi <arighi@nvidia.com>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 kernel/sched/debug.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/kernel/sched/debug.c b/kernel/sched/debug.c
index 77b5d4bebc59..6866f0a9e88c 100644
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

