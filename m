Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3D16F9FE
	for <linux-kernel@vger.kernel.org>; Sun,  9 Feb 2025 15:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739113711; cv=none; b=tm0Fv1vpo2Hs8vbOt4qMoLtnvUC69jZju94prBBYIB44wvS/EK6F05Z2mN13i1dWKhosx4j09kJZ670mp+5ysLhCzzrPo7K5FfQnYn0Nh1vdlyVMknlnNZhPl4pfqt6DPv951j2CDK9Ir5QR0iHzrSlaB6cCiaZZF3+WkSNrFQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739113711; c=relaxed/simple;
	bh=M1AQ2hEM2O1Zv6CQ05LKHpVqombgKaio3Q2iO2ZuBxs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YnKWLIS5xWQJcTsqA1eaumajoMZq4+WDzrB1p8Gy1jEHIg2/IKsZHk6qew0gAbGKmtaPPPoZKRs6/yfy2+BGomcTmYcdWOlP/6WjaS8U5yPIzAdQ5aAq6BCh7++qneB4z2x1FTavFGP/OyKthQD4LfRVF55X8R79jVjKdvtcun8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dNRrfA0n; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dNRrfA0n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739113708;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tb/tj8BCDUnG6L/Z2jvQ7trDD1By4diGpHFGxOH14oY=;
	b=dNRrfA0nnBHAtAfuSKtGf5QEIbM9hPrVJ64baipLYqaPO9DIfP0fClpOGei24YrCNu5kX8
	9q314EjC66RLd/z37q/DMUj65GJxlIpbIBczRGQB5OeDIXEoipfF0mhWgqAgrz18442BJK
	6Om9VDR2pXQwb0aXkExHzPE3CvW6Vc0=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-215-bXUnPjQ-PkmhEVVTGpf3YA-1; Sun,
 09 Feb 2025 10:08:24 -0500
X-MC-Unique: bXUnPjQ-PkmhEVVTGpf3YA-1
X-Mimecast-MFC-AGG-ID: bXUnPjQ-PkmhEVVTGpf3YA
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 22C581800360;
	Sun,  9 Feb 2025 15:08:22 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.45.224.8])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 1710019560A3;
	Sun,  9 Feb 2025 15:08:16 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Sun,  9 Feb 2025 16:07:55 +0100 (CET)
Date: Sun, 9 Feb 2025 16:07:49 +0100
From: Oleg Nesterov <oleg@redhat.com>
To: Christian Brauner <brauner@kernel.org>,
	Jeff Layton <jlayton@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>
Cc: David Howells <dhowells@redhat.com>,
	"Gautham R. Shenoy" <gautham.shenoy@amd.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Mateusz Guzik <mjguzik@gmail.com>,
	Neeraj Upadhyay <Neeraj.Upadhyay@amd.com>,
	Oliver Sang <oliver.sang@intel.com>,
	Swapnil Sapkal <swapnil.sapkal@amd.com>,
	WangYuli <wangyuli@uniontech.com>, linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] pipe: change pipe_write() to never add a zero-sized
 buffer
Message-ID: <20250209150749.GA16999@redhat.com>
References: <20250209150718.GA17013@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250209150718.GA17013@redhat.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

a194dfe6e6f6 ("pipe: Rearrange sequence in pipe_write() to preallocate slot")
changed pipe_write() to increment pipe->head in advance.  IIUC to avoid the
race with the post_one_notification()-like code which can add another buffer
under pipe->rd_wait.lock without pipe->mutex.

This is no longer necessary after c73be61cede5 ("pipe: Add general notification
queue support"), pipe_write() checks pipe_has_watch_queue() and returns -EXDEV
at the start. And can't help in any case, pipe_write() no longer takes this
rd_wait.lock spinlock.

Change pipe_write() to call copy_page_from_iter() first and do nothing if it
fails. This way pipe_write() can't add a zero-sized buffer and we can simplify
pipe_read() which currently has to take care of this very unlikely case.

Signed-off-by: Oleg Nesterov <oleg@redhat.com>
---
 fs/pipe.c                 | 47 +++++++++------------------------------
 include/linux/pipe_fs_i.h |  6 +++++
 2 files changed, 16 insertions(+), 37 deletions(-)

diff --git a/fs/pipe.c b/fs/pipe.c
index 2ae75adfba64..7f24d707f6a1 100644
--- a/fs/pipe.c
+++ b/fs/pipe.c
@@ -303,7 +303,7 @@ anon_pipe_read(struct kiocb *iocb, struct iov_iter *to)
 
 		if (!pipe_empty(head, tail)) {
 			struct pipe_buffer *buf = &pipe->bufs[tail & mask];
-			size_t chars = buf->len;
+			size_t chars = pipe_buf_assert_len(buf);
 			size_t written;
 			int error;
 
@@ -360,29 +360,9 @@ anon_pipe_read(struct kiocb *iocb, struct iov_iter *to)
 			break;
 		}
 		mutex_unlock(&pipe->mutex);
-
 		/*
 		 * We only get here if we didn't actually read anything.
 		 *
-		 * However, we could have seen (and removed) a zero-sized
-		 * pipe buffer, and might have made space in the buffers
-		 * that way.
-		 *
-		 * You can't make zero-sized pipe buffers by doing an empty
-		 * write (not even in packet mode), but they can happen if
-		 * the writer gets an EFAULT when trying to fill a buffer
-		 * that already got allocated and inserted in the buffer
-		 * array.
-		 *
-		 * So we still need to wake up any pending writers in the
-		 * _very_ unlikely case that the pipe was full, but we got
-		 * no data.
-		 */
-		if (unlikely(wake_writer))
-			wake_up_interruptible_sync_poll(&pipe->wr_wait, EPOLLOUT | EPOLLWRNORM);
-		kill_fasync(&pipe->fasync_writers, SIGIO, POLL_OUT);
-
-		/*
 		 * But because we didn't read anything, at this point we can
 		 * just return directly with -ERESTARTSYS if we're interrupted,
 		 * since we've done any required wakeups and there's no need
@@ -391,7 +371,6 @@ anon_pipe_read(struct kiocb *iocb, struct iov_iter *to)
 		if (wait_event_interruptible_exclusive(pipe->rd_wait, pipe_readable(pipe)) < 0)
 			return -ERESTARTSYS;
 
-		wake_writer = false;
 		wake_next_reader = true;
 		mutex_lock(&pipe->mutex);
 	}
@@ -526,33 +505,27 @@ anon_pipe_write(struct kiocb *iocb, struct iov_iter *from)
 				pipe->tmp_page = page;
 			}
 
-			/* Allocate a slot in the ring in advance and attach an
-			 * empty buffer.  If we fault or otherwise fail to use
-			 * it, either the reader will consume it or it'll still
-			 * be there for the next write.
-			 */
-			pipe->head = head + 1;
+			copied = copy_page_from_iter(page, 0, PAGE_SIZE, from);
+			if (unlikely(copied < PAGE_SIZE && iov_iter_count(from))) {
+				if (!ret)
+					ret = -EFAULT;
+				break;
+			}
 
+			pipe->head = head + 1;
+			pipe->tmp_page = NULL;
 			/* Insert it into the buffer array */
 			buf = &pipe->bufs[head & mask];
 			buf->page = page;
 			buf->ops = &anon_pipe_buf_ops;
 			buf->offset = 0;
-			buf->len = 0;
 			if (is_packetized(filp))
 				buf->flags = PIPE_BUF_FLAG_PACKET;
 			else
 				buf->flags = PIPE_BUF_FLAG_CAN_MERGE;
-			pipe->tmp_page = NULL;
 
-			copied = copy_page_from_iter(page, 0, PAGE_SIZE, from);
-			if (unlikely(copied < PAGE_SIZE && iov_iter_count(from))) {
-				if (!ret)
-					ret = -EFAULT;
-				break;
-			}
-			ret += copied;
 			buf->len = copied;
+			ret += copied;
 
 			if (!iov_iter_count(from))
 				break;
diff --git a/include/linux/pipe_fs_i.h b/include/linux/pipe_fs_i.h
index 8ff23bf5a819..4174429a3e0e 100644
--- a/include/linux/pipe_fs_i.h
+++ b/include/linux/pipe_fs_i.h
@@ -31,6 +31,12 @@ struct pipe_buffer {
 	unsigned long private;
 };
 
+static inline unsigned int pipe_buf_assert_len(struct pipe_buffer *buf)
+{
+	WARN_ON_ONCE(!buf->len);
+	return buf->len;
+}
+
 /**
  *	struct pipe_inode_info - a linux kernel pipe
  *	@mutex: mutex protecting the whole thing
-- 
2.25.1.362.g51ebf55


