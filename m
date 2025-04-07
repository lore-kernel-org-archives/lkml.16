Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEB6320FA99
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 16:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744042916; cv=none; b=BkBxOF7u2QkplgUAvKQcNJ/BOotDVxCI13fiw8+nQSHHhftw9RsWXCxymXO08j883bJLhOtkjOcTqH4jFXGkOtNZSuu8p9xT5l0Jctbhl3FJ3UcxhhNKeFvKs5akNpbc+FQhoOb2czGtw/4TClsBtf4QaOCCMOiPWei9Z+nK9kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744042916; c=relaxed/simple;
	bh=zmJAQkrReTzw9Rja/ZkdJyHOJm3OjtPUHZhpo5Zp5cw=;
	h=From:In-Reply-To:References:To:Cc:Subject:MIME-Version:
	 Content-Type:Date:Message-ID; b=uYrS/y3FtsnDYbn5dNyaU5bYGpbAc2n1n6fK/F5tHCAv5cJVINTbVsIIWB6riu8kD068ZObUZa+cm6toEXlWfK1nnHnorAcPPGSQkMErbXqmfhh9kS2h2ZB4eFYe/qtlKEADzRGxM8WOfS/mcy812VjaAJyOrc2cGjy3Q7oRYKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cRBSIJIz; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cRBSIJIz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744042913;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OCNXBsMl8e9MqCq6tvl63EXz/2Zgney6pBqg4qpe7Pg=;
	b=cRBSIJIzQMEsWSXczNamHPJpR8ZeXWmGI6Y35H1QfAFlRs59leyvBPva37cmtjVbqexuHy
	CSZ1b4wX/Ej4XPg22Jd5F+KdRxNiazg3QMe1Of1GP8Bhosf1wBQyMbVK0L+5TQ3GOdDju+
	yufrK+EjMnJqDTYf5AUN3CWoNHVuWZk=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-55-5Bedl0x_Pym0nqYna0Wb4Q-1; Mon,
 07 Apr 2025 12:21:49 -0400
X-MC-Unique: 5Bedl0x_Pym0nqYna0Wb4Q-1
X-Mimecast-MFC-AGG-ID: 5Bedl0x_Pym0nqYna0Wb4Q_1744042906
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9A2A0195608F;
	Mon,  7 Apr 2025 16:21:46 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.40])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 78B531809B63;
	Mon,  7 Apr 2025 16:21:43 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20250407161225.GQ395307@horms.kernel.org>
References: <20250407161225.GQ395307@horms.kernel.org> <20250407091451.1174056-1-dhowells@redhat.com> <20250407091451.1174056-11-dhowells@redhat.com>
To: Simon Horman <horms@kernel.org>
Cc: dhowells@redhat.com, netdev@vger.kernel.org,
    Marc Dionne <marc.dionne@auristor.com>,
    Jakub Kicinski <kuba@kernel.org>,
    "David S. Miller" <davem@davemloft.net>,
    Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
    Christian Brauner <brauner@kernel.org>,
    Chuck Lever <chuck.lever@oracle.com>, linux-afs@lists.infradead.org,
    openafs-devel@openafs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 10/12] afs: Use rxgk RESPONSE to pass token for callback channel
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 07 Apr 2025 17:21:42 +0100
Message-ID: <1349701.1744042902@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

Simon Horman <horms@kernel.org> wrote:

> warning: format =E2=80=98%zx=E2=80=99 expects argument of type =E2=80=98s=
ize_t=E2=80=99, but argument 2 has type =E2=80=98long unsigned int=E2=80=99=
 [-Wformat=3D]

I've fixed that and posted a v2.  I've also dealt with a bunch of kdoc
warnings.

David

