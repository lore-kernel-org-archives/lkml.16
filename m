Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E91491F8BDF
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 14:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.60.130.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739198221; cv=none; b=ggaHcrYnwJA7+2BqGm3FKxAmt9dvysPQVl/iPjWlSlIxEuTvfG9xrHLpMFRfRpRzHg1hEzocPz2DyBVRTSxXXVRd08o0PLChrOFOv7x9OGwrZ/i4kSAtnBP3VIKmfIpBHp3exyHFJk0wLF6bg7ndRgmC18LovALwDrIsYDCH5BY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739198221; c=relaxed/simple;
	bh=pd7bEo1slj1TH08yYRkcVmuhsESr1qU75F9ZM0Iww9o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ddBI9LXJ7+Y8kcnVi5fodTFTDY2QkOcmMnS9X6ocwhHlPZg3Yn/so584og3lioMfxsL+DV/SBnAJVd4ouFyUC0AjercK5C9GHDkjgqnYKZr20wCf1FK/jVY09Z7cwYxm0iuVp/Y7eLdlCEVpZpoQpvNkBFoKiyLYf4ncrY516bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=owqwGbTX; arc=none smtp.client-ip=178.60.130.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="owqwGbTX"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=UXMT7zychknVX/fBuaR+3y/Nwd0RgY+VKmctaM3JJSY=; b=owqwGbTXTCOYgfzw5ra0iyBANO
	JkXBx+V684qC6Qq02l8/oqZqbJD1qWO4Xbi/Br1en4drENhArQjgomtYOSyq1XFaRBB1sOYm3MILy
	bVupSo/FMuIJKcttgrvG2bxxEkmZi80vTtz6BMwEQYdRP9mArB73G4rLfGPKshH6LHkKCOkInUATY
	n2GV6U2JglTGR3UFtASzE1HAZGJhIfpbgULC4BWbY94ZM5E8Pp0EhMc9Q/YhGc9dFlIuW9y43vbhf
	rI0PQ2RO0DMe8YTs/p+slUSQv2kXFwY/Wi66tqxpqZ4Onrmpn7KQYRCegTgVd+4kIksFfnJBr2Qe7
	C7J3IlUQ==;
Received: from [58.29.143.236] (helo=localhost)
	by fanzine2.igalia.com with utf8esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1thUtx-007Hko-Rq; Mon, 10 Feb 2025 15:36:52 +0100
From: Changwoo Min <changwoo@igalia.com>
To: tj@kernel.org,
	void@manifault.com,
	arighi@nvidia.com
Cc: kernel-dev@igalia.com,
	linux-kernel@vger.kernel.org,
	Changwoo Min <changwoo@igalia.com>
Subject: [PATCH] sched_ext: Provides a sysfs 'events' to expose core event counters
Date: Mon, 10 Feb 2025 23:36:43 +0900
Message-ID: <20250210143643.220994-1-changwoo@igalia.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a sysfs entry at /sys/kernel/sched_ext/events to expose core event
counters through the files system interface. Each line of the file shows
the event name and its counter value. In addition, the format of
scx_dump_event() is adjusted as the event name gets longer.

Signed-off-by: Changwoo Min <changwoo@igalia.com>
---
 kernel/sched/ext.c | 27 ++++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/kernel/sched/ext.c b/kernel/sched/ext.c
index b2378e29f45a..987b88b2f0ed 100644
--- a/kernel/sched/ext.c
+++ b/kernel/sched/ext.c
@@ -1558,7 +1558,7 @@ static DEFINE_PER_CPU(struct scx_event_stats, event_stats_cpu);
  * @kind: a kind of event to dump
  */
 #define scx_dump_event(s, events, kind) do {					\
-	dump_line(&(s), "%30s: %16llu", #kind, (events)->kind);			\
+	dump_line(&(s), "%40s: %16llu", #kind, (events)->kind);			\
 } while (0)
 
 
@@ -4327,12 +4327,37 @@ static ssize_t scx_attr_enable_seq_show(struct kobject *kobj,
 }
 SCX_ATTR(enable_seq);
 
+#define scx_attr_event_show(buf, at, events, kind) ({				\
+	sysfs_emit_at(buf, at, "%40s: %16llu\n", #kind, (events)->kind);	\
+})
+
+static ssize_t scx_attr_events_show(struct kobject *kobj,
+				    struct kobj_attribute *ka, char *buf)
+{
+	struct scx_event_stats events;
+	int at = 0;
+
+	scx_bpf_events(&events, sizeof(events));
+	at += scx_attr_event_show(buf, at, &events, SCX_EV_SELECT_CPU_FALLBACK);
+	at += scx_attr_event_show(buf, at, &events, SCX_EV_DISPATCH_LOCAL_DSQ_OFFLINE);
+	at += scx_attr_event_show(buf, at, &events, SCX_EV_DISPATCH_KEEP_LAST);
+	at += scx_attr_event_show(buf, at, &events, SCX_EV_ENQ_SKIP_EXITING);
+	at += scx_attr_event_show(buf, at, &events, SCX_EV_ENQ_SKIP_MIGRATION_DISABLED);
+	at += scx_attr_event_show(buf, at, &events, SCX_EV_ENQ_SLICE_DFL);
+	at += scx_attr_event_show(buf, at, &events, SCX_EV_BYPASS_DURATION);
+	at += scx_attr_event_show(buf, at, &events, SCX_EV_BYPASS_DISPATCH);
+	at += scx_attr_event_show(buf, at, &events, SCX_EV_BYPASS_ACTIVATE);
+	return at;
+}
+SCX_ATTR(events);
+
 static struct attribute *scx_global_attrs[] = {
 	&scx_attr_state.attr,
 	&scx_attr_switch_all.attr,
 	&scx_attr_nr_rejected.attr,
 	&scx_attr_hotplug_seq.attr,
 	&scx_attr_enable_seq.attr,
+	&scx_attr_events.attr,
 	NULL,
 };
 
-- 
2.48.1

