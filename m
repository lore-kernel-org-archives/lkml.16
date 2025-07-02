Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2041.outbound.protection.outlook.com [40.107.223.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD1032D6409
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 23:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751499004; cv=fail; b=L8OqzUWl8f9CZwz4PbSC1F9Pbx5EaTe0L0fS5HywEhfeFNkjojE98V12SHdYpr4K8dPTsE4BuLWpGXKzGoJUoMnGe+X5+6SLAB+ew4KKphmCZD4mLvHS2mmNG/ePWDQf4ZFL+lBCw/rSOLj8jpUDNLWwT0NZencHji/rWUxpRcE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751499004; c=relaxed/simple;
	bh=qCF3hK+7JD3jcwdGO1GbVg/erCGm3fKTsW60DWzcQT8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aGQ9VAfkChdYVDilN9ZUeMgNXI9m00qV7f4wXm4TRuuYbCIKaPXN4CZcAbDFttVqj/DBIPVfYzPYlUdazRo0/VhYLkLFP0iaHi3GITBNZtnVmlfeWkYJ15IHdjCsDAP9eLJjHkqeDAVgsnjuWm5zIfDSYUZGbfY0/13zH2llBBw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=NjYvqkEJ; arc=fail smtp.client-ip=40.107.223.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="NjYvqkEJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pohoOJJmhC9gT0Nc8dOEosm1+MpfVtgOqBoRrZjB8lYZsN+0QKpH7/RyPwHM4cMW2TjkBhTOwiHSdq7RTgb5kneHP1XBdLy74430CMTFI11wgi1I5QKiFw+cU9iasfEYj/lYOOjoIjPiAMX1rlOM8Em6qFA0K3oglvkTt0IBm1cPkrZu337Yn6c1Eeh8QoMgxotfx4zvEND1sza+2QI+Xtks/0+6a2dXnm72Rzz9vFbaRf/COPB6J1ruUDwoKRmJxa3esDMaWytQqi9T+0OlsGcF63vhFFFe9DZYEdlBmLHFNBalUmgNPk9HropM6ysIn5Xko2uECHxobrWiPljYcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vqo6mLjhZrSbUQ/eVWEAhlGbRQQ5Sc/Yzh6rF3uysrU=;
 b=y9t+OgUcguf0FILyJ5zWi5QZCCVN2VNsidvc5apox7a2h4OP0SXZdkECBrvUrKhycR60TjGp6G1ToSCtax3jwIDwYkSXQMgs0UXrXCaQZ8S4uwwfoqRCxQth0SESs+wrqOAbj2KkwpjpV00GMJZrEgEps9WzqqECBDny24ztxO0/ZF5v1MO1/4dIaBvNjrar7RCNWvTJIuiKWCiVugvmTs+B75n58sNrLDRKQGMM9o3boEGXyX9xNUymQOP2uAaYfKbqcLqB6eoUhRRzfeXwtJRECP4iNPCcnVIinOIilAKuloKhlUBNP6Z0lZlSfPQUrA2v51AHlM0vlWWIUAL/jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vqo6mLjhZrSbUQ/eVWEAhlGbRQQ5Sc/Yzh6rF3uysrU=;
 b=NjYvqkEJNiUbcFPUeLKk7uhfto5V2AiSEENeJxVprBneAbtNlPlN7haV4fdQ9kRHuFP0pQlw2bzRcNp5URxkqx4vxeDKB9HhKOYlxgynI4UbJHzR7xeNPgxF4nmNkQHvvdRfwtT/vxmiL20DSy2ImQBJJI375H/yc5PsVUyfqlJ5XqSDj0wrVb7gYYcSrG7OIBUpKTh/Wkg8gSvXjLurt3Huqi3uA3vQlX+eV/VMG7Z/bLmv3GLt6u7PHASJvHu8AXLueMqm6tKYOe8lWIuIWk8zkqXoMfERh1xr3lEqo1Ff91kdse2n0tnB3y6ecxvrf70FTiUueMkINaS4wnb0KA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by MW6PR12MB7069.namprd12.prod.outlook.com (2603:10b6:303:238::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Wed, 2 Jul
 2025 23:29:59 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%7]) with mapi id 15.20.8901.018; Wed, 2 Jul 2025
 23:29:59 +0000
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
Subject: [PATCH v6 02/14] sched/debug: Stop and start server based on if it was active
Date: Wed,  2 Jul 2025 19:29:27 -0400
Message-ID: <20250702232944.3221001-3-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250702232944.3221001-1-joelagnelf@nvidia.com>
References: <20250702232944.3221001-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BLAPR03CA0122.namprd03.prod.outlook.com
 (2603:10b6:208:32e::7) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|MW6PR12MB7069:EE_
X-MS-Office365-Filtering-Correlation-Id: 25febe1a-a6ba-4ef7-621e-08ddb9c05c3b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?yevXegF7oH9qh9FAyFgUeGeA6vmwvd/PH4oIHVSWP6LZQkpebODAmrq6bPIW?=
 =?us-ascii?Q?icdxObLWbL9GQ0zGaJKb3yfPZIsBscGi0QE4tkiNon5EXBxN5dR76LyBSxee?=
 =?us-ascii?Q?Pr8UwtHJEvUY1rn6PluzTmKLjKdAmf9OoPhyic+8fqfCsiyFGBaZbGyjhsrQ?=
 =?us-ascii?Q?4EcRJ3D05drRdq2gC3CWfErGIDUDTgpOHQx5oV77n1URZC4Dul7TVJ3kAE3B?=
 =?us-ascii?Q?AIE61CVCle3GlIZ4os2cGorV2o7I1CvF+B5eHcgQQnD9DhIcdjMYAIOi37c/?=
 =?us-ascii?Q?zOxM/T8s++k8UyujcYaPcu7isNzqYbXNzEQLHkJfj8Ym7LxJ9S10vKxhVmXW?=
 =?us-ascii?Q?JDh8ciyRa5sTO3nxhAwN/dcvJnJ+d6N4msetG7KW6XjqEFSD44wcaprm/jLx?=
 =?us-ascii?Q?pnFaEt/EwoWpmRLi4Q8abaI3ZEXVNPouYxkazbtY1witWTBVm/HeYymffV34?=
 =?us-ascii?Q?JEStIRkjv1DCclgAN6kLwdu9crsR5uqh6yQDb2O+O1/+1RQMV5DQlu+O3Kpw?=
 =?us-ascii?Q?K+KfdHPbRrfmwnVM66pDOTvu7FOpczP9ypRFh+mv0zbvDXlBBcA/kC59y+wL?=
 =?us-ascii?Q?XnSvq3woxjCqxWuk/oa190dcROOqCjj3NFkaGTkoYjhrkcjuL8x3QzG0i7ZK?=
 =?us-ascii?Q?0z+UuLOlKV1SUyzfsd5Dk5t8n0xVN1b8JZkqycklleabfD5LsGSFYDcdetuH?=
 =?us-ascii?Q?OuuDxZ54tvECRGDQah/nnR6QnkZZPhxXpGWsWl1tp70kS5o0x5xYyxRBc6uv?=
 =?us-ascii?Q?Dqoxru4zjCyECj0BeCs9MfEPrr3GDzSfSBCau2LeH+KsmHaPLl5Dj76ivyte?=
 =?us-ascii?Q?lyXfjEtWFiEFcyVf77J0NUd7UxQ/8geuTfA1waES1FzIymN8N1/j80dIDpWc?=
 =?us-ascii?Q?yxAmzSSIcqq0418OZ+i+k1jO1vSAYpTH5EBJ5XcaIVqM2+k4oOkmEjBuBxhB?=
 =?us-ascii?Q?j7v+zsli2iOr310dX/KIJ2oGC5MogANF1rBtj6tI3Z9wLvBsyWGGRM37tpu8?=
 =?us-ascii?Q?VgOXy2582xRjYwE1uOElcrlD5g4FLqzSdetLoqfmkq3mxc2mWN2cDP+9maRI?=
 =?us-ascii?Q?uQNDbVtC8/ChiO44rwkwa4gvjHGh5mg8QZoJ3Aqu8hOlOkunBmsM2g42tPMt?=
 =?us-ascii?Q?4+1Amfeob9zputPAXWvK0goFyFZ3jlV40MSYELYqzR2GoKYGRGJOMzLXp+kF?=
 =?us-ascii?Q?u+8fd5/eM7I69YbhofG5+CHvEDajhP3ITEyMV74KiDB8uh/aefODLFYyWQmN?=
 =?us-ascii?Q?v3k+8A0+YEgLk1ucsNT2U/1InFUtYoWjR8IMLIyv7ML3b2SL16X98KbmKpHc?=
 =?us-ascii?Q?+pSzY+LyaefUK2pUUq6Z/JG76qeHvX96TnjN+xDlF1KWf1aQ5oGuQIARB7od?=
 =?us-ascii?Q?YrbKxL9SZCj8rqdYNfeCYWL8nWXCaj49aKKQ8NuGxBnnpKG/krFfIHfSrIIQ?=
 =?us-ascii?Q?/mG98G5q7Nqti0NZpRmHvisSIC2CdO90QCCL09OqCmzy3eX4UOEKSw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB8059.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Ou2+vrOTIyICdwFGJmoFfMo7WZUGnw3w+ttrJzZJ7Ls5cnGWDA5hZPAN3iui?=
 =?us-ascii?Q?CrVOgGCA9szhNy957LBbKIyTg4XxLqf3C/3JfXGoXp2Bsu9I5mTWlPg6Op45?=
 =?us-ascii?Q?AW6jZXWe8LaSEu4z+cClH4W0nvLDK+yHdA06O4VKmVAIFsGahlzuMt8MEkCd?=
 =?us-ascii?Q?DyAgu601BHtIDs2ABZDPDcHGQj24JoWAJsukaYNzDC1t+9OK+mxF6nLo+Xm/?=
 =?us-ascii?Q?pvrtyhjLkbUcZ73jdHkW2ik84lyTaJsfYj0gFX6vr4BYnjONHV2gUyP7vyng?=
 =?us-ascii?Q?lcRiu6Ed9xMnh7hFy3gIrori/XRNQeIHuoWeO/U9E5yr2HgPQfX6NXUBDtl/?=
 =?us-ascii?Q?bmG5HtHVb9b7mU2f+wR5c2JKRsmchqfNGjN9komalB/aT7UzDimD672pgWKG?=
 =?us-ascii?Q?L9LtwwuTGOPDS8sDjaN2dP82jHlgwAwm3bRYqKt5lILcVgSeHrncVfmLTUr0?=
 =?us-ascii?Q?aChotpMCiOk6AAJW/tLIIrwyheSKyWRxxktnaTZGzEpbPlB8b2/hz/TGhN2O?=
 =?us-ascii?Q?ymNmz1dgn2DvGqUUbxA6CQ8+Rz616LyTwHQCe7nGyvbca3KGH+8HCIJCaIzZ?=
 =?us-ascii?Q?mGuThcNTY1T0cRtSLTcRmQvn7kxWPTHRQ7i04VAUfSjXUwa3N+LJQ6KAnRyf?=
 =?us-ascii?Q?op0ZibpstC4U4wncyTXKQixeDD/Oqec+V1e9Vby9gLAHvnL9TiSlbhPPGgdf?=
 =?us-ascii?Q?yRd8rvq4W4LweELZJiFEWp+29Qqn4RkRvvvpxmGGyaciGU+YvV0VGIyP6ijD?=
 =?us-ascii?Q?HZslaF5jWQ7NgUNrj7F5PFF+cjlxgvnrAWNWwdMjLuAdicK8sx6FbKvlvLgj?=
 =?us-ascii?Q?AffHk8WjjadMUYqYrKd74UQfbumYgY5yzcnMF77fZnim9Vp2tepoM83ATcCl?=
 =?us-ascii?Q?56IgNus05I7+yBe3fUPNYypwaFPCuKjy0e7CihkVkhKQcHykqt6iXJ+iUJ77?=
 =?us-ascii?Q?BiUvSWxZFDThAH0HpZivjEabf7qeWxtw1ICyXLAXaClcvfJdee3d01JtppvS?=
 =?us-ascii?Q?rIWhjxCa6RoVeIoTLjQJplFyF0jgTJkAlm9qxr1FNdyHs2NSJOOBSKRjyWCM?=
 =?us-ascii?Q?v8+U5CpUzldTuqDuAypzYF6mbe0TXECOyI0pS0zgPewcfh/9rKkkV+itpusS?=
 =?us-ascii?Q?fMFhBU4awxlB4onV2d5gD/ul5fM9skHxHkl97iHtXxQU0JOHdlZtYgBfRMH9?=
 =?us-ascii?Q?JBBqrSpDKI8Qq+wwro+5O7O/EZFd47mwYqWzFbL3MCWTfTsLlWudyqtNFB8a?=
 =?us-ascii?Q?GqoLzq4IhvBGKXD64XItTmW+9a3GsQyR5Gdan43e/Vj/oJQrPdzWWPRm493n?=
 =?us-ascii?Q?FGiN7PfKCyhoCnlKZhRMPaaPGmgJqYZYwwf6WZvX8Yrnecgq9WWzPiiTz7Z4?=
 =?us-ascii?Q?DWoXI/r9TynceONO0wASykEHWnlgOb9IhFbFV8QiFbQplXCkvEwm90N20gfa?=
 =?us-ascii?Q?V3MrKOi/3Rti10zVkAL4SPYIKOM9rnM9QaT5L/Ht61cjzefUUehjRBfCH/av?=
 =?us-ascii?Q?Kog34Hfr5xW1agK4kZfYWuyhBMnIcT2kH2fRCDi4EuT+IAFddUanEXoKH1p3?=
 =?us-ascii?Q?ikdkceHyDynwR8KvLsZiSJDAbYxhv6bjg3eAI8Iu?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25febe1a-a6ba-4ef7-621e-08ddb9c05c3b
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 23:29:59.0041
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6aX6xPxayHS44byNRNYIppiKhD+pzRSfOGGfC1EDDxOyYqdWnD5uJrBQ+UtdCjYK6R38vqkiE+nhj3vx0k78mw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB7069

Currently the DL server interface for applying parameters checks
CFS-internals to identify if the server is active. This is error-prone
and makes it difficult when adding new servers in the future.

Fix it, by using dl_server_active() which is also used by the DL server
code to determine if the DL server was started.

Reviewed-by: Andrea Righi <arighi@nvidia.com>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>

Acked-by: Tejun Heo <tj@kernel.org>
---
 kernel/sched/debug.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/kernel/sched/debug.c b/kernel/sched/debug.c
index 9db3fcb4bc8b..dcb6b2b2ff59 100644
--- a/kernel/sched/debug.c
+++ b/kernel/sched/debug.c
@@ -359,6 +359,8 @@ static ssize_t sched_fair_server_write(struct file *filp, const char __user *ubu
 		return err;
 
 	scoped_guard (rq_lock_irqsave, rq) {
+		bool is_active;
+		
 		runtime  = rq->fair_server.dl_runtime;
 		period = rq->fair_server.dl_period;
 
@@ -381,7 +383,8 @@ static ssize_t sched_fair_server_write(struct file *filp, const char __user *ubu
 			return  -EINVAL;
 		}
 
-		if (rq->cfs.h_nr_queued) {
+		is_active = dl_server_active(&rq->fair_server);
+		if (is_active) {
 			update_rq_clock(rq);
 			dl_server_stop(&rq->fair_server);
 		}
@@ -392,7 +395,7 @@ static ssize_t sched_fair_server_write(struct file *filp, const char __user *ubu
 			printk_deferred("Fair server disabled in CPU %d, system may crash due to starvation.\n",
 					cpu_of(rq));
 
-		if (rq->cfs.h_nr_queued)
+		if (is_active)
 			dl_server_start(&rq->fair_server);
 
 		if (retval < 0)
-- 
2.34.1

