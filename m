Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05C9025C6FF
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 15:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745855352; cv=none; b=lUU0r7NcHAB+1+A3g2V0UXFOGsvNX1gpQsuN5QNBz15zQ3nvOtCfCTtaoUU/9U9b8uhDbT6nuOsMG6TD96mI9F08iOAzNgDqrOGetV8Gp++PByn5yQLk6nwK647fniQlkT88GL1zYO/2AlPa3Yzo/JstInwOP6ElhixbCt6Bxyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745855352; c=relaxed/simple;
	bh=xGAXijsIWhD5SusN4M0DSp5+o3589RWWI44L35vgX7k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xf1Xkh4M5ZJm6E73NGkqgudnJtPYUYoNgwZ6DsRAEbwFXpezKwG0GEj8JWlmzbDIZU4K70SWJJyeNP42VySf33yXE1k2BceccfRzzBemOGMy+TJE7lMbTjxlzhvQZ2O2pUs8OX6y4LYPWoQD9OoeY09wVFVGcsNojpfAjsZA2Rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ionos.com; spf=pass smtp.mailfrom=ionos.com; dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b=fDHfybKp; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b="fDHfybKp"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43690d4605dso37136465e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 08:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1745855347; x=1746460147; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tMnv5syE0qO7OJSA1fIn8ke/RdLf6TMEyfCvrQJcHBY=;
        b=fDHfybKpk6Fz7Z61u5x5R7l/BERSrdhexW+HAmMpyfK0bdqS45Cr4VwjlUJXDOpnL5
         9uTtzFwW9zZII84YxPV8MRXQGuwUzhmkcpmwg4KyXf1iW7iej7u1IoLFj8BOS3Q+dBuL
         TWjAb9IDcwiHzvt2VWexakLeidrGhy5/Iod1Ia9HV6lDgE/mG0HI7me2hlFjWXkAxyUK
         NvOJlfd7B+ZBLlYnZHUT55ojs7DORgKZrpvZyXexkH2o9dXcmvz+FqlQi7AJzgjpC86l
         0dGNJcxbdqUTeKtLpmt8p8KXhUbf2PtuRFxyZgMfMgs5ZSiPpYFJkmFN5Xz0qVB3Fqct
         Hnxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745855347; x=1746460147;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tMnv5syE0qO7OJSA1fIn8ke/RdLf6TMEyfCvrQJcHBY=;
        b=O8ZYXZQ229E9lJN2i330meH06fn4M9eB5HZQ3PYDcbf1DSiNSrceNd0/24wGuQOhlA
         Jo4ElUR+qgJjLnDWg+kpr5S32qo/iXARQyg9BBigrsgXWDnjh4mW4E32eXnMIxYtCH2m
         r7UA7Qn1v1tZbI+BZ+mrzD9lzZyohCvZ+kygNGj92N1+BThQB+PzmVEwBk89J5y/yFfa
         B1qtZaHIGfhZr9zNSCbgOFac7QEuS5YR68W3469RDXIXP3rqe2cNsYf9gAn7ZGoqGEOp
         3R0f07uGbKbNKGNXGhGosX44p7MaVf362QYPtf4SZzQ8AsA211hKZfqcrrukbKFX1nGR
         Q1WQ==
X-Forwarded-Encrypted: i=1; AJvYcCXb0OBXUoIpp/MJwc260XVGdsH2ww5yE8xs5+p7WtntDKYXbU5Ap+22MdWRAlPqYwcdIiw5LsjMMTtkiYI=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywt9laDx2yX9ZKRe20GGSIG4f/X39oV5pIGHqQ+hj8Av84LgNkR
	TXdzP+lCllsNc5Dp60djfelF02TZxs+0hvaWD1fCmtCA1uVyLVOJIvZCLVY377U=
X-Gm-Gg: ASbGnctyWsT+PCmRe9iLNTv3n4SmhyCsdIMhH4n6AlzRkknB1EwiZGJrmKVY95r2Qt3
	tPyLJB5rrFJtPIEki4e7Rr3rkk7kKcipS6FNh1IWRxRJMu89iGzenqzTK+g3oOQacQJs5vFqGjO
	jQz16dCLzEMgjJR1SmIoVS32eXYxJtiN+XXm4t6ip6dwcITY18DCEpCyDRYQZSAfOxxINigUODy
	MGj0fW3eJuuW60tttWxbXvsN4XU8C0MykIJCP7DCVuzkdWRTjzLkHYtTFGAin4ViEnOA9D0YfMl
	zipxqboJuHkrc5IVotK+fO0RrqR26BBg67IlBt9huMeCRdc3WOYpQ3Lt6bX1RBGw8j+1wc618s/
	VfZoQ69YuImrO1bXodEnjsX6B4iZGGQPKMSLyGzx2
X-Google-Smtp-Source: AGHT+IGXL9dyVPRVodF/Fetap7dAZVCVkq++jd5Kw/OkUaZM3TE7pz9rtcjMS3VPpB/B1NERcJRs3w==
X-Received: by 2002:a05:600c:a41a:b0:43d:4e9:27f3 with SMTP id 5b1f17b1804b1-440b0b32f17mr36472885e9.9.1745855347254;
        Mon, 28 Apr 2025 08:49:07 -0700 (PDT)
Received: from raven.intern.cm-ag (p200300dc6f46c100023064fffe740809.dip0.t-ipconnect.de. [2003:dc:6f46:c100:230:64ff:fe74:809])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d29ba29sm162134575e9.7.2025.04.28.08.49.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 08:49:06 -0700 (PDT)
From: Max Kellermann <max.kellermann@ionos.com>
To: dhowells@redhat.com,
	netfs@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Max Kellermann <max.kellermann@ionos.com>
Subject: [PATCH 3/4] fs/netfs: remove `netfs_io_request.ractl`
Date: Mon, 28 Apr 2025 17:48:58 +0200
Message-ID: <20250428154859.3228933-3-max.kellermann@ionos.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250428154859.3228933-1-max.kellermann@ionos.com>
References: <20250428154859.3228933-1-max.kellermann@ionos.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since this field is only used by netfs_prepare_read_iterator() when
called by netfs_readahead(), we can simply pass it as parameter.  This
shrinks the struct from 576 to 568 bytes.

Signed-off-by: Max Kellermann <max.kellermann@ionos.com>
---
 fs/netfs/buffered_read.c | 24 ++++++++++++------------
 include/linux/netfs.h    |  1 -
 2 files changed, 12 insertions(+), 13 deletions(-)

diff --git a/fs/netfs/buffered_read.c b/fs/netfs/buffered_read.c
index 0d1b6d35ff3b..5f53634a3862 100644
--- a/fs/netfs/buffered_read.c
+++ b/fs/netfs/buffered_read.c
@@ -78,7 +78,8 @@ static int netfs_begin_cache_read(struct netfs_io_request *rreq, struct netfs_in
  * [!] NOTE: This must be run in the same thread as ->issue_read() was called
  * in as we access the readahead_control struct.
  */
-static ssize_t netfs_prepare_read_iterator(struct netfs_io_subrequest *subreq)
+static ssize_t netfs_prepare_read_iterator(struct netfs_io_subrequest *subreq,
+					   struct readahead_control *ractl)
 {
 	struct netfs_io_request *rreq = subreq->rreq;
 	size_t rsize = subreq->len;
@@ -86,7 +87,7 @@ static ssize_t netfs_prepare_read_iterator(struct netfs_io_subrequest *subreq)
 	if (subreq->source == NETFS_DOWNLOAD_FROM_SERVER)
 		rsize = umin(rsize, rreq->io_streams[0].sreq_max_len);
 
-	if (rreq->ractl) {
+	if (ractl) {
 		/* If we don't have sufficient folios in the rolling buffer,
 		 * extract a folioq's worth from the readahead region at a time
 		 * into the buffer.  Note that this acquires a ref on each page
@@ -99,7 +100,7 @@ static ssize_t netfs_prepare_read_iterator(struct netfs_io_subrequest *subreq)
 		while (rreq->submitted < subreq->start + rsize) {
 			ssize_t added;
 
-			added = rolling_buffer_load_from_ra(&rreq->buffer, rreq->ractl,
+			added = rolling_buffer_load_from_ra(&rreq->buffer, ractl,
 							    &put_batch);
 			if (added < 0)
 				return added;
@@ -211,7 +212,8 @@ static void netfs_issue_read(struct netfs_io_request *rreq,
  * slicing up the region to be read according to available cache blocks and
  * network rsize.
  */
-static void netfs_read_to_pagecache(struct netfs_io_request *rreq)
+static void netfs_read_to_pagecache(struct netfs_io_request *rreq,
+				    struct readahead_control *ractl)
 {
 	struct netfs_inode *ictx = netfs_inode(rreq->inode);
 	unsigned long long start = rreq->start;
@@ -291,7 +293,7 @@ static void netfs_read_to_pagecache(struct netfs_io_request *rreq)
 		break;
 
 	issue:
-		slice = netfs_prepare_read_iterator(subreq);
+		slice = netfs_prepare_read_iterator(subreq, ractl);
 		if (slice < 0) {
 			ret = slice;
 			subreq->error = ret;
@@ -359,11 +361,10 @@ void netfs_readahead(struct readahead_control *ractl)
 
 	netfs_rreq_expand(rreq, ractl);
 
-	rreq->ractl = ractl;
 	rreq->submitted = rreq->start;
 	if (rolling_buffer_init(&rreq->buffer, rreq->debug_id, ITER_DEST) < 0)
 		goto cleanup_free;
-	netfs_read_to_pagecache(rreq);
+	netfs_read_to_pagecache(rreq, ractl);
 
 	netfs_put_request(rreq, true, netfs_rreq_trace_put_return);
 	return;
@@ -389,7 +390,6 @@ static int netfs_create_singular_buffer(struct netfs_io_request *rreq, struct fo
 	if (added < 0)
 		return added;
 	rreq->submitted = rreq->start + added;
-	rreq->ractl = (struct readahead_control *)1UL;
 	return 0;
 }
 
@@ -459,7 +459,7 @@ static int netfs_read_gaps(struct file *file, struct folio *folio)
 	iov_iter_bvec(&rreq->buffer.iter, ITER_DEST, bvec, i, rreq->len);
 	rreq->submitted = rreq->start + flen;
 
-	netfs_read_to_pagecache(rreq);
+	netfs_read_to_pagecache(rreq, NULL);
 
 	if (sink)
 		folio_put(sink);
@@ -528,7 +528,7 @@ int netfs_read_folio(struct file *file, struct folio *folio)
 	if (ret < 0)
 		goto discard;
 
-	netfs_read_to_pagecache(rreq);
+	netfs_read_to_pagecache(rreq, NULL);
 	ret = netfs_wait_for_read(rreq);
 	netfs_put_request(rreq, false, netfs_rreq_trace_put_return);
 	return ret < 0 ? ret : 0;
@@ -685,7 +685,7 @@ int netfs_write_begin(struct netfs_inode *ctx,
 	if (ret < 0)
 		goto error_put;
 
-	netfs_read_to_pagecache(rreq);
+	netfs_read_to_pagecache(rreq, NULL);
 	ret = netfs_wait_for_read(rreq);
 	if (ret < 0)
 		goto error;
@@ -750,7 +750,7 @@ int netfs_prefetch_for_write(struct file *file, struct folio *folio,
 	if (ret < 0)
 		goto error_put;
 
-	netfs_read_to_pagecache(rreq);
+	netfs_read_to_pagecache(rreq, NULL);
 	ret = netfs_wait_for_read(rreq);
 	netfs_put_request(rreq, false, netfs_rreq_trace_put_return);
 	return ret < 0 ? ret : 0;
diff --git a/include/linux/netfs.h b/include/linux/netfs.h
index f0436bac5b59..547b1aa70d2a 100644
--- a/include/linux/netfs.h
+++ b/include/linux/netfs.h
@@ -231,7 +231,6 @@ struct netfs_io_request {
 	struct kiocb		*iocb;		/* AIO completion vector */
 	struct netfs_cache_resources cache_resources;
 	struct netfs_io_request	*copy_to_cache;	/* Request to write just-read data to the cache */
-	struct readahead_control *ractl;	/* Readahead descriptor */
 	struct list_head	proc_link;	/* Link in netfs_iorequests */
 	struct netfs_io_stream	io_streams[2];	/* Streams of parallel I/O operations */
 #define NR_IO_STREAMS 2 //wreq->nr_io_streams
-- 
2.47.2

