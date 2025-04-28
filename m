Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEC1B25D8F7
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 15:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745855599; cv=none; b=KE1qtD0YeK5zXjFOVd5Vx96fTlBLiuYyczClobmMJwJ+Zjp1tU+UQxNFbxzv3q1h9/kSXJ9evIXMhGBTm5hG8+ncJMF/URssF7U+wCSf6E3I9Rg1MTsmi9t2qgaGro4goD7iFIFX4Vle5nbOAiAnncyGL+Yhk9xnL6ELSwes0yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745855599; c=relaxed/simple;
	bh=5cYNNf4wFqNqtaNOjGR5cKHx09Edg/U4QkNplcm9KN0=;
	h=From:In-Reply-To:References:To:Cc:Subject:MIME-Version:
	 Content-Type:Date:Message-ID; b=URBScAu6uUnJjtKrKM+Bw+4enbUBjF24PY0Ftyk60P+6bjBiwrdwfsct2vzGVtApeRRz22Gn4oG5TBWP32szMj9+xjxtfi+J9Atd64LGCax8SU4uIpuhyaaVIF51zjr5jR/eUiZJlVn8PnR3ddFdVq71+e31eOjtuxwYC7yTUSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ENr6ALrE; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ENr6ALrE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745855595;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yFNAMhuU+PWVZiK9ijY/9ml9G6ViTLQrWpp9ndl8SK4=;
	b=ENr6ALrESh8YSU71DB7KFnO3uMgTp+dNSvIY7vudIBd7yzD+mFMj/+uhH211vXuSeNi/vD
	CYi5c54AYrKMstj1wgkYvzR8Ll8AC5H6KyDCX0a947GZtvaA8LGKVhJoCkfU3iw05C95t7
	CrrWbfcHMWNW0fHTC+nNF7iH9/XYqdU=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-594-cV2W3rH7O5-TbKlPdw-rTg-1; Mon,
 28 Apr 2025 11:53:14 -0400
X-MC-Unique: cV2W3rH7O5-TbKlPdw-rTg-1
X-Mimecast-MFC-AGG-ID: cV2W3rH7O5-TbKlPdw-rTg_1745855593
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5639919560B1;
	Mon, 28 Apr 2025 15:53:13 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.188])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 49648180045C;
	Mon, 28 Apr 2025 15:53:12 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20250428131149.3195399-1-max.kellermann@ionos.com>
References: <20250428131149.3195399-1-max.kellermann@ionos.com>
To: Max Kellermann <max.kellermann@ionos.com>
Cc: dhowells@redhat.com, netfs@lists.linux.dev,
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH] fs/netfs: remove unused netfs_io_request flags
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <88830.1745855591.1@warthog.procyon.org.uk>
Date: Mon, 28 Apr 2025 16:53:11 +0100
Message-ID: <88831.1745855591@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

Max Kellermann <max.kellermann@ionos.com> wrote:

> NETFS_RREQ_DONT_UNLOCK_FOLIOS has never been used ever since it was
> added by commit 3d3c95046742 ("netfs: Provide readahead and readpage
> netfs helpers").

I'm fine with removing DONT_UNLOCK_FOLIOS.

> NETFS_RREQ_BLOCKED was added by commit 016dc8516aec ("netfs: Implement
> unbuffered/DIO read support") but has never been used either.  Without
> NETFS_RREQ_BLOCKED, NETFS_RREQ_NONBLOCK makes no sense, and thus can
> be removed as well.

I'm less fine with removing the NONBLOCK handling I might need it for the ceph
conversion, so I think I'll split the patch in two.

David

