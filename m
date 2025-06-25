Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1023A286417
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 08:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750841007; cv=none; b=VnBQVDz7tMx6WLHJa6ODdok5BhoZQhWO25xOZUZW0dUZRvFgfRaQSSjjrOgLYMvMFofu4QUkG34pPnMvEow8tMOJKX9K8URPWe6Zu3oMsTz1Tr1eadrFcamSjqnF+a/6XIwMzHaLPyJCId9N2XxHumbgTcibwuQ5bW6zfprR1zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750841007; c=relaxed/simple;
	bh=BKtDcFi1Di1ki3VEVQwPsdVZaQrBBaEmFv2TZrKgRUk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IPtCLFNK4PQOpIK3BlkGa/jwVnSASbOewO50TRDkNljwx42zNphC8C+CUVnvWkPhu+i8U0ZrZX6monjCOkIza26BCostfXqeNP9V3lnfLeUZsQ7Y0PFxFKSZfXztGeCM5xs+Jv0dVH0Te1QUcGgRPgr7y8cxJzSu9EWFdDJTSs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ehjd1MSk; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ehjd1MSk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750841004;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fBqo0mSOQ7uYPQmFn/GbeEwpagKUqVWJtoBByFsAo4c=;
	b=Ehjd1MSkvhjTlx03oy4I3RO9VY2YCKhhylowJ8ptvq0lBxVCJKbuFdvQqVIK6NnqnuR00W
	wg07tTR5uX5bnjErS3yia0I85XaymRmpEJ8NDgkLLMZB22WtN9/a9AuJU8Y5TqUZxbR8MX
	uuwDsdYuS8D2LrdvXv6N1964hsQddxM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-442-hw2xBu8CNaa_UBZ5Yqw2JA-1; Wed, 25 Jun 2025 04:43:22 -0400
X-MC-Unique: hw2xBu8CNaa_UBZ5Yqw2JA-1
X-Mimecast-MFC-AGG-ID: hw2xBu8CNaa_UBZ5Yqw2JA_1750841001
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3a5780e8137so338214f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 01:43:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750841001; x=1751445801;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fBqo0mSOQ7uYPQmFn/GbeEwpagKUqVWJtoBByFsAo4c=;
        b=gkd8VH3kAXdXR6jVrnj5dNsW+f0n7O/uc1YyT+UgahYiZUVseVz8bJ+Kk5fvOBJZHG
         86U+XxXlqlI+6jYEzyEw2hSecBTPtbFE0N/7cr8P8nEjgn+oGPFeK0AJprn7tyP5XwdI
         YaV51TNkgS2RWvcbkCY3av1ldhlsCSXMlAsD7MnSop1FIVvoIinAefwDj6lIGMSNVU5c
         5H3iVJgzTp2huOkFvoWDrsxbPNOTlGMybZkIw8Pp+vfBCa1MIBUC0xSRs56VX4PXJybt
         TSJEu0bGxdcXst0/PdPY3QGx44oC1zrveeeITct/fbc9M+9R7e3Lx9cjn9eHEusZb01m
         V7pw==
X-Forwarded-Encrypted: i=1; AJvYcCVFz8MfL8PCi4cCL7nOQ+7Br3bfn0VF+GfpYAZEyZJgc6UoSHW34U3HP/nhfwrCO4AT70pVUdiIyQyo2qg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwkR1hh6IwdqEXyM8Vze3Ow7s2HZ5jKn77vgyaoych+MAvXYZdq
	RIyeq9TzM8ZI1RCRoAnMUswKEYov7Njh9H22Zie/+7EbIUJei9oYs2xqpf+Hv7/QWz1+wwQrNPb
	LKicQbJex5B2VV2QwUDIdnpFNpp3dTa7C4/EuPqHs9BTKEayut0qSFass6tUN+iHOhQ==
X-Gm-Gg: ASbGncvJNnke3f/KwXS0zq8P1NMd+CqxbCSKLecTTcaM3wBamBhvL7jY9QQYzQZUqCO
	is/A6mIKrTgtShLUqkvx1PWXave/fPrUzhzDuzFG83y53zFuu9NpGqTzUeDrC/C+cNXvGXOWe2h
	YpzAKiw9YRYAmVfKVJ0+U84otcF4jDBBf9Fqt+Lee/wP534FrrUrWcb1OyooYzSu431+tWS4Gic
	YZKW6yJw6AzGc25Vu+qkhLKQ7DpQxzf9XH4IKxRY6fD0poO0Rw8U+w6iy6aRBualHL8kFHnw/g5
	2cFZGKyBTbSBfD2h0daJxxro+SFw
X-Received: by 2002:a5d:64e6:0:b0:3a4:f722:a46b with SMTP id ffacd0b85a97d-3a6e71ff6aamr5892466f8f.15.1750841000855;
        Wed, 25 Jun 2025 01:43:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEwLmN7pgjPo42yw5pKV9YdU4xug/vMd5HIXDLqwYvt3dwxUtKIILfncsdF1q/xkL+ig67Dmg==
X-Received: by 2002:a5d:64e6:0:b0:3a4:f722:a46b with SMTP id ffacd0b85a97d-3a6e71ff6aamr5892437f8f.15.1750841000364;
        Wed, 25 Jun 2025 01:43:20 -0700 (PDT)
Received: from sgarzare-redhat ([193.207.151.122])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45382363f7fsm12918295e9.27.2025.06.25.01.43.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 01:43:19 -0700 (PDT)
Date: Wed, 25 Jun 2025 10:43:12 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Michal Luczaj <mhal@rbox.co>
Cc: "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Stefan Hajnoczi <stefanha@redhat.com>, virtualization@lists.linux.dev, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC net v2 1/3] vsock: Fix transport_{g2h,h2g} TOCTOU
Message-ID: <zdiqu6pszqwb4y5o7oqzdovfvzkbrvc6ijuxoef2iloklahyoy@njsnvn7hfwye>
References: <20250620-vsock-transports-toctou-v2-0-02ebd20b1d03@rbox.co>
 <20250620-vsock-transports-toctou-v2-1-02ebd20b1d03@rbox.co>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20250620-vsock-transports-toctou-v2-1-02ebd20b1d03@rbox.co>

On Fri, Jun 20, 2025 at 09:52:43PM +0200, Michal Luczaj wrote:
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
> net/vmw_vsock/af_vsock.c | 23 +++++++++++++++++------
> 1 file changed, 17 insertions(+), 6 deletions(-)
>
>diff --git a/net/vmw_vsock/af_vsock.c b/net/vmw_vsock/af_vsock.c
>index 2e7a3034e965db30b6ee295370d866e6d8b1c341..63a920af5bfe6960306a3e5eeae0cbf30648985e 100644
>--- a/net/vmw_vsock/af_vsock.c
>+++ b/net/vmw_vsock/af_vsock.c
>@@ -531,9 +531,21 @@ int vsock_assign_transport(struct vsock_sock *vsk, struct vsock_sock *psk)
> }
> EXPORT_SYMBOL_GPL(vsock_assign_transport);
>
>+static u32 vsock_transport_local_cid(const struct vsock_transport **transport)

Why we need double pointer?

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
>+	if (cid == vsock_transport_local_cid(&transport_g2h))
> 		return true;
>
> 	if (transport_h2g && cid == VMADDR_CID_HOST)
>@@ -2536,18 +2548,17 @@ static long vsock_dev_do_ioctl(struct file *filp,
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
>+		cid = vsock_transport_local_cid(&transport_g2h);
>+		if (cid == VMADDR_CID_ANY)
>+			cid = vsock_transport_local_cid(&transport_h2g);

I still prefer the old `if ... else if ...`, what is the reason of this
change? I may miss the point.

But overall LGTM!

Thanks,
Stefano

>
> 		if (put_user(cid, p) != 0)
> 			retval = -EFAULT;
>
>-- 
>2.49.0
>

