Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C544A214232
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 07:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748504224; cv=none; b=RtH33XIdtXx88DiH5MBNQBc9PmGVUek3dIg7Rav/G0yE0ZKbZ0QidjrGzyne6/6BqM8mzJgKpfrI7LxKp9VFXwG6AYoMLPxkfSP+3kOraNdasS4hZ8i2pT3qBEwWhtzmpbF5BqtzWOS/WCMZrez75JPFSfXF4OX80vprrKUWogU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748504224; c=relaxed/simple;
	bh=Gxvf1ikzAPEd734X9oJNH4velpall6shIxUrlm3mboA=;
	h=From:In-Reply-To:References:To:Cc:Subject:MIME-Version:
	 Content-Type:Date:Message-ID; b=Z0XaAw5LvpyhA23PdOJQAbSz6cvjmmK8r2aRaJVRdRXgSs3MVPrN2VOJ3e6P79lFj5xC7SENt9wgg10gnpTgOTFxzqWKAuluPEOiCXTaQffQDL5Pgigut/+VMDvEyBdffvGlf3xFi+fY+ea4GmhCyU/wcgH14GOfu2c5bouCufo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NZ44DsIS; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NZ44DsIS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748504221;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Gxvf1ikzAPEd734X9oJNH4velpall6shIxUrlm3mboA=;
	b=NZ44DsIS4fH8+JCgH0ExXjO31GM3FXumOtOsLF71IaSqjZDCc8bvFP+LuUal3kMWb6xSPA
	4WbFEnCBseRlJwUhlwwsLR3A/zEFJcp1LEL3kvddoCiFTYfKq7c1teU4RjxQL3/qsGyXaJ
	dPnIqzrs08KpQ2nx9dWQu7Hz2dingOM=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-690-QVuJ-kd3O32qnEOY7UrnyA-1; Thu,
 29 May 2025 03:37:00 -0400
X-MC-Unique: QVuJ-kd3O32qnEOY7UrnyA-1
X-Mimecast-MFC-AGG-ID: QVuJ-kd3O32qnEOY7UrnyA_1748504218
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2568C1800446;
	Thu, 29 May 2025 07:36:58 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.2])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 33400180047F;
	Thu, 29 May 2025 07:36:54 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <58dd23de-ffba-4bdc-8126-010819c6d0ac@redhat.com>
References: <58dd23de-ffba-4bdc-8126-010819c6d0ac@redhat.com> <10720.1748358103@warthog.procyon.org.uk>
To: Paolo Abeni <pabeni@redhat.com>
Cc: dhowells@redhat.com, netdev@vger.kernel.org,
    Dan Carpenter <dan.carpenter@linaro.org>,
    Marc Dionne <marc.dionne@auristor.com>,
    Jakub Kicinski <kuba@kernel.org>,
    "David S.
 Miller" <davem@davemloft.net>,
    Eric Dumazet <edumazet@google.com>, Simon Horman <horms@kernel.org>,
    linux-afs@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next] rxrpc: Fix return from none_validate_challenge()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <516667.1748504213.1@warthog.procyon.org.uk>
Content-Transfer-Encoding: quoted-printable
Date: Thu, 29 May 2025 08:36:53 +0100
Message-ID: <516668.1748504213@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

Paolo Abeni <pabeni@redhat.com> wrote:

> net-next is closed for the merge window, but this is actually a fix for
> code that is already in net (since Linus pulled and the trees are
> forwarded).

Yeah - it wasn't pulled yet when I posted it.

> We can apply it to net, no need to repost, but could you please provided
> a suitable Fixes tag?

Fixes: 5800b1cf3fd8 ("rxrpc: Allow CHALLENGEs to the passed to the app for=
 a RESPONSE")

Thanks,
David

