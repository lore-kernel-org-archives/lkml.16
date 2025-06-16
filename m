Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 648292877E1
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 13:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750082047; cv=none; b=P1CjwKTZY6G9jguU8wYQ751/w4gep2UwMk0oRGyDXv1pRjhMvf9TH/H1DxecLTEtKTgue/7xoNm2gyRGjn/BO8rUbpgg7ekR6Jo1zUV4TDNINFV72rZiNT1cgZPsHTANH7KlcMJxsoPIwlLyYhAhXT6sm6rfj0lFEzfzFfuWI+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750082047; c=relaxed/simple;
	bh=ALufLifN8ET5GUUo9VdmBMb2kiTd+JEXg3vJP9CcLJ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oxJkKjsTnaEbL5zxlpPb1CMOw8XKFOrHVhys3FrRjJrXuuzfgfgO45vQ8UlW3EycdF/H0Puyv/QK42LQOm3xq3PZxWzl2wcpNGt/4r4PC3yO2Yt89z5StH2YplrI7Gqq8B+wD4lv8pD7esBq3Fk+HEJzKa7A4NBGuv5XId70Qn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FzGnlYMW; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FzGnlYMW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750082044;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HXRSgHsBoykaoCkGaODkCk80Pz+wKzFt/0k3tccKi30=;
	b=FzGnlYMW0DefksNaJ8K60nt15cqmriHP8gDVM2KeIHpVQdnT0janqupyXTRtFBb8A/ocgN
	ZqCdm5YWUF3Q0rsHPE5LZQ/RKzhUiiXGCaiJt9zxEIT0CX3Z4MSh/Abd8joDJ2A5ieAShU
	Il8KLSBMHqHvyaw/ZyQss6iHJgya3qA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-411-vjeSGmHVOtG4LlQvkHeJgg-1; Mon, 16 Jun 2025 09:54:02 -0400
X-MC-Unique: vjeSGmHVOtG4LlQvkHeJgg-1
X-Mimecast-MFC-AGG-ID: vjeSGmHVOtG4LlQvkHeJgg_1750082041
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-45311704cdbso23730485e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 06:54:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750082041; x=1750686841;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HXRSgHsBoykaoCkGaODkCk80Pz+wKzFt/0k3tccKi30=;
        b=Fuv4QDa1lNX4FIWT/WFJs15k8quvNieoRC6hlx70iHeR/iBXOJzQa2lsVc58gfSyL/
         lrFmiFvRuo4T0tFUU7mIw9eeD14gPZ4eMBg12S7sBN4zfZai3FqPVZzycsFDvmGxxAhh
         dz2/jA8Qrdbrozc0IP/x86hiwgi2JMWGTBQZTWU2hw7t08CTr50+hx4idDId6hCmVT25
         FT0Qm2ORSOcTuQBPKtlFe2hnuh5699zTljnzgHVcFYzSUDEkGySM3K9ug1UtWaad9oCd
         tYadIsUr52KS4y/LYBEfBVSwOCLhKGoBvpRKh8Hs430O9NrkJLUDamhWzK+ca+XkQxRb
         bVGA==
X-Forwarded-Encrypted: i=1; AJvYcCXbbKYarmFvqYZ54cdhVYcNQ1KhrgLy0mQ8uLde6ukpyq3XzykkuFD3MwdhwDZVVXkq1mLO8//qilZXZgM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMWyDCDinmuAjopbr9Z/X0jzXS/0bluPiaWtq8UcECcYpjyywZ
	046IHhARhHdluFeRjFKQH6e9SLSeD7f0ZxWyXheX30w9ncYZrOabebASArn9HBEhbLxtn6hlwLo
	4S8lyBYsghv3C7ZX6a+hr0QKYp37OXoqyjEgK7ZsFft0Vs6dzNrMyCZjRfIHaPlNwhg==
X-Gm-Gg: ASbGncvyWSrcnxRvOKTifyj9TE4sBO0Nrpugso5e6T8OJvgc789xOZdeZt2bdiaoa2c
	cUQi0dcE2SHkPo5CH36sF97jIi5lRcwXuA7YKehOexe3UKXv6+SPQ8WJT6r8Fn4S31NWaw96hxi
	vsCjre3PxA922kekklPjugYOzIWNYRTWAJGyH3k7Cv6ZymgYg5BydY9Nnoy5cPYhR3Mb6dtnapg
	eG/JH080NyrPrFii9TyAvyncZFPDhQxyzb+S1sB4k8xzFj9jbUieSnaqGJErctKZ0zTSxbmChYX
	Jp4e5Y9OfQ0dAZvSo0cDH9+44fQ=
X-Received: by 2002:a5d:5f8d:0:b0:3a4:fa6a:9174 with SMTP id ffacd0b85a97d-3a5723a36b1mr7744982f8f.33.1750082041415;
        Mon, 16 Jun 2025 06:54:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG9KK52CE4TM7xQev5LOLheuW7Ek08zbqpia8Xus0jUc0uv2rsRw4izzQxnWbncAFqkbNkuqg==
X-Received: by 2002:a5d:5f8d:0:b0:3a4:fa6a:9174 with SMTP id ffacd0b85a97d-3a5723a36b1mr7744946f8f.33.1750082040864;
        Mon, 16 Jun 2025 06:54:00 -0700 (PDT)
Received: from sgarzare-redhat ([193.207.202.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b403b4sm10933571f8f.80.2025.06.16.06.53.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 06:54:00 -0700 (PDT)
Date: Mon, 16 Jun 2025 15:53:53 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Xuewei Niu <niuxuewei97@gmail.com>
Cc: mst@redhat.com, pabeni@redhat.com, jasowang@redhat.com, 
	xuanzhuo@linux.alibaba.com, davem@davemloft.net, netdev@vger.kernel.org, stefanha@redhat.com, 
	virtualization@lists.linux.dev, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	fupan.lfp@antgroup.com, Xuewei Niu <niuxuewei.nxw@antgroup.com>
Subject: Re: [PATCH net-next v2 1/3] vsock: Add support for SIOCINQ ioctl
Message-ID: <xshb6hrotqilacvkemcraz3xdqcdhuxp3co6u3jz3heea3sxfi@eeys5zdpcfxb>
References: <20250613031152.1076725-1-niuxuewei.nxw@antgroup.com>
 <20250613031152.1076725-2-niuxuewei.nxw@antgroup.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20250613031152.1076725-2-niuxuewei.nxw@antgroup.com>

On Fri, Jun 13, 2025 at 11:11:50AM +0800, Xuewei Niu wrote:
>This patch adds support for SIOCINQ ioctl, which returns the number of
>bytes unread in the socket.
>
>Signed-off-by: Xuewei Niu <niuxuewei.nxw@antgroup.com>
>---
> include/net/af_vsock.h   |  2 ++
> net/vmw_vsock/af_vsock.c | 22 ++++++++++++++++++++++
> 2 files changed, 24 insertions(+)
>
>diff --git a/include/net/af_vsock.h b/include/net/af_vsock.h
>index d56e6e135158..723a886253ba 100644
>--- a/include/net/af_vsock.h
>+++ b/include/net/af_vsock.h
>@@ -171,6 +171,8 @@ struct vsock_transport {
>
> 	/* SIOCOUTQ ioctl */
> 	ssize_t (*unsent_bytes)(struct vsock_sock *vsk);
>+	/* SIOCINQ ioctl */
>+	ssize_t (*unread_bytes)(struct vsock_sock *vsk);

Instead of adding a new callback, can we just use 
`vsock_stream_has_data()` ?

Maybe adjusting it or changing something in the transports, but for 
virtio-vsock, it seems to me it does exactly what the new 
`virtio_transport_unread_bytes()` does, right?

Thanks,
Stefano

>
> 	/* Shutdown. */
> 	int (*shutdown)(struct vsock_sock *, int);
>diff --git a/net/vmw_vsock/af_vsock.c b/net/vmw_vsock/af_vsock.c
>index 2e7a3034e965..466b1ebadbbc 100644
>--- a/net/vmw_vsock/af_vsock.c
>+++ b/net/vmw_vsock/af_vsock.c
>@@ -1389,6 +1389,28 @@ static int vsock_do_ioctl(struct socket *sock, unsigned int cmd,
> 	vsk = vsock_sk(sk);
>
> 	switch (cmd) {
>+	case SIOCINQ: {
>+		ssize_t n_bytes;
>+
>+		if (!vsk->transport || !vsk->transport->unread_bytes) {
>+			ret = -EOPNOTSUPP;
>+			break;
>+		}
>+
>+		if (sock_type_connectible(sk->sk_type) &&
>+		    sk->sk_state == TCP_LISTEN) {
>+			ret = -EINVAL;
>+			break;
>+		}
>+
>+		n_bytes = vsk->transport->unread_bytes(vsk);
>+		if (n_bytes < 0) {
>+			ret = n_bytes;
>+			break;
>+		}
>+		ret = put_user(n_bytes, arg);
>+		break;
>+	}
> 	case SIOCOUTQ: {
> 		ssize_t n_bytes;
>
>-- 
>2.34.1
>

