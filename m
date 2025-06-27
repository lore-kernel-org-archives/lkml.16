Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A63CD298270
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 10:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751020927; cv=none; b=YqzZbHPv4QXW0ksqP7AJLwkcnkfI9EnC3zFI/BPCfET+7+/ccGxcFrWa8BFbcRayM9iVdtqjVPI2qQfizZD3t2BwzC6xmuTQ1f/BuhNdFxOjv/9WwXpIf/aTqk/gREr9vwoUYHPE29EGFVOJXdu3SAf4szwtf0sPYMk+Uock4F8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751020927; c=relaxed/simple;
	bh=YDMMLOTxS78FCUcrDJt19rSCZOgABNO62CdcDVjYmWA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rVgt4AC3shU/5RECuMCYIdM3safe40IyqcXRhaoJ07ESvBuAzARu930nFpD6yZY04G3U2g1e0UWB2kv26f+QPIq2ptSjxxkprrsmauC8nsY6RSDNx+7tbRj8mf3gAPdSfv6Sw/GGKbJaluzP0EnDP6QKCg+zUNIx7uKzd/aMPiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hOWVwNV/; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hOWVwNV/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751020924;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Eq+61IIf8U2MG+TUGf81YCWex3B4uWo1eFJJF8gAeVs=;
	b=hOWVwNV/K0s+x9EY4xg2F55T3Vxl/wfJW4/vFUf1cwj9JEd9bfVMTNhWjiNlszeRFO5QFF
	ztzApB94ZpXau4sGdpkwPafxe6W3sd4bpMFbvcU73V3XCC6idwLYrUMj8WhiQOQuEcWp2m
	N1XWYntpM01P0wDs3Lg83NKEXt3Yexs=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-682-PDB7jPXcN4G6UBa0luuoPw-1; Fri, 27 Jun 2025 06:42:03 -0400
X-MC-Unique: PDB7jPXcN4G6UBa0luuoPw-1
X-Mimecast-MFC-AGG-ID: PDB7jPXcN4G6UBa0luuoPw_1751020922
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-31220ecc586so2039791a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 03:42:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751020922; x=1751625722;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Eq+61IIf8U2MG+TUGf81YCWex3B4uWo1eFJJF8gAeVs=;
        b=UddobD7s8A/ov3MwJyZNH0i78pwwOHRt0KM8yUi50HvJ0liYt6AL4dRDuoixMXBJmh
         6GSPLSBc92e2ZWV/6jFqTGTF6Ydik2FyXDNpigYPvmgbeeRtOes6IkaYbvEYfqRytdcG
         aPmbfM96KeWR71x4Hm/ue8v1VEXvXuffxSeVGHHqFbnZbnoDt0KdNFEioV4RV8Ef96jn
         sU9yg1iGLWiVqI+obYOJYfrWF/C4Y02OI/CN3APoSlptxu6d5YumwtlvfL4xN8xMuZlu
         5rsTsQWQJZxFu0IRs9L67LeqWlul5NHWOIPfRxvJ4BP5rpL0oXqeFvE5UAo31hNe7Ck+
         b3Ew==
X-Gm-Message-State: AOJu0YwffUNel2eBWXJg//mTXWB8MPUZko9/U1jO2ehpKPELUKjgOVDg
	f3/RLghM1+uVRtz6ZH6rrpADVcKRt/0VRkNRuFJGLZfLDx8AdnTRUsnHvpy3QkQQ6TRYQPyX03J
	iHs29EQTsXKv7vpdGZez5pWSwLShZ7h0RPe9o7xjGS2Omsu62TulpBDZt+hiwK+KCZfuJlmQMsg
	==
X-Gm-Gg: ASbGnctTk7TXUmPqcSLD/za+TbE+Cl1gXgWS5GcBMlKfBL082yYHnG3ROZzZd39F1fN
	SYyCVCDPkFl46WKRGLpQzdOB/1uTHf82MgpX/vL9BzxurMyfu4yqXr2RBfQxv0Zye1Gj6K6yAGk
	WKN68p30gdjM0qRa9yFtCPHfWhnmdm1fKiNvBlk1qzyl+fJjAQWV5H1nFpzy6MhwDG9CGuP7035
	MVdp+1rK3tMpRX0rJke6QjGLq2nDGu7cQDXNOKwT/RnYKoVepy+mUjv0HL/09eX7pja2VPoHw43
	6ibASJE31sywHoNPlV1l/5WChng=
X-Received: by 2002:a17:90a:d88c:b0:315:b07a:ac12 with SMTP id 98e67ed59e1d1-318c9225ecbmr4389575a91.14.1751020921918;
        Fri, 27 Jun 2025 03:42:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF+VYLk3yg6ZtWzngleQFQrjV6eQzaFY2eMafnD1MIJ2M0SYc8xq7tio6475lHd9a4WuJerDQ==
X-Received: by 2002:a17:90a:d88c:b0:315:b07a:ac12 with SMTP id 98e67ed59e1d1-318c9225ecbmr4389548a91.14.1751020921576;
        Fri, 27 Jun 2025 03:42:01 -0700 (PDT)
Received: from sgarzare-redhat ([193.207.150.33])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-315f539e6b5sm6241273a91.13.2025.06.27.03.41.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 03:42:01 -0700 (PDT)
Date: Fri, 27 Jun 2025 12:41:48 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Will Deacon <will@kernel.org>
Cc: linux-kernel@vger.kernel.org, Keir Fraser <keirf@google.com>, 
	Steven Moreland <smoreland@google.com>, Frederick Mayle <fmayle@google.com>, 
	Stefan Hajnoczi <stefanha@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
	Jason Wang <jasowang@redhat.com>, Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>, 
	netdev@vger.kernel.org, virtualization@lists.linux.dev
Subject: Re: [PATCH 2/5] vsock/virtio: Resize receive buffers so that each
 SKB fits in a page
Message-ID: <rl5x3fw5rgyrptof2h7qc2wgimxd4ldh4tp4yhm52n4utksjdm@zei2wzme65jj>
References: <20250625131543.5155-1-will@kernel.org>
 <20250625131543.5155-3-will@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20250625131543.5155-3-will@kernel.org>

On Wed, Jun 25, 2025 at 02:15:40PM +0100, Will Deacon wrote:
>When allocating receive buffers for the vsock virtio RX virtqueue, an
>SKB is allocated with a 4140 data payload (the 44-byte packet header +
>VIRTIO_VSOCK_DEFAULT_RX_BUF_SIZE). Even when factoring in the SKB
>overhead, the resulting 8KiB allocation thanks to the rounding in
>kmalloc_reserve() is wasteful (~3700 unusable bytes) and results in a
>higher-order page allocation for the sake of a few hundred bytes of
>packet data.
>
>Limit the vsock virtio RX buffers to a page per SKB, resulting in much
>better memory utilisation and removing the need to allocate higher-order
>pages entirely.
>
>Signed-off-by: Will Deacon <will@kernel.org>
>---
> include/linux/virtio_vsock.h | 3 ++-
> 1 file changed, 2 insertions(+), 1 deletion(-)
>
>diff --git a/include/linux/virtio_vsock.h b/include/linux/virtio_vsock.h
>index 36fb3edfa403..67ffb64325ef 100644
>--- a/include/linux/virtio_vsock.h
>+++ b/include/linux/virtio_vsock.h
>@@ -111,7 +111,8 @@ static inline size_t virtio_vsock_skb_len(struct sk_buff *skb)
> 	return (size_t)(skb_end_pointer(skb) - skb->head);
> }
>
>-#define VIRTIO_VSOCK_DEFAULT_RX_BUF_SIZE	(1024 * 4)
>+#define VIRTIO_VSOCK_DEFAULT_RX_BUF_SIZE	(SKB_WITH_OVERHEAD(PAGE_SIZE) \
>+						 - VIRTIO_VSOCK_SKB_HEADROOM)

This is only used in net/vmw_vsock/virtio_transport.c :

static void virtio_vsock_rx_fill(struct virtio_vsock *vsock)
{
	int total_len = VIRTIO_VSOCK_DEFAULT_RX_BUF_SIZE + VIRTIO_VSOCK_SKB_HEADROOM;


What about just remove VIRTIO_VSOCK_DEFAULT_RX_BUF_SIZE and use
`SKB_WITH_OVERHEAD(PAGE_SIZE)` there? (maybe with a comment summarizing
the issue we found).

Thanks,
Stefano

> #define VIRTIO_VSOCK_MAX_BUF_SIZE		0xFFFFFFFFUL
> #define VIRTIO_VSOCK_MAX_PKT_BUF_SIZE		(1024 * 64)
>
>-- 
>2.50.0.714.g196bf9f422-goog
>
>

