Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5461F1CCEE0
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 08:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743408382; cv=none; b=BoJaRE02hnquSxSaIgn0jWvb18ubjgScdb158VaG+LUbos+1A7Emn9U8dsQvuiA4bC2QhhRJiQtpuMyo0eMZvlNZ2KJIwJBtuYqaQN9UCaFrPpbaBfbgg3RWxp6e4bucCZaaMlbXZX/D/jobROfecX7O13S/xSuotahVEcDM0jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743408382; c=relaxed/simple;
	bh=tv0nA08POILAAqGWy14m3N6kItXW+3kMFSaB74kI3N0=;
	h=From:In-Reply-To:References:To:Cc:Subject:MIME-Version:
	 Content-Type:Date:Message-ID; b=LliZY7MvurveY5fC1XiIJDqKlY9r2O39n0lWDnpYX8y3Ao4lyPeK0CbCqaVcECHwocRAhkl7+ETy9bGhqp6ymT712xYEXE3R9MrokCcwUxS+0xzDse0sgUHnQ19UgmtXtjPBcpcJG4K0O1Hsyw507ts9gpnsqYPc1JTn6ag/lYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Z+/CY2pt; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Z+/CY2pt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743408379;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rPsm0V0jwFb/CAGVhHad9xohOJQN3D43emc/SoqswrQ=;
	b=Z+/CY2ptGTZE+4S/ybOVnC1g9UQ6pvpvQmSNTGey2Uoh6Xjh+FHJeiexsSsJo6oHqLuIVb
	thkKUalYM81SHaN0NvtSXo2JbTEnBu+opwV6aLMsMRuIYOXnNLzrvf858ckErvL9qfMlgY
	jKbddwXju3CDkAuq35iSMKSvl7LunRo=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-595-W96iTcGqPbmvzUKojrGGFA-1; Mon,
 31 Mar 2025 04:06:15 -0400
X-MC-Unique: W96iTcGqPbmvzUKojrGGFA-1
X-Mimecast-MFC-AGG-ID: W96iTcGqPbmvzUKojrGGFA_1743408374
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 109E91955DCE;
	Mon, 31 Mar 2025 08:06:14 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.40])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 3FE11180B48C;
	Mon, 31 Mar 2025 08:06:11 +0000 (UTC)
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
Content-ID: <164840.1743408370.1@warthog.procyon.org.uk>
Content-Transfer-Encoding: quoted-printable
Date: Mon, 31 Mar 2025 09:06:10 +0100
Message-ID: <164841.1743408370@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t master

commit db7a516159869b19f237c73bd75599bbe0bfcc4d
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

    Fix afs_dynroot_readdir() to get a shared lock on net->cells_lock inst=
ead.
    =

    Fixes: 1d0b929fc070 ("afs: Change dynroot to create contents on demand=
")
    Reported-by: syzbot+3b6c5c6a1d0119b687a1@syzkaller.appspotmail.com
    Signed-off-by: David Howells <dhowells@redhat.com>
    cc: Marc Dionne <marc.dionne@auristor.com>
    cc: linux-afs@lists.infradead.org
    cc: linux-fsdevel@vger.kernel.org

diff --git a/fs/afs/dynroot.c b/fs/afs/dynroot.c
index 691e0ae607a1..8c6130789fde 100644
--- a/fs/afs/dynroot.c
+++ b/fs/afs/dynroot.c
@@ -348,9 +348,9 @@ static int afs_dynroot_readdir(struct file *file, stru=
ct dir_context *ctx)
 	}
 =

 	if ((unsigned long long)ctx->pos <=3D AFS_MAX_DYNROOT_CELL_INO) {
-		rcu_read_lock();
+		down_read(&net->cells_lock);
 		ret =3D afs_dynroot_readdir_cells(net, ctx);
-		rcu_read_unlock();
+		up_read(&net->cells_lock);
 	}
 	return ret;
 }

