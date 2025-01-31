Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC01B1B0F36
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 07:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.60.130.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738307434; cv=none; b=AFBPQmEGWZReT/N6fSN3rIygkRxZDcGMuRjcp/gBHP1CEQKjZ89ldGCruJdNkuDZYBaLNOr1P5F8vT5QgS804dzAJATbBi2xH5zwKdmvyCpIlGbyCB/LJNhMODpjVWFXVHznUciWKBeoqORdAFJcOAE8gUJC2p/956/RTrtjhgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738307434; c=relaxed/simple;
	bh=aDGAYJA1+sGeb7oAD54GNtzvb6oRlMYsAZN8uyPoh7g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=unS+SsbOgqrWWY9M0Q79oDmv5lC5cUm+rPz4Pgn7HQCrWtfwXyrB7duOeUAq2w306lZO+duVp3fXvTMm1i2msPPdQBTLgVZH3Dnqmkz16w9pPmAwr8AJ84gbptWSmxiKLgOGK4ybJHtse4AZP9c+dwF1E2RQF6TE1eT0Nbc7SGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=hqYFnY0J; arc=none smtp.client-ip=178.60.130.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="hqYFnY0J"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=6wmy9wiY+BIcaE6mz6azlkKLSB01DI1uDlstSmP/ppg=; b=hqYFnY0JCXUFl1YVGwrgemi+F8
	xN+YYzwTz0bvJIPaVZcYHJDu9645lquekmbUeTMFPxdXKXETCTRxQC0yIMc8hp+lehmFaqti1GKsz
	X5ERA30wg+0AHebu7JNPPjo9O3XuebYXBXbY0bnBWXdLujdjWWMJ3tm2WP1kvvwIsc62LIJv7rTt6
	VUVJcAidexOnJxGjuru58mHMPfsZpfBSj4T39W9EElD45i/cGJFFnxWxZvKrZpVM5eVjZezwboD0h
	EJ/UM/1RUOXNfAiEBYeEdNFgSLBW53oCM+Ene3GwSaxJN27JTAtgEztSZXnuGg1iWdgK7qbzJNxnN
	zfoXcivA==;
Received: from [58.29.143.236] (helo=localhost)
	by fanzine2.igalia.com with utf8esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1tdlAS-001KaU-Oy; Fri, 31 Jan 2025 08:10:27 +0100
From: Changwoo Min <changwoo@igalia.com>
To: tj@kernel.org,
	void@manifault.com,
	arighi@nvidia.com
Cc: kernel-dev@igalia.com,
	linux-kernel@vger.kernel.org,
	Changwoo Min <changwoo@igalia.com>
Subject: [PATCH v3 09/11] sched_ext: Add scx_bpf_events() and scx_read_event() for BPF schedulers
Date: Fri, 31 Jan 2025 16:09:36 +0900
Message-ID: <20250131070938.95551-10-changwoo@igalia.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250131070938.95551-1-changwoo@igalia.com>
References: <20250131070938.95551-1-changwoo@igalia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

scx_bpf_events() is added to the header files so the BPF scheduler
can use it. Also, scx_read_event() is added to read an event type in a
compatible way.

Signed-off-by: Changwoo Min <changwoo@igalia.com>
---
 tools/sched_ext/include/scx/common.bpf.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/sched_ext/include/scx/common.bpf.h b/tools/sched_ext/include/scx/common.bpf.h
index f254a39b86a5..705540003024 100644
--- a/tools/sched_ext/include/scx/common.bpf.h
+++ b/tools/sched_ext/include/scx/common.bpf.h
@@ -78,6 +78,10 @@ struct rq *scx_bpf_cpu_rq(s32 cpu) __ksym;
 struct cgroup *scx_bpf_task_cgroup(struct task_struct *p) __ksym __weak;
 u64 scx_bpf_now(void) __ksym __weak;
 
+void scx_bpf_events(struct scx_event_stats *events, size_t events__sz) __ksym __weak;
+#define scx_read_event(e, name)							\
+	(bpf_core_field_exists((e)->name) ? (e)->name : 0)
+
 /*
  * Use the following as @it__iter when calling scx_bpf_dsq_move[_vtime]() from
  * within bpf_for_each() loops.
-- 
2.48.1

