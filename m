Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B83711AF0C3
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 07:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.60.130.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738307430; cv=none; b=cWg9ktdIBIKyIyuE12P3LroeAM95zXqYuRh850PTtk+UXE9LkPMiKINKLYdlNOuq9F7rDVxNjumhD137nymdDsBrGI33Qh4xhau1kiViuEPDNyqQo+K1TtSDCPUSyiYR65TRqdsOxbI3nlqt3VDCndf7zy7MFmAUum0UWJ7kDl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738307430; c=relaxed/simple;
	bh=/ZvKVk8rZeGtmp6VLLD4DU6idDxy5o/EYItE8QUyDF8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DH5NWw4LoUhPY42FVm9oDe10wl2zUsDWa2p3AJHOw456hfZiCSrNRdJLm7sKQpD/Y5bTi823T8MQdab3MRZ33YglKNTpYdl8XAshCF4+wX1+c3MDR+CRKsOfPsAGvpFDZwIc6BLy3Eo/M71rVw9EI5m6naYR99pnzrTY3hcDOEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=jM9xGB+F; arc=none smtp.client-ip=178.60.130.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="jM9xGB+F"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=hLEJlMt6aWjNLe6pMLu/dCCqgGrbqAA/7mCNiug+4io=; b=jM9xGB+FmyBhZ+Yg7cTQ3DgPFS
	HkXaVIB0koZjKKhcTFsYlgsyXikCe1RX7FcF3WLDnttbwF3ai3sibI/2p45NCSr1Y6l+36rWjXNgY
	jZRQwk/qkCBXJxykR6RwFmFge3VQzOvd5olzCG9sSUp07TnmqcxQMq7s9z1opGtby6OfCMm89WWEi
	0jqfIY2iAz6rjnZPE9qmotBKH9rX3+yzED8fiMVH17uYD/NpMK6jhKrhtVN9b7/yZjuHC0Ph9ydyo
	JZFdBelepxP9AnabJnnzjwiXax7TBGG7MNy4iHs0pLHRPM+RXKdjWaUvL3pN+qw5IhIHx3xhHYtDK
	SmJWbXHg==;
Received: from [58.29.143.236] (helo=localhost)
	by fanzine2.igalia.com with utf8esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1tdlAO-001KaL-Pr; Fri, 31 Jan 2025 08:10:23 +0100
From: Changwoo Min <changwoo@igalia.com>
To: tj@kernel.org,
	void@manifault.com,
	arighi@nvidia.com
Cc: kernel-dev@igalia.com,
	linux-kernel@vger.kernel.org,
	Changwoo Min <changwoo@igalia.com>
Subject: [PATCH v3 08/11] sched_ext: Add an event, SCX_EV_BYPASS_DURATION
Date: Fri, 31 Jan 2025 16:09:35 +0900
Message-ID: <20250131070938.95551-9-changwoo@igalia.com>
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

Add a core event, SCX_EV_BYPASS_DURATION, which represents the
total duration of bypass modes in nanoseconds.

Signed-off-by: Changwoo Min <changwoo@igalia.com>
---
 kernel/sched/ext.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/kernel/sched/ext.c b/kernel/sched/ext.c
index 236cdb0071eb..b4871409bd1c 100644
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
@@ -1529,6 +1534,12 @@ static DEFINE_PER_CPU(struct scx_event_stats, event_stats_cpu);
 } while (0)
 
 
+/*
+ * The last time the bypass mode started.
+ * This is used to measure SCX_EV_BYPASS_DURATION.
+ */
+static unsigned long scx_bypass_timestamp;
+
 static void scx_bpf_events(struct scx_event_stats *events, size_t events__sz);
 
 static enum scx_ops_enable_state scx_ops_enable_state(void)
@@ -4422,12 +4433,15 @@ static void scx_ops_bypass(bool bypass)
 		WARN_ON_ONCE(scx_ops_bypass_depth <= 0);
 		if (scx_ops_bypass_depth != 1)
 			goto unlock;
+		scx_bypass_timestamp = ktime_get_ns();
 		scx_add_event(SCX_EV_BYPASS_ACTIVATE, 1);
 	} else {
 		scx_ops_bypass_depth--;
 		WARN_ON_ONCE(scx_ops_bypass_depth < 0);
 		if (scx_ops_bypass_depth != 0)
 			goto unlock;
+		scx_add_event(SCX_EV_BYPASS_DURATION,
+			      ktime_get_ns() - scx_bypass_timestamp);
 	}
 
 	atomic_inc(&scx_ops_breather_depth);
@@ -5018,6 +5032,7 @@ static void scx_dump_state(struct scx_exit_info *ei, size_t dump_len)
 	scx_dump_event(s, &events, SCX_EV_DISPATCH_LOCAL_DSQ_OFFLINE);
 	scx_dump_event(s, &events, SCX_EV_DISPATCH_KEEP_LAST);
 	scx_dump_event(s, &events, SCX_EV_ENQ_SKIP_EXITING);
+	scx_dump_event(s, &events, SCX_EV_BYPASS_DURATION);
 	scx_dump_event(s, &events, SCX_EV_BYPASS_DISPATCH);
 	scx_dump_event(s, &events, SCX_EV_BYPASS_ACTIVATE);
 
@@ -7156,6 +7171,7 @@ __bpf_kfunc void scx_bpf_events(struct scx_event_stats *events,
 		scx_agg_event(&e_sys, e_cpu, SCX_EV_SELECT_CPU_FALLBACK);
 		scx_agg_event(&e_sys, e_cpu, SCX_EV_DISPATCH_LOCAL_DSQ_OFFLINE);
 		scx_agg_event(&e_sys, e_cpu, SCX_EV_DISPATCH_KEEP_LAST);
+		scx_agg_event(&e_sys, e_cpu, SCX_EV_BYPASS_DURATION);
 		scx_agg_event(&e_sys, e_cpu, SCX_EV_BYPASS_DISPATCH);
 		scx_agg_event(&e_sys, e_cpu, SCX_EV_BYPASS_ACTIVATE);
 	}
-- 
2.48.1

