Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9189714D2A0
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 08:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750408345; cv=none; b=jDY6qtcCFBQa3byXHNfhQjITzkoyEc/ZmsQF97Zr+M50t+zDX0K4Eg6ftR8ZDC/hncF96KdVuwfy/Jv3U882QP96hTWIoCOFldEGpX05Kcj2A23wgM+yiU48zD57BAhPoKMJmnEDPdifbUGBDlfEIFpTFnnckyVXiuQNEqoD3aQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750408345; c=relaxed/simple;
	bh=5YOM2lPpH7PXWuJm9EXV7JiVObmQ3cui1GYbQMMQ0kM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bdABIvCMhoAJO67Nksv30D4cFxG+8n4IGCxnmGBLj4CvT/a8PlGFhkc7m/pwctRmm1rEHlzoDiOnTBuqWdhD3Ry6ndSPzvruhaxxa0UjAOcXbuk/rLShBOEkEWGrhLcQAIVIpLiqNb0qQLhc0v9X04XtjKx7VvD3mA1ppluj7I4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cog5BKNa; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cog5BKNa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750408342;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EELna4tg5NHVDqDl5GH+k+fVb8iZXQcOHnkW1YCeC7k=;
	b=cog5BKNaLnVwvt4Bd2COJNy5kL68BBwUyuB0W9RNDkSvzrEJU5LBsnxvzrbpZgcDr7VigD
	eZ8pv3cICfelhaF3jjmfmraNaoDWgrf0wdhxLowbuw45T23ApmONRr92b3amb4TdDO4NpG
	2baFK1XNzkAOGzhq1A9vULvIbpL3/kc=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-258-alzvQ_DjORiTtLCOHA9WVQ-1; Fri, 20 Jun 2025 04:32:19 -0400
X-MC-Unique: alzvQ_DjORiTtLCOHA9WVQ-1
X-Mimecast-MFC-AGG-ID: alzvQ_DjORiTtLCOHA9WVQ_1750408339
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-31327b2f8e4so1539755a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 01:32:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750408339; x=1751013139;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EELna4tg5NHVDqDl5GH+k+fVb8iZXQcOHnkW1YCeC7k=;
        b=YtAoHfFwoqaUo8i+uAcJ5GDCd2UZpmEGhsLkqsXtu56Yl/0Wil5A4SUjRh+zWKToWd
         Qan7yixrrC8Le7bhL6HfLOaZX1wqwNgWFCyVVJoeq9gy6S9A0n22Dc2979ZK9G/R6ks8
         9CTmEUui3gipiWCHNpmuOnt674T2JHWJqchkkqkLYWD3/gfRdCJwI8Pul97MCyVU79fD
         FOEz4gLD6VeoeQQu07xOSMaA0HgQ9FPjFAI7MaSwXH14wgamY8rAJlBIqjsbReI/bHJP
         b12kMr/ECZcfu4pdknGAOFAmlyAL4OPbs1CvVf8XtWiQujwqT6iSMHyX6NEFFtLocSrx
         MZBA==
X-Forwarded-Encrypted: i=1; AJvYcCVN0tDWe/UasfWMi6WPZ2VEhVIf4PxYDm+hZEQKW0JHWrEnyueatOZy2ovWrNX2S8vrhDZbIYpTdiKHcBs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJFtG10TNK8WJBhm3eTinIXT0QqTsO6Uc20DhovMcbEoZKtzEa
	z7Q2TBOZpCTBJjpKyu9O07D9GIF1LQ/18x+yLOo2BtKULOVxLGa4z8/yXDrnL7imGJ4bzsjwx8X
	Q+oHf+HgCDsvsqBU3ho5P9zhHNkrwc9LKIBq5tsXOeBQDAMItzb1eDBMbOKkfrOx27g==
X-Gm-Gg: ASbGncteP7eVxRldqCCnwO8joPc1tzLWqCF9I1TkyLzWUqGeiaeH1w9aZStgFYhBIOW
	Ed8rEfM31evr3Lu97La4z/HeQwFl6Toq+ZAiFEwt0j7hRliO/yKQ2Y+W3h69nbptWqv1dg1eiv5
	maLQrNP8HENJJWjHj6vDzi+reUy0RKKuIFEehjtdOb9zHhMMEifO1ubggVIZtdtPqCZedpxbnG3
	MzeU4X0LwRHmcLAcboHE1zlTmkH51a7Fa6oR4vzsDvdya3ImQRushxX2p9T+qI5+koa0QGZHHnI
	tv4tEjS183rngd0jMEXjkCFigra7
X-Received: by 2002:a17:90b:51c3:b0:313:17ec:80ec with SMTP id 98e67ed59e1d1-3159d8dc9a8mr2836309a91.26.1750408338646;
        Fri, 20 Jun 2025 01:32:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHpEPY7m8XnpO27bAGr683g+jQ02JBIyUY70+ykZ6RPi1orD37Zz6VwI1lcx8EihVOJArcpTg==
X-Received: by 2002:a17:90b:51c3:b0:313:17ec:80ec with SMTP id 98e67ed59e1d1-3159d8dc9a8mr2836275a91.26.1750408338174;
        Fri, 20 Jun 2025 01:32:18 -0700 (PDT)
Received: from sgarzare-redhat ([193.207.182.199])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d8614baesm12447485ad.137.2025.06.20.01.32.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 01:32:17 -0700 (PDT)
Date: Fri, 20 Jun 2025 10:32:04 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Michal Luczaj <mhal@rbox.co>
Cc: "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, virtualization@lists.linux.dev, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net 1/3] vsock: Fix transport_{h2g,g2h} TOCTOU
Message-ID: <r2ms45yka7e2ont3zi5t3oqyuextkwuapixlxskoeclt2uaum2@3zzo5mqd56fs>
References: <20250618-vsock-transports-toctou-v1-0-dd2d2ede9052@rbox.co>
 <20250618-vsock-transports-toctou-v1-1-dd2d2ede9052@rbox.co>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20250618-vsock-transports-toctou-v1-1-dd2d2ede9052@rbox.co>

On Wed, Jun 18, 2025 at 02:34:00PM +0200, Michal Luczaj wrote:
>Checking transport_{h2g,g2h} != NULL may race with vsock_core_unregister().
>Make sure pointers remain valid.
>
>KASAN: null-ptr-deref in range [0x0000000000000118-0x000000000000011f]
>RIP: 0010:vsock_dev_do_ioctl.isra.0+0x58/0xf0
>Call Trace:
> __x64_sys_ioctl+0x12d/0x190
> do_syscall_64+0x92/0x1c0
> entry_SYSCALL_64_after_hwframe+0x4b/0x53
>
>Fixes: c0cfa2d8a788 ("vsock: add multi-transports support")
>Signed-off-by: Michal Luczaj <mhal@rbox.co>
>---
> net/vmw_vsock/af_vsock.c | 4 ++++
> 1 file changed, 4 insertions(+)
>
>diff --git a/net/vmw_vsock/af_vsock.c b/net/vmw_vsock/af_vsock.c
>index 2e7a3034e965db30b6ee295370d866e6d8b1c341..047d1bc773fab9c315a6ccd383a451fa11fb703e 100644
>--- a/net/vmw_vsock/af_vsock.c
>+++ b/net/vmw_vsock/af_vsock.c
>@@ -2541,6 +2541,8 @@ static long vsock_dev_do_ioctl(struct file *filp,
>
> 	switch (cmd) {
> 	case IOCTL_VM_SOCKETS_GET_LOCAL_CID:
>+		mutex_lock(&vsock_register_mutex);
>+
> 		/* To be compatible with the VMCI behavior, we prioritize the
> 		 * guest CID instead of well-know host CID (VMADDR_CID_HOST).
> 		 */
>@@ -2549,6 +2551,8 @@ static long vsock_dev_do_ioctl(struct file *filp,
> 		else if (transport_h2g)
> 			cid = transport_h2g->get_local_cid();
>
>+		mutex_unlock(&vsock_register_mutex);


What about if we introduce a new `vsock_get_local_cid`:

u32 vsock_get_local_cid() {
	u32 cid = VMADDR_CID_ANY;

	mutex_lock(&vsock_register_mutex);
	/* To be compatible with the VMCI behavior, we prioritize the
	 * guest CID instead of well-know host CID (VMADDR_CID_HOST).
	 */
	if (transport_g2h)
		cid = transport_g2h->get_local_cid();
	else if (transport_h2g)
		cid = transport_h2g->get_local_cid();
	mutex_lock(&vsock_register_mutex);

	return cid;
}


And we use it here, and in the place fixed by next patch?

I think we can fix all in a single patch, the problem here is to call 
transport_*->get_local_cid() without the lock IIUC.

Thanks,
Stefano

>+
> 		if (put_user(cid, p) != 0)
> 			retval = -EFAULT;
> 		break;
>
>-- 
>2.49.0
>

