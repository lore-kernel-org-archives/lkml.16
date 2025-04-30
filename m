Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9951623505F
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 09:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746005332; cv=none; b=lGy+R8Sks6Zg9NrVp6EmFweJJ2+hbrIcAOFhmEBzlMucIHoVn27O/nrtA8/hsn5SRx6R08fyH8huACry5WyOBM88qEZZfpeRwsftE0tI+fUPY7HuwCGvdyBY+hWsrdsc+4G04ZiT43U3lWitdUQ18pxf+rH96kqo5iGQY22VEVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746005332; c=relaxed/simple;
	bh=CfCKT7csdC6kxz8qRaiEnDt65u+ulhVQn+dGe+7KfZc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CcFZaGJmvZKuwNFxqahBwpaJR1aSoYzuGhZm5OSPIgvwGCfurB5bKdp+52Tms8ntpeIVIvXZ4QJPnRdfObJnex4ZeenAl+YUJ+rZ28hNVzCC+5e4cYqTi3KrEQCRneC4esZB2IM1xi17ZQtdNjhWkFpDYlmAYBTLWKe2GUBYwYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BQVBf4wu; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BQVBf4wu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746005329;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=g+iRdHR/016I7PiLqqexsMYXzIsBDeKqTco6kET+eEo=;
	b=BQVBf4wuolcLgOaRJZGFP0Ry/961T7Qq5zdxtvMnXdeKEk7WzpTlQehfetbZuZeCnj29MD
	IbTVoYIPfsyXv6+eCRhJzXpZ8RA7xHmxGc6UHrtHEVRuAggU+3TALy/uj7JPJ0VLNoThMV
	qk5LPpT9yJVeVl0nk6QX2BlMTpO3Wpc=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-407-c3zmq4H5OXyS9zgtMLhBXQ-1; Wed, 30 Apr 2025 05:28:46 -0400
X-MC-Unique: c3zmq4H5OXyS9zgtMLhBXQ-1
X-Mimecast-MFC-AGG-ID: c3zmq4H5OXyS9zgtMLhBXQ_1746005325
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-ac2a113c5d8so511497466b.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 02:28:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746005325; x=1746610125;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g+iRdHR/016I7PiLqqexsMYXzIsBDeKqTco6kET+eEo=;
        b=Sk9laWN3A2Z/S3t6jRY3dIAdfiAh5EymEd+xvLqF9T3jACyqzBmSUUpn6udJtVdZdB
         4Sx/svfcLKuKMhZJliBbjOWYzQ4tAUQi5WAmxGemyPw5A0j6m5RFus4/d6hTtmpDXWFN
         hrOVcQ9Mo5PHpdJn9d9EW8OdQYD7oEhGj1GRl+k2oJhMv4RvLSkMDkt1JcgMTX9g5Wz4
         MrKHbP7INtGLUKVi5eAVzaoVNMQpcxCKiwwmU+6RohJJ9eLEugbgAyyXdzUAC7hvc4f8
         aoDBMpRqbqP4K+wVFZOISjeBMZMUL3szJD3UOOHsQu6kAKUpNaXdL5YY2zhy6rgcRBgR
         p0Dg==
X-Forwarded-Encrypted: i=1; AJvYcCUt7t3uTOVaEOVBQ3nPkf0zkxdoHtaT7M6QTuvjQ4ErGRhvej3kM/AUQL7T1L1VxrYx055AiyTR+kpzbmE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyi9u7OnvTZate0D9ipDc+R/dmte4byqXZbUx/jaQhMm5meHiEH
	p8Wz1u6queLRVjEojsOnya4n2h9H3lMh6e4dYUdTetHFI/k4gVcHP15hFQ/5x6fgVYYblTlds07
	j2MnnkzeRvOUDiJge78ZZeqaZSutkBLx0nWfPkjefzhssRxg6X5fOThYcGMsfiw==
X-Gm-Gg: ASbGncsSmkOLV9SFDV+VyOMItLcTJTUqddiBxL2/xUvz8s6B6AF5Pb+N4lG7GM1jck/
	1o9cBbCaKi1hqpgYkZyAXbv89kAAUT60qpQq4cDPoYAmLuIRnU9/47DpXCBvI9UV0pREHc1PcDO
	xE/SADA0mdMn1bPQJppopEgtYlWmT5SfDJp9tMN6A5dVVtO9GyCRtLYO0is/slQtGWFfwVlkbMF
	+LSPvT8Db/40Va9jBh3c9JJ69QW/uEijMIN32iU2hTF/XIeEKrmOr59TlF9MU4NWdWGBdXe56si
	bynOkDUuqCKWKP6Zvw==
X-Received: by 2002:a05:6402:3490:b0:5f7:eaf1:acd1 with SMTP id 4fb4d7f45d1cf-5f8aef99451mr1459116a12.10.1746005324757;
        Wed, 30 Apr 2025 02:28:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE81eWc8aL2LbvtLmC3j27kWn9yssNrgLAfG68UpEapDAHpJ7zaXyuHj+dnHphj20qrinwPqA==
X-Received: by 2002:a05:6402:3490:b0:5f7:eaf1:acd1 with SMTP id 4fb4d7f45d1cf-5f8aef99451mr1459078a12.10.1746005324176;
        Wed, 30 Apr 2025 02:28:44 -0700 (PDT)
Received: from sgarzare-redhat ([193.207.220.254])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f7e7e47be3sm5249067a12.30.2025.04.30.02.28.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 02:28:43 -0700 (PDT)
Date: Wed, 30 Apr 2025 11:28:26 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Michal Luczaj <mhal@rbox.co>
Cc: "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>, 
	Stefan Hajnoczi <stefanha@redhat.com>, virtualization@lists.linux.dev, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org
Subject: Re: [PATCH net-next v3 2/4] vsock/virtio: Reduce indentation in
 virtio_transport_wait_close()
Message-ID: <dlk4swnprv52exa3xs5omo76ir7e3x5u7bwlkkuecmrrn2cznm@smxggyqjhgke>
References: <20250430-vsock-linger-v3-0-ddbe73b53457@rbox.co>
 <20250430-vsock-linger-v3-2-ddbe73b53457@rbox.co>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20250430-vsock-linger-v3-2-ddbe73b53457@rbox.co>

On Wed, Apr 30, 2025 at 11:10:28AM +0200, Michal Luczaj wrote:
>Flatten the function. Remove the nested block by inverting the condition:
>return early on !timeout.

IIUC we are removing this function in the next commit, so we can skip 
this patch IMO. I suggested this change, if we didn't move the code in 
the core.

Thanks,
Stefano

>
>No functional change intended.
>
>Suggested-by: Stefano Garzarella <sgarzare@redhat.com>
>Signed-off-by: Michal Luczaj <mhal@rbox.co>
>---
> net/vmw_vsock/virtio_transport_common.c | 26 +++++++++++++-------------
> 1 file changed, 13 insertions(+), 13 deletions(-)
>
>diff --git a/net/vmw_vsock/virtio_transport_common.c b/net/vmw_vsock/virtio_transport_common.c
>index 49c6617b467195ba385cc3db86caa4321b422d7a..4425802c5d718f65aaea425ea35886ad64e2fe6e 100644
>--- a/net/vmw_vsock/virtio_transport_common.c
>+++ b/net/vmw_vsock/virtio_transport_common.c
>@@ -1194,23 +1194,23 @@ static void virtio_transport_remove_sock(struct vsock_sock *vsk)
>
> static void virtio_transport_wait_close(struct sock *sk, long timeout)
> {
>-	if (timeout) {
>-		DEFINE_WAIT_FUNC(wait, woken_wake_function);
>-		ssize_t (*unsent)(struct vsock_sock *vsk);
>-		struct vsock_sock *vsk = vsock_sk(sk);
>+	DEFINE_WAIT_FUNC(wait, woken_wake_function);
>+	ssize_t (*unsent)(struct vsock_sock *vsk);
>+	struct vsock_sock *vsk = vsock_sk(sk);
>
>-		unsent = vsk->transport->unsent_bytes;
>+	if (!timeout)
>+		return;
>
>-		add_wait_queue(sk_sleep(sk), &wait);
>+	unsent = vsk->transport->unsent_bytes;
>
>-		do {
>-			if (sk_wait_event(sk, &timeout, unsent(vsk) == 0,
>-					  &wait))
>-				break;
>-		} while (!signal_pending(current) && timeout);
>+	add_wait_queue(sk_sleep(sk), &wait);
>
>-		remove_wait_queue(sk_sleep(sk), &wait);
>-	}
>+	do {
>+		if (sk_wait_event(sk, &timeout, unsent(vsk) == 0, &wait))
>+			break;
>+	} while (!signal_pending(current) && timeout);
>+
>+	remove_wait_queue(sk_sleep(sk), &wait);
> }
>
> static void virtio_transport_cancel_close_work(struct vsock_sock *vsk,
>
>-- 
>2.49.0
>

