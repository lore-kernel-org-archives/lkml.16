Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A23C2367D5
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 08:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751011740; cv=none; b=dSdLkoKhvetqfMbfdsKgc/ve7BYNR57QKtMMJa3SNpb4t7dX8noJaZSQszQJS/ah1BbUq/LVmXx5vaXVCJwXr5X8Cte4Wuz9o71QIq2aI6lUcZo0dG7ixEfz9mZFif4Qc7JFN4++cOTg/Y6IRiY3q2aSUfPfHwTtZJld9e0IuoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751011740; c=relaxed/simple;
	bh=4atm7a3aa7XLLdZNBlU0QoQBXv7fksZDQmZpN4oS3ko=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KdmiHDCoODB7ZsFdL2cZx80xUEBkaIcL3ds9HILRLoy+QOOKaJhTj3fqfUhR1XdscdThBNiLzBVSN9i9GUV4cAh5Gsjf0kLRFWA7hL1BljK8zYXOdJHfp3JQxtRi9XAwPSV+dCDuJdCaKNZZv6UI1iFl19+pDPycqLJW7RbUlVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZLYDaLQL; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZLYDaLQL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751011737;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/1zTV14SPJKhyzAQ+CnMR/zcHPupL9X+uwgLCPBgwIs=;
	b=ZLYDaLQLvljrIUIZxVPaVq8JzNnpcdErqImpcRKAdAWOMf8gK668FOo8Z/w3NgKKsVmNbO
	Uicmo0abJ2d1lAfUip+enLPE66W46yTJazDmeQwLAhf1XuoZ/ToC/wgutG8WUm84QAcH6v
	detpEWTIEW9S55YxHzkBHKrCc8X2dgA=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-567-ECljezsLOF2uoHmYdQh-pg-1; Fri, 27 Jun 2025 04:08:55 -0400
X-MC-Unique: ECljezsLOF2uoHmYdQh-pg-1
X-Mimecast-MFC-AGG-ID: ECljezsLOF2uoHmYdQh-pg_1751011734
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b2c36d3f884so1367724a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 01:08:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751011734; x=1751616534;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/1zTV14SPJKhyzAQ+CnMR/zcHPupL9X+uwgLCPBgwIs=;
        b=EKQPRt3PHXcFzMcX/MctLn8YGAdt2Sq/9dhhV3tWXaQQONy4JGTIJFGP6Yyn8PGZIX
         HRcDG9veozwDKpmdwHYY4l3PfWYPc4U1P3fSbp9AQq5/PnxJsTIxnjhB/ptjCrVSeO1X
         Z15ztK7iwGTelNeLXiUAg1jY4/yCk7JdO4RNBfHJQgva1UmvNRHX3OvHP0bs/Uqb/J28
         Xrh4soTP7vP8vA3yI0HkSk1dMHTBH/QeuIYF4DR3S+JZ1OSmqi5n5Z3SvCES31lxprWH
         0jxvxhxWk7iFK2o52BVep5KY36NU4hWdtJZXicGRcWIIGkyYPFJId7fN6SxFJm5UTw0N
         85rA==
X-Forwarded-Encrypted: i=1; AJvYcCUiqpvIqDqKUvOA6hEy8MDKXapjhfuZ8n+qbgXWkvpJMkem7cJJfzF7jKEhh65SIzhW+srDakHGI3KVSWY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyeV4haUdR24rigFItpoSkoGeOnx2L6Xn5sLjlltdZuZ/O6UJRV
	D4neKF2Tj5KlisNLO8as4WdX6bMkv45J+fuuOoQNAeC5nyXThDAIX2mjNjmzNPG899e3csYi/te
	ip8x1xeuVz3KUd13gZSTrQzTT1xJDIOzvwzikTkR2dCZX7+Qg1TPNg2Di4F2Y9wKTAw==
X-Gm-Gg: ASbGncuM8Fbmxge+vSctKlnd4n0JmXblEPeaMxwvgDxR7eHEHuH/2kj0i5tPAUorJsQ
	l63OplvzIpHTuVQVB6jwDb2JO0D7OhhDNPl0GeZypBGK3KFk4HFmggnbd/4fflPWU4w0KVwD4hT
	TZrKHLCsy9gyn6sBuz0or3xms2t5IvRUdu8SldsPoyhQ3unBVDUdlovnzy8uVxvzEoxwmLigvIc
	HrfkbyTaclvJtd1mtsWUxAVUaXNGVR3A0si7L0rgcTKkfPzQMv+ZtcRXnIHse8YgMF0nGhlT0rT
	9WCkh/jN9iLWmPiL7N3yykC9Qmc=
X-Received: by 2002:a05:6a21:4606:b0:1f5:7280:1cf2 with SMTP id adf61e73a8af0-220a12dcb62mr3298238637.12.1751011734524;
        Fri, 27 Jun 2025 01:08:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFr/5FfyhGN+rz6LQcfj5dGER/OaxguGxdnRTL3rMKPiYqAnq1lmuYeWjQctcVkptzzUcr5EQ==
X-Received: by 2002:a05:6a21:4606:b0:1f5:7280:1cf2 with SMTP id adf61e73a8af0-220a12dcb62mr3298206637.12.1751011734091;
        Fri, 27 Jun 2025 01:08:54 -0700 (PDT)
Received: from sgarzare-redhat ([193.207.150.33])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af541bd1fsm1597968b3a.47.2025.06.27.01.08.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 01:08:53 -0700 (PDT)
Date: Fri, 27 Jun 2025 10:08:38 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Michal Luczaj <mhal@rbox.co>
Cc: "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Stefan Hajnoczi <stefanha@redhat.com>, virtualization@lists.linux.dev, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC net v2 2/3] vsock: Fix transport_* TOCTOU
Message-ID: <l6yqfwqjzygrs74shfsiptexwqydw3ts2eiuet2te3b7sseelo@ygussce5st4h>
References: <20250620-vsock-transports-toctou-v2-0-02ebd20b1d03@rbox.co>
 <20250620-vsock-transports-toctou-v2-2-02ebd20b1d03@rbox.co>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20250620-vsock-transports-toctou-v2-2-02ebd20b1d03@rbox.co>

On Fri, Jun 20, 2025 at 09:52:44PM +0200, Michal Luczaj wrote:
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
> net/vmw_vsock/af_vsock.c | 28 +++++++++++++++++++++++-----
> 1 file changed, 23 insertions(+), 5 deletions(-)
>
>diff --git a/net/vmw_vsock/af_vsock.c b/net/vmw_vsock/af_vsock.c
>index 63a920af5bfe6960306a3e5eeae0cbf30648985e..a1b1073a2c89f865fcdb58b38d8e7feffcf1544f 100644
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
>+		goto err;
> 	}
>
> 	if (vsk->transport) {
>-		if (vsk->transport == new_transport)
>-			return 0;
>+		if (vsk->transport == new_transport) {
>+			ret = 0;
>+			goto err;
>+		}

		/* transport->release() must be called with sock lock acquired.
		 * This path can only be taken during vsock_connect(), where we
		 * have already held the sock lock. In the other cases, this
		 * function is called on a new socket which is not assigned to
		 * any transport.
		 */
		vsk->transport->release(vsk);
		vsock_deassign_transport(vsk);

Thinking back to this patch, could there be a deadlock between call
vsock_deassign_transport(), which call module_put(), now with the
`vsock_register_mutex` held, and the call to vsock_core_unregister()
usually made by modules in the exit function?

Thanks,
Stefano

>
> 		/* transport->release() must be called with sock lock acquired.
> 		 * This path can only be taken during vsock_connect(), where we
>@@ -508,8 +515,16 @@ int vsock_assign_transport(struct vsock_sock *vsk, struct vsock_sock *psk)
> 	/* We increase the module refcnt to prevent the transport unloading
> 	 * while there are open sockets assigned to it.
> 	 */
>-	if (!new_transport || !try_module_get(new_transport->module))
>-		return -ENODEV;
>+	if (!new_transport || !try_module_get(new_transport->module)) {
>+		ret = -ENODEV;
>+		goto err;
>+	}
>+
>+	/* It's safe to release the mutex after a successful try_module_get().
>+	 * Whichever transport `new_transport` points at, it won't go await
>+	 * until the last module_put() below or in vsock_deassign_transport().
>+	 */
>+	mutex_unlock(&vsock_register_mutex);
>
> 	if (sk->sk_type == SOCK_SEQPACKET) {
> 		if (!new_transport->seqpacket_allow ||
>@@ -528,6 +543,9 @@ int vsock_assign_transport(struct vsock_sock *vsk, struct vsock_sock *psk)
> 	vsk->transport = new_transport;
>
> 	return 0;
>+err:
>+	mutex_unlock(&vsock_register_mutex);
>+	return ret;
> }
> EXPORT_SYMBOL_GPL(vsock_assign_transport);
>
>
>-- 
>2.49.0
>

