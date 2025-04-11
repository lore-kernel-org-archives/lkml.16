Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0846D1F37D8
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 14:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744380543; cv=none; b=sl2Tae84sWqzAkmdVAMNIBmSLWGHxJcNsQGM1FlX6b6kmn0Pe9hI1jIdoGQq2vTrc/W0FOlLzgt/gU7eBfEdUO6xiOrY0WeGB8QcBmllL1aec0GOTf6OOHeuQX6NQHpicnnJiiqXVvuGYuZCuCCq6nREtXI0CUR3oEPqGWxQ89o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744380543; c=relaxed/simple;
	bh=arrtb4ukZJFU8QPFxhKYA9mDHq97ep0WfiWoy3zLAKI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TqysvDeMVvjp1ZjzRKLZYoljXwmE+rEnnIi6X2Yk4a+s9azFr7SRdIwfR1htSIYwO9UotdywB/Je6py5W2irbAxbssLeAzIdkslMyKa+ePEvmJSXCruXg3vu29ekHiJXyptYiuifFCFwTiyvEqkRaD16/DsGyYAEE5lh7KH4gbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gBcs0RPS; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gBcs0RPS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744380540;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=arrtb4ukZJFU8QPFxhKYA9mDHq97ep0WfiWoy3zLAKI=;
	b=gBcs0RPSYYi9cUxuG5hUUFn5Qhufk3cKdSU5ivsg31y5Usc84bDhuhWRfPFTSkSzyTQp4B
	hEto25afZEUx+vA0d3HpS7bRcw2+A6Vh+Z/2v31UNixiYw3eTpla7x/re0ab1f/PJeOFht
	KSnmb0+26YVA/g+hgY0cai8NBFvWgQY=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-544-Abn9uyb9MXG5ijyKI3ujRw-1; Fri,
 11 Apr 2025 10:08:55 -0400
X-MC-Unique: Abn9uyb9MXG5ijyKI3ujRw-1
X-Mimecast-MFC-AGG-ID: Abn9uyb9MXG5ijyKI3ujRw_1744380534
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 250E01800258;
	Fri, 11 Apr 2025 14:08:54 +0000 (UTC)
Received: from [192.168.37.1] (unknown [10.22.58.2])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4DA941956094;
	Fri, 11 Apr 2025 14:08:52 +0000 (UTC)
From: Benjamin Coddington <bcodding@redhat.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: Trond Myklebust <trondmy@kernel.org>, Anna Schumaker <anna@kernel.org>,
 Omar Sandoval <osandov@osandov.com>, Sargun Dillon <sargun@sargun.me>,
 linux-nfs@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] nfs: move the nfs4_data_server_cache into struct
 nfs_net
Date: Fri, 11 Apr 2025 10:08:49 -0400
Message-ID: <E6922A9D-8AFB-4512-B7D0-6EF9A514A3E3@redhat.com>
In-Reply-To: <20250410-nfs-ds-netns-v2-2-f80b7979ba80@kernel.org>
References: <20250410-nfs-ds-netns-v2-0-f80b7979ba80@kernel.org>
 <20250410-nfs-ds-netns-v2-2-f80b7979ba80@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15

On 10 Apr 2025, at 16:42, Jeff Layton wrote:

> Since struct nfs4_pnfs_ds should not be shared between net namespaces,
> move from a global list of objects to a per-netns list and spinlock.
>
> Tested-by: Sargun Dillon <sargun@sargun.me>
> Signed-off-by: Jeff Layton <jlayton@kernel.org>

Reviewed-by: Benjamin Coddington <bcodding@redhat.com>

Ben

