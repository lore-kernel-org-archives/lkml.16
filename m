Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61E9029DB8F
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 09:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744365267; cv=none; b=ipMS9hAcGeQ0CYQLGkcR88V6DQeTTUIF4mPTGnPylTC50dvAZpBYldXCJjTSxohL3kq5hmnxHo1jdIZVL43Pl868+xlIqSn7gBPaBIgBN7+baarCIzWvnMDlP1twdVUo8b8DNF2nGctnbqYTyq0aNDUDf3jwCNCmhi4znzCOtP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744365267; c=relaxed/simple;
	bh=ch48UdhWuT8SWvifvpBoUUbhqUrHmXOVmdglYfhBvvQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C4JJ4a+4LdbdmAXAGRbXiV2SF0xk5/wrlql2vWGc86GpbVvpZG72ky47WA2bbC6GOw8Y5jTikE1+mYmA+khONmRlt7A/mr6iZdId8L1Lfitv8mzGcdsplLcx/h4FRaUUCi06+ExfxW3B6HVMDBKEwEFx4uWv6RLDnQFwMooCaqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PoQNwBRl; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PoQNwBRl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744365265;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jzEigqIOHJRMdb46rL45wiYoxEm7HU5gJAjWBTHplLQ=;
	b=PoQNwBRliAaVf3406ltiA0WCZiwvCVjGMlN0G1xxKl13G2RqRZoA1qmJAQvUAYfulEV8ms
	YqiGAfwnu92e0fBVFEYzJn0Rk6aUQhD/PaKZLJAcpdIG21Qg326qwRP+QTiXjIdPyfFyfI
	b6YgQm8cdlL+0Ky//jq1qSsHCY15ODg=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-433-rUSEopSfOVi9EbBCGIbAUQ-1; Fri,
 11 Apr 2025 05:54:20 -0400
X-MC-Unique: rUSEopSfOVi9EbBCGIbAUQ-1
X-Mimecast-MFC-AGG-ID: rUSEopSfOVi9EbBCGIbAUQ_1744365258
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9B663188EA6F;
	Fri, 11 Apr 2025 09:54:03 +0000 (UTC)
Received: from warthog.procyon.org.com (unknown [10.42.28.40])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 824341956094;
	Fri, 11 Apr 2025 09:54:00 +0000 (UTC)
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
Subject: [PATCH net-next v3 10/14] rxrpc: Allow the app to store private data on peer structs
Date: Fri, 11 Apr 2025 10:52:55 +0100
Message-ID: <20250411095303.2316168-11-dhowells@redhat.com>
In-Reply-To: <20250411095303.2316168-1-dhowells@redhat.com>
References: <20250411095303.2316168-1-dhowells@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15

Provide a way for the application (e.g. the afs filesystem) to store
private data on the rxrpc_peer structs for later retrieval via the call
object.

This will allow afs to store a pointer to the afs_server object on the
rxrpc_peer struct, thereby obviating the need for afs to keep lookup tables
by which it can associate an incoming call with server that transmitted it.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Marc Dionne <marc.dionne@auristor.com>
cc: Jakub Kicinski <kuba@kernel.org>
cc: "David S. Miller" <davem@davemloft.net>
cc: Eric Dumazet <edumazet@google.com>
cc: Paolo Abeni <pabeni@redhat.com>
cc: Simon Horman <horms@kernel.org>
cc: linux-afs@lists.infradead.org
cc: netdev@vger.kernel.org
---
 net/rxrpc/oob.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/rxrpc/oob.c b/net/rxrpc/oob.c
index 3601022b9190..05ca9c1faa57 100644
--- a/net/rxrpc/oob.c
+++ b/net/rxrpc/oob.c
@@ -272,7 +272,7 @@ enum rxrpc_oob_type rxrpc_kernel_query_oob(struct sk_buff *oob,
 	switch (type) {
 	case RXRPC_OOB_CHALLENGE:
 		*_peer		= sp->chall.conn->peer;
-		*_peer_appdata	= 0; /* TODO: retrieve appdata */
+		*_peer_appdata	= sp->chall.conn->peer->app_data;
 		break;
 	default:
 		WARN_ON_ONCE(1);
@@ -347,7 +347,7 @@ void rxrpc_kernel_query_challenge(struct sk_buff *challenge,
 	struct rxrpc_skb_priv *sp = rxrpc_skb(challenge);
 
 	*_peer		= sp->chall.conn->peer;
-	*_peer_appdata	= 0; /* TODO: retrieve appdata */
+	*_peer_appdata	= sp->chall.conn->peer->app_data;
 	*_service_id	= sp->hdr.serviceId;
 	*_security_index = sp->hdr.securityIndex;
 }

