Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E6221ABED9
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 09:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751275052; cv=none; b=oVIEulc9YbICDwbuhrTSxFu7uQK8oQdtVi4ollFzeTjFn6P55MHBxesdE3K2C4oFXH92Ehq+sI0VtAxV0LpcR5Bi92lezdbzAwtr6gzrKZUtvsCoKdWOhDCcQTQlFan9jY6+C1Fy7A3ZIR4WSeELxI0H9CoDLpfRCFfPmdqHxCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751275052; c=relaxed/simple;
	bh=T1XYIsANHmz/Er/skgggm0k+2uqncTh2t0Q1H95EGA0=;
	h=From:In-Reply-To:References:To:Cc:Subject:MIME-Version:
	 Content-Type:Date:Message-ID; b=FxR/9vOa6muSLRQvfVo13E6FCZZ8xk7ecQuIrEdTLZDFtI6rbidlFb2T9Z8e0gNI4Zbccp6Z06chWB/FcqVu1W6NJqu7nvBmkApdguYMFwFN+BjfnahosfGc/sh150Px3kaB1Rj5ZnEn+JwD4+YHCuxz17fmJ3N6aeMH+dhwRus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OkJdRHpU; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OkJdRHpU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751275049;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rTeBvWfbV+enSzDAScZMGtwtYcy8ru7yyyyPelAWiW8=;
	b=OkJdRHpU+hJRZ6eYjSXyimYlWZRJXzVBBVeEViZLc6RVqA4ZQpKRIq94xOmX4orMqkcz3b
	BxCmogmhyD6PgkVR366WdtOoopyqwPC2Hzw5s2PzxVEV93ZCj6XfjQBSKJmeTY+Nlk43ao
	H+oqe7eBa0rdTolMgSPnT9/kqtcpRU8=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-562-HmTcXydwPBKdPONEwzT0Sg-1; Mon,
 30 Jun 2025 05:17:23 -0400
X-MC-Unique: HmTcXydwPBKdPONEwzT0Sg-1
X-Mimecast-MFC-AGG-ID: HmTcXydwPBKdPONEwzT0Sg_1751275042
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 42F461978F61;
	Mon, 30 Jun 2025 09:17:22 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.81])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 783FF180045C;
	Mon, 30 Jun 2025 09:17:20 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <202506240423.E942yKJP-lkp@intel.com>
References: <202506240423.E942yKJP-lkp@intel.com>
To: kernel test robot <lkp@intel.com>
Cc: dhowells@redhat.com, oe-kbuild-all@lists.linux.dev,
    linux-kernel@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>
Subject: Re: net/rxrpc/output.c:974:1: warning: the frame size of 1160 bytes is larger than 1024 bytes
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1859690.1751275037.1@warthog.procyon.org.uk>
Content-Transfer-Encoding: quoted-printable
Date: Mon, 30 Jun 2025 10:17:19 +0100
Message-ID: <1859693.1751275039@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

I think the attached patch should fix this.

David
---
rxrpc: Fix over large frame size warning

Under some circumstances, the compiler will emit the following warning for
rxrpc_send_response():

   net/rxrpc/output.c: In function 'rxrpc_send_response':
   net/rxrpc/output.c:974:1: warning: the frame size of 1160 bytes is larg=
er than 1024 bytes

This occurs because the local variables include a 16-element scatterlist
array and a 16-element bio_vec array.  It's probably not actually a proble=
m
as this function is only called by the rxrpc I/O thread function in a
kernel thread and there won't be much on the stack before it.

Fix this by overlaying the bio_vec array over the kvec array in the
rxrpc_local struct.  There is one of these per I/O thread and the kvec
array is intended for pointing at bits of a packet to be transmitted,
typically a DATA or an ACK packet.  As packets for a local endpoint are
only transmitted by its specific I/O thread, there can be no race, and so
overlaying this bit of memory should be no problem.

Fixes: 5800b1cf3fd8 ("rxrpc: Allow CHALLENGEs to the passed to the app for=
 a RESPONSE")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202506240423.E942yKJP-lkp@in=
tel.com/
Signed-off-by: David Howells <dhowells@redhat.com>
cc: Marc Dionne <marc.dionne@auristor.com>
cc: "David S. Miller" <davem@davemloft.net>
cc: Eric Dumazet <edumazet@google.com>
cc: Jakub Kicinski <kuba@kernel.org>
cc: Paolo Abeni <pabeni@redhat.com>
cc: Simon Horman <horms@kernel.org>
cc: linux-afs@lists.infradead.org
cc: netdev@vger.kernel.org
---
 net/rxrpc/ar-internal.h |   15 +++++++++------
 net/rxrpc/output.c      |    5 ++++-
 2 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/net/rxrpc/ar-internal.h b/net/rxrpc/ar-internal.h
index 5bd3922c310d..376e33dce8c1 100644
--- a/net/rxrpc/ar-internal.h
+++ b/net/rxrpc/ar-internal.h
@@ -361,12 +361,15 @@ struct rxrpc_local {
 	struct list_head	new_client_calls; /* Newly created client calls need co=
nnection */
 	spinlock_t		client_call_lock; /* Lock for ->new_client_calls */
 	struct sockaddr_rxrpc	srx;		/* local address */
-	/* Provide a kvec table sufficiently large to manage either a DATA
-	 * packet with a maximum set of jumbo subpackets or a PING ACK padded
-	 * out to 64K with zeropages for PMTUD.
-	 */
-	struct kvec		kvec[1 + RXRPC_MAX_NR_JUMBO > 3 + 16 ?
-				     1 + RXRPC_MAX_NR_JUMBO : 3 + 16];
+	union {
+		/* Provide a kvec table sufficiently large to manage either a
+		 * DATA packet with a maximum set of jumbo subpackets or a PING
+		 * ACK padded out to 64K with zeropages for PMTUD.
+		 */
+		struct kvec		kvec[1 + RXRPC_MAX_NR_JUMBO > 3 + 16 ?
+					     1 + RXRPC_MAX_NR_JUMBO : 3 + 16];
+		struct bio_vec		bvec[3 + 16];
+	};
 };
 =

 /*
diff --git a/net/rxrpc/output.c b/net/rxrpc/output.c
index 0af19bcdc80a..ef7b3096c95e 100644
--- a/net/rxrpc/output.c
+++ b/net/rxrpc/output.c
@@ -924,7 +924,7 @@ void rxrpc_send_response(struct rxrpc_connection *conn=
, struct sk_buff *response
 {
 	struct rxrpc_skb_priv *sp =3D rxrpc_skb(response);
 	struct scatterlist sg[16];
-	struct bio_vec bvec[16];
+	struct bio_vec *bvec =3D conn->local->bvec;
 	struct msghdr msg;
 	size_t len =3D sp->resp.len;
 	__be32 wserial;
@@ -938,6 +938,9 @@ void rxrpc_send_response(struct rxrpc_connection *conn=
, struct sk_buff *response
 	if (ret < 0)
 		goto fail;
 	nr_sg =3D ret;
+	ret =3D -EIO;
+	if (WARN_ON_ONCE(nr_sg > ARRAY_SIZE(conn->local->bvec)))
+		goto fail;
 =

 	for (int i =3D 0; i < nr_sg; i++)
 		bvec_set_page(&bvec[i], sg_page(&sg[i]), sg[i].length, sg[i].offset);

