Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 695D7246BC5
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 08:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750408685; cv=none; b=H0IMtSr3wNXwTYRezzYGhnMzYoYaiCMuRJB0XJcche/1Z34cWy3szJeNUE9VfMHzi0GwpZYsVmMhLJsHG86zU0EHDW/j6PzKEV/sMRBxDhmIJngz5b31ABBX9/XE3YSTM0RiTTtlUUlPxXwbkL+nHXF5pS5mA2qePa1KyD3dl0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750408685; c=relaxed/simple;
	bh=/X0onNxIoHCituHUtODJAVeY5Sgv6GC2RODQR2Tb0Wg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WrQp9DgeBMSUYcZFipPgknsL2v1d/P3YnQ1xzQI0jyWJfjIMscbX+X4OVwb0ADVIPYPuOvCz90TG9zomENeC/aNUYocr9DIx9l8Evqim+U5gef/jYFd4Rfv4QSPJ/QTreQ6aKOvIOxYDGni9oOaFIy8rvL6CK6uJLOs2krO0GIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hEZ9bBLg; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hEZ9bBLg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750408682;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Eog4yVEfqOklks2EjdMhzqPgmpWjhS9NGkes1JaQ9/0=;
	b=hEZ9bBLghkkbijuQcSsjaVawoES3YlWLGoUxuI91KKvv+A9MH6AnZBQhAFcPUGEcZfGTk9
	tCE9TtI/P3pAFvLVGStxpOXbtbtoSLFhIEqeTgpGlaDoXGsMbsKpcceIw77eIm4WJ5fkOC
	c64mRxXyn6Ojwxtk7UxAzdrNEBkUlxc=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-132-WxnBSvnONd2neI0_KuQ6-w-1; Fri, 20 Jun 2025 04:38:00 -0400
X-MC-Unique: WxnBSvnONd2neI0_KuQ6-w-1
X-Mimecast-MFC-AGG-ID: WxnBSvnONd2neI0_KuQ6-w_1750408679
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6fb5f71b363so30873396d6.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 01:38:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750408679; x=1751013479;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Eog4yVEfqOklks2EjdMhzqPgmpWjhS9NGkes1JaQ9/0=;
        b=tHLnarY+fBmDBiNlPraVQYO6Q4gD5J5g6ErJBg8TqUO3hu5/itFPoRvc8+QN1Ijgav
         FEZ4ERJA0b5eAeL+R5C6MLYu7aJbAISmHR4IF+9yB1m0lk3VzdER9DheG1rpaB3jnANT
         9PDL55kQbOSwkACir8V8LAtFYrSekasZqa6//x7XzH75oQHg8chnxTQlNRccu5Cedc6l
         1uHIivohYJqOhckjxVOt7OjmKJ1AalOzBTfVrFanIXJYzfnZC0Soy3Hla5gVnKWeXKVy
         JFTE8jYK5yobd7KTMldYlS43pY0Xg/8YygWGMcqPTvhhzFeVFwZcnv3xlyvC+EjI1mcF
         Unlg==
X-Forwarded-Encrypted: i=1; AJvYcCW1tjH1fj+OAZtSYkYb2dcrYGmYAYCRuhZCh9JaOPv8z44QIGR9dqe6wDE3LYOkO/VC5FZ4NfdA5buwsf0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyotTnk5DZfnBuBJnS3svYANhtZnNc11pVsMo0L4i00v4isz1JK
	/DbFtmWh0SSAXVJ8nVBGUnoCyVX+cjxhkrRxGTecwiBewSZV/WM1VNiDSsWd5FWPzKC99Ar/lJh
	/rgk2O7vKT0IOX44gbTB/UQvhm6FwHNjcOK6Wb6fkUCCfMpEk0aS9uKiZTTtQjVj4aA==
X-Gm-Gg: ASbGncve8oy1hFhMbOm7RcBm0TjigIzF2mTP9KwzwpvDlE4cdBRzjGypvacSymPC/Kv
	ghKDFaZQZONuWPandftWNGl9B3AzENWNAixrIHDdM4Ike3aF6pz3p2//f1dVJ2oVFKWnW9dokbl
	Y9eMDnVq7zgZivLTnWTHqBfjUJqlSSTcAl++yPvio8TR8DiwVi5qTfji3ibCx28/HynvvRS/MhD
	gL3jPVVOi9xBXSKhTh1d68/+wSnEkrve/GYh4DjUkO632eiAfTMkmI/YVnFoiDFyxWx97bCPn2f
	8VX9JGGB+ZRWGrShyqHCJJsKv41T
X-Received: by 2002:a05:6214:21ef:b0:6e8:fbb7:675b with SMTP id 6a1803df08f44-6fd0a5bb050mr37553616d6.32.1750408679569;
        Fri, 20 Jun 2025 01:37:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHmA3h6ErxX85wD5sSfG+Vzbb3PR/XLuB7HFc0jjVgeWIZox/+0PegblvBekonQcxrwvk7ztQ==
X-Received: by 2002:a05:6214:21ef:b0:6e8:fbb7:675b with SMTP id 6a1803df08f44-6fd0a5bb050mr37553336d6.32.1750408679168;
        Fri, 20 Jun 2025 01:37:59 -0700 (PDT)
Received: from sgarzare-redhat ([193.207.182.199])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd0957f69bsm9353816d6.96.2025.06.20.01.37.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 01:37:58 -0700 (PDT)
Date: Fri, 20 Jun 2025 10:37:49 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Michal Luczaj <mhal@rbox.co>
Cc: "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, virtualization@lists.linux.dev, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net 3/3] vsock: Fix transport_* TOCTOU
Message-ID: <qvdeycblu6lsk7me77wsgoi3b5fyspz4gnrvl3m5lrqobveqwv@fhuhssggsxtk>
References: <20250618-vsock-transports-toctou-v1-0-dd2d2ede9052@rbox.co>
 <20250618-vsock-transports-toctou-v1-3-dd2d2ede9052@rbox.co>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20250618-vsock-transports-toctou-v1-3-dd2d2ede9052@rbox.co>

On Wed, Jun 18, 2025 at 02:34:02PM +0200, Michal Luczaj wrote:
>Transport assignment may race with module unload. Protect new_transport
>from becoming a stale pointer.
>
>This also takes care of an insecure call in vsock_use_local_transport();
>add a lockdep assert.
>
>BUG: unable to handle page fault for address: fffffbfff8056000
>Oops: Oops: 0000 [#1] SMP KASAN
>RIP: 0010:vsock_assign_transport+0x366/0x600
>Call Trace:
> vsock_connect+0x59c/0xc40
> __sys_connect+0xe8/0x100
> __x64_sys_connect+0x6e/0xc0
> do_syscall_64+0x92/0x1c0
> entry_SYSCALL_64_after_hwframe+0x4b/0x53
>
>Fixes: c0cfa2d8a788 ("vsock: add multi-transports support")
>Signed-off-by: Michal Luczaj <mhal@rbox.co>
>---
> net/vmw_vsock/af_vsock.c | 24 +++++++++++++++++++-----
> 1 file changed, 19 insertions(+), 5 deletions(-)
>
>diff --git a/net/vmw_vsock/af_vsock.c b/net/vmw_vsock/af_vsock.c
>index 337540efc237c8bc482a6730948fc773c00854f1..133d7c8d2231e5c2e5e6a697de3b104fe05d8020 100644
>--- a/net/vmw_vsock/af_vsock.c
>+++ b/net/vmw_vsock/af_vsock.c
>@@ -407,6 +407,8 @@ EXPORT_SYMBOL_GPL(vsock_enqueue_accept);
>
> static bool vsock_use_local_transport(unsigned int remote_cid)
> {
>+	lockdep_assert_held(&vsock_register_mutex);
>+
> 	if (!transport_local)
> 		return false;
>
>@@ -464,6 +466,8 @@ int vsock_assign_transport(struct vsock_sock *vsk, struct vsock_sock *psk)
>
> 	remote_flags = vsk->remote_addr.svm_flags;
>
>+	mutex_lock(&vsock_register_mutex);
>+
> 	switch (sk->sk_type) {
> 	case SOCK_DGRAM:
> 		new_transport = transport_dgram;
>@@ -479,12 +483,15 @@ int vsock_assign_transport(struct vsock_sock *vsk, struct vsock_sock *psk)
> 			new_transport = transport_h2g;
> 		break;
> 	default:
>-		return -ESOCKTNOSUPPORT;
>+		ret = -ESOCKTNOSUPPORT;
>+		goto unlock;
> 	}
>
> 	if (vsk->transport) {
>-		if (vsk->transport == new_transport)
>-			return 0;
>+		if (vsk->transport == new_transport) {
>+			ret = 0;
>+			goto unlock;
>+		}
>
> 		/* transport->release() must be called with sock lock acquired.
> 		 * This path can only be taken during vsock_connect(), where we
>@@ -508,8 +515,12 @@ int vsock_assign_transport(struct vsock_sock *vsk, struct vsock_sock *psk)
> 	/* We increase the module refcnt to prevent the transport unloading
> 	 * while there are open sockets assigned to it.
> 	 */
>-	if (!new_transport || !try_module_get(new_transport->module))
>-		return -ENODEV;
>+	if (!new_transport || !try_module_get(new_transport->module)) {
>+		ret = -ENODEV;
>+		goto unlock;
>+	}
>+

I'd add a comment here to explain that we can release it since we
successfully increased the `new_transport` refcnt.

>+	mutex_unlock(&vsock_register_mutex);
>
> 	if (sk->sk_type == SOCK_SEQPACKET) {
> 		if (!new_transport->seqpacket_allow ||
>@@ -528,6 +539,9 @@ int vsock_assign_transport(struct vsock_sock *vsk, struct vsock_sock *psk)
> 	vsk->transport = new_transport;
>
> 	return 0;
>+unlock:

I'd call it `err:` so it's clear is the error path.

Thanks,
Stefano

>+	mutex_unlock(&vsock_register_mutex);
>+	return ret;
> }
> EXPORT_SYMBOL_GPL(vsock_assign_transport);
>
>
>-- 
>2.49.0
>

