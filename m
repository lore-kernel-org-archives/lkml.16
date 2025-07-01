Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2094.outbound.protection.outlook.com [40.107.223.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AE45191493
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 02:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.94
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751338014; cv=fail; b=GxHikAkpr0XM2dHzNr3oGPg46wkMWkJLIGoxl8+ADhNejlzNvQLvyX+nB6t0k+UhMRamvRNQnZelzpE/XUvN+ynM0EpZBTbbYxBRdR8UkgoHFCwCwe9Drf57ijs6rInNjl0dQXOEmwwPpfWrEaIHbT5prO/grIMRqjRgjazwrjM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751338014; c=relaxed/simple;
	bh=Pwlg3+csy7LmpsLBzYp00Dm29GdALzd1NQwc9BaZcUk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DsaWop1ohcpNr1/FmrhdR922vRf03FFD5pjrLAGZuxCKjUUTqqeEHCaaObIUczWK+HAzBKxmMuKxt70dTWNJc3fnLExkXdS7ghM2HOCHPjWkBGwPafzweeRIj6UBpdnvJCNs2PxhjJ/pt6WCgXOkyFAWdj69yEtKGfY+OLce2Qo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=os.amperecomputing.com; spf=pass smtp.mailfrom=os.amperecomputing.com; dkim=pass (1024-bit key) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.b=qKzfjm/N; arc=fail smtp.client-ip=40.107.223.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=os.amperecomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=os.amperecomputing.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.b="qKzfjm/N"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AAw70UZWJn3fvWvGwg1lUVo+xmaDvymoYFdlSAT7UtRaigLxwiw02Cey7+S7E3xQti+MaZycTTL8m93SRRBy0lPe4yn9yihiNA2IjFFMwEJZEueOQ7RNlleVIgoUKXga3/RGy0lGW1J6oXgwulu1C39yMkqe2hFFwK9xU4RLtXEYHbw9n15o0h40qkS1vx9Uf/6ttFORYLvOmTlHoeJ6S/4x08BmMO5oPQSH5WwYWq2g9hI3icULNe+CsjV2/GM9Ml0iIF7bY5Kp/AWgsQt8aQsyeEDNKZmHKQYD/MnM3osLEJDe/WiVwlcnxhQqoN6Ft8ov2kEeS6q0l3CF5fPbiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OcbqwK+vV10JNvbOocbDAFusTVYqjCkg/XSg4JCwDRM=;
 b=j1nq3om1ICnOIMq/hvbaYOmMsv0v3X3ysLW502KKAfuq3MZhuXIHyKm/S3rBdw0M0vIAQK2MF7pkNFk+WgsXkcC7dmYnn/3JJ4/bvpFNPh1AiZ8AgqHM1OMACmuDewdZJTr7J9lQlK7NRdLvd0cs1fnfjfQODdtVJMJM2uu6srTs/vsPV7+I6aO4DtByHEzHQjxEdwiYQ3vPZj5Tjne/VSJ8qFapeOipv2d81B7XYuMYaqELSGDSSJXG5QULfmpILB3VESRa/qSxYCfkAy3BCpZkxvvaDV0bQYP8tsUdlwGgB+SxmG/zgwxd40ratueg7yPxXV/4cath45X5/w5kGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OcbqwK+vV10JNvbOocbDAFusTVYqjCkg/XSg4JCwDRM=;
 b=qKzfjm/N2js3+336cmTfuuEWq/l7F6w1YbcBeNWHYCuJy61ihBxrwvToabdjXWFhh3vSnpvtcxGm8Yn4At5YHN20d8uQ3mXN9IQFxO/rvqb/UKpcF+LDDyWZViaZQ17nLKsYqzKBT0cEx0RySvzr73jgTb0US3rx7UyntY+AtUw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SJ2PR01MB8322.prod.exchangelabs.com (2603:10b6:a03:536::6) by
 SA6PR01MB8877.prod.exchangelabs.com (2603:10b6:806:42b::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8880.31; Tue, 1 Jul 2025 02:46:50 +0000
Received: from SJ2PR01MB8322.prod.exchangelabs.com
 ([fe80::83fc:f69d:1950:9f42]) by SJ2PR01MB8322.prod.exchangelabs.com
 ([fe80::83fc:f69d:1950:9f42%4]) with mapi id 15.20.8880.030; Tue, 1 Jul 2025
 02:46:50 +0000
From: Adam Li <adamli@os.amperecomputing.com>
To: mingo@redhat.com,
	peterz@infradead.org,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org
Cc: dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	cl@linux.com,
	linux-kernel@vger.kernel.org,
	patches@amperecomputing.com,
	Adam Li <adamli@os.amperecomputing.com>
Subject: [PATCH 2/2] sched/fair: Only count group weight for allowed CPUs when looking for dst group
Date: Tue,  1 Jul 2025 02:45:49 +0000
Message-Id: <20250701024549.40166-3-adamli@os.amperecomputing.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250701024549.40166-1-adamli@os.amperecomputing.com>
References: <20250701024549.40166-1-adamli@os.amperecomputing.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: JH0PR03CA0012.apcprd03.prod.outlook.com
 (2603:1096:990:6::19) To SJ2PR01MB8322.prod.exchangelabs.com
 (2603:10b6:a03:536::6)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR01MB8322:EE_|SA6PR01MB8877:EE_
X-MS-Office365-Filtering-Correlation-Id: fe8abf91-6a7a-4d40-f2ea-08ddb849879c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?vasV60qOjhnCqCdZHSWuETY2FL3HAJpSVArf8DR7LlM6T+IKG8OFwj75tw5i?=
 =?us-ascii?Q?z9GszgG8gc8nUSXx6ksLt7/c9kybSrocGs/XJSkhe/ni8k32PcR1pYu8Tj9i?=
 =?us-ascii?Q?W3BJ8Kc6VFuM/EZLWNXbN/p7NZbK6o2+QQdyZtsjqcB5LpQq1s/9DxoHWeof?=
 =?us-ascii?Q?Hhe9CGTxjKqXGieHtk3YOr4VA4U+a8e6ZL7CwOg+TsYfeL+REOEu1kIH/d74?=
 =?us-ascii?Q?WYX+efIVJCyF6Lu33GjVIz3pUMOhiusam3c1hVlu3TwXt8dy58dXjSeMmWrU?=
 =?us-ascii?Q?1IVAqaraYF8ophcI2AcHth1VxcOpeHRDKW/vbR9NfTNLcEW45d7nxQuV7qNE?=
 =?us-ascii?Q?LigADCLkW1jS5Dhq8VtARUdvaElzLNPSiHyivzXH1gCJhwJx4FR8aq621ukT?=
 =?us-ascii?Q?1hjyQ0d0GJ17NggTN6/fafv661hAm/oObFms6kXKL3UxAUp9BrRBMBwxDtV4?=
 =?us-ascii?Q?mE6myQhJBYmt+f/7IpHHbuOpA7fxh17uTDysYNnVsbvSv6pUolffC9+NBWaX?=
 =?us-ascii?Q?ti6udZ9/bYRMV6wO+s1VYCnHEotseF7z7Psdmtl2/UqX63ItAuDUu7EUvNw3?=
 =?us-ascii?Q?oE3yQ8XIXHfUV/hvIvKVdoejKOutjt6MEArVQg2PB5CjiSL9w3FLObietotr?=
 =?us-ascii?Q?3tbwzGMzgNuy/uzA8IKmK3MfBM+68IRm7u0L6fmAGHHVzGI8XOq5X/ChMsBz?=
 =?us-ascii?Q?M6EYax74yR9CPl8tEo/RkPS6gJOFb5yZEtKJQDtQPqeKNKjg5IhelmwtT5R8?=
 =?us-ascii?Q?bWSxKVT61LIE3qvNUlyQWHGb+jKRCsq0miwt1YA4CtW9u6Gh7P77KGkXXAno?=
 =?us-ascii?Q?Noqvc2LRaqoYTpZurm893mUj0PPpZI1gg1ceyb0n5znFWquGiw/h4GgZoyjb?=
 =?us-ascii?Q?E48A3ZWno32bMIsQ38eJN69Rrn4F91qUnLsxynzh58k6BdPXeddJNvTTOj6N?=
 =?us-ascii?Q?outIYgYJuNeMNSv6VoLv5N6tQsf4mx9mmQoUipXwWfI3ngOxfKLXIaAWNhkP?=
 =?us-ascii?Q?qefHMrG+1s3I2YlTgnknWgbct6d1+uqU1xYvLZdTZhbMxSwVhFmdKQ6oVO/m?=
 =?us-ascii?Q?AJyQWWnoENk/I1VC5hJX2czYYmYLTeK+F7oOLgYRjS1TQbpsFeezYL3rEXCx?=
 =?us-ascii?Q?PY2Hf6qMVUhK4qKjpMYrwnZSThjP9XfBnV2tT29gt/4WpAdF6IMEsz1+i2yg?=
 =?us-ascii?Q?lwlOhS1Y1ICemQBW3dQPgGRAfRRhSZ9xOjxczdjAd1UAM1WwG29GiLmeWSRC?=
 =?us-ascii?Q?vv49JKeXL0+y2WZhPerOW55W2w+k969iRzfawpZXy08emx+XOYRwSA8bIlpX?=
 =?us-ascii?Q?l38B6oSYAFSlyj2I7C6dKGnGi3VsWlNkW3zioBCtcCY1NJ5l4XvfKJ6JC2sZ?=
 =?us-ascii?Q?EIzFykeAQ3LIrsCnSFYDG4tzWD6MgP05nf5zB96Hic6T0us5RxiEXczFp5ml?=
 =?us-ascii?Q?OITJgac3DXY+KOfxK4r2tEzfANpbgyowHA+RIy6THD+4QjYkHFJSqA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR01MB8322.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(7416014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zVP4zXMtDMOpDhdD0rRs2tGdT2XIMLyRMsTFj57mI/uNLqABgP56P3olaW7r?=
 =?us-ascii?Q?nTHHGIG6etBqLfYEUBwZdi4hTJrX7xnhQxrapzEbd9hhbPOyWbQyuM+ZcNzW?=
 =?us-ascii?Q?b0jOGq0WkPwsNhvhVgB0gcSuYIRwsl6Si3GlVBDsNE1Ku6nma8edP1bfDQaa?=
 =?us-ascii?Q?M5BzB9aDxPVdHDa8+IJ9QFMnv0mVQ0k/4bmWn7ocPCpYUbSQOn1JDGsbXd9E?=
 =?us-ascii?Q?vaU09N3C2g+kVtRVdhb4yqR9I3EeRmt7ebhKAFdml7XsUzd1v3zcJdhuV33O?=
 =?us-ascii?Q?q1bK4rPUG0SU1vE2O8xmIM0kOX3a6TvQb9gwSC2HK7q8k0Aiqmb3qqHd94+T?=
 =?us-ascii?Q?q4MLG5JUZH5wlzf+kATmaETQZVVrNJPBWDEOwXZaZVP6T+daBk3aZB1M9DLG?=
 =?us-ascii?Q?9dD1cwAp8TiExWfeuRjvibUrhlPq4To0moWcHrByh75Si/Z5CLf58aIMabiq?=
 =?us-ascii?Q?u0ieOksq/+0sUke8SlTfSMr9kJToFUgcTAn/Nj1/+800Z/l3IPT+sSnQBJIK?=
 =?us-ascii?Q?iRvDD8PtJ2kGUNi6JAnPjytzn2iiwQJdxknRpSOxnJBQrb8nyH8qO3DeJFaR?=
 =?us-ascii?Q?TJRS1tDT/DEaZgYDD+aFwrFqWsAzT+fB9bfFU/LpQDQ5Phmsw/lEdbabMIH4?=
 =?us-ascii?Q?5QoMDmpbNBK3S7voFA1licXp1sHZMCrmp70nTfW62ovAa8T2Su4pmS7XTdke?=
 =?us-ascii?Q?u82ua1uC5EfWEHKqGVqFDW8bZEo26G2md7Bbt9t7cB38/EKWp5Xy1moaTxMC?=
 =?us-ascii?Q?+uKXDhmTwG0DpjdCidMDV1IzKBjGrXGP+DNpwxkWzZQHohddzkuW6wX9YxNu?=
 =?us-ascii?Q?m58ns3S/DRbLx2G95y8Z//bFtGCXI/LCh+cJsM8iMqoKWLhy4akHEQVaviT3?=
 =?us-ascii?Q?QFdjl8b58Bzo2x6w5pa+w6AwsAuPJ1qkrEa+3HKdlPqxhaYegQg9fbVhxnBY?=
 =?us-ascii?Q?f1WzhS4FBzNR+A9q/Qe3gy9jRwkSl2wcHN02Alhm+EzKkZAsPFsnSDvUnU6e?=
 =?us-ascii?Q?0/Gl0osPpypPa00Gy5bBwN3FKWovL9wD5W02qsTMj3LKHc5EOc9U4SlaQ+dO?=
 =?us-ascii?Q?PWZ5539p6NUAKZBB3LsrQpVijbgNjY/RjSDp1axrg88IU14bdrpddo3FfrXi?=
 =?us-ascii?Q?dE8OHep2P2BQamfsgyDOn8wj3hC5pcWD3g/oQHX47PIccBPxE4E07V+MogXB?=
 =?us-ascii?Q?cx+lOFMjmPMz50btcYPZGXYYlm8x0SVi+/V0vlYofKPH169KeYO6Hi6XefMH?=
 =?us-ascii?Q?NxSGBuVIgpDUMJouW0zOXKlZhqo1O5msVrqlPzOVqzOyr2Es5CoILzVrzixB?=
 =?us-ascii?Q?y83JLZ7u2wqdmiCcf7IS+hI7q0CMU1pLyuUyNqDBUs/nfmRXX3bLn29bGQqx?=
 =?us-ascii?Q?gdNKEjWBMKp0gpcIbjkjoEab71Lr74JjKGlNiF1m2IxO2L5rhgBIFRvtNbai?=
 =?us-ascii?Q?1Zo4UpTaHq1d1kdYOcHK6N3tfUG3VYV/GQLYHlYh9x1OH2OWdWNrQfCZKcyl?=
 =?us-ascii?Q?s7bJpzyq0U/zbwEUZYMUOZUlQsPWK8/DD4Y7vdXdQjM0h4gowpIuJzGxMcdL?=
 =?us-ascii?Q?FxfB6UheGkm67Yc3iUwsGNscVr+ADf5XOKTzH1M2BL0MnmYR1UHb6IYMIJmR?=
 =?us-ascii?Q?MU/066Wym0HXMMIZ66kJQPw=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe8abf91-6a7a-4d40-f2ea-08ddb849879c
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR01MB8322.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 02:46:50.7446
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wt7SPf2/thPGw8ofhUY/rmnQoxfy0YdhpHHPcozxkJ3EhERrP2eW6agtGy21Yg737dKE6ezxxLVI9ueQVjSnFLHjuws57+Djs4WPjZsbbd0Vx2Y9dSkeCr1Os0mf8M0t
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR01MB8877

A task may not use all the CPUs in a schedule group due to CPU affinity.
If group weight includes CPUs not allowed to run the task,
group classification may be incorrect.

Signed-off-by: Adam Li <adamli@os.amperecomputing.com>
---
 kernel/sched/fair.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 78a3d9b78e07..452e2df961b9 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -10722,7 +10722,9 @@ static inline void update_sg_wakeup_stats(struct sched_domain *sd,
 
 	sgs->group_capacity = group->sgc->capacity;
 
-	sgs->group_weight = group->group_weight;
+	/* Only count group_weight if p can run on these cpus */
+	sgs->group_weight = cpumask_weight_and(sched_group_span(group),
+				p->cpus_ptr);
 
 	sgs->group_type = group_classify(sd->imbalance_pct, group, sgs);
 
-- 
2.34.1

