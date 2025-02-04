Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E67CF21C9E7
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 23:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738710379; cv=none; b=Aj/hDAeYqZqSnliN9JIj1/uvcj8ndma0vKu+J8jtiSj8N+aw3Ne/7kq2WVJ98XOTBI9coUQGWl6LS3/yKGNoziNCEjLXKtvWANmm+XuLOcKd9wrjVkX1dxRKikoaHskKG9oeusaSnTaJrUtQj57ex89630YthxwTtAjAneIK1nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738710379; c=relaxed/simple;
	bh=fO3MSMBT+/kKOjgT0rPbWsRz/v+oC0iaWzIS2X1U2ic=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=H7hP1CBkHukWEinNOdoGSv0JutknV75cWStat+K/+Bfr892skg+9dIp2pCob0pk25hzjppnZ6R40ZxRzQan/XkT1yxPwhDNd8qvdWl0AWqduHL/UbB5u2qUZa3vhUlQxs9aC9aXry/ceiXd3B/56uraNHE0actYdNumrIGxIhOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LYwWWxiT; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LYwWWxiT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738710375;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=AGtjtx0Fod8+6Bb8pLF3fJZJHzb7EY9ubXAdn4oUZ7E=;
	b=LYwWWxiTSWRhs67ajO5bcFDAuN3wp/CbtKIjTi64F0heTJr2JPQrXWqp/mXcNaflP3PKuA
	MZRiypir8obXAPfnoEqXdgahtE0DrA0/RxOJElKmoTxDOdG9AOl8TJyvHphqEtYqbzNskt
	hV7QVRYBMRjh6lvCV2SvUfuZZbzKju4=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-363-K4Z-Kv5xPHqVDjUBaKKTow-1; Tue,
 04 Feb 2025 18:06:10 -0500
X-MC-Unique: K4Z-Kv5xPHqVDjUBaKKTow-1
X-Mimecast-MFC-AGG-ID: K4Z-Kv5xPHqVDjUBaKKTow
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 335141800370;
	Tue,  4 Feb 2025 23:06:09 +0000 (UTC)
Received: from warthog.procyon.org.com (unknown [10.42.28.92])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 6671119560A7;
	Tue,  4 Feb 2025 23:06:06 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: netdev@vger.kernel.org
Cc: David Howells <dhowells@redhat.com>,
	Marc Dionne <marc.dionne@auristor.com>,
	Jakub Kicinski <kuba@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-afs@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v2 0/2] rxrpc: Call state fixes
Date: Tue,  4 Feb 2025 23:05:52 +0000
Message-ID: <20250204230558.712536-1-dhowells@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

Here some call state fixes for AF_RXRPC.

 (1) Fix the state of a call to not treat the challenge-response cycle as
     part of an incoming call's state set.  The problem is that it makes
     handling received of the final packet in the receive phase difficult
     as that wants to change the call state - but security negotiations may
     not yet be complete.

 (2) Fix a race between the changing of the call state at the end of the
     request reception phase of a service call, recvmsg() collecting the last
     data and sendmsg() trying to send the reply before the I/O thread has
     advanced the call state.

David

---

Changes
=======
ver #2)
 - This was previously posted here[1] as patch 1, but I split out the broken
   race fix, leaving the rest in the new patch 1 here.  The race fix was
   itself fixed and placed into the new patch 2.

The patches can be found here also:

	http://git.kernel.org/cgit/linux/kernel/git/dhowells/linux-fs.git/log/?h=rxrpc-fixes

Link: https://lore.kernel.org/r/20250203110307.7265-2-dhowells@redhat.com/ [1]

David Howells (2):
  rxrpc: Fix call state set to not include the SERVER_SECURING state
  rxrpc: Fix race in call state changing vs recvmsg()

 net/rxrpc/ar-internal.h |  2 +-
 net/rxrpc/call_object.c |  6 ++----
 net/rxrpc/conn_event.c  |  4 +---
 net/rxrpc/input.c       | 12 ++++++++++--
 net/rxrpc/sendmsg.c     |  2 +-
 5 files changed, 15 insertions(+), 11 deletions(-)

