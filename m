Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91504280308
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 13:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750081381; cv=none; b=VIDPwMoFULNm0n3mXQONKBZC00aLiSUvh0iO1dVQdDvlc5yDoknOjx2BwAHylh8u/u2em7yLdNdUyrk0Zga0a33WjKQE39SdKNQxVUpwAqFdojnODn89AD59I4oAvRWn+81sgtFLbizQ9249qsUyp1KY9+pfXXbqKe1lAwwwXqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750081381; c=relaxed/simple;
	bh=VnrsqW0cFhf4bv6MzZGMbjFwbnVzVssH5gqIsZDw+uc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JRaEjNfQL5rjz/AErmBP+ecluzViuEi0+jj+27awRKuye1tKWZoZIZOcja8112+fhB/R6GXZSkVUJ7UB2IMHO9487ZC+zu8XeHWnHtsYFdl+5DsH0IecCavlVSQYYnCMIwqdq3XoX3bt2v04SSVZ1uTboGtWB8R6bkwKeabwz0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=K0GsoDLU; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="K0GsoDLU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750081378;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qYooHu95agsZ2B7UMKycranS7g+0oNMg2oTlfmTsJ8A=;
	b=K0GsoDLUDVgGX3b2oKbs+xemBFwKPLBp7FWkp201YGUkLKAnkydz+9hQSgwbl8StSoxi0/
	QH+DshQzdxsb1IAjno7ILO1Mn6pAFqq+hfGHy680NnZkyDDUZjkYuMFH+gvSbM2RJLto2k
	xXh8nqBW/GWGildMDZwyEBb5K2j8Gsg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-669-6B6KRoaiOkmDCdjzT5KEKQ-1; Mon, 16 Jun 2025 09:42:57 -0400
X-MC-Unique: 6B6KRoaiOkmDCdjzT5KEKQ-1
X-Mimecast-MFC-AGG-ID: 6B6KRoaiOkmDCdjzT5KEKQ_1750081376
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-450de98b28eso28347425e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 06:42:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750081376; x=1750686176;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qYooHu95agsZ2B7UMKycranS7g+0oNMg2oTlfmTsJ8A=;
        b=wGKVscm9Sr1uDeFv+sDrEy4t9FoVV4I9Ly0t/cgxtl09UGX5m6NpIXeVw5eGxvyylQ
         ynlRHVkJHL68+5JgCl9NcabDJpa9BT+oY7SMDqZiMuq7+D9sO4WnBWmPNI8dVjQ6XC38
         oy0mzZt6LYZrHMAdk1uV5aeWdyCSvSgEowbY/BhwFNyd0Ck5M2SaNMdduhjviWsXceLY
         4CN8KfewjKpULKNu+YOWVZ9t1XqvcHLChdQLC6xDblHhoNBKixPACIK+4KiZBCwIIK7i
         bHKeuAhrs60Zw9UAcvi/3xMWJcEvCWZ7oqUKE9Mg2EfGWZMyNNT39ue1G+Q9EwXpyOUi
         jLtA==
X-Forwarded-Encrypted: i=1; AJvYcCVrV+Y6l3rTaBxJhGzK+jTdlM0Dh2O38wNQle3HyCSNYW5pudwfoNxdmmWIWv/YtH9y79IhiiLNeAGG4Ag=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXygRSg3g0FT7rigtgVHNhGqYlHX8VlyPnk0dY+aq5+C2Iqell
	BqeK8JwSqVgVZjbXWTR1MwqtLrey6rqdLMxgiaAlUk0C3avfmOURkKSQdWuLFiNu2fK3w9f4JQl
	FM5Xn7dYOj5PKHaUhM63UrJHwez2g/9lkWdW3vhau4WcGYI6cDg7FbiMVOumCWb0RzQ==
X-Gm-Gg: ASbGncs379P2qPqo9kEWgec/k6tP4W2fnn33AVBd9HWWuDNlrUOazK1busHJtd4xZRF
	nwZOHLhJF8galzEtyESR0Wxin2MlMOfHZgqOVwJFx+Ar6+9wGl1p6R6Yd+w+dJUPT2dgFNG6qj8
	yZ3GH2EKNGpNVluvbejppvqpMtgExnqfI55ga5EGspPMdjk07k68k78LAp8wSWpKIfaxOXUS/mF
	+BDEop/Jh075qFjrG3tlZjh+nSbwRMGlYIq9p4aBmrHed+U/7skgkEA8TENUXK6a7lME3eOBbw1
	3t7wxfvreSKycjO932uOj8f4f9s=
X-Received: by 2002:a05:600d:d:b0:453:45f1:9c96 with SMTP id 5b1f17b1804b1-45345f19d92mr48060985e9.14.1750081376140;
        Mon, 16 Jun 2025 06:42:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF9QG30mvjeJ1Ut+tifvz1DPhVeIM1Fgs5sS6gUqPYjMUgSgqJf6605Ua8bVmyMnHzNApbnvg==
X-Received: by 2002:a05:600d:d:b0:453:45f1:9c96 with SMTP id 5b1f17b1804b1-45345f19d92mr48060675e9.14.1750081375726;
        Mon, 16 Jun 2025 06:42:55 -0700 (PDT)
Received: from leonardi-redhat ([176.206.17.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532dea1b1asm148612515e9.14.2025.06.16.06.42.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 06:42:55 -0700 (PDT)
Date: Mon, 16 Jun 2025 15:42:53 +0200
From: Luigi Leonardi <leonardi@redhat.com>
To: Xuewei Niu <niuxuewei97@gmail.com>
Cc: sgarzare@redhat.com, mst@redhat.com, pabeni@redhat.com, 
	jasowang@redhat.com, xuanzhuo@linux.alibaba.com, davem@davemloft.net, 
	netdev@vger.kernel.org, stefanha@redhat.com, virtualization@lists.linux.dev, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, fupan.lfp@antgroup.com, 
	Xuewei Niu <niuxuewei.nxw@antgroup.com>
Subject: Re: [PATCH net-next v2 1/3] vsock: Add support for SIOCINQ ioctl
Message-ID: <2bsvomi4vmkfn3w6ej4x3lafueergftigs32gdn7letgroffsf@huncf2veibjy>
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

Reviewed-by: Luigi Leonardi <leonardi@redhat.com>

