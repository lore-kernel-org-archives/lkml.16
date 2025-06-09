Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2077.outbound.protection.outlook.com [40.107.212.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EBDF20FABA
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 15:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.212.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749483813; cv=fail; b=Xye/v4auwDb5w672yuSWHm6sAwU2Gn+j32c1AgZuHUuxTus1Pja8j9VdI5lmqkk8D+V06XYoRcTsHAYX6VQgJq71UqR7Y1EFi07aZWpsS3532lqwtuSToIzPT2Evky5Mix3Fq83zxW30c9/n7rC2z76bn92qLQYDTzGJg0KNRj8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749483813; c=relaxed/simple;
	bh=+xzFD/k/TQYQZWS1lgzRmvcKL6ZV7AqElNRb3sFOkGk=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Z2l2Mq50p0prn12XqMpiygoIXXu6eLwTG69x/aLevLIRv4U1QxmctyNPmj99mq1KRf3FDtcnN3WcOGuMXsy9lxpUJ/YWdErmVQEBavWIVvbwcGtz68AVFX8FNnFMfsA2JKpl1ruguF9uLxsHaeAsM3CYbMbkqkzVRQ0EjTP8Nbo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=uo8Lm+vi; arc=fail smtp.client-ip=40.107.212.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="uo8Lm+vi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sZ1xryRxl9xSfNWGsbiJW8LPKpMYDF5kMPrlek6Abwjf6Sov+lQaHrWmWatotjoNxILHD/5C2qIuPnWGKskm02ERQ0l+9Iyq9mNiZsQIhBLLS7Bg9nx2u3/su040JoxlU2HTmmF2obO2EqzLEutz04nQcpuwVvbzgiRgUyzS6WLuMeoboEe51pfjLQQSbpChwppZn+2AQN5Qu/HZ1d8DPDFAMR6J363TYVtoB+pHjGSPiATAe2iTh27u1C/mDENDmFdnlBfg/sSwA3yawiECHDUtP3NS5OqynWBsqOl36tKKmPCsEIaWKaGzi2SLjPOeRvAa0wlIX6UxN/62gjtqJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/EBhsvSHIvePLMsj/CltPK2FSsqchgD3d7pvzQ1bgwA=;
 b=pfrt1LJ34Z+pD8+ozoyBVp9wmzRtmeItwQQOTRWOReK/OcqDRqpWU2s5oK/QU125mkur03rg26tvROp2cIsg5AzIyUhe82k5JESR6wMORvBMWWhx+ISBGPGgy0yyhWcEQjQCFDPHRa5wIJNv0DhQFuMacv061KC9XwgoFJk8qoWmTIK+cIZY5YonPqmkeuxlbSw5NaWhXi8OnQaeXckIhjMVI02h2XdowCeG4UTnTQ3zYoEx0GPO0/FclhNhIIqvNNzBAdUYMGARtwuMXrrxoAkPwg2elSrEa/Py2Z6FrUQ8SaY+SSXSgCDFCPPk0eGc6AN5uwBIiHfUphKVKZKVyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/EBhsvSHIvePLMsj/CltPK2FSsqchgD3d7pvzQ1bgwA=;
 b=uo8Lm+vij1jU9bGZ1f+G73ZG8NqY/mRWHzGrAOEJzY6rZasaKXHhvYW/paiTL0ZMEeRueZ+DAZvfxe7uA7rzJaqqPSB7QbmDoVl/6i0AoaQ0dtbMnUfuukgfb+ywP3cewgWcpTXZL5D/xBDNVTuBMArTmSXZ+PE2CVdy8t7L0gGCRbkKksU7wFRg3O4giALEKBXjdZhiTRsERRBasQL+CETtc6KG070FqzXb5epJZnXFo7Arix/zMZn2FrO/Ix1Dxv4doWw01I8xdujyRLRGf3Pt+uH/x/srLjXyOaqioWHZExpWFJgpluUrChXU2LVDVIGqbWJStNO9mdOLd2OyYg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by DS0PR12MB7779.namprd12.prod.outlook.com (2603:10b6:8:150::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.35; Mon, 9 Jun
 2025 15:43:28 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::1b59:c8a2:4c00:8a2c]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::1b59:c8a2:4c00:8a2c%5]) with mapi id 15.20.8792.039; Mon, 9 Jun 2025
 15:43:27 +0000
From: Andrea Righi <arighi@nvidia.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: Tejun Heo <tj@kernel.org>,
	David Vernet <void@manifault.com>,
	Changwoo Min <changwoo@igalia.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] sched/topology: Fix for_each_node_numadist() lockup with !CONFIG_NUMA
Date: Mon,  9 Jun 2025 17:43:20 +0200
Message-ID: <20250609154320.15732-1-arighi@nvidia.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MI1P293CA0019.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:3::16) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|DS0PR12MB7779:EE_
X-MS-Office365-Filtering-Correlation-Id: e040df34-204b-40e0-9a5a-08dda76c6098
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hp5lOClsDuYpPlcPnbLlPN6AsbPdk+GbEQEfcVmi/noq7bnINkeiT8qTGvrC?=
 =?us-ascii?Q?4IUA4V3GbCQOLndDyuHScg3ZvTyHW0OkIUON48SYy80TJH8hU6D563XlqZgq?=
 =?us-ascii?Q?Kw/o4bCWYxeNOgNs23A6YuU6KIdRNQzorrsdqy2ukM3l1nohJHJKR9bEVHzt?=
 =?us-ascii?Q?7agYQVpU1ODl6BeJF1BcE8izQtFK6O4UBBBxhcn1aycc/oUEhW6CTx/TnEFQ?=
 =?us-ascii?Q?1mxZtUx9dBIm2812ZRwC8+Woas6s5NYney1uYImFbxuFfgWB0duSj2n/r8PB?=
 =?us-ascii?Q?gRvRPeL54ivonxRGeOt2qFWJN4Qjx6AvpVw+TRHK7AKe3oN74K1qocYnkCGT?=
 =?us-ascii?Q?8YoQ0cgXtoVLlQ0oTL38+Ms9raeaGnS+EIBfkvqaV4CRJomIPQZNVrRpJ4Pl?=
 =?us-ascii?Q?qUzQdfQ+NywWYlBKFWWMmbNujfWh4aypJYw/Uwm0S4npSPMeWSFHGaS8r7tl?=
 =?us-ascii?Q?z3sboiv8p3F7eVqphzWIJDOm5X86gGU0+GtMmRjy3TZmZ5GgmU4Gf/cKR9OA?=
 =?us-ascii?Q?XzzaR2DM3kDH2ym2mR0FC0hGjDz9/GTg1E5dI6sCHGZzNH0rUikVWkOckVa9?=
 =?us-ascii?Q?orm9rBCrhVC/GGRHbqrA5pHFOr04h9KGfzxywIPRAtAM/JA4ynGDggLLeFuB?=
 =?us-ascii?Q?OdtJg9oQ9mv5G8XSutkHYydTLV/R/cDFM641ROYF2LvpSlGk/1jUwehCdlt+?=
 =?us-ascii?Q?dRKjeKaYNAfYKG++XfxSS4KJ/uwubOW1bBkisi12AZ2+13j/CDmw514J9cyV?=
 =?us-ascii?Q?sPRqcFl2uWIR89R7IEamnPNC1aQuppTg1pXIUBpUBSGfZD5yu3vxvaOdivwQ?=
 =?us-ascii?Q?osXnILamdSdAACTgVD+gtMW66fvw5jdShRWAB1df4Y8Dnf4wGoUDYTIcx1OY?=
 =?us-ascii?Q?Lo8ck79fy40wYU82WyNWI81vF+BCeWCPgsPRcWh+nqvpSWytAZPpIH+Kpvlm?=
 =?us-ascii?Q?KFYKhF+Hyk4j4qud4fZLCCKrQ1bGUi2YkifB6geZWS1L7SmDGGPniKMcb5hV?=
 =?us-ascii?Q?jZalTegCPFRoYxnUbXNb1cKoPoiE3O4RgAF3yqFt6N5tNjyf1+VeSp9PPWhG?=
 =?us-ascii?Q?OxndXKnGa6i3ReJN3pDa8R2YbF7flkHpkfHn+MQVerdqGJ/xNx28dXbcosVl?=
 =?us-ascii?Q?/0lplkDJfCPVXhrXFTVerm4FoU5SnqYlnF/ma53rGnDs99/Os/KHPhI3NW1r?=
 =?us-ascii?Q?7wYRuKrZbP29K/QGvvCI04A8/3SZU+0RQJbv90+cfLEifWy6QiYFMNMZb4wt?=
 =?us-ascii?Q?Wq9CCrWfLtyKudjFOL/xWoN2Cy7zgNnP/uCXACYvNcsUANsVX14+shLQr8X/?=
 =?us-ascii?Q?uPKR6gMllXMuDMAnkgJdEBW01AVYJe5kKp3RTFRMkRub7NNWUTkMdv7uhxuj?=
 =?us-ascii?Q?QiUyughiqdGYekvJxv0in+zpXrsoH/cSWEAlHbvtWBs6BWKsaUrsCm6vCJva?=
 =?us-ascii?Q?WTWwW1c4BDs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3pSDzIlDYhyIco5bpsSnQqDih8OGAKelSw5blEtaPVM/BmSGTYtdX+QFL5it?=
 =?us-ascii?Q?Z9ZlNYdBYuEVfzESs0c3ZkmvM1Qa4/Y4+FHST/uzZwTo7l2M2OXWx5fX0MjX?=
 =?us-ascii?Q?rm3NnnzCyrSyT2urzqWm3U5ZYdeL0hVgzAP2Akbw90Dswpt6fO4lqn3SZgzg?=
 =?us-ascii?Q?0Z7vAzoERsHlktuGLahZf8QUhiwBEEfIdTUC/pC51sFL5GnFqSIWhPRb5dpX?=
 =?us-ascii?Q?Epx8zrYRWkSphqqe4W/lDEdj0RjX8KPOAw18rq2HuwIqy6LKhOKEGtWj+Fai?=
 =?us-ascii?Q?aBdhQKDMC+HRJISeDRoyfXp0JIrBd9CsiKvHo4wUliVaq+K6K9+H8aJ/fiq4?=
 =?us-ascii?Q?/sy2zbg5k21mRVnzUNhbWvBAmG1EhJ2vmCtesHiLsBS35wnlMdPfxbbibItU?=
 =?us-ascii?Q?31ygX7/ktHnwPybiPOD3LAyf6rGoDB1yaW3r6qX5zdMK2Q6c/9Xw6pOS0sdx?=
 =?us-ascii?Q?yHFGcCxZjsWZd6IHBvX2ZnkLJDOB+ijbVivpJ54Wm0k0RfnH3HOHWKelhV8o?=
 =?us-ascii?Q?Jz1Ky8UdNbAZjIrzGqH6WJs/MKRbTQRDfYe1LzO/juhVWwmKtJVlajdXhRg1?=
 =?us-ascii?Q?YSFJVAPTFtPE8BEHs8io6ri/SU9CUozXQ6EknzJl7nsNUlLxw0NeUY2wjGZm?=
 =?us-ascii?Q?RQ0RXprYJYMvLFOswYGDMfoj1MrcfwxTQdEyectJDlVWC7cK8OvuqhuoMcVv?=
 =?us-ascii?Q?+R1qs3HIgos2HACQSIKaIgkafQa5oRluAD/g8PPcSctGYuEmZZVnA4bZ7o9L?=
 =?us-ascii?Q?RHMnR1NSRrQKC+JeC/nbr1eV/4NOBwZ+JnjuwJVHU8Tr/WJPjcsasa5CItxH?=
 =?us-ascii?Q?bX8iADtYMfaMeyi7kpZ6uR2XNNwwr+WTrm0+PmxlnNtYTSRx/8rbio90aZh7?=
 =?us-ascii?Q?iecs8r5apoTlLq7v+zh36Rp7vO3ONRt2KLUfCB3/PdjiT2/fQjm7NRpENz36?=
 =?us-ascii?Q?476RyDYoQvOAATE5yAw2+WADfAg7OfKvC3Rjh81Pm+IiNkvjAK4H06Qz2UjH?=
 =?us-ascii?Q?9/ZerrPq4aGRx5fcMgktCrUBR9xoS62HjYo5QwNO3mH2g177jiCQ2uBzoMfu?=
 =?us-ascii?Q?KAip7g9Y+dplYkWLobKMX2WZox+VHSFgrTMtsyDd3KgIQEY3omnX97zRvpWl?=
 =?us-ascii?Q?khEmR6R/7fYIKuZD7vtlVZ+SIGbK2pWVKMBizvW6mKyYo1vndplOZOwUkGvn?=
 =?us-ascii?Q?T3L6zhmLCZDHyhI4H0T9NUEN9gFH0vodhaLpNQ37DHeVJeAoeD50RMtpTrKT?=
 =?us-ascii?Q?e7Rru40ttwErPBMtbvZMSOYRyO6XqvyUuJrh9g1f60ZuKaRu2n8PVp81obaK?=
 =?us-ascii?Q?N/SLLy+IVu+3vzWtQ6LMrKN2IEdcnWA6nHTrwoVh3PwDNO2u3JOVHB6pT0ZC?=
 =?us-ascii?Q?9EA4Lb3tSx0h1CcEXbjt6+sAkILG17RPmJEAodD+6c4+vJNwZTMVQB9aERp+?=
 =?us-ascii?Q?1u0HuGzzkv4+PkD/0oGsXh+UOWWL3dS8eZsZ9oqoSp9J53hCY+X89tlsrCBx?=
 =?us-ascii?Q?Qf9WIbd3idWwt+VhZAN5y+kN+vwhPKqXqz6pXXErqYLSajWNswEAVqfs7pRD?=
 =?us-ascii?Q?5EKbkl0Ywrmtdk+8Ez7rVy7I9uknX9fmSeSRAGw7?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e040df34-204b-40e0-9a5a-08dda76c6098
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 15:43:27.6994
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7abkh1tfnLRBKdizI8cya0O58b7pMd1dznZJIWkns5IPwbKuJyOy3gXBQJTqchwY8y10F0kQ8ilOIBmzySKh1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7779

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
for_each_node_mask() when CONFIG_NUMA is disabled, which safely
processes the single available node while still honoring the unvisited
nodemask.

Also extend this optimization to the case where MAX_NUMNODES == 1, as
suggested by Yury.

Fixes: f09177ca5f242 ("sched/topology: Introduce for_each_node_numadist() iterator")
Acked-by: Yury Norov [NVIDIA] <yury.norov@gmail.com>
Signed-off-by: Andrea Righi <arighi@nvidia.com>
---
 include/linux/topology.h | 5 +++++
 1 file changed, 5 insertions(+)

Changes in v3:
 - Extend optimization to MAX_NUMNODES == 1, as per Yury
 - Link to v2: https://lore.kernel.org/all/20250609113536.29743-1-arighi@nvidia.com/

Changes in v2:
 - Provide a stub implementation for the !CONFIG_NUMA case
 - Link to v1: https://lore.kernel.org/all/20250603080402.170601-1-arighi@nvidia.com/

diff --git a/include/linux/topology.h b/include/linux/topology.h
index 33b7fda97d390..64b81a0aaf449 100644
--- a/include/linux/topology.h
+++ b/include/linux/topology.h
@@ -304,12 +304,17 @@ sched_numa_hop_mask(unsigned int node, unsigned int hops)
  *
  * Requires rcu_lock to be held.
  */
+#if defined(CONFIG_NUMA) && (MAX_NUMNODES > 1)
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

