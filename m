Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA9F92F0E57
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 19:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750967823; cv=none; b=FJLFzfjDEXickQtwDiPSk8WeXlivllVlYVb8JrHS+12GDtv/b+Q60PrGvNoPDWztZOTCvY04tPMgZ2RtFKzUJF5sCYp2SaAJuMEVeLhuoveCBnVpwBxzJ+BzaHyqVu3YcqY7PP1rd07KqHyTtBMa7kCnnaqcuHYHpZI9+oUbvGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750967823; c=relaxed/simple;
	bh=1qGhHvhK/NugQdUvFGT3y430McBRET3ozZ1kbREKaAI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=F1DiGmEPOmMeYREu7uSg2il6+ZhIkJQ9/uC3PapT1uA6IgqqBMTt8le3c4BziD900BOaFKsapvX5l3ZKelXRDrUAZeT/LFyXh0nnIsyLmSHPK/GP3780gmczGKFkUV8saN7JY0ImrVetCEFedaWwFBJrQfzwEui9qZulcKamwpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bjyem9IV; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bjyem9IV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750967821; x=1782503821;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1qGhHvhK/NugQdUvFGT3y430McBRET3ozZ1kbREKaAI=;
  b=bjyem9IVlmYSj+tecpcDir9lo+paQlWEcH1uUZOv5tGZ++JWpMIxm5QZ
   K5UFx+M+w+JVg9URtLPefj0I1sWjDlLN9VtbtXHKOWqg8md6YSmVaWdKI
   QkZAtRcvKwzCNt+4rcrBTzPuIBCQ4Kt9g0cFFpvbIUad6EOaId97P6o2C
   qgPws51I9Eh4w3XGspwbZD+GN5DqYTClEOPByetwosnTAiGAe/yd0uooQ
   LEfYQ7ZTgntCJBT8M7WxN0aS1fJXfbTiWSCIXyXGhXQBl85BiSvr30VnN
   BworEjFU9jrD+NlpdUsRd668wbrVvb8o60X5O1XdIAJVgpPFGt9x1dNHd
   Q==;
X-CSE-ConnectionGUID: R1Z+eOchQpy2hwVb59EFoQ==
X-CSE-MsgGUID: hnVkmlUTSWalX7aat2KBcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="53002164"
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; 
   d="scan'208";a="53002164"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 12:57:00 -0700
X-CSE-ConnectionGUID: 79lGNJ13ToClEofa/FA5GQ==
X-CSE-MsgGUID: vkc8SucWRim4NF8J1X5EYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; 
   d="scan'208";a="156902913"
Received: from kanliang-dev.jf.intel.com ([10.165.154.102])
  by fmviesa005.fm.intel.com with ESMTP; 26 Jun 2025 12:56:59 -0700
From: kan.liang@linux.intel.com
To: peterz@infradead.org,
	mingo@redhat.com,
	acme@kernel.org,
	namhyung@kernel.org,
	tglx@linutronix.de,
	dave.hansen@linux.intel.com,
	irogers@google.com,
	adrian.hunter@intel.com,
	jolsa@kernel.org,
	alexander.shishkin@linux.intel.com,
	linux-kernel@vger.kernel.org
Cc: dapeng1.mi@linux.intel.com,
	ak@linux.intel.com,
	zide.chen@intel.com,
	mark.rutland@arm.com,
	broonie@kernel.org,
	ravi.bangoria@amd.com,
	Kan Liang <kan.liang@linux.intel.com>
Subject: [RFC PATCH V2 06/13] perf: Support SIMD registers
Date: Thu, 26 Jun 2025 12:56:03 -0700
Message-Id: <20250626195610.405379-7-kan.liang@linux.intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20250626195610.405379-1-kan.liang@linux.intel.com>
References: <20250626195610.405379-1-kan.liang@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kan Liang <kan.liang@linux.intel.com>

The users may be interested in the SIMD registers in a sample while
profiling. The current sample_regs_XXX doesn't have enough space for all
SIMD registers.

Add sets of the sample_simd_{pred,vec}_reg_* in the
struct perf_event_attr to define a set of SIMD registers to dump on
samples.
The current X86 supports the XMM registers in sample_regs_XXX. To
utilize the new SIMD registers configuration method, the
sample_simd_regs_enabled should always be set. If so, the XMM space in
the sample_regs_XXX is reserved for other usage.

The SIMD registers are wider than 64. A new output format is introduced.
The number and width of SIMD registers will be dumped first, following
the register values. The number and width are the same as the user's
configuration now. If, for some reason (e.g., ARM) they are different,
an ARCH-specific perf_output_sample_simd_regs can be implemented later
separately.
Add a new ABI, PERF_SAMPLE_REGS_ABI_SIMD, to indicate the new format.
The enum perf_sample_regs_abi becomes a bitmap now. There should be no
impact on the existing tool, since the version and bitmap are the same
for 1 and 2.

Add two new __weak functions to validate the configuration of the SIMD
registers and retrieve the SIMD registers. The ARCH-specific functions
will be implemented in the following patches.

Add a new flag PERF_PMU_CAP_SIMD_REGS to indicate that the PMU has the
capability to support SIMD registers dumping. Error out if the
sample_simd_{pred,vec}_reg_* mistakenly set for a PMU that doesn't have
the capability.

Suggested-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Signed-off-by: Kan Liang <kan.liang@linux.intel.com>
---
 include/linux/perf_event.h      | 13 +++++
 include/linux/perf_regs.h       |  5 ++
 include/uapi/linux/perf_event.h | 47 +++++++++++++++--
 kernel/events/core.c            | 89 +++++++++++++++++++++++++++++++--
 4 files changed, 146 insertions(+), 8 deletions(-)

diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
index 74c188a699e4..56bcb073100f 100644
--- a/include/linux/perf_event.h
+++ b/include/linux/perf_event.h
@@ -305,6 +305,7 @@ struct perf_event_pmu_context;
 #define PERF_PMU_CAP_EXTENDED_HW_TYPE	0x0100
 #define PERF_PMU_CAP_AUX_PAUSE		0x0200
 #define PERF_PMU_CAP_AUX_PREFER_LARGE	0x0400
+#define PERF_PMU_CAP_SIMD_REGS		0x0800
 
 /**
  * pmu::scope
@@ -1488,6 +1489,18 @@ perf_event__output_id_sample(struct perf_event *event,
 extern void
 perf_log_lost_samples(struct perf_event *event, u64 lost);
 
+static inline bool event_has_simd_regs(struct perf_event *event)
+{
+	struct perf_event_attr *attr = &event->attr;
+
+	return attr->sample_simd_regs_enabled != 0 ||
+	       attr->sample_simd_pred_reg_intr != 0 ||
+	       attr->sample_simd_pred_reg_user != 0 ||
+	       attr->sample_simd_vec_reg_qwords != 0 ||
+	       attr->sample_simd_vec_reg_intr != 0 ||
+	       attr->sample_simd_vec_reg_user != 0;
+}
+
 static inline bool event_has_extended_regs(struct perf_event *event)
 {
 	struct perf_event_attr *attr = &event->attr;
diff --git a/include/linux/perf_regs.h b/include/linux/perf_regs.h
index f632c5725f16..38d11f152753 100644
--- a/include/linux/perf_regs.h
+++ b/include/linux/perf_regs.h
@@ -9,6 +9,11 @@ struct perf_regs {
 	struct pt_regs	*regs;
 };
 
+int perf_simd_reg_validate(u16 vec_qwords, u64 vec_mask,
+			   u16 pred_qwords, u32 pred_mask);
+u64 perf_simd_reg_value(struct pt_regs *regs, int idx,
+			u16 qwords_idx, bool pred);
+
 #ifdef CONFIG_HAVE_PERF_REGS
 #include <asm/perf_regs.h>
 
diff --git a/include/uapi/linux/perf_event.h b/include/uapi/linux/perf_event.h
index 78a362b80027..2e9b16acbed6 100644
--- a/include/uapi/linux/perf_event.h
+++ b/include/uapi/linux/perf_event.h
@@ -313,9 +313,10 @@ enum {
  * Values to determine ABI of the registers dump.
  */
 enum perf_sample_regs_abi {
-	PERF_SAMPLE_REGS_ABI_NONE		= 0,
-	PERF_SAMPLE_REGS_ABI_32			= 1,
-	PERF_SAMPLE_REGS_ABI_64			= 2,
+	PERF_SAMPLE_REGS_ABI_NONE		= 0x00,
+	PERF_SAMPLE_REGS_ABI_32			= 0x01,
+	PERF_SAMPLE_REGS_ABI_64			= 0x02,
+	PERF_SAMPLE_REGS_ABI_SIMD		= 0x04,
 };
 
 /*
@@ -382,6 +383,7 @@ enum perf_event_read_format {
 #define PERF_ATTR_SIZE_VER6			120	/* Add: aux_sample_size */
 #define PERF_ATTR_SIZE_VER7			128	/* Add: sig_data */
 #define PERF_ATTR_SIZE_VER8			136	/* Add: config3 */
+#define PERF_ATTR_SIZE_VER9			168	/* Add: sample_simd_{pred,vec}_reg_* */
 
 /*
  * 'struct perf_event_attr' contains various attributes that define
@@ -543,6 +545,25 @@ struct perf_event_attr {
 	__u64	sig_data;
 
 	__u64	config3; /* extension of config2 */
+
+
+	/*
+	 * Defines set of SIMD registers to dump on samples.
+	 * The sample_simd_regs_enabled !=0 implies the
+	 * set of SIMD registers is used to config all SIMD registers.
+	 * If !sample_simd_regs_enabled, sample_regs_XXX may be used to
+	 * config some SIMD registers on X86.
+	 */
+	union {
+		__u16 sample_simd_regs_enabled;
+		__u16 sample_simd_pred_reg_qwords;
+	};
+	__u32 sample_simd_pred_reg_intr;
+	__u32 sample_simd_pred_reg_user;
+	__u16 sample_simd_vec_reg_qwords;
+	__u64 sample_simd_vec_reg_intr;
+	__u64 sample_simd_vec_reg_user;
+	__u32 __reserved_4;
 };
 
 /*
@@ -1016,7 +1037,15 @@ enum perf_event_type {
 	 *      } && PERF_SAMPLE_BRANCH_STACK
 	 *
 	 *	{ u64			abi; # enum perf_sample_regs_abi
-	 *	  u64			regs[weight(mask)]; } && PERF_SAMPLE_REGS_USER
+	 *	  u64			regs[weight(mask)];
+	 *	  struct {
+	 *		u16 nr_vectors;
+	 *		u16 vector_qwords;
+	 *		u16 nr_pred;
+	 *		u16 pred_qwords;
+	 *		u64 data[nr_vectors * vector_qwords + nr_pred * pred_qwords];
+	 *	  } && (abi & PERF_SAMPLE_REGS_ABI_SIMD)
+	 *	} && PERF_SAMPLE_REGS_USER
 	 *
 	 *	{ u64			size;
 	 *	  char			data[size];
@@ -1043,7 +1072,15 @@ enum perf_event_type {
 	 *	{ u64			data_src; } && PERF_SAMPLE_DATA_SRC
 	 *	{ u64			transaction; } && PERF_SAMPLE_TRANSACTION
 	 *	{ u64			abi; # enum perf_sample_regs_abi
-	 *	  u64			regs[weight(mask)]; } && PERF_SAMPLE_REGS_INTR
+	 *	  u64			regs[weight(mask)];
+	 *	  struct {
+	 *		u16 nr_vectors;
+	 *		u16 vector_qwords;
+	 *		u16 nr_pred;
+	 *		u16 pred_qwords;
+	 *		u64 data[nr_vectors * vector_qwords + nr_pred * pred_qwords];
+	 *	  } && (abi & PERF_SAMPLE_REGS_ABI_SIMD)
+	 *	} && PERF_SAMPLE_REGS_INTR
 	 *	{ u64			phys_addr;} && PERF_SAMPLE_PHYS_ADDR
 	 *	{ u64			cgroup;} && PERF_SAMPLE_CGROUP
 	 *	{ u64			data_page_size;} && PERF_SAMPLE_DATA_PAGE_SIZE
diff --git a/kernel/events/core.c b/kernel/events/core.c
index 7f0d98d73629..14ae43694833 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -7390,6 +7390,43 @@ perf_output_sample_regs(struct perf_output_handle *handle,
 	}
 }
 
+static void
+perf_output_sample_simd_regs(struct perf_output_handle *handle,
+			     struct perf_event *event,
+			     struct pt_regs *regs,
+			     u64 mask, u16 pred_mask)
+{
+	u16 pred_qwords = event->attr.sample_simd_pred_reg_qwords;
+	u16 vec_qwords = event->attr.sample_simd_vec_reg_qwords;
+	u16 nr_pred = hweight16(pred_mask);
+	u16 nr_vectors = hweight64(mask);
+	int bit;
+	u64 val;
+	u16 i;
+
+	perf_output_put(handle, nr_vectors);
+	perf_output_put(handle, vec_qwords);
+	perf_output_put(handle, nr_pred);
+	perf_output_put(handle, pred_qwords);
+
+	if (nr_vectors) {
+		for_each_set_bit(bit, (unsigned long *)&mask, sizeof(mask) * BITS_PER_BYTE) {
+			for (i = 0; i < vec_qwords; i++) {
+				val = perf_simd_reg_value(regs, bit, i, false);
+				perf_output_put(handle, val);
+			}
+		}
+	}
+	if (nr_pred) {
+		for_each_set_bit(bit, (unsigned long *)&pred_mask, sizeof(pred_mask) * BITS_PER_BYTE) {
+			for (i = 0; i < pred_qwords; i++) {
+				val = perf_simd_reg_value(regs, bit, i, true);
+				perf_output_put(handle, val);
+			}
+		}
+	}
+}
+
 static void perf_sample_regs_user(struct perf_regs *regs_user,
 				  struct pt_regs *regs)
 {
@@ -7411,6 +7448,17 @@ static void perf_sample_regs_intr(struct perf_regs *regs_intr,
 	regs_intr->abi  = perf_reg_abi(current);
 }
 
+int __weak perf_simd_reg_validate(u16 vec_qwords, u64 vec_mask,
+				  u16 pred_qwords, u32 pred_mask)
+{
+	return vec_qwords || vec_mask || pred_qwords || pred_mask ? -ENOSYS : 0;
+}
+
+u64 __weak perf_simd_reg_value(struct pt_regs *regs, int idx,
+			       u16 qwords_idx, bool pred)
+{
+	return 0;
+}
 
 /*
  * Get remaining task size from user stack pointer.
@@ -7939,10 +7987,17 @@ void perf_output_sample(struct perf_output_handle *handle,
 		perf_output_put(handle, abi);
 
 		if (abi) {
-			u64 mask = event->attr.sample_regs_user;
+			struct perf_event_attr *attr = &event->attr;
+			u64 mask = attr->sample_regs_user;
 			perf_output_sample_regs(handle,
 						data->regs_user.regs,
 						mask);
+			if (abi & PERF_SAMPLE_REGS_ABI_SIMD) {
+				perf_output_sample_simd_regs(handle, event,
+							     data->regs_user.regs,
+							     attr->sample_simd_vec_reg_user,
+							     attr->sample_simd_pred_reg_user);
+			}
 		}
 	}
 
@@ -7970,11 +8025,18 @@ void perf_output_sample(struct perf_output_handle *handle,
 		perf_output_put(handle, abi);
 
 		if (abi) {
-			u64 mask = event->attr.sample_regs_intr;
+			struct perf_event_attr *attr = &event->attr;
+			u64 mask = attr->sample_regs_intr;
 
 			perf_output_sample_regs(handle,
 						data->regs_intr.regs,
 						mask);
+			if (abi & PERF_SAMPLE_REGS_ABI_SIMD) {
+				perf_output_sample_simd_regs(handle, event,
+							     data->regs_intr.regs,
+							     attr->sample_simd_vec_reg_intr,
+							     attr->sample_simd_pred_reg_intr);
+			}
 		}
 	}
 
@@ -12535,6 +12597,12 @@ static int perf_try_init_event(struct pmu *pmu, struct perf_event *event)
 	if (ret)
 		goto err_pmu;
 
+	if (!(pmu->capabilities & PERF_PMU_CAP_SIMD_REGS) &&
+	    event_has_simd_regs(event)) {
+		ret = -EOPNOTSUPP;
+		goto err_destroy;
+	}
+
 	if (!(pmu->capabilities & PERF_PMU_CAP_EXTENDED_REGS) &&
 	    event_has_extended_regs(event)) {
 		ret = -EOPNOTSUPP;
@@ -13076,6 +13144,12 @@ static int perf_copy_attr(struct perf_event_attr __user *uattr,
 		ret = perf_reg_validate(attr->sample_regs_user);
 		if (ret)
 			return ret;
+		ret = perf_simd_reg_validate(attr->sample_simd_vec_reg_qwords,
+					     attr->sample_simd_vec_reg_user,
+					     attr->sample_simd_pred_reg_qwords,
+					     attr->sample_simd_pred_reg_user);
+		if (ret)
+			return ret;
 	}
 
 	if (attr->sample_type & PERF_SAMPLE_STACK_USER) {
@@ -13096,8 +13170,17 @@ static int perf_copy_attr(struct perf_event_attr __user *uattr,
 	if (!attr->sample_max_stack)
 		attr->sample_max_stack = sysctl_perf_event_max_stack;
 
-	if (attr->sample_type & PERF_SAMPLE_REGS_INTR)
+	if (attr->sample_type & PERF_SAMPLE_REGS_INTR) {
 		ret = perf_reg_validate(attr->sample_regs_intr);
+		if (ret)
+			return ret;
+		ret = perf_simd_reg_validate(attr->sample_simd_vec_reg_qwords,
+					     attr->sample_simd_vec_reg_intr,
+					     attr->sample_simd_pred_reg_qwords,
+					     attr->sample_simd_pred_reg_intr);
+		if (ret)
+			return ret;
+	}
 
 #ifndef CONFIG_CGROUP_PERF
 	if (attr->sample_type & PERF_SAMPLE_CGROUP)
-- 
2.38.1

