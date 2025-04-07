Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06FE0207A30
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 16:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744042356; cv=none; b=bZiqt65G5nvoHeVgl1qdn6xYiz8QvLxxTyVbvSjMRFBSY0jdmlcGKjabOl2nUaCePv+gX+Bjy6cyLCy99dfbV2P8tjyFBQg8wBRrW6Mj83d4HGg7PstwmmcSc17EGIpqHbJTjHw4jhiKY3rWyI8cmIQz7NkCQ+t0+aOMyttstqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744042356; c=relaxed/simple;
	bh=n7LDGR27vYLfSDjlfTUMa0tQbf37kdhm3hYRA+Nj2dA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KmuGOwGyhpxHq3ZPPHv8MPQCFm+bN1nL/MfaI1iiDmIQl/+Zfunzfbt2c8beJCwiHxlTZwBSQFpyR4cjX1XB+KvNI3q2ii/4pv6Vkvy5+xRbDfJRCFtpMq3MmBxvDIxPUDEgDzHwusEfy4UQR0PJ8j795hDJQZUd4+r+uh4Ctdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Jl2vPf6Q; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Jl2vPf6Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744042354;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LHMFMloSTeUt/gl7uds8smIeNXzoMf2jjx9jl0chaxg=;
	b=Jl2vPf6QadrmJw2h0It4AW8gjC+klX7b9JEeNAyBbeTch9QMrm2aa3ZF+ZlR/PBqiXBKpV
	R3+g5Xt5/HPK8pAMHpjdqPgvo2KPCu0qINQ6VL6UhS1LW8N+2IuWePxy+KN97Cw97YmeDU
	3pdnPHo6sCm38YBHUzNdlHyn6ZXK96E=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-544-X9B9ikp7MU6hQjDJd5VbTg-1; Mon,
 07 Apr 2025 12:12:30 -0400
X-MC-Unique: X9B9ikp7MU6hQjDJd5VbTg-1
X-Mimecast-MFC-AGG-ID: X9B9ikp7MU6hQjDJd5VbTg_1744042348
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C73BF195608A;
	Mon,  7 Apr 2025 16:12:28 +0000 (UTC)
Received: from warthog.procyon.org.com (unknown [10.42.28.40])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 822FD19560AD;
	Mon,  7 Apr 2025 16:12:25 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: netdev@vger.kernel.org
Cc: David Howells <dhowells@redhat.com>,
	Marc Dionne <marc.dionne@auristor.com>,
	Jakub Kicinski <kuba@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	Chuck Lever <chuck.lever@oracle.com>,
	linux-afs@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v2 10/13] rxrpc: Display security params in the afs_cb_call tracepoint
Date: Mon,  7 Apr 2025 17:11:23 +0100
Message-ID: <20250407161130.1349147-11-dhowells@redhat.com>
In-Reply-To: <20250407161130.1349147-1-dhowells@redhat.com>
References: <20250407161130.1349147-1-dhowells@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40

Make the afs_cb_call tracepoint display some security parameters to make
debugging easier.

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
 Documentation/networking/rxrpc.rst |  1 +
 fs/afs/internal.h                  |  2 ++
 fs/afs/rxrpc.c                     |  4 ++++
 include/net/af_rxrpc.h             |  2 ++
 include/trace/events/afs.h         | 11 +++++++++--
 net/rxrpc/ar-internal.h            |  1 +
 net/rxrpc/call_object.c            | 20 ++++++++++++++++++++
 net/rxrpc/rxgk.c                   |  2 ++
 8 files changed, 41 insertions(+), 2 deletions(-)

diff --git a/Documentation/networking/rxrpc.rst b/Documentation/networking/rxrpc.rst
index a01f0c81ca4b..fe2ea73be441 100644
--- a/Documentation/networking/rxrpc.rst
+++ b/Documentation/networking/rxrpc.rst
@@ -1178,6 +1178,7 @@ API Function Reference
 ======================
 
 .. kernel-doc:: net/rxrpc/af_rxrpc.c
+.. kernel-doc:: net/rxrpc/call_object.c
 .. kernel-doc:: net/rxrpc/key.c
 .. kernel-doc:: net/rxrpc/oob.c
 .. kernel-doc:: net/rxrpc/peer_object.c
diff --git a/fs/afs/internal.h b/fs/afs/internal.h
index b3612b700c6a..178804817efb 100644
--- a/fs/afs/internal.h
+++ b/fs/afs/internal.h
@@ -176,8 +176,10 @@ struct afs_call {
 	bool			intr;		/* T if interruptible */
 	bool			unmarshalling_error; /* T if an unmarshalling error occurred */
 	bool			responded;	/* Got a response from the call (may be abort) */
+	u8			security_ix;	/* Security class */
 	u16			service_id;	/* Actual service ID (after upgrade) */
 	unsigned int		debug_id;	/* Trace ID */
+	u32			enctype;	/* Security encoding type */
 	u32			operation_ID;	/* operation ID for an incoming call */
 	u32			count;		/* count for use in unmarshalling */
 	union {					/* place to extract temporary data */
diff --git a/fs/afs/rxrpc.c b/fs/afs/rxrpc.c
index 212af2aa85bf..00b3bc087f61 100644
--- a/fs/afs/rxrpc.c
+++ b/fs/afs/rxrpc.c
@@ -813,6 +813,10 @@ static int afs_deliver_cm_op_id(struct afs_call *call)
 	if (!afs_cm_incoming_call(call))
 		return -ENOTSUPP;
 
+	call->security_ix = rxrpc_kernel_query_call_security(call->rxcall,
+							     &call->service_id,
+							     &call->enctype);
+
 	trace_afs_cb_call(call);
 	call->work.func = call->type->work;
 
diff --git a/include/net/af_rxrpc.h b/include/net/af_rxrpc.h
index 0b209f703ffc..f15341594cc8 100644
--- a/include/net/af_rxrpc.h
+++ b/include/net/af_rxrpc.h
@@ -112,5 +112,7 @@ int rxkad_kernel_respond_to_challenge(struct sk_buff *challenge);
 u32 rxgk_kernel_query_challenge(struct sk_buff *challenge);
 int rxgk_kernel_respond_to_challenge(struct sk_buff *challenge,
 				     struct krb5_buffer *appdata);
+u8 rxrpc_kernel_query_call_security(struct rxrpc_call *call,
+				    u16 *_service_id, u32 *_enctype);
 
 #endif /* _NET_RXRPC_H */
diff --git a/include/trace/events/afs.h b/include/trace/events/afs.h
index 8857f5ea77d4..7f83d242c8e9 100644
--- a/include/trace/events/afs.h
+++ b/include/trace/events/afs.h
@@ -663,19 +663,26 @@ TRACE_EVENT(afs_cb_call,
 		    __field(unsigned int,		call)
 		    __field(u32,			op)
 		    __field(u16,			service_id)
+		    __field(u8,				security_ix)
+		    __field(u32,			enctype)
 			     ),
 
 	    TP_fast_assign(
 		    __entry->call	= call->debug_id;
 		    __entry->op		= call->operation_ID;
 		    __entry->service_id	= call->service_id;
+		    __entry->security_ix = call->security_ix;
+		    __entry->enctype	= call->enctype;
 			   ),
 
-	    TP_printk("c=%08x %s",
+	    TP_printk("c=%08x %s sv=%u sx=%u en=%u",
 		      __entry->call,
 		      __entry->service_id == 2501 ?
 		      __print_symbolic(__entry->op, yfs_cm_operations) :
-		      __print_symbolic(__entry->op, afs_cm_operations))
+		      __print_symbolic(__entry->op, afs_cm_operations),
+		      __entry->service_id,
+		      __entry->security_ix,
+		      __entry->enctype)
 	    );
 
 TRACE_EVENT(afs_call,
diff --git a/net/rxrpc/ar-internal.h b/net/rxrpc/ar-internal.h
index d23ea4710cb2..767aed319fca 100644
--- a/net/rxrpc/ar-internal.h
+++ b/net/rxrpc/ar-internal.h
@@ -740,6 +740,7 @@ struct rxrpc_call {
 	u32			call_id;	/* call ID on connection  */
 	u32			cid;		/* connection ID plus channel index */
 	u32			security_level;	/* Security level selected */
+	u32			security_enctype; /* Security-specific encoding type (or 0) */
 	int			debug_id;	/* debug ID for printks */
 	unsigned short		rx_pkt_offset;	/* Current recvmsg packet offset */
 	unsigned short		rx_pkt_len;	/* Current recvmsg packet len */
diff --git a/net/rxrpc/call_object.c b/net/rxrpc/call_object.c
index a4fedf639396..6f1815e4d69d 100644
--- a/net/rxrpc/call_object.c
+++ b/net/rxrpc/call_object.c
@@ -760,3 +760,23 @@ void rxrpc_destroy_all_calls(struct rxrpc_net *rxnet)
 	atomic_dec(&rxnet->nr_calls);
 	wait_var_event(&rxnet->nr_calls, !atomic_read(&rxnet->nr_calls));
 }
+
+/**
+ * rxrpc_kernel_query_call_security - Query call's security parameters
+ * @call: The call to query
+ * @_service_id: Where to return the service ID
+ * @_enctype: Where to return the "encoding type"
+ *
+ * This queries the security parameters of a call, setting *@_service_id and
+ * *@_enctype and returning the security class.
+ *
+ * Return: The security class protocol number.
+ */
+u8 rxrpc_kernel_query_call_security(struct rxrpc_call *call,
+				    u16 *_service_id, u32 *_enctype)
+{
+	*_service_id = call->dest_srx.srx_service;
+	*_enctype = call->security_enctype;
+	return call->security_ix;
+}
+EXPORT_SYMBOL(rxrpc_kernel_query_call_security);
diff --git a/net/rxrpc/rxgk.c b/net/rxrpc/rxgk.c
index 8b1ccdf8bc58..6175fc54ba90 100644
--- a/net/rxrpc/rxgk.c
+++ b/net/rxrpc/rxgk.c
@@ -443,6 +443,7 @@ static int rxgk_secure_packet(struct rxrpc_call *call, struct rxrpc_txbuf *txb)
 	if (ret < 0)
 		return ret;
 
+	call->security_enctype = gk->krb5->etype;
 	txb->cksum = htons(gk->key_number);
 
 	switch (call->conn->security_level) {
@@ -590,6 +591,7 @@ static int rxgk_verify_packet(struct rxrpc_call *call, struct sk_buff *skb)
 		}
 	}
 
+	call->security_enctype = gk->krb5->etype;
 	switch (call->conn->security_level) {
 	case RXRPC_SECURITY_PLAIN:
 		return 0;

