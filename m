Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2043.outbound.protection.outlook.com [40.107.92.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C01E8271472;
	Fri, 13 Jun 2025 21:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749848746; cv=fail; b=OLxDmg3z4BuBULWq6afehGwjkaXNiS5GDbhPtxOG6cDUBg7Pb+Sg1jT4AxIl81iGgUb7mJSFCNuI+l81cgclyApDExAgZylmU22KLVzLPGusAeqPlYmq7Q9Tnx+ufSSWDyqCzALi2hocYGSkercmgt7NRhiBrsDDFUum45AY7lU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749848746; c=relaxed/simple;
	bh=WiKCl0SwoUTli2Iy/euPBQgi5EppML5K+W4vrUFcxl4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=K9WrueoCl0db4JQp87N2VWjvcNCP13A4KKGJU7+de6EARoN8SURTgQmLrV5nvJfaHpfQHvGkY0tUAIYuBQDli1s9BW1bQxq1xrH2OG3+x6ojMRYaMRMEHT7yNEw3kdkP3+p6CmoV4Ei6IlVrhPhYlXeZmH8vvA+XATMVqlKTDt4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=AJuV5gcZ; arc=fail smtp.client-ip=40.107.92.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="AJuV5gcZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ggs91MtBb7S+k35LiQjaj/TNxIvhYeo5KRUo6IJLEAsGXcsCjNXq8wfNkxyKjzqn4NfBGWk97yjrJISItxf7CEWEKCm5J/ZfYLKkMZVfY+mzI4eVj1yQHe753QBBM4xejOSbNFifrSIUIQR0ZJMbGMwz7Dt7dz8GCAOPeJUVC4uw5Iv3FckSIForV+j++EQESZ9Xrj/bw7JM83jX7ES0k6oRE7gJnrMO+u2Rq8yj7lbtqVYBfLdcQOuRXJ1kUuH8SnrEsrgPE4nMG+UxPMCZ0e/5UJRHZOnmib9WFPPkpsdf5IqeL0XMEDwmxNGzIrQlEvZvtRwpH6+yPBdR0QZ67Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0IHhqKt8aPRl6VYhsSb2eYBYO2c4OifZNCw6orCbIO0=;
 b=CY81P5MXXoyfbSasI4dfFgbraT09mNdxF5jZtwXGu+u8vrbujqLarQsP5OP88qEdFUIBR0u2Q4VpGJtzGZto+phJMxdOSl4OYC2DrQuQCN0Xg/UoLte9RtgkWUHTg+tZU8M6tgdwSd0i6/9de7zv7AhbdkijuZzhdkghIXRIuK2SieFLk+zBAb2kBZFqLkCmHFQ/CKcKa22ctQOKg5/pDcnRJwUf2rW9F1aocm3u0JUdxnprpSTPp3XEuPQkdqQbnvpVUuVynAF29rbRLP2+YMd/uXazfUN+krLeE5pXkJBKrcC4gOxfgIoHJ9kSbyBF/FnnqumsmX5zlEpMiyISIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lwn.net smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0IHhqKt8aPRl6VYhsSb2eYBYO2c4OifZNCw6orCbIO0=;
 b=AJuV5gcZ+PDC5EstdqTdimw3auxCKrJROFOV4yZYxUUK1IfJF4uzzp7KFAo80XxMt2590CZBqTkUHpLtTi6JP0KWu/InFLguB7frxZUZ3Dz4oTz71frtCTI9zCPHKf3s79a1gj6mUs8mortniDRcPJscd4c7mMD8ODaGH0rhHiQ=
Received: from BY5PR17CA0028.namprd17.prod.outlook.com (2603:10b6:a03:1b8::41)
 by IA1PR12MB8467.namprd12.prod.outlook.com (2603:10b6:208:448::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Fri, 13 Jun
 2025 21:05:42 +0000
Received: from CY4PEPF0000EDD6.namprd03.prod.outlook.com
 (2603:10b6:a03:1b8:cafe::cb) by BY5PR17CA0028.outlook.office365.com
 (2603:10b6:a03:1b8::41) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.40 via Frontend Transport; Fri,
 13 Jun 2025 21:05:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EDD6.mail.protection.outlook.com (10.167.241.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Fri, 13 Jun 2025 21:05:41 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 13 Jun
 2025 16:05:39 -0500
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
Subject: [PATCH v14 01/32] x86,fs/resctrl: Remove unappropriate references to cacheinfo in the resctrl subsystem.
Date: Fri, 13 Jun 2025 16:04:45 -0500
Message-ID: <3b69215942497729345ec4281c0a4850c8adb71b.1749848714.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD6:EE_|IA1PR12MB8467:EE_
X-MS-Office365-Filtering-Correlation-Id: cb6b49e7-6a61-47b2-0802-08ddaabe0e24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|36860700013|82310400026|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?GjPN6gilQvLJPOESEwBD+WPbtMGaHXTGWGrWRYc/6VDQDfQX4rW+Saw5NWc0?=
 =?us-ascii?Q?G5g9kU+QnLejK350kHgaBcvdSpMLmhZV6xhXx/ji5Tz2AUvWpwbQM7OLefqR?=
 =?us-ascii?Q?IMDcO9RQ3ci8XNqnWeGjtjB00NIyJR15qIdFo++A5hAxVZypa6IVmEIN4KTx?=
 =?us-ascii?Q?4vwYh3w+K75JlaXMd4qeGGBcuUOqTd7rt3zwkmRSqHji6Iub/G8oNsUori2M?=
 =?us-ascii?Q?Wczw96AiBKmPa3wmRgNXN0NiNDHoDrUkPVYcjq+zbPmhnIqoF9mawqduE9xb?=
 =?us-ascii?Q?yC/2Lk/qb0VY8+kPVjdU3t0uwZJp2wWr0rKPO6Lz7HuvUbrUkkmfNzvJqRPz?=
 =?us-ascii?Q?lgzo56m5ze4gx4Ph5P8AY1C/bVE3m8ZXWwnY79V/vR5RJcXjNuenXyEgnz7Z?=
 =?us-ascii?Q?hKsDKkCGUX54j6i/R+dKEEMIi63cODsSeeqKnXJPnYjt0PSzR3cn1ajmOoe8?=
 =?us-ascii?Q?kPBypdhYh1n9uA2EgfqZBMVq0s5MQm8cq/RkV2AlWwZZF6qT0xBfhLArEl59?=
 =?us-ascii?Q?tklElDWu8Lw9ohlWbe/j5RnEnlFL0tYzlsRUPdMtl6FDBlFqmgYWlnujT+7C?=
 =?us-ascii?Q?5zYklxK82wGR05FrifcntSIVik1pX2ervRQuiU44+gpoe8s4OOLbCjL7fCZY?=
 =?us-ascii?Q?1HQbZh1ePyL3mcWnonYShSKu5NEAoVpoltMNT+E2uOC2ICciU/yjVUUXvFbj?=
 =?us-ascii?Q?2oStzYQy0t4lZCPjGx3SsOHmdpjHHJBGb3AkGowpqX7mxOHmJnNAS7diamOb?=
 =?us-ascii?Q?S+hr5oTBfVtFOZWyIZ5UJ6nCk0UojEVYqCY5st85zK+1twvrFh3q6TmcJWnJ?=
 =?us-ascii?Q?G5aD2fYE6pMASOVQNB8JBBofKXZbp9zZxU2uwBpN3kdWMsZ3PJduDMaA9Zls?=
 =?us-ascii?Q?CjK4PrgkbfQLcFc5hoQBCIjfNliT+lA1UKjmXQBZqaWRdoMLQdLJhlDlldJF?=
 =?us-ascii?Q?swyDdFWkdfSLE834QYKuPghR6UIH3XWP1/uje6z97QRyWKuNra4y90y6t6m9?=
 =?us-ascii?Q?NpJhWLg5hGvmjj8qe45+evWDWL6YT3zdgCyDsGs1qSMepJTvMHuYaOfdlJ3U?=
 =?us-ascii?Q?4Yxw2WaoTwD3HPeZRZu8/7KwD1XtgtUHvj2WQIB/R49vLSAbZ9ZydAYDOT44?=
 =?us-ascii?Q?8EIuoQZ9kIsOSadjIES5HWU/oVyqI7bUQ34WwUD2nsNzKZcIR5qigUHAOJ4O?=
 =?us-ascii?Q?Iaym5JYu3w5urar7DtkYpjrC37LiyY4EOQl43qouYsgtLwV7mitUTfwdFRIP?=
 =?us-ascii?Q?q7kTeHU1u8nSapklXYghBdqH4FedVMGzl75vXYlrsBnwedBCyTUTtvv0HIFJ?=
 =?us-ascii?Q?udrgiZqrryBgiH641fpbxDaqyUhSXxafX4rXzJtBG3QBIEKbU5VzWUxU5Mp8?=
 =?us-ascii?Q?AERFe/LkP7ruxHHT8xzWvqsLs2wdnB7iHk/oXm4KpqrSvvyrplafQ7TPeidH?=
 =?us-ascii?Q?e4yOPbEN624qEce2C7q8h7vfNrai5kAKQdUcp4EGyWwHcKiZpes5/ahYdYPL?=
 =?us-ascii?Q?yvSN6rF9lGsURybBM/7Yor0FB2U0W8cUlt+nLqWSEVUTjkT9mkWoYW0UAA?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700013)(82310400026)(1800799024)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 21:05:41.3230
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cb6b49e7-6a61-47b2-0802-08ddaabe0e24
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD6.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8467

From: Qinyun Tan <qinyuntan@linux.alibaba.com>

In the resctrl subsystem's Sub-NUMA Cluster (SNC) mode, the rdt_mon_domain
structure representing a NUMA node relies on the cacheinfo interface
(rdt_mon_domain::ci) to store L3 cache information (e.g., shared_cpu_map)
for monitoring. The L3 cache information of a SNC NUMA node determines
which domains are summed for the "top level" L3-scoped events.

rdt_mon_domain::ci is initialized using the first online CPU of a NUMA
node. When this CPU goes offline, its shared_cpu_map is cleared to contain
only the offline CPU itself. Subsequently, attempting to read counters
via smp_call_on_cpu(offline_cpu) fails (and error ignored), returning
zero values for "top-level events" without any error indication.

Replace the cacheinfo references in struct rdt_mon_domain and struct
rmid_read with the cacheinfo ID (a unique identifier for the L3 cache).

rdt_domain_hdr::cpu_mask contains the online CPUs associated with that
domain. When reading "top-level events", select a CPU from
rdt_domain_hdr::cpu_mask and utilize its L3 shared_cpu_map to determine
valid CPUs for reading RMID counter via the MSR interface.

Considering all CPUs associated with the L3 cache improves the chances
of picking a housekeeping CPU on which the counter reading work can be
queued, avoiding an unnecessary IPI.

Fixes: 328ea68874642 ("x86/resctrl: Prepare for new Sub-NUMA Cluster (SNC) monitor files")
Signed-off-by: Qinyun Tan <qinyuntan@linux.alibaba.com>
Tested-by: Tony Luck <tony.luck@intel.com>
Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>
---
v14: Picked up this patch on Tony's recomendation. This is expected to be
     merged soon. Don't need to be reviwed.
---
 arch/x86/kernel/cpu/resctrl/core.c |  6 ++++--
 fs/resctrl/ctrlmondata.c           | 13 +++++++++----
 fs/resctrl/internal.h              |  4 ++--
 fs/resctrl/monitor.c               |  6 ++++--
 fs/resctrl/rdtgroup.c              |  6 +++---
 include/linux/resctrl.h            |  4 ++--
 6 files changed, 24 insertions(+), 15 deletions(-)

diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
index 7109cbfcad4f..187d527ef73b 100644
--- a/arch/x86/kernel/cpu/resctrl/core.c
+++ b/arch/x86/kernel/cpu/resctrl/core.c
@@ -498,6 +498,7 @@ static void domain_add_cpu_mon(int cpu, struct rdt_resource *r)
 	struct rdt_hw_mon_domain *hw_dom;
 	struct rdt_domain_hdr *hdr;
 	struct rdt_mon_domain *d;
+	struct cacheinfo *ci;
 	int err;
 
 	lockdep_assert_held(&domain_list_lock);
@@ -525,12 +526,13 @@ static void domain_add_cpu_mon(int cpu, struct rdt_resource *r)
 	d = &hw_dom->d_resctrl;
 	d->hdr.id = id;
 	d->hdr.type = RESCTRL_MON_DOMAIN;
-	d->ci = get_cpu_cacheinfo_level(cpu, RESCTRL_L3_CACHE);
-	if (!d->ci) {
+	ci = get_cpu_cacheinfo_level(cpu, RESCTRL_L3_CACHE);
+	if (!ci) {
 		pr_warn_once("Can't find L3 cache for CPU:%d resource %s\n", cpu, r->name);
 		mon_domain_free(hw_dom);
 		return;
 	}
+	d->ci_id = ci->id;
 	cpumask_set_cpu(cpu, &d->hdr.cpu_mask);
 
 	arch_mon_domain_online(r, d);
diff --git a/fs/resctrl/ctrlmondata.c b/fs/resctrl/ctrlmondata.c
index 6ed2dfd4dbbd..d98e0d2de09f 100644
--- a/fs/resctrl/ctrlmondata.c
+++ b/fs/resctrl/ctrlmondata.c
@@ -594,9 +594,10 @@ int rdtgroup_mondata_show(struct seq_file *m, void *arg)
 	struct rmid_read rr = {0};
 	struct rdt_mon_domain *d;
 	struct rdtgroup *rdtgrp;
+	int domid, cpu, ret = 0;
 	struct rdt_resource *r;
+	struct cacheinfo *ci;
 	struct mon_data *md;
-	int domid, ret = 0;
 
 	rdtgrp = rdtgroup_kn_lock_live(of->kn);
 	if (!rdtgrp) {
@@ -623,10 +624,14 @@ int rdtgroup_mondata_show(struct seq_file *m, void *arg)
 		 * one that matches this cache id.
 		 */
 		list_for_each_entry(d, &r->mon_domains, hdr.list) {
-			if (d->ci->id == domid) {
-				rr.ci = d->ci;
+			if (d->ci_id == domid) {
+				rr.ci_id = d->ci_id;
+				cpu = cpumask_any(&d->hdr.cpu_mask);
+				ci = get_cpu_cacheinfo_level(cpu, RESCTRL_L3_CACHE);
+				if (!ci)
+					continue;
 				mon_event_read(&rr, r, NULL, rdtgrp,
-					       &d->ci->shared_cpu_map, evtid, false);
+					       &ci->shared_cpu_map, evtid, false);
 				goto checkresult;
 			}
 		}
diff --git a/fs/resctrl/internal.h b/fs/resctrl/internal.h
index 9a8cf6f11151..0a1eedba2b03 100644
--- a/fs/resctrl/internal.h
+++ b/fs/resctrl/internal.h
@@ -98,7 +98,7 @@ struct mon_data {
  *	   domains in @r sharing L3 @ci.id
  * @evtid: Which monitor event to read.
  * @first: Initialize MBM counter when true.
- * @ci:    Cacheinfo for L3. Only set when @d is NULL. Used when summing domains.
+ * @ci_id: Cacheinfo id for L3. Only set when @d is NULL. Used when summing domains.
  * @err:   Error encountered when reading counter.
  * @val:   Returned value of event counter. If @rgrp is a parent resource group,
  *	   @val includes the sum of event counts from its child resource groups.
@@ -112,7 +112,7 @@ struct rmid_read {
 	struct rdt_mon_domain	*d;
 	enum resctrl_event_id	evtid;
 	bool			first;
-	struct cacheinfo	*ci;
+	unsigned int		ci_id;
 	int			err;
 	u64			val;
 	void			*arch_mon_ctx;
diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
index bde2801289d3..f5637855c3ac 100644
--- a/fs/resctrl/monitor.c
+++ b/fs/resctrl/monitor.c
@@ -361,6 +361,7 @@ static int __mon_event_count(u32 closid, u32 rmid, struct rmid_read *rr)
 {
 	int cpu = smp_processor_id();
 	struct rdt_mon_domain *d;
+	struct cacheinfo *ci;
 	struct mbm_state *m;
 	int err, ret;
 	u64 tval = 0;
@@ -388,7 +389,8 @@ static int __mon_event_count(u32 closid, u32 rmid, struct rmid_read *rr)
 	}
 
 	/* Summing domains that share a cache, must be on a CPU for that cache. */
-	if (!cpumask_test_cpu(cpu, &rr->ci->shared_cpu_map))
+	ci = get_cpu_cacheinfo_level(cpu, RESCTRL_L3_CACHE);
+	if (!ci || ci->id != rr->ci_id)
 		return -EINVAL;
 
 	/*
@@ -400,7 +402,7 @@ static int __mon_event_count(u32 closid, u32 rmid, struct rmid_read *rr)
 	 */
 	ret = -EINVAL;
 	list_for_each_entry(d, &rr->r->mon_domains, hdr.list) {
-		if (d->ci->id != rr->ci->id)
+		if (d->ci_id != rr->ci_id)
 			continue;
 		err = resctrl_arch_rmid_read(rr->r, d, closid, rmid,
 					     rr->evtid, &tval, rr->arch_mon_ctx);
diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index 1beb124e25f6..77d08229d855 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -3036,7 +3036,7 @@ static void rmdir_mondata_subdir_allrdtgrp(struct rdt_resource *r,
 	char name[32];
 
 	snc_mode = r->mon_scope == RESCTRL_L3_NODE;
-	sprintf(name, "mon_%s_%02d", r->name, snc_mode ? d->ci->id : d->hdr.id);
+	sprintf(name, "mon_%s_%02d", r->name, snc_mode ? d->ci_id : d->hdr.id);
 	if (snc_mode)
 		sprintf(subname, "mon_sub_%s_%02d", r->name, d->hdr.id);
 
@@ -3061,7 +3061,7 @@ static int mon_add_all_files(struct kernfs_node *kn, struct rdt_mon_domain *d,
 		return -EPERM;
 
 	list_for_each_entry(mevt, &r->evt_list, list) {
-		domid = do_sum ? d->ci->id : d->hdr.id;
+		domid = do_sum ? d->ci_id : d->hdr.id;
 		priv = mon_get_kn_priv(r->rid, domid, mevt, do_sum);
 		if (WARN_ON_ONCE(!priv))
 			return -EINVAL;
@@ -3089,7 +3089,7 @@ static int mkdir_mondata_subdir(struct kernfs_node *parent_kn,
 	lockdep_assert_held(&rdtgroup_mutex);
 
 	snc_mode = r->mon_scope == RESCTRL_L3_NODE;
-	sprintf(name, "mon_%s_%02d", r->name, snc_mode ? d->ci->id : d->hdr.id);
+	sprintf(name, "mon_%s_%02d", r->name, snc_mode ? d->ci_id : d->hdr.id);
 	kn = kernfs_find_and_get(parent_kn, name);
 	if (kn) {
 		/*
diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
index 9ba771f2ddea..6fb4894b8cfd 100644
--- a/include/linux/resctrl.h
+++ b/include/linux/resctrl.h
@@ -159,7 +159,7 @@ struct rdt_ctrl_domain {
 /**
  * struct rdt_mon_domain - group of CPUs sharing a resctrl monitor resource
  * @hdr:		common header for different domain types
- * @ci:			cache info for this domain
+ * @ci_id:		cache info id for this domain
  * @rmid_busy_llc:	bitmap of which limbo RMIDs are above threshold
  * @mbm_total:		saved state for MBM total bandwidth
  * @mbm_local:		saved state for MBM local bandwidth
@@ -170,7 +170,7 @@ struct rdt_ctrl_domain {
  */
 struct rdt_mon_domain {
 	struct rdt_domain_hdr		hdr;
-	struct cacheinfo		*ci;
+	unsigned int			ci_id;
 	unsigned long			*rmid_busy_llc;
 	struct mbm_state		*mbm_total;
 	struct mbm_state		*mbm_local;
-- 
2.34.1

