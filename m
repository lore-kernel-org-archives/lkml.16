Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2057.outbound.protection.outlook.com [40.107.93.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCE7A1E51FB;
	Fri,  4 Apr 2025 00:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743726145; cv=fail; b=D+SyRDGvjI4HUgFaSEFZigddvuMiCOPhdh8WqKVqg5T/5QHZP6x3OxUieLE0ZEBNWub4sWSiweGw6Wk8k82NkM0MuajSyYc1MgnRUMk2QiwTVkeQ43gicGcnYlVrvmVxEsYDa69QRFpoeORHEC6vyRYiQ985GAV4ok1lgvn6VB8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743726145; c=relaxed/simple;
	bh=iy0b75SI4l1+8TdGO42eYRqBTlvcx0ox6KVvUuTXoTQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Um0Swfc7aqUAlqvYCPpuDrv13Bic80C3NxLuD57eVFpT0kLcyxdeUUA4jZ38JGAbY95YRzHu4eidSNvI4Qv/B8h0pVpyWH5iMACOCFVEWcy7zbI+6NyHGfM4xdbrpyYVkHRueh48RMrfTyIHruHg4eGADCoPyzxERVq3i2p2BBI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=QEaRxAaZ; arc=fail smtp.client-ip=40.107.93.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="QEaRxAaZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M6RxgWQ7Fqzz7+NxDGQf4pFlVDJohLeOiNvxA3un1IJJXhyyVv7ltZnkfJf6NkFnptSaznULNAyYOrzpPPIHY9X/9GnFtt7I//SgmWGlQPR6fDNm2zUSAsnYjBS4uzy4APFDRUWT2pyTHTUXS2LDwbARtfH4us3pPw8gSMTk89XoJtBFCXX70TA8x/rzgKDSfJJMipdwqdxoNVMX6gmKTOOukg9Gkixk/B6fEblQoHXfubFnxlA0HUOhiuhp6QCdNjDccqsfeqAdfE+t+qyQa/N0QAM7guQKyFKeBRkd7VpJ4ybvoO7ImEmw8gFbcfvsR3bNz0Ybeie91WguOdjlUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sJnUWQ7CpEjh02P3/Zfp4duwD9kWXTa3/ZJPWaZJFB4=;
 b=WnxUr6a5dXQ4WkCSAEwQQvwviAEJLRlQ9NzGJYzwYFDLVL/tVSmqKg0eUMwyDnYNAq09V8vRgyIZ3LV92yk9MyUZ5oiMRRaVw28f9vejzzLvmdcgzopc7DQzIrDvshtCEEHFZZWCDsFhEzKGoXdSNIUsclS8wQ7xXYFn+R9Bt5m47up3bYYmraH+qMuoyzsu/SjJHBVJ68CGY6NPV9a1ffvkDUcSt+uMIXC0T6mJ/qi2Yn8jd6BXANSMqbCCAbr8P7iipCLbW5o7RLrNtL7ZiXxVJizu6pybvQFsV2yTLR3imM1LrH9vhB1O5nqbKlmBDb2mCVnY6Riz8lkK6+1gTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sJnUWQ7CpEjh02P3/Zfp4duwD9kWXTa3/ZJPWaZJFB4=;
 b=QEaRxAaZ2m+Uu9xAL2r2p6k1vvfKwknAQg6KOMi4rkln93M38PCj8nkRvLWY71hmH6wfe/MY+tMZBamZcv/+oh5qWYQWG57XalBEBc+uVtZlRCn431uiUt+Z6yX+8NiEWP+p2MIva6GsotixIMN0Ql/+kKcpYBG/AJ8wxeWZpGQ=
Received: from SJ0PR13CA0010.namprd13.prod.outlook.com (2603:10b6:a03:2c0::15)
 by DS0PR12MB8245.namprd12.prod.outlook.com (2603:10b6:8:f2::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.45; Fri, 4 Apr
 2025 00:22:19 +0000
Received: from MWH0EPF000971E9.namprd02.prod.outlook.com
 (2603:10b6:a03:2c0:cafe::9d) by SJ0PR13CA0010.outlook.office365.com
 (2603:10b6:a03:2c0::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.22 via Frontend Transport; Fri,
 4 Apr 2025 00:22:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000971E9.mail.protection.outlook.com (10.167.243.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Fri, 4 Apr 2025 00:22:18 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 3 Apr
 2025 19:22:15 -0500
From: Babu Moger <babu.moger@amd.com>
To: <tony.luck@intel.com>, <reinette.chatre@intel.com>,
	<peternewman@google.com>
CC: <corbet@lwn.net>, <tglx@linutronix.de>, <mingo@redhat.com>,
	<bp@alien8.de>, <dave.hansen@linux.intel.com>, <x86@kernel.org>,
	<hpa@zytor.com>, <paulmck@kernel.org>, <akpm@linux-foundation.org>,
	<thuth@redhat.com>, <rostedt@goodmis.org>, <ardb@kernel.org>,
	<gregkh@linuxfoundation.org>, <daniel.sneddon@linux.intel.com>,
	<jpoimboe@kernel.org>, <alexandre.chartre@oracle.com>,
	<pawan.kumar.gupta@linux.intel.com>, <thomas.lendacky@amd.com>,
	<perry.yuan@amd.com>, <seanjc@google.com>, <kai.huang@intel.com>,
	<xiaoyao.li@intel.com>, <babu.moger@amd.com>, <kan.liang@linux.intel.com>,
	<xin3.li@intel.com>, <ebiggers@google.com>, <xin@zytor.com>,
	<sohil.mehta@intel.com>, <andrew.cooper3@citrix.com>,
	<mario.limonciello@amd.com>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <maciej.wieczor-retman@intel.com>,
	<eranian@google.com>
Subject: [PATCH v12 23/26] x86/resctrl: Introduce mbm_L3_assignments to list assignments in a group
Date: Thu, 3 Apr 2025 19:18:32 -0500
Message-ID: <e42cd8c2f6beaeeac4bf2f71e4aac0ce897fbcf8.1743725907.git.babu.moger@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1743725907.git.babu.moger@amd.com>
References: <cover.1743725907.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E9:EE_|DS0PR12MB8245:EE_
X-MS-Office365-Filtering-Correlation-Id: 6bc569c0-c864-4503-4832-08dd730ec274
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|7416014|376014|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?FRkg2RgaeHHwd/P94aTVErkZTUoMmd19Pnsj51XRcjXpHwPgMHYtZq6yQgSB?=
 =?us-ascii?Q?S3/PtwoIjlq9+9aS3rpqEUeh82WJDtRbJVm5uqhpVn3D7gdXrhSIO/L2Lgix?=
 =?us-ascii?Q?NxH78W6m457XuNhRR5HrWPFCOpoLehpXGFx5A9dTj9BqavdaQH6gQRJi60r8?=
 =?us-ascii?Q?yPjyVmhqzfrtNDqNV8vJ3AZEx9GAyTVVw4+Y3h5SCum3IuExSrTTgf1/7wXs?=
 =?us-ascii?Q?pO44ZSFyZ+iJFCY645irdpjWt8YJveu/JtVOLdinF1UTXS2A+mh4zoibykP9?=
 =?us-ascii?Q?uSrj8FO4tASJeGQhaMhAXtuxrzRN21Wc2wJkoTL9rDlklVWCbDN20LqNYzlW?=
 =?us-ascii?Q?fX0QyHw1NQI81C+3F4oV46s5Nshgwc/rVI7GHXhFYy6CaEIZQsVTU4gaP0wa?=
 =?us-ascii?Q?PIZwCTK0uRbCV0WCW1bPW49GdMV52kW6skHEmuUu0yp3JQpkGQAIaIjB15Lk?=
 =?us-ascii?Q?6AJ6ubdI6Inl0A8hZxI88YcZYowsJ9AqsV66AAZdFCOvhDSKBZJWwzo4UQFA?=
 =?us-ascii?Q?WP9XgwhvwUmSOS3ec/YFDWWknYwMpqYXOEp4JllHIA60nuNRph73XZzNkjkr?=
 =?us-ascii?Q?pgk9CXyXwU62Lu2Ua8P22b/O96Pto0T0pgFXJU/hPJ4ts0QwF5LUFOy8VB4s?=
 =?us-ascii?Q?vcmYedH0gfcOVszvQKZnMuZpWRx9PoAPe5llFk8DlGrgj6RDot+3E5nWPP0N?=
 =?us-ascii?Q?nZ1B0Ttd59KO6fKXixJ3lt5wk4uUbnqJms5+1+1UOoRj/IUxysYiGz3YHdmQ?=
 =?us-ascii?Q?xs+tDTqZMlp4054QpXmI/UPO/ThQR7JQlZdUX2T/67YewP62AlElCc5sz85g?=
 =?us-ascii?Q?fUVw5t8IN7tQplhCWp7gs8sgA80DQlEAKdgj4PW38GTOKFtxzpJc3pEXcTQW?=
 =?us-ascii?Q?+4VRNS+IvreckYhNFcX+epsVlIusfs+rED7dkPKAyxiwvN+yWWWoV068FHLQ?=
 =?us-ascii?Q?ZYEOXlKcrp46zozmg5MEIJzYMQ0Xi96xxQQjPCW5fWPPmxwVvyEt7uuBFaBk?=
 =?us-ascii?Q?YAGUrcpuJhj0NhxLO91p+AUYlab4aNE83A0OVel509tvXcoImpfFq6/FIo4Z?=
 =?us-ascii?Q?cnwWzpyB5mvGsLDYnT27ErVpjwhr/z2uk1wZsM0dZUmzEHIrCHqf/Hcoh8RK?=
 =?us-ascii?Q?OpmItMynNOGI1NQy/kath6QLDMvSlvaf5JKEVcesXYZ0SJEQ5z3Z2tQZOa0E?=
 =?us-ascii?Q?6xLbwJW8s0ql4oRc1TP49nf5fHY9UZOSHwuSr9VX3lWbkNg8OagZmiKZ9yZU?=
 =?us-ascii?Q?XH1ti0v3HIJ74yNyhdsdtwBzN09OW2pYyns1YwPNFltPvuZ09eyOohTeb/Ow?=
 =?us-ascii?Q?R4jLFqx+pxtCOlEZsZCI9BREX94wWA3zs+4vcpH5a1EbUJ+i8ar5QvZZ3O+9?=
 =?us-ascii?Q?dhNZBx88CVTysp/XskTG+HORk7jqF9AuO4WJaDjHZGuycAAFF4Fmj41nSLDR?=
 =?us-ascii?Q?2Rh3w7cU33I=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(7416014)(376014)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2025 00:22:18.4052
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bc569c0-c864-4503-4832-08dd730ec274
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000971E9.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8245

The interface displays the assignment states for each group when
mbm_cntr_assign mode is enabled.

The list is displayed in the following format:
<Event configuration>:<Domain id>=<Assignment type>

Event configuration: A valid event configuration listed in the
/sys/fs/resctrl/info/L3_MON/counter_configs directory.

Domain ID: A valid domain ID number.

The assignment type can be one of the following:

_ : No event configuration assigned

e : Event configuration assigned in exclusive mode

Example:
$cd /sys/fs/resctrl
$cat mbm_L3_assignments
mbm_total_bytes:0=e;1=e
mbm_local_bytes:0=e;1=e

Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v12: New patch:
     Assignment interface moved inside the group based the discussion
     https://lore.kernel.org/lkml/CALPaoCiii0vXOF06mfV=kVLBzhfNo0SFqt4kQGwGSGVUqvr2Dg@mail.gmail.com/#t
---
 Documentation/arch/x86/resctrl.rst     | 27 +++++++++++++++
 arch/x86/kernel/cpu/resctrl/monitor.c  |  1 +
 arch/x86/kernel/cpu/resctrl/rdtgroup.c | 48 ++++++++++++++++++++++++++
 3 files changed, 76 insertions(+)

diff --git a/Documentation/arch/x86/resctrl.rst b/Documentation/arch/x86/resctrl.rst
index a67f09323da0..31085b4e15f6 100644
--- a/Documentation/arch/x86/resctrl.rst
+++ b/Documentation/arch/x86/resctrl.rst
@@ -503,6 +503,33 @@ When the "mba_MBps" mount option is used all CTRL_MON groups will also contain:
 	/sys/fs/resctrl/info/L3_MON/mon_features changes the input
 	event.
 
+"mbm_L3_assignments":
+	The interface displays the assignment states for each group when
+	mbm_cntr_assign mode is enabled.
+
+	The list is displayed in the following format:
+
+	<Event configuration>:<Domain id>=<Assignment type>
+
+	Event configuration: A valid event configuration listed in the
+	/sys/fs/resctrl/info/L3_MON/counter_configs directory.
+
+	Domain ID: A valid domain ID number.
+
+	Assignment types:
+
+	_ : No event configuration assigned
+
+	e : Event configuration assigned in exclusive mode
+
+	Example:
+	::
+
+	 # cd /sys/fs/resctrl
+	 # cat mbm_L3_assignments
+	 mbm_total_bytes:0=e;1=e
+	 mbm_local_bytes:0=e;1=e
+
 Resource allocation rules
 -------------------------
 
diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/resctrl/monitor.c
index 4e22563dda60..0c6fd5f6ec19 100644
--- a/arch/x86/kernel/cpu/resctrl/monitor.c
+++ b/arch/x86/kernel/cpu/resctrl/monitor.c
@@ -1266,6 +1266,7 @@ int __init resctrl_mon_resource_init(void)
 		resctrl_file_fflags_init("available_mbm_cntrs", RFTYPE_MON_INFO);
 		resctrl_file_fflags_init("event_filter", RFTYPE_MON_CONFIG);
 		resctrl_file_fflags_init("mbm_assign_on_mkdir", RFTYPE_MON_INFO);
+		resctrl_file_fflags_init("mbm_L3_assignments", RFTYPE_MON_BASE);
 	}
 
 	return 0;
diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
index 3e440ace60e0..ee1c949c2436 100644
--- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
+++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
@@ -2083,6 +2083,48 @@ static ssize_t event_filter_write(struct kernfs_open_file *of, char *buf,
 	return ret ?: nbytes;
 }
 
+static int mbm_L3_assignments_show(struct kernfs_open_file *of, struct seq_file *s, void *v)
+{
+	struct rdt_resource *r = resctrl_arch_get_resource(RDT_RESOURCE_L3);
+	struct rdt_mon_domain *d;
+	struct rdtgroup *rdtgrp;
+	int i, ret = 0;
+	bool sep;
+
+	rdtgrp = rdtgroup_kn_lock_live(of->kn);
+	if (!rdtgrp)
+		return -ENOENT;
+
+	rdt_last_cmd_clear();
+	if (!resctrl_arch_mbm_cntr_assign_enabled(r)) {
+		rdt_last_cmd_puts("mbm_cntr_assign mode not enabled\n");
+		ret = -ENOENT;
+		goto assign_out;
+	}
+
+	for (i = 0; i < NUM_MBM_ASSIGN_CONFIGS; i++) {
+		sep = false;
+		seq_printf(s, "%s:", mbm_assign_configs[i].name);
+		list_for_each_entry(d, &r->mon_domains, hdr.list) {
+			if (sep)
+				seq_puts(s, ";");
+
+			if (mbm_cntr_get(r, d, rdtgrp, mbm_assign_configs[i].evtid) >= 0)
+				seq_printf(s, "%d=e", d->hdr.id);
+			else
+				seq_printf(s, "%d=_", d->hdr.id);
+
+			sep = true;
+		}
+		seq_puts(s, "\n");
+	}
+
+assign_out:
+	rdtgroup_kn_unlock(of->kn);
+
+	return ret;
+}
+
 /* rdtgroup information files for one cache resource. */
 static struct rftype res_common_files[] = {
 	{
@@ -2202,6 +2244,12 @@ static struct rftype res_common_files[] = {
 		.seq_show	= event_filter_show,
 		.write		= event_filter_write,
 	},
+	{
+		.name		= "mbm_L3_assignments",
+		.mode		= 0444,
+		.kf_ops		= &rdtgroup_kf_single_ops,
+		.seq_show	= mbm_L3_assignments_show,
+	},
 	{
 		.name		= "mbm_assign_mode",
 		.mode		= 0444,
-- 
2.34.1

