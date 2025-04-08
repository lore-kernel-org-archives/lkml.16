Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39DB513CFB6
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 20:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744145202; cv=none; b=sZm1MvRR7EvH90Cy612TIL4UY6R7AcakBpFNk9tEZy/FCPH9qwRjv2OBVfBgZLO7QA6h2/cY1qoZRsoHGNly5s3ir4gxld02MKXSDe7yNAs+i/VGT2Rx2xuSHLnMNIy7a7d95vLP+ybTQ7Kk/8l08dbuLQWZLqtkOkQqtrTmHB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744145202; c=relaxed/simple;
	bh=pygF+ZSdbKYdFeQiu6iveVNCcysYlRcyT9rck4z6eiM=;
	h=To:cc:Subject:MIME-Version:Content-Type:From:Date:Message-ID; b=ikQ3MK6a2+HUvgKhkJ74174Lhi6Jhdwz/GVnRpyuWkhKAdfaNCBvLLzckB6NdzNU3f3ocSSmFF5G7Z/dcXMuGgKftF8ErYmSL0uUD7BSIQRLj1D0iO7VuTvYIy5vV5aBqje4vvigaw/HQJUh93hRwyRrhEOzAJZRnpFlmHLA+jI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iGXqeYmt; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iGXqeYmt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744145199;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=xU+rcssVzd6sgJjw8xmnFPHxLXA9Q5HvfNjc6qmn0+4=;
	b=iGXqeYmt2hSeXZsgj4Hkt5joXO7Ox+Z4ZSPd/gl7HZDIV7sGw23PUcvnKWgWM91QmSDOHT
	zxRLjUlms4t0JADT/ji1cdnEF6IpDxdfmN3BJ2bzcRR89bbHELBibB81r7aE02Q3cs0XGY
	nLeve8TgMkOt95S1+7GLFxJc67YcQUM=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-212-fN4CTezkOKyou8zZWjgMlw-1; Tue,
 08 Apr 2025 16:46:35 -0400
X-MC-Unique: fN4CTezkOKyou8zZWjgMlw-1
X-Mimecast-MFC-AGG-ID: fN4CTezkOKyou8zZWjgMlw_1744145193
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7679F180AF79;
	Tue,  8 Apr 2025 20:46:32 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.40])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 2037A1956094;
	Tue,  8 Apr 2025 20:46:29 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
To: Christian Brauner <brauner@kernel.org>
cc: dhowells@redhat.com,
    syzbot+3b6c5c6a1d0119b687a1@syzkaller.appspotmail.com,
    syzbot+8245611446194a52150d@syzkaller.appspotmail.com,
    syzbot+1aa62e6852a6ad1c7944@syzkaller.appspotmail.com,
    syzbot+54e6c2176ba76c56217e@syzkaller.appspotmail.com,
    Marc Dionne <marc.dionne@auristor.com>,
    linux-afs@lists.infradead.org, linux-fsdevel@vger.kernel.org,
    linux-kernel@vger.kernel.org
Subject: [PATCH] afs: Fix afs_dynroot_readdir() to not use the RCU read lock
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1637993.1744145165.1@warthog.procyon.org.uk>
Content-Transfer-Encoding: quoted-printable
From: David Howells <dhowells@redhat.com>
Date: Tue, 08 Apr 2025 21:46:29 +0100
Message-ID: <1638014.1744145189@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15

afs_dynroot_readdir() uses the RCU read lock to walk the cell list whilst
emitting cell automount entries - but dir_emit() may write to a userspace
buffer, thereby causing a fault to occur and waits to happen.

Fix afs_dynroot_readdir() to get a shared lock on net->cells_lock instead.

This can be triggered by enabling lockdep, preconfiguring a number of
cells, doing "mount -t afs none /afs -o dyn" (or using the kafs-client
package with afs.mount systemd unit enabled) and then doing "ls /afs".

Fixes: 1d0b929fc070 ("afs: Change dynroot to create contents on demand")
Reported-by: syzbot+3b6c5c6a1d0119b687a1@syzkaller.appspotmail.com
Reported-by: syzbot+8245611446194a52150d@syzkaller.appspotmail.com
Reported-by: syzbot+1aa62e6852a6ad1c7944@syzkaller.appspotmail.com
Reported-by: syzbot+54e6c2176ba76c56217e@syzkaller.appspotmail.com
Signed-off-by: David Howells <dhowells@redhat.com>
cc: Marc Dionne <marc.dionne@auristor.com>
cc: linux-afs@lists.infradead.org
cc: linux-fsdevel@vger.kernel.org
---
 fs/afs/dynroot.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

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

