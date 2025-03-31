Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07AEF1D54CF
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 08:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743408411; cv=none; b=b7vE+vtWm01+AVS0GRXh3aDDrcq5m4bj5Pev9gQGtSKwv4VnX+D4hR1pcQPI0jnHd7+BJPkkKeVPDlM2+zgUIdWFj+sNABDD8FlezHkfaMuUqKk9hV8J3cklA1cNTAo3EytBtwv5oIGmyCiHJkkrXmndYqpws/+UZfIy6S9b6Kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743408411; c=relaxed/simple;
	bh=tv0nA08POILAAqGWy14m3N6kItXW+3kMFSaB74kI3N0=;
	h=From:In-Reply-To:References:To:Cc:Subject:MIME-Version:
	 Content-Type:Date:Message-ID; b=C1GHmUax2A49F/Ovt2lf3yDajifkahsAEBRxdeATWrhN/Dz4NNPUG6uEkO8a8D7NltXbFcKTT8crdCu2bmMA91TlxDTa05XKmf0tD216vPge4sNX/HRoTH1ZNzHL9QrOWS1L8KPnt0fac+pbetB5JHTPUTj+uymrdcwAkvbDcWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fvt/rFr1; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fvt/rFr1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743408408;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rPsm0V0jwFb/CAGVhHad9xohOJQN3D43emc/SoqswrQ=;
	b=fvt/rFr1OqW15eRGZiX7eugWK6wE0MFKYd4ir/B0VPsxGmJdQpj8jV3CT0zZ5igJefePiF
	kEWTdsufZTDU/0FBxhadOjcle1umqz12L6RIK3C1aySP/t3ptFDA/seDiltkSjgzOkslBc
	9zA9wpYwY1L7Q3nmnDEQBTMgVQf1kd8=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-572-x2BlINz4OJy8_yPRz-BxkQ-1; Mon,
 31 Mar 2025 04:06:47 -0400
X-MC-Unique: x2BlINz4OJy8_yPRz-BxkQ-1
X-Mimecast-MFC-AGG-ID: x2BlINz4OJy8_yPRz-BxkQ_1743408406
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E725B1956089;
	Mon, 31 Mar 2025 08:06:45 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.40])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 24EDB18009BC;
	Mon, 31 Mar 2025 08:06:43 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <67e91729.050a0220.1547ec.009e.GAE@google.com>
References: <67e91729.050a0220.1547ec.009e.GAE@google.com>
To: syzbot <syzbot+8245611446194a52150d@syzkaller.appspotmail.com>
Cc: dhowells@redhat.com, linux-afs@lists.infradead.org,
    linux-kernel@vger.kernel.org, marc.dionne@auristor.com,
    syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [afs?] BUG: sleeping function called from invalid context in __do_fault
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <164860.1743408402.1@warthog.procyon.org.uk>
Content-Transfer-Encoding: quoted-printable
Date: Mon, 31 Mar 2025 09:06:42 +0100
Message-ID: <164861.1743408402@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

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

