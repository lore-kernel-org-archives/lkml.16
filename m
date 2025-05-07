Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA753288C86
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 13:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746625380; cv=none; b=OmtbqiMrG3I9LX7h74UKjjkumhs+C81+nKBQK5X79K5Co6ZZJBGiKU2TYKYKb/u0GRSwWcyVu+K2UvCuhfJARasNUPtIJ0qFE2P0b+zsA3dxjDAvvrImBisbuuuOFViEzdXd18bHlSqtAbhoWW9tZdcnF9Urx3VgyXWbSAUOeRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746625380; c=relaxed/simple;
	bh=gfPEo3NWV+W3SYgvOno1DoPJozINMpxeXLT70lEApEQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=DlKZ1iW6LhJFvS5WxPUMArEKYj8BnWjqZlTTKmq+9D3zHQHxi0IlI2wpZZZh6MllHRFC7md5FA5Dami37i3S2SX2lNwljvKqX75pi0werb9WWyjVnruQmImNBMwVfBL9FVKwZevhPFqvJaeV2H9DTFjZqpOEE574rpiehmOtvxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UCuTsq7u; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UCuTsq7u"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2295d78b45cso89352695ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 06:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746625378; x=1747230178; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yEzvyaIeUWfNh53adg2EagZhMh381tDgk6SX1hFdB3s=;
        b=UCuTsq7uyzUXnNg45kvwVzwBi0ZuGWMKWXELsrAWwTZIg9GLbgnOkkf4DZ4qkd21us
         5+igOHx35kNlAFa0wXG+kG0YDvVP6tyaryohMNNRbHdzGh+ec96BUIKuBYokgfHR+ujc
         PIkvKKJrwB2ncTLEKor1O6XFfihm+HWoBchIu+FIN9/Nx2qhNWxVr5NDZg1YW1kgJoUH
         QwKab62fiMz5svIZnhoml9upDxrXKLcbyBwRjq6UsasioGHL8D7jhXliNcB1G1Szoq3J
         50BuTfHDyKeTsDg9c00PfmXMqut1/nhdmsB4P6L67lvaNZZZnrGv62LE+2cdwLJEMIc2
         /WDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746625378; x=1747230178;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yEzvyaIeUWfNh53adg2EagZhMh381tDgk6SX1hFdB3s=;
        b=mcHKHFlDK5Qd7k9D3gxFntRCgqoVz3852kEUfagBUmwyqUvmuAiGBfwVXrWs2OYXVz
         EqvZDyVZEtS4j4nS13LXAgQ4CKdMXnh7QIUm+jpEkV25dWB8n5V8aYue0YMW27oKDM9T
         9qJKewRDnoAJLNGTaWZCsoKBkmtyT88LQfS807Inx7IL/ea+2AMxvbDdzlN+GgZ6tluV
         C+vcwZ4T20ItXWTCWHW6Wxe2vjLRrVgnIg03q4TOC0H4eDdP5TBkJHdY9H87BvX/Mk4u
         TjRUjJyhvntFVRl3uNA8JW8qkiyDrYYlNlnA+SlnLZGy9S5VmuXMcDh47WJ9EYcQ6qx1
         wP3A==
X-Gm-Message-State: AOJu0Yy9gf7+9GllAl4wzkDv6ezNUXIlAWnQ9JGGgQXGMzM1tK99xfB0
	cYlwE1FHrFzocJUFR/zVZ+H5qNf2P097cJnl7Adn7XVjriF4iaP1
X-Gm-Gg: ASbGncs5CM7/k4cXSHPuBvDFH1WFKTFWkXHasURzKQAy+lWUbRcp5RMoOH3BA9F8ISn
	1f7vkOxZopGBGlrd7ea8aM4t7+hQpxFXv+Spr8xRT07DwVeLsh/lwjDszHaeoqodt+6sAmiJTOi
	5eo/VlAvG0VTcGFw8/4j5foA/1pH17PomqqFQ5B5yDzsQ2zjwQQOH9u0/PixVq1MKJ3kPP7e4co
	gB+h8eXo6Dzdg3j6ygDSwWlzef/RxtBegHidsVmlR2rjT8LQ80Jz8Gb/zF174OyDJbTZASyPoDi
	Vi//M8n9LaRgnoEQrU/5cmgcFq/WrMkDszYiUtaoCa95OGoc2EJIT2W9I+PxA4jAaWWYy2l55O+
	yrA4=
X-Google-Smtp-Source: AGHT+IEtopYEefji9CmKqJVqq5f/UbbRIeFFfRk5+aAht1G3nCJXbk0iUS2A6pAUVDK6e5pGv1om8g==
X-Received: by 2002:a17:903:1095:b0:22e:6791:1b9a with SMTP id d9443c01a7336-22e67912081mr23644605ad.0.1746625377856;
        Wed, 07 May 2025 06:42:57 -0700 (PDT)
Received: from KERNELXING-MC1.tencent.com ([114.253.36.190])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e5d633ccesm19404405ad.228.2025.05.07.06.42.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 06:42:57 -0700 (PDT)
From: Jason Xing <kerneljasonxing@gmail.com>
To: johannes@sipsolutions.net,
	joonas.lahtinen@linux.intel.com,
	rodrigo.vivi@intel.com,
	tursulin@ursulin.net,
	airlied@gmail.com,
	simona@ffwll.ch,
	m.chetan.kumar@intel.com,
	loic.poulain@oss.qualcomm.com,
	ryazanov.s.a@gmail.com,
	axboe@kernel.dk,
	rostedt@goodmis.org,
	mhiramat@kernel.org,
	mathieu.desnoyers@efficios.com,
	viro@zeniv.linux.org.uk,
	akpm@linux-foundation.org,
	zanussi@kernel.org
Cc: linux-kernel@vger.kernel.org,
	Jason Xing <kernelxing@tencent.com>,
	Yushan Zhou <katrinzhou@tencent.com>
Subject: [PATCH] relayfs: abolish prev_padding
Date: Wed,  7 May 2025 21:42:25 +0800
Message-Id: <20250507134225.63248-1-kerneljasonxing@gmail.com>
X-Mailer: git-send-email 2.33.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jason Xing <kernelxing@tencent.com>

prev_padding represents the unused space of certain subbuffer. If the
content of a call of relay_write() exceeds the limit of the remainder of
this subbuffer, it will skip storing in the rest space and record the
start point as buf->prev_padding in relay_switch_subbuf(). Since the buf
is a per-cpu big buffer, the point of prev_padding as a global value for
the whole buffer instead of a single subbuffer (whose padding info is
stored in buf->padding[]) seems meaningless from the real use cases, so
we don't bother to record it any more.

Reviewed-by: Yushan Zhou <katrinzhou@tencent.com>
Signed-off-by: Jason Xing <kernelxing@tencent.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_log.c |  3 +--
 drivers/net/wwan/iosm/iosm_ipc_trace.c     |  3 +--
 drivers/net/wwan/t7xx/t7xx_port_trace.c    |  2 +-
 include/linux/relay.h                      |  5 +----
 kernel/relay.c                             | 14 ++++++++------
 kernel/trace/blktrace.c                    |  2 +-
 6 files changed, 13 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
index e8a04e476c57..09a64f224c49 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
@@ -220,8 +220,7 @@ static int guc_action_control_log(struct intel_guc *guc, bool enable,
  */
 static int subbuf_start_callback(struct rchan_buf *buf,
 				 void *subbuf,
-				 void *prev_subbuf,
-				 size_t prev_padding)
+				 void *prev_subbuf)
 {
 	/*
 	 * Use no-overwrite mode by default, where relay will stop accepting
diff --git a/drivers/net/wwan/iosm/iosm_ipc_trace.c b/drivers/net/wwan/iosm/iosm_ipc_trace.c
index eeecfa3d10c5..9656254c1c6c 100644
--- a/drivers/net/wwan/iosm/iosm_ipc_trace.c
+++ b/drivers/net/wwan/iosm/iosm_ipc_trace.c
@@ -51,8 +51,7 @@ static int ipc_trace_remove_buf_file_handler(struct dentry *dentry)
 }
 
 static int ipc_trace_subbuf_start_handler(struct rchan_buf *buf, void *subbuf,
-					  void *prev_subbuf,
-					  size_t prev_padding)
+					  void *prev_subbuf)
 {
 	if (relay_buf_full(buf)) {
 		pr_err_ratelimited("Relay_buf full dropping traces");
diff --git a/drivers/net/wwan/t7xx/t7xx_port_trace.c b/drivers/net/wwan/t7xx/t7xx_port_trace.c
index 4ed8b4e29bf1..f16d3b01302c 100644
--- a/drivers/net/wwan/t7xx/t7xx_port_trace.c
+++ b/drivers/net/wwan/t7xx/t7xx_port_trace.c
@@ -33,7 +33,7 @@ static int t7xx_trace_remove_buf_file_handler(struct dentry *dentry)
 }
 
 static int t7xx_trace_subbuf_start_handler(struct rchan_buf *buf, void *subbuf,
-					   void *prev_subbuf, size_t prev_padding)
+					   void *prev_subbuf)
 {
 	if (relay_buf_full(buf)) {
 		pr_err_ratelimited("Relay_buf full dropping traces");
diff --git a/include/linux/relay.h b/include/linux/relay.h
index 72b876dd5cb8..f80b0eb1e905 100644
--- a/include/linux/relay.h
+++ b/include/linux/relay.h
@@ -47,7 +47,6 @@ struct rchan_buf
 	unsigned int page_count;	/* number of current buffer pages */
 	unsigned int finalized;		/* buffer has been finalized */
 	size_t *padding;		/* padding counts per sub-buffer */
-	size_t prev_padding;		/* temporary variable */
 	size_t bytes_consumed;		/* bytes consumed in cur read subbuf */
 	size_t early_bytes;		/* bytes consumed before VFS inited */
 	unsigned int cpu;		/* this buf's cpu */
@@ -84,7 +83,6 @@ struct rchan_callbacks
 	 * @buf: the channel buffer containing the new sub-buffer
 	 * @subbuf: the start of the new sub-buffer
 	 * @prev_subbuf: the start of the previous sub-buffer
-	 * @prev_padding: unused space at the end of previous sub-buffer
 	 *
 	 * The client should return 1 to continue logging, 0 to stop
 	 * logging.
@@ -100,8 +98,7 @@ struct rchan_callbacks
 	 */
 	int (*subbuf_start) (struct rchan_buf *buf,
 			     void *subbuf,
-			     void *prev_subbuf,
-			     size_t prev_padding);
+			     void *prev_subbuf);
 
 	/*
 	 * create_buf_file - create file to represent a relay channel buffer
diff --git a/kernel/relay.c b/kernel/relay.c
index 5ac7e711e4b6..5aeb9226e238 100644
--- a/kernel/relay.c
+++ b/kernel/relay.c
@@ -250,13 +250,13 @@ EXPORT_SYMBOL_GPL(relay_buf_full);
  */
 
 static int relay_subbuf_start(struct rchan_buf *buf, void *subbuf,
-			      void *prev_subbuf, size_t prev_padding)
+			      void *prev_subbuf)
 {
 	if (!buf->chan->cb->subbuf_start)
 		return !relay_buf_full(buf);
 
 	return buf->chan->cb->subbuf_start(buf, subbuf,
-					   prev_subbuf, prev_padding);
+					   prev_subbuf);
 }
 
 /**
@@ -302,7 +302,7 @@ static void __relay_reset(struct rchan_buf *buf, unsigned int init)
 	for (i = 0; i < buf->chan->n_subbufs; i++)
 		buf->padding[i] = 0;
 
-	relay_subbuf_start(buf, buf->data, NULL, 0);
+	relay_subbuf_start(buf, buf->data, NULL);
 }
 
 /**
@@ -664,9 +664,11 @@ size_t relay_switch_subbuf(struct rchan_buf *buf, size_t length)
 		goto toobig;
 
 	if (buf->offset != buf->chan->subbuf_size + 1) {
-		buf->prev_padding = buf->chan->subbuf_size - buf->offset;
+		size_t prev_padding;
+
+		prev_padding = buf->chan->subbuf_size - buf->offset;
 		old_subbuf = buf->subbufs_produced % buf->chan->n_subbufs;
-		buf->padding[old_subbuf] = buf->prev_padding;
+		buf->padding[old_subbuf] = prev_padding;
 		buf->subbufs_produced++;
 		if (buf->dentry)
 			d_inode(buf->dentry)->i_size +=
@@ -691,7 +693,7 @@ size_t relay_switch_subbuf(struct rchan_buf *buf, size_t length)
 	new_subbuf = buf->subbufs_produced % buf->chan->n_subbufs;
 	new = buf->start + new_subbuf * buf->chan->subbuf_size;
 	buf->offset = 0;
-	if (!relay_subbuf_start(buf, new, old, buf->prev_padding)) {
+	if (!relay_subbuf_start(buf, new, old)) {
 		buf->offset = buf->chan->subbuf_size + 1;
 		return 0;
 	}
diff --git a/kernel/trace/blktrace.c b/kernel/trace/blktrace.c
index 3679a6d18934..d1a89714e805 100644
--- a/kernel/trace/blktrace.c
+++ b/kernel/trace/blktrace.c
@@ -461,7 +461,7 @@ static const struct file_operations blk_msg_fops = {
  * the user space app in telling how many lost events there were.
  */
 static int blk_subbuf_start_callback(struct rchan_buf *buf, void *subbuf,
-				     void *prev_subbuf, size_t prev_padding)
+				     void *prev_subbuf)
 {
 	struct blk_trace *bt;
 
-- 
2.43.5

