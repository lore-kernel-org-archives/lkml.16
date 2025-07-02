Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D4F4277031
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 13:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751462200; cv=none; b=fQWYymBQSJfbZsym7cjvVER61C1d4AbDh852V3tWPRc3I6jsEvQ5AMizI+W7egQECXnAUSo2Mop6FDV/8kV6CxiUe60cxbYww+2UmCgX6/xmLuhK4cmWYWzzFqzBkhR7EV5BsdYcsyYQxGvbScrdzqTcl6gU22rJk2q6R7KdGF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751462200; c=relaxed/simple;
	bh=1j1LyNigN5AHD08zHiexmmDlfFxiEshK30KkAloLUzs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pMfKAo2GIiwTGKt7T0kv5OsPhuNkzh2hIMPv2duAA4wopwvjjUQmX/A0zLVBZWEO4Ay8E3bjWNY0zi+Bx+40c+Fteb9w5dqi2lPO/dlAnGQhW2of3NsBAkXBbv2T/32wpnaXICT8lHu+nchzVYh7ytX9qNc8o191qiqw/UgrVxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OFpLAVJ9; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OFpLAVJ9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751462196;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sy4nWTHPkpPaaqEvDu9i4dBMnt5aD41NB3JYr++qf2M=;
	b=OFpLAVJ9oUFP22/fqBDFeDG2TxYkk269JUXoghx6Xy/AoVsGzPGiuJLpDgBLs/cM4TC+NQ
	ODguOszPhSit7aUOrHml/aHiA6dH0DVBPgOsbrx1hhyerxpiAqwA2aAHHzUieOPi9R7bdH
	LpLhE1tUfkJ45jNm1iag+zQ8Qtci26g=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-502-pOO5whkkOqSgUNaijgjZ3g-1; Wed, 02 Jul 2025 09:16:35 -0400
X-MC-Unique: pOO5whkkOqSgUNaijgjZ3g-1
X-Mimecast-MFC-AGG-ID: pOO5whkkOqSgUNaijgjZ3g_1751462194
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43e9b0fd00cso37116695e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 06:16:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751462194; x=1752066994;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sy4nWTHPkpPaaqEvDu9i4dBMnt5aD41NB3JYr++qf2M=;
        b=iAnlNtNVnDWIWkNj/Tryk985KjGTAVj+llQrONIdbb6/Zv3zjJWgWC1QhxM2ey0l2K
         EIpyw15yVSKhtjzTOZbPcTAtPHdsxp8MOq7EEa0YlpUVXxlRMXWIICzcb5bXpYikrxh7
         CSnuFGrK365Wl0rwl2th2wwsDi+YjlVDDLzcvu76ojNLXUdi8YEy/BbyckDg+pam7fqv
         OIaUZS3NlaYgTg7C2V0QcaXPIc0/1QpSOy/Uj3GnqjXcLhOpuMr0p06UHrDW/GxBwVEt
         5csr9etn6rBdCVRd0MlwQhDxjnrUwZof7gfXm+Hh7iVQKQkaRPjrODguqNIGQaeKf0AM
         qPGg==
X-Forwarded-Encrypted: i=1; AJvYcCX49/KuGrSpNrZiuAHuEsZLJwgOlALsN0vp8ZoiCbnAAhDkHpOPTXqL+iik8vM4aUAx33oP1S3UOHTSPAw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxwfaggzwHDrXtmhUjWiiExMnxOTwXC/GeUTwWtIDAsUCsfymju
	7Gr5gkvX49apkQM7jn3PzDgJjSxPVFbDnGpIMiWv5S+SJcm188ldIKICAJfojg6N4+rAQAvvvX/
	ypMUgz0XxMm/fG9UDR+LsdrRXFc7IFzRkLY5povV2LRWAhJTf5wZvsnU5LdsOm1DU1Q==
X-Gm-Gg: ASbGnctUMeSCEJrWB9PE+F/585QmgvkxUfRMpyCp+NYdo7O3iFw5YRByIN3tzJZMN+W
	BbQV2rNM5beR/r8MeY3gw10mBkppmXp1Ld2fdaQzqdx7fXUSeJgc6YvYVtiePPTCrT8mGgFA1VX
	hRdM8YBKmHFlEHoNcb3+NYcYAgSlnRImYR2Tqpy0N0mqJbh19iT+0TGDbSGf42cag5jNQpjcA9G
	1TmaSI4ZGoyF95L1BJTq4myq10xcFNxPAUNW7gbZBvtTu6zpJnK4eRXpuYmH7EvxC1qhzEu3b4E
	TsqIrCgX1nHSpCzReMRy/SdbuLa6
X-Received: by 2002:a05:600c:c0dc:b0:453:45f1:9c96 with SMTP id 5b1f17b1804b1-454a3c610camr23628715e9.14.1751462193950;
        Wed, 02 Jul 2025 06:16:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEK+MShUn1qdie/bqB3hm1XM6IQ/XjWSETD0pYwme5TdPq6afvGUkaA/cLuoccNQG7Dhu4OBw==
X-Received: by 2002:a05:600c:c0dc:b0:453:45f1:9c96 with SMTP id 5b1f17b1804b1-454a3c610camr23628285e9.14.1751462193306;
        Wed, 02 Jul 2025 06:16:33 -0700 (PDT)
Received: from sgarzare-redhat ([193.207.164.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c7e72c1sm15900209f8f.1.2025.07.02.06.16.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 06:16:32 -0700 (PDT)
Date: Wed, 2 Jul 2025 15:16:19 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: David Laight <david.laight.linux@gmail.com>
Cc: Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org, 
	Keir Fraser <keirf@google.com>, Steven Moreland <smoreland@google.com>, 
	Frederick Mayle <fmayle@google.com>, Stefan Hajnoczi <stefanha@redhat.com>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
	Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>, netdev@vger.kernel.org, virtualization@lists.linux.dev
Subject: Re: [PATCH v2 4/8] vsock/virtio: Resize receive buffers so that each
 SKB fits in a page
Message-ID: <3s4lvbnzdj72dcvvh2nnx4s7skyco4pbpwuyycccqv3iudqhnn@5szfvvgxojkb>
References: <20250701164507.14883-1-will@kernel.org>
 <20250701164507.14883-5-will@kernel.org>
 <20250701201400.52442b0e@pumpkin>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20250701201400.52442b0e@pumpkin>

On Tue, Jul 01, 2025 at 08:14:00PM +0100, David Laight wrote:
>On Tue,  1 Jul 2025 17:45:03 +0100
>Will Deacon <will@kernel.org> wrote:
>
>> When allocating receive buffers for the vsock virtio RX virtqueue, an
>> SKB is allocated with a 4140 data payload (the 44-byte packet header +
>> VIRTIO_VSOCK_DEFAULT_RX_BUF_SIZE). Even when factoring in the SKB
>> overhead, the resulting 8KiB allocation thanks to the rounding in
>> kmalloc_reserve() is wasteful (~3700 unusable bytes) and results in a
>> higher-order page allocation for the sake of a few hundred bytes of
>> packet data.
>>
>> Limit the vsock virtio RX buffers to a page per SKB, resulting in much
>> better memory utilisation and removing the need to allocate higher-order
>> pages entirely.
>>
>> Signed-off-by: Will Deacon <will@kernel.org>
>> ---
>>  include/linux/virtio_vsock.h     | 1 -
>>  net/vmw_vsock/virtio_transport.c | 7 ++++++-
>>  2 files changed, 6 insertions(+), 2 deletions(-)
>>
>> diff --git a/include/linux/virtio_vsock.h b/include/linux/virtio_vsock.h
>> index eb6980aa19fd..1b5731186095 100644
>> --- a/include/linux/virtio_vsock.h
>> +++ b/include/linux/virtio_vsock.h
>> @@ -109,7 +109,6 @@ static inline size_t virtio_vsock_skb_len(struct sk_buff *skb)
>>  	return (size_t)(skb_end_pointer(skb) - skb->head);
>>  }
>>
>> -#define VIRTIO_VSOCK_DEFAULT_RX_BUF_SIZE	(1024 * 4)
>>  #define VIRTIO_VSOCK_MAX_BUF_SIZE		0xFFFFFFFFUL
>>  #define VIRTIO_VSOCK_MAX_PKT_BUF_SIZE		(1024 * 64)
>>
>> diff --git a/net/vmw_vsock/virtio_transport.c b/net/vmw_vsock/virtio_transport.c
>> index 488e6ddc6ffa..3daba06ed499 100644
>> --- a/net/vmw_vsock/virtio_transport.c
>> +++ b/net/vmw_vsock/virtio_transport.c
>> @@ -307,7 +307,12 @@ virtio_transport_cancel_pkt(struct vsock_sock *vsk)
>>
>>  static void virtio_vsock_rx_fill(struct virtio_vsock *vsock)
>>  {
>> -	int total_len = VIRTIO_VSOCK_DEFAULT_RX_BUF_SIZE + VIRTIO_VSOCK_SKB_HEADROOM;
>> +	/* Dimension the SKB so that the entire thing fits exactly into
>> +	 * a single page. This avoids wasting memory due to alloc_skb()
>> +	 * rounding up to the next page order and also means that we
>> +	 * don't leave higher-order pages sitting around in the RX queue.
>> +	 */
>> +	int total_len = SKB_WITH_OVERHEAD(PAGE_SIZE);
>
>Should that be an explicit 4096?
>Otherwise it is very wasteful of memory on systems with large pages.

This is a good point!

What about SKB_WITH_OVERHEAD(VIRTIO_VSOCK_DEFAULT_RX_BUF_SIZE) ?

Thanks,
Stefano

>
>	David
>
>>  	struct scatterlist pkt, *p;
>>  	struct virtqueue *vq;
>>  	struct sk_buff *skb;
>
>

