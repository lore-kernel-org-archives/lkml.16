Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1F5D1E008B;
	Fri, 18 Apr 2025 23:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745020186; cv=none; b=VjxCLMF3OgI89bBUvhDYSOJpTJd8YfPEoQ4efl6wbib1HpMeb8qSR9bLMjPfCpY0bFZTnTCoRRdXL+hX4Nt0B9LTsDh/6Tdh3SMItyQlMmMcQTQcwMOwM1kLUWyMrJ/JIN5Qqz1xlhNQTOEwMSsmd5mF2jpXzy72qL4op6kpjnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745020186; c=relaxed/simple;
	bh=l7Vw8IY5SK8AwWCL5EJodsR4To20LDEuOF2/seyqNoI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oSgwIe1ujJT/q4gU+elAPbSSrIU3Y1qmxrAsHHwody7D2ry3gyX+3SyzlaVi4bbqPrCNoaxeYoLroAinDZgRHjJLlKjhnbWmmVoBZ8gE8K9e7UUVSQnaUPhL3PsskwuFdw9o9bOxR/ULMga8idS9iMyQkd8N3TjpDtyqsX/gftE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=GmVXjj20; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="GmVXjj20"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=6i3MoJrERpDqKEXT9PREMFRJ3KjvcwCBdAl6gwCPpUc=; b=GmVXjj20F/uXgU1L
	heyzBdkPUTvDx2KjpBGjmBL0b2eI9zUfnCk/UNz/eW/IkV7wmmZAmqM5gKPPH+vX42rh+RUGPgB0a
	zBIJtOJ+8Y0bsNaBrnInd1mBWXLYi/FxLLAU+wFvgEtsX6EiS0pgWa2uZOYG0ThU+VqNxsUHwWlcR
	HEcFeq60gPhmYtUl9cCm+xFaOCrLZ2CurPru3NQSkmiBet4s1Q84HdB65TdSgqPwZVkL4UHfQx7k1
	8APjVzTVu+TXZKXut6luykZVUoXj0dt4t5ez2iB8p1VS7w+veaesZ6tQkkAwnXGht0P5cv48zrb4O
	7myu99p7TjgL73fH+Q==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1u5vSf-00CbXO-20;
	Fri, 18 Apr 2025 23:49:33 +0000
From: linux@treblig.org
To: akpm@linux-foundation.org,
	andriy.shevchenko@linux.intel.com,
	viro@zeniv.linux.org.uk,
	corbet@lwn.net
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH] relay: Remove unused relay_late_setup_files
Date: Sat, 19 Apr 2025 00:49:32 +0100
Message-ID: <20250418234932.490863-1-linux@treblig.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Dr. David Alan Gilbert" <linux@treblig.org>

The last use of relay_late_setup_files() was removed in 2018
by commit 2b47733045aa ("drm/i915/guc: Merge log relay file and channel
creation")

Remove it and the helper it used.

relay_late_setup_files() was used for eventually registering
'buffer only' channels.  With it gone, delete the docs that
explain how to do that.   Which suggests it should be possible
to lose the 'has_base_filename' flags.

(Are there any other uses??)

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 Documentation/filesystems/relay.rst |  10 ---
 include/linux/relay.h               |   3 -
 kernel/relay.c                      | 111 +---------------------------
 3 files changed, 1 insertion(+), 123 deletions(-)

diff --git a/Documentation/filesystems/relay.rst b/Documentation/filesystems/relay.rst
index 04ad083cfe62..292ba8492aeb 100644
--- a/Documentation/filesystems/relay.rst
+++ b/Documentation/filesystems/relay.rst
@@ -301,16 +301,6 @@ user-defined data with a channel, and is immediately available
 (including in create_buf_file()) via chan->private_data or
 buf->chan->private_data.
 
-Buffer-only channels
---------------------
-
-These channels have no files associated and can be created with
-relay_open(NULL, NULL, ...). Such channels are useful in scenarios such
-as when doing early tracing in the kernel, before the VFS is up. In these
-cases, one may open a buffer-only channel and then call
-relay_late_setup_files() when the kernel is ready to handle files,
-to expose the buffered data to the userspace.
-
 Channel 'modes'
 ---------------
 
diff --git a/include/linux/relay.h b/include/linux/relay.h
index 72b876dd5cb8..b3224111d074 100644
--- a/include/linux/relay.h
+++ b/include/linux/relay.h
@@ -159,9 +159,6 @@ struct rchan *relay_open(const char *base_filename,
 			 size_t n_subbufs,
 			 const struct rchan_callbacks *cb,
 			 void *private_data);
-extern int relay_late_setup_files(struct rchan *chan,
-				  const char *base_filename,
-				  struct dentry *parent);
 extern void relay_close(struct rchan *chan);
 extern void relay_flush(struct rchan *chan);
 extern void relay_subbufs_consumed(struct rchan *chan,
diff --git a/kernel/relay.c b/kernel/relay.c
index 5ac7e711e4b6..c0c93a04d4ce 100644
--- a/kernel/relay.c
+++ b/kernel/relay.c
@@ -452,7 +452,7 @@ int relay_prepare_cpu(unsigned int cpu)
 
 /**
  *	relay_open - create a new relay channel
- *	@base_filename: base name of files to create, %NULL for buffering only
+ *	@base_filename: base name of files to create
  *	@parent: dentry of parent directory, %NULL for root directory or buffer
  *	@subbuf_size: size of sub-buffers
  *	@n_subbufs: number of sub-buffers
@@ -465,10 +465,6 @@ int relay_prepare_cpu(unsigned int cpu)
  *	attributes specified.  The created channel buffer files
  *	will be named base_filename0...base_filenameN-1.  File
  *	permissions will be %S_IRUSR.
- *
- *	If opening a buffer (@parent = NULL) that you later wish to register
- *	in a filesystem, call relay_late_setup_files() once the @parent dentry
- *	is available.
  */
 struct rchan *relay_open(const char *base_filename,
 			 struct dentry *parent,
@@ -540,111 +536,6 @@ struct rchan_percpu_buf_dispatcher {
 	struct dentry *dentry;
 };
 
-/* Called in atomic context. */
-static void __relay_set_buf_dentry(void *info)
-{
-	struct rchan_percpu_buf_dispatcher *p = info;
-
-	relay_set_buf_dentry(p->buf, p->dentry);
-}
-
-/**
- *	relay_late_setup_files - triggers file creation
- *	@chan: channel to operate on
- *	@base_filename: base name of files to create
- *	@parent: dentry of parent directory, %NULL for root directory
- *
- *	Returns 0 if successful, non-zero otherwise.
- *
- *	Use to setup files for a previously buffer-only channel created
- *	by relay_open() with a NULL parent dentry.
- *
- *	For example, this is useful for perfomring early tracing in kernel,
- *	before VFS is up and then exposing the early results once the dentry
- *	is available.
- */
-int relay_late_setup_files(struct rchan *chan,
-			   const char *base_filename,
-			   struct dentry *parent)
-{
-	int err = 0;
-	unsigned int i, curr_cpu;
-	unsigned long flags;
-	struct dentry *dentry;
-	struct rchan_buf *buf;
-	struct rchan_percpu_buf_dispatcher disp;
-
-	if (!chan || !base_filename)
-		return -EINVAL;
-
-	strscpy(chan->base_filename, base_filename, NAME_MAX);
-
-	mutex_lock(&relay_channels_mutex);
-	/* Is chan already set up? */
-	if (unlikely(chan->has_base_filename)) {
-		mutex_unlock(&relay_channels_mutex);
-		return -EEXIST;
-	}
-	chan->has_base_filename = 1;
-	chan->parent = parent;
-
-	if (chan->is_global) {
-		err = -EINVAL;
-		buf = *per_cpu_ptr(chan->buf, 0);
-		if (!WARN_ON_ONCE(!buf)) {
-			dentry = relay_create_buf_file(chan, buf, 0);
-			if (dentry && !WARN_ON_ONCE(!chan->is_global)) {
-				relay_set_buf_dentry(buf, dentry);
-				err = 0;
-			}
-		}
-		mutex_unlock(&relay_channels_mutex);
-		return err;
-	}
-
-	curr_cpu = get_cpu();
-	/*
-	 * The CPU hotplug notifier ran before us and created buffers with
-	 * no files associated. So it's safe to call relay_setup_buf_file()
-	 * on all currently online CPUs.
-	 */
-	for_each_online_cpu(i) {
-		buf = *per_cpu_ptr(chan->buf, i);
-		if (unlikely(!buf)) {
-			WARN_ONCE(1, KERN_ERR "CPU has no buffer!\n");
-			err = -EINVAL;
-			break;
-		}
-
-		dentry = relay_create_buf_file(chan, buf, i);
-		if (unlikely(!dentry)) {
-			err = -EINVAL;
-			break;
-		}
-
-		if (curr_cpu == i) {
-			local_irq_save(flags);
-			relay_set_buf_dentry(buf, dentry);
-			local_irq_restore(flags);
-		} else {
-			disp.buf = buf;
-			disp.dentry = dentry;
-			smp_mb();
-			/* relay_channels_mutex must be held, so wait. */
-			err = smp_call_function_single(i,
-						       __relay_set_buf_dentry,
-						       &disp, 1);
-		}
-		if (unlikely(err))
-			break;
-	}
-	put_cpu();
-	mutex_unlock(&relay_channels_mutex);
-
-	return err;
-}
-EXPORT_SYMBOL_GPL(relay_late_setup_files);
-
 /**
  *	relay_switch_subbuf - switch to a new sub-buffer
  *	@buf: channel buffer
-- 
2.49.0

