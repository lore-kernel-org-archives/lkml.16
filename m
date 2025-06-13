Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2077.outbound.protection.outlook.com [40.107.244.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A105273D71;
	Fri, 13 Jun 2025 21:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749848914; cv=fail; b=T9ud9Gjh4k9law2oKzeoXbb0USXvWZTp2nkgB5v9UyoS5b+Dazrs+8a/VrKkiBsWvOToFLAle2/oWlIC0mTjdOs3epRLc5UWL+PdKP3Jc7Uw2rik0vOuvM0RoOs2HREIbAn3QjNTjBnJhA2zI+2qdEgxGdE8mAekn9+N94f02AE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749848914; c=relaxed/simple;
	bh=t7FceXhur6eS99OlIHp1Pm/paVSyYm2+GcRsbTB0pK0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=a3ztTe2nwlAQElujGQAuaJr/DAuMixTzmnmm+w46TpZ7sIgBu0GrKCNxTveQhHSz+/4c9Yo+M3rat+/+xviMYN7/YuMs0GdNdVypp2z3zdV6XQIzP+7ZDDkbVS6Vq3ov10v8XtaSj+JVJxKgLk2202chWQO56KFEE1pwfOyjlx4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=GQuF0ycc; arc=fail smtp.client-ip=40.107.244.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="GQuF0ycc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EDrnBbeOj1+jqI+NOcswgAIbftWHEugk9aBfoxAS3qO38H8PCNIiqNg5Z5row2cFTcu7oztXaf3cBu6YH0Kl8AMoRZw8HR7nBZh0R3frlpLi/hXr0aCFo81o81msjcwNecfs8KQo/dMSMXl+urwZ0Rj8GHcbZSKf4nVjcUfS+eE/4vOjsqqb9PSMVBryKsZNjr5trEE7Qap1e6tFF1NATKZKEmXR8Qlpyy4ABpSsCZLnblmjvlMVz7UiSd8wjePZCK7OpzKR6bX9LpnHCewyemyfLuCKYdoRV/Nz2zXsK4MyPkRXDUPbVA3jV5UIhtIKI5o83myYCY7oc7eO/1bZzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j3rN78gYqWllDOM/DrGTYIsCavJ8qx4Rx5lQhSIxbuQ=;
 b=fvtbCAqKtPSAuINuhBC6cf60dcdwi1jAqR7gTyQ7x7gokj1LDv61jzIvy5YsIoN0SkIwL+WikrGT0BSd35vcI5ulqUfZx3UjkuMWxsyBmH+WTMYn3RQPsvaXzSqlGPSbNJ3m8KO6FWgZTPJRMOOawd7VTtIB11TLt4hLsCp4/ddf8bMX2S71woRK1qHgcaMb7HbCcmpDAZlJRti1mUKaSE5VD2np8ME1XuHosATfUhmafMyUM72bIoAccwTxAieykIg99eYdft6kxdVrdQiBf3WGTyQ+7msIXCp3oV95zfyXoFgqJhoLC15RfvMOqDwyqJzPtAeTS2sCOX/n2bTFHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lwn.net smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j3rN78gYqWllDOM/DrGTYIsCavJ8qx4Rx5lQhSIxbuQ=;
 b=GQuF0yccGhj0073vk1dPn4D0vrj08kLOe2X7O/hIk0ARg/eOczztr+J4B2WlND+JZIe8EQQxDvCeb2bNuAqfBPLVC2CmaYwzVSyMNFrWUyh/y01TJl1cKpy8EEIK+J5ZrN2deh/bRPiEFaNxkI37dJNzqWZeva+9kDZe4+AYPrU=
Received: from DM6PR05CA0061.namprd05.prod.outlook.com (2603:10b6:5:335::30)
 by IA4PR12MB9785.namprd12.prod.outlook.com (2603:10b6:208:55b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.26; Fri, 13 Jun
 2025 21:08:27 +0000
Received: from CY4PEPF0000EDD0.namprd03.prod.outlook.com
 (2603:10b6:5:335:cafe::80) by DM6PR05CA0061.outlook.office365.com
 (2603:10b6:5:335::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.19 via Frontend Transport; Fri,
 13 Jun 2025 21:08:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EDD0.mail.protection.outlook.com (10.167.241.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Fri, 13 Jun 2025 21:08:27 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 13 Jun
 2025 16:08:25 -0500
From: Babu Moger <babu.moger@amd.com>
To: <babu.moger@amd.com>, <corbet@lwn.net>, <tony.luck@intel.com>,
	<reinette.chatre@intel.com>, <Dave.Martin@arm.com>, <james.morse@arm.com>,
	<tglx@linutronix.de>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>
CC: <x86@kernel.org>, <hpa@zytor.com>, <akpm@linux-foundation.org>,
	<rostedt@goodmis.org>, <paulmck@kernel.org>, <thuth@redhat.com>,
	<ardb@kernel.org>, <gregkh@linuxfoundation.org>, <seanjc@google.com>,
	<thomas.lendacky@amd.com>, <pawan.kumar.gupta@linux.intel.com>,
	<manali.shukla@amd.com>, <perry.yuan@amd.com>, <kai.huang@intel.com>,
	<peterz@infradead.org>, <xiaoyao.li@intel.com>, <kan.liang@linux.intel.com>,
	<mario.limonciello@amd.com>, <xin3.li@intel.com>, <gautham.shenoy@amd.com>,
	<xin@zytor.com>, <chang.seok.bae@intel.com>, <fenghuay@nvidia.com>,
	<peternewman@google.com>, <maciej.wieczor-retman@intel.com>,
	<eranian@google.com>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v14 22/32] x86,fs/resctrl: Add the support for reading ABMC counters
Date: Fri, 13 Jun 2025 16:05:06 -0500
Message-ID: <1b6a8a9a076c2893efb456398d266bc50c241ee4.1749848715.git.babu.moger@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1749848714.git.babu.moger@amd.com>
References: <cover.1749848714.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD0:EE_|IA4PR12MB9785:EE_
X-MS-Office365-Filtering-Correlation-Id: 0847453e-92ab-4c7e-4e28-08ddaabe7134
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|7416014|376014|921020|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?DF7Ne9KT2xtE/Pq73Yc/ecO4+stA60ZiacyR1CwUojy1hVvWtat+tSS2VfE/?=
 =?us-ascii?Q?JYlEvDFz3DsTnEalukbbXRL8rj0mo+2n+GFNoDggN9dmA+loRjGK/zzsm5Qb?=
 =?us-ascii?Q?uuGGprJP3tsOjMPaOMx9Mw/8sMXKZA0jXXqv/0wDMGnK0rbq6zRP2mtrksE1?=
 =?us-ascii?Q?QO6AGLNYMqITbThr368g37XB4pP7x42CGV0mgoKdnpAozLH1KxX5/ZKdW8+U?=
 =?us-ascii?Q?vyF+sm5ZZmbPBjvDEr5RwcEGb3aYalIQbeKYj0KQDQIN0K8igqRBj4nY9wf5?=
 =?us-ascii?Q?D0/Rv5jPn4iGqP0FqSvKxvOrqIWgauW05dBeUCEMY4oqXFz/06KU+cHKWx22?=
 =?us-ascii?Q?ojupIpJROwegTjtvraCw7WKIRkFHI/tFMmssAnRRsqmJ5sZeKti9ax+3+xDJ?=
 =?us-ascii?Q?iyHI8ejcm3t7whoITtvv25SSU366zDgdMWoT2enCFCI7ZIosTfGWC3SJHeeb?=
 =?us-ascii?Q?2fPMpHyF0NpJDqDzRPadI57CkK8gKwga/f/7CWxI+31Vczolw58BzNXF+DNp?=
 =?us-ascii?Q?6vATiqHobTRt1NNUTvAsc7F3h7dXgMGnFMJ1bMb3QSLhySefa3BeMw3eTCUQ?=
 =?us-ascii?Q?8cKU1fN2nSPAaqnekci5EC9W9rRITOSOUkNE8NV7O88d/8iEAmE9HdBzqxsp?=
 =?us-ascii?Q?+URP/o/38LcUAF1+Hdx6CR0fYwX2E2eovoZMSC8iJ9ktI5ZWWr+HjQQSdMMW?=
 =?us-ascii?Q?h9TqRXv97UMRzb3ivMMZOXo0f8BIeDrcD0IIWybzjc5j2ZfEcH2PK6ORvnC5?=
 =?us-ascii?Q?czMDlaQLBn3XttDa7qZxSi/yT35Ihvh7q+gYUHraUrS0SCJZf2YYov6zMqxr?=
 =?us-ascii?Q?OonqQHzTF8b3aIu5VDiXSxam9kuQLoaEmQoP1p5WFlVECrktgYm8EwR26idn?=
 =?us-ascii?Q?c1Kpeb+77HJl/e6UNPdrZn+QUFKSgyoiU0NEMSWbELRftjcBktGgrq0/lKfi?=
 =?us-ascii?Q?DyqO4ruA1MX6vvfL22iEc2WmrlY5nUmO0ujTOQd0aPhhx8GmTJzoRfGvz9fI?=
 =?us-ascii?Q?/J5OJ/lfUa7sMxjqyuIJa7UWrLSiwTFouMqz5hrBczNZa24kKTmAXWgClTfO?=
 =?us-ascii?Q?q4uzuKokQWCmmKj/ncrzArjzX35cs0xC9F+atJL2CX1nauUyi+c027sp01+1?=
 =?us-ascii?Q?lPVxyfDFQwhH83yaGca/FaBV2Wu3K+x5x1iG6JsXCdJpgCrcRnHl/wa/p5uX?=
 =?us-ascii?Q?Al6Qi3f5oruwunqlERLRYjQsTJVF7c+JNumqmolkIb1pHhXlGva8uXgiPYyT?=
 =?us-ascii?Q?i6Z2DttdLZF0R3/OhWLmtTVNVg5laSORd1gKdijgFIQ5y5nY45a7pF5VazoO?=
 =?us-ascii?Q?+x86MQBfg+NBe/ZZzTFfNysFw5jYI0OarK/TWYW5IT06o2/tzyeNQ5pXeMZW?=
 =?us-ascii?Q?PAyzswAlyEMPhi1ZcShYfxBKUcKF8aEAxNEZHyiXKcCvtW0KvbPhQiq4ZoHI?=
 =?us-ascii?Q?fp7UxFcv00nflZAHSc9SyK7Y7HE5JUsxhVvmykc/2PvJLa9DCqNOhuPeUKjl?=
 =?us-ascii?Q?bMmCAlDi17PbbKq9LwBk3Mq7WSpZX2ymRC7ELHfQBEuhXkD0an7VSk3lEg?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(7416014)(376014)(921020)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 21:08:27.5249
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0847453e-92ab-4c7e-4e28-08ddaabe7134
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD0.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR12MB9785

System software can read resctrl event data for a particular resource by
writing the RMID and Event Identifier (EvtID) to the QM_EVTSEL register
and then reading the event data from the QM_CTR register.

In ABMC mode, the event data of a specific counter ID can be read by
setting the following fields in QM_EVTSEL.ExtendedEvtID = 1,
QM_EVTSEL.EvtID = L3CacheABMC (=1) and setting [RMID] to the desired
counter ID. Reading QM_CTR will then return the contents of the specified
counter ID. The E bit will be set if the counter configuration was invalid,
or if an invalid counter ID was set in the QM_EVTSEL[RMID] field.

Introduce __cntr_id_read_phys() to read event data for a specific counter
ID. In ABMC mode, ensure QM_EVTSEL is properly configured by setting the
counter ID, Extended Event Identifier, and Event Identifier.

QM_EVTSEL Register definition:
=======================================================
Bits	Mnemonic	Description
=======================================================
63:44	--		Reserved
43:32   RMID		Resource Monitoring Identifier
31	ExtEvtID	Extended Event Identifier
30:8	--		Reserved
7:0	EvtID		Event Identifier
=======================================================

Link: https://www.amd.com/content/dam/amd/en/documents/processor-tech-docs/programmer-references/40332.pdf
Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v14: Updated the context in changelog. Added text in imperative tone.
     Added WARN_ON_ONCE() when cntr_id < 0.
     Improved code documentation in include/linux/resctrl.h.
     Added the check in mbm_update() to skip overflow handler when counter is unassigned.

v13: Split the patch into 2. First one to handle the passing of rdtgroup structure to few
     functions( __mon_event_count and mbm_update(). Second one to handle ABMC counter reading.
     Added new function __cntr_id_read_phys() to handle ABMC event reading.
     Updated kernel doc for resctrl_arch_reset_rmid() and resctrl_arch_rmid_read().
     Resolved conflicts caused by the recent FS/ARCH code restructure.
     The monitor.c file has now been split between the FS and ARCH directories.

v12: New patch to support extended event mode when ABMC is enabled.
---
 arch/x86/kernel/cpu/resctrl/internal.h |  6 +++
 arch/x86/kernel/cpu/resctrl/monitor.c  | 66 ++++++++++++++++++++++----
 fs/resctrl/monitor.c                   | 26 +++++++---
 include/linux/resctrl.h                | 13 +++--
 4 files changed, 94 insertions(+), 17 deletions(-)

diff --git a/arch/x86/kernel/cpu/resctrl/internal.h b/arch/x86/kernel/cpu/resctrl/internal.h
index 23c17ce172d3..77a9ce4a8403 100644
--- a/arch/x86/kernel/cpu/resctrl/internal.h
+++ b/arch/x86/kernel/cpu/resctrl/internal.h
@@ -40,6 +40,12 @@ struct arch_mbm_state {
 /* Setting bit 0 in L3_QOS_EXT_CFG enables the ABMC feature. */
 #define ABMC_ENABLE_BIT			0
 
+/*
+ * Qos Event Identifiers.
+ */
+#define ABMC_EXTENDED_EVT_ID		BIT(31)
+#define ABMC_EVT_ID			BIT(0)
+
 /**
  * struct rdt_hw_ctrl_domain - Arch private attributes of a set of CPUs that share
  *			       a resource for a control function
diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/resctrl/monitor.c
index 6b0ea4b17c7a..ee0aa741cf6c 100644
--- a/arch/x86/kernel/cpu/resctrl/monitor.c
+++ b/arch/x86/kernel/cpu/resctrl/monitor.c
@@ -157,6 +157,41 @@ static int __rmid_read_phys(u32 prmid, enum resctrl_event_id eventid, u64 *val)
 	return 0;
 }
 
+static int __cntr_id_read_phys(u32 cntr_id, u64 *val)
+{
+	u64 msr_val;
+
+	/*
+	 * QM_EVTSEL Register definition:
+	 * =======================================================
+	 * Bits    Mnemonic        Description
+	 * =======================================================
+	 * 63:44   --              Reserved
+	 * 43:32   RMID            Resource Monitoring Identifier
+	 * 31      ExtEvtID        Extended Event Identifier
+	 * 30:8    --              Reserved
+	 * 7:0     EvtID           Event Identifier
+	 * =======================================================
+	 * The contents of a specific counter can be read by setting the
+	 * following fields in QM_EVTSEL.ExtendedEvtID(=1) and
+	 * QM_EVTSEL.EvtID = L3CacheABMC (=1) and setting [RMID] to the
+	 * desired counter ID. Reading QM_CTR will then return the
+	 * contents of the specified counter. The E bit will be set if the
+	 * counter configuration was invalid, or if an invalid counter ID
+	 * was set in the QM_EVTSEL[RMID] field.
+	 */
+	wrmsr(MSR_IA32_QM_EVTSEL, ABMC_EXTENDED_EVT_ID | ABMC_EVT_ID, cntr_id);
+	rdmsrl(MSR_IA32_QM_CTR, msr_val);
+
+	if (msr_val & RMID_VAL_ERROR)
+		return -EIO;
+	if (msr_val & RMID_VAL_UNAVAIL)
+		return -EINVAL;
+
+	*val = msr_val;
+	return 0;
+}
+
 static struct arch_mbm_state *get_arch_mbm_state(struct rdt_hw_mon_domain *hw_dom,
 						 u32 rmid,
 						 enum resctrl_event_id eventid)
@@ -172,7 +207,7 @@ static struct arch_mbm_state *get_arch_mbm_state(struct rdt_hw_mon_domain *hw_do
 }
 
 void resctrl_arch_reset_rmid(struct rdt_resource *r, struct rdt_mon_domain *d,
-			     u32 unused, u32 rmid,
+			     u32 unused, u32 rmid, int cntr_id,
 			     enum resctrl_event_id eventid)
 {
 	struct rdt_hw_mon_domain *hw_dom = resctrl_to_arch_mon_dom(d);
@@ -184,9 +219,16 @@ void resctrl_arch_reset_rmid(struct rdt_resource *r, struct rdt_mon_domain *d,
 	if (am) {
 		memset(am, 0, sizeof(*am));
 
-		prmid = logical_rmid_to_physical_rmid(cpu, rmid);
-		/* Record any initial, non-zero count value. */
-		__rmid_read_phys(prmid, eventid, &am->prev_msr);
+		if (resctrl_arch_mbm_cntr_assign_enabled(r) &&
+		    resctrl_is_mbm_event(eventid)) {
+			if (WARN_ON_ONCE(cntr_id < 0))
+				return;
+			__cntr_id_read_phys(cntr_id, &am->prev_msr);
+		} else {
+			prmid = logical_rmid_to_physical_rmid(cpu, rmid);
+			/* Record any initial, non-zero count value. */
+			__rmid_read_phys(prmid, eventid, &am->prev_msr);
+		}
 	}
 }
 
@@ -218,8 +260,8 @@ static u64 mbm_overflow_count(u64 prev_msr, u64 cur_msr, unsigned int width)
 }
 
 int resctrl_arch_rmid_read(struct rdt_resource *r, struct rdt_mon_domain *d,
-			   u32 unused, u32 rmid, enum resctrl_event_id eventid,
-			   u64 *val, void *ignored)
+			   u32 unused, u32 rmid, int cntr_id,
+			   enum resctrl_event_id eventid, u64 *val, void *ignored)
 {
 	struct rdt_hw_mon_domain *hw_dom = resctrl_to_arch_mon_dom(d);
 	struct rdt_hw_resource *hw_res = resctrl_to_arch_res(r);
@@ -231,8 +273,16 @@ int resctrl_arch_rmid_read(struct rdt_resource *r, struct rdt_mon_domain *d,
 
 	resctrl_arch_rmid_read_context_check();
 
-	prmid = logical_rmid_to_physical_rmid(cpu, rmid);
-	ret = __rmid_read_phys(prmid, eventid, &msr_val);
+	if (resctrl_arch_mbm_cntr_assign_enabled(r) &&
+	    resctrl_is_mbm_event(eventid)) {
+		if (WARN_ON_ONCE(cntr_id < 0))
+			return cntr_id;
+		ret = __cntr_id_read_phys(cntr_id, &msr_val);
+	} else {
+		prmid = logical_rmid_to_physical_rmid(cpu, rmid);
+		ret = __rmid_read_phys(prmid, eventid, &msr_val);
+	}
+
 	if (ret)
 		return ret;
 
diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
index 31e08d891db2..ef6ef58f180b 100644
--- a/fs/resctrl/monitor.c
+++ b/fs/resctrl/monitor.c
@@ -159,7 +159,11 @@ void __check_limbo(struct rdt_mon_domain *d, bool force_free)
 			break;
 
 		entry = __rmid_entry(idx);
-		if (resctrl_arch_rmid_read(r, d, entry->closid, entry->rmid,
+		/*
+		 * cntr_id is not relevant for QOS_L3_OCCUP_EVENT_ID.
+		 * Pass dummy value -1.
+		 */
+		if (resctrl_arch_rmid_read(r, d, entry->closid, entry->rmid, -1,
 					   QOS_L3_OCCUP_EVENT_ID, &val,
 					   arch_mon_ctx)) {
 			rmid_dirty = true;
@@ -358,6 +362,7 @@ static struct mbm_state *get_mbm_state(struct rdt_mon_domain *d, u32 closid,
 
 static int __mon_event_count(struct rdtgroup *rdtgrp, struct rmid_read *rr)
 {
+	int cntr_id = mbm_cntr_get(rr->r, rr->d, rdtgrp, rr->evtid);
 	int cpu = smp_processor_id();
 	u32 closid = rdtgrp->closid;
 	u32 rmid = rdtgrp->mon.rmid;
@@ -368,7 +373,7 @@ static int __mon_event_count(struct rdtgroup *rdtgrp, struct rmid_read *rr)
 	u64 tval = 0;
 
 	if (rr->first) {
-		resctrl_arch_reset_rmid(rr->r, rr->d, closid, rmid, rr->evtid);
+		resctrl_arch_reset_rmid(rr->r, rr->d, closid, rmid, cntr_id, rr->evtid);
 		m = get_mbm_state(rr->d, closid, rmid, rr->evtid);
 		if (m)
 			memset(m, 0, sizeof(struct mbm_state));
@@ -379,7 +384,7 @@ static int __mon_event_count(struct rdtgroup *rdtgrp, struct rmid_read *rr)
 		/* Reading a single domain, must be on a CPU in that domain. */
 		if (!cpumask_test_cpu(cpu, &rr->d->hdr.cpu_mask))
 			return -EINVAL;
-		rr->err = resctrl_arch_rmid_read(rr->r, rr->d, closid, rmid,
+		rr->err = resctrl_arch_rmid_read(rr->r, rr->d, closid, rmid, cntr_id,
 						 rr->evtid, &tval, rr->arch_mon_ctx);
 		if (rr->err)
 			return rr->err;
@@ -405,7 +410,8 @@ static int __mon_event_count(struct rdtgroup *rdtgrp, struct rmid_read *rr)
 	list_for_each_entry(d, &rr->r->mon_domains, hdr.list) {
 		if (d->ci_id != rr->ci_id)
 			continue;
-		err = resctrl_arch_rmid_read(rr->r, d, closid, rmid,
+		cntr_id = mbm_cntr_get(rr->r, d, rdtgrp, rr->evtid);
+		err = resctrl_arch_rmid_read(rr->r, d, closid, rmid, cntr_id,
 					     rr->evtid, &tval, rr->arch_mon_ctx);
 		if (!err) {
 			rr->val += tval;
@@ -638,12 +644,20 @@ static void mbm_update(struct rdt_resource *r, struct rdt_mon_domain *d,
 	/*
 	 * This is protected from concurrent reads from user as both
 	 * the user and overflow handler hold the global mutex.
+	 * Skip the update if the counter is unassigned while mbm_event
+	 * mode is enabled.
 	 */
-	if (resctrl_is_mon_event_enabled(QOS_L3_MBM_TOTAL_EVENT_ID))
+	if (resctrl_is_mon_event_enabled(QOS_L3_MBM_TOTAL_EVENT_ID) &&
+	    (!resctrl_arch_mbm_cntr_assign_enabled(r) ||
+	     mbm_cntr_get(r, d, rdtgrp, QOS_L3_MBM_TOTAL_EVENT_ID) >= 0)) {
 		mbm_update_one_event(r, d, rdtgrp, QOS_L3_MBM_TOTAL_EVENT_ID);
+	}
 
-	if (resctrl_is_mon_event_enabled(QOS_L3_MBM_LOCAL_EVENT_ID))
+	if (resctrl_is_mon_event_enabled(QOS_L3_MBM_LOCAL_EVENT_ID) &&
+	    (!resctrl_arch_mbm_cntr_assign_enabled(r) ||
+	     mbm_cntr_get(r, d, rdtgrp, QOS_L3_MBM_LOCAL_EVENT_ID) >= 0)) {
 		mbm_update_one_event(r, d, rdtgrp, QOS_L3_MBM_LOCAL_EVENT_ID);
+	}
 }
 
 /*
diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
index 1539d1faa1a1..4b52bac5dbbc 100644
--- a/include/linux/resctrl.h
+++ b/include/linux/resctrl.h
@@ -507,6 +507,9 @@ void resctrl_offline_cpu(unsigned int cpu);
  *			counter may match traffic of both @closid and @rmid, or @rmid
  *			only.
  * @rmid:		rmid of the counter to read.
+ * @cntr_id:		Counter ID used to read MBM events in mbm_event mode. Only valid
+ *			when mbm_event mode is enabled and @eventid is an MBM event.
+ *			Can be negative when invalid.
  * @eventid:		eventid to read, e.g. L3 occupancy.
  * @val:		result of the counter read in bytes.
  * @arch_mon_ctx:	An architecture specific value from
@@ -524,8 +527,9 @@ void resctrl_offline_cpu(unsigned int cpu);
  * 0 on success, or -EIO, -EINVAL etc on error.
  */
 int resctrl_arch_rmid_read(struct rdt_resource *r, struct rdt_mon_domain *d,
-			   u32 closid, u32 rmid, enum resctrl_event_id eventid,
-			   u64 *val, void *arch_mon_ctx);
+			   u32 closid, u32 rmid, int cntr_id,
+			   enum resctrl_event_id eventid, u64 *val,
+			   void *arch_mon_ctx);
 
 /**
  * resctrl_arch_rmid_read_context_check()  - warn about invalid contexts
@@ -566,12 +570,15 @@ struct rdt_domain_hdr *resctrl_find_domain(struct list_head *h, int id,
  * @closid:	closid that matches the rmid. Depending on the architecture, the
  *		counter may match traffic of both @closid and @rmid, or @rmid only.
  * @rmid:	The rmid whose counter values should be reset.
+ * @cntr_id:	Counter ID used to read MBM events in mbm_event mode. Only valid
+ *		when mbm_event mode is enabled and @eventid is an MBM event. Can
+ *		be negative when invalid.
  * @eventid:	The eventid whose counter values should be reset.
  *
  * This can be called from any CPU.
  */
 void resctrl_arch_reset_rmid(struct rdt_resource *r, struct rdt_mon_domain *d,
-			     u32 closid, u32 rmid,
+			     u32 closid, u32 rmid, int cntr_id,
 			     enum resctrl_event_id eventid);
 
 /**
-- 
2.34.1

