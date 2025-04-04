Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2078.outbound.protection.outlook.com [40.107.243.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84AA61A5BB1;
	Fri,  4 Apr 2025 00:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743726089; cv=fail; b=K96SijKXSUtgm7O581YW8aq4uzReH3UW7Z1sVbN4e6/FX6vVSJ3gF7tZfYI2fUNfzDiW4NDwAqN6GKQi1GMdJj+dj6AQxrKSPuEmhZPYoeS8dJD1dj2gg+GdtZ+kCHcLiB+oAen7tUHMeA5upMMF6Mv9bxjhKUPv/rGddJJxT5Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743726089; c=relaxed/simple;
	bh=Duh3btmQB/yvDxePzfvGWT6icdqy6pjQazl6hOTIOsE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=M/lG/T+hLvW3Oc0J1SNskQAUxgQNpQyg86j9UemtvPeWpm4naIY/6a3XgIFcpGXTZY9K+dBHbBL+zBhqMGnUEW1ygfuZFoKFXtSJemFpvisFbQaW6lPxIzITHKbnaX34EotBuGJmgvW/2r3Y7Ae2qwLRVvTk8qnfhx7PXGTbvxA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=FVPMK7lC; arc=fail smtp.client-ip=40.107.243.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="FVPMK7lC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P5+HX2z10Hzo0o5QhRiLz3M3GuTXCbZIeG143AvxQ0UpM1LMSBwckTUxHFW/wmsJ+Kl41HkCgkDXfAqVPOSDMV/WCZ1HLez9b8eNLzwqSsLtBje32mP8aI6/mTVusyv0TRsqnfa64x58yfO5V/z65X3OkEuoUJ3kttf9sTTcnqUzBX8O2Bru5ZnPGUvHZkWM/oppYWt04R8ALIYP/0wXBXE9zIAJgIG+u1DOIS+34cbxKsEiiE1vxvQIvk8QW751eVPbLcVoEcNOJrxP1pb96Yr8J+bAHfwz659s9L/3kUgBVtOiJCKo58SCtmGVHkeTXhPEuN0YFcRe4Q7UohKoAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NCnRkGJBUBKzte/rlTAjohN6aFVXycDWxzIuXA+5juQ=;
 b=eWWWkElvu9/yd+MHpbzByXtGG23HgW/VbEpPeR2rCqgGwApJrPajVxxZ+xxaaA4zmkIP4tcEyMwOD2+9BjpGR+QQumZmzCuhct49EXm8on2A39Ibxm7MOH6cXntNU1XEtmNr/2lcR638xqJpECcepBn4/P63usNfIxhIHq75lCbyzNG0cuBll79rZTs8a1bUiUYjuf3pa+3L5OwpMdk61fTugu0qAs6Tx+C7zqXT0dGJ26xIbacdNnSRpuMx15bS020zn64+S6+htUlmNeTye+VUtSBDtdb+mxBZjRoatsouDFjEyApHF/3XDBzZ0wyYJNHWjNmbY3Q8hPvkdu+bJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NCnRkGJBUBKzte/rlTAjohN6aFVXycDWxzIuXA+5juQ=;
 b=FVPMK7lCtl9XM5QAILiLjZwaCOozMBSQfnGZx9bwBdsnCJbJB0jF/LrT0HQmkC1MGIwCuq6V5p6taAHxGugiT7OTe14YZT0jYL/usa46g3BM5VxvojcsiLOi0JHj+x3RnOOBx1fpBIFFL6g2XZHjSVBom2SXFwLPldOZ8ccZCO4=
Received: from BYAPR05CA0007.namprd05.prod.outlook.com (2603:10b6:a03:c0::20)
 by CH3PR12MB8547.namprd12.prod.outlook.com (2603:10b6:610:164::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.47; Fri, 4 Apr
 2025 00:21:23 +0000
Received: from MWH0EPF000971E2.namprd02.prod.outlook.com
 (2603:10b6:a03:c0:cafe::5f) by BYAPR05CA0007.outlook.office365.com
 (2603:10b6:a03:c0::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.37 via Frontend Transport; Fri,
 4 Apr 2025 00:21:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000971E2.mail.protection.outlook.com (10.167.243.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Fri, 4 Apr 2025 00:21:22 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 3 Apr
 2025 19:21:19 -0500
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
Subject: [PATCH v12 17/26] x86/resctrl: Add the support for reading ABMC counters
Date: Thu, 3 Apr 2025 19:18:26 -0500
Message-ID: <0389f4beff82ded90aad4bd670210c56cf1f799e.1743725907.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E2:EE_|CH3PR12MB8547:EE_
X-MS-Office365-Filtering-Correlation-Id: 9945824e-050f-4213-6986-08dd730ea125
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|7416014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4fBwTpHkE71c87DsZCOszj9IC1TMHUQhVUhtHCw7y1i9rB2kwlEPdIJvi4qk?=
 =?us-ascii?Q?VKs+QZGMI0dNxHx/XaBumtIfiyPhBSADbZxXNhyKuRlKyBlM6W48ZYgZ7w5e?=
 =?us-ascii?Q?izkskdcVq5kwZQ2nJacolyoou4fOQJYmgHO4WYJIdn90wHh/Ux70fOIzyFFu?=
 =?us-ascii?Q?POBkNYAX47ZUf82J08LURvKE6nllhM9Jl5Ph0XIagXrimqfpnO0zRXonweV2?=
 =?us-ascii?Q?o0G23bdHMnbKTKYqbU3LdId8zmJRUrQKpGs+ouTXv8M+id2LdCZFHpxfFTwd?=
 =?us-ascii?Q?wH3FcwJ+rminBb+FtfEyoaghTM2z7KUPjA+yNs8RQrDIorOP+PDcNTXv672A?=
 =?us-ascii?Q?8TOJ3GqKhLDdPXQIRDKnaoX4M/JVECKgDf6xcCXFKrH9fJIMUt/v4ucSjdtI?=
 =?us-ascii?Q?mpMT8GSmWogKTfBSuHvcKzKf8oWST4AF+KHttdmDIxLBr9uE6FU2xGhHNHGJ?=
 =?us-ascii?Q?+kxGEdPExFG21AB1Of2SeQcHVDSmi28pBvXcbeYahl1Y6YmopTigksBlqHKl?=
 =?us-ascii?Q?7tUvQV8gMoS89QRo1Jku6aUOfUt4qXYekacyJxgclV/UiyxioPGykyVjxEH8?=
 =?us-ascii?Q?Nq5WYUGsHNELcxCO9M2lAhdna3OG6DqJiYi8hc6G3ITl9pnZZBKR0pkuEqEU?=
 =?us-ascii?Q?U6JsvTizFU4xwcXnJalENwHwS1ti0KZ2WKztPqPESlUPQRx+blPOVHsgEnjp?=
 =?us-ascii?Q?B4V1fdcfdKpB92NQ83+5ormIJtTTehYianejsKqTRWdH0y4q9zVxzaq3FoiQ?=
 =?us-ascii?Q?qIQOFRpFYuDHw4mCB6W91cg216YDGsapnSjz8znAi1dEfdtGl4y4ZwRvJ4Z5?=
 =?us-ascii?Q?+dUP4RoZboj1b5NudPLNzanoIdAZY8ccCdlLrmXpuqMmYm+FwrLCLzkGrQoP?=
 =?us-ascii?Q?5WyyOlg0fKlr3Jnbsm9f4Q+JrhgRmkec5Wqz/OblE0zW/UNqtoDb9caR0ik+?=
 =?us-ascii?Q?jbtzN0CA0xkuk4IgETrBmVYRLtcgfNXGZxZa4YFqRDOcS27e9/fULHDlpVTx?=
 =?us-ascii?Q?/RHY6QXIA2a2piDNlwUwjL1gBhG/qMNSa/7RE9dI3uVHSAAj95D1xYpAFc0c?=
 =?us-ascii?Q?cClu/E0Ce+QdtxKYqhM2YaNojvCNbBOkZNMgQfPmLA54CKn4bWt0R0olcVA7?=
 =?us-ascii?Q?GknGLssYuBvk4eGClcbj9l78LQKGVOBvooZUyoWOHI9JjWqxsvT9QH6dIZzi?=
 =?us-ascii?Q?PsQgFBOMfo62/PIrNVJjQRIY6JjkYortPRLdTH6eDHyNgIcfJ9ijir0tRM8K?=
 =?us-ascii?Q?k4p4fw1eVHLbRmWczt2CDzuzFMReGUUEjqNXmJlWVi21ScQN4N4dEVUnU1aM?=
 =?us-ascii?Q?w2sYM/Xf3TFjgG7n/YH5bNiHtEtF6kyU5bEUQd18hPQKo3iJTvIFZa2bZKIq?=
 =?us-ascii?Q?Ime9vvm6FFI/y4zBZO2zf7hB5rfEubuIxIht03GymTnmfDFOtFAUqBQDpAZ+?=
 =?us-ascii?Q?5153dmPUlFHTx32MzfWg60jQw8YB+4jNX97i3lLh0CJsRKZy6DGkAkuaLJKy?=
 =?us-ascii?Q?5/AxyOfD6KmzBz8=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(7416014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2025 00:21:22.5235
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9945824e-050f-4213-6986-08dd730ea125
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000971E2.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8547

Software can read the assignable counters using the QM_EVTSEL and QM_CTR
register pair.

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

The contents of a specific counter can be read by setting the following
fields in QM_EVTSEL.ExtendedEvtID = 1, QM_EVTSEL.EvtID = L3CacheABMC (=1)
and setting [RMID] to the desired counter ID. Reading QM_CTR will then
return the contents of the specified counter. The E bit will be set if the
counter configuration was invalid, or if an invalid counter ID was set
in the QM_EVTSEL[RMID] field.

Link: https://www.amd.com/content/dam/amd/en/documents/processor-tech-docs/programmer-references/40332.pdf
Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v12: New patch to support extended event mode when ABMC is enabled.
---
 arch/x86/kernel/cpu/resctrl/ctrlmondata.c |  4 +-
 arch/x86/kernel/cpu/resctrl/internal.h    |  7 +++
 arch/x86/kernel/cpu/resctrl/monitor.c     | 69 ++++++++++++++++-------
 include/linux/resctrl.h                   |  9 +--
 4 files changed, 63 insertions(+), 26 deletions(-)

diff --git a/arch/x86/kernel/cpu/resctrl/ctrlmondata.c b/arch/x86/kernel/cpu/resctrl/ctrlmondata.c
index 2225c40b8888..da78389c6ac7 100644
--- a/arch/x86/kernel/cpu/resctrl/ctrlmondata.c
+++ b/arch/x86/kernel/cpu/resctrl/ctrlmondata.c
@@ -636,6 +636,7 @@ void mon_event_read(struct rmid_read *rr, struct rdt_resource *r,
 	rr->r = r;
 	rr->d = d;
 	rr->first = first;
+	rr->cntr_id = mbm_cntr_get(r, d, rdtgrp, evtid);
 	rr->arch_mon_ctx = resctrl_arch_mon_ctx_alloc(r, evtid);
 	if (IS_ERR(rr->arch_mon_ctx)) {
 		rr->err = -EINVAL;
@@ -661,13 +662,14 @@ void mon_event_read(struct rmid_read *rr, struct rdt_resource *r,
 int rdtgroup_mondata_show(struct seq_file *m, void *arg)
 {
 	struct kernfs_open_file *of = m->private;
+	enum resctrl_event_id evtid;
 	struct rdt_domain_hdr *hdr;
 	struct rmid_read rr = {0};
 	struct rdt_mon_domain *d;
-	u32 resid, evtid, domid;
 	struct rdtgroup *rdtgrp;
 	struct rdt_resource *r;
 	union mon_data_bits md;
+	u32 resid, domid;
 	int ret = 0;
 
 	rdtgrp = rdtgroup_kn_lock_live(of->kn);
diff --git a/arch/x86/kernel/cpu/resctrl/internal.h b/arch/x86/kernel/cpu/resctrl/internal.h
index fbb045aec7e5..b7d1a59f09f8 100644
--- a/arch/x86/kernel/cpu/resctrl/internal.h
+++ b/arch/x86/kernel/cpu/resctrl/internal.h
@@ -38,6 +38,12 @@
 /* Setting bit 0 in L3_QOS_EXT_CFG enables the ABMC feature. */
 #define ABMC_ENABLE_BIT			0
 
+/*
+ * ABMC Qos Event Identifiers.
+ */
+#define ABMC_EXTENDED_EVT_ID		BIT(31)
+#define ABMC_EVT_ID			1
+
 /**
  * cpumask_any_housekeeping() - Choose any CPU in @mask, preferring those that
  *			        aren't marked nohz_full
@@ -156,6 +162,7 @@ struct rmid_read {
 	struct rdt_mon_domain	*d;
 	enum resctrl_event_id	evtid;
 	bool			first;
+	int			cntr_id;
 	struct cacheinfo	*ci;
 	int			err;
 	u64			val;
diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/resctrl/monitor.c
index 5e7970fd0a97..58476c065921 100644
--- a/arch/x86/kernel/cpu/resctrl/monitor.c
+++ b/arch/x86/kernel/cpu/resctrl/monitor.c
@@ -269,8 +269,8 @@ static struct arch_mbm_state *get_arch_mbm_state(struct rdt_hw_mon_domain *hw_do
 }
 
 void resctrl_arch_reset_rmid(struct rdt_resource *r, struct rdt_mon_domain *d,
-			     u32 unused, u32 rmid,
-			     enum resctrl_event_id eventid)
+			     u32 unused, u32 rmid, enum resctrl_event_id eventid,
+			     int cntr_id)
 {
 	struct rdt_hw_mon_domain *hw_dom = resctrl_to_arch_mon_dom(d);
 	int cpu = cpumask_any(&d->hdr.cpu_mask);
@@ -281,7 +281,15 @@ void resctrl_arch_reset_rmid(struct rdt_resource *r, struct rdt_mon_domain *d,
 	if (am) {
 		memset(am, 0, sizeof(*am));
 
-		prmid = logical_rmid_to_physical_rmid(cpu, rmid);
+		if (resctrl_arch_mbm_cntr_assign_enabled(r) &&
+		    resctrl_is_mbm_event(eventid)) {
+			if (cntr_id < 0)
+				return;
+			prmid = cntr_id;
+			eventid = ABMC_EXTENDED_EVT_ID | ABMC_EVT_ID;
+		} else {
+			prmid = logical_rmid_to_physical_rmid(cpu, rmid);
+		}
 		/* Record any initial, non-zero count value. */
 		__rmid_read_phys(prmid, eventid, &am->prev_msr);
 	}
@@ -313,12 +321,13 @@ static u64 mbm_overflow_count(u64 prev_msr, u64 cur_msr, unsigned int width)
 }
 
 int resctrl_arch_rmid_read(struct rdt_resource *r, struct rdt_mon_domain *d,
-			   u32 unused, u32 rmid, enum resctrl_event_id eventid,
-			   u64 *val, void *ignored)
+			   u32 unused, u32 rmid, int cntr_id,
+			   enum resctrl_event_id eventid, u64 *val, void *ignored)
 {
 	struct rdt_hw_mon_domain *hw_dom = resctrl_to_arch_mon_dom(d);
 	struct rdt_hw_resource *hw_res = resctrl_to_arch_res(r);
 	int cpu = cpumask_any(&d->hdr.cpu_mask);
+	enum resctrl_event_id peventid;
 	struct arch_mbm_state *am;
 	u64 msr_val, chunks;
 	u32 prmid;
@@ -326,8 +335,19 @@ int resctrl_arch_rmid_read(struct rdt_resource *r, struct rdt_mon_domain *d,
 
 	resctrl_arch_rmid_read_context_check();
 
-	prmid = logical_rmid_to_physical_rmid(cpu, rmid);
-	ret = __rmid_read_phys(prmid, eventid, &msr_val);
+	if (resctrl_arch_mbm_cntr_assign_enabled(r) &&
+	    resctrl_is_mbm_event(eventid)) {
+		if (cntr_id < 0)
+			return cntr_id;
+
+		prmid = cntr_id;
+		peventid = ABMC_EXTENDED_EVT_ID | ABMC_EVT_ID;
+	} else {
+		prmid = logical_rmid_to_physical_rmid(cpu, rmid);
+		peventid = eventid;
+	}
+
+	ret = __rmid_read_phys(prmid, peventid, &msr_val);
 	if (ret)
 		return ret;
 
@@ -392,7 +412,7 @@ void __check_limbo(struct rdt_mon_domain *d, bool force_free)
 			break;
 
 		entry = __rmid_entry(idx);
-		if (resctrl_arch_rmid_read(r, d, entry->closid, entry->rmid,
+		if (resctrl_arch_rmid_read(r, d, entry->closid, entry->rmid, -1,
 					   QOS_L3_OCCUP_EVENT_ID, &val,
 					   arch_mon_ctx)) {
 			rmid_dirty = true;
@@ -599,7 +619,7 @@ static int __mon_event_count(u32 closid, u32 rmid, struct rmid_read *rr)
 	u64 tval = 0;
 
 	if (rr->first) {
-		resctrl_arch_reset_rmid(rr->r, rr->d, closid, rmid, rr->evtid);
+		resctrl_arch_reset_rmid(rr->r, rr->d, closid, rmid, rr->evtid, rr->cntr_id);
 		m = get_mbm_state(rr->d, closid, rmid, rr->evtid);
 		if (m)
 			memset(m, 0, sizeof(struct mbm_state));
@@ -610,7 +630,7 @@ static int __mon_event_count(u32 closid, u32 rmid, struct rmid_read *rr)
 		/* Reading a single domain, must be on a CPU in that domain. */
 		if (!cpumask_test_cpu(cpu, &rr->d->hdr.cpu_mask))
 			return -EINVAL;
-		rr->err = resctrl_arch_rmid_read(rr->r, rr->d, closid, rmid,
+		rr->err = resctrl_arch_rmid_read(rr->r, rr->d, closid, rmid, rr->cntr_id,
 						 rr->evtid, &tval, rr->arch_mon_ctx);
 		if (rr->err)
 			return rr->err;
@@ -635,7 +655,7 @@ static int __mon_event_count(u32 closid, u32 rmid, struct rmid_read *rr)
 	list_for_each_entry(d, &rr->r->mon_domains, hdr.list) {
 		if (d->ci->id != rr->ci->id)
 			continue;
-		err = resctrl_arch_rmid_read(rr->r, d, closid, rmid,
+		err = resctrl_arch_rmid_read(rr->r, d, closid, rmid, rr->cntr_id,
 					     rr->evtid, &tval, rr->arch_mon_ctx);
 		if (!err) {
 			rr->val += tval;
@@ -703,8 +723,8 @@ void mon_event_count(void *info)
 
 	if (rdtgrp->type == RDTCTRL_GROUP) {
 		list_for_each_entry(entry, head, mon.crdtgrp_list) {
-			if (__mon_event_count(entry->closid, entry->mon.rmid,
-					      rr) == 0)
+			rr->cntr_id = mbm_cntr_get(rr->r, rr->d, entry, rr->evtid);
+			if (__mon_event_count(entry->closid, entry->mon.rmid, rr) == 0)
 				ret = 0;
 		}
 	}
@@ -835,13 +855,15 @@ static void update_mba_bw(struct rdtgroup *rgrp, struct rdt_mon_domain *dom_mbm)
 }
 
 static void mbm_update_one_event(struct rdt_resource *r, struct rdt_mon_domain *d,
-				 u32 closid, u32 rmid, enum resctrl_event_id evtid)
+				 u32 closid, u32 rmid, int cntr_id,
+				 enum resctrl_event_id evtid)
 {
 	struct rmid_read rr = {0};
 
 	rr.r = r;
 	rr.d = d;
 	rr.evtid = evtid;
+	rr.cntr_id = cntr_id;
 	rr.arch_mon_ctx = resctrl_arch_mon_ctx_alloc(rr.r, rr.evtid);
 	if (IS_ERR(rr.arch_mon_ctx)) {
 		pr_warn_ratelimited("Failed to allocate monitor context: %ld",
@@ -862,17 +884,22 @@ static void mbm_update_one_event(struct rdt_resource *r, struct rdt_mon_domain *
 }
 
 static void mbm_update(struct rdt_resource *r, struct rdt_mon_domain *d,
-		       u32 closid, u32 rmid)
+		       struct rdtgroup *rdtgrp, u32 closid, u32 rmid)
 {
+	int cntr_id;
 	/*
 	 * This is protected from concurrent reads from user as both
 	 * the user and overflow handler hold the global mutex.
 	 */
-	if (resctrl_arch_is_mbm_total_enabled())
-		mbm_update_one_event(r, d, closid, rmid, QOS_L3_MBM_TOTAL_EVENT_ID);
+	if (resctrl_arch_is_mbm_total_enabled()) {
+		cntr_id = mbm_cntr_get(r, d, rdtgrp, QOS_L3_MBM_TOTAL_EVENT_ID);
+		mbm_update_one_event(r, d, closid, rmid, cntr_id, QOS_L3_MBM_TOTAL_EVENT_ID);
+	}
 
-	if (resctrl_arch_is_mbm_local_enabled())
-		mbm_update_one_event(r, d, closid, rmid, QOS_L3_MBM_LOCAL_EVENT_ID);
+	if (resctrl_arch_is_mbm_local_enabled()) {
+		cntr_id = mbm_cntr_get(r, d, rdtgrp, QOS_L3_MBM_LOCAL_EVENT_ID);
+		mbm_update_one_event(r, d, closid, rmid, cntr_id, QOS_L3_MBM_LOCAL_EVENT_ID);
+	}
 }
 
 /*
@@ -945,11 +972,11 @@ void mbm_handle_overflow(struct work_struct *work)
 	d = container_of(work, struct rdt_mon_domain, mbm_over.work);
 
 	list_for_each_entry(prgrp, &rdt_all_groups, rdtgroup_list) {
-		mbm_update(r, d, prgrp->closid, prgrp->mon.rmid);
+		mbm_update(r, d, prgrp, prgrp->closid, prgrp->mon.rmid);
 
 		head = &prgrp->mon.crdtgrp_list;
 		list_for_each_entry(crgrp, head, mon.crdtgrp_list)
-			mbm_update(r, d, crgrp->closid, crgrp->mon.rmid);
+			mbm_update(r, d, crgrp, crgrp->closid, crgrp->mon.rmid);
 
 		if (is_mba_sc(NULL))
 			update_mba_bw(prgrp, d);
diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
index 60270606f1b8..107cb14a0db2 100644
--- a/include/linux/resctrl.h
+++ b/include/linux/resctrl.h
@@ -466,8 +466,9 @@ void resctrl_offline_cpu(unsigned int cpu);
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
@@ -513,8 +514,8 @@ struct rdt_domain_hdr *resctrl_find_domain(struct list_head *h, int id,
  * This can be called from any CPU.
  */
 void resctrl_arch_reset_rmid(struct rdt_resource *r, struct rdt_mon_domain *d,
-			     u32 closid, u32 rmid,
-			     enum resctrl_event_id eventid);
+			     u32 closid, u32 rmid, enum resctrl_event_id eventid,
+			     int cntr_id);
 
 /**
  * resctrl_arch_reset_rmid_all() - Reset all private state associated with
-- 
2.34.1

