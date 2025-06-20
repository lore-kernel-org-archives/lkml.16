Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2052.outbound.protection.outlook.com [40.107.236.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AE7D22DA06
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 20:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750451571; cv=fail; b=IoWyh8O79CA1ZGBypJoXkDG/QHMVSQHMzo0P/vkpGDIzymGfZC3TUWRVkHTLuKqGSGGIAy2KNmlVyVoAqY19AjfLGdEFEhtWfdyXJ8sdxu7BAdpbw55x8Yw7FffW2wNCNdD/0K4xhMCdvJavGrD6bknVXy7P2AA4+4ueGTUKK8g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750451571; c=relaxed/simple;
	bh=71Y2v1RwclRZXgycxLb/DtgjSEtzj+k7p11JV2DA/qs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GkTSLHPo2eR4pNDdbwgjd57fsutRhPJZ4ydWe6+jGQOImQ/DFs5fM3NXZNWW4H3Ed9QDrVLI8C8jQ3ihhP2sMhPB/eC8udPJARhY0dVQedo0TbYcPGyjI9DOimv418YWgJTYLdDaD2J1SSxQDb4TjCOXr+Edhq6+G3pbgvzlAhE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=BSEQAgZ8; arc=fail smtp.client-ip=40.107.236.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="BSEQAgZ8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JKWwInJMEa16CBrdCy8jIcU9jGac/HuFEDh1yy45F7ga2lbjtYXHWWPLt56CLkKpg4kv0Y5YbPLT1qFCWs9NA4FlkwY1com+15AgBQKLAfxTTrH+J4RWRx3jTqT/R3ZVa1galZhWIO3ol3MPipcScTva7pEbFaJSMc+sAbtN3kC2vRlNPCZN8CpO+1IYUYaD9/7oTOTlyACyZpECkTynnb35RTiHLpuFWdGfrb/zJSWmupKuRdD1YBtx3sTWt5mqbzuAX9y1IhSqH+WtrpKtRIVptvponpoId0EYuba7usmZ1Ve4/sIv3rB9wXBFJ6CTa4Hjs98lUI70agolG5XU7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hVYXXQ0mOalwdXZYENQE5dSrqd5z/3kvvDysFrqR09g=;
 b=GXdhUq1uoifawZuo3T8kflohQJYdjvGAR+bGkvdixTzAsQbjTqH6fgjQUcNfVRLSbFdCY6RkcoCTe+gdpC7uo3FjQyr+QygoMNJ7WWDxPVPxvttPfuMpmuLXaj1u2z5gsnxqhBkvD2pt7BZA2P6wmDckpUISMjUFDguFNQ28WsIZ3Hz2gngFUR9Dr7t8l1ooQpv+C6THH9yi22iNKrVXa/PwZuAiGGFS1i6Cfi64vR/3QtxfiUkRweNEXQceCRYdKDYDNXyfhxqnGcLY0k/iHMS3XTUTCiABnPNy/AAAQ9gZQeSpvPqp2GbZ2mc0iJ7brF59NAr35HR+tfI4HtZWaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hVYXXQ0mOalwdXZYENQE5dSrqd5z/3kvvDysFrqR09g=;
 b=BSEQAgZ86MhnKLY6LyHyo1CqU7idBeTUm5GWxCn27q5edthD7H7e1+Kkd2NuvnbYIGcVzpq4mIRumf8fOjdO4nZYeINgXKf++fek0oSoWV02rBxrTfAfZziP7vqHeiSp0ir2XEAK/ttVQGVqXbHxrUApLR1j7geGn1nPO1xsNZeBB9PWG/fnCPiwCPSDyIdfXUOnqqoNe+PvJl0OmkQj4RVll8At4fZ5O+qe1zgC0/j3IxH9BzM8eNRFPPCF37y265j/LmKolKZy8q0QkTMVxK2S84l+bO1V9H3d8CLDKj9zvjVLYnDBuMwUDqHpEbMpq4Sp7wYJjsfsLTI/Vzs1tQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by SN7PR12MB7273.namprd12.prod.outlook.com (2603:10b6:806:2ac::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.30; Fri, 20 Jun
 2025 20:32:44 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.8835.027; Fri, 20 Jun 2025
 20:32:44 +0000
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
Subject: [PATCH v5 01/14] sched/debug: Fix updating of ppos on server write ops
Date: Fri, 20 Jun 2025 16:32:16 -0400
Message-ID: <20250620203234.3349930-2-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250620203234.3349930-1-joelagnelf@nvidia.com>
References: <20250620203234.3349930-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN9PR03CA0389.namprd03.prod.outlook.com
 (2603:10b6:408:f7::34) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|SN7PR12MB7273:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f5d2b86-465c-44a5-f597-08ddb0399cc9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|1800799024|366016|376014|921020;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?kLmrsLzCgT9JS7Wk2Z1Qe1RG4wpgaQZxnabk6iSpA8nGtaeizp6agRLncgqO?=
 =?us-ascii?Q?s6swR6CS0RXvn9t0j8hnWm0HsSXaKrVd1W/mvqtwLP/VvoIJreh0Yso8hNt0?=
 =?us-ascii?Q?lg5+9NjxknmiVftfRo469tINWGYj6J7khHpxJJc8v0uOGsjen3hWhp6puLv4?=
 =?us-ascii?Q?etNYJERo9v4dc7jQL2HVG5A+Z+POrAN9LX/g46Et4LGg0EIAHcbWGdbzwEaZ?=
 =?us-ascii?Q?AorAFAFOQu+2wMGYzAW5iiEJi1P/648i988Z+juzZUZy54YtdDXuqj3b+6zq?=
 =?us-ascii?Q?iNrePhzHHE6xoqXJ+FVbs94gkg6XEpNYRA9SZeqMtaAzNLtktMHurSuLNc79?=
 =?us-ascii?Q?1r/S2mC/U6dNjWqSeqWlCEc65Fhyrean8pCTrIvpvBvksm/nCKA4gJPGcPZS?=
 =?us-ascii?Q?EJw8NMEoPpEs8nFEVYU4c0N5JHKTEEIfmOnmKnmMmwOsHOOCCXmY7dHFzl4q?=
 =?us-ascii?Q?cMxIxYxuCDhorhFkrbwpwJ5rlehkNhLiqWWnez6WZTkOQOQUorxUgM1JIPQj?=
 =?us-ascii?Q?YumfojmvzzW1TEcs8VTj8yar9//h6avMntYOM2PphBvwcKBZcvLOY+Famcdf?=
 =?us-ascii?Q?aFiMm78tlOEKhrvPl/xh0Y/Ol1Y1pET46TXPlhabJr4LImKAbvN2YtDD4iMk?=
 =?us-ascii?Q?4t59h3OlLoXNX3XE5mkhnhqx8wnKn6+XsdNHFkvir4uPIOnbC+6zuQ+dMm3a?=
 =?us-ascii?Q?0KpVo/K4Fm3s+pRi22jyoSA9ET80ezg0LHmAqfum10H16MCt558ho4HM6ljE?=
 =?us-ascii?Q?zfpCfmlL5nADYCOUj2tNSp7I1OuUmyxKsydHY+gBBcONXiPX2K71LcjA+0yW?=
 =?us-ascii?Q?N3PNdW67aiVYBjLmiOZoWU7x7jPYCOa/VZkPw5RMbrlL4OKwqj1r0+zp4W6r?=
 =?us-ascii?Q?dZGgusG0YloS+8Vj7t6yUId+OJecp9h2fCn/nF7dDA6VuFvCcLwkEyS+av0f?=
 =?us-ascii?Q?3YTG/varMQwduIFET1axTE+slan+4uj0v8QcJJiIUe2EBgTYfcZTRjyk/219?=
 =?us-ascii?Q?YkYD5fbsFn0ThsyJ/rdcxGrLLzIMfYa2CSp3dHMpw56XoOscIPs3FKvgEwWS?=
 =?us-ascii?Q?tPFoEuzGeoq6dU2MvE7++pxCT0LQOBkdjU/tNS13/UIt0f6CrymtmZIwWsb5?=
 =?us-ascii?Q?ypSFvPcbrLdxEi6xdxV8i4wd8Ue/n9XDmmIh9NkyzVTpA0w0ra+XlxNKBIA5?=
 =?us-ascii?Q?z0+E2t1Fmpk5hPkP/SqD/D9EXNARbRyt4fhqBexoaFfW9k2xh02AJiRr4Wgq?=
 =?us-ascii?Q?9P4TZ+wv7EhrQO7YdQU/MDy8bkEpJpzdXUKrb8SpEDyZZMVmoIMb4xRIED3y?=
 =?us-ascii?Q?aYlswAeetlhJp93A1ZeZbei0f+L+tb1KP0w+DsHUTctPg1UnGDpFcQqQOMzc?=
 =?us-ascii?Q?8pIsZ+XvPTdJ0iD4BfoHnqmCk6AwZUTYKiWflF9/92s8yBnry9FaB20KiPYj?=
 =?us-ascii?Q?lhO0+cyx4Ny9YL4simNcaCEX2OWdBn9Huk6oEipKvFsILoaKCHGrSA=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB8059.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(376014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?XpE73aEXjhOw44Sdv9QL52q1650XEfbWVTRlLojPqOmZTO+q73nz+Fsb46m+?=
 =?us-ascii?Q?TfytA7++AOF033WohO+fSaLaeHcXq8OoKgMJAuNMWUPd9aCwv6/ZrjJf+qIT?=
 =?us-ascii?Q?rRdF3+N7MryszBfvDwYrT/W8ZOLgIq+TdUBGE7TKBHSiBPQeL6Yz7Omxi6m6?=
 =?us-ascii?Q?ijF8J8lsIIUj6fHiBVRUoIR4QuzAGCilp+YTSMMCsck8BUnDFLVxeJFxJlrY?=
 =?us-ascii?Q?7ZCNAwymWDjpFxYJyb+UhrY0vV46jFSRvpOEZSZorQN8BnpqhJRdiaaH6QqR?=
 =?us-ascii?Q?f/h5l0Br9bnKVGdb8VCgjpmR/gaK5vA0jON+YKLSXfE6Ep/bIcKzE2sRRwW5?=
 =?us-ascii?Q?sSKuiTkkLqOb+dawm1OoIVF23Ct1Xac0JReZlWTSVJoaT5GSiw+3F6axv16W?=
 =?us-ascii?Q?YPt6nXtV6eMv3F0VzvPNebpnqEOiOSOhVm7SS5KVHpEbEqvTiR0DoR42PWpW?=
 =?us-ascii?Q?WS/UX9ZV6soj0aeMMi5wyLqZZBJyEpceIdkj5L66QG1Z9BdpnLPw67sWhg6E?=
 =?us-ascii?Q?QY1+saqRxntxqXLe5KTSeCm2OCYPsm90XANiIW4Sre8vpXCaSjfHnDhOOcBE?=
 =?us-ascii?Q?1LWKfLwuQzCy9g44FXn3+gjWf+jnJ8lgB8I+11Fj4Ja2Jpl4Q95qzy+Qhogk?=
 =?us-ascii?Q?8zXU/1Yq+XoAHRA5Bbg4Tki/GdvI3nCIiNI58+d8laf0oXW6ZshiLGlEzqAX?=
 =?us-ascii?Q?csb9OgRNqmQX5j/iDaoE/mqnt0up2trzP0f06iGZlKvyz3yPnNcCY0Ufjkg1?=
 =?us-ascii?Q?mAkmUY5FvgOmpy/cIyH7KdaEmnXpgRD9iOoAHEfJwFKGY3fdMh2HL47HTzJQ?=
 =?us-ascii?Q?arQ0lMlVfstq9z4txSmnv0dlSl1sbx9b8SMCg0eqot1ZQNQSN8WR6HsXqw+2?=
 =?us-ascii?Q?laGJryKbhSLouf8oPXvhnVE98aXhAJKjSsCq6YcvLxRwricSBB5GpRf8XXQ2?=
 =?us-ascii?Q?9ufPgDoX1EvSmzL1iJxr+GEClvmePbR1rxjPY3WggWevLHgYB2EVjKbbGUV1?=
 =?us-ascii?Q?GAzDpQnAAwpUwNapAGizoaqFxxTq8RNjz3vQyNHgHzovTDqDwKX6TXHo8WKX?=
 =?us-ascii?Q?D59g2SmTVLLGC4Y/os9gwa+O6u++T0JxlJ4IxkVI4QmcAL9tzGtCLCVQcIEw?=
 =?us-ascii?Q?7nCG6ukYhGaTDPBRay/7uTWneIkdFV8lwLk3JGWajBX5Sez5cWY07xGgRrJR?=
 =?us-ascii?Q?TyiiOVctRzRLCZRj3+DOT15vQkJmNbenDV4ZP7xOQYwUFHaas51pDGq+LR8I?=
 =?us-ascii?Q?nMFOUWCXBoJo0i8mQKEU57E305Wu5YgDhRBBgAH2FbXij5Pk2VSe0L2SRdPK?=
 =?us-ascii?Q?ujb4myqDvEt7hpbmeGqlcbRJefNl3qz/Rza6L+yPCJRRlNtZpmWnDyspocl1?=
 =?us-ascii?Q?U6IRlv55SEWg2Rfe6tGnDD4gnjiH2BZ20rw/HcQpBDlsgrklDNBaSaKGDgWv?=
 =?us-ascii?Q?+Dvqfy4I1rJi9lw9dEbxFMw7g21y/2VYnIClvK4BHRWDr/hPVsGgQ+KQj2rP?=
 =?us-ascii?Q?cWrguoDKHVEQP2cWwho0f/w5NF8otXvCikwDcHUAN3m/P7aNMFnJGgwxdOmV?=
 =?us-ascii?Q?vf3amfijjbdmSyevHPuvAAhJfBbGKIWRoOrp+ZeZ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f5d2b86-465c-44a5-f597-08ddb0399cc9
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2025 20:32:44.7440
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6PvWdGoEi4L/lNw4zIXKzmy/UVwByoGHMvaT1An3KZ7zP7ZcmdeaXCEocuCHPVcMxILv39PUjOz/6wlK3JW+LA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7273

Updating "ppos" on error conditions does not make much sense. The pattern
is to return the error code directly without modifying the position, or
modify the position on success and return the number of bytes written.

Since on success, the return value of apply is 0, there is no point in
modifying ppos either. Fix it by removing all this and just returning
error code or number of bytes written on success.

Reviewed-by: Andrea Righi <arighi@nvidia.com>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 kernel/sched/debug.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/kernel/sched/debug.c b/kernel/sched/debug.c
index 9d71baf08075..9db3fcb4bc8b 100644
--- a/kernel/sched/debug.c
+++ b/kernel/sched/debug.c
@@ -350,8 +350,8 @@ static ssize_t sched_fair_server_write(struct file *filp, const char __user *ubu
 	long cpu = (long) ((struct seq_file *) filp->private_data)->private;
 	struct rq *rq = cpu_rq(cpu);
 	u64 runtime, period;
+	int retval = 0;
 	size_t err;
-	int retval;
 	u64 value;
 
 	err = kstrtoull_from_user(ubuf, cnt, 10, &value);
@@ -387,8 +387,6 @@ static ssize_t sched_fair_server_write(struct file *filp, const char __user *ubu
 		}
 
 		retval = dl_server_apply_params(&rq->fair_server, runtime, period, 0);
-		if (retval)
-			cnt = retval;
 
 		if (!runtime)
 			printk_deferred("Fair server disabled in CPU %d, system may crash due to starvation.\n",
@@ -396,6 +394,9 @@ static ssize_t sched_fair_server_write(struct file *filp, const char __user *ubu
 
 		if (rq->cfs.h_nr_queued)
 			dl_server_start(&rq->fair_server);
+
+		if (retval < 0)
+			return retval;
 	}
 
 	*ppos += cnt;
-- 
2.43.0

