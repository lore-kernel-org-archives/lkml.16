Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2052.outbound.protection.outlook.com [40.107.212.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6982B13AA53
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 06:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.212.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751438640; cv=fail; b=PVhqvrgzMAkBeDOf4i1zDuRQORRvSSOLEOeCNzwpqAVmAG1AmAEOSic8kiNTbU1XZF/iCgIcJV5Vctd87TbISpWttQjhyV6yH6Evn6N6zuKwPQ7Y/VQg6xkwpkoPsdtJa3dAD2796qg+9zsoaJFkt+hhaAijPZOgt9WrXkJNEJ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751438640; c=relaxed/simple;
	bh=wU0QzJ5Tst5hJThz2nARR0Y908mjcbkVtQyMw4vzGwM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=e8skAkQxXIaVHWL3Hqf40YMBD/cAjCUZUzu0ZRhCaH0FrRnxOVZPsH8DhVfp5yVBEthV9rFUdWdM3sjA6VbrUvQA+O6mNKoN/2Br4iNpkL0AG6un+4inTe9yREQnvSxDG17ZMbaT9yM3OnD70V+6shbLPVSAb0zWhXzG4fnt3RI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=t6H92Hmu; arc=fail smtp.client-ip=40.107.212.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="t6H92Hmu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FS3S39DDA8QGPSHIa3iguuN1brIVuz8xLwSogzrXDmtMOlPL0oMerfPziEav5EAfNFJQWLlSLCh+XWau/rwQLVawPZ033Q6D1Gi04vn/70w3YhGIPe1BrCZmkK42GQYxyI4+jISTalAGm0ruRE/uo0mhh8OUFDXsVYD+4YRGUmdFgS2sELZwGOsH62Z2CcrK3AKxwLVYd5l9syvoNQ9HeDPRNfXUXnXa26JWS2PAyUspNAqqsAA9UV8uSBhzSf/oIimidDskYtN4rzSIAIocfPNfcHYzqSbVF5c/vbRVMYT1yCJkMAQj30F/Q4uXkagYl0sXviTBF7scY2a4TmMnIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xr1OM5nlOMFKhzGxXwyq1gvga4z9brwB7dukGYN/ru4=;
 b=mQIvl8/MX68Va34zktbLbrMi9mtxVQBDLtlC5dvF4pb2dZX4rnURzrE4fQuw9JF7jUNfZ8NGTrTPjvRVsuEPIH31kq+faEqH6tJELGoW8zPy6ZSmW6z8iyT2A8eS55M2alymdN3Iyf7VzEfbO9EBbsGizewFnxadb6qFmJDG5q7CDSRuOgW8+v9WFAsz74q3NL+FndwYh1waeh1bP6yclY6okK6xx55SVew+MGMawk+JErsoobEc64xWkuNwGLlNOm6wxz9ZTlArhKSKck3Q1wPLsxBrHCmzSFr4aSUju2no1fVsTHStaNgeZRForZDszKxE/xeiRz8YjjE2IWZ1iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux-foundation.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xr1OM5nlOMFKhzGxXwyq1gvga4z9brwB7dukGYN/ru4=;
 b=t6H92HmutRIMfC3IMSuVbzQ7oF2z/n+yLHnHDfmRTKxMAkCJBkPz6d/dDfDt8r6STh3s43BVVzyT/FcMiM5S8ZrfLDzYowIxAaSflN89Qm/ejD4Rgp+JMbj2+AvX3HP1BPq2dBCmGpvIOf6tlJ6cTBKcogh3M3s6errY0VTSUDg=
Received: from BN1PR10CA0023.namprd10.prod.outlook.com (2603:10b6:408:e0::28)
 by DS7PR12MB6261.namprd12.prod.outlook.com (2603:10b6:8:97::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.31; Wed, 2 Jul
 2025 06:43:52 +0000
Received: from BN1PEPF0000467F.namprd03.prod.outlook.com
 (2603:10b6:408:e0:cafe::73) by BN1PR10CA0023.outlook.office365.com
 (2603:10b6:408:e0::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.19 via Frontend Transport; Wed,
 2 Jul 2025 06:43:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF0000467F.mail.protection.outlook.com (10.167.243.84) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.15 via Frontend Transport; Wed, 2 Jul 2025 06:43:52 +0000
Received: from BLRRKODSARA.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 2 Jul
 2025 01:43:49 -0500
From: Raghavendra K T <raghavendra.kt@amd.com>
To: <raghavendra.kt@amd.com>
CC: <akpm@linux-foundation.org>, <urezki@gmail.com>,
	<linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>
Subject: [PATCH] lib/test_vmalloc.c: introduce xfail for failing tests
Date: Wed, 2 Jul 2025 06:43:19 +0000
Message-ID: <20250702064319.885-1-raghavendra.kt@amd.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0000467F:EE_|DS7PR12MB6261:EE_
X-MS-Office365-Filtering-Correlation-Id: b8189ed5-c860-42c8-e9c5-08ddb933cefc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?unFarqRomjXnnNvkKFo2/BiFdAxC8GYL0OtusCVZ7k1iL9voeh2939ljHqZE?=
 =?us-ascii?Q?odFhv7pNKWRsOmOSpVxcvq4rb2SXzgbxRik0Dzul/n1NkvigXCFkUse28tDY?=
 =?us-ascii?Q?Neq4/6FK8JpKr5i9SsCLpv+m7NTUHF2ASm2Dhb+YuqdFoMFhqvTWfUZXy4nc?=
 =?us-ascii?Q?My2qG+NNSgSukKbMmv+jwuVXTrmJNfYc5aE9Me0b8JYFGqhBEGZBDJVDGD7V?=
 =?us-ascii?Q?AqYuyfoJ9Zu0tys/hzxVakF2aTIAjn6I5t4yPF2f6iM2Nn6HJ474x+UwNPXI?=
 =?us-ascii?Q?q9OtwQxnXR6fZToKqFKzWGn9pJ/cYqIPyjxbe7iEV1zVJPh+UDPbEzIYB6Sl?=
 =?us-ascii?Q?ZLa5A57rvWQXiUBXSrxizXmrGL9UOR+sKGp+Rgn5KMQuoERqWokxR2or7DPN?=
 =?us-ascii?Q?yKQWoQWArDJw6YiYLtb56IzEyJDCiztCPzP3qlwjrFUQ99RKD38nS8nJ7uqq?=
 =?us-ascii?Q?TWm341+K9ij7O84NdZuX+A3HhEeKlT8GzIxFr/xr+gM2WX8ZrWCUICALuM3Y?=
 =?us-ascii?Q?qX+81Mt+Qmxdf6bqKqetoNu7hgsjAYMrRmjnJRxim9XDHeQNM3o+uE78AA0/?=
 =?us-ascii?Q?eSCPjgyKBUt7FQ/P8nymOhYmdDSST3PyjCV6Ulbzlq7OG/cd5RPzhPptKjVT?=
 =?us-ascii?Q?iCd57DrORNYsmlHm1gTenDiSCVpWgOSt1la4hyGzKN+D6f7BtJ/cxeuADKsP?=
 =?us-ascii?Q?x0n1ja7kflwISvPbFAS0cA4u3vLf9NAK2bsRdS5rLMK6MQaxFDG3aFp0Fgv9?=
 =?us-ascii?Q?te4FwvIAJ+aCW5R2JXO5XW7mnP6HVNB/GR4hQHb8rH3F3dAmKvt0IFNkiqps?=
 =?us-ascii?Q?jl/RqPUaLAZTt+jRKTPMpCHU5t6QE7BD/HsTo0t+woxQ2xGAmazCyWMOn21r?=
 =?us-ascii?Q?hJiF/SElhwU6s5Tm7E4GrpKZSjWy2kMjyflrw0GwV/bAE3YnPzT4P2XUZE3l?=
 =?us-ascii?Q?x1gTkYi7sx2YhQgjABEe531C+0dP9H/UYGem9aSEMlYCSg+ixliZe8OWbSJF?=
 =?us-ascii?Q?bQlPIsXb7qrEbXgXKxtDWRa9kpeyBsJ9wDekJKiinz+FzkqmVzA1jTd5/yjL?=
 =?us-ascii?Q?5dl/lYlq/y5vHbOGNHQuHcc7daBhZ7RQyhSYO8O8ChH6nXFU1XMrAgwwf0hR?=
 =?us-ascii?Q?xZWNiQcQHYlOSsxplYYWlZdG+wEpxDB1j26MkQTwUDxN09MYeWjhiEOxTJiJ?=
 =?us-ascii?Q?PpBvZwLN8Z27wihrk69jB/bjxXT/KTmBwz5pGfEDNdp9YD7+9W4m/feUycNN?=
 =?us-ascii?Q?e8XaDgc2XZm+t7XcfBr75mkbkst0O2hZo32QrtyjKzT/vEBcobjRt33WPLqZ?=
 =?us-ascii?Q?LF0v+p6YIEs3EAMX3g20BKnvLBmSOOscKQmP+Hi+w2WDO81so/fa5zBqpYAX?=
 =?us-ascii?Q?Vbu0VhjXLD+sJv1/55Je+r5+OsjlGU6ewCwH5qjaQFIQw50XQZWGVNvK/4GZ?=
 =?us-ascii?Q?aqCgP+C7AfSy6AJGgflQVAoSBFgX0GyFXQopxuFU4vqZOR2rOnyHDXP0699l?=
 =?us-ascii?Q?3rY9b38DN863nwYz5aqdFLzbnoMU9BWhTwmc?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 06:43:52.3215
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b8189ed5-c860-42c8-e9c5-08ddb933cefc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF0000467F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6261

The test align_shift_alloc_test is expected to fail.
Reporting the test as fail confuses to be a genuine failure.
Introduce widely used xfail sematics to address the issue.

Note: a warn_alloc dump similar to below is still expected:

 Call Trace:
  <TASK>
  dump_stack_lvl+0x64/0x80
  warn_alloc+0x137/0x1b0
  ? __get_vm_area_node+0x134/0x140

Snippet of dmesg after change:

Summary: random_size_align_alloc_test passed: 1 failed: 0 xfailed: 0 ..
Summary: align_shift_alloc_test passed: 0 failed: 0 xfailed: 1 ..
Summary: pcpu_alloc_test passed: 1 failed: 0 xfailed: 0 ..

Signed-off-by: Raghavendra K T <raghavendra.kt@amd.com>
---
 lib/test_vmalloc.c | 36 +++++++++++++++++++++---------------
 1 file changed, 21 insertions(+), 15 deletions(-)

diff --git a/lib/test_vmalloc.c b/lib/test_vmalloc.c
index 1b0b59549aaf..649f352e2046 100644
--- a/lib/test_vmalloc.c
+++ b/lib/test_vmalloc.c
@@ -396,25 +396,27 @@ vm_map_ram_test(void)
 struct test_case_desc {
 	const char *test_name;
 	int (*test_func)(void);
+	bool xfail;
 };
 
 static struct test_case_desc test_case_array[] = {
-	{ "fix_size_alloc_test", fix_size_alloc_test },
-	{ "full_fit_alloc_test", full_fit_alloc_test },
-	{ "long_busy_list_alloc_test", long_busy_list_alloc_test },
-	{ "random_size_alloc_test", random_size_alloc_test },
-	{ "fix_align_alloc_test", fix_align_alloc_test },
-	{ "random_size_align_alloc_test", random_size_align_alloc_test },
-	{ "align_shift_alloc_test", align_shift_alloc_test },
-	{ "pcpu_alloc_test", pcpu_alloc_test },
-	{ "kvfree_rcu_1_arg_vmalloc_test", kvfree_rcu_1_arg_vmalloc_test },
-	{ "kvfree_rcu_2_arg_vmalloc_test", kvfree_rcu_2_arg_vmalloc_test },
-	{ "vm_map_ram_test", vm_map_ram_test },
+	{ "fix_size_alloc_test", fix_size_alloc_test, },
+	{ "full_fit_alloc_test", full_fit_alloc_test, },
+	{ "long_busy_list_alloc_test", long_busy_list_alloc_test, },
+	{ "random_size_alloc_test", random_size_alloc_test, },
+	{ "fix_align_alloc_test", fix_align_alloc_test, },
+	{ "random_size_align_alloc_test", random_size_align_alloc_test, },
+	{ "align_shift_alloc_test", align_shift_alloc_test, true },
+	{ "pcpu_alloc_test", pcpu_alloc_test, },
+	{ "kvfree_rcu_1_arg_vmalloc_test", kvfree_rcu_1_arg_vmalloc_test, },
+	{ "kvfree_rcu_2_arg_vmalloc_test", kvfree_rcu_2_arg_vmalloc_test, },
+	{ "vm_map_ram_test", vm_map_ram_test, },
 	/* Add a new test case here. */
 };
 
 struct test_case_data {
 	int test_failed;
+	int test_xfailed;
 	int test_passed;
 	u64 time;
 };
@@ -444,7 +446,7 @@ static int test_func(void *private)
 {
 	struct test_driver *t = private;
 	int random_array[ARRAY_SIZE(test_case_array)];
-	int index, i, j;
+	int index, i, j, ret;
 	ktime_t kt;
 	u64 delta;
 
@@ -468,11 +470,14 @@ static int test_func(void *private)
 		 */
 		if (!((run_test_mask & (1 << index)) >> index))
 			continue;
-
 		kt = ktime_get();
 		for (j = 0; j < test_repeat_count; j++) {
-			if (!test_case_array[index].test_func())
+			ret = test_case_array[index].test_func();
+
+			if (!ret && !test_case_array[index].xfail)
 				t->data[index].test_passed++;
+			else if (ret && test_case_array[index].xfail)
+				t->data[index].test_xfailed++;
 			else
 				t->data[index].test_failed++;
 		}
@@ -576,10 +581,11 @@ static void do_concurrent_test(void)
 				continue;
 
 			pr_info(
-				"Summary: %s passed: %d failed: %d repeat: %d loops: %d avg: %llu usec\n",
+				"Summary: %s passed: %d failed: %d xfailed: %d repeat: %d loops: %d avg: %llu usec\n",
 				test_case_array[j].test_name,
 				t->data[j].test_passed,
 				t->data[j].test_failed,
+				t->data[j].test_xfailed,
 				test_repeat_count, test_loop_count,
 				t->data[j].time);
 		}
-- 
2.43.0

