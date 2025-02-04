Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5A872153E4
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 13:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738677025; cv=none; b=FN8PTsP9usmAp9ADl8A/Y/T+gEdukEPC8Muu74Iz7HkEGsSgSWYUSWZytr3mr0wM2RGIZaGbD4B8EGOtT7z7PoIAMOwmAQfDoVlwjKrtZMeAlOPf4dN4Kh6COAgY2IT/9dctaJ6B5dyHttEhDSufpi2nv8cLEnCdreR5b56jgR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738677025; c=relaxed/simple;
	bh=KQrHl1sVsBaikf66vAoZZaT32Pyd8VH88q2Rv7WQbtU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VZrem/y1YBhHUDML0SNsklrWitXq0uJhpuYa+iUc9cXYGc0sS3aS8sjdlMAU+AgO32mklBqp+UgKyII+NqTV3vpfcBjPDSH6scBsx5gefHmFRCHxG+oG/8mVtvzsgSC0hAplcF7JC4du4DBn4JUhWCFEGk/Qq8rlV/LMJO56LUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Tv7uULo8; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Tv7uULo8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738677022;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XKMgvQGVrzexnrv8PP0ZzFB+P2Djy/yCdTw3DnANvA0=;
	b=Tv7uULo8aYn1qjE0a4KTw3h3SaKz3nkvCo8vt3kVl9nj3p2GWSiNqV1Gvy0dliYaFH+SEA
	yy+vGd9mhRZZfbqd4JL3Z0NufliK0o0YefucK5+cywec071h87Chp/rlE6p+judnZIG3/F
	v1H/wPIx0Qt12AI5DHkfRbnPJk02I48=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-369-oNYkt3OUNgycnNaUHE3eYg-1; Tue,
 04 Feb 2025 08:50:20 -0500
X-MC-Unique: oNYkt3OUNgycnNaUHE3eYg-1
X-Mimecast-MFC-AGG-ID: oNYkt3OUNgycnNaUHE3eYg
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9949C1800373;
	Tue,  4 Feb 2025 13:50:18 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.44.32.214])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 4C05518008C8;
	Tue,  4 Feb 2025 13:50:14 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Tue,  4 Feb 2025 14:49:52 +0100 (CET)
Date: Tue, 4 Feb 2025 14:49:46 +0100
From: Oleg Nesterov <oleg@redhat.com>
To: K Prateek Nayak <kprateek.nayak@amd.com>,
	Linus Torvalds <torvalds@linux-foundation.org>
Cc: Manfred Spraul <manfred@colorfullife.com>,
	Christian Brauner <brauner@kernel.org>,
	David Howells <dhowells@redhat.com>,
	WangYuli <wangyuli@uniontech.com>, linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Gautham R. Shenoy" <gautham.shenoy@amd.com>,
	Swapnil Sapkal <swapnil.sapkal@amd.com>,
	Neeraj Upadhyay <Neeraj.Upadhyay@amd.com>
Subject: Re: [PATCH] pipe_read: don't wake up the writer if the pipe is still
 full
Message-ID: <20250204134821.GB6031@redhat.com>
References: <20250102140715.GA7091@redhat.com>
 <3170d16e-eb67-4db8-a327-eb8188397fdb@amd.com>
 <CAHk-=wioaHG2P0KH=1zP0Zy=CcQb_JxZrksSS2+-FwcptHtntw@mail.gmail.com>
 <20250202170131.GA6507@redhat.com>
 <7ace642f-e269-49ad-9d32-53c7ffa00681@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7ace642f-e269-49ad-9d32-53c7ffa00681@amd.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

On 02/03, K Prateek Nayak wrote:
>
> With the below patch on mainline, I see more improvements for a
> modified version of sched-messaging (sched-messaging is same as
> hackbench as you noted on the parallel thread) that uses
> pipe2(O_NOATIME)

Thanks,

> The original regression is still noticeable despite the improvements
> but if folks believe this is a corner case with the original changes
> exhibited by sched-messaging, I'll just continue further testing with
> the new baseline.

I still don't know if we should worry or not... But if we want to try
to improve the wake_writer logic, then I think it makes sense to cleanup
this code first.

IMO the (untested) patch below makes sense regardless, I am going to send
it after I grep fs/splice.c a bit more.

a194dfe6e6f6f ("pipe: Rearrange sequence in pipe_write() to preallocate slot")
changed pipe_write() to increment pipe->head in advance.  IIUC to avoid the
race with the post_one_notification()-like code which can add another buffer
under pipe->rd_wait.lock without pipe->mutex.

This is no longer necessary after c73be61cede ("pipe: Add general notification
queue support"), pipe_write() checks pipe_has_watch_queue() and returns -EXDEV
at the start. And can't help in any case, pipe_write() no longer takes this
spinlock.

Change pipe_write() to call copy_page_from_iter() first and do nothing if it
fails. This way pipe_write() can't add a zero-sized bufer and we can simplify
pipe_read() which currently has to handle this very unlikely case.

Oleg.

diff --git a/fs/pipe.c b/fs/pipe.c
index baaa8c0817f1..0816070a5e7a 100644
--- a/fs/pipe.c
+++ b/fs/pipe.c
@@ -312,6 +312,7 @@ pipe_read(struct kiocb *iocb, struct iov_iter *to)
 			size_t written;
 			int error;
 
+			WARN_ON_ONCE(chars == 0);
 			if (chars > total_len) {
 				if (buf->flags & PIPE_BUF_FLAG_WHOLE) {
 					if (ret == 0)
@@ -365,29 +366,9 @@ pipe_read(struct kiocb *iocb, struct iov_iter *to)
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
@@ -396,7 +377,6 @@ pipe_read(struct kiocb *iocb, struct iov_iter *to)
 		if (wait_event_interruptible_exclusive(pipe->rd_wait, pipe_readable(pipe)) < 0)
 			return -ERESTARTSYS;
 
-		wake_writer = false;
 		wake_next_reader = true;
 		mutex_lock(&pipe->mutex);
 	}
@@ -524,31 +504,25 @@ pipe_write(struct kiocb *iocb, struct iov_iter *from)
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
 			ret += copied;
 			buf->len = copied;
 

