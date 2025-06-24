Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2053.outbound.protection.outlook.com [40.107.243.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5896923D2B6
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 05:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750744727; cv=fail; b=uwNr/uvpLNYCASiqZVXzdHBj1hfKLzgmkFgYOMrT/670JV9aEqETBmMbxcCHqcD94/sU+UKC2+tiskD1Dcx6JISkOyM2PXryH9n3fLGn6PHPyoCVebLeBgGDlaNKdU2+rav1QK66kgLX5KH6r5lyxjiIVFe8UH2OLq7lRi6IJOs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750744727; c=relaxed/simple;
	bh=Q6AajCqillq0jIoDGnugMLikNrREY03STpAzfW+inwg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Y7K2zw2cu/lir3irQTCurGlKKiyNT6Ka4qOmuWoHD4wLUUUHeHIs1brXU2qu8gUiyma0ortbpUBAm6bdsPbknAPbmFF0KW52EW816lI+eirBeHdFIuDCDZ6eHe0ALK4aDYdtindIXKLuEJiYdNtiG7idhmeFoHjapbs/vYNwRpI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=favbM7BI; arc=fail smtp.client-ip=40.107.243.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="favbM7BI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lQsMJFgfLR4/+ir36Vc8tL/5nIhEB5UphOUjEqkiM3OLYrW3ZNUnpKjdp3PZcrCr4Z0PTTVy45zW/ZTynGLmomlQnidKa2HtSphyyzfh5pivgfEKI2yjassSx9eK5DnbY3rKQY2BxOyDmNfbmoq3NfrIE8CRa21sEOy4ZBCcdw6u3Nyn3Jpxqwt0SFR0CJGvstr0NoPGML2OtBm1eYrVml3ns7xdHXPa54OlCo1htZuA1rbY/KVR+mnHIkwzjsBpc7ctBfSUxkQEc6K2uisCPlvAYxDCAqzfBUKSApECkcsl4e32Bu5m0ePJCQ8JgEJOV1lpVdOckJv1dcfe7ffmzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jNZuoxVfvqVikHLgk9R6ICz6ag6HwvS891F4xfGb3wg=;
 b=QTEeJfNzRPpAG0xqa6fSms7/YkLHd6cROvo/D8+XeITxyWEEG/bSDyp3byvnwI41Cf/427DAMR7sHvT1fgACtiXKhr2cd+4VpHKXXFW9RIhImAEkmT319YLJeVKNVIinyk15vi3iL4zRNUd3Ksz4dAcnMplaNxP313xM2nKGDPcUJ2ilAGZ714KVF5RdyKjjXoLZtHaOWO/S2n6ABWknFYmjY/JVtY8hzWoPpFxwKfR+GVxZSQXImwuPkSofWLy+vmAVk0p9pEjPEmTdJjvXOXBtcKctkVAA6fZMHZnnndyhcnUpCsGZhEzGSQdTcOP++7GWaPoDsQ/KOTbQjTO7oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jNZuoxVfvqVikHLgk9R6ICz6ag6HwvS891F4xfGb3wg=;
 b=favbM7BIDT78EHJ8C6c3btex3w6nC+66JxBS/xD2LJJuIlbK9MNhbucHgBRZV+zA0+xjNsRRUO1ED1eY6kjvkIH4hZgIBkgp9wO/GvvwjYzFrhv0ivKDuICz2qIoOzVUoxI44xQgahinPPmyt8L7hhBWAfLTWgQDYBxKUyJk6U8=
Received: from MW4PR03CA0347.namprd03.prod.outlook.com (2603:10b6:303:dc::22)
 by PH7PR12MB6561.namprd12.prod.outlook.com (2603:10b6:510:213::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.31; Tue, 24 Jun
 2025 05:58:40 +0000
Received: from SJ5PEPF00000209.namprd05.prod.outlook.com
 (2603:10b6:303:dc:cafe::98) by MW4PR03CA0347.outlook.office365.com
 (2603:10b6:303:dc::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8857.30 via Frontend Transport; Tue,
 24 Jun 2025 05:58:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF00000209.mail.protection.outlook.com (10.167.244.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8880.14 via Frontend Transport; Tue, 24 Jun 2025 05:58:39 +0000
Received: from tunga.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 24 Jun
 2025 00:58:28 -0500
From: Raghavendra K T <raghavendra.kt@amd.com>
To: <raghavendra.kt@amd.com>
CC: <AneeshKumar.KizhakeVeetil@arm.com>, <Hasan.Maruf@amd.com>,
	<Michael.Day@amd.com>, <akpm@linux-foundation.org>, <bharata@amd.com>,
	<dave.hansen@intel.com>, <david@redhat.com>, <dongjoo.linux.dev@gmail.com>,
	<feng.tang@intel.com>, <gourry@gourry.net>, <hannes@cmpxchg.org>,
	<honggyu.kim@sk.com>, <hughd@google.com>, <jhubbard@nvidia.com>,
	<jon.grimm@amd.com>, <k.shutemov@gmail.com>, <kbusch@meta.com>,
	<kmanaouil.dev@gmail.com>, <leesuyeon0506@gmail.com>, <leillc@google.com>,
	<liam.howlett@oracle.com>, <linux-kernel@vger.kernel.org>,
	<linux-mm@kvack.org>, <mgorman@techsingularity.net>, <mingo@redhat.com>,
	<nadav.amit@gmail.com>, <nphamcs@gmail.com>, <peterz@infradead.org>,
	<riel@surriel.com>, <rientjes@google.com>, <rppt@kernel.org>,
	<santosh.shukla@amd.com>, <shivankg@amd.com>, <shy828301@gmail.com>,
	<sj@kernel.org>, <vbabka@suse.cz>, <weixugc@google.com>,
	<willy@infradead.org>, <ying.huang@linux.alibaba.com>, <ziy@nvidia.com>,
	<Jonathan.Cameron@huawei.com>, <dave@stgolabs.net>, <yuanchu@google.com>,
	<kinseyho@google.com>, <hdanton@sina.com>
Subject: [RFC PATCH V2 10/13] sysfs: Add sysfs support to tune scanning
Date: Tue, 24 Jun 2025 05:56:14 +0000
Message-ID: <20250624055617.1291159-11-raghavendra.kt@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250624055617.1291159-1-raghavendra.kt@amd.com>
References: <20250624055617.1291159-1-raghavendra.kt@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000209:EE_|PH7PR12MB6561:EE_
X-MS-Office365-Filtering-Correlation-Id: abac8816-6768-463e-281b-08ddb2e42b05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+7ROxtvCMLSpdqqt6YA2D+WFWNj+f925KGHuMB6io0M+wZpnY5cQDVnDauX8?=
 =?us-ascii?Q?VI2BSOPVav77tPVhD5IeXIDyjbdYo3rxEi0J1NJi3FKTsv1XtMx/4yNw+oNp?=
 =?us-ascii?Q?XFcsV+o88uBEtk8uyMYFh/xZi7u/Df1hC9cEdD/DMKtCVOeZBPA3WWSycEar?=
 =?us-ascii?Q?81nO5KqFmCtKa6QG2Mqwq9/WNFZ+92yo/WGS992/Rs6XGgjQrWYrcSAucQMV?=
 =?us-ascii?Q?pn7cp96R8ns0gmZdcxvLHWG9RBJpaBO5UVHBv4jSg+9Ge8TU9Igwp5jAh6cA?=
 =?us-ascii?Q?JDagkwsoQ/HYpwJPSV96DZUCG6+h6Pj3Ky8c3V4ea2dVTmKaq3lpRpChZlRT?=
 =?us-ascii?Q?VeucUqId/XMfh8Tm2N1vQpgiPWNeOWNPUXvwovW/zJcxESqoETnRlK+ziflR?=
 =?us-ascii?Q?aKUrmPLuqyMotQsB2PdK/yUTwSSn4l17di/9Ls1T8CBNbVikXSkCvm7RdWBD?=
 =?us-ascii?Q?07bOvMSMo7AkPX64QOPLhVBPbl6vvONqfxd/EqDjt3XN57hYbU3x+OfqsfYw?=
 =?us-ascii?Q?4DK5EvVmlmbtpyYi5vmc6aKwq9C33FlRbAW/CmUxwoMHjLBchxQEdSKCd5Qg?=
 =?us-ascii?Q?usmL1O3lbsck0wGyF6WWZtWje+oIaS2Dk3clmPjmSNwdTkk7OQ9fXGRFKNHt?=
 =?us-ascii?Q?Ub38AqXqb51SBgujOiiSPKlnQxSxIVEr/nTYcCMP8gbjJgYYFhp+4ZWJP3k1?=
 =?us-ascii?Q?jSXUv/0U9vIBAcO7BCjQC23IFZw+iTglynrgY7U5xepK9qRYiabmUDXljSJH?=
 =?us-ascii?Q?1X2/dGt8oQ3n5ZzDVr2waeMxicEYAkSukiFRHd31hRqmr90vOBJc6oD6Dzz1?=
 =?us-ascii?Q?lhH9fRloDqy9oopPmDWKcvBoN3D7ATSN47cA7XQ2RzG5AmRW6ZLcJIzlT92o?=
 =?us-ascii?Q?gl6AVLfoVdYvwoj0xNF8Y4sovaID4lRBEdxRM5aRZdYXWTUadKzbbD337j2e?=
 =?us-ascii?Q?PabbJYXtiqe01b4WNiUBziQRbv7WJ63pevPoKlVS+8grKY6QOsihJASSS9PC?=
 =?us-ascii?Q?+Tq8gu3jFr3Ycli72VhESwT3V2MtqLNYXX55cQ/H6mdXQVDV7XdTPa+Oz5km?=
 =?us-ascii?Q?unE3W+GUAAEQB9ipr1yT941YJmiufndLj1OIiWebyekvag7mijUnyiTxH3Fi?=
 =?us-ascii?Q?xt/1ygE9u59Txjeup3MimFHo4PrkKMSZIW+Jpbu1sWuQHb1DVb0F/9OclSb4?=
 =?us-ascii?Q?9We3etwnSC7EljyBvlfDXdi8xA6U21/URRzBjkCVFjOTxnDKq7LQW4fmXwKk?=
 =?us-ascii?Q?8sqSvSnEtt1P4++dUL0Eo3S9jZLIGPBtv+BrHZzD5t02HtJqlbeed37ZToWQ?=
 =?us-ascii?Q?WFEF4yc79OrF/gNv1cazp/6VPLw3RzxanHCAyvIvWCHlUlb8Idms4xTL+i+3?=
 =?us-ascii?Q?Fm1tdtlVaOnvEAHuuFP1c/sR/3HyS/UM3bM708/1tc4PsSBMnGBsRVQw7Lm5?=
 =?us-ascii?Q?q8qUZ+DsjC/dblbZyWsYoHoKI8r76whxtmaDY50WEhIx7I0KoveahT0NZ9Q5?=
 =?us-ascii?Q?EdzdhPpTBWIc6aneVwzYdTjhlnLsEzle34TO?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 05:58:39.9274
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: abac8816-6768-463e-281b-08ddb2e42b05
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF00000209.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6561

Support below tunables:
scan_enable: turn on or turn off mm_struct scanning
scan_period: initial scan_period (default: 2sec)
scan_sleep_ms: sleep time between two successive round of scanning and
migration.
mms_to_scan: total mm_struct to scan before taking a pause.
target_node: default regular node to which migration of accessed pages
is done (this is only fall back mechnism, otherwise target_node
heuristic is used).

Signed-off-by: Raghavendra K T <raghavendra.kt@amd.com>
---
 mm/kscand.c | 205 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 205 insertions(+)

diff --git a/mm/kscand.c b/mm/kscand.c
index 2996aaad65d6..abffcb868447 100644
--- a/mm/kscand.c
+++ b/mm/kscand.c
@@ -21,6 +21,7 @@
 #include <linux/delay.h>
 #include <linux/cleanup.h>
 #include <linux/minmax.h>
+#include <trace/events/kmem.h>
 
 #include <asm/pgalloc.h>
 #include "internal.h"
@@ -171,6 +172,171 @@ static bool kscand_eligible_srcnid(int nid)
 	return  !node_is_toptier(nid);
 }
 
+#ifdef CONFIG_SYSFS
+static ssize_t scan_sleep_ms_show(struct kobject *kobj,
+					 struct kobj_attribute *attr,
+					 char *buf)
+{
+	return sysfs_emit(buf, "%u\n", kscand_scan_sleep_ms);
+}
+
+static ssize_t scan_sleep_ms_store(struct kobject *kobj,
+					  struct kobj_attribute *attr,
+					  const char *buf, size_t count)
+{
+	unsigned int msecs;
+	int err;
+
+	err = kstrtouint(buf, 10, &msecs);
+	if (err)
+		return -EINVAL;
+
+	kscand_scan_sleep_ms = msecs;
+	kscand_sleep_expire = 0;
+	wake_up_interruptible(&kscand_wait);
+
+	return count;
+}
+
+static struct kobj_attribute scan_sleep_ms_attr =
+	__ATTR_RW(scan_sleep_ms);
+
+static ssize_t mm_scan_period_ms_show(struct kobject *kobj,
+					 struct kobj_attribute *attr,
+					 char *buf)
+{
+	return sysfs_emit(buf, "%u\n", kscand_mm_scan_period_ms);
+}
+
+/* If a value less than MIN or greater than MAX asked for store value is clamped */
+static ssize_t mm_scan_period_ms_store(struct kobject *kobj,
+					  struct kobj_attribute *attr,
+					  const char *buf, size_t count)
+{
+	unsigned int msecs, stored_msecs;
+	int err;
+
+	err = kstrtouint(buf, 10, &msecs);
+	if (err)
+		return -EINVAL;
+
+	stored_msecs = clamp(msecs, KSCAND_SCAN_PERIOD_MIN, KSCAND_SCAN_PERIOD_MAX);
+
+	kscand_mm_scan_period_ms = stored_msecs;
+	kscand_sleep_expire = 0;
+	wake_up_interruptible(&kscand_wait);
+
+	return count;
+}
+
+static struct kobj_attribute mm_scan_period_ms_attr =
+	__ATTR_RW(mm_scan_period_ms);
+
+static ssize_t mms_to_scan_show(struct kobject *kobj,
+					 struct kobj_attribute *attr,
+					 char *buf)
+{
+	return sysfs_emit(buf, "%lu\n", kscand_mms_to_scan);
+}
+
+static ssize_t mms_to_scan_store(struct kobject *kobj,
+					  struct kobj_attribute *attr,
+					  const char *buf, size_t count)
+{
+	unsigned long val;
+	int err;
+
+	err = kstrtoul(buf, 10, &val);
+	if (err)
+		return -EINVAL;
+
+	kscand_mms_to_scan = val;
+	kscand_sleep_expire = 0;
+	wake_up_interruptible(&kscand_wait);
+
+	return count;
+}
+
+static struct kobj_attribute mms_to_scan_attr =
+	__ATTR_RW(mms_to_scan);
+
+static ssize_t scan_enabled_show(struct kobject *kobj,
+					 struct kobj_attribute *attr,
+					 char *buf)
+{
+	return sysfs_emit(buf, "%u\n", kscand_scan_enabled ? 1 : 0);
+}
+
+static ssize_t scan_enabled_store(struct kobject *kobj,
+					  struct kobj_attribute *attr,
+					  const char *buf, size_t count)
+{
+	unsigned int val;
+	int err;
+
+	err = kstrtouint(buf, 10, &val);
+	if (err || val > 1)
+		return -EINVAL;
+
+	if (val) {
+		kscand_scan_enabled = true;
+		need_wakeup = true;
+	} else
+		kscand_scan_enabled = false;
+
+	kscand_sleep_expire = 0;
+	wake_up_interruptible(&kscand_wait);
+
+	return count;
+}
+
+static struct kobj_attribute scan_enabled_attr =
+	__ATTR_RW(scan_enabled);
+
+static ssize_t target_node_show(struct kobject *kobj,
+					 struct kobj_attribute *attr,
+					 char *buf)
+{
+	return sysfs_emit(buf, "%u\n", kscand_target_node);
+}
+
+static ssize_t target_node_store(struct kobject *kobj,
+					  struct kobj_attribute *attr,
+					  const char *buf, size_t count)
+{
+	int err, node;
+
+	err = kstrtoint(buf, 10, &node);
+	if (err)
+		return -EINVAL;
+
+	kscand_sleep_expire = 0;
+	if (!node_is_toptier(node))
+		return -EINVAL;
+
+	kscand_target_node = node;
+	wake_up_interruptible(&kscand_wait);
+
+	return count;
+}
+static struct kobj_attribute target_node_attr =
+	__ATTR_RW(target_node);
+
+static struct attribute *kscand_attr[] = {
+	&scan_sleep_ms_attr.attr,
+	&mm_scan_period_ms_attr.attr,
+	&mms_to_scan_attr.attr,
+	&scan_enabled_attr.attr,
+	&target_node_attr.attr,
+	NULL,
+};
+
+struct attribute_group kscand_attr_group = {
+	.attrs = kscand_attr,
+	.name = "kscand",
+};
+#endif
+
 static inline int kscand_has_work(void)
 {
 	return !list_empty(&kscand_scan.mm_head);
@@ -1164,11 +1330,45 @@ static int kscand(void *none)
 	return 0;
 }
 
+#ifdef CONFIG_SYSFS
+extern struct kobject *mm_kobj;
+static int __init kscand_init_sysfs(struct kobject **kobj)
+{
+	int err;
+
+	err = sysfs_create_group(*kobj, &kscand_attr_group);
+	if (err) {
+		pr_err("failed to register kscand group\n");
+		goto err_kscand_attr;
+	}
+
+	return 0;
+
+err_kscand_attr:
+	sysfs_remove_group(*kobj, &kscand_attr_group);
+	return err;
+}
+
+static void __init kscand_exit_sysfs(struct kobject *kobj)
+{
+		sysfs_remove_group(kobj, &kscand_attr_group);
+}
+#else
+static inline int __init kscand_init_sysfs(struct kobject **kobj)
+{
+	return 0;
+}
+static inline void __init kscand_exit_sysfs(struct kobject *kobj)
+{
+}
+#endif
+
 static inline void kscand_destroy(void)
 {
 	kmem_cache_destroy(kscand_slot_cache);
 	/* XXX: move below to kmigrated thread */
 	kmem_cache_destroy(kmigrated_slot_cache);
+	kscand_exit_sysfs(mm_kobj);
 }
 
 void __kscand_enter(struct mm_struct *mm)
@@ -1354,6 +1554,10 @@ static int __init kscand_init(void)
 		return -ENOMEM;
 	}
 
+	err = kscand_init_sysfs(&mm_kobj);
+	if (err)
+		goto err_init_sysfs;
+
 	init_list();
 	err = start_kscand();
 	if (err)
@@ -1370,6 +1574,7 @@ static int __init kscand_init(void)
 
 err_kscand:
 	stop_kscand();
+err_init_sysfs:
 	kscand_destroy();
 
 	return err;
-- 
2.34.1

