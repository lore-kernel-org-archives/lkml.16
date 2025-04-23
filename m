Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DC8919DFA7
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 15:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745423602; cv=none; b=riU8FYrdnDqIOonnCS9hmHggRO2BbbbWozZJ9mnjQ+dxW0B+bNtBu8m1/ysiQ8rZTfW6i6Xzd2XX/cFV8PU20KnZPbmJoSOCu0BIV66HNdjgp65rZkRtr+gKOlVDeAsvo5mVPmHxQ9GxhetYShDjD3jpTMUIKtxHYiiXIhWfE0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745423602; c=relaxed/simple;
	bh=9F5t42L4T7DlrKAbIEzJacTshtoofiMJhhUWO+3Np/g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J00VLnT/lDd01wCE5IKx+aIKExkRxf+VrIU1tpQjRIXVzR34stnLVptsLt0FY7b2u8DVEAUvMuvh705+LTVCFOlWV1DrPMv41cRmGwlcsJxZOLwd8VOXoQvzGVhcEpObd1PcpphAWOqgWYgXG+IeEBK5fbrLSDYP/1E3bjxKfDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SNCEYJdo; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SNCEYJdo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745423598;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4vXjdITA2otLqOLfSkM93EoHhrqfeYMofeR1JyUMjL4=;
	b=SNCEYJdo7nhpxVk8M+AtmeH8RaV0IxA6XwD6HCL23i/4NP8KrMxho1FEIiyOSmMkzOuEG8
	G+tuVJzgliwLhrtwJLS55wyikg+SQky0cUxZ3lMPu/x4ntTP1ZHPWLImhhoNOU0rIWCopB
	m8gb+LW+Sor8aDBVtLKqeCub3cCg5Rs=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-401-R-_Mi8iSODOaQyVCK-I0FQ-1; Wed, 23 Apr 2025 11:53:16 -0400
X-MC-Unique: R-_Mi8iSODOaQyVCK-I0FQ-1
X-Mimecast-MFC-AGG-ID: R-_Mi8iSODOaQyVCK-I0FQ_1745423595
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43efa869b19so39783335e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 08:53:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745423595; x=1746028395;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4vXjdITA2otLqOLfSkM93EoHhrqfeYMofeR1JyUMjL4=;
        b=QTt7DCrrfcXMgwUflHwehGgvjys/tOb6rjlTVl7hcT6LpkhbafmhOdNWZugu7eC5nM
         vxx1ngMZ9XyugCcX9vvMk63KDlf52+ljbl8RxhlD3S8Ca8gPBEPfEfeNPd02yiChgPPy
         N0kW2eTxyJ+q3Ae1NKAprCewG+bEGXikb6wQ0lbhwV2wYU3JDr3Yfep4KVJJoTGaHYIF
         Uq2NTNxsxwrzaJZqrsXhlVJhVzFy0M28MT8aAt2TnwR8cfG0xO+Cx7Mzl0n+NTtNX9DB
         T4aRvp7eqXEc1hmy/+KEthh7bHGkRxEMJnB5os4GhyjbpJASshPz3MxfyxJZP1nlTbMl
         0qZA==
X-Forwarded-Encrypted: i=1; AJvYcCXZRmr/U+Uu9UPU3ksY1gtg4EDjO6AYHYg5mQMzXulgHvoBXzy4QD5RvLGngUbjPhTJh+6yEnH/YA2u9v0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwRmGmUzS5Y9D9t9ut7PJzYWY7IjciSP8ZJu2ueLLPF9p+0GyjP
	NcyE9sjKFPBdbzNdO9IkfZSN1ecrrUaZAu9kowrBLmEuHV3JpKOMK9Phag6qmm22pTLXGvmg8/D
	6YWXu6hmHkeEbdRYGcPmfDxsu60sNa+SThWOcaveKROoq2T9BDxdhG2cZMO0orA==
X-Gm-Gg: ASbGncvIRi7AZj5c7WCnOPF9uHY8ZxZKJFka1lkbHd2S3gzElm6MArMp4difHbYjtIq
	jYzfbIOKJbdw8RH6j03ez+Ph0HrHL5OLpnTdtwefvnLOWVMjRmwQgYRezIOb14psBqER1Sm0KVA
	YrbvgUMt9gr+Ephsp/EewZWqcEwTMoLJezN1i9JnTYB1hlj8fOF9XWbykv0LsUdnBjjaHFZomEV
	pCVfTJf4FFSnNvfEHPVXMvJFr91aJuPulR0Br1G5oF2HD+pFcz2UG3PA0yvFn1foJ7kxxQsEMu2
	EW7X6UVH2jMgtg==
X-Received: by 2002:a05:6000:402b:b0:39c:e0e:bb46 with SMTP id ffacd0b85a97d-39efba383d1mr15395531f8f.4.1745423595609;
        Wed, 23 Apr 2025 08:53:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF3Ev46g9NwPjawD8USomZKAsrAiFv9uPuXFN35OxT/qY5CZ5sbL5NV6EP3Ne7VxwIqM91Svg==
X-Received: by 2002:a05:6000:402b:b0:39c:e0e:bb46 with SMTP id ffacd0b85a97d-39efba383d1mr15395506f8f.4.1745423595246;
        Wed, 23 Apr 2025 08:53:15 -0700 (PDT)
Received: from leonardi-redhat ([151.29.33.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa493212sm19371776f8f.66.2025.04.23.08.53.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 08:53:14 -0700 (PDT)
Date: Wed, 23 Apr 2025 17:53:12 +0200
From: Luigi Leonardi <leonardi@redhat.com>
To: Michal Luczaj <mhal@rbox.co>
Cc: Stefano Garzarella <sgarzare@redhat.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>, 
	Stefan Hajnoczi <stefanha@redhat.com>, virtualization@lists.linux.dev, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org
Subject: Re: [PATCH net-next v2 1/3] vsock: Linger on unsent data
Message-ID: <km2nad6hkdi3ngtho2xexyhhosh4aq37scir2hgxkcfiwes2wd@5dyliiq7cpuh>
References: <20250421-vsock-linger-v2-0-fe9febd64668@rbox.co>
 <20250421-vsock-linger-v2-1-fe9febd64668@rbox.co>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20250421-vsock-linger-v2-1-fe9febd64668@rbox.co>

Hi Michal,

On Mon, Apr 21, 2025 at 11:50:41PM +0200, Michal Luczaj wrote:
>Currently vsock's lingering effectively boils down to waiting (or timing
>out) until packets are consumed or dropped by the peer; be it by receiving
>the data, closing or shutting down the connection.
>
>To align with the semantics described in the SO_LINGER section of man
>socket(7) and to mimic AF_INET's behaviour more closely, change the logic
>of a lingering close(): instead of waiting for all data to be handled,
>block until data is considered sent from the vsock's transport point of
>view. That is until worker picks the packets for processing and decrements
>virtio_vsock_sock::bytes_unsent down to 0.
>
>Note that such lingering is limited to transports that actually implement
>vsock_transport::unsent_bytes() callback. This excludes Hyper-V and VMCI,
>under which no lingering would be observed.
>
>The implementation does not adhere strictly to man page's interpretation of
>SO_LINGER: shutdown() will not trigger the lingering. This follows AF_INET.
>
>Signed-off-by: Michal Luczaj <mhal@rbox.co>
>---
> net/vmw_vsock/virtio_transport_common.c | 13 +++++++++++--
> 1 file changed, 11 insertions(+), 2 deletions(-)
>
>diff --git a/net/vmw_vsock/virtio_transport_common.c b/net/vmw_vsock/virtio_transport_common.c
>index 7f7de6d8809655fe522749fbbc9025df71f071bd..aeb7f3794f7cfc251dde878cb44fdcc54814c89c 100644
>--- a/net/vmw_vsock/virtio_transport_common.c
>+++ b/net/vmw_vsock/virtio_transport_common.c
>@@ -1196,12 +1196,21 @@ static void virtio_transport_wait_close(struct sock *sk, long timeout)
> {
> 	if (timeout) {
> 		DEFINE_WAIT_FUNC(wait, woken_wake_function);
>+		ssize_t (*unsent)(struct vsock_sock *vsk);
>+		struct vsock_sock *vsk = vsock_sk(sk);
>+
>+		/* Some transports (Hyper-V, VMCI) do not implement
>+		 * unsent_bytes. For those, no lingering on close().
>+		 */
>+		unsent = vsk->transport->unsent_bytes;
>+		if (!unsent)
>+			return;

IIUC if `unsent_bytes` is not implemented, virtio_transport_wait_close 
basically does nothing. My concern is that we are breaking the userspace 
due to a change in the behavior: Before this patch, with a vmci/hyper-v 
transport, this function would wait for SOCK_DONE to be set, but not 
anymore.

>
> 		add_wait_queue(sk_sleep(sk), &wait);
>
> 		do {
>-			if (sk_wait_event(sk, &timeout,
>-					  sock_flag(sk, SOCK_DONE), 
>&wait))
>+			if (sk_wait_event(sk, &timeout, unsent(vsk) == 
>0,
>+					  &wait))
> 				break;
> 		} while (!signal_pending(current) && timeout);
>
>
>-- 2.49.0
>

Thanks,
Luigi

