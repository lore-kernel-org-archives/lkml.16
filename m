Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2041.outbound.protection.outlook.com [40.107.94.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B7FF29713E;
	Thu, 15 May 2025 22:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747349769; cv=fail; b=HL40Od/88eHidZ98Z3Fh4ixLLvGE4dfmIlNR9PhrIO2xfbLllWEl4T0fKam7zoRWvk1l/Ty1XwMp60MlCQA/49oNkRfRRovHVbg/DnZ/d4tdnarD+OLSqh06g1zXZq8MM7At7jIPoNGEKKnl2ZjSEVD6Ebc3Cwa/oxYdk441AOA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747349769; c=relaxed/simple;
	bh=NTCk/ZX/PVy0XQ+B8hP4/E/F2QM+0itpl3534IHwmlk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qCwL0r2mxEZZvXTA4R62Lsz/4Mpu8wnGPVK3AfjGcyJZucMOzrKlbNlH38G0n8YzameBOUazGYCJ9QOxXuXrhceKVDN8PzU9TI7GH0XHQnHEM3HKlzLDxnWl4/eYxO1Fp5snJyoHQzis1e7OWb7BOFRiO/TAjij/r/Bb4w7pZbY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=xf/s2mpq; arc=fail smtp.client-ip=40.107.94.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="xf/s2mpq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FzstsIt6kw6k71f0NUtho4RN3NtL/mUCMIVqv90EpGIhELk6Y0PutmB2YwUxAPVyf7lSU+hWwEbxQiA6g3yPaFYKBDcD0b0IgYzclPOC6vEOETqZgcsaysg5ZvWwYcGgc9n/7crPfr3qh/cGTJJ/OO4wx1ZCzAc9RD6lbAURdCiL1L4UvV7AV1xV4ovGEi+zP/wdabaf7iHP5MuYgQJd7zIangfGb/MgUWlZDrEgdLFuAMRkbOXBGup35cg00tshxA+SD2+7l986oVBG0BedhXihgpSWaGM4kFAP+QaKG/zqVU56OJCU9qWWzmor1DBg1hlEFSuqGIlkdJBSTxz71w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=91zfi6scmr2sYG7Qh0rO829+LHKmLcoGpQix9O5mqQc=;
 b=LFkjfQSYEh9HnJiF7pcsky9iccg47KXCJX0jha9yZO5NsPhEUpIhrqJ/4FtgWLuEjn+XiNzh5Vmjdx9tdI0hk1XAUxWdRd2U6751ir6b2bzD+yXyRvCCQEd8omHkKxmrB1aysHbbLFLD9mgUONfAndx/JZb6tsJzbYDvYy+IskR4ppLF6AjtIzlzVuw7C9VYHMaOJ8deC/OtFWO1m6BExXs/qaETsZwf9qUj/uy+huF4/FYu4+Mpimt0W6rknGOBBp2t9LR3Sy6I6mfwgkK5au3OmzoESLX4RNOg+s++b7N603H96bfSkT1+fFcdqApPQPy6af1TQJwLV8/uPbkyFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lwn.net smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=91zfi6scmr2sYG7Qh0rO829+LHKmLcoGpQix9O5mqQc=;
 b=xf/s2mpqwpqYN5cMZhg3s15vIKYeqkOJM56N8Zx8pqFTYpShxgJQz4BsCT4mJ0ZIOM80fHWq7USp+u9rnFltSlmlsQkd3UFOI6xNB0RluRP8H3M6M/Ek/ZPK6LMqk1ehPAHBArS/hvfqXSdUqFFfxzOLqVwFFwszJPLiQQny1KU=
Received: from BN9PR03CA0266.namprd03.prod.outlook.com (2603:10b6:408:ff::31)
 by CY8PR12MB8196.namprd12.prod.outlook.com (2603:10b6:930:78::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Thu, 15 May
 2025 22:56:02 +0000
Received: from BN2PEPF0000449F.namprd02.prod.outlook.com
 (2603:10b6:408:ff:cafe::2e) by BN9PR03CA0266.outlook.office365.com
 (2603:10b6:408:ff::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.33 via Frontend Transport; Thu,
 15 May 2025 22:56:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF0000449F.mail.protection.outlook.com (10.167.243.150) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Thu, 15 May 2025 22:56:02 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 15 May
 2025 17:55:59 -0500
From: Babu Moger <babu.moger@amd.com>
To: <corbet@lwn.net>, <tony.luck@intel.com>, <reinette.chatre@intel.com>,
	<tglx@linutronix.de>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>
CC: <james.morse@arm.com>, <dave.martin@arm.com>, <fenghuay@nvidia.com>,
	<x86@kernel.org>, <hpa@zytor.com>, <paulmck@kernel.org>,
	<akpm@linux-foundation.org>, <thuth@redhat.com>, <rostedt@goodmis.org>,
	<ardb@kernel.org>, <gregkh@linuxfoundation.org>,
	<daniel.sneddon@linux.intel.com>, <jpoimboe@kernel.org>,
	<alexandre.chartre@oracle.com>, <pawan.kumar.gupta@linux.intel.com>,
	<thomas.lendacky@amd.com>, <perry.yuan@amd.com>, <seanjc@google.com>,
	<kai.huang@intel.com>, <xiaoyao.li@intel.com>, <babu.moger@amd.com>,
	<kan.liang@linux.intel.com>, <xin3.li@intel.com>, <ebiggers@google.com>,
	<xin@zytor.com>, <sohil.mehta@intel.com>, <andrew.cooper3@citrix.com>,
	<mario.limonciello@amd.com>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <peternewman@google.com>,
	<maciej.wieczor-retman@intel.com>, <eranian@google.com>,
	<Xiaojian.Du@amd.com>, <gautham.shenoy@amd.com>
Subject: [PATCH v13 23/27] x86/resctrl: Introduce mbm_L3_assignments to list assignments in a group
Date: Thu, 15 May 2025 17:52:08 -0500
Message-ID: <e0fe5863ad1801183047196d212ff3b1b79898fe.1747349530.git.babu.moger@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1747349530.git.babu.moger@amd.com>
References: <cover.1747349530.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF0000449F:EE_|CY8PR12MB8196:EE_
X-MS-Office365-Filtering-Correlation-Id: 420514d5-1e9e-48ed-f856-08dd9403aa6a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|7416014|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?VoFCDcTU1advnQ7Fk2B7DTYvmI4qb2fj/tC+rzzZObdT2zSxNl9JNl6KTMH7?=
 =?us-ascii?Q?zjGX7ycpIDUxqpAaBjzGPTeoWiGX0TO1dtpWDbhBZU1oVYrF5x9lZk2UQJGo?=
 =?us-ascii?Q?XaiBgpt1TWyE8Dc+tIi5Fvcdsx5EqN6CBxBrBB6s7HeDQ/FpgRLVSb2KpKI0?=
 =?us-ascii?Q?LL3knkI0wtfdhPTuw8Wjb7puEz8VQwdVhaCC/8iOZHPyregJO9HFSrpN3YyD?=
 =?us-ascii?Q?uvmJmcNroBMirxORr9FzxY/0DHOII8RZpi9/MUy28l1arQtXd6vzLJlwbP6S?=
 =?us-ascii?Q?HQe4PIAtdA3wPCON+As0voLdEGevGri3F4s9fwAqDyDlxdkXeKXThsENDR7D?=
 =?us-ascii?Q?ed2iOcGewfTH2FiNq7JimelO1YXHC3hh+XmLi960KqlRy6/zN+Iy+0GWHb+L?=
 =?us-ascii?Q?F/KIls++sVbI8rLtg174Vq4OfzBgwlVtCKbFFDOxi4WG9YxESO/ZnfYDktdL?=
 =?us-ascii?Q?pByHz2WArxlzlkNT78RyuMFyVoVBshNfqiznyi2QSZGOBenbSVGxDftMiQ6F?=
 =?us-ascii?Q?9vYa6QtJseIRIaeYE0d7QOGLN4iq4BbKQWQ6zJYbrth6pWzO2cqP6MZ9kmyU?=
 =?us-ascii?Q?qHyy6zlORK3IGTxv4tmjP8ywhh7lNIXES+bkF6fKH9TRoMiSSeavEYPj9u4G?=
 =?us-ascii?Q?WnOkcsnr1eSeTklumyHVLdepnDZAQDOCt3NXF3EcthfLgtAF0qgzjS/mmmZA?=
 =?us-ascii?Q?DpNH0Aa6BZR+s/DlX43gT9dLCF5deIt86URHiKKWt0T9IXpjvfMJGN9otF70?=
 =?us-ascii?Q?fur9wQImzwfk/R23VGMX8OBo9aZzRmQbY+yd2QFShuG31vyV7YoT3PkwgL2L?=
 =?us-ascii?Q?YKkBFuBYaMM3HCT6/B2sZrEYDoruHtAFYB9OLx2EwJJqKY4EeJgf8Wqc0Rtg?=
 =?us-ascii?Q?zo0N/P8rf5HRTkH1egKhG4DbxquFdu0wlSSy7aGyW5pg8l+JR1TI6isNMyaO?=
 =?us-ascii?Q?D92vIhwjYatgCZEosMnJondK3hJGPsiKOBxraj6fBx9T70oc1HAi8uELlc/M?=
 =?us-ascii?Q?SqUCKhGuBQf6rMPiICfYER7D6dQioDs+Cuda3dhmn17ZuO7YdAoSGxo5UzDe?=
 =?us-ascii?Q?E0cu1QAKAa0UZ1ffIBp+Vkm3HwNww08UuO98uKDkCSlgPenMhxgKG2wD1bxd?=
 =?us-ascii?Q?1yrKTonWMsFGvjxqYgW7+jDfqvO/TibnvTRDs6djXJ/iauXBjc1v60kGfbo+?=
 =?us-ascii?Q?XIGjfk5/82ITErBZAVcF2UnCl1vc/X3wPuuVh3W2JiP+5lZizVg+PtAR/nEn?=
 =?us-ascii?Q?WCb+CdMlpKDegZSilCL7xjcYY+55S4jsQWR05G36dAe9j49fOjH4DaZpaeUQ?=
 =?us-ascii?Q?2q/gAbjl6oKgYyeiPxugMTANzuBPm0l1hBDi64r6RxMN/SKKkiGoU/oOrWix?=
 =?us-ascii?Q?2DA2YF/CEgQXImpr+Qsy07vhPH7cv/BiVIQAOmGjgc392NR/wtixfnHGdDyd?=
 =?us-ascii?Q?N5IiGSoqT4IQce6sifM6I3XUEcKUf0M4MG6+OtxvFZcZhtOz0bdGqA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(7416014)(376014)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 22:56:02.1000
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 420514d5-1e9e-48ed-f856-08dd9403aa6a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF0000449F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8196

Introduce the interface to display the assignment states for each group
when mbm_cntr_assign mode is enabled.

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
v13: Changelog update.
     Few changes in mbm_L3_assignments_show() after moving the event config to evt_list.
     Resolved conflicts caused by the recent FS/ARCH code restructure.
     The rdtgroup.c/monitor.c files have been split between the FS and ARCH directories.

v12: New patch:
     Assignment interface moved inside the group based the discussion
     https://lore.kernel.org/lkml/CALPaoCiii0vXOF06mfV=kVLBzhfNo0SFqt4kQGwGSGVUqvr2Dg@mail.gmail.com/#t
---
 Documentation/filesystems/resctrl.rst | 28 +++++++++++++++
 fs/resctrl/monitor.c                  |  1 +
 fs/resctrl/rdtgroup.c                 | 52 +++++++++++++++++++++++++++
 3 files changed, 81 insertions(+)

diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
index 356f1f918a86..2350c1f21f4e 100644
--- a/Documentation/filesystems/resctrl.rst
+++ b/Documentation/filesystems/resctrl.rst
@@ -504,6 +504,34 @@ When the "mba_MBps" mount option is used all CTRL_MON groups will also contain:
 	/sys/fs/resctrl/info/L3_MON/mon_features changes the input
 	event.
 
+"mbm_L3_assignments":
+	This interface file is created when the mbm_cntr_assign mode is supported
+	and shows the assignment status for each group.
+
+	The assignment list is displayed in the following format:
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
+	To list the assignment states for the default group.
+	::
+
+	  # cd /sys/fs/resctrl
+	  # cat mbm_L3_assignments
+	    mbm_total_bytes:0=e;1=e
+	    mbm_local_bytes:0=e;1=e
+
 Resource allocation rules
 -------------------------
 
diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
index 5f6c4b662f3b..b982540ce4e3 100644
--- a/fs/resctrl/monitor.c
+++ b/fs/resctrl/monitor.c
@@ -935,6 +935,7 @@ int resctrl_mon_resource_init(void)
 		resctrl_file_fflags_init("event_filter", RFTYPE_ASSIGN_CONFIG);
 		resctrl_file_fflags_init("mbm_assign_on_mkdir", RFTYPE_MON_INFO |
 					 RFTYPE_RES_CACHE);
+		resctrl_file_fflags_init("mbm_L3_assignments", RFTYPE_MON_BASE);
 	}
 
 	return 0;
diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index 931ea355f159..8d970b99bbbd 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -2080,6 +2080,52 @@ static ssize_t resctrl_mbm_assign_on_mkdir_write(struct kernfs_open_file *of,
 	return ret ?: nbytes;
 }
 
+static int mbm_L3_assignments_show(struct kernfs_open_file *of, struct seq_file *s, void *v)
+{
+	struct rdt_resource *r = resctrl_arch_get_resource(RDT_RESOURCE_L3);
+	struct rdt_mon_domain *d;
+	struct rdtgroup *rdtgrp;
+	struct mon_evt *mevt;
+	int ret = 0;
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
+	list_for_each_entry(mevt, &r->mon.evt_list, list) {
+		if (mevt->mbm_mode != MBM_MODE_ASSIGN)
+			continue;
+
+		sep = false;
+		seq_printf(s, "%s:", mevt->name);
+		list_for_each_entry(d, &r->mon_domains, hdr.list) {
+			if (sep)
+				seq_putc(s, ';');
+
+			if (mbm_cntr_get(r, d, rdtgrp, mevt->evtid) >= 0)
+				seq_printf(s, "%d=e", d->hdr.id);
+			else
+				seq_printf(s, "%d=_", d->hdr.id);
+
+			sep = true;
+		}
+		seq_putc(s, '\n');
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
@@ -2218,6 +2264,12 @@ static struct rftype res_common_files[] = {
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

