Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04E2A1990DB
	for <linux-kernel@vger.kernel.org>; Sat,  8 Feb 2025 04:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.60.130.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738989845; cv=none; b=JaNCREdALNd7zdQwIyPJe7GabgPqRFWgzlvwd1BSAXZS1GU6f4TJRQadniHDbRR+gsj1RI296ac4XeJyIEnC4hFGpyvwYGaRRwfMXwF9BfTSfWV4GpqYepeauNrt9RLU0+g86ScoiBAiNPlWA3v7eajeTZx22Zr0MTrL/OKCgps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738989845; c=relaxed/simple;
	bh=B/FHjc0cXLJemENSQefcY0WP/gSV5thN8kbhUQA6mA0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iC9LHawJCd5cylB98ch+Dl8zG5+hGR3vpbWGdQR5nAUXZtIYOY6NfHY7phMg5AHRzFkAQnHUNEjFa7JPoB/zfAqaM7knNtTa5KJ2uDuD+lEfAAC9b6J6PTQf6ZybAB8TNuu2JzUjokJhbyutI+m8SHfQm6bxkNDZLUJd9v8kY68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=XQS7qQlZ; arc=none smtp.client-ip=178.60.130.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="XQS7qQlZ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=8dD4v9cv1i63oi1UWv3E8vmBBGiVHP/+Zp0HTkK8Fmc=; b=XQS7qQlZg+1mUD9kUuro4DYA9V
	X4gpEAjMsuAhVC9NMvtq5T7MIdg1oRkeLCMtYUHvAS83VnBqTKcYvoUkBTUm/OpDMQHPfno8wsevg
	muGCpOXGW2CPkNyxyeojLpusK2kZY+CezF4ddPcFepsHPYQoq1yUcm5sdEcI20uIkWHCH0uXmRP7n
	/zLtQ37tm8fbcLoFs4YoByag5QqhGASnDLDv4ydLmhGKtJOX/+s+8OVsgx0au903UptBcYPPSl0k6
	6sfm8MJXzgo2JYu16+1M7kp+5sgMzeZUE6P5EGM653nMLerR9GjsBiw1f2jdzE/X3nJiY969jVwp4
	HN+qiY4g==;
Received: from [106.101.136.205] (helo=localhost)
	by fanzine2.igalia.com with utf8esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1tgch4-006GAZ-FU; Sat, 08 Feb 2025 05:43:57 +0100
From: Changwoo Min <changwoo@igalia.com>
To: tj@kernel.org,
	void@manifault.com,
	arighi@nvidia.com
Cc: kernel-dev@igalia.com,
	linux-kernel@vger.kernel.org,
	Changwoo Min <changwoo@igalia.com>
Subject: [PATCH 3/4] sched_ext: Add __COMPAT_is_enq_cpu_selected() for BPF compatability
Date: Sat,  8 Feb 2025 13:43:31 +0900
Message-ID: <20250208044332.492494-4-changwoo@igalia.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250208044332.492494-1-changwoo@igalia.com>
References: <20250208044332.492494-1-changwoo@igalia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Suppose a BPF scheduler is compiled against the vmlinux.h that has
SCX_ENQ_CPU_SELECTED, but it runs on an old kernel where SCX_ENQ_CPU_SELECTED
is not defined. In this case, the test result of
'enq_flags & SCX_ENQ_CPU_SELECTED' will always be false. That test result is
semantically incorrect because the kernel before SCX_ENQ_CPU_SELECTED has
never skipped select_task_rq_scx(), so the result should be true.
To hide such complexity, introduce __COMPAT_is_enq_cpu_selected(), which
checks if SCX_ENQ_CPU_SELECTED exists in runtime using BPF CO-RE.

Signed-off-by: Changwoo Min <changwoo@igalia.com>
---
 tools/sched_ext/include/scx/compat.bpf.h | 52 ++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/tools/sched_ext/include/scx/compat.bpf.h b/tools/sched_ext/include/scx/compat.bpf.h
index 50e1499ae093..e5fa72f9bf22 100644
--- a/tools/sched_ext/include/scx/compat.bpf.h
+++ b/tools/sched_ext/include/scx/compat.bpf.h
@@ -125,6 +125,58 @@ bool scx_bpf_dispatch_vtime_from_dsq___compat(struct bpf_iter_scx_dsq *it__iter,
 	false;									\
 })
 
+/**
+ * __COMPAT_is_enq_cpu_selected - Test if SCX_ENQ_CPU_SELECTED is on
+ * in a compatible way. We will preserve this __COMPAT helper until v6.16.
+ *
+ * @enq_flags: enqueue flags from ops.enqueue()
+ *
+ * Return: True if SCX_ENQ_CPU_SELECTED is turned on in @enq_flags
+ */
+static inline bool __COMPAT_is_enq_cpu_selected(u64 enq_flags)
+{
+#ifdef HAVE_SCX_ENQ_CPU_SELECTED
+	/*
+	 * This is the case that a BPF code compiled against vmlinux.h
+	 * where the enum SCX_ENQ_CPU_SELECTED exists.
+	 */
+
+	/*
+	 * We should temporarily suspend the macro expansion of
+	 * 'SCX_ENQ_CPU_SELECTED'. This avoids 'SCX_ENQ_CPU_SELECTED' being
+	 * rewritten to '__SCX_ENQ_CPU_SELECTED' when 'SCX_ENQ_CPU_SELECTED'
+	 * is defined in 'scripts/gen_enums.py'.
+	 */
+#pragma push_macro("SCX_ENQ_CPU_SELECTED")
+#undef SCX_ENQ_CPU_SELECTED
+	u64 flag;
+
+	/*
+	 * When the kernel did not have SCX_ENQ_CPU_SELECTED,
+	 * select_task_rq_scx() has never been skipped. Thus, this case
+	 * should be considered that the CPU has already been selected.
+	 */
+	if (!bpf_core_enum_value_exists(enum scx_enq_flags,
+					SCX_ENQ_CPU_SELECTED))
+		return true;
+
+	flag = bpf_core_enum_value(enum scx_enq_flags, SCX_ENQ_CPU_SELECTED);
+	return enq_flags & flag;
+
+	/*
+	 * Once done, resume the macro expansion of 'SCX_ENQ_CPU_SELECTED'.
+	 */
+#pragma pop_macro("SCX_ENQ_CPU_SELECTED")
+#else
+	/*
+	 * This is the case that a BPF code compiled against vmlinux.h
+	 * where the enum SCX_ENQ_CPU_SELECTED does NOT exist.
+	 */
+	return true;
+#endif /* HAVE_SCX_ENQ_CPU_SELECTED */
+}
+
+
 #define scx_bpf_now()								\
 	(bpf_ksym_exists(scx_bpf_now) ?						\
 	 scx_bpf_now() :							\
-- 
2.48.1

