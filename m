Received: from smtp116.iad3b.emailsrvr.com (smtp116.iad3b.emailsrvr.com [146.20.161.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10FC51C3C14
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 12:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=146.20.161.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744719424; cv=none; b=dcsOJQ+84cFqXobY5GK4pBb1eol5qVXCd2LTObcPLOMFMjlaxJrRoq8B/uZof9zh9mqGQzSwm8yVrm49z1P+Q1BSferyL04PKVsNQZYf7ZW3FL3pRaKpABoZ2rKeN6stKzO/eXKHhAuDxseRbfmIRWUY7a+q1XTODrlmvEhpyVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744719424; c=relaxed/simple;
	bh=PDFIyW+VOmfUskU1Q17kqtKDh1pfCHaTHLfgFXLzF9Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UsycteGB5yNCHz5WVgcjr/4BMIoAWddKn+hGuEmRQ4LhgGtZJTJY4c45Yd4nchARs/LjMY2Lr7gJcKSkfDLFKTk14uIRAWSZPbPSlkRuce20Cey4fKtkAeZPP9fOHRSNYtoygVyzO5+4uIhGoBNUvH3bzQAahzuGNPLY5QnjzJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mev.co.uk; spf=pass smtp.mailfrom=mev.co.uk; dkim=pass (1024-bit key) header.d=mev.co.uk header.i=@mev.co.uk header.b=mvKdXaeD; arc=none smtp.client-ip=146.20.161.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mev.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mev.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mev.co.uk header.i=@mev.co.uk header.b="mvKdXaeD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mev.co.uk;
	s=20221208-6x11dpa4; t=1744717226;
	bh=PDFIyW+VOmfUskU1Q17kqtKDh1pfCHaTHLfgFXLzF9Y=;
	h=From:To:Subject:Date:From;
	b=mvKdXaeDP7AnyFASPensLDncbfyVTrg8RCqd5RSBu3lSD8RkxaMeS+fLhVnQaBTzY
	 6AbXTcNVYOVKk17SeoJOhw5gufeqatwmcm8NsebMij1BrMeIHcx7gxTU8h+tuUCGh8
	 YORqBnvwmRPn7ztVAihKXSQwp476Rr1B7lppcWXc=
X-Auth-ID: abbotti@mev.co.uk
Received: by smtp15.relay.iad3b.emailsrvr.com (Authenticated sender: abbotti-AT-mev.co.uk) with ESMTPSA id E0A28C0355;
	Tue, 15 Apr 2025 07:40:25 -0400 (EDT)
From: Ian Abbott <abbotti@mev.co.uk>
To: linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ian Abbott <abbotti@mev.co.uk>,
	H Hartley Sweeten <hsweeten@visionengravers.com>,
	Christoph Hellwig <hch@lst.de>
Subject: [PATCH 2/4] comedi: access buffer data page-by-page
Date: Tue, 15 Apr 2025 12:35:57 +0100
Message-ID: <20250415114008.5977-3-abbotti@mev.co.uk>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250415114008.5977-1-abbotti@mev.co.uk>
References: <20250415114008.5977-1-abbotti@mev.co.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Classification-ID: 8a53f2c5-5989-413b-be2c-df2839710a9a-3-1

The aim is to get rid of the `prealloc_buf` member of `struct
comedi_async` and access the buffer contents on a page-by-page basis
using the addresses in the `virt_addr` member of `struct
comedi_buf_page`.  This will allow us to eliminate a `vmap()` that maps
the whole buffer.

Since the buffer pages have non-consecutive `virt_addr` addresses in
virtual memory (except for drivers using DMA), change the loops that
access buffer data to access it page-by-page.

Signed-off-by: Ian Abbott <abbotti@mev.co.uk>
---
 drivers/comedi/comedi_buf.c  | 67 +++++++++++++++++--------------
 drivers/comedi/comedi_fops.c | 77 +++++++++++++++++++++++++++---------
 2 files changed, 96 insertions(+), 48 deletions(-)

diff --git a/drivers/comedi/comedi_buf.c b/drivers/comedi/comedi_buf.c
index 393966c09740..0d956dd40a2b 100644
--- a/drivers/comedi/comedi_buf.c
+++ b/drivers/comedi/comedi_buf.c
@@ -365,6 +365,7 @@ static unsigned int comedi_buf_munge(struct comedi_subdevice *s,
 				     unsigned int num_bytes)
 {
 	struct comedi_async *async = s->async;
+	struct comedi_buf_page *buf_page_list = async->buf_map->page_list;
 	unsigned int count = 0;
 	const unsigned int num_sample_bytes = comedi_bytes_per_sample(s);
 
@@ -376,15 +377,16 @@ static unsigned int comedi_buf_munge(struct comedi_subdevice *s,
 	/* don't munge partial samples */
 	num_bytes -= num_bytes % num_sample_bytes;
 	while (count < num_bytes) {
-		int block_size = num_bytes - count;
-		unsigned int buf_end;
-
-		buf_end = async->prealloc_bufsz - async->munge_ptr;
-		if (block_size > buf_end)
-			block_size = buf_end;
+		/*
+		 * Do not munge beyond page boundary.
+		 * Note: prealloc_bufsz is a multiple of PAGE_SIZE.
+		 */
+		unsigned int page = async->munge_ptr >> PAGE_SHIFT;
+		unsigned int offset = offset_in_page(async->munge_ptr);
+		unsigned int block_size =
+			     min(num_bytes - count, PAGE_SIZE - offset);
 
-		s->munge(s->device, s,
-			 async->prealloc_buf + async->munge_ptr,
+		s->munge(s->device, s, buf_page_list[page].virt_addr + offset,
 			 block_size, async->munge_chan);
 
 		/*
@@ -397,7 +399,8 @@ static unsigned int comedi_buf_munge(struct comedi_subdevice *s,
 		async->munge_chan %= async->cmd.chanlist_len;
 		async->munge_count += block_size;
 		async->munge_ptr += block_size;
-		async->munge_ptr %= async->prealloc_bufsz;
+		if (async->munge_ptr == async->prealloc_bufsz)
+			async->munge_ptr = 0;
 		count += block_size;
 	}
 
@@ -558,46 +561,52 @@ static void comedi_buf_memcpy_to(struct comedi_subdevice *s,
 				 const void *data, unsigned int num_bytes)
 {
 	struct comedi_async *async = s->async;
+	struct comedi_buf_page *buf_page_list = async->buf_map->page_list;
 	unsigned int write_ptr = async->buf_write_ptr;
 
 	while (num_bytes) {
-		unsigned int block_size;
-
-		if (write_ptr + num_bytes > async->prealloc_bufsz)
-			block_size = async->prealloc_bufsz - write_ptr;
-		else
-			block_size = num_bytes;
+		/*
+		 * Do not copy beyond page boundary.
+		 * Note: prealloc_bufsz is a multiple of PAGE_SIZE.
+		 */
+		unsigned int page = write_ptr >> PAGE_SHIFT;
+		unsigned int offset = offset_in_page(write_ptr);
+		unsigned int block_size = min(num_bytes, PAGE_SIZE - offset);
 
-		memcpy(async->prealloc_buf + write_ptr, data, block_size);
+		memcpy(buf_page_list[page].virt_addr + offset,
+		       data, block_size);
 
 		data += block_size;
 		num_bytes -= block_size;
-
-		write_ptr = 0;
+		write_ptr += block_size;
+		if (write_ptr == async->prealloc_bufsz)
+			write_ptr = 0;
 	}
 }
 
 static void comedi_buf_memcpy_from(struct comedi_subdevice *s,
 				   void *dest, unsigned int nbytes)
 {
-	void *src;
 	struct comedi_async *async = s->async;
+	struct comedi_buf_page *buf_page_list = async->buf_map->page_list;
 	unsigned int read_ptr = async->buf_read_ptr;
 
 	while (nbytes) {
-		unsigned int block_size;
-
-		src = async->prealloc_buf + read_ptr;
-
-		if (nbytes >= async->prealloc_bufsz - read_ptr)
-			block_size = async->prealloc_bufsz - read_ptr;
-		else
-			block_size = nbytes;
+		/*
+		 * Do not copy beyond page boundary.
+		 * Note: prealloc_bufsz is a multiple of PAGE_SIZE.
+		 */
+		unsigned int page = read_ptr >> PAGE_SHIFT;
+		unsigned int offset = offset_in_page(read_ptr);
+		unsigned int block_size = min(nbytes, PAGE_SIZE - offset);
 
-		memcpy(dest, src, block_size);
+		memcpy(dest, buf_page_list[page].virt_addr + offset,
+		       block_size);
 		nbytes -= block_size;
 		dest += block_size;
-		read_ptr = 0;
+		read_ptr += block_size;
+		if (read_ptr == async->prealloc_bufsz)
+			read_ptr = 0;
 	}
 }
 
diff --git a/drivers/comedi/comedi_fops.c b/drivers/comedi/comedi_fops.c
index b9df9b19d4bd..37cfef36c1ad 100644
--- a/drivers/comedi/comedi_fops.c
+++ b/drivers/comedi/comedi_fops.c
@@ -2475,6 +2475,62 @@ static __poll_t comedi_poll(struct file *file, poll_table *wait)
 	return mask;
 }
 
+static unsigned int comedi_buf_copy_to_user(struct comedi_subdevice *s,
+	void __user *dest, unsigned int src_offset, unsigned int n)
+{
+	struct comedi_buf_map *bm = s->async->buf_map;
+	struct comedi_buf_page *buf_page_list = bm->page_list;
+	unsigned int page = src_offset >> PAGE_SHIFT;
+	unsigned int offset = offset_in_page(src_offset);
+
+	while (n) {
+		unsigned int copy_amount = min(n, PAGE_SIZE - offset);
+		unsigned int uncopied;
+
+		uncopied = copy_to_user(dest, buf_page_list[page].virt_addr +
+					offset, copy_amount);
+		copy_amount -= uncopied;
+		n -= copy_amount;
+		if (uncopied)
+			break;
+
+		dest += copy_amount;
+		page++;
+		if (page == bm->n_pages)
+			page = 0;	/* buffer wraparound */
+		offset = 0;
+	}
+	return n;
+}
+
+static unsigned int comedi_buf_copy_from_user(struct comedi_subdevice *s,
+	unsigned int dst_offset, const void __user *src, unsigned int n)
+{
+	struct comedi_buf_map *bm = s->async->buf_map;
+	struct comedi_buf_page *buf_page_list = bm->page_list;
+	unsigned int page = dst_offset >> PAGE_SHIFT;
+	unsigned int offset = offset_in_page(dst_offset);
+
+	while (n) {
+		unsigned int copy_amount = min(n, PAGE_SIZE - offset);
+		unsigned int uncopied;
+
+		uncopied = copy_from_user(buf_page_list[page].virt_addr +
+					  offset, src, copy_amount);
+		copy_amount -= uncopied;
+		n -= copy_amount;
+		if (uncopied)
+			break;
+
+		src += copy_amount;
+		page++;
+		if (page == bm->n_pages)
+			page = 0;	/* buffer wraparound */
+		offset = 0;
+	}
+	return n;
+}
+
 static ssize_t comedi_write(struct file *file, const char __user *buf,
 			    size_t nbytes, loff_t *offset)
 {
@@ -2516,7 +2572,6 @@ static ssize_t comedi_write(struct file *file, const char __user *buf,
 	add_wait_queue(&async->wait_head, &wait);
 	while (count == 0 && !retval) {
 		unsigned int runflags;
-		unsigned int wp, n1, n2;
 
 		set_current_state(TASK_INTERRUPTIBLE);
 
@@ -2555,14 +2610,7 @@ static ssize_t comedi_write(struct file *file, const char __user *buf,
 		}
 
 		set_current_state(TASK_RUNNING);
-		wp = async->buf_write_ptr;
-		n1 = min(n, async->prealloc_bufsz - wp);
-		n2 = n - n1;
-		m = copy_from_user(async->prealloc_buf + wp, buf, n1);
-		if (m)
-			m += n2;
-		else if (n2)
-			m = copy_from_user(async->prealloc_buf, buf + n1, n2);
+		m = comedi_buf_copy_from_user(s, async->buf_write_ptr, buf, n);
 		if (m) {
 			n -= m;
 			retval = -EFAULT;
@@ -2651,8 +2699,6 @@ static ssize_t comedi_read(struct file *file, char __user *buf, size_t nbytes,
 
 	add_wait_queue(&async->wait_head, &wait);
 	while (count == 0 && !retval) {
-		unsigned int rp, n1, n2;
-
 		set_current_state(TASK_INTERRUPTIBLE);
 
 		m = comedi_buf_read_n_available(s);
@@ -2689,14 +2735,7 @@ static ssize_t comedi_read(struct file *file, char __user *buf, size_t nbytes,
 		}
 
 		set_current_state(TASK_RUNNING);
-		rp = async->buf_read_ptr;
-		n1 = min(n, async->prealloc_bufsz - rp);
-		n2 = n - n1;
-		m = copy_to_user(buf, async->prealloc_buf + rp, n1);
-		if (m)
-			m += n2;
-		else if (n2)
-			m = copy_to_user(buf + n1, async->prealloc_buf, n2);
+		m = comedi_buf_copy_to_user(s, buf, async->buf_read_ptr, n);
 		if (m) {
 			n -= m;
 			retval = -EFAULT;
-- 
2.47.2

