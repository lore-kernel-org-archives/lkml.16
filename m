Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2055.outbound.protection.outlook.com [40.107.93.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C1BFD517;
	Fri,  4 Apr 2025 00:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743725950; cv=fail; b=XdspVzsEDKyks8nEs9Nlcad0pq6JTYMDPxdmBxQMgmhnDF6+EJNkxKrMH7/hT768w2ugUa7eUmyrMvMjEM8oCIHp2gWyUeJAQaoOXXG9zi0K3yC6V5gOBuYqSQMxUG55okbkX2h3es0KRAE6Q66R3sv9kYDB+I4D9LtisK5vaRs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743725950; c=relaxed/simple;
	bh=hL6B/3TTOQhbm90yNgyUm+sVpG4QVpWSXoaWrBioZ8o=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OmRx80qzYXVz4qY6kuJO839O9EpJYky9zSXO2eZTz2WAdFzFnS+obUp5hTDkHenAXjV5uBuZPoyHlIBffGkHPDrSswGXKEDvKl669XSbjMRNxuCqkqsHyScsbKl46kZyRjXQTOwCcuVb6fl3sWer4w+GZizSKU6Z6GyT/ssjLe4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=0jMu9mUD; arc=fail smtp.client-ip=40.107.93.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="0jMu9mUD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nxa/3Y35z93uMV4clJqJzk9VtZNvzjVUJEAqUwlRS9Betf+GiNmt6rWKd6cVoiOJctBHOdzXnjlvfFX/k0FgqU1yl4WMdZxoInLRtgdxqQ/XORnIeQahJE7UXy28/cO3lNVIniyn5xHAXlbjGZa8tZeE9kVJ1zxRqkkusbiZy4duBr8WG8jxOI+ds2EIOWwqd18cmeVTN/zwp+1hA0tA72ZuVsg+Ldk9xGLTBABpjBxnfp4F0Y21ZgmtzvKnZOOITxB32dQinP40PaPoLATAxaXJOY13gNvXSeM+PhTOYToAeOnQqgPFmPV38jQmWQMdm7DPaMLfKk3UXywNVvMmhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ec3HktzSX+0fNs6Aw8D1xT89b5vWJ91M81m5bV0wEIE=;
 b=m3r+Y5hIVsotIk4/e8B6cr8Bop+q8Wc+XZ2wNq2MeXSC7cdZed7tcszzVwQbo2T4ig2/s7acNvFmXG8hyXBxdltTPS5zZQfdDJK7sNMmJZ+Mp6zHU5rdxa8wfrr/dS1bbMhwzWWgNT9rSihycBR0WU0ha5kwVzMxBe4yYw43gTscbeojS9GIOwA9y8+Z1h8ZU1vvcb5N7oGd/PnaBNdpXfQA9WVd85Dc6DI0KhnjWZg+wUAX/n984fYZQdRPZuDvKkSecwOYY9cyXXMg4WAIaeseWUPhouTHR7w2wgd1MWcaeBlJqgLYcFcY6/tRVAMxxSNYhaS3hJV2zrm+Nv/i5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ec3HktzSX+0fNs6Aw8D1xT89b5vWJ91M81m5bV0wEIE=;
 b=0jMu9mUDSPl6faSyIqV+iuXRsVVEbXrzHFSj68hcTIxvuz3xa47roMcBt5NRIcfgbtc589LbJFnfmREDOZC9yHLbJppV3w2V0gxRHf8WJFJ9NNwUu/HOHcRm2DDNzJ4F02cbfgzKVDQEgZ4yt6ksAyAKiNkFgTzktBohk2ZPXK8=
Received: from MW2PR2101CA0003.namprd21.prod.outlook.com (2603:10b6:302:1::16)
 by CY8PR12MB7636.namprd12.prod.outlook.com (2603:10b6:930:9f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 4 Apr
 2025 00:19:04 +0000
Received: from MWH0EPF000971E2.namprd02.prod.outlook.com
 (2603:10b6:302:1:cafe::9) by MW2PR2101CA0003.outlook.office365.com
 (2603:10b6:302:1::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.6 via Frontend Transport; Fri, 4
 Apr 2025 00:19:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000971E2.mail.protection.outlook.com (10.167.243.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Fri, 4 Apr 2025 00:19:03 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 3 Apr
 2025 19:18:59 -0500
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
Subject: [PATCH v12 02/26] x86/resctrl: Remove MSR reading of event configuration value
Date: Thu, 3 Apr 2025 19:18:11 -0500
Message-ID: <4f1551b39f669be01ea3e5938f165d207e2f7c6a.1743725907.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E2:EE_|CY8PR12MB7636:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f3dcf5a-648d-4ae9-78f3-08dd730e4e0d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|7416014|36860700013|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?sFhYbtGDGiDUHxSh/Rjt50o4tgq3mjGqaZGIJujjOg5pvO8aenGo1/kfXAZX?=
 =?us-ascii?Q?tNcbowlCRq4yZyCyT89xNCGqS3ITAG58DSSYtVeFpCWgyHng5fLhq6tejRWN?=
 =?us-ascii?Q?SMXTknxeK3GYrIMU8z2vc8F7/JVDdBbwEvp/e8NFQjUpZm7Pt66QPB59luc4?=
 =?us-ascii?Q?GsdwGhV9xU4EgXqcY9nQzIuFxHFEUXDG+HZqnYJg2UOfng34ZJjo6WHvSCNv?=
 =?us-ascii?Q?H50oS6aLd7SFu9xF1LGjlN6RGGBlPY1Ni8P8706DzVw7g53U8XZWmbs3RsRm?=
 =?us-ascii?Q?yO+YaGUHx2NpePZ5RF5krM2eBokqeKQsVbX2MYTKOGVZGBbDeo27nXiteL70?=
 =?us-ascii?Q?LTMr+8wn3GD3sjL9J/j/cNbD97KlCggpAjzqXvZOSLO4xd6VNL6z2aCVFPxW?=
 =?us-ascii?Q?tmxZ5EQpEQ3/x0j/R7YqrgUE7d2rJjIpsgCp6oKY31VzE8IMqjW432CgJ2tv?=
 =?us-ascii?Q?+GPTAaDgrYOJSQHKmM6b+Z3WLkt6x6xH37px+g/eWBAJKmQxh+e2sLZvrMJR?=
 =?us-ascii?Q?mTRpw/tEJ70ES8oXBeBhdVZ6SNrC87mZH/l2lC2IIvOgrUcYJZAdPmmw98Db?=
 =?us-ascii?Q?6WWNV70C2DMOGXY3VyVa7n0Ft0IWoMAnDoG7bQsDLO6r6/g7uAMKltRhUY24?=
 =?us-ascii?Q?Se3NCBq9NuCzN1XjkNuPlIpKWEBAOXZ4gY7LxBLzgOKqI2LZYbLWAd92p/BX?=
 =?us-ascii?Q?aguDKKcwlQVV5gdT9gM7Ic6oUviKChwk5/qAIXZELjI/V8jz0V/e70nvgsp3?=
 =?us-ascii?Q?guFJZlkLlXhpL1Nnuw1kcNZXEbzkhJLE+CZVsyMsT6g86dzFY6uAFGWpaHee?=
 =?us-ascii?Q?kqh9JpXgqIJeJ39iXvZ9YUFPU7iNNBXJEABytCfB8B+kvKfPWZNCYBN0vmKW?=
 =?us-ascii?Q?kYrRsO9XGlev2Nh4jxUMj28xtM7Gx07ysNNA+oYlF49/V5CROUbbLYuxb4sh?=
 =?us-ascii?Q?yb8SVXH7VLcGWX7dirRjL89A6VDjkSRQaHfpX6w0PAOBPQr2wBzaLsb3hf1i?=
 =?us-ascii?Q?jZQPqad4qQZO5jkdedMwObiU2OFKthOqWAdmIK9ti/hltn7ZuKbtM7W4Y/DH?=
 =?us-ascii?Q?UAIZUEp5PWmQyOLHticYZZQZldQGv79CMl15Ely+i3M+fdeViWKWSOwbCVjW?=
 =?us-ascii?Q?XIevuZJDSCA7e8Gz0pUBqVBAqOjuAUJ603MdtYi9SCGgwwe3j9ttI5Hind1L?=
 =?us-ascii?Q?rnKxdPKtqYdmjNbFnE9RKMKZin2DMk4c9IvS0bMw0YheIe6UPZvcx8X0tPiz?=
 =?us-ascii?Q?Yo5XYqWGhs2O0uj7Q8vv+ZbmYsRuGfRTqV3WbSctjF3Ek0isDKMwzk2fy05C?=
 =?us-ascii?Q?P/AfQDW5rmcoeN2IYKAze3eLefU+KvFn4y9/k+HVyLNyOaVlzAPY7CxKVhzZ?=
 =?us-ascii?Q?PmvMmM9n9TltKwcP/z709FplTfGp7YffLjKl6m6ap1cELAHew371uslLYO4u?=
 =?us-ascii?Q?IHe+BGgLMm85Mod/Ta+tmADvZV1fl6u2jERYq2VHMI8hOm3zQsuCEInsQNmz?=
 =?us-ascii?Q?DFrIoJCBBjHLiYU=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(7416014)(36860700013)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2025 00:19:03.1158
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f3dcf5a-648d-4ae9-78f3-08dd730e4e0d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000971E2.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7636

The event configuration is domain specific and initialized during domain
initialization. The values are stored in struct rdt_hw_mon_domain.

It is not required to read the configuration register every time user asks
for it. Use the value stored in struct rdt_hw_mon_domain instead.

Introduce resctrl_arch_mon_event_config_get() and
resctrl_arch_mon_event_config_set() to get/set architecture domain specific
mbm_total_cfg/mbm_local_cfg values.

Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v12: Removed the un-necessary initialization of mon_config_info structure.
     Changed wrmsrl instead of wrmsr to address the below comment.
     https://lore.kernel.org/lkml/0fc8dbd4-07d8-40bd-8eec-402b48762807@zytor.com/
     Fixed a minor typo in comment.
     Added comments to resctrl_arch_mon_event_config_get() and resctrl_arch_mon_event_config_set()
     Resolved the conflicts from the recent changes.
     This patch is for BMEC and there is no dependancy on ABMC feature. Moved it earlier.

v11: Moved the mon_config_info structure definition to internal.h.
     Moved resctrl_arch_mon_event_config_get() and resctrl_arch_mon_event_config_set()
     to monitor.c file.
     Renamed local variable from val to config_val.

v10: Moved the mon_config_info structure definition to resctrl.h.

v9: Removed QOS_L3_OCCUP_EVENT_ID switch case in resctrl_arch_mon_event_config_set.
    Fixed a unnecessary space.

v8: Renamed
    resctrl_arch_event_config_get() to resctrl_arch_mon_event_config_get().
    resctrl_arch_event_config_set() to resctrl_arch_mon_event_config_set().

v7: Removed check if (val == INVALID_CONFIG_VALUE) as resctrl_arch_event_config_get
    already prints warning.
    Kept the Event config value definitions as is.

v6: Fixed inconstancy with types. Made all the types to u32 for config
    value.
    Removed few rdt_last_cmd_puts as it is not necessary.
    Removed unused config value definitions.
    Few more updates to commit message.

v5: Introduced resctrl_arch_event_config_get and
    resctrl_arch_event_config_get() based on our discussion.
    https://lore.kernel.org/lkml/68e861f9-245d-4496-a72e-46fc57d19c62@amd.com/

v4: New patch.
---
 arch/x86/kernel/cpu/resctrl/monitor.c  | 52 +++++++++++++++++++++
 arch/x86/kernel/cpu/resctrl/rdtgroup.c | 63 +++++---------------------
 include/linux/resctrl.h                | 18 +++-----
 3 files changed, 71 insertions(+), 62 deletions(-)

diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/resctrl/monitor.c
index abd337fbd01d..b84cd48c3d95 100644
--- a/arch/x86/kernel/cpu/resctrl/monitor.c
+++ b/arch/x86/kernel/cpu/resctrl/monitor.c
@@ -1330,3 +1330,55 @@ void __init intel_rdt_mbm_apply_quirk(void)
 	mbm_cf_rmidthreshold = mbm_cf_table[cf_index].rmidthreshold;
 	mbm_cf = mbm_cf_table[cf_index].cf;
 }
+
+/*
+ * May run on CPU that does not belong to domain.
+ */
+u32 resctrl_arch_mon_event_config_get(struct rdt_mon_domain *d,
+				      enum resctrl_event_id eventid)
+{
+	struct rdt_hw_mon_domain *hw_dom = resctrl_to_arch_mon_dom(d);
+
+	switch (eventid) {
+	case QOS_L3_OCCUP_EVENT_ID:
+		break;
+	case QOS_L3_MBM_TOTAL_EVENT_ID:
+		return hw_dom->mbm_total_cfg;
+	case QOS_L3_MBM_LOCAL_EVENT_ID:
+		return hw_dom->mbm_local_cfg;
+	}
+
+	/* Never expect to get here */
+	WARN_ON_ONCE(1);
+
+	return INVALID_CONFIG_VALUE;
+}
+
+/*
+ * Runs on CPU that belongs to domain.
+ */
+void resctrl_arch_mon_event_config_set(void *info)
+{
+	struct resctrl_mon_config_info *mon_info = info;
+	struct rdt_hw_mon_domain *hw_dom;
+	unsigned int index;
+
+	index = mon_event_config_index_get(mon_info->evtid);
+	if (index == INVALID_CONFIG_INDEX)
+		return;
+
+	wrmsrl(MSR_IA32_EVT_CFG_BASE + index, mon_info->mon_config);
+
+	hw_dom = resctrl_to_arch_mon_dom(mon_info->d);
+
+	switch (mon_info->evtid) {
+	case QOS_L3_MBM_TOTAL_EVENT_ID:
+		hw_dom->mbm_total_cfg = mon_info->mon_config;
+		break;
+	case QOS_L3_MBM_LOCAL_EVENT_ID:
+		hw_dom->mbm_local_cfg = mon_info->mon_config;
+		break;
+	default:
+		break;
+	}
+}
diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
index bee32eaef8ab..b8100c89f1a6 100644
--- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
+++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
@@ -1614,34 +1614,11 @@ unsigned int mon_event_config_index_get(u32 evtid)
 	}
 }
 
-void resctrl_arch_mon_event_config_read(void *_config_info)
-{
-	struct resctrl_mon_config_info *config_info = _config_info;
-	unsigned int index;
-	u64 msrval;
-
-	index = mon_event_config_index_get(config_info->evtid);
-	if (index == INVALID_CONFIG_INDEX) {
-		pr_warn_once("Invalid event id %d\n", config_info->evtid);
-		return;
-	}
-	rdmsrl(MSR_IA32_EVT_CFG_BASE + index, msrval);
-
-	/* Report only the valid event configuration bits */
-	config_info->mon_config = msrval & MAX_EVT_CONFIG_BITS;
-}
-
-static void mondata_config_read(struct resctrl_mon_config_info *mon_info)
-{
-	smp_call_function_any(&mon_info->d->hdr.cpu_mask,
-			      resctrl_arch_mon_event_config_read, mon_info, 1);
-}
-
 static int mbm_config_show(struct seq_file *s, struct rdt_resource *r, u32 evtid)
 {
-	struct resctrl_mon_config_info mon_info;
 	struct rdt_mon_domain *dom;
 	bool sep = false;
+	u32 config_val;
 
 	cpus_read_lock();
 	mutex_lock(&rdtgroup_mutex);
@@ -1650,13 +1627,8 @@ static int mbm_config_show(struct seq_file *s, struct rdt_resource *r, u32 evtid
 		if (sep)
 			seq_puts(s, ";");
 
-		memset(&mon_info, 0, sizeof(struct resctrl_mon_config_info));
-		mon_info.r = r;
-		mon_info.d = dom;
-		mon_info.evtid = evtid;
-		mondata_config_read(&mon_info);
-
-		seq_printf(s, "%d=0x%02x", dom->hdr.id, mon_info.mon_config);
+		config_val = resctrl_arch_mon_event_config_get(dom, evtid);
+		seq_printf(s, "%d=0x%02x", dom->hdr.id, config_val);
 		sep = true;
 	}
 	seq_puts(s, "\n");
@@ -1687,35 +1659,23 @@ static int mbm_local_bytes_config_show(struct kernfs_open_file *of,
 	return 0;
 }
 
-void resctrl_arch_mon_event_config_write(void *_config_info)
-{
-	struct resctrl_mon_config_info *config_info = _config_info;
-	unsigned int index;
-
-	index = mon_event_config_index_get(config_info->evtid);
-	if (index == INVALID_CONFIG_INDEX) {
-		pr_warn_once("Invalid event id %d\n", config_info->evtid);
-		return;
-	}
-	wrmsr(MSR_IA32_EVT_CFG_BASE + index, config_info->mon_config, 0);
-}
-
 static void mbm_config_write_domain(struct rdt_resource *r,
 				    struct rdt_mon_domain *d, u32 evtid, u32 val)
 {
-	struct resctrl_mon_config_info mon_info = {0};
+	struct resctrl_mon_config_info mon_info;
+	u32 config_val;
 
 	/*
-	 * Read the current config value first. If both are the same then
+	 * Check the current config value first. If both are the same then
 	 * no need to write it again.
 	 */
+	config_val = resctrl_arch_mon_event_config_get(d, evtid);
+	if (config_val == INVALID_CONFIG_VALUE || config_val == val)
+		return;
+
 	mon_info.r = r;
 	mon_info.d = d;
 	mon_info.evtid = evtid;
-	mondata_config_read(&mon_info);
-	if (mon_info.mon_config == val)
-		return;
-
 	mon_info.mon_config = val;
 
 	/*
@@ -1724,7 +1684,8 @@ static void mbm_config_write_domain(struct rdt_resource *r,
 	 * are scoped at the domain level. Writing any of these MSRs
 	 * on one CPU is observed by all the CPUs in the domain.
 	 */
-	smp_call_function_any(&d->hdr.cpu_mask, resctrl_arch_mon_event_config_write,
+	smp_call_function_any(&d->hdr.cpu_mask,
+			      resctrl_arch_mon_event_config_set,
 			      &mon_info, 1);
 
 	/*
diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
index 880351ca3dfc..afa9aabf014c 100644
--- a/include/linux/resctrl.h
+++ b/include/linux/resctrl.h
@@ -361,7 +361,7 @@ int resctrl_arch_update_domains(struct rdt_resource *r, u32 closid);
 __init bool resctrl_arch_is_evt_configurable(enum resctrl_event_id evt);
 
 /**
- * resctrl_arch_mon_event_config_write() - Write the config for an event.
+ * resctrl_arch_mon_event_config_set() - Write the config for an event.
  * @config_info: struct resctrl_mon_config_info describing the resource, domain
  *		 and event.
  *
@@ -370,19 +370,15 @@ __init bool resctrl_arch_is_evt_configurable(enum resctrl_event_id evt);
  *
  * Called via IPI to reach a CPU that is a member of the specified domain.
  */
-void resctrl_arch_mon_event_config_write(void *config_info);
+void resctrl_arch_mon_event_config_set(void *config_info);
 
 /**
- * resctrl_arch_mon_event_config_read() - Read the config for an event.
- * @config_info: struct resctrl_mon_config_info describing the resource, domain
- *		 and event.
- *
- * Reads resource, domain and eventid from @config_info and reads the
- * hardware config value into config_info->mon_config.
- *
- * Called via IPI to reach a CPU that is a member of the specified domain.
+ * resctrl_arch_mon_event_config_get() - Get config value from the hardware domain.
+ * @d:			Monitoring domain to read config value
+ * @eventid:		enum resctrl_event_id describing type
  */
-void resctrl_arch_mon_event_config_read(void *config_info);
+u32 resctrl_arch_mon_event_config_get(struct rdt_mon_domain *d,
+				      enum resctrl_event_id eventid);
 
 /* For use by arch code to remap resctrl's smaller CDP CLOSID range */
 static inline u32 resctrl_get_config_index(u32 closid,
-- 
2.34.1

