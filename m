Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AEA81E0087
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 05:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.60.130.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738646487; cv=none; b=XaWI6Er4NMfrujgp18AdrmuXCApZMORxnUiMx5i+T3OSv9ibMAd5OFTmmhjFzhzlV+zsdnrp3kmLnEf5Sq8MfWCdDTOtWgkvd9PAVI5Zy+AIcuDwArEXsDMK33HSDTO04xcPYbvtnxmnL/pXyktKumZrC3y+YdlfPJKFXaTfZgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738646487; c=relaxed/simple;
	bh=HCX/BNAL4qRCt8je8Retbqx3rKU6NviY86+g6plpXFU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pdCUd4jQce0R5zAkOQb25KRXubDlCFbE5/MbLBrNCy0H57iT+L/N76rsnTvJgUPi+2PcnAwU0x95nB+OV/bRP7M5w+0Z4EIteXffzI+0pRpCA4WG0TO19fFcp9rslJ/pJkoMbizloZvFBB5WNI8H6vDDx/Tu4jNSbANc84p2ziI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=IkE72nAS; arc=none smtp.client-ip=178.60.130.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="IkE72nAS"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=j75DTvq3rhQnrq8Yf/VVWB6T9WCeRj/6cxrPZNTRjxs=; b=IkE72nASx/sVR/WnenxHHGlnnp
	iE2B6/Tlc6SZIpoBMNn53Q1PMXose06tioYzA6i1QM2kPNVLuTMvUHYOKZcdIb+mYUfpBdnUFDSZV
	Fp5p3qbcq7OUK++CwLmDOFpvE/yRZq3wc0I9yJymzWm6lRoGCHGAHxesJWZTmz45f54WQr0wCC6f1
	OhKBSzx6lmi7j3puc/vMGuvvZXoHTIxStQ9Jvz4unJ1cvQeStNceLU4iaYEkgIkaUcSTi5Gwjhyvd
	QYj+JWLY/+Td9kk1vMTSVMGsR8Ga9b7gJWPP/8yDtIPIlCoBYvUCwpR1CwNa7nc6QlqLZE/GQHoou
	UVawUY0w==;
Received: from [58.29.143.236] (helo=localhost)
	by fanzine2.igalia.com with utf8esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1tfBN1-003J1h-4O; Tue, 04 Feb 2025 06:21:17 +0100
From: Changwoo Min <changwoo@igalia.com>
To: tj@kernel.org,
	void@manifault.com,
	arighi@nvidia.com
Cc: kernel-dev@igalia.com,
	linux-kernel@vger.kernel.org,
	Changwoo Min <changwoo@igalia.com>
Subject: [PATCH v4 2/7] sched_ext: Add an event, SCX_EV_BYPASS_ACTIVATE
Date: Tue,  4 Feb 2025 14:20:52 +0900
Message-ID: <20250204052057.67776-3-changwoo@igalia.com>
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

Add a core event, SCX_EV_BYPASS_ACTIVATE, which represents how many
times the bypass mode has been triggered.

Signed-off-by: Changwoo Min <changwoo@igalia.com>
---
 kernel/sched/ext.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/kernel/sched/ext.c b/kernel/sched/ext.c
index c72ba405a1d3..377c2e99cf4f 100644
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
@@ -4399,6 +4404,7 @@ static void scx_ops_bypass(bool bypass)
 		WARN_ON_ONCE(scx_ops_bypass_depth <= 0);
 		if (scx_ops_bypass_depth != 1)
 			goto unlock;
+		scx_add_event(SCX_EV_BYPASS_ACTIVATE, 1);
 	} else {
 		scx_ops_bypass_depth--;
 		WARN_ON_ONCE(scx_ops_bypass_depth < 0);
@@ -4994,6 +5000,7 @@ static void scx_dump_state(struct scx_exit_info *ei, size_t dump_len)
 	scx_dump_event(s, &events, SCX_EV_DISPATCH_LOCAL_DSQ_OFFLINE);
 	scx_dump_event(s, &events, SCX_EV_DISPATCH_KEEP_LAST);
 	scx_dump_event(s, &events, SCX_EV_ENQ_SKIP_EXITING);
+	scx_dump_event(s, &events, SCX_EV_BYPASS_ACTIVATE);
 
 	if (seq_buf_has_overflowed(&s) && dump_len >= sizeof(trunc_marker))
 		memcpy(ei->dump + dump_len - sizeof(trunc_marker),
@@ -7131,6 +7138,7 @@ __bpf_kfunc void scx_bpf_events(struct scx_event_stats *events,
 		scx_agg_event(&e_sys, e_cpu, SCX_EV_DISPATCH_LOCAL_DSQ_OFFLINE);
 		scx_agg_event(&e_sys, e_cpu, SCX_EV_DISPATCH_KEEP_LAST);
 		scx_agg_event(&e_sys, e_cpu, SCX_EV_ENQ_SKIP_EXITING);
+		scx_agg_event(&e_sys, e_cpu, SCX_EV_BYPASS_ACTIVATE);
 	}
 
 	/*
-- 
2.48.1

