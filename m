Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E686155A25
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 07:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.60.130.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738307422; cv=none; b=p68evd1cxxsmHDNttDB5n7MMPifVJEw9QGp/5c36SAy3OTDo4Ma0H7axnD223M1rYrSY6Y+KX0+mnvqYmGxMduEdpGk9ggsMmmNxBQ0RxUJNrShDlOPZVSCsw1avSEbJIF4X8SyfrV/H2CwLmH7shNSbM+PcuzXguVaf6cAXCao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738307422; c=relaxed/simple;
	bh=vVTmVove9mAvo8Cw+DJNPc3wotFTo2uOH6r2mhjUcXI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RAKstAvlZrLLlYnrM5zGVtiGA8njfp6lfwreQ3OFYEr+/CNDpumrcSCOkG6rxIUef0me5gkLk2+QjPieYhSzD7/spLTUWanwW+4KvezeiCIA7iClyvtGrD0jlEOppFzZe+F0XECqLQa8W+GDDNyP5Odm2ny08P7YcUSKTpUi/ZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=F/hq1Uhh; arc=none smtp.client-ip=178.60.130.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="F/hq1Uhh"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=BnttP+/65C5cMgnCxDHDe3eQwYOHd71rGHs5NrkOf4M=; b=F/hq1UhhRLANz/knCxKfsV9Hyj
	oB4Rp76k2QbXaJ/l7SI3us/bdPEpK66sHmFHZYf+Ntud+eav/sTuZShEbh0We9uqkK9EUKwEe7/97
	nTGim91pKiqwAzphEUWpYoKZZAU9WqFP+sh9ZFhIiJ0QlwwQujadruL7g+4UaI2qi+eXRDH/tWVnU
	dI4iVw/7K8lNWfAvOFieHTtiUKv1TTlp5gfzaP7b+LZ2/6Sw87nmyO37uSGKENZgDS3pJBemX5T4t
	avsKAsGHYtk7xD0h6Wa63y30M10h5M6kuwES/zq4JamxY/H416ou/1scPh102mVWG/KHiicxJy3Ey
	aSGRvF4Q==;
Received: from [58.29.143.236] (helo=localhost)
	by fanzine2.igalia.com with utf8esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1tdlAF-001KZz-PE; Fri, 31 Jan 2025 08:10:14 +0100
From: Changwoo Min <changwoo@igalia.com>
To: tj@kernel.org,
	void@manifault.com,
	arighi@nvidia.com
Cc: kernel-dev@igalia.com,
	linux-kernel@vger.kernel.org,
	Changwoo Min <changwoo@igalia.com>
Subject: [PATCH v3 06/11] sched_ext: Add an event, SCX_EV_BYPASS_ACTIVATE
Date: Fri, 31 Jan 2025 16:09:33 +0900
Message-ID: <20250131070938.95551-7-changwoo@igalia.com>
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

Add a core event, SCX_EV_BYPASS_ACTIVATE, which represents how many
times the bypass mode has been triggered.

Signed-off-by: Changwoo Min <changwoo@igalia.com>
---
 kernel/sched/ext.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/kernel/sched/ext.c b/kernel/sched/ext.c
index 37f86a84ac5d..07d54b52e971 100644
--- a/kernel/sched/ext.c
+++ b/kernel/sched/ext.c
@@ -1467,6 +1467,11 @@ struct scx_event_stats {
 	 * is dispatched to a local DSQ when exiting.
 	 */
 	u64		SCX_EV_ENQ_SKIP_EXITING;
+
+	/*
+	 * The number of times the bypassing mode has been activated.
+	 */
+	u64		SCX_EV_BYPASS_ACTIVATE;
 };
 
 /*
@@ -4400,6 +4405,7 @@ static void scx_ops_bypass(bool bypass)
 		WARN_ON_ONCE(scx_ops_bypass_depth <= 0);
 		if (scx_ops_bypass_depth != 1)
 			goto unlock;
+		scx_add_event(SCX_EV_BYPASS_ACTIVATE, 1);
 	} else {
 		scx_ops_bypass_depth--;
 		WARN_ON_ONCE(scx_ops_bypass_depth < 0);
@@ -4995,6 +5001,7 @@ static void scx_dump_state(struct scx_exit_info *ei, size_t dump_len)
 	scx_dump_event(s, &events, SCX_EV_DISPATCH_LOCAL_DSQ_OFFLINE);
 	scx_dump_event(s, &events, SCX_EV_DISPATCH_KEEP_LAST);
 	scx_dump_event(s, &events, SCX_EV_ENQ_SKIP_EXITING);
+	scx_dump_event(s, &events, SCX_EV_BYPASS_ACTIVATE);
 
 	if (seq_buf_has_overflowed(&s) && dump_len >= sizeof(trunc_marker))
 		memcpy(ei->dump + dump_len - sizeof(trunc_marker),
@@ -7131,6 +7138,7 @@ __bpf_kfunc void scx_bpf_events(struct scx_event_stats *events,
 		scx_agg_event(&e_sys, e_cpu, SCX_EV_SELECT_CPU_FALLBACK);
 		scx_agg_event(&e_sys, e_cpu, SCX_EV_DISPATCH_LOCAL_DSQ_OFFLINE);
 		scx_agg_event(&e_sys, e_cpu, SCX_EV_DISPATCH_KEEP_LAST);
+		scx_agg_event(&e_sys, e_cpu, SCX_EV_BYPASS_ACTIVATE);
 	}
 
 	/*
-- 
2.48.1

