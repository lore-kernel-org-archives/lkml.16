Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDD29289371
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 14:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746628493; cv=none; b=EdAdWqgLM8DCo9bkkkKaQLs6ihfZDglMzqLYPVa6CfDcPiFA9qoONL3vkcIh3VxNPUZn38YsVF3lPlAICiZJTxlcNMmzntM14CATzNZpf06nmeXDL5bhnrI66hmAIXN6T2WSMEeovKxHmSS7buUnVjiL9XmzFjfLotYdOKvogcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746628493; c=relaxed/simple;
	bh=HmSWFEnyVZcq3dmbFhdSejbsJWSd1jjqG2e39rMp8qk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QvZGEzp+u6HuXEw5NOvZRIy6GJwckM3s+NubWKE+Xq3jzT4z6yfHn+grEEjh7CuaYLFxgFyxKvEIg5wyK8Ei9JDk5OLTZppLVlTpBK5ZqZlonv3D1kUUu05uoRYtP0H8aYWyRubYzW5ie3aV1pGZ7xTw7bnbeKbJqXAtehXp3UY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IMdooezO; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IMdooezO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746628492; x=1778164492;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HmSWFEnyVZcq3dmbFhdSejbsJWSd1jjqG2e39rMp8qk=;
  b=IMdooezOtdxEvINiZoFmNclioEOwcpn7kGD4vKThUMQDpwaLJKh5Lboz
   ZOLHFj8xzk7Wp8hIxiLWi0Jpw+37F3ZZRvomVjd8SB34DEh6Hq7aZm2Dw
   vT6m2ygw63uE7HVoCnPbUJ5b8SbX39y9UohWvX3RaIm75n9n6F4kRtsbk
   jfYjEkCXjowbhy3Cg0DYds/gyngoP0y+t3da9glE1eEmKkbTNFk6FFnB1
   yth8mXfCN0zqlH//Pcj5Z55Zsw4m3YIqFyw9pNYNvAn/uxDf8aCRL9swB
   n2pVg/qP7xxKKrz4/zHjChkwNcMVbjxZCmOOYd7sgN1TjGGR2Y3RAbiGv
   Q==;
X-CSE-ConnectionGUID: V8kV/w5YRMeZYZDRRijEMg==
X-CSE-MsgGUID: HRuu8dVrQiCvU2aPlq2H5A==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="48378084"
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="48378084"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 07:34:48 -0700
X-CSE-ConnectionGUID: gS3cmzmZTZ+ppZh+gV9k9g==
X-CSE-MsgGUID: cRNGbg9bTDi5WtGKOoLJVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="135943613"
Received: from kanliang-dev.jf.intel.com ([10.165.154.102])
  by fmviesa006.fm.intel.com with ESMTP; 07 May 2025 07:34:47 -0700
From: kan.liang@linux.intel.com
To: peterz@infradead.org,
	mingo@redhat.com,
	acme@kernel.org,
	namhyung@kernel.org,
	irogers@google.com,
	linux-kernel@vger.kernel.org
Cc: Kan Liang <kan.liang@linux.intel.com>
Subject: [RESEND PATCH V2 3/4] perf/x86/intel/uncore: Add Panther Lake support
Date: Wed,  7 May 2025 07:34:26 -0700
Message-Id: <20250507143427.1319818-4-kan.liang@linux.intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20250507143427.1319818-1-kan.liang@linux.intel.com>
References: <20250507143427.1319818-1-kan.liang@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kan Liang <kan.liang@linux.intel.com>

The Panther Lake supports CBOX, MC, sNCU, and HBO uncore PMON.

The CBOX is similar to Lunar Lake. The only difference is the number of
CBOX.

The other three uncore PMON can be retrieved from the discovery table.
The global control register resides in the sNCU. The global freeze bit
is set by default. It must be cleared before monitoring any uncore
counters.

Signed-off-by: Kan Liang <kan.liang@linux.intel.com>
---
 arch/x86/events/intel/uncore.c           |  7 +++
 arch/x86/events/intel/uncore.h           |  2 +
 arch/x86/events/intel/uncore_discovery.h |  4 ++
 arch/x86/events/intel/uncore_snb.c       | 71 ++++++++++++++++++++++++
 arch/x86/events/intel/uncore_snbep.c     |  2 +-
 5 files changed, 85 insertions(+), 1 deletion(-)

diff --git a/arch/x86/events/intel/uncore.c b/arch/x86/events/intel/uncore.c
index 5811e172f721..8a4f5a86e18d 100644
--- a/arch/x86/events/intel/uncore.c
+++ b/arch/x86/events/intel/uncore.c
@@ -1806,6 +1806,12 @@ static const struct intel_uncore_init_fun lnl_uncore_init __initconst = {
 	.mmio_init = lnl_uncore_mmio_init,
 };
 
+static const struct intel_uncore_init_fun ptl_uncore_init __initconst = {
+	.cpu_init = ptl_uncore_cpu_init,
+	.mmio_init = ptl_uncore_mmio_init,
+	.use_discovery = true,
+};
+
 static const struct intel_uncore_init_fun icx_uncore_init __initconst = {
 	.cpu_init = icx_uncore_cpu_init,
 	.pci_init = icx_uncore_pci_init,
@@ -1887,6 +1893,7 @@ static const struct x86_cpu_id intel_uncore_match[] __initconst = {
 	X86_MATCH_VFM(INTEL_ARROWLAKE_U,	&mtl_uncore_init),
 	X86_MATCH_VFM(INTEL_ARROWLAKE_H,	&mtl_uncore_init),
 	X86_MATCH_VFM(INTEL_LUNARLAKE_M,	&lnl_uncore_init),
+	X86_MATCH_VFM(INTEL_PANTHERLAKE_L,	&ptl_uncore_init),
 	X86_MATCH_VFM(INTEL_SAPPHIRERAPIDS_X,	&spr_uncore_init),
 	X86_MATCH_VFM(INTEL_EMERALDRAPIDS_X,	&spr_uncore_init),
 	X86_MATCH_VFM(INTEL_GRANITERAPIDS_X,	&gnr_uncore_init),
diff --git a/arch/x86/events/intel/uncore.h b/arch/x86/events/intel/uncore.h
index 3dcb88c0ecfa..d8815fff7588 100644
--- a/arch/x86/events/intel/uncore.h
+++ b/arch/x86/events/intel/uncore.h
@@ -612,10 +612,12 @@ void tgl_uncore_cpu_init(void);
 void adl_uncore_cpu_init(void);
 void lnl_uncore_cpu_init(void);
 void mtl_uncore_cpu_init(void);
+void ptl_uncore_cpu_init(void);
 void tgl_uncore_mmio_init(void);
 void tgl_l_uncore_mmio_init(void);
 void adl_uncore_mmio_init(void);
 void lnl_uncore_mmio_init(void);
+void ptl_uncore_mmio_init(void);
 int snb_pci2phy_map_init(int devid);
 
 /* uncore_snbep.c */
diff --git a/arch/x86/events/intel/uncore_discovery.h b/arch/x86/events/intel/uncore_discovery.h
index 690f737e6837..dff75c98e22f 100644
--- a/arch/x86/events/intel/uncore_discovery.h
+++ b/arch/x86/events/intel/uncore_discovery.h
@@ -171,3 +171,7 @@ bool intel_generic_uncore_assign_hw_event(struct perf_event *event,
 					  struct intel_uncore_box *box);
 void uncore_find_add_unit(struct intel_uncore_discovery_unit *node,
 			  struct rb_root *root, u16 *num_units);
+struct intel_uncore_type **
+uncore_get_uncores(enum uncore_access_type type_id, int num_extra,
+		   struct intel_uncore_type **extra, int max_num_types,
+		   struct intel_uncore_type **uncores);
diff --git a/arch/x86/events/intel/uncore_snb.c b/arch/x86/events/intel/uncore_snb.c
index edb7fd50efe0..817dddc1454d 100644
--- a/arch/x86/events/intel/uncore_snb.c
+++ b/arch/x86/events/intel/uncore_snb.c
@@ -1854,3 +1854,74 @@ void lnl_uncore_mmio_init(void)
 }
 
 /* end of Lunar Lake MMIO uncore support */
+
+/* Panther Lake uncore support */
+
+#define UNCORE_PTL_MAX_NUM_UNCORE_TYPES		42
+#define UNCORE_PTL_TYPE_IMC			6
+#define UNCORE_PTL_TYPE_SNCU			34
+#define UNCORE_PTL_TYPE_HBO			41
+
+#define PTL_UNCORE_GLOBAL_CTL_OFFSET		0x380
+
+static struct intel_uncore_type ptl_uncore_imc = {
+	.name			= "imc",
+	.mmio_map_size		= 0xf00,
+};
+
+static void ptl_uncore_sncu_init_box(struct intel_uncore_box *box)
+{
+	intel_generic_uncore_mmio_init_box(box);
+
+	/* Clear the global freeze bit */
+	if (box->io_addr)
+		writel(0, box->io_addr + PTL_UNCORE_GLOBAL_CTL_OFFSET);
+}
+
+static struct intel_uncore_ops ptl_uncore_sncu_ops = {
+	.init_box		= ptl_uncore_sncu_init_box,
+	.exit_box		= uncore_mmio_exit_box,
+	.disable_box		= intel_generic_uncore_mmio_disable_box,
+	.enable_box		= intel_generic_uncore_mmio_enable_box,
+	.disable_event		= intel_generic_uncore_mmio_disable_event,
+	.enable_event		= intel_generic_uncore_mmio_enable_event,
+	.read_counter		= uncore_mmio_read_counter,
+};
+
+static struct intel_uncore_type ptl_uncore_sncu = {
+	.name			= "sncu",
+	.ops			= &ptl_uncore_sncu_ops,
+	.mmio_map_size		= 0xf00,
+};
+
+static struct intel_uncore_type ptl_uncore_hbo = {
+	.name			= "hbo",
+	.mmio_map_size		= 0xf00,
+};
+
+static struct intel_uncore_type *ptl_uncores[UNCORE_PTL_MAX_NUM_UNCORE_TYPES] = {
+	[UNCORE_PTL_TYPE_IMC] = &ptl_uncore_imc,
+	[UNCORE_PTL_TYPE_SNCU] = &ptl_uncore_sncu,
+	[UNCORE_PTL_TYPE_HBO] = &ptl_uncore_hbo,
+};
+
+void ptl_uncore_mmio_init(void)
+{
+	uncore_mmio_uncores = uncore_get_uncores(UNCORE_ACCESS_MMIO, 0, NULL,
+						 UNCORE_PTL_MAX_NUM_UNCORE_TYPES,
+						 ptl_uncores);
+}
+
+static struct intel_uncore_type *ptl_msr_uncores[] = {
+	&mtl_uncore_cbox,
+	NULL
+};
+
+void ptl_uncore_cpu_init(void)
+{
+	mtl_uncore_cbox.num_boxes = 6;
+	mtl_uncore_cbox.ops = &lnl_uncore_msr_ops;
+	uncore_msr_uncores = ptl_msr_uncores;
+}
+
+/* end of Panther Lake uncore support */
diff --git a/arch/x86/events/intel/uncore_snbep.c b/arch/x86/events/intel/uncore_snbep.c
index 2f5c2eb1ce0c..b19c262d47f5 100644
--- a/arch/x86/events/intel/uncore_snbep.c
+++ b/arch/x86/events/intel/uncore_snbep.c
@@ -6412,7 +6412,7 @@ static void uncore_type_customized_copy(struct intel_uncore_type *to_type,
 		to_type->mmio_map_size = from_type->mmio_map_size;
 }
 
-static struct intel_uncore_type **
+struct intel_uncore_type **
 uncore_get_uncores(enum uncore_access_type type_id, int num_extra,
 		   struct intel_uncore_type **extra, int max_num_types,
 		   struct intel_uncore_type **uncores)
-- 
2.38.1

