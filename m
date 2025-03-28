Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A53222094
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 17:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743183897; cv=none; b=qV4kmn5JT/0XVqp2CikESHV+z8m5UbzOcNs4mPfHZzjCqArZ1+Lf83BPeKObNCzlXg9DFQcj9CTeIIFLSGYnVU/yFDm8wpHUiheNrpUHGnjVjEgE2wlHayfCR50RLd+np982wSIpZIULIpUGZW7WyLJqW++ZKq2xcsvxEyByYj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743183897; c=relaxed/simple;
	bh=nxMJr4IbRtF06Hjyor8w2xYGQsJXLN5afA0RK++UJuM=;
	h=From:In-Reply-To:References:To:Cc:Subject:MIME-Version:
	 Content-Type:Date:Message-ID; b=eM6gVTLp2HTGxmmmNVBd1uuqZugcvrhJHMZBzC6FDWA6ANG9HBFHcUh942LJ1h7is7M6GYa1CzSdFS7TfI69vioy9K1Ja0Cy6yH/UjJlLaLeKj33ulG7t4BYWODTU848x2dI2webbbGfcoAKBadXN61BjI+GfWsn8YNeClYs+KY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ey568eN6; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ey568eN6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743183894;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vBdIklFUQdOQtD+W7fZJginlQqeJFZ4hpEcj5ZkuKHQ=;
	b=ey568eN6egcdaMxnwfr1aGYvDFdgPTTQGUPI1eRkqJ6Ew2zlDENt1+zQyRSclxKHmEjhpi
	PIEPdXX6t1bXW38Jme+Y/9hr5FMupOGj0wxyiycN6WiVhhpt72zmYLrDljLnu3yociFiVs
	IMpLalUkIoiaS+LxZAQy7UTsGsQxrk8=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-343-W0tK-_R9NtO1bYdOkQIHkA-1; Fri,
 28 Mar 2025 13:44:50 -0400
X-MC-Unique: W0tK-_R9NtO1bYdOkQIHkA-1
X-Mimecast-MFC-AGG-ID: W0tK-_R9NtO1bYdOkQIHkA_1743183889
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A7BC7180882E;
	Fri, 28 Mar 2025 17:44:49 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.40])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id D95B719541A5;
	Fri, 28 Mar 2025 17:44:47 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <67e57c41.050a0220.2f068f.0034.GAE@google.com>
References: <67e57c41.050a0220.2f068f.0034.GAE@google.com>
To: syzbot <syzbot+3b6c5c6a1d0119b687a1@syzkaller.appspotmail.com>
Cc: dhowells@redhat.com, linux-afs@lists.infradead.org,
    linux-kernel@vger.kernel.org, marc.dionne@auristor.com,
    syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [afs?] BUG: sleeping function called from invalid context in __alloc_frozen_pages_noprof
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <85010.1743183886.1@warthog.procyon.org.uk>
Content-Transfer-Encoding: quoted-printable
Date: Fri, 28 Mar 2025 17:44:46 +0000
Message-ID: <85011.1743183886@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

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

