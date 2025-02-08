Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4579419ABAC
	for <linux-kernel@vger.kernel.org>; Sat,  8 Feb 2025 04:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.60.130.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738989849; cv=none; b=g0MZ85as4v7txsDUp/u0PQaYw6INhpCoicsdzP/fud/YMKEPg67WmJux6GeGm+ufm0RBoHiSoCNP5/zpr0/j2lrxRWwYWArUujXmFVY9ky9llw99uYfBk3l3wxKGsSjxzuZi7F+eCPgBqp8FSd6VRUH8OHgZQ5yB8933HNlgFVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738989849; c=relaxed/simple;
	bh=li1aBUTL+55uXGyWeurfb+KRnrP+ALHxuesLSCwrJNQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=saXTKm3c11WSVJ0w5PtYhpz8wrPgjt1rGApdlw5Vf3cERsUafA1twZaSN0jylTMxbNxyAJkXmQOK5r0RlueefI7Ex7T64uE1kEDj8bmFsI7fhrAKLQ14OZpjXGxkPprl7MVLy3q+IY93ETfjOO4Qy8ypAyx5ISaF7u4c7un5tj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=GUFmgKvl; arc=none smtp.client-ip=178.60.130.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="GUFmgKvl"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=AMS53CKue6O4u6b9zjPokpg2ky2xafInfnnaOlolcyI=; b=GUFmgKvlPUqBQ880MxEDkK/1Qk
	IKQe3dh0HDTtpyoC5LjJQqoA3QfnWHE3R9lafevUqptUs06u34Gh7wv01hJ6oKG71tlFD+XN7d73g
	ho9T9vN0Ectdz4VnBC75wcQB2dPoceLQ5bVvACaF/hPIhQOxVmWjIlG1MES05bxuDgvdAIazjYEcn
	LbSFQfqjQEutazoOIq0BeVeTw2TOcW5Ieb2TGuxFFbozfxzHFERUaRTh48x1ou2w3VoUc4ZO8nSKv
	vQ9L1c3sy9BAM7u22FgayqVQLNSxW8CyBKznTAie35W9JVWZ8Z3y4tEoar2iC7tJpFfKXgGbmaNb+
	AJ2tj1RA==;
Received: from [106.101.136.205] (helo=localhost)
	by fanzine2.igalia.com with utf8esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1tgch9-006GAp-JY; Sat, 08 Feb 2025 05:44:02 +0100
From: Changwoo Min <changwoo@igalia.com>
To: tj@kernel.org,
	void@manifault.com,
	arighi@nvidia.com
Cc: kernel-dev@igalia.com,
	linux-kernel@vger.kernel.org,
	Changwoo Min <changwoo@igalia.com>
Subject: [PATCH 4/4] sched_ext: Use __COMPAT_is_enq_cpu_selected() in scx_qmap
Date: Sat,  8 Feb 2025 13:43:32 +0900
Message-ID: <20250208044332.492494-5-changwoo@igalia.com>
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

Instead of directly using SCX_ENQ_CPU_SELECTED, which may not be defined
in old kernels, use the __COMPAT_is_enq_cpu_selected() helper function
so the BPF scheduler can behave correctly regardless of kernel versions.

Signed-off-by: Changwoo Min <changwoo@igalia.com>
---
 tools/sched_ext/scx_qmap.bpf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/sched_ext/scx_qmap.bpf.c b/tools/sched_ext/scx_qmap.bpf.c
index 5edb79742e37..267fe15d934a 100644
--- a/tools/sched_ext/scx_qmap.bpf.c
+++ b/tools/sched_ext/scx_qmap.bpf.c
@@ -231,7 +231,7 @@ void BPF_STRUCT_OPS(qmap_enqueue, struct task_struct *p, u64 enq_flags)
 	}
 
 	/* if select_cpu() wasn't called, try direct dispatch */
-	if (!(enq_flags & SCX_ENQ_CPU_SELECTED) &&
+	if (!__COMPAT_is_enq_cpu_selected(enq_flags) &&
 	    (cpu = pick_direct_dispatch_cpu(p, scx_bpf_task_cpu(p))) >= 0) {
 		__sync_fetch_and_add(&nr_ddsp_from_enq, 1);
 		scx_bpf_dsq_insert(p, SCX_DSQ_LOCAL_ON | cpu, slice_ns, enq_flags);
-- 
2.48.1

