Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2045.outbound.protection.outlook.com [40.107.93.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 544722E62B8;
	Fri,  4 Apr 2025 00:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743726118; cv=fail; b=FLkOkYrcFf/hjnF6y+p47KzO3wOTv55lmqAf06aspuNQwfmOe5K3mXY12Q2gsE57jiyVXfpzwdkfURHvRag/DaIsE72rz79ggHJJHGteL7Ar2nE+dR+LP7Z3Z+oJnroWoa86ClXkYPSht/2hRucGCJkj7V3XMef7GkX5uBhKnZE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743726118; c=relaxed/simple;
	bh=jZ3vKH922Wraghfio5v+aDRdOuwzEyej6CDPrfhuTeM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QftWZRCprJTr7cUnCSW1rdZawSEIcsraLmWic5+jyn+WJ1ELFD3F9vo8tFFzsgjvPpSze+9wIZipWRkaivs6yPFmdWB0R+Ijd9U8dDDl+/RRkKZTclcV42phQpwplw57KAnnt4ex+guAPqDscExsnmwFN6LGO9h7Q3k/9ZjHb9I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=0Y6OPcsC; arc=fail smtp.client-ip=40.107.93.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="0Y6OPcsC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qiF6C32RwrVCiyRuAVajJxnwu1Hp9AqBFahQRk8rTYDAPagmcSPbuHJga4TEzLUkblQi5vEHBST8Fw1hNu2sa4t7oWRICx4TrnOelzNWxvmhfG/RT3Hyspm11q53+tSX/H+q0DnXmIFORHvJ6wU1Kpgg5XqgugOrJYB6yK03r2P5Wh5ntRbygNsmkUb7FnzkU/L+aPbAOSUDPKMjBUtFooLvgz2lMn/4TJw+fdcikT2IykJ29/MkEXXTphMOo/viRglX6sbEOTHBhU9m84U6Qt6q1oSP9HbGWhUx//NCqvsffu4gAAe+bA2f1QH1bp5rwG0XvgpKicx6TG2fxYJQRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sCNLZrKdXouhkqpRhD98uLCor1q+JCuVSvuTR2SGlXc=;
 b=Ni9qC4byk3hPVQcK6fkAuzEs9Zb6w9PVbJbrqjazI9wn5yF47C2oG5eCmID/ukmTcRZN2pR3Of2ZiB9C3fdnQrNoeHVK3G+vIe5v1Hvpl0wjo5W1sR2sIE1Cm6dN5WB9G9H29sihOIqDbo211JrHoZLWw22CojZhk78wAocseJT/IY33jmReiWdz43o7CIoQE+P7zP3llMSIgIGKQGl2hNChdVXLCya37LTY7z7nz4M9m49YOvH7PDYBGFSL/nJNuqDSBh84U0wkmLSQnI/dLT8rPPb0RRnOvpkjVgOUMCUpAZWJf4X5fIXX5xTKzJX4f+KcnI7m/G/Iw/NAxuPFpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sCNLZrKdXouhkqpRhD98uLCor1q+JCuVSvuTR2SGlXc=;
 b=0Y6OPcsCTfsIRweToerVVICXKtvjZ1hb9E5pCqP935xzzqQSv7AXMvqxORMsIpFqscYBYTNKYYEt6HGvOEis3mI9oQb7lm9vdItxeM66AOqzQ3uT7ABju3KkhDY26VppRahV6FHgzQ2XdRuEBio2cj17Zcm5VsG5YE9aMjIXjUU=
Received: from SJ0PR05CA0063.namprd05.prod.outlook.com (2603:10b6:a03:332::8)
 by PH7PR12MB5855.namprd12.prod.outlook.com (2603:10b6:510:1d6::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.41; Fri, 4 Apr
 2025 00:21:50 +0000
Received: from MWH0EPF000971E7.namprd02.prod.outlook.com
 (2603:10b6:a03:332:cafe::bc) by SJ0PR05CA0063.outlook.office365.com
 (2603:10b6:a03:332::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.24 via Frontend Transport; Fri,
 4 Apr 2025 00:21:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000971E7.mail.protection.outlook.com (10.167.243.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Fri, 4 Apr 2025 00:21:50 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 3 Apr
 2025 19:21:47 -0500
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
Subject: [PATCH v12 20/26] x86/resctrl: Provide interface to update the event configurations
Date: Thu, 3 Apr 2025 19:18:29 -0500
Message-ID: <d18beb9ca31eb013405677792377542e609ea693.1743725907.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E7:EE_|PH7PR12MB5855:EE_
X-MS-Office365-Filtering-Correlation-Id: 158567c6-8dfe-433b-4ef3-08dd730eb1c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?bel7aEhpjyC3sPi3rhadOXvA25BjV0EGWmw8I3XQxpvzYvJz9yrEbC9Tvde2?=
 =?us-ascii?Q?YFku8FN6cEYQ8NS17aoiIYhESq6Wy8jUHVYWcXHcuqoftFxIrGOPRlDmjNTf?=
 =?us-ascii?Q?TSAUNNvNP5o4qL1FR77Ir7rpxPmiZoYRkWF2VL7F6JyeDbE/HoVlouC6Y/D2?=
 =?us-ascii?Q?GXcfiOtVdaNxmr1HdNJsaT6NwfdCWY4M0rchn+SzqrrEIsiCyK8vG3nQE9FW?=
 =?us-ascii?Q?pTeYc5WIbkJOHJ7QvhIvvrU03Kfgtdj8kbwSGTBRA6zD9nyC2H6WAPMgeW75?=
 =?us-ascii?Q?ibF8B3L0MjYzbQyZ/RuivalL2JWYqNPyZ+HcpTRV6WD9mk7/v36wdlUo8BxM?=
 =?us-ascii?Q?kdA5CgIJaN19dPvma7xBbJG0hllkt0KQTlEQFSxXcmzHCY5OA6Fq3D7LwMJw?=
 =?us-ascii?Q?yxDezstY4gqkueMuWCnvqM8gUaQBER3EgFU5apAWU509Xf8fFtBRUcPet1qG?=
 =?us-ascii?Q?4giSqR0A4WJDMhMHrvXMdLaQqGh0AjwcaWoCRYA5/4soKeIOjwuRFXdTuYxB?=
 =?us-ascii?Q?Vk5T36PZvgLDEt2X+iPzn1qU4qLQ8Fw5oc/LOXoO7GHVMJ/5427zCl7RE17T?=
 =?us-ascii?Q?6E6/Z7DNeZV7s8+AsJgTX+R5Ju08MhAFJmj3WrUHoCFkhyA0Z8MYpRN7HxN5?=
 =?us-ascii?Q?N1bRP9Bj2YPDOpBgy1/03yZQ+iq9v7BUHWpc5RaenKy4tGyq97kzWZwss9Gp?=
 =?us-ascii?Q?5Ma/8vnY2Q4u2ckbvvHTmCJstfG5Fe9FogwnZ2V6cyr+osuzWHI8QjaijJ/V?=
 =?us-ascii?Q?nOjsJAvFO+QeatXbQqA6xuje4l5IY/OHCypB+t3YK40N1LrstVgA98Mqiutb?=
 =?us-ascii?Q?kkRo9fzgi08pLd6nnj+q8Jc5V3M7UbSIxGtCbzxcRkIkz5vPjCkqoRb5iDfO?=
 =?us-ascii?Q?RO/c0KU0KNnc//g4ehTffNhgw9pSycx7+2fOYNueDI85RELitXcwK5c8Qafg?=
 =?us-ascii?Q?hP7qU1wdZZZw20RRoIqNsftiJxLZe5pj4ZAfUSm6bWnBYLj1Xwdr5Qj1RZgg?=
 =?us-ascii?Q?Jbli6laGG1joSeVitNUXE6TUNY4n/NVmFCzQx6pdPZbY9Svy03irpgrrUsDK?=
 =?us-ascii?Q?+w9WF7J6wwyC/IwkCpjqb8yjzzMaBmucjpU7zYyShYOwGivDvoRfecq+R/6U?=
 =?us-ascii?Q?Vaz6803Te+QIkrmDOthFh+Lw88nYExUpZdb07BKgFLvrBKl0OQ1uGrtfLp2e?=
 =?us-ascii?Q?YIfI/HvTJM3Ec03MVuDlLIRSFg1kv/JeZEJD61xcjdDldkH5rKIt7i12yK/z?=
 =?us-ascii?Q?O8GolA5gRqoWGTge4y1OTpWN/n9coc4iQo03EHppyo1UWcKWF9iMEtqyaXf4?=
 =?us-ascii?Q?EIFSwIyuX8dkpnhT1w8uC9HcDznMfj1yIZ4ICoQ7sc6M/5Osi8uiuMGxWXoe?=
 =?us-ascii?Q?fe0KHIf159U1fcsDVwxrlwGslm6dKyERGFZY5osdFOfD57Sn5Nrvqt9fMqF2?=
 =?us-ascii?Q?il41BIYhgM5wo0dSLEBbiDmovhgsHOyqEWWrQaIJZLxTamQGtuRW4ZJQAMh0?=
 =?us-ascii?Q?bzCwp4lsP9/V3YQ=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2025 00:21:50.4281
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 158567c6-8dfe-433b-4ef3-08dd730eb1c7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000971E7.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5855

Users can modify the event configuration by writing to the event_filter
interface file. The event configurations for mbm_cntr_assign mode are
located in /sys/fs/resctrl/info/event_configs/.

Update the assignments of all groups when the event configuration is
modified.

Example:
$ cd /sys/fs/resctrl/
$ echo "local_reads, local_non_temporal_writes" >
  info/L3_MON/counter_configs/mbm_total_bytes/event_filter

$ cat info/L3_MON/counter_configs/mbm_total_bytes/event_filter
 local_reads, local_non_temporal_writes

Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v12: New patch to modify event configurations.
---
 Documentation/arch/x86/resctrl.rst     |  10 +++
 arch/x86/kernel/cpu/resctrl/rdtgroup.c | 115 ++++++++++++++++++++++++-
 2 files changed, 124 insertions(+), 1 deletion(-)

diff --git a/Documentation/arch/x86/resctrl.rst b/Documentation/arch/x86/resctrl.rst
index 99f9f4b9b501..4e6feba6fb08 100644
--- a/Documentation/arch/x86/resctrl.rst
+++ b/Documentation/arch/x86/resctrl.rst
@@ -335,6 +335,16 @@ with the following files:
 	    # cat /sys/fs/resctrl/info/L3_MON/counter_configs/mbm_local_bytes/event_filter
 	    local_reads, local_non_temporal_writes, local_reads_slow_memory
 
+	The event configuration can be modified by writing to the event_filter file within
+	the configuration directory.
+	::
+
+	    # echo "local_reads, local_non_temporal_writes" >
+	      /sys/fs/resctrl/info/L3_MON/counter_configs/mbm_total_bytes/event_filter
+
+	    # cat /sys/fs/resctrl/info/L3_MON/counter_configs/mbm_total_bytes/event_filter
+	    local_reads, local_non_temporal_writes
+
 "max_threshold_occupancy":
 		Read/write file provides the largest value (in
 		bytes) at which a previously used LLC_occupancy
diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
index b2122a1dd36c..7792455f0b26 100644
--- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
+++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
@@ -1926,6 +1926,118 @@ static int event_filter_show(struct kernfs_open_file *of, struct seq_file *seq,
 	return 0;
 }
 
+static int resctrl_group_assign(struct rdt_resource *r, struct rdtgroup *rdtgrp,
+				enum resctrl_event_id evtid, u32 evt_cfg)
+{
+	struct rdt_mon_domain *d;
+	int cntr_id, ret;
+
+	list_for_each_entry(d, &r->mon_domains, hdr.list) {
+		cntr_id = mbm_cntr_get(r, d, rdtgrp, evtid);
+		if (cntr_id >= 0 && d->cntr_cfg[cntr_id].evt_cfg != evt_cfg) {
+			d->cntr_cfg[cntr_id].evt_cfg = evt_cfg;
+			ret = resctrl_arch_config_cntr(r, d, evtid, rdtgrp->mon.rmid,
+						       rdtgrp->closid, cntr_id, evt_cfg, true);
+			if (ret) {
+				rdt_last_cmd_printf("Assign failed event %d domain %d group %s\n",
+						    evtid, d->hdr.id, rdtgrp->kn->name);
+				return ret;
+			}
+		}
+	}
+
+	return 0;
+}
+
+static int resctrl_update_assign(struct rdt_resource *r, enum resctrl_event_id evtid,
+				 u32 evt_cfg)
+{
+	struct rdtgroup *prgrp, *crgrp;
+	int ret;
+
+	/* Check if the cntr_id is associated to the event type updated */
+	list_for_each_entry(prgrp, &rdt_all_groups, rdtgroup_list) {
+		ret = resctrl_group_assign(r, prgrp, evtid, evt_cfg);
+		if (ret)
+			return ret;
+
+		list_for_each_entry(crgrp, &prgrp->mon.crdtgrp_list, mon.crdtgrp_list) {
+			ret = resctrl_group_assign(r, crgrp, evtid, evt_cfg);
+			if (ret)
+				return ret;
+		}
+	}
+
+	return 0;
+}
+
+static int resctrl_process_configs(char *tok, u32 *val)
+{
+	char *evt_str;
+	bool found;
+	int i;
+
+next_config:
+	if (!tok || tok[0] == '\0')
+		return 0;
+
+	/* Start processing the strings for each event type */
+	evt_str = strim(strsep(&tok, ","));
+	found = false;
+	for (i = 0; i < NUM_MBM_EVT_VALUES; i++) {
+		if (!strcmp(mbm_evt_values[i].evt_name, evt_str)) {
+			*val |=  mbm_evt_values[i].evt_val;
+			found = true;
+			break;
+		}
+	}
+
+	if (!found) {
+		rdt_last_cmd_printf("Invalid event type %s\n", evt_str);
+		return -EINVAL;
+	}
+
+	goto next_config;
+}
+
+static ssize_t event_filter_write(struct kernfs_open_file *of, char *buf,
+				  size_t nbytes, loff_t off)
+{
+	struct rdt_resource *r = resctrl_arch_get_resource(RDT_RESOURCE_L3);
+	struct mbm_assign_config *assign_config = of->kn->parent->priv;
+	u32 evt_cfg = 0;
+	int ret = 0;
+
+	/* Valid input requires a trailing newline */
+	if (nbytes == 0 || buf[nbytes - 1] != '\n')
+		return -EINVAL;
+
+	buf[nbytes - 1] = '\0';
+
+	cpus_read_lock();
+	mutex_lock(&rdtgroup_mutex);
+
+	rdt_last_cmd_clear();
+
+	if (!resctrl_arch_mbm_cntr_assign_enabled(r)) {
+		rdt_last_cmd_puts("mbm_cntr_assign mode is not enabled\n");
+		ret = -EINVAL;
+		goto unlock_out;
+	}
+
+	ret = resctrl_process_configs(buf, &evt_cfg);
+	if (!ret && assign_config->val != evt_cfg) {
+		assign_config->val = evt_cfg;
+		ret = resctrl_update_assign(r, assign_config->evtid, evt_cfg);
+	}
+
+unlock_out:
+	mutex_unlock(&rdtgroup_mutex);
+	cpus_read_unlock();
+
+	return ret ?: nbytes;
+}
+
 /* rdtgroup information files for one cache resource. */
 static struct rftype res_common_files[] = {
 	{
@@ -2040,9 +2152,10 @@ static struct rftype res_common_files[] = {
 	},
 	{
 		.name		= "event_filter",
-		.mode		= 0444,
+		.mode		= 0644,
 		.kf_ops		= &rdtgroup_kf_single_ops,
 		.seq_show	= event_filter_show,
+		.write		= event_filter_write,
 	},
 	{
 		.name		= "mbm_assign_mode",
-- 
2.34.1

