Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8801A1E8854
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 05:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.60.130.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738646498; cv=none; b=TT2gVieXz7DnxkY75n1N26iqTeeo/9TJW1biwJGA9hFAkqUxodhqSdxz+erB9v+r+zOW9zFAvXcnLyPTOVw+IdJpbvOT1F0KQxUX1f1R5YH5MMiS7qA79hie55oZOFrWtUfhOnFQwb39n8t3/8XvP2RrHx3hiTwv84BGARYk9AY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738646498; c=relaxed/simple;
	bh=xGzOpu46J/pEbp7eS4KAB9SmuNGR4NioxujNLnmZVX4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J8SzzLcmiQ8vWkwtOcQlV2S6WeXM9qZOJK1Q75jsAAn0mEXZr/mC2+ovVcO6BXKz3bweZe+aakVGzeSptRM+1af3By2Y+GpHw+c5RbXtMF+QyU4j5ETwkPkYjir9W5UagfhD/fYBNAzHmQJwsWYq+S4QmsKn3GMgQuNWtvZNXq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=TZFYqonv; arc=none smtp.client-ip=178.60.130.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="TZFYqonv"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=mJXdIHsaQ9xrkYh9iKL0c3bdzWJdi9zL99QOPdxOmVc=; b=TZFYqonvq+v57NHTtx9mdlLl9g
	PT0uem6BusBUvxZ88gbsPHXKqHAZnKzJMDzSHGglhFeV+0cL3/8gFYknKkTNBULSYoMOXtMpdZbJP
	q8o7yqmlndGqtabzeHv18G9XrxGLEd5eMPNKEYVXT/vFn0IOgIsvWKLuTojWRRuNw3h2KDM9j4bJa
	qDwEgUcQ2oIEwM4KDtGB80d8IO3K1Xi2JvmL3y5KfxrGu6XWyRbIU66jeEhzvVQlf3ywRQ1nDeJnX
	piVLtisY9RqabQavhLTScxQnIXwJctjcP81enscIRTRZYnXbMdw8Ey8mjqEhQBbePiNEcLw0Y3pNj
	9A1y3khQ==;
Received: from [58.29.143.236] (helo=localhost)
	by fanzine2.igalia.com with utf8esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1tfBNE-003J2E-ON; Tue, 04 Feb 2025 06:21:31 +0100
From: Changwoo Min <changwoo@igalia.com>
To: tj@kernel.org,
	void@manifault.com,
	arighi@nvidia.com
Cc: kernel-dev@igalia.com,
	linux-kernel@vger.kernel.org,
	Changwoo Min <changwoo@igalia.com>
Subject: [PATCH v4 5/7] sched_ext: Add scx_bpf_events() and scx_read_event() for BPF schedulers
Date: Tue,  4 Feb 2025 14:20:55 +0900
Message-ID: <20250204052057.67776-6-changwoo@igalia.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250204052057.67776-1-changwoo@igalia.com>
References: <20250204052057.67776-1-changwoo@igalia.com>
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
index d72b60a0c582..ae717f4d6ede 100644
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

