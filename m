Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFE391FCCE7
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 18:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738779509; cv=none; b=eKSgHOdeLDfUzO4Z2s77yLfWPYCEBJZULscBLU4/7HoifuKwO0dGBgL7b3w1c+Nn3iWk1kXM94+wIG7KZPTI36J2GTKXGTA63qGptST1HafHrSj7TTsyjVp+idheBwiYB/56FzxjI/rhj6TC/Ug6fnhwYzKRa0KvLGitzK9KpUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738779509; c=relaxed/simple;
	bh=ODnxcr1GdYUsjFENMi2i2f3qxVNrskw1WAi5/5b2ptM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fWCXjWBuypnITJADZSpMJKKDC2m23vNfSlDpAnNi69bhJ7sSG/9h6F4NYF5HvKiQBoR+CR3ccR4/HpktsknBDoOWa+qp0nkDmUzvjIengxogxN1hNCvuLw9ujf30qHTQixPnM9KFGsBtl9SCE791i4Rx+3UZJIniYke+oW8gwNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=H06uae4J; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="H06uae4J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738779506;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dy17xqtR8bKzLOlpEcmAmdsSUGFFIgAoYai7nMDmujU=;
	b=H06uae4JynmyVdXtmP2QQQYb0NwmYMcDPBN8ginln6NLoMMD6hVYzYHKsciZz/593yyChT
	y0ihrV4tsJLJbPGVpANEGnr2fZCHn42diLraikq4JnLr04C7DPrKFYiUxTv3gtkYfj2MtF
	JUYbgHAnZk7mG6Dl/v36IaspfNafLIk=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-84-ChlUq0RpPzO6uf2fT8SGXg-1; Wed,
 05 Feb 2025 13:18:22 -0500
X-MC-Unique: ChlUq0RpPzO6uf2fT8SGXg-1
X-Mimecast-MFC-AGG-ID: ChlUq0RpPzO6uf2fT8SGXg
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 35FE51955F16;
	Wed,  5 Feb 2025 18:18:20 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.45.224.10])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 5C572195608D;
	Wed,  5 Feb 2025 18:18:15 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Wed,  5 Feb 2025 19:17:53 +0100 (CET)
Date: Wed, 5 Feb 2025 19:17:47 +0100
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
Subject: [PATCH v3 1/2] pipe: introduce struct file_operations pipeanon_fops
Message-ID: <20250205181747.GB13817@redhat.com>
References: <20250205181716.GA13817@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250205181716.GA13817@redhat.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

So that fifos and anonymous pipes could have different f_op methods.
Preparation to simplify the next patch.

Signed-off-by: Oleg Nesterov <oleg@redhat.com>
---
 fs/pipe.c | 25 ++++++++++++++++++++-----
 1 file changed, 20 insertions(+), 5 deletions(-)

diff --git a/fs/pipe.c b/fs/pipe.c
index 94b59045ab44..2eacfde61e74 100644
--- a/fs/pipe.c
+++ b/fs/pipe.c
@@ -878,6 +878,8 @@ static const struct dentry_operations pipefs_dentry_operations = {
 	.d_dname	= pipefs_dname,
 };
 
+static const struct file_operations pipeanon_fops;
+
 static struct inode * get_pipe_inode(void)
 {
 	struct inode *inode = new_inode_pseudo(pipe_mnt->mnt_sb);
@@ -895,7 +897,7 @@ static struct inode * get_pipe_inode(void)
 	inode->i_pipe = pipe;
 	pipe->files = 2;
 	pipe->readers = pipe->writers = 1;
-	inode->i_fop = &pipefifo_fops;
+	inode->i_fop = &pipeanon_fops;
 
 	/*
 	 * Mark the inode dirty from the very beginning,
@@ -938,7 +940,7 @@ int create_pipe_files(struct file **res, int flags)
 
 	f = alloc_file_pseudo(inode, pipe_mnt, "",
 				O_WRONLY | (flags & (O_NONBLOCK | O_DIRECT)),
-				&pipefifo_fops);
+				&pipeanon_fops);
 	if (IS_ERR(f)) {
 		free_pipe_info(inode->i_pipe);
 		iput(inode);
@@ -949,7 +951,7 @@ int create_pipe_files(struct file **res, int flags)
 	f->f_pipe = 0;
 
 	res[0] = alloc_file_clone(f, O_RDONLY | (flags & O_NONBLOCK),
-				  &pipefifo_fops);
+				  &pipeanon_fops);
 	if (IS_ERR(res[0])) {
 		put_pipe_info(inode, inode->i_pipe);
 		fput(f);
@@ -1107,8 +1109,8 @@ static void wake_up_partner(struct pipe_inode_info *pipe)
 
 static int fifo_open(struct inode *inode, struct file *filp)
 {
+	bool is_pipe = inode->i_fop == &pipeanon_fops;
 	struct pipe_inode_info *pipe;
-	bool is_pipe = inode->i_sb->s_magic == PIPEFS_MAGIC;
 	int ret;
 
 	filp->f_pipe = 0;
@@ -1241,6 +1243,17 @@ const struct file_operations pipefifo_fops = {
 	.splice_write	= iter_file_splice_write,
 };
 
+static const struct file_operations pipeanon_fops = {
+	.open		= fifo_open,
+	.read_iter	= pipe_read,
+	.write_iter	= pipe_write,
+	.poll		= pipe_poll,
+	.unlocked_ioctl	= pipe_ioctl,
+	.release	= pipe_release,
+	.fasync		= pipe_fasync,
+	.splice_write	= iter_file_splice_write,
+};
+
 /*
  * Currently we rely on the pipe array holding a power-of-2 number
  * of pages. Returns 0 on error.
@@ -1388,7 +1401,9 @@ struct pipe_inode_info *get_pipe_info(struct file *file, bool for_splice)
 {
 	struct pipe_inode_info *pipe = file->private_data;
 
-	if (file->f_op != &pipefifo_fops || !pipe)
+	if (!pipe)
+		return NULL;
+	if (file->f_op != &pipefifo_fops && file->f_op != &pipeanon_fops)
 		return NULL;
 	if (for_splice && pipe_has_watch_queue(pipe))
 		return NULL;
-- 
2.25.1.362.g51ebf55


