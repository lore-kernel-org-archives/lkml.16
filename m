Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2073.outbound.protection.outlook.com [40.107.244.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75E6E290DA4
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 16:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746808153; cv=fail; b=SHWE8MYtD2ZUC2vD6cHWJkiFhRhzsDfH9odx8KoFZutQRlnZgyEH3J85iaGnAU45u/VubJfzvnvglLrVkCQLiuA7Yaq5pIFDGf3LOPWrQsP/8m5mjYEwiLSujruooXYLoo6jTqqO2AOa15i54aAbwtdXbZVkZGvdgPi/PnVvTRE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746808153; c=relaxed/simple;
	bh=9ePOZNxU4dO8vNKhy9+NYqZIYqNkrpKC+OBiaDA6lqM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CgjQZep4QAn7waYUO3aXgsvSxnSaogFRR49Og8UUkYfN8gn/k6O3LjrCkwXxAsFzh2vWfeW/FtBfsqs6crLdQ3b2N5192cVM6KG7nt+NUBLPxhvDM9XItRkBlG63n4yP930TOzH0DjhmG2iTZbdUXC3RRVl5Tv39z8C8xbopGik=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Aq4FcIiL; arc=fail smtp.client-ip=40.107.244.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Aq4FcIiL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f+FtmuscFEqKKoNFv84FHrwB26jretN6a4yuScI02/escRbTrySRKwiobMEkt17B8yStlnzMQnR9wfAhK8aXSz7jZ/tPXpTXYRUG6M+rU6VSZbE8vpX7pyy3WRCkPslNcntlDePoBGvDzWyu7nIhJ92lP0V3PPK51Qzkv6sz+o1rpJ3/03rt4VXQYo9vOvU1JN2VRhAGXNek9lb+lVTnRJrK8HRFlMqbLnwZsrkjKpaRV1D5OkDcjSLcudtTIgeIpCYLKYmNknGtlWZUKHu5J9rJVDkkvF1azw8yguxBVjxKhSeka//NFyAkqSQlwyoUkDjTXSGpE8jtrHVN4Ng0pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+E7M8bB4d/Bm8ZiZ7eSfTLzA8pOvObfiTAHYavQH1nI=;
 b=m6EJhsOJW9+9IGV9pGUhY6EnYy3S7ifZEF9zl6/CTKUki/oUFpIaNSCDQIwANaOmv564T5hAkbhRHglMqAYxA/A2QN9M3XdvAS0hKVuLtLnBTfhgPQ7qtAyaXDGN7cPYiJ5afyZRlhLCPMXy5rMahSsuVsLeEyTddq9U/GDrUKgKa78argxZS+2x8hh2k5O1h0/73Xwbli3lRLucwXP53uxalC87sFGK4xV4Loo3ackj6dcR9TTv9z5Ok28Hg+yyCUtvJxGWohUsVtw9bOwgUwFvCPuK38UysNYCeHJY8WzBGTooBr/PmwVZqiEBs8bryNjPQfRsti6WR4zaqvTPwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linutronix.de smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+E7M8bB4d/Bm8ZiZ7eSfTLzA8pOvObfiTAHYavQH1nI=;
 b=Aq4FcIiLvc2VuPROYN4hcBbvrAw/zvD/6lpNQp0WgcZyD//AdpAnTMsrVSXjRfKkFAlkhupSdwyyx27ZD3UAL0IF4pEWoD4gDlyuvVUD6qKbVPYZcx+kGYQtkrGi63orwp6ACcYc0i1H8WdUz32O6r5k/B/5Gd49XuM8Kx+fRcs=
Received: from BL1PR13CA0113.namprd13.prod.outlook.com (2603:10b6:208:2b9::28)
 by CY5PR12MB6324.namprd12.prod.outlook.com (2603:10b6:930:f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Fri, 9 May
 2025 16:29:09 +0000
Received: from BN3PEPF0000B074.namprd04.prod.outlook.com
 (2603:10b6:208:2b9:cafe::7a) by BL1PR13CA0113.outlook.office365.com
 (2603:10b6:208:2b9::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.19 via Frontend Transport; Fri,
 9 May 2025 16:29:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B074.mail.protection.outlook.com (10.167.243.119) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Fri, 9 May 2025 16:29:09 +0000
Received: from tiny.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 9 May
 2025 11:29:03 -0500
From: David Kaplan <david.kaplan@amd.com>
To: Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
	Peter Zijlstra <peterz@infradead.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Ingo Molnar
	<mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>,
	<x86@kernel.org>, "H . Peter Anvin" <hpa@zytor.com>
CC: <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 20/20] cpu: Show attack vectors in sysfs
Date: Fri, 9 May 2025 11:28:39 -0500
Message-ID: <20250509162839.3057217-21-david.kaplan@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250509162839.3057217-1-david.kaplan@amd.com>
References: <20250509162839.3057217-1-david.kaplan@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B074:EE_|CY5PR12MB6324:EE_
X-MS-Office365-Filtering-Correlation-Id: ee88a001-5a93-436e-8686-08dd8f169feb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?EguhrFJcOHN/TnjK/i/zXO0r/qyVAZysxOCShR7ZLCX8vdH9JUsLX+L+Oo+Y?=
 =?us-ascii?Q?CFWrSwxmHo3klknMCzoUlGYXd1PxKxe4uEKZea7EWukFwHqtMp8Xttbwzs+P?=
 =?us-ascii?Q?xexAMXThdAjHO8RH4Wes8w1Hhvko+wVDbyBLNJtNBmpHqwdBjpszgpM5Ih6X?=
 =?us-ascii?Q?fvvAEkbWK+CV09qmiJGKe41YzmMH+DoSK909xI5G095R7L13px3iFhTpb9rV?=
 =?us-ascii?Q?9ycHJARKfWcBnURp1mBKlQLZVT+MEtwe8JmnqcJ7pW7t092C4+gxxtXM8VJk?=
 =?us-ascii?Q?Wfi6jnH2icMpiy7zkYLE/J2jILgJs8qWpDKuiZUowm1z6bQQGI6wCJ0FE+KM?=
 =?us-ascii?Q?a5wocjTY4kkqf7f90YioKLdKqPdlILFLkk8Ve4Gn0ZAEDdY8INGTCl1IWxnB?=
 =?us-ascii?Q?dpNKRtFQu4Ihb0xpxtQwVkYlIwYRE093KAD2r2L8+qAtDrChRFDEFlStal1X?=
 =?us-ascii?Q?iT0rENjBeqZxXtCOKeDgB6G4oBDmbm/TnnF1E56LC2yKq2T8yOgpGpVXHkhv?=
 =?us-ascii?Q?NI6gBg20/0pTAkQn+MgFhLn2eezXz1lR8ORCWFZRCHSJXJmrtE3+C/9O1lDw?=
 =?us-ascii?Q?64JLtUuQq2bMYlx/SLVwT7gcMK0RYK+re5ykb577o6dhzavgfwxbo/KKhCww?=
 =?us-ascii?Q?LNQYvUCYn21NQ9o0iPvipNVFjskpz0cDGhjzWqUgz5T4qHZ5cVv3SCT1K2jt?=
 =?us-ascii?Q?Z37LxDD1niTe96+OisR0/VaObn0e6fqeQDbLyIUX0WT7oYk11ZkCb+eb4CZD?=
 =?us-ascii?Q?608EfLCDQOZ19ZxvxWQCk9dsQvjohayqXCtGxqD0r9CRq8gR9HSprh5Nq65B?=
 =?us-ascii?Q?aLfqNBnnUBjJtWvhTK2ufryVVEO17foYwT3v0d2u/kcUO3RH/vLl8GeHYbNy?=
 =?us-ascii?Q?Bk7A9AehimXGLbJsXlH0ix4NFFqq816z/mDTnhNAO764U5IUt6OvYONXPN3d?=
 =?us-ascii?Q?hRfs4FU7JcFO/PeVhgbOVHG3/WLXqgkQr9an98p14KW7hFmWHbIE3hbi9KZ2?=
 =?us-ascii?Q?uBV7rzp0QID33o+qLPP3SmVuI+CkE5kajqGqi3hle4CtrPWMdZyXXYCll6Ds?=
 =?us-ascii?Q?O3PutYsWGh9Zk9ITXn2FSU/BpJPa1/ytPLdCap8lPN440T1H/Vv8QoIqRXNu?=
 =?us-ascii?Q?T4mMgPRLPZnqkiLkyL4KSf2qiESP94H+CWY5g5fCqWfeQ4MhTcXQN51KU9ZI?=
 =?us-ascii?Q?WiiRrLWgTtJq/4aNAB1TRSrBbcApdwgSFUCz3fB1GsExDG/hGn7Xftwz8xds?=
 =?us-ascii?Q?BjWQZq/CqA8uXunM9xtFnr6V9tX9G9U5dQUtA04ane84YvYe/j5lX9EX23d8?=
 =?us-ascii?Q?E4d9v1Oz9rbfR6IPQS9WIYB0wqIc0e2nIxResSN1uXAV1FArHBdnQnype1GW?=
 =?us-ascii?Q?hPSWEBB4t2Bt+dNGTI4HFPOMDVNs6IW7N/dx1RSQrW8W3nKXGSDrX1Aaid6D?=
 =?us-ascii?Q?x3ZMyU5J5An4L+qOa4060kj7EnZsvlSqAtkLsKKpPLl9xbOajtUtrRSNE8I3?=
 =?us-ascii?Q?l/95hk2ii5vg0+IoyqQ+HwQsqyCuTCIX6DuE?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 16:29:09.1112
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ee88a001-5a93-436e-8686-08dd8f169feb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B074.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6324

Show the status of currently mitigated attack vectors in
/sys/devices/system/cpu/vector_mitigations/

Note that these files are not under the vulnerabilities directory so they
will not be printed by 'lscpu'.

Signed-off-by: David Kaplan <david.kaplan@amd.com>
---
 drivers/base/cpu.c | 67 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/drivers/base/cpu.c b/drivers/base/cpu.c
index 1c4359366cd7..991f989f18ff 100644
--- a/drivers/base/cpu.c
+++ b/drivers/base/cpu.c
@@ -20,6 +20,7 @@
 #include <linux/tick.h>
 #include <linux/pm_qos.h>
 #include <linux/delay.h>
+#include <linux/string_choices.h>
 #include <linux/sched/isolation.h>
 
 #include "base.h"
@@ -644,6 +645,70 @@ static const struct attribute_group cpu_root_vulnerabilities_group = {
 	.attrs = cpu_root_vulnerabilities_attrs,
 };
 
+static const char *attack_vector_state(enum cpu_attack_vectors v)
+{
+	return str_on_off(cpu_attack_vector_mitigated(v));
+}
+
+static ssize_t cpu_show_user_kernel_vector(struct device *dev,
+				struct device_attribute *attr, char *buf)
+{
+	return sysfs_emit(buf, "%s\n",  attack_vector_state(CPU_MITIGATE_USER_KERNEL));
+}
+
+static ssize_t cpu_show_user_user_vector(struct device *dev,
+				struct device_attribute *attr, char *buf)
+{
+	return sysfs_emit(buf, "%s\n", attack_vector_state(CPU_MITIGATE_USER_USER));
+}
+
+static ssize_t cpu_show_guest_host_vector(struct device *dev,
+				struct device_attribute *attr, char *buf)
+{
+	return sysfs_emit(buf, "%s\n", attack_vector_state(CPU_MITIGATE_GUEST_HOST));
+}
+
+static ssize_t cpu_show_guest_guest_vector(struct device *dev,
+				struct device_attribute *attr, char *buf)
+{
+	return sysfs_emit(buf, "%s\n", attack_vector_state(CPU_MITIGATE_GUEST_GUEST));
+}
+
+static ssize_t cpu_show_smt_vector(struct device *dev,
+				struct device_attribute *attr, char *buf)
+{
+	switch (smt_mitigations) {
+	case SMT_MITIGATIONS_OFF:
+		return sysfs_emit(buf, "off\n");
+	case SMT_MITIGATIONS_ON:
+		return sysfs_emit(buf, "on\n");
+	case SMT_MITIGATIONS_AUTO:
+		return sysfs_emit(buf, "auto\n");
+	}
+
+	return 0;
+}
+
+static DEVICE_ATTR(user_kernel, 0444, cpu_show_user_kernel_vector, NULL);
+static DEVICE_ATTR(user_user, 0444, cpu_show_user_user_vector, NULL);
+static DEVICE_ATTR(guest_host, 0444, cpu_show_guest_host_vector, NULL);
+static DEVICE_ATTR(guest_guest, 0444, cpu_show_guest_guest_vector, NULL);
+static DEVICE_ATTR(smt, 0444, cpu_show_smt_vector, NULL);
+
+static struct attribute *cpu_vector_mitigations_attrs[] = {
+	&dev_attr_user_kernel.attr,
+	&dev_attr_user_user.attr,
+	&dev_attr_guest_host.attr,
+	&dev_attr_guest_guest.attr,
+	&dev_attr_smt.attr,
+	NULL
+};
+
+static const struct attribute_group cpu_vector_mitigations_group = {
+	.name  = "vector_mitigations",
+	.attrs = cpu_vector_mitigations_attrs,
+};
+
 static void __init cpu_register_vulnerabilities(void)
 {
 	struct device *dev = bus_get_dev_root(&cpu_subsys);
@@ -651,6 +716,8 @@ static void __init cpu_register_vulnerabilities(void)
 	if (dev) {
 		if (sysfs_create_group(&dev->kobj, &cpu_root_vulnerabilities_group))
 			pr_err("Unable to register CPU vulnerabilities\n");
+		if (sysfs_create_group(&dev->kobj, &cpu_vector_mitigations_group))
+			pr_err("Unable to register CPU attack vectors\n");
 		put_device(dev);
 	}
 }
-- 
2.34.1

