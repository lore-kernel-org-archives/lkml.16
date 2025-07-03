Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C02DA231A3B
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 08:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751530730; cv=none; b=V7+fr1WClqQsAwSzX+zjSj+YUoEPfL2mIRoWP91ovMOcnvN283I7z/CPT+BfCMQTDsKTOw+u8KTwuedIxpG8qkJMQ9N0USTCxpQ/2e9M/T/CMRb75ZSjsBEzyx1MGcVDypKF9RPKzN6SJQF3AnCJf/mzDRkADzBk2KDCiLfUjEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751530730; c=relaxed/simple;
	bh=hk+vmY3dwf/9cfvNIfPCcCovO3SGaMSrfEj5J+75b3I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VLPFQzr1VkAb4Xub8JIYbO2Sv41XSwTk92W99lHQN9NVEQw8QBhrPbAmHsGrq/MC1NcmQC6VPYB3RphVk5pE9kcHqVf3/VCNY1qWvOS1ijp1jOF8KXY+yJJUwKvyxn0sllC3Dyrwn0uhdZERv3H86dT5iQS7bBZ5DZlKU4AHGp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=US779b9v; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="US779b9v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751530727;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=g+LEYHxbEIy/Tv/yJgYAu7UXqbf4GKrC7aHzLDp5r0E=;
	b=US779b9vLgGLX69yb/fqYyaEI7o5/FDbG1iJe6w420z0ZrKRAkUiZkYxVs2AJhsUlFoMaT
	vT0lQCBGH56BZk/mGS2dsZumuObGeaSP+Az99IPVuEuImr2Ldvg+E71B5inSyPbu/168CE
	FMNIn6RNnMQIrY9SjvfXQeEq+RLAmyQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-673-pmFZVx8eOiKA2EF1wCvSrw-1; Thu, 03 Jul 2025 04:18:46 -0400
X-MC-Unique: pmFZVx8eOiKA2EF1wCvSrw-1
X-Mimecast-MFC-AGG-ID: pmFZVx8eOiKA2EF1wCvSrw_1751530726
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a6d1394b07so5085532f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 01:18:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751530725; x=1752135525;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g+LEYHxbEIy/Tv/yJgYAu7UXqbf4GKrC7aHzLDp5r0E=;
        b=awuc4yJ/7QjI+MDQzvII9PPu+b/c9g2macPOT1TVjN9t9V1qZYStPmIGtqfz6TOQUt
         DYcpkAXSwf69NFoFiOB23QgrSSUd5o6qhGhFYBMNmh9f+CZ7udaYKiHeDUeKCeoehM7F
         F00P174KEETUBC0Txc+x3nfGaOr7E6rpQIkZxspqndmLIBLYtFOE4PTxDX7uyZel271L
         Z2YtWSk0xswkQ6DcuLRsjOJrM5AGUgkO3GwK6Q/2y39q4oCkS1rJFQ5Q6GmYvvEVxpDU
         QpVlz7KBVybfE0OQh47UP2wKMcAmW/ecVSytYMKpzSLLYUR55u2Fo3mAUfAyz7u1kekP
         FKTg==
X-Forwarded-Encrypted: i=1; AJvYcCWqe2Y35gEsq0H91VeEXxQKMYCyblQIP/DTTQPLa3+sJgZmOZFb0I2Ls58VK2h3pPcB3rMbeiZLwE+8hNY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzhg7IbZDIQ8Zf6wj8GEU6d6tbznOFcqFAFpL/20xpB1hqe+8au
	RlnkCo1Qz45imwuxuQ85yznP9PijBqrBloEae886TNDndAASSpiL8/9lo0wTnISITRVGflj/ivQ
	0uqzNYYkkPAbzxXvGRat2Rc8y/MPl1J92Bu8ic9cvVraahJ8ibHveZyQGTvacGaqGKA==
X-Gm-Gg: ASbGncsqPVZ32G7RwJolcnezgs5T2oaNwVNKhNiTCQePkp4vFcdS96i0638TaomuC5y
	KRJsV8v/Kw16XhZI/rQTXg/NZoCr9T1bs6fP6VOpaaHg1wBmbJmrjua2gEFpLoWMSlLeabOckup
	LVcBPRwgs7HFUaA6X9/kFOqOrDOn9WLBhdvlevuP9qLNDsCsKMfqac5R3GZuWUXwjJ2v9G7mObG
	vBTVy0z1WzDinLr4Gzxploy8BSe82kOZvlR8xOswRwzdeWBsTS5Y+0mDHj4CPyTGLknldUtBnPj
	5sKteEk4nb/Qi2IJWVoXSldR9Zs=
X-Received: by 2002:a05:6000:4406:b0:3a5:300d:5e17 with SMTP id ffacd0b85a97d-3b2001ac272mr2916168f8f.29.1751530725438;
        Thu, 03 Jul 2025 01:18:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHW0kGfmmDWUEurUd2wl4ocsEjWEOjLs4QoNc2p+iimi1Wz7I4Ohva/pHwVEIrj+lRpCHqhCA==
X-Received: by 2002:a05:6000:4406:b0:3a5:300d:5e17 with SMTP id ffacd0b85a97d-3b2001ac272mr2916144f8f.29.1751530724857;
        Thu, 03 Jul 2025 01:18:44 -0700 (PDT)
Received: from sgarzare-redhat ([193.207.200.84])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c80b516sm17574612f8f.41.2025.07.03.01.18.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 01:18:44 -0700 (PDT)
Date: Thu, 3 Jul 2025 10:18:39 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Michal Luczaj <mhal@rbox.co>
Cc: "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Stefan Hajnoczi <stefanha@redhat.com>, virtualization@lists.linux.dev, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v3 1/3] vsock: Fix transport_{g2h,h2g} TOCTOU
Message-ID: <ed4jqbmfre4ggtza76lpzq77szhgxdfy5fgokqgfzdy3bdop42@wnp2s6mxejvj>
References: <20250702-vsock-transports-toctou-v3-0-0a7e2e692987@rbox.co>
 <20250702-vsock-transports-toctou-v3-1-0a7e2e692987@rbox.co>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20250702-vsock-transports-toctou-v3-1-0a7e2e692987@rbox.co>

On Wed, Jul 02, 2025 at 03:38:43PM +0200, Michal Luczaj wrote:
>vsock_find_cid() and vsock_dev_do_ioctl() may race with module unload.
>transport_{g2h,h2g} may become NULL after the NULL check.
>
>Introduce vsock_transport_local_cid() to protect from a potential
>null-ptr-deref.
>
>KASAN: null-ptr-deref in range [0x0000000000000118-0x000000000000011f]
>RIP: 0010:vsock_find_cid+0x47/0x90
>Call Trace:
> __vsock_bind+0x4b2/0x720
> vsock_bind+0x90/0xe0
> __sys_bind+0x14d/0x1e0
> __x64_sys_bind+0x6e/0xc0
> do_syscall_64+0x92/0x1c0
> entry_SYSCALL_64_after_hwframe+0x4b/0x53
>
>KASAN: null-ptr-deref in range [0x0000000000000118-0x000000000000011f]
>RIP: 0010:vsock_dev_do_ioctl.isra.0+0x58/0xf0
>Call Trace:
> __x64_sys_ioctl+0x12d/0x190
> do_syscall_64+0x92/0x1c0
> entry_SYSCALL_64_after_hwframe+0x4b/0x53
>
>Fixes: c0cfa2d8a788 ("vsock: add multi-transports support")
>Suggested-by: Stefano Garzarella <sgarzare@redhat.com>
>Signed-off-by: Michal Luczaj <mhal@rbox.co>
>---
> net/vmw_vsock/af_vsock.c | 27 +++++++++++++++++++++------
> 1 file changed, 21 insertions(+), 6 deletions(-)

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

Thanks!
Stefano

>
>diff --git a/net/vmw_vsock/af_vsock.c b/net/vmw_vsock/af_vsock.c
>index 2e7a3034e965db30b6ee295370d866e6d8b1c341..39473b9e0829f240045262aef00cbae82a425dcc 100644
>--- a/net/vmw_vsock/af_vsock.c
>+++ b/net/vmw_vsock/af_vsock.c
>@@ -531,9 +531,25 @@ int vsock_assign_transport(struct vsock_sock *vsk, struct vsock_sock *psk)
> }
> EXPORT_SYMBOL_GPL(vsock_assign_transport);
>
>+/*
>+ * Provide safe access to static transport_{h2g,g2h,dgram,local} callbacks.
>+ * Otherwise we may race with module removal. Do not use on `vsk->transport`.
>+ */
>+static u32 vsock_registered_transport_cid(const struct vsock_transport **transport)
>+{
>+	u32 cid = VMADDR_CID_ANY;
>+
>+	mutex_lock(&vsock_register_mutex);
>+	if (*transport)
>+		cid = (*transport)->get_local_cid();
>+	mutex_unlock(&vsock_register_mutex);
>+
>+	return cid;
>+}
>+
> bool vsock_find_cid(unsigned int cid)
> {
>-	if (transport_g2h && cid == transport_g2h->get_local_cid())
>+	if (cid == vsock_registered_transport_cid(&transport_g2h))
> 		return true;
>
> 	if (transport_h2g && cid == VMADDR_CID_HOST)
>@@ -2536,18 +2552,17 @@ static long vsock_dev_do_ioctl(struct file *filp,
> 			       unsigned int cmd, void __user *ptr)
> {
> 	u32 __user *p = ptr;
>-	u32 cid = VMADDR_CID_ANY;
> 	int retval = 0;
>+	u32 cid;
>
> 	switch (cmd) {
> 	case IOCTL_VM_SOCKETS_GET_LOCAL_CID:
> 		/* To be compatible with the VMCI behavior, we prioritize the
> 		 * guest CID instead of well-know host CID (VMADDR_CID_HOST).
> 		 */
>-		if (transport_g2h)
>-			cid = transport_g2h->get_local_cid();
>-		else if (transport_h2g)
>-			cid = transport_h2g->get_local_cid();
>+		cid = vsock_registered_transport_cid(&transport_g2h);
>+		if (cid == VMADDR_CID_ANY)
>+			cid = vsock_registered_transport_cid(&transport_h2g);
>
> 		if (put_user(cid, p) != 0)
> 			retval = -EFAULT;
>
>-- 
>2.49.0
>

