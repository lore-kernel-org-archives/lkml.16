Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 715D923DEB6
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 16:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751475163; cv=none; b=klwBRL3s+8vczAp0br0t8wXh6S/MOjSAtS9G6kwsCjuGgVhXH57nloytP6jr/7wesXrfzsMFOWqLBeSLNZTSa79fGK76ImOOliPrP4o+NwAJ/K3gG2JV8lkjvcO7/0+qQwEgNU3RvpNKy0PyQmLNxXN4upKZsvQMsV+k+Raxbsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751475163; c=relaxed/simple;
	bh=qVCMZTaISxLivTk7+kWrRgV2aF90WxiPZyvJQoVyT4c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IbzRfcD7sei3rPhRemBrzaOwSEoyLfbtMRfr777CTfWTtI0LelMc0TJxsGnOit4V/ib9Fow26Al+aNOgpNmYUAKR4CaLitde+9uhdSyNkbSTLSgmwVN9EyOFzy+PWDQrPSbKlr5uE2QpKM3WfMXqhRMTrW35/IWJaITHgz7mYZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GhpBZRvC; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GhpBZRvC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751475160;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DVmK+GBkVK6o0CyGzNkEe+iO0xXlQBKsvPUrRNPTdNY=;
	b=GhpBZRvCMOAOI3XZh9dUxan1NqundEzmsEMtOeLf18aWKxfhHQ0Nd5UCdC03serjktqCJr
	ImuZX4bhsH70vl+eSKfwOWEzVkdf59Ip12XiE6emAMlIfVYom8UjVnOLAB7y24AKyM7xOo
	b3TRavQNVMbm9bsJEHvf8hLrARJOJG4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-606-GR3-4Z_YMg2tutQGZVthUA-1; Wed, 02 Jul 2025 12:52:36 -0400
X-MC-Unique: GR3-4Z_YMg2tutQGZVthUA-1
X-Mimecast-MFC-AGG-ID: GR3-4Z_YMg2tutQGZVthUA_1751475154
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4532514dee8so46155675e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 09:52:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751475154; x=1752079954;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DVmK+GBkVK6o0CyGzNkEe+iO0xXlQBKsvPUrRNPTdNY=;
        b=OcLU6F5TAio9NpjzMKZLs+ZBPLsf0TLHwYMGdCL9kgh+B+MlcTkDM3mAbf4Lcqpgwl
         HTheiIYNsnUAghtL3i0FiBU/IkpIcO+9xWHyDWVOzvyzdwxpTK8d6sWyWCBdno52VoVz
         Sb58JBSwjzevGOtBG/cYV5Utz4xC+qyoOQs3mjXGcRvOKbhMBN3sFehJR4TNTVJBj+/z
         VaFAdq9xG349uqHqnrS3RWoT23ybvURb3XIufy8i+gBp7j3ZG9JE1n/QhtGaM0mcZd2o
         2JYqTG6yQr6dtg3/0xY7mo4NWCEVYl1LZoNiQNZUv3ppkKe5IL9+/tR2ONotKo4YBSAh
         kO6Q==
X-Gm-Message-State: AOJu0YwJ0f3kDPRolTlP6XAJY6F9wUkl41H+Hw82XGHXWRaGaxnqBfg0
	MMaiHV2nEFAl0nVWqU6mPE3nbEUl08U0ql7HiNv9H3SmNPPqK3/VZc/jCpWoZMYjFZ4tZJjBgiB
	iU4juB42ogue7U5eJE9KCAf0+00d8DhimVHnlwd4iWTSC3/LqUy7eq4lPGR0Erc1bTA==
X-Gm-Gg: ASbGncu2SqygEsRRDVqJVNojGVCbJaioZRh/E5DWju3XZ6vBFd8jW8MwyjuXKEs21da
	lmuMsmXVcxEOJdv+sJ4r30hYpl2klm14obRPFHFOtbMwY5J09wg7pRqx1qshgTqSL2411bG02Z7
	bq/2QU4foTIQ8x8jmzU/6baeUCdhQJ/u2ufbIMWIDbxu/4mFeg0S9HjMGqnHYqdDU1uVkrBmSEo
	P1sPnPbEz2+7UTyeD254fitEXM3bf8lf9Qx/0GFFfjXtOXEEonlQlnc3jZw1fHuwi33aNfQ0gQJ
	onPxuy/DSveJc0f++n3RUclRR0E=
X-Received: by 2002:a05:600c:3504:b0:453:a95:f07d with SMTP id 5b1f17b1804b1-454a36e6310mr46254915e9.10.1751475153823;
        Wed, 02 Jul 2025 09:52:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH/iMFiOin+Y92R8cOiRVQwWoz7ykHbNXjulAxwXZzp4AivEVwBGwId8u9eEgfnW6G2MVF+CA==
X-Received: by 2002:a05:600c:3504:b0:453:a95:f07d with SMTP id 5b1f17b1804b1-454a36e6310mr46254455e9.10.1751475153179;
        Wed, 02 Jul 2025 09:52:33 -0700 (PDT)
Received: from sgarzare-redhat ([193.207.161.84])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454a9972011sm3013185e9.9.2025.07.02.09.52.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 09:52:32 -0700 (PDT)
Date: Wed, 2 Jul 2025 18:52:24 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Will Deacon <will@kernel.org>
Cc: linux-kernel@vger.kernel.org, Keir Fraser <keirf@google.com>, 
	Steven Moreland <smoreland@google.com>, Frederick Mayle <fmayle@google.com>, 
	Stefan Hajnoczi <stefanha@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
	Jason Wang <jasowang@redhat.com>, Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>, 
	netdev@vger.kernel.org, virtualization@lists.linux.dev
Subject: Re: [PATCH v2 8/8] vsock/virtio: Allocate nonlinear SKBs for
 handling large transmit buffers
Message-ID: <7ff2lvfjrfyx4imh3yfhimiz76znfomnm73kcrlt4rxjciamkc@ddjo7isrx6vr>
References: <20250701164507.14883-1-will@kernel.org>
 <20250701164507.14883-9-will@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20250701164507.14883-9-will@kernel.org>

On Tue, Jul 01, 2025 at 05:45:07PM +0100, Will Deacon wrote:
>When transmitting a vsock packet, virtio_transport_send_pkt_info() calls
>virtio_transport_alloc_linear_skb() to allocate and fill SKBs with the
>transmit data. Unfortunately, these are always linear allocations and
>can therefore result in significant pressure on kmalloc() considering
>that the maximum packet size (VIRTIO_VSOCK_MAX_PKT_BUF_SIZE +
>VIRTIO_VSOCK_SKB_HEADROOM) is a little over 64KiB, resulting in a 128KiB
>allocation for each packet.
>
>Rework the vsock SKB allocation so that, for sizes with page order
>greater than PAGE_ALLOC_COSTLY_ORDER, a nonlinear SKB is allocated
>instead with the packet header in the SKB and the transmit data in the
>fragments. No that this affects both the vhost and virtio transports.
>
>Signed-off-by: Will Deacon <will@kernel.org>
>---
> net/vmw_vsock/virtio_transport_common.c | 5 +++--
> 1 file changed, 3 insertions(+), 2 deletions(-)

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

>
>diff --git a/net/vmw_vsock/virtio_transport_common.c b/net/vmw_vsock/virtio_transport_common.c
>index c9eb7f7ac00d..f74677c3511e 100644
>--- a/net/vmw_vsock/virtio_transport_common.c
>+++ b/net/vmw_vsock/virtio_transport_common.c
>@@ -109,7 +109,8 @@ static int virtio_transport_fill_skb(struct sk_buff *skb,
> 		return __zerocopy_sg_from_iter(info->msg, NULL, skb,
> 					       &info->msg->msg_iter, len, NULL);
>
>-	return memcpy_from_msg(skb_put(skb, len), info->msg, len);
>+	virtio_vsock_skb_put(skb);
>+	return skb_copy_datagram_from_iter(skb, 0, &info->msg->msg_iter, len);
> }
>
> static void virtio_transport_init_hdr(struct sk_buff *skb,
>@@ -261,7 +262,7 @@ static struct sk_buff *virtio_transport_alloc_skb(struct virtio_vsock_pkt_info *
> 	if (!zcopy)
> 		skb_len += payload_len;
>
>-	skb = virtio_vsock_alloc_linear_skb(skb_len, GFP_KERNEL);
>+	skb = virtio_vsock_alloc_skb(skb_len, GFP_KERNEL);
> 	if (!skb)
> 		return NULL;
>
>-- 
>2.50.0.727.gbf7dc18ff4-goog
>

