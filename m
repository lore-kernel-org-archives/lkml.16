Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E12371DDC1E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 10:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751021440; cv=none; b=RUgTvgSaFMOqmBTIe8LtfcTy7fb+UgqRljOYtl9L1TZQH67gRoOFet0N8s/HVlVT54WfZFGMvF2E1xftB1Kco96ftoRDPSbZdpY+zC2NWOnvJaQ8i9wTVfFKHhylLa27KrftfGAeagzQVmDVawfTh54DM91DsIn1kHGPnjeUaXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751021440; c=relaxed/simple;
	bh=BVHZXeFbpjqe+fGCkZrzN32CSukxqi5Z0bBDKpeU2bg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AaVCbPGGngaI2M9ICUvT2UKR1Dzvj4UjwPtAd6wYBjcRzgdfeEOMDDo9mH2KgRd9UwKQx1yQwVdSld0/VuGeS69c9gHc0MQ9Vd+rEhNArjjQu0tlV3yS9f/oTkfB2XuecJcNv8W5/38W79AfnOum5JSWLR39/xBNGysTbnd1z3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gL0A/hW0; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gL0A/hW0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751021438;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=htlFXUXFpvLyLzYGnFDK9X72riSzVnaZycxspABjtgs=;
	b=gL0A/hW0W/jX5DhSr5pQeXUT3YlZ/o3f/+HDa8hDiS8a8TyM6NM+21xn4JrOucDjFn0Y6o
	YquBcQ4k3GQuz295r5kDI27l8GEM7UcPTTOi1Rb0OeHodYWb4K0F8WC/fTfnZelP3r8b8H
	JP947TBk/X5R0J/FE7upPMlF1a5J/rY=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-365-_yo8F5N8Ocetb-LLbpCsgw-1; Fri, 27 Jun 2025 06:50:36 -0400
X-MC-Unique: _yo8F5N8Ocetb-LLbpCsgw-1
X-Mimecast-MFC-AGG-ID: _yo8F5N8Ocetb-LLbpCsgw_1751021436
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6face45b58dso28277446d6.3
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 03:50:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751021436; x=1751626236;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=htlFXUXFpvLyLzYGnFDK9X72riSzVnaZycxspABjtgs=;
        b=siCFT4asu1W9nmV9syvSN4j0pz+qRaUBoGRNtrrrmW+SfkJT+XxflXZ1TRWtfLoRyf
         c6pKVQFraeLY/8rEIgoaTdsAX3tJ+mGds9ZQcEqxUE4M6b4RrTXZlvd8+xg4XQD+ezWt
         7x+6AlTVKPGz+CU3ZaBqoVTGVqMrgIrQ2yE9pw9dob3B7087lfREq8RX6f5Dv9HYbG4C
         ewwg+1xDXudMDwtS851Vzg9Lipcp0McmMDFAfo8D3K4gAn73gqjeAjwPwpI/pZPp3FdI
         KIBzmqyhdsNzhLwKANBiL/gEhxJoAj8MydAerg88ct1OSeDcxsq/kIlW9FZbLQVRUwGk
         YILQ==
X-Gm-Message-State: AOJu0YzWlDR386DmW5m1ouIeAujhewuRmQgPGDQncaLXTCG5kx7Cg50U
	ISSxYAxdWPTTl8bxOqDFZh7oP/rIR0atXkVEH73mt919+Qg6uYgldmw+eRyqrjou9CPsepFkFyO
	lAQNXkIgWHTaqEfWNENwGK15BOa1f4F+UKhYVjf7GTsdZLVFeUxGy4GHqWVoyVUu5Dw==
X-Gm-Gg: ASbGncsF+jr1riF9z9dwDwSdYFbNGUda0RjPa+/27p+htXKCAve3aSO3sRlZ2GyT6xP
	aVtxSYR54eQTx/rqCCIWoat+xij+f5rH3cLo9tZRDojkoGZyzI/NAhfUkOGK4qgPrpOMMo91bPi
	jO5aB+/ta3+QSoLkiCAM5Vz4P+3pn/DkZ6/Vb+4X2GmJxQZfTQTKCA0dfP+I2wONfnRXHEonSsw
	2DPFvm8wHiSYxDaU4Q2QtVERDyyY+iRLIxO3F67sIGHGuYwcHUGjFrKWR97rFT8LERZ8/+qT6Ez
	JIj2B3PBz+vGAZheQbKAQa7/AUx8
X-Received: by 2002:ad4:5e8f:0:b0:6fb:66f7:643a with SMTP id 6a1803df08f44-7000224847fmr46956096d6.23.1751021435676;
        Fri, 27 Jun 2025 03:50:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFuVOPpSbDXmObd1CmdrkOaPEYJK4J2y+x493SsV5Ja2/xhandwC2sZzDDh/UAk4qzxJ+GDUw==
X-Received: by 2002:ad4:5e8f:0:b0:6fb:66f7:643a with SMTP id 6a1803df08f44-7000224847fmr46955756d6.23.1751021435242;
        Fri, 27 Jun 2025 03:50:35 -0700 (PDT)
Received: from sgarzare-redhat ([193.207.181.237])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd772e3f2dsm17866906d6.78.2025.06.27.03.50.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 03:50:34 -0700 (PDT)
Date: Fri, 27 Jun 2025 12:50:27 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Will Deacon <will@kernel.org>
Cc: linux-kernel@vger.kernel.org, Keir Fraser <keirf@google.com>, 
	Steven Moreland <smoreland@google.com>, Frederick Mayle <fmayle@google.com>, 
	Stefan Hajnoczi <stefanha@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
	Jason Wang <jasowang@redhat.com>, Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>, 
	netdev@vger.kernel.org, virtualization@lists.linux.dev
Subject: Re: [PATCH 5/5] vhost/vsock: Allocate nonlinear SKBs for handling
 large transmit buffers
Message-ID: <cuqzmhjjakvmbwvcyub75vvjxorjkmzxkuvwvwowhec6wuaghj@uyq6glnhxp5n>
References: <20250625131543.5155-1-will@kernel.org>
 <20250625131543.5155-6-will@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20250625131543.5155-6-will@kernel.org>

nit: I'd use `vsock/virtio: ` prefix since we are touching the virtio 
transport common code. Maybe we can mention that this will affect both
virtio and vhost transports.

On Wed, Jun 25, 2025 at 02:15:43PM +0100, Will Deacon wrote:
>When transmitting a vsock packet, virtio_transport_send_pkt_info() calls
>virtio_transport_alloc_skb() to allocate and fill SKBs with the transmit
>data. Unfortunately, these are always linear allocations and can
>therefore result in significant pressure on kmalloc() considering that
>the maximum packet size (VIRTIO_VSOCK_MAX_PKT_BUF_SIZE +
>VIRTIO_VSOCK_SKB_HEADROOM) is a little over 64KiB, resulting in a 128KiB
>allocation for each packet.
>
>Rework the vsock SKB allocation so that, for sizes with page order
>greater than PAGE_ALLOC_COSTLY_ORDER, a nonlinear SKB is allocated
>instead with the packet header in the SKB and the transmit data in the
>fragments.
>
>Signed-off-by: Will Deacon <will@kernel.org>
>---
> net/vmw_vsock/virtio_transport_common.c | 9 +++++++--
> 1 file changed, 7 insertions(+), 2 deletions(-)
>
>diff --git a/net/vmw_vsock/virtio_transport_common.c b/net/vmw_vsock/virtio_transport_common.c
>index 1b5d9896edae..424eb69e84f9 100644
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
>@@ -261,7 +262,11 @@ static struct sk_buff *virtio_transport_alloc_skb(struct virtio_vsock_pkt_info *
> 	if (!zcopy)
> 		skb_len += payload_len;
>
>-	skb = virtio_vsock_alloc_skb(skb_len, GFP_KERNEL);
>+	if (skb_len > SKB_WITH_OVERHEAD(PAGE_SIZE << PAGE_ALLOC_COSTLY_ORDER))
>+		skb = virtio_vsock_alloc_skb_with_frags(skb_len, GFP_KERNEL);
>+	else
>+		skb = virtio_vsock_alloc_skb(skb_len, GFP_KERNEL);
>+

As I mentioned in the other patch, we may avoid this code duplication 
hiding this in virtio_vsock_alloc_skb() or adding a new function that
we can use when we want to allocate frags or not.

Thanks,
Stefano

> 	if (!skb)
> 		return NULL;
>
>-- 
>2.50.0.714.g196bf9f422-goog
>
>

