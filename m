Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D28FF1C5F14
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 10:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751883889; cv=none; b=uraiMm4/0Py/cF1IiCOuIc1rSVBi8Wwp/2EwqMfxmsthOLNkLZvHRsNEFfT3uOF6UUtI15Dh5HFOQIZmLNjnuoVnGiQPY/JR/P/LFJr6dwb5r/hOg9hfKMrpgISXKS0rrIZjqyHi1NjeFIG+M/0It/zvGkDDgIysjic0+HagN+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751883889; c=relaxed/simple;
	bh=MLJFXdV+zNK1ZuhNtUUtW5D8Mcd2Km3jyqtOGr/sR8A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jtqo4Bll5iRU3gaCbtuQkf0IxnKAlpSWug5YjEz6/Xxj9Ou6l2RDmG6LhO6EZOAy9qXZi+JsU4QpHslCMkVp0PuD6/hxIujMm7BW70P3Ij9EHNIqbfAYjUmZh4uW+rfU1NHn+IppTYmmVTlDL9iXe37D5CWOUSPth0EC0dJlRcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NdhquR7G; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NdhquR7G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751883886;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=jKrMSwx0A9Y2yayFOqoqu96ALKC9wDHuSwf+9nBv8n4=;
	b=NdhquR7GUONabPOwXkKhGDP5+fQyjH0KvFuX2ER3hzy2tu409J1mlkfxS1AoKWY30qgvdR
	riIYY1TOBzcloTfM+Qwv/7BJAIeWF47k/r9r99ry1AEIzjy///qdDBhsoNkIqYSXO9gSeS
	V3T2At1VOBI3sShTITZM1HtaofDpLsE=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-114-BBBVyMfnPUS8bfUNDnGgNQ-1; Mon,
 07 Jul 2025 06:24:44 -0400
X-MC-Unique: BBBVyMfnPUS8bfUNDnGgNQ-1
X-Mimecast-MFC-AGG-ID: BBBVyMfnPUS8bfUNDnGgNQ_1751883883
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id CD203180029E;
	Mon,  7 Jul 2025 10:24:42 +0000 (UTC)
Received: from warthog.procyon.org.com (unknown [10.42.28.81])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 85F6C195608F;
	Mon,  7 Jul 2025 10:24:39 +0000 (UTC)
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
Subject: [PATCH net 0/2] rxrpc: Miscellaneous fixes
Date: Mon,  7 Jul 2025 11:24:32 +0100
Message-ID: <20250707102435.2381045-1-dhowells@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

Here are some miscellaneous fixes for rxrpc:

 (1) Fix a warning about over-large frame size in rxrpc_send_response().

 (2) Fix assertion failure due to preallocation collision.

David

The patches can be found here also:

	http://git.kernel.org/cgit/linux/kernel/git/dhowells/linux-fs.git/log/?h=rxrpc-fixes

David Howells (2):
  rxrpc: Fix over large frame size warning
  rxrpc: Fix bug due to prealloc collision

 net/rxrpc/ar-internal.h | 15 +++++++++------
 net/rxrpc/call_accept.c |  2 ++
 net/rxrpc/output.c      |  5 ++++-
 3 files changed, 15 insertions(+), 7 deletions(-)

