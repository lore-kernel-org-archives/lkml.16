Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2082.outbound.protection.outlook.com [40.107.93.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05A2E4207A
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 08:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748937860; cv=fail; b=ikawQSueIQRHYFZxqbjw13EJfwm/HqfuibwhA/8NhvZntBFmTbLC17Xrt7aEyI42J1bKpqI5ISDJM9SU7FXjcPB4NGJo/WnE86r7M1uFrUJEtTLLGmQsgKrp6RYl2RrMlKxxLqAOABuZ29w8k3t+a+BrIZeAS8qvBW9AXRi8FaM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748937860; c=relaxed/simple;
	bh=QtlhYrEaDl4S1+DSw0qQf1OrQREJtf4yCOrZ1zVgGUA=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=XdpVuNi224Q4e5+rvYDUBm3cWa6Fdg+YYleyeB3CBhpFjHDghZltnKjL6i1QcN1L0swsm9WoMG2jOIODkgD552FW2pAHyU1716QWqnMqw5FqLEom4qMirlIh/3+xoOHPyDbXlhFdltX9DcD28bs6sAM+ahZ3JZnJfe7J0UoT5OQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=fV8vtByo; arc=fail smtp.client-ip=40.107.93.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="fV8vtByo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=loKgnC7g8XHXnsB3nREK5DFXUlRoO4hqZA5B1+UlqgTBk2i5Lpe/hl/kFeZC1/QB9w6WPtUEk9GWWuXS+AmT2CZmvjUU22CFDj/sJ3kPFMY13j3JJIPkPXgtdAf0Oko3wjODg57+yTguAnobOs0dg1hUOGI2vRFWpQX96VYf1X4A4JohOieXLjby0wfMYFG3DpagrtEZ8BhjxBtlyca3u6Ke3EiDR4Q+1dBPGKFFKQoH+hPoMzohNy5t3zeJKFfI5JU4V5W2izczp7Cp42n/SHlTkAUhj7KcBG5v3txPirLnwGhX8BTYMMJwTu5I5r8FY4Tm6yKcauxTU8tbo3JkiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nBAgOJs5I5LAmtblzYjjwt5VQ0fD4a9HVh+Ek46tYZI=;
 b=i7oVH8MGEUoqvPm+BHDHCC7pzpjLG/tEsIijJbmguztmlCn439Oc1ZDHrw40Ka3LlAMr+L+0cDBF7Tahh7E92Him1u3S4WbBAXzPPpaKCowK/TiE51IKjJ1Ln6Y+FHvhO+YB7TZwXH2Y6tSOxGQ/+V9obSDYIcP889Aqwt+TDMBJC6oZg7Bksd7iM3/mYO7CSND3GkN1EY/JjhAVt4hJzI1R00agolswPyQVV68dUaxB2BqHGYSal90XAoZvRKrwyl+yh4NoIiagdH+5Fw/woyUS5mMCMndvUEnIvtde7gM6fOEwIOF54So3T3C89CbTighf/a/hrfLxn+0s1Egi8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nBAgOJs5I5LAmtblzYjjwt5VQ0fD4a9HVh+Ek46tYZI=;
 b=fV8vtByoPJfZh0h5JD16AyOVO3Nvil5BiXqrXRY/5638whL2690FdGH8jjS+9RYBgGZElwblAiHe1YF1Q5wOF6II0befe3Pwaw7VL37n8xlrwPinFNfX/r4wzKcpHj2jNywcNdhaLfxypKTpA7RHZhyXYBlqfQo4GeI5CENn0ogovmJln5R+GTt2slQ3+73aRLassPQY1uvLsv9Apk21O4DROBURsLc0HJFm+5QoHfbwgVp20qHlnS9nYaXGpz91jxXnL0Ms9KDvJ6p+LVkoYoHYwqk12Sqz/OhPYZS8inpI/LP8O2Jo/6CmhyLqEtgi7MvD7dSXIkj5ShVjkTpTeg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by BN3PR12MB9571.namprd12.prod.outlook.com (2603:10b6:408:2ca::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Tue, 3 Jun
 2025 08:04:12 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::1b59:c8a2:4c00:8a2c]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::1b59:c8a2:4c00:8a2c%5]) with mapi id 15.20.8792.034; Tue, 3 Jun 2025
 08:04:12 +0000
From: Andrea Righi <arighi@nvidia.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: Tejun Heo <tj@kernel.org>,
	David Vernet <void@manifault.com>,
	Changwoo Min <changwoo@igalia.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] sched/topology: Fix for_each_node_numadist() lockup with !CONFIG_NUMA
Date: Tue,  3 Jun 2025 10:04:02 +0200
Message-ID: <20250603080402.170601-1-arighi@nvidia.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR0P278CA0127.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:40::6) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|BN3PR12MB9571:EE_
X-MS-Office365-Filtering-Correlation-Id: a98615f7-1a74-444e-87df-08dda27539f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Y5EXWmpgHhoFPTF1lDaBUnjMuwNWIsLJRBvNoimZzhxrh2LGnYYlnGlrEq4v?=
 =?us-ascii?Q?OAQbIdb2w8bTiuWO6HJPRyCnLV/PVO0+1BUVv9z+uaSIxnDoenQbpG2cAqcj?=
 =?us-ascii?Q?qMDOcT+CGaWA0TT9j8fJjoBbOgGuyPIdIqy+PYggi6pLbMpNlZKLMCk8U6H/?=
 =?us-ascii?Q?3WJcGrU7bqdT9RF11yZn3DV6gSpMsq8XZ41NHt5AGL9vLQMOKBP5DIt8VXEm?=
 =?us-ascii?Q?k9bIyO1kRCp4/6C/618BaE0OPlWPYe6J2uCH+Xua3D6z6KU0fJh2L5ypj6a2?=
 =?us-ascii?Q?7yeav5a3iBpot95xcH+OB/8wa1yKeFFF9yDX3sZRdQBBfXOlG0HbIGVFjSH2?=
 =?us-ascii?Q?36xTEiH9j9eUrNMbisTxfY9SYpFDOik62c9bialfhjNhHjjrLlhcnUo0Hfh7?=
 =?us-ascii?Q?2DhNnvRYrBr8XClsVG7dBI0rugnvJmlr9z/WNlQ8qfVfUUt7xTrBXRXjzT5A?=
 =?us-ascii?Q?FCo7O+wVVOvHNq2+meJPQkETtm567GcWynGrLQntv9plPD7+BGjGG0SyKj0Z?=
 =?us-ascii?Q?+pScPRTu4xF6kXi8gmT88L+itNhFsLMQKufUUfuvFRW2FvizgH5xmQD87Iuf?=
 =?us-ascii?Q?XscBmPMpApnWyQYdIA2t+B5eUXcYBlDCLWXpYiT5fHhbKaYEjM3oUQVti/FZ?=
 =?us-ascii?Q?ThmJb1ttTHPlW7FnaYRG82aUYB2OJ0x78MONZWH8bdqoWsuuwqyMfnyavJ48?=
 =?us-ascii?Q?BmbFkbZ9D7n/V6MapICTwf5lM1FnH8Ci2QhnCf7TTVKzbYcUTSLQQi5FYsqb?=
 =?us-ascii?Q?b52+r6qyKGdpRG8MVrzl8bOW0Eu4+JveGJy5+WdKZD4fuzhmdxrjWjdrX+RX?=
 =?us-ascii?Q?+quu8/7tEN5TZBd8+2MCjPdOMZdp/zA72/P7MSbBzB01FstbZNo+FjvdAvXB?=
 =?us-ascii?Q?fW1iR8fRWNIFXa9Vq8KscewTt/rSPmGNqlBA3Q3fWHPj8HOHl0INK/IQH6nf?=
 =?us-ascii?Q?sbqyvB6bPC4HqMbXf3u5BIkwBFUWyPIB6nC/u8GM/OyJv6bwsmeCb6es+EoK?=
 =?us-ascii?Q?oWAQ5D82M+wvnYTV9spSCjKg0nO+44O3HJDQ/qx3WbZyHT/EuXpaC884YhGQ?=
 =?us-ascii?Q?/zcjo1qjj03tIDrjemwmUSK0OGHeOE8rbCmpo+kom5bq+h9f6dk+z24XWdCr?=
 =?us-ascii?Q?qE8YixWY3o8FpW0cj/YqJSUz4kRkV1E1FMylBAvEQOTE+S89OJb+wDtWe73J?=
 =?us-ascii?Q?QnUUoMP2QpimiLzn7fVIUTjwKHxcygt09kYIrbMan7UopYCD1f8Ione5dKE7?=
 =?us-ascii?Q?uql+wrb4yTZYb17lpLmScqhqg2xFcUchBmr7MaRUQ8TKsH5jDUPExOfVIeCU?=
 =?us-ascii?Q?c5+xh7RXjTifm/CGr57toEsFjTN3omvXtbIDVmgWcMgB3JcCd0zkZlHTRMYV?=
 =?us-ascii?Q?jdCvhBEXoAc9sia2eyhyeC9Cl566jgIHWmbrOf/hgPSOJ0VT/+6jmPwmiwZ4?=
 =?us-ascii?Q?f57m56+gYpo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9v7f5QRKBrgpj8pCo4ttoUFzVKtEPBczoDykQJ/DVcN7aNCRIZDGZ8S2Zivy?=
 =?us-ascii?Q?DYon0x4RB4BjP2eezWpVvRkYrWdPD/rZu4jQv+BytNen8jEvqdYsDw0usyFu?=
 =?us-ascii?Q?Uh3TdUdF0SmK2ebkJo9341rTR/fmCihJ0av3ZdWXFxsTIqYQf6rpR83o8GZV?=
 =?us-ascii?Q?8BKXboEg+551pgnm4bNu76fk1zYqPvnza6jdbdvb57Bei0qQUDjEW6TkYXTb?=
 =?us-ascii?Q?8jrlDRmn9QPOHvOLNzxq+vtR0Ttesm6aVwSp+qgOJ3DYf4ipdEIry4wou4zP?=
 =?us-ascii?Q?eWFg1P+lHcsAzEc5H27Ep+kzDHQpO/cnz8b8ElO9XCU7oQDZVwk7RJl+yifh?=
 =?us-ascii?Q?RpBbyfwqWBHcFWSRaoWl1TwkFV/3WYyv0Rb+zRnkz46w2Lv4QefjSLA7hjPl?=
 =?us-ascii?Q?6ut2ft5PZ/nFDQ0CQEbhMUX6zX7DTJHIt1wZw0tJabBP4jXndEfgIuKJpBdd?=
 =?us-ascii?Q?BM24ngPw6p/o/Ai476IJtw8mrRbFbiPIvch7b/C7hnhgducd8/tLVvrAuH8V?=
 =?us-ascii?Q?M3qAk1++zoMh2sd1n2tbNxoveq7B/6/uvXDgMCE5nJEMdSfu7H0neyPZSPcR?=
 =?us-ascii?Q?iSzoX1nQqJc1+t18ITooyVumbxr6Q5P/oF2a/1nCSIXZwJ5frqDKEdZNmffn?=
 =?us-ascii?Q?PR7BjPcTicuJQjZiJqc1e0MPIDCw+Mey0J68/zPu1+aS1IapTZ2l7Q63Vz+J?=
 =?us-ascii?Q?kMBaBolRRXYAWMCGbH4AQhnp7R+AlGZZvulI0EERGeV2G/Au5hEFKVU/p5Gd?=
 =?us-ascii?Q?seLJnDL1nAbPU3y5Qd5UE/PxlFeO+fJl8fZUIuVlO0gSK/a3gsdBhQpPauqw?=
 =?us-ascii?Q?qTV2P+hl8/fXhd8c1RU/WIlL1lY4dgQzQPf5Hbxi7PZW1Mh8f2f/CUG6cRWz?=
 =?us-ascii?Q?dLgVD3d5KXG9cEtcqY3b6KSHiyRAKhPc9ciElkJvI4+JQJsadCqLlpWDMJmI?=
 =?us-ascii?Q?FFVu1QANdZdMuocOJqcO3o/ImBGLVWCypyBpRL2sxPHomAqDlezwgFwy5jxa?=
 =?us-ascii?Q?GRyPicL+wJ6cQBDDVYLsCRioARHBvMXiZ4tVy50801c3fB2I7e/if5V3h3vM?=
 =?us-ascii?Q?ZV5rZT8qmFhsfUdFFOnQ+qSrY4VicbK0Jf9J8S8mgakPtRmyFQED2f6sMHIq?=
 =?us-ascii?Q?ouDRACZ7pWEttjqO3KFsF35aORbIABc1pbAz2r7XM4XJyAJQ2LbKDiUZy6MV?=
 =?us-ascii?Q?Y5BpZQ6kRLCcDsyEsL5OQHEBPHpi4bGxWLFEreUEqSHMwf/AiyPjHi6WSeKI?=
 =?us-ascii?Q?wimsq1JGHNSv49tsTFCeKIrUN3AorX5PzAMANKTPmsBbpHSihjPqLSf7AcaU?=
 =?us-ascii?Q?bAlqaNSG6lze1+/7j48lZi92mJiZfoQuLS0bAKIhWjamR7QaiMHphEUSSUN6?=
 =?us-ascii?Q?qXpJ+uUipYoDoEh3wNI3wa15wttjNWZQh3C64D1FXvrOv+5ZkrrKkGK2utf1?=
 =?us-ascii?Q?dWxzq/aYBXWGsVcXE8RwKIgby9GDdbnAeHRPVivbc0tw7JTXZPpeZC5wl3ns?=
 =?us-ascii?Q?ZtaInwXRGQhtQGEMapXxUoRG7bERtK7wIfUD9h67/MnOmp2ZXZjeM0W1K5D+?=
 =?us-ascii?Q?BF+Mvw6gKk/1PWBGNOsqqEWuVEMQDsFBY9BD0wfL?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a98615f7-1a74-444e-87df-08dda27539f7
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 08:04:12.5400
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q9A3dMtidd2MkgP83WT/jo36MTz9QcnwnoPUQT36OJ7eC3ADoIR5sSF7Qk3LTbRLwVGXfzuYysTZGWurtz7tEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR12MB9571

for_each_node_numadist() can lead to hard lockups on kernels built
without CONFIG_NUMA. For instance, the following was triggered by
sched_ext:

  watchdog: CPU5: Watchdog detected hard LOCKUP on cpu 5
  ...
  RIP: 0010:_find_first_and_bit+0x8/0x60
  ...
  Call Trace:
  <TASK>
   cpumask_any_and_distribute+0x49/0x80
   pick_idle_cpu_in_node+0xcf/0x140
   scx_bpf_pick_idle_cpu_node+0xaa/0x110
   bpf_prog_16ee5b1f077af006_pick_idle_cpu+0x57f/0x5de
   bpf_prog_df2ce5cfac58ce09_bpfland_select_cpu+0x37/0xf4
   bpf__sched_ext_ops_select_cpu+0x4b/0xb3

This happens because nearest_node_nodemask() always returns NUMA_NO_NODE
(-1) when CONFIG_NUMA is disabled, causing the loop to never terminate,
as the condition node >= MAX_NUMNODES is never satisfied.

Prevent this by handling NUMA_NO_NODE explicitly in the exit condition.

Fixes: f09177ca5f242 ("sched/topology: Introduce for_each_node_numadist() iterator")
Signed-off-by: Andrea Righi <arighi@nvidia.com>
---
 include/linux/topology.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/topology.h b/include/linux/topology.h
index cd6b4bdc9cfd3..095cda6dbf041 100644
--- a/include/linux/topology.h
+++ b/include/linux/topology.h
@@ -310,7 +310,7 @@ sched_numa_hop_mask(unsigned int node, unsigned int hops)
 #define for_each_node_numadist(node, unvisited)					\
 	for (int __start = (node),						\
 	     (node) = nearest_node_nodemask((__start), &(unvisited));		\
-	     (node) < MAX_NUMNODES;						\
+	     (node) < MAX_NUMNODES && (node) != NUMA_NO_NODE;			\
 	     node_clear((node), (unvisited)),					\
 	     (node) = nearest_node_nodemask((__start), &(unvisited)))
 
-- 
2.49.0

