Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15ECB295523
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 08:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751530827; cv=none; b=LcPd1FqGNcH56pObNY4P1bw3xAGNtpNjENDCsLM673TuGzhSseN42/N6ais2F2jww4vrkxi2M5R0+31Ay8VV01w+anFnjck/HhL4MNfG2l9D76HJaHS8lvq4EzdMSMLskqAGmFVTFHXVapsLf93FJj3WzUstSjvGjVAbiSbL3UI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751530827; c=relaxed/simple;
	bh=5PJIzBhJKZAUVsz2r3kI83D6I2kEvYb35khFWlCgkg4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L+Tsh699HEnmUwKaEfQ+n4y+OKsPGa+q2A/srjGwdN156qQWrTtqHFbtCvp3MWeb2Las785pVzjELguXBIdOW4QQnQ0rvBN5HozI3iXnKYe5pp626Eyb/Ul823dmUs4e1NGIpHIoJ3C27E/Qnu2qlkUiC30Z0LHREB+0ZLn1i0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ka3iuYWZ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ka3iuYWZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751530825;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PgfK0MiivLIcqaxzsWTOFNAQYQqm2mXnsaXnPmi5A+g=;
	b=Ka3iuYWZjwRUsMeNiqrK7wO3hnWG4yukMhANdWDB2rp1VOEs12Cphw+GxKetq6QzKwEJow
	HNrDv5FK2BUWtAHUGeoTHu7TEjTdrrOmTn77lfO3qNSjLQgl998mc5YL3WvqdEv+PyDjbV
	NW5sli2uuuUFYgVQDGgp1i0tbvSKqp4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-304-6g3pJCHGPgyCO0PvpcDI6w-1; Thu, 03 Jul 2025 04:20:24 -0400
X-MC-Unique: 6g3pJCHGPgyCO0PvpcDI6w-1
X-Mimecast-MFC-AGG-ID: 6g3pJCHGPgyCO0PvpcDI6w_1751530823
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-453a190819bso30376135e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 01:20:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751530823; x=1752135623;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PgfK0MiivLIcqaxzsWTOFNAQYQqm2mXnsaXnPmi5A+g=;
        b=A5IKgjL1Z4PqznvfevDdfFovVcG7LP3Az/52DgWe92JLdKUsUX6YXa4W2r82RG275t
         OvvYYiyFV05L08x4dS/R+r04CFlkapR1L6j3sm1CS0vjH7mts821vrgwUAkgmzRGmfH8
         BkJwcU7mZJJw7cvj9ApkI27j5rrWvG+6CvBPecMeNabuNZJltlJ6th6vlzHL/qYpy00q
         Zm9lJ+E+8baSPoo9IF2Fjtu/s2UvZUZnwZ6mnhfk3P2VT61Hnb9pmXrBETmcRPm5EFdf
         NQoJJSDoCwyD3FGfcz63T5UjGrTMFLbpzmgbSvw3CfodXYCHNpdTLHd0BaLqiXZwwQjt
         4uWQ==
X-Forwarded-Encrypted: i=1; AJvYcCX52+2/5NlcEBNn42AWjv9tGoq0zspgFVdAY/N9RUonGXwKI9AiBzfre4Gi9KwzZ27Vf9lz8MdShNi/M2c=@vger.kernel.org
X-Gm-Message-State: AOJu0YwcL5/huxK3WtV+SpOOS3g1wtk5G8fGK3dK8e19N80TKMyn+Wef
	zxi0plj5scX3slkIsAf4GhBImjMGIixiRyir6W2EAgsUaGyE2wuTWx/WXfnVQJruvPTbKynOWjV
	8ehOCyDSkxDfYt1xdUs8V4BmVmNARBvRMi+lKSuEjPO16KIw5tbpnKmz/MmM06kjV+A==
X-Gm-Gg: ASbGnctcV7AfR/5yPimjljRZgLdmdTeKvRzFdY0HR8kT1x5+07fwNqdP4p003s60kIj
	jPD4U3jFIRUqv/YwIa0+yi8hsP+HZRKdsXPcULlERi9FaEqpP6fxXwYw2K1zbqW+5qDhBAkQPnp
	MzDwd0mvKFDD8vf2rZpZ9A30wV8s86W25dbOxV7pi1xVf+fAEWD7sUKuNSw1OL8zE1oo21InZPM
	t/tXUE34gjgcRBEr79oVa+Mb55HT572Y+EWFvs2o58DfM+H0jrpWEudYISpyn3vIbO95h592si3
	uOt/J1dt+pWMgT4u8MsEW5GIG0w=
X-Received: by 2002:a05:600c:548e:b0:44b:eb56:1d45 with SMTP id 5b1f17b1804b1-454acdecf4cmr12821535e9.15.1751530822630;
        Thu, 03 Jul 2025 01:20:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGOrUfpUNiIuQYIchc6nRH2gLgD7pUNLwLBaAp2Du7pJA/QiHS2M+US3/T3JQKKd1t8cLhjKQ==
X-Received: by 2002:a05:600c:548e:b0:44b:eb56:1d45 with SMTP id 5b1f17b1804b1-454acdecf4cmr12820865e9.15.1751530821910;
        Thu, 03 Jul 2025 01:20:21 -0700 (PDT)
Received: from sgarzare-redhat ([193.207.200.84])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e5963csm17999165f8f.79.2025.07.03.01.20.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 01:20:21 -0700 (PDT)
Date: Thu, 3 Jul 2025 10:20:09 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Michal Luczaj <mhal@rbox.co>
Cc: "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Stefan Hajnoczi <stefanha@redhat.com>, virtualization@lists.linux.dev, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v3 2/3] vsock: Fix transport_* TOCTOU
Message-ID: <u36jztpit63o2b33ulnmax2xrw2c6hgrkwabto3fccocdmay7w@xlpkemxcgve4>
References: <20250702-vsock-transports-toctou-v3-0-0a7e2e692987@rbox.co>
 <20250702-vsock-transports-toctou-v3-2-0a7e2e692987@rbox.co>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20250702-vsock-transports-toctou-v3-2-0a7e2e692987@rbox.co>

On Wed, Jul 02, 2025 at 03:38:44PM +0200, Michal Luczaj wrote:
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
>Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
>Signed-off-by: Michal Luczaj <mhal@rbox.co>
>---
> net/vmw_vsock/af_vsock.c | 28 +++++++++++++++++++++++-----
> 1 file changed, 23 insertions(+), 5 deletions(-)
>
>diff --git a/net/vmw_vsock/af_vsock.c b/net/vmw_vsock/af_vsock.c
>index 39473b9e0829f240045262aef00cbae82a425dcc..9b2af5c63f7c2ae575c160415bd77208a3980835 100644
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

Little typo, s/await/away

Up to you to resend or not. My R-b stay for both cases.

Thanks,
Stefano

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

