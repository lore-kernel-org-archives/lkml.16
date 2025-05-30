Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85B10221566
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 09:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748597587; cv=none; b=AtywJwGN9ZeIw31znCKp8hYZX4qiFCniohWFK5w/ZDSq0DUoiVqkRP/CK7aR58NiEtdRkCp/zRwSgXNl3mjtKZPgVdOelkiS8ojhEqlPTI1KpYg7m46qQQEU7g06Nfn6HMoY/PY9UyNKBqVbfLG0JQisAsTUgw0xO/2TeLG0NmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748597587; c=relaxed/simple;
	bh=HWBJBkrabhiA7Ms8ILFCAOOED9oIjHs3RLCzQ5lxjLQ=;
	h=From:In-Reply-To:References:To:Cc:Subject:MIME-Version:
	 Content-Type:Date:Message-ID; b=maIVeyWRXAOagonsXT1x8ZyLFdva+bNdfVxv/LS7ozae3rTMZ2VPrrhP3YTKm+iE7dFanJKWhrUHECdf/eSYJNnKcVax3UmgnTT1kyu87Aj/YMCbSS5lpXHY8I3z1OE7oHhlZC+mxW7fszNFRHyHGq7p6iwIGRgM0DVgiTY2rLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RRJ8MM+W; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RRJ8MM+W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748597584;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=htv9cZewB1UVDzHczYFZHahQGakMX4ZHGulof9YJI7w=;
	b=RRJ8MM+Wwo7VQjqzXqXnKyPf+6qlFPlqceBxkBC9DJUjeqRdv+tzPs74KTUqPU3bwBRHVF
	we0vEUpsAWD8UyIaAnwkE7lqc1K8JmhChTG3FdtNTCfe4oebnznSXyRuzKC1gMAHJshsK2
	AP00fZkGY0EUGyz3bjHUpnZVjlGqgXE=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-154-IQ9cafIjNpmDcy6ghYPVkA-1; Fri,
 30 May 2025 05:32:58 -0400
X-MC-Unique: IQ9cafIjNpmDcy6ghYPVkA-1
X-Mimecast-MFC-AGG-ID: IQ9cafIjNpmDcy6ghYPVkA_1748597576
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3A80A18001EA;
	Fri, 30 May 2025 09:32:56 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.2])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 136BD19560A7;
	Fri, 30 May 2025 09:32:53 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20250527084916.1699109-1-suhui@nfschina.com>
References: <20250527084916.1699109-1-suhui@nfschina.com>
To: Su Hui <suhui@nfschina.com>
Cc: dhowells@redhat.com, marc.dionne@auristor.com,
    linux-afs@lists.infradead.org, linux-kernel@vger.kernel.org,
    kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] afs: Replace simple_strtoul with kstrtoul in afs_parse_address
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <685977.1748597572.1@warthog.procyon.org.uk>
Date: Fri, 30 May 2025 10:32:52 +0100
Message-ID: <685978.1748597572@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

Su Hui <suhui@nfschina.com> wrote:

> kstrtoul() is better because simple_strtoul() ignores overflow which
> may lead to unexpected results.

Overflow in what sense?  Are we talking about a mathematical overflow or not
checking the text beyond the end of the number?

David

