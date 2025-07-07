Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 961741C5F14
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 10:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751883894; cv=none; b=B5dHbdXAjPS6TR1e9T1APxKhGU6ec86+vCSkpsixHTH9oXFoTKH6cyfm5weQ74YpTtf/Z6PLlSRongNwDCn4TM3rBZeg74+979KceqCu5j3/YB+vxruT4/hSs1hNgbp3ULAqrl6DM1pdliIZd9cbd+VokzHwl2UFg/DwHr/qhmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751883894; c=relaxed/simple;
	bh=5hUESjLxUFC1ShxxEVQTV2GFkVfPYLnwrUSx57ytBxc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A3nQpo6MoQqOBF+7ZYTmcVLL5eT5XOPoYZCDYkYx7hsDeSJ7xjpIgt1Jv1YU6VIUsj4ItDOpHjcQPnYzbwPCQumZ3qgGzic6XRoLk5QbFZ56HsYNAA7at33SO26lyECciyrP0op7V6blNEb6uec2ccKDV7DAhHYQpHjSyKLtZGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=J4hMpvAX; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="J4hMpvAX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751883891;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=41yP/MGOPD24t3eqgJmcH7ObsMSXti+X7G8qHnMnBMY=;
	b=J4hMpvAXYjRIhuvLjSpgMkjuIsN/UCPf2wz5PitgZ01iIUfJI/NWs89sDIvC/lSM4joSDs
	HhjIVWrxX1mdBUHt/XvKNopVHu0ojpVvE6ozaxQUU3Igcu9Qx9dUBSvrDhblEF0T98OkHE
	vNcAquD+jVJdcvPwEl6Sz62IvAXJw6Y=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-228-qLoPwFUNNhCbufjI6_0h4Q-1; Mon,
 07 Jul 2025 06:24:49 -0400
X-MC-Unique: qLoPwFUNNhCbufjI6_0h4Q-1
X-Mimecast-MFC-AGG-ID: qLoPwFUNNhCbufjI6_0h4Q_1751883888
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A11B91944AA6;
	Mon,  7 Jul 2025 10:24:47 +0000 (UTC)
Received: from warthog.procyon.org.com (unknown [10.42.28.81])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 5C3D4180045C;
	Mon,  7 Jul 2025 10:24:44 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: netdev@vger.kernel.org
Cc: David Howells <dhowells@redhat.com>,
	Marc Dionne <marc.dionne@auristor.com>,
	Jakub Kicinski <kuba@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-afs@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>,
	Simon Horman <horms@kernel.org>
Subject: [PATCH net 1/2] rxrpc: Fix over large frame size warning
Date: Mon,  7 Jul 2025 11:24:33 +0100
Message-ID: <20250707102435.2381045-2-dhowells@redhat.com>
In-Reply-To: <20250707102435.2381045-1-dhowells@redhat.com>
References: <20250707102435.2381045-1-dhowells@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

Under some circumstances, the compiler will emit the following warning for
rxrpc_send_response():

   net/rxrpc/output.c: In function 'rxrpc_send_response':
   net/rxrpc/output.c:974:1: warning: the frame size of 1160 bytes is larger than 1024 bytes

This occurs because the local variables include a 16-element scatterlist
array and a 16-element bio_vec array.  It's probably not actually a problem
as this function is only called by the rxrpc I/O thread function in a
kernel thread and there won't be much on the stack before it.

Fix this by overlaying the bio_vec array over the kvec array in the
rxrpc_local struct.  There is one of these per I/O thread and the kvec
array is intended for pointing at bits of a packet to be transmitted,
typically a DATA or an ACK packet.  As packets for a local endpoint are
only transmitted by its specific I/O thread, there can be no race, and so
overlaying this bit of memory should be no problem.

Fixes: 5800b1cf3fd8 ("rxrpc: Allow CHALLENGEs to the passed to the app for a RESPONSE")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202506240423.E942yKJP-lkp@intel.com/
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
 net/rxrpc/ar-internal.h | 15 +++++++++------
 net/rxrpc/output.c      |  5 ++++-
 2 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/net/rxrpc/ar-internal.h b/net/rxrpc/ar-internal.h
index 5bd3922c310d..376e33dce8c1 100644
--- a/net/rxrpc/ar-internal.h
+++ b/net/rxrpc/ar-internal.h
@@ -361,12 +361,15 @@ struct rxrpc_local {
 	struct list_head	new_client_calls; /* Newly created client calls need connection */
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
 
 /*
diff --git a/net/rxrpc/output.c b/net/rxrpc/output.c
index 0af19bcdc80a..ef7b3096c95e 100644
--- a/net/rxrpc/output.c
+++ b/net/rxrpc/output.c
@@ -924,7 +924,7 @@ void rxrpc_send_response(struct rxrpc_connection *conn, struct sk_buff *response
 {
 	struct rxrpc_skb_priv *sp = rxrpc_skb(response);
 	struct scatterlist sg[16];
-	struct bio_vec bvec[16];
+	struct bio_vec *bvec = conn->local->bvec;
 	struct msghdr msg;
 	size_t len = sp->resp.len;
 	__be32 wserial;
@@ -938,6 +938,9 @@ void rxrpc_send_response(struct rxrpc_connection *conn, struct sk_buff *response
 	if (ret < 0)
 		goto fail;
 	nr_sg = ret;
+	ret = -EIO;
+	if (WARN_ON_ONCE(nr_sg > ARRAY_SIZE(conn->local->bvec)))
+		goto fail;
 
 	for (int i = 0; i < nr_sg; i++)
 		bvec_set_page(&bvec[i], sg_page(&sg[i]), sg[i].length, sg[i].offset);

