Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EE9E2010F5
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 05:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.60.130.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738646492; cv=none; b=jWk8BumLzCFL6on1lEcGuN6k3sgkMeaSSh6+0BAm7hqIiZX3MrIWC8V3ZH+qLg+l8LKksHD8glWFbRcia7aZVHyv4yEWuO6NYkhu05e7pT3eZFDBapWJVEnrpDyD3ytqlEo6yHdNhLbCCCZcfEqtAncmdYxtUoCzVB8as5sM874=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738646492; c=relaxed/simple;
	bh=0zO4mzU89XZcHygErnqGdtfH4bgG1UUoHnYwzYtDlhY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KjaSbeiuw1Rl5btcz8VYIHZhd62qRntcRn1HYHAg7KVNs/cnpb7hZR7cY0tmEV61/lFGltRKGz5uGd6LONsd4DyECpMY4mvhex4pOfwfY8c4P2CODjUOb+HvwA0mijDVE/syjXkI93MwiEeYudEZWcgaLd4LgQmQo0ys0+Upbxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=bDav7Xkj; arc=none smtp.client-ip=178.60.130.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="bDav7Xkj"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=XWUZUB7dEkdjPX3TEON8I8RpFQFPW1DHkKvNFPFf/hI=; b=bDav7XkjjeqveKDFb8+9rp3ldP
	QJofScKy/hvfu/Eah6cM85Dv/R/8mMXCTgUJfGD/IwtmwxquChC0y4y+deoDZc8dmAKzqdzspFlmJ
	quqwWCPKnWLNVLlhSOgMef4PCB+Z1U43y5qjkUANnGL4FLKfnBKtDskl2Yf/0LnWxq8tKItpzim4K
	gPZFEBw7CarflOfa2eQ1hdU5BLQKT0m7NSnEntpXUzCbDYHdgq+EMzr3TvtUlAo5SfZRFZh2UUUpk
	7+thFfhm34cYSFrBPg+spfLFMkBW9aKBcfz1nEn92tMvIRXojg1EYRUw024L+60S1g3L5ozIzl9cW
	/PGqjTrA==;
Received: from [58.29.143.236] (helo=localhost)
	by fanzine2.igalia.com with utf8esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1tfBN9-003J23-UG; Tue, 04 Feb 2025 06:21:26 +0100
From: Changwoo Min <changwoo@igalia.com>
To: tj@kernel.org,
	void@manifault.com,
	arighi@nvidia.com
Cc: kernel-dev@igalia.com,
	linux-kernel@vger.kernel.org,
	Changwoo Min <changwoo@igalia.com>
Subject: [PATCH v4 4/7] sched_ext: Add an event, SCX_EV_BYPASS_DURATION
Date: Tue,  4 Feb 2025 14:20:54 +0900
Message-ID: <20250204052057.67776-5-changwoo@igalia.com>
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

Add a core event, SCX_EV_BYPASS_DURATION, which represents the
total duration of bypass modes in nanoseconds.

Signed-off-by: Changwoo Min <changwoo@igalia.com>
---
 kernel/sched/ext.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/kernel/sched/ext.c b/kernel/sched/ext.c
index 0ed2db44ae33..8a9a30895381 100644
--- a/kernel/sched/ext.c
+++ b/kernel/sched/ext.c
@@ -1468,6 +1468,11 @@ struct scx_event_stats {
 	 */
 	u64		SCX_EV_ENQ_SKIP_EXITING;
 
+	/*
+	 * The total duration of bypass modes in nanoseconds.
+	 */
+	u64		SCX_EV_BYPASS_DURATION;
+
 	/*
 	 * The number of tasks dispatched in the bypassing mode.
 	 */
@@ -4408,6 +4413,8 @@ static void scx_clear_softlockup(void)
 static void scx_ops_bypass(bool bypass)
 {
 	static DEFINE_RAW_SPINLOCK(bypass_lock);
+	static unsigned long bypass_timestamp;
+
 	int cpu;
 	unsigned long flags;
 
@@ -4417,12 +4424,15 @@ static void scx_ops_bypass(bool bypass)
 		WARN_ON_ONCE(scx_ops_bypass_depth <= 0);
 		if (scx_ops_bypass_depth != 1)
 			goto unlock;
+		bypass_timestamp = ktime_get_ns();
 		scx_add_event(SCX_EV_BYPASS_ACTIVATE, 1);
 	} else {
 		scx_ops_bypass_depth--;
 		WARN_ON_ONCE(scx_ops_bypass_depth < 0);
 		if (scx_ops_bypass_depth != 0)
 			goto unlock;
+		scx_add_event(SCX_EV_BYPASS_DURATION,
+			      ktime_get_ns() - bypass_timestamp);
 	}
 
 	atomic_inc(&scx_ops_breather_depth);
@@ -5013,6 +5023,7 @@ static void scx_dump_state(struct scx_exit_info *ei, size_t dump_len)
 	scx_dump_event(s, &events, SCX_EV_DISPATCH_LOCAL_DSQ_OFFLINE);
 	scx_dump_event(s, &events, SCX_EV_DISPATCH_KEEP_LAST);
 	scx_dump_event(s, &events, SCX_EV_ENQ_SKIP_EXITING);
+	scx_dump_event(s, &events, SCX_EV_BYPASS_DURATION);
 	scx_dump_event(s, &events, SCX_EV_BYPASS_DISPATCH);
 	scx_dump_event(s, &events, SCX_EV_BYPASS_ACTIVATE);
 
@@ -7152,6 +7163,7 @@ __bpf_kfunc void scx_bpf_events(struct scx_event_stats *events,
 		scx_agg_event(&e_sys, e_cpu, SCX_EV_DISPATCH_LOCAL_DSQ_OFFLINE);
 		scx_agg_event(&e_sys, e_cpu, SCX_EV_DISPATCH_KEEP_LAST);
 		scx_agg_event(&e_sys, e_cpu, SCX_EV_ENQ_SKIP_EXITING);
+		scx_agg_event(&e_sys, e_cpu, SCX_EV_BYPASS_DURATION);
 		scx_agg_event(&e_sys, e_cpu, SCX_EV_BYPASS_DISPATCH);
 		scx_agg_event(&e_sys, e_cpu, SCX_EV_BYPASS_ACTIVATE);
 	}
-- 
2.48.1

