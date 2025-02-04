Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8591A211711
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 14:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738678179; cv=none; b=XMRBgrhHYjTlW+E+HnHBNdDVWD2sRDdUQgTRzqUWbNAkehzal42z6HkL87Hbh94B3whHRyBdvQUJFHALH21+oYIJdyLHeDD1mJXudU6a6UmeSEASWBNjkHDDQ8/vanQtmV0kUNbHtMy30guuU/foGsJP7t+YZBNMVPy5UF+I51w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738678179; c=relaxed/simple;
	bh=FdRV7dJVnVj1j/AEXGwiRQUI1WfYKxSdSx4eOKpjjX0=;
	h=From:In-Reply-To:References:To:Cc:Subject:MIME-Version:
	 Content-Type:Date:Message-ID; b=ESGVlSTLhHPIEjkeVK0ZWiLxG1R8LzYVjrGMM/lptBCpq4BP4xtsTdLYIzSDozZ6uHlp2Ul5XAW0OyHnbXOtt0CNC7DWmZk9nAByHUo3ZOnVoYXe8DZyseBVkoJXr1ABTyCX6tc1RR8GwI0DAP6Knf4mxKSY8b/uI9PuqjjJ47U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JKLkNjmB; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JKLkNjmB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738678176;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FdRV7dJVnVj1j/AEXGwiRQUI1WfYKxSdSx4eOKpjjX0=;
	b=JKLkNjmBadtGWTKt7qZHSZQvEtAZcaCiZE/4Uhkhi4Di2IRQX+1npHaAoU7uDICPGAxW/4
	Mi2a5KW8GjW+K6uvt4VISWIq09RR4YWJ/wQdezbBZqtCvzGFvLYk3QcGodMJ5kREvJdyT4
	Xo11/LygFE7vKb8HBQtU7f+qne1ZXyk=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-37-ZEO8It7fMQSrt_rjSIZfwg-1; Tue,
 04 Feb 2025 09:09:32 -0500
X-MC-Unique: ZEO8It7fMQSrt_rjSIZfwg-1
X-Mimecast-MFC-AGG-ID: ZEO8It7fMQSrt_rjSIZfwg
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id F1B2818009C1;
	Tue,  4 Feb 2025 14:09:29 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.92])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 342A118008C8;
	Tue,  4 Feb 2025 14:09:27 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <716751b5-6907-4fbb-bb07-0223f5761299@redhat.com>
References: <716751b5-6907-4fbb-bb07-0223f5761299@redhat.com> <20250203110307.7265-1-dhowells@redhat.com> <20250203110307.7265-3-dhowells@redhat.com>
To: Paolo Abeni <pabeni@redhat.com>
Cc: dhowells@redhat.com, netdev@vger.kernel.org,
    Marc Dionne <marc.dionne@auristor.com>,
    Jakub Kicinski <kuba@kernel.org>,
    "David S. Miller" <davem@davemloft.net>,
    Eric Dumazet <edumazet@google.com>, linux-afs@lists.infradead.org,
    linux-kernel@vger.kernel.org, Simon Horman <horms@kernel.org>
Subject: Re: [PATCH net 2/2] rxrpc: Fix the rxrpc_connection attend queue handling
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <549952.1738678165.1@warthog.procyon.org.uk>
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 Feb 2025 14:09:25 +0000
Message-ID: <549953.1738678165@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

Paolo Abeni <pabeni@redhat.com> wrote:

> A couple of minor nits: I think this deserves a 'Fixes' tag,

Fixes: f2cce89a074e ("rxrpc: Implement a mechanism to send an event notifi=
cation to a connection")

> and possibly split into separate patches to address the reported problem=
s
> individually.

I can do that if you really want.

David

