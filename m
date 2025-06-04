Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3602818E1F
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 14:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749048976; cv=none; b=dpEyhffypelYu+rD4R0/raermIq5Egh+PYyyCeAVNy5yWrFPnW2a/i4X4wR/UbJ1tyd8DNSoF8O3HdRhjkIlU6VAqYaQbxsBMHB0TYZ295NKu/cTaKM+74BklTm0f9HO0ufVghQfOb3HFdG+ujl+NjBDoZslUg2pm6Q0c7bPT5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749048976; c=relaxed/simple;
	bh=7QokJdcqmNVhOdBHvR2ZqEXOlnZq2JyXuqgX7+oE/ZY=;
	h=From:In-Reply-To:References:To:Cc:Subject:MIME-Version:
	 Content-Type:Date:Message-ID; b=hxnG1K9aiI5AHgEXWswsjNGmyYq3dIbq7/BR1ua2+72CyqrrICtCua0SC5bINydoY4guIZdJyX+Ywi9ldlDSUARObZMuhiPTq75S/wbmj+EwEgRfb9vA4F4DilpV7UstW5kaISSViI9SIa64f9XwcbeqswOCIaEIl8KLNQzENcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JQj00Jkn; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JQj00Jkn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749048974;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Z2h/EO0JQWU8btMtwutjXCkhqTordcpnOBoYcUhw0Ow=;
	b=JQj00JknTHh2UtFxTIWQ2Xsq3V8VGNbfyAZ+6tzWL9T11SKmHsocn81jGt7uuTs+oDud3X
	cwxacpWRfutF32QHQnfbJ+fXfRGjEjrKsxYfOPqFmMtpZRNd5A6WzNHrXBoMm8sQiDZAFE
	/mDUcaqjyv/lSzLUo9wj0npH+hd9/xI=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-381-KRYDtLh5ML2VEw7kggBwTQ-1; Wed,
 04 Jun 2025 10:56:09 -0400
X-MC-Unique: KRYDtLh5ML2VEw7kggBwTQ-1
X-Mimecast-MFC-AGG-ID: KRYDtLh5ML2VEw7kggBwTQ_1749048968
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 09F181801BE9;
	Wed,  4 Jun 2025 14:56:08 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.2])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id D591E180045C;
	Wed,  4 Jun 2025 14:56:03 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <aDnTsvbyKCTkZbOR@mini-arch>
References: <aDnTsvbyKCTkZbOR@mini-arch> <770012.1748618092@warthog.procyon.org.uk>
To: Stanislav Fomichev <stfomichev@gmail.com>
Cc: dhowells@redhat.com, Mina Almasry <almasrymina@google.com>,
    willy@infradead.org, hch@infradead.org,
    Jakub Kicinski <kuba@kernel.org>, Eric Dumazet <edumazet@google.com>,
    netdev@vger.kernel.org, linux-mm@kvack.org,
    linux-kernel@vger.kernel.org
Subject: Re: Device mem changes vs pinning/zerocopy changes
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1097884.1749048961.1@warthog.procyon.org.uk>
Date: Wed, 04 Jun 2025 15:56:01 +0100
Message-ID: <1097885.1749048961@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

Stanislav Fomichev <stfomichev@gmail.com> wrote:

> >  (1) Separate fragment lifetime management from sk_buff.  No more wangling
> >      of refcounts in the skbuff code.  If you clone an skb, you stick an
> >      extra ref on the lifetime management struct, not the page.
> 
> For device memory TCP we already have this: net_devmem_dmabuf_binding
> is the owner of the frags. And when we reference skb frag we reference
> only this owner, not individual chunks: __skb_frag_ref -> get_netmem ->
> net_devmem_get_net_iov (ref on the binding).
>
> Will it be possible to generalize this to cover MSG_ZEROCOPY and splice
> cases? From what I can tell, this is somewhat equivalent of your net_txbuf.

Yes and no.  The net_devmem stuff that's now upstream still manages refs on a
per-skb-frag basis.  What I'm looking to do is to move it out of the skb and
into a separate struct so that the ref on a chunk of memory can be shared
between several skb-frags, quite possibly spread between several skbs.

This is especially important for various types of zerocopy memory where we
won't actually be allowed to take refs.

David

