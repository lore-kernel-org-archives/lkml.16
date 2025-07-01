Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C830C1E51FB
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 06:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751352355; cv=none; b=UtTKQFKWAs59yC9vwfmK/w0/oSutfET58hMREycvZ8OGoy7K2hycBOuDC86IjT/8UZARb43DxNFG+wc+qfHiuMGyK0J0XYM1hxRwBwkTwfJDTpaKzsUZMJ3fMU2lNYKc0BnzQzp8hGvvW1B4clDyHL1rfXKR4sbo7ifCsLY+9aA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751352355; c=relaxed/simple;
	bh=gLhUqpMgS9yLqJKaBfIOhojwMZScqGvBOte8jL4p3oc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=odrN65k81zyYRpUUGTtSOxGzp94MdIDIBkKibPT9tLVqVEwbrhUGCrMAoN03wkI++23EVWsyCxHVqYMVast0CSbfrqAMRlGIrwLhKMQs2wFMy6LfjzFXKfV+s1dE4joDeG8q1VmNTNrJvWcRX4ms8gSQRuR7ERRGw93p6B7Cy5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NPfo+yPl; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NPfo+yPl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751352352;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/FB/rr13rxhfU8eE4uQBrYdSojlxrnS1P6/7C5rZKVs=;
	b=NPfo+yPlTGByTIJra44vCbexSLY4MJ7F2yX+l3HLPnIdOFdLGp1UKOtz2SjV3feFgVivKZ
	FhBt/qwK7htnRu+kuA5sU37RJdgDQrr8DL3FVoZn62hxd6iP4CLIDSiqtSl4C5bWms9BDr
	KkOH4aSYVpLjRXLVc8qA4WzKY5fSaZ8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-668-MJcRVM5QMAOJJ1veJnMumA-1; Tue, 01 Jul 2025 02:45:51 -0400
X-MC-Unique: MJcRVM5QMAOJJ1veJnMumA-1
X-Mimecast-MFC-AGG-ID: MJcRVM5QMAOJJ1veJnMumA_1751352350
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-451d3f03b74so26692415e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 23:45:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751352350; x=1751957150;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/FB/rr13rxhfU8eE4uQBrYdSojlxrnS1P6/7C5rZKVs=;
        b=B+Jsw2pccInDUnzQmMQlmEXm4/3qaQzK28d5t8W/odlnqaP+/h9sncv3Z56+Lp0msz
         7TMCx3PRO958qNfU/XxtJnndcXmvAJoqThVeCCxd9Jz71ByxrzTPqq4o2koNPBOa0QZO
         47tRhNo6KjlJGF5VPggAV2A2+GZ1I8I1xHskyr4UujijyLu+LHI4YQRcyNqT25K+FzLe
         PtsVZQAz6S0kzUWmrBwMgqgf+vuhgHLC5aJnOz5iEKlNjCSXSrlyZVWou3i6oiYbc9GJ
         +8iA5OH8Tjr3gx/kLNE1LjG6BFrTOdNlOkkVJiKuUo8ITLUBrGkSav/NX41M0clGOoE7
         ClFQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJAcDCXOD7WSvMGsKhtlB4lYuiEOyDhkSj8aTUlJYnmmLvzjw7l+gTCdvtUoGYVfACIpY9+iPOvVbf27k=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCS1ZfFr/wSRL7+7/otdENDh+3y+jtiluRsu95ZZjRg2DKvjsI
	GDFi0vgaxKBAJnVeBUmW9wRMwVy8OydwTA33UQIbMf53y7MAOoaxG10XHGMDb8AAu/mE8z9oDS6
	BRKF7UyLDW+sCzNQ3vk2a5mKar2DZ5j10BgdISthGRL4V2m2pX3j7jr35mVd1TlSZPg==
X-Gm-Gg: ASbGncvVnSTcjeBiIXZwNEjRh4DAz1eoGjAmgZHm/EEiW0qlfkYRPoU6P5rsG/fcIxP
	3Nr2BrXiCCNv5BjSPbB6BUPg8KBVJxv/YG9xOYwYZhu1wcU5SLfHNTw+naDkfhjSxTB38/DQIm2
	jlp1+ebhMUNNpp2gCZmxRP/fzJicqlP7mHQkN2frbcc4r7gxJUfgDNir5XzsNvsw8QpdqfegPVR
	QSlS8emb+JACAzTzBMmeoAAMDNz6ql8hc0eMYZewuKGBMzvEWQ5XryUgneAcpdpAgVRwRVznrzO
	LyjB63FzxJ94CVzr
X-Received: by 2002:a05:600c:8518:b0:442:f482:c421 with SMTP id 5b1f17b1804b1-4538ee7df51mr140275745e9.22.1751352350383;
        Mon, 30 Jun 2025 23:45:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGNqYmg2q01DPQRmv8jE+6E8iA13iSfpZEeDhKnGAq6nzxNu9hatrBH/eHkSndzvZVUAhPbfw==
X-Received: by 2002:a05:600c:8518:b0:442:f482:c421 with SMTP id 5b1f17b1804b1-4538ee7df51mr140275485e9.22.1751352349874;
        Mon, 30 Jun 2025 23:45:49 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:152e:1400:856d:9957:3ec3:1ddc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453823ad03asm187631545e9.23.2025.06.30.23.45.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 23:45:49 -0700 (PDT)
Date: Tue, 1 Jul 2025 02:45:47 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Cc: xuanzhuo@linux.alibaba.com, eperezma@redhat.com,
	virtualization@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V3 18/19] virtio_ring: factor out split detaching logic
Message-ID: <20250701024506-mutt-send-email-mst@kernel.org>
References: <20250616082518.10411-1-jasowang@redhat.com>
 <20250616082518.10411-19-jasowang@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250616082518.10411-19-jasowang@redhat.com>

On Mon, Jun 16, 2025 at 04:25:16PM +0800, Jason Wang wrote:
> This patch factors out the split core detaching logic that could be
> reused by in order feature into a dedicated function.

you mean 

Factor out the split core detaching logic  into a dedicated function
so it cn be reused by the in order feature


> 
> Reviewed-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> Signed-off-by: Jason Wang <jasowang@redhat.com>
> ---
>  drivers/virtio/virtio_ring.c | 18 ++++++++++++++----
>  1 file changed, 14 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
> index 259380797ec4..27a9459a0555 100644
> --- a/drivers/virtio/virtio_ring.c
> +++ b/drivers/virtio/virtio_ring.c
> @@ -804,8 +804,9 @@ static void detach_indirect_split(struct vring_virtqueue *vq,
>  	vq->split.desc_state[head].indir_desc = NULL;
>  }
>  
> -static void detach_buf_split(struct vring_virtqueue *vq, unsigned int head,
> -			     void **ctx)
> +static unsigned detach_buf_split_in_order(struct vring_virtqueue *vq,
> +					  unsigned int head,
> +					  void **ctx)
>  {
>  	struct vring_desc_extra *extra;
>  	unsigned int i;
> @@ -826,8 +827,6 @@ static void detach_buf_split(struct vring_virtqueue *vq, unsigned int head,
>  	}
>  
>  	vring_unmap_one_split(vq, &extra[i]);
> -	vq->split.desc_extra[i].next = vq->free_head;
> -	vq->free_head = head;
>  
>  	/* Plus final descriptor */
>  	vq->vq.num_free++;
> @@ -836,6 +835,17 @@ static void detach_buf_split(struct vring_virtqueue *vq, unsigned int head,
>  		detach_indirect_split(vq, head);
>  	else if (ctx)
>  		*ctx = vq->split.desc_state[head].indir_desc;
> +
> +	return i;
> +}
> +
> +static void detach_buf_split(struct vring_virtqueue *vq, unsigned int head,
> +			     void **ctx)
> +{
> +	unsigned int i = detach_buf_split_in_order(vq, head, ctx);
> +
> +	vq->split.desc_extra[i].next = vq->free_head;
> +	vq->free_head = head;
>  }
>  
>  static bool virtqueue_poll_split(const struct vring_virtqueue *vq,
> -- 
> 2.34.1

