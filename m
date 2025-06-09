Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2086.outbound.protection.outlook.com [40.107.93.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4BCF2566D2
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 11:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749468951; cv=fail; b=bQyGzWyyo5Sw9JM0+PDeaSLuRGlCVEUkSL4Opw8OiYSm9yGeMImIwmemHERDwW6IofXx7hmGfhX9rc3qExYX6ONIch5tP5HuMdYfOa0M263hmFO0t1ED29Fa6SrDbXwGQPpvcT9/9EWwagrpmNJXnXlxmUo6psl6NpvoLAh6tBw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749468951; c=relaxed/simple;
	bh=ZZ7x1VZFOcO4JYlC4JnJ4GQ5g13cetqgzL7sn9VwL2U=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Pk+q857SsTuTyRhbBYbGuBz8a+3RLo305jkgJBD42KKeFj/GAH16c2tWAdLYPzQBVCLEtgWqkYWFKGnko7e3y1gPiUZCeqN1/kfZBJkpFBzYuiyyKQpL51Azpkj8SwK1CHC5ssjIZNGkbufQdOuLo9buvJEJAw/BWib44arMZto=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=WApBON9+; arc=fail smtp.client-ip=40.107.93.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="WApBON9+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EkYmQGuV6v9ffMY7V/Rwua2R8ANi8uUSgPPi79D/cdJndV4IK9QNTuHY11wPEG7me9PQ4TmsW/nonL9Uj4VpN6BbSOWzxuGePCEVK7pDFWS/JPuqZfI+sPCaIYPErJg3DWw7Y6Oly01aFKiAnfExdKJilYJQUbiGw3X+YYdjfo1gUKr+IhFpuLfKEhfuSA20KJpinvpY/AX5s4YBD8cc5ErRnKfJf/AEhfKv/twOEhDhXYhXmj8OVQeTiDjtjRocMcqvAH+BfAQ1iDS37SFLMIfpqz1c03Wm5e7i+Yxga0ghJsre11Ell9AbWxfv2Eu403J4yB3I8m78ZZeJwFIwKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CPiDbhtsjpuC6cqciYztOPzwGfZiMrDldeiCoRuGyUo=;
 b=knnf/zEj7U2yzVJiXZgPgDZ2NroQklOzjHg+jD2TWMgnVTKAB6yM6tpTRJ+KEGGFSzTnZ+uFIArRWL89FTaqFIdDcsJDjYpepJSd5m01PaClP17zGNgtAdlj1Flw48JlLqIQhQtT7vWUVAjvaUZIJVm19SYP5EBFC2BxWjhxs2bTsrI/HInFiiqWLJCkJ/zeae+F35/wKNHsjNEZSlo9A63L1xF07ATiyjCWr8Cn4gL6+HRlPmKd0AzN7FgyXWzX8B2m+yNVZQNnWTY4tOJthKptQpVxZp84yftUPi3yDVmh2q1aqUzrWPJH7dFhVxEgw2HDGKH15n3Ed7DeiAyyHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CPiDbhtsjpuC6cqciYztOPzwGfZiMrDldeiCoRuGyUo=;
 b=WApBON9+faX92BAlzDcnvOwrvhzOALzgSJUqowMgLA0u42H9d82seTWd9Rg+OBw70BD44TWYsIDnG33JycNv1z+1MSu86wTFRRPbJcO2Zvx/b+yz4+78xfSrQlYHvurdNYC5X1cfvN+/a8t6KyCK5Ynd6o5smXIVgXUjsfKwVrxNEWbgz3JuRhM0afTRZAvmm3YNCDP6bekonyD4yNbuPlh1OUaaQ7vP2uF3T2l6iX/FQkZ/7NNnNpA2Dv6NZa1DNorubhSwZ6QJoxVPPNOf7XiAX0MS4ptv1CvgwTQp/45XAOUwpEpr7Fbl5w3fT3A3l6i5lGuix2bil3BNtBoDTA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by BL3PR12MB9051.namprd12.prod.outlook.com (2603:10b6:208:3ba::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Mon, 9 Jun
 2025 11:35:46 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::1b59:c8a2:4c00:8a2c]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::1b59:c8a2:4c00:8a2c%5]) with mapi id 15.20.8792.039; Mon, 9 Jun 2025
 11:35:46 +0000
From: Andrea Righi <arighi@nvidia.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: Tejun Heo <tj@kernel.org>,
	David Vernet <void@manifault.com>,
	Changwoo Min <changwoo@igalia.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] sched/topology: Fix for_each_node_numadist() lockup with !CONFIG_NUMA
Date: Mon,  9 Jun 2025 13:35:36 +0200
Message-ID: <20250609113536.29743-1-arighi@nvidia.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MI1P293CA0007.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:2::18) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|BL3PR12MB9051:EE_
X-MS-Office365-Filtering-Correlation-Id: aade88d5-0cd5-4939-901c-08dda749c6cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xqRTlYNeM2mHdRGdFKq7FnBzmmOjw2aVOMUv98Uh5E0S+OUsqkrJEy3QjCFX?=
 =?us-ascii?Q?/oY+Iu1TDgrERmht6O7VJzOueHjJ6Ulpm3RAoeHho8DrJyzyFPJH/i8cv/nd?=
 =?us-ascii?Q?hUe0vP7gh6XYXz/yXw0i63ymILWaibWd8LeuUYpaNCRP3Eqm0S82DtUrWUdv?=
 =?us-ascii?Q?8K0JooEHFGRAM1uBJ0oKmBeq7zW63Mgrf3eUjlvZuJi29ExD6WYnKNElEXmk?=
 =?us-ascii?Q?4FVAdlkbQzdLbDGHFkfLpJIN6XBGYRm/vV7HZqAJVcrseuyXIzE7t5pHjF5o?=
 =?us-ascii?Q?azClbhhsSClYIgLKN+XjS6uwtyEnajhAsyK0hjawd+8OxfQ5gx47EFRXewnv?=
 =?us-ascii?Q?cM3ZEbzIaHABNS4kYMWpqZz9FkB5zNlXBeufbUfaTv18nTXa3ppmpdWLNfE4?=
 =?us-ascii?Q?olRWAXw9+UNSak3qHIEaX7TJc/IYK4JUCbSdF9MxWFJ6UoCwocm11OGj0HM/?=
 =?us-ascii?Q?As4534NYHmswIt/+SqZdCq7/s2kO7RewS0n8lg+kU4QjgbYY3EXPu+Nsd5r5?=
 =?us-ascii?Q?vpTNfbO/cAmn9g5sQbecMMsDRogv08mBu0kWuZN/5yEaZBVZFufMuuK/XfAa?=
 =?us-ascii?Q?b8UWrQK8g+T5MFxLw+m+IjKDj+hlvPnvI06YfvDo7v2YqT1p2fPVncqM5fx7?=
 =?us-ascii?Q?CXpb4kTd7MtKunA9CBMPUiTd2rRJDmK3rlMoHwi+j690LZQjvst9cTNvCrFT?=
 =?us-ascii?Q?PHp4AxzRNOypqYWLrqw7PzKrf0G6unnzH46ty/C7JR0ipJmdsVtxEPlkWFVn?=
 =?us-ascii?Q?cWSlWgzTcoTHZEnrtHn3iZhWmxzIok9ryB8QKrru1KJT0PRzThHEJqca9z/j?=
 =?us-ascii?Q?R9xy94QJOy9xmLzMzUhoBx25Y7UF2i1CNRL+/tsd6NJo3s4bB8ZVhk3aXMDX?=
 =?us-ascii?Q?uK/QVbwVnDTFBQdI5+GBuVSX9M6p573RbIlWQnRMtEf4akUgug9BK6g5ohSF?=
 =?us-ascii?Q?6m1FW7t8A200TkCf2sN+w256o82r8rcJFtZGzinrfgN+3mPDdGDYlx93YxM6?=
 =?us-ascii?Q?YwGa+bgMK8+ppmLv+6VrH2C4RssV61nmpm70scxd13ySMM23CwaXK88v1TuA?=
 =?us-ascii?Q?zYdsWtAptFffdRzZvNEWS/BHpDxqWEKr3/2K3ZmdWhTxvearXvM5XD8SsGYd?=
 =?us-ascii?Q?UbLUZKZw/FmaSji6j06xpYjw0HN+6QK/lGlldJo9zAKNdeWep7haSMnyczON?=
 =?us-ascii?Q?QhGoWAw/2zUYkIuPxcX7YEQ9m3GXBpa0LjXv1fCrX0hWMZvXRSwbadxxq44Z?=
 =?us-ascii?Q?KEbrG7j1Q6aBY79jscqFurI68K+u/HwgfPe1Yrr01ALMD2vuuiAfwJvUx2/j?=
 =?us-ascii?Q?03fg49+8s617UKWIU/7wR4kEBvqZ5+GYuGvhAy3F27Ps9wSG0RZbyoVATGK4?=
 =?us-ascii?Q?kadVpPYkThK6mHWImOnI4HOT1k0XZ9Q2yBqot384QTOFac6NWsTs8LTHwUg+?=
 =?us-ascii?Q?BjPRniHWdUk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?aJsaIdoQfmSoNL0cky09xgZppKnfJaAmpzAXv74GJ7n9nhWQ7o2nr90kgt+7?=
 =?us-ascii?Q?alWcMrUwIMiuWeVu0dFDcFIIJh7e+3BDbZ76cfCzYYGfWmnoW8aw/pkksrRF?=
 =?us-ascii?Q?xzYpNSrxq7zJ0Hn40io03/mdT0Xx68IWF+hVj+03NUsokrVGWMHt9OudyJsX?=
 =?us-ascii?Q?SiTknhHcpKDbBIf0XE1t4qKPhunPztfFOdSCVwjdcdmMOGyT5L8AWoZCMVZL?=
 =?us-ascii?Q?0ON3Xm4jNLkT1iw4WwPFIA7VDZXNEs0I7OKYgm4PzabpLtqdOVrTJH/9B92K?=
 =?us-ascii?Q?lUeKdDSacQuvcodDelF3ZlGdnCA1mklH55WF20lXlmRG5otFibfiL/VtdInG?=
 =?us-ascii?Q?iz0BL6emZ1Zz1IkvcBfyVVPPW2AUCCQHH/WRAVJBLNei5Tk+aBjfVDIClqbY?=
 =?us-ascii?Q?YEo4Htfas41I0NER+qdeuihSquqn+imjfeY0APL3+/CwFqReaI1U7cDZ8UI8?=
 =?us-ascii?Q?4PG5d9OUZtqww9FsCfhv54n2A3D8kGfeBI9nnrD3Ukhlc7uM48y0GUsvpYdg?=
 =?us-ascii?Q?ZKsuDiz2DwxioR5fzYRy/9enomKm0MCxoLSSJiI+GLI11WFWOMU5EckrWMby?=
 =?us-ascii?Q?xP3nb21FPK5syoaz6iY26z8iwP0cdWO0BRKrlBSlfD1Ks5mFDmkIjSxj/EiP?=
 =?us-ascii?Q?44hLu0+t4Czw5Pa3DksNqPk9GxVLnVq6gvqOffp2wh0WYU/u/uNKndjlRZxM?=
 =?us-ascii?Q?NASCUmyjY6IkE23afpoxPogy9IQ0mUbV+p/ApGpYZ8rzZApB1j70XwoQlmbU?=
 =?us-ascii?Q?GPxt6CjIbdFaf30e09QeEKyOre7DWM5t+uIObsjGm0jnnASdOSzpFv8vksp5?=
 =?us-ascii?Q?vttidT6avs98C79exOgpCJFyI/k+ceRveaDZB0DE4UEed8vrZ7yxmeFtf11I?=
 =?us-ascii?Q?jNkkm8PZDn+5/uiLuo/amBM+znJ4+1ip7FzelEMzW/N5k3UrDEY9assCI+Ng?=
 =?us-ascii?Q?EshhGIbe3HoysDmZ5RPNAOdFEU7GunP3iSzdcoZUD+At756GNSgX9RHeKquD?=
 =?us-ascii?Q?Cq5MAEH3egX5o/7eDg5wZFtqPx5LpDAUNgLOGTj3F6i5g4ZS785lbF0SDVsL?=
 =?us-ascii?Q?enxsP9NUlhP83fqh1AYvKnBTAkZ/D5PwmxpTmJI1wINJEIDAZHATCScsJgcB?=
 =?us-ascii?Q?Gg8nsTt+nMkVcgoLBuqmw8dVYEZSuppdopeglEJTIslocj2j1/Zb+8PdsoBp?=
 =?us-ascii?Q?aFQNQIxlyq9CkdN3Pd5GTHfyIbm1keSFDxvka+VahVYy3zhLRELgYu05n1Us?=
 =?us-ascii?Q?8chNsWPMXBffX/44qj5+eM688wg7Z8qBGw8rFNx+/8MyqLRPHTU7djyc+7S6?=
 =?us-ascii?Q?m8TJUDbbtCSbKa6W7ZD8LS3cRzKdwS8ikr6TtZ5bZ2vdk597lKQ++YGzFtr3?=
 =?us-ascii?Q?qMzj7P+p2EudsutGCInzRFsnRzH8vsWIm6/x/WQ9DCYT5vDg5h4zfzkd62Z/?=
 =?us-ascii?Q?B5xMWBPPYxmFmqB8AIUKHgdvmM0v+UAoLzos9uL3JBCplK0jd/XSa+fk4rZK?=
 =?us-ascii?Q?YHEEyuAqzvfoX7YsaAurz/kHhbcI5dhyt1nGHJbyeA8kYXPBfJWH8+eSzRba?=
 =?us-ascii?Q?/BNoK5XSJeFUJWsR3R1AHgqMniYuqeaJ8YSnbOF1?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aade88d5-0cd5-4939-901c-08dda749c6cd
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 11:35:46.7832
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JiLuvXlt8Lv/kBeijtSGXdODePMHDOH3LlvYHsxNJE+XVcpB+Zw+TKJSxf5Vfx43CGtUcv5LWtmDwV8sNrU5SA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB9051

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

Prevent this by providing a stub implementation based on
for_each_node_mask() when CONFIG_NUMA is disabled, which can safely
processes the single available node while still honoring the unvisited
nodemask.

Fixes: f09177ca5f242 ("sched/topology: Introduce for_each_node_numadist() iterator")
Signed-off-by: Andrea Righi <arighi@nvidia.com>
---
 include/linux/topology.h | 5 +++++
 1 file changed, 5 insertions(+)

Changes in v2:
 - Provide a stub implementation for the !CONFIG_NUMA case
 - Link to v1: https://lore.kernel.org/all/20250603080402.170601-1-arighi@nvidia.com/

diff --git a/include/linux/topology.h b/include/linux/topology.h
index 33b7fda97d390..97c4f5fc75038 100644
--- a/include/linux/topology.h
+++ b/include/linux/topology.h
@@ -304,12 +304,17 @@ sched_numa_hop_mask(unsigned int node, unsigned int hops)
  *
  * Requires rcu_lock to be held.
  */
+#ifdef CONFIG_NUMA
 #define for_each_node_numadist(node, unvisited)					\
 	for (int __start = (node),						\
 	     (node) = nearest_node_nodemask((__start), &(unvisited));		\
 	     (node) < MAX_NUMNODES;						\
 	     node_clear((node), (unvisited)),					\
 	     (node) = nearest_node_nodemask((__start), &(unvisited)))
+#else
+#define for_each_node_numadist(node, unvisited)					\
+	for_each_node_mask((node), (unvisited))
+#endif
 
 /**
  * for_each_numa_hop_mask - iterate over cpumasks of increasing NUMA distance
-- 
2.49.0

