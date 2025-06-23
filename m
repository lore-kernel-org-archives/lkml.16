Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAA01187FEC
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 04:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750653820; cv=none; b=gyzdMzYxEz9pXV3f/aGc7We3/SnKy8jwZQohP6W3zoqV7u2Nu5Xg8eIxKWl5k/vsH7/dO7TK0OuafyuktsdviWZ1opGAJMyb2IeCynhXvrNGvoMVlQhy+DYaV89E55jgyqdvS5YdHcM7xIWrB3kpUuRMMw60WWK4mfnsUR2X06Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750653820; c=relaxed/simple;
	bh=p5vFcaBD5E4yUu/iTgNP5jGaDtcOF+2KeVWs6plg9XE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qqtnCMsJDyLE3S0VXlnZWTuqbQksLQ1+XGOM2taVZ6pa1K0nouFD2H1TlNJ8yVdfT6zxQTd39iFz5f2DBwoJgbK2vTPQAI00JCz2DfXFnKT9XYY6CpixxCcD573DTAnAuzKKcq6LDNX2uuT07bxKVJOpWUk4OsYH8jIsftUY2/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LEGBbcMm; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LEGBbcMm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750653817;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=P+e2knuY2j3bw/+jd0n23xFsChWwCX8ee+4KjbCpHoI=;
	b=LEGBbcMmOWjxk7J0oqqtRkmiuo2QMIuMkkk0rjWDTDd6ibfwMUqLVXFjHHR3m5SZOKXl/R
	kcnLMyBS4uhK/UselCLGxzZHuw2Y7sECwoyOt44JlGOpztMQxfORYffih8vPfvbo9X9/Mq
	zldQTxlUJA+HCynf05yLbsfRR7siT74=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-672-otgY_REVNT-CBB08-vj4SA-1; Mon,
 23 Jun 2025 00:43:32 -0400
X-MC-Unique: otgY_REVNT-CBB08-vj4SA-1
X-Mimecast-MFC-AGG-ID: otgY_REVNT-CBB08-vj4SA_1750653811
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 60B1F1800368;
	Mon, 23 Jun 2025 04:43:31 +0000 (UTC)
Received: from fedora (unknown [10.72.116.88])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D82821803AF2;
	Mon, 23 Jun 2025 04:43:27 +0000 (UTC)
Date: Mon, 23 Jun 2025 12:43:22 +0800
From: Ming Lei <ming.lei@redhat.com>
To: syzbot <syzbot+2e9e529ac0b319316453@syzkaller.appspotmail.com>
Cc: axboe@kernel.dk, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [block?] possible deadlock in __del_gendisk
Message-ID: <aFjbavzLAFO0Q7n1@fedora>
References: <6834671a.a70a0220.253bc2.0098.GAE@google.com>
 <68352d9b.a70a0220.253bc2.009e.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <68352d9b.a70a0220.253bc2.009e.GAE@google.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

On Mon, May 26, 2025 at 08:12:27PM -0700, syzbot wrote:
> syzbot has found a reproducer for the following issue on:
> 
> HEAD commit:    ddddf9d64f73 Merge tag 'perf-core-2025-05-25' of git://git..
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=12f87882580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=fd18a1001092f95b
> dashboard link: https://syzkaller.appspot.com/bug?extid=2e9e529ac0b319316453
> compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=11825df4580000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=17fb7ad4580000
> 
> Downloadable assets:
> disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-ddddf9d6.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/bc551d1d4e46/vmlinux-ddddf9d6.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/d26a6de23b0e/bzImage-ddddf9d6.xz
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+2e9e529ac0b319316453@syzkaller.appspotmail.com
> 
> ======================================================
> WARNING: possible circular locking dependency detected
> 6.15.0-syzkaller-01599-gddddf9d64f73 #0 Not tainted
> ------------------------------------------------------
> kworker/u4:9/1091 is trying to acquire lock:
> ffff888011362358 (&disk->open_mutex){+.+.}-{4:4}, at: __del_gendisk+0x129/0x9e0 block/genhd.c:706
> 
> but task is already holding lock:
> ffff88801bb55188 (&set->update_nr_hwq_lock){++++}-{4:4}, at: del_gendisk+0xe0/0x160 block/genhd.c:818
> 
> which lock already depends on the new lock.
> 

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index 7bdc7eb808ea..aa249719fa7f 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -1473,7 +1473,12 @@ static int nbd_start_device(struct nbd_device *nbd)
 		return -EINVAL;
 	}
 
-	blk_mq_update_nr_hw_queues(&nbd->tag_set, config->num_connections);
+	mutex_unlock(&nbd->config_lock);
+	blk_mq_update_nr_hw_queues(&nbd->tag_set, num_connections);
+	mutex_lock(&nbd->config_lock);
+	if (config->num_connections != num_connections)
+		return -EINVAL;
+
 	nbd->pid = task_pid_nr(current);
 
 	nbd_parse_flags(nbd);

Thanks,
Ming

