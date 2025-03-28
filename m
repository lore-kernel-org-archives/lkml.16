Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10B6D3595A
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 17:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743183994; cv=none; b=acJt+Sc6uAPyS4pf8k8Ltus6IaEdaL6iWjd5ph3gMxA139BEgPWDaD7IFdXJ2vaUjIaVXJAghF9LF6nmsnrAOUCoS7oLOl+ShQz+fCIExgXVA4BkjMlAh/ix8fFc3289NXkURBP5EatDJpYn5nTRomstilN/p3XtDsx4YMZHWfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743183994; c=relaxed/simple;
	bh=nxMJr4IbRtF06Hjyor8w2xYGQsJXLN5afA0RK++UJuM=;
	h=From:In-Reply-To:References:To:Cc:Subject:MIME-Version:
	 Content-Type:Date:Message-ID; b=bMIwmVezSH/9CYJhfYWmt3XvQqYroEEw/sMDaVzuCcxvHX0SWs0WN8l5jNLCjONPs5j5bxr8Y65ArIN7mae/sO+JzWCSNvNaosJANzpFoveNeGZDGiuKb6it9wdNznNiav7v+adsaWQdFWiV0LWOFcUL1vSki3tlOCvVczYKMbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Nku3FvV2; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Nku3FvV2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743183989;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vBdIklFUQdOQtD+W7fZJginlQqeJFZ4hpEcj5ZkuKHQ=;
	b=Nku3FvV2/lP513uC4mkkxaLNfNxJXIVPNOwZG4lYJIGCcGdBjAOEczOVh3AZpzWXacXVL5
	ao4VVVxThRBOt16a3QY+XhJmGRSRWCD0CFyrNLIfItqRPd9inLUGV9fDCM9LuXb6eBsAb0
	G/WCy19+uaIsF1j5+/1YYj6AKuKQQ8w=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-275-SZcbH0u9PUa58bCZtD7zFw-1; Fri,
 28 Mar 2025 13:46:27 -0400
X-MC-Unique: SZcbH0u9PUa58bCZtD7zFw-1
X-Mimecast-MFC-AGG-ID: SZcbH0u9PUa58bCZtD7zFw_1743183986
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B8A121933B57;
	Fri, 28 Mar 2025 17:46:25 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.40])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id BF123180B486;
	Fri, 28 Mar 2025 17:46:22 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <67e57c6c.050a0220.2f068f.0036.GAE@google.com>
References: <67e57c6c.050a0220.2f068f.0036.GAE@google.com>
To: syzbot <syzbot+54e6c2176ba76c56217e@syzkaller.appspotmail.com>
Cc: dhowells@redhat.com, almaz.alexandrovich@paragon-software.com,
    linux-afs@lists.infradead.org, linux-kernel@vger.kernel.org,
    marc.dionne@auristor.com, ntfs3@lists.linux.dev,
    syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [afs?] [ntfs3?] BUG: sleeping function called from invalid context in ovl_cache_entry_new
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <85068.1743183981.1@warthog.procyon.org.uk>
Content-Transfer-Encoding: quoted-printable
Date: Fri, 28 Mar 2025 17:46:21 +0000
Message-ID: <85069.1743183981@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t master

commit f34068283e8650ecd7a2f57b0b55aa91e498a470
Author: David Howells <dhowells@redhat.com>
Date:   Fri Mar 28 16:46:58 2025 +0000

    afs: Fix afs_dynroot_readdir() to not use the RCU read lock
    =

    afs_dynroot_readdir() uses the RCU read lock to walk the cell list whi=
lst
    emitting cell automount entries - but dir_emit() may write to a usersp=
ace
    buffer, thereby causing a fault to occur and waits to happen.
    =

    Fix afs_dynroot_readdir() to get a shared lock on i_rwsem instead.
    =

    Fixes: 1d0b929fc070 ("afs: Change dynroot to create contents on demand=
")
    Reported-by: syzbot+3b6c5c6a1d0119b687a1@syzkaller.appspotmail.com
    Signed-off-by: David Howells <dhowells@redhat.com>
    cc: Marc Dionne <marc.dionne@auristor.com>
    cc: linux-afs@lists.infradead.org
    cc: linux-fsdevel@vger.kernel.org

diff --git a/fs/afs/dynroot.c b/fs/afs/dynroot.c
index 691e0ae607a1..61bc8c81c5ca 100644
--- a/fs/afs/dynroot.c
+++ b/fs/afs/dynroot.c
@@ -348,9 +348,9 @@ static int afs_dynroot_readdir(struct file *file, stru=
ct dir_context *ctx)
 	}
 =

 	if ((unsigned long long)ctx->pos <=3D AFS_MAX_DYNROOT_CELL_INO) {
-		rcu_read_lock();
+		down_read(&file_inode(file)->i_rwsem);
 		ret =3D afs_dynroot_readdir_cells(net, ctx);
-		rcu_read_unlock();
+		up_read(&file_inode(file)->i_rwsem);
 	}
 	return ret;
 }

