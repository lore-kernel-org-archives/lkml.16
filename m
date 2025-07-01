Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4313248F42
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 06:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751352164; cv=none; b=cNI78enbyKH+ICHB7Msqc0fXeO6+lc+rbiSYZLHG4XPpdA2Jx651AvrqSe72sZn2cE9uSYWMuUC4qqsXORmzvQKePL0WnCt5h6beNuPxgIGv6AEYat3v+7ZFWKnehP/spcYIUzcbLfCFVhxZXBDoZQdsRptI7SnpdLI1fk3pyg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751352164; c=relaxed/simple;
	bh=Pn7B9GeTDeFtWMYue92MhPEUhquMznz1o4o0hmqyizs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OpBfg4HQW8EgPcuEjg87ZhtQ2MC9KUuEZwsv1vepqTRySdoscJK9ZXTxXarnM28U3BOkwYVscfljrvMi0nSLnrF0gXInic3OxYk+jir5TWLzLvSWBpFKmeAZCodeIACtvDPrjRISDUi4m08RGOo/6ienivKxixYY9PtJTOVdSYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iiyRng5t; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iiyRng5t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751352161;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nt9aO5ssi1t8CygdESv19zrIGluhJLXZKgDo3123Dfc=;
	b=iiyRng5trUcW8RWHN6tpWshmYRxAyNnMxT3E1aGyFpEbmpG/aReeo6rsEU3Wf2K2Cdloub
	CzclQRQB5jA/VM3xyjENdJ0VBce7WfhxWLOsyy9QNyyZfMJ8bVPXLXAwWlhvfxgPMHXJUm
	czKZvnvdh4ilvceIgDhCga3M7XAx8GI=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-315-Q1H7vQ0lNjuA5A1_S3zCaQ-1; Tue, 01 Jul 2025 02:42:40 -0400
X-MC-Unique: Q1H7vQ0lNjuA5A1_S3zCaQ-1
X-Mimecast-MFC-AGG-ID: Q1H7vQ0lNjuA5A1_S3zCaQ_1751352159
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a4f6ff23ccso3498723f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 23:42:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751352159; x=1751956959;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nt9aO5ssi1t8CygdESv19zrIGluhJLXZKgDo3123Dfc=;
        b=A5MVNGAjQ5//eJ4dAz0iU8feZMrUuRolBFeFIfmWguyobnhGiKlnwTI2nlkZ9KharM
         unEx91qhnr2kn/ihmnV7MUwJiTMJYlRpfze8ehTMQ80IkWaCFWuRtDp5B7pwAkk8nwCx
         ifwWirM8mTYCv4H1F7VOVoSscLy9fqwYVdHhEXUjtSJgc3KdfI5oTeXg9Qh9BTBfJ5LJ
         Ip5ApvZl7jHqD8NqDRwCarSuKbHCAjcWoAdj8HpKSd/4v6urHqIkXBFfdBEiSNytff2m
         FPflg2cuFSwfzN6Jgh46SaGWxTuzT6lVg40OmdHoCUbN9Tz7ysKlETu5p8VB0V3D06cT
         GE2g==
X-Forwarded-Encrypted: i=1; AJvYcCVyI0aWLjMMec9emyVxn0PnhruAMs4XWSbsWKFos5q+4OgPku0sF/3Wg0QXwPZ8E8ttNHzFzpXs84EbUV4=@vger.kernel.org
X-Gm-Message-State: AOJu0YziJfDgi8nRHgYnqPkSY4Pgq/opH0AwJ2Z4eTN411UD2ePMsihO
	mc1WNGFPZi1pLclH6nRJZUOjbWF+X5i5UyiUBXf0YAL3pz6r12dhZe5/U3bia5BlI2JEo9ATbUv
	YWs3XjUyq++ae3KlINxDllziMcXffGba2okHXMBYlCrw1UFDs5Fy/zla371Z5IIUW6MVn/nQkug
	==
X-Gm-Gg: ASbGncvenK+LDDfmXsSmKUm5oWc141xL5K3WNAP6m1+4Ik8WZJCcsN5llzJuSf7gC/S
	g7KzPue7TgKfLR/2iqrOeqrGRKUPC95T+4RZ12LI38Vxk+4GOoU1nhRBW2q/+TLY53tzWsP5nNF
	y11ditPu2lG4f9L9V7mQECxg0rssTtqEhmDANyR30D9ktUcMuAWSB8k0t57EOm16UYLwAZA4/LC
	UGlE3GLyNGTZd5nrN/zkMb+2STfGHUyd5iuutGr60kiPJwr8lkp7a+lu34Q7kw1h72KxUA6DvrK
	W2h9/ddDDHxIpuOP
X-Received: by 2002:adf:9ccf:0:b0:3a5:1241:c1a3 with SMTP id ffacd0b85a97d-3a91818ca6cmr9550227f8f.50.1751352159127;
        Mon, 30 Jun 2025 23:42:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEDjxR68XICmHiVr/QGaYyfS+N2TUgWC0OzSJHuzN9hU5FIv9SmkNToFgbTwtepgk2VkSqSiQ==
X-Received: by 2002:adf:9ccf:0:b0:3a5:1241:c1a3 with SMTP id ffacd0b85a97d-3a91818ca6cmr9550193f8f.50.1751352158142;
        Mon, 30 Jun 2025 23:42:38 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:152e:1400:856d:9957:3ec3:1ddc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c7e7481sm12488983f8f.14.2025.06.30.23.42.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 23:42:37 -0700 (PDT)
Date: Tue, 1 Jul 2025 02:42:35 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Cc: xuanzhuo@linux.alibaba.com, eperezma@redhat.com,
	virtualization@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V3 14/19] virtio_ring: determine descriptor flags at one
 time
Message-ID: <20250701023157-mutt-send-email-mst@kernel.org>
References: <20250616082518.10411-1-jasowang@redhat.com>
 <20250616082518.10411-15-jasowang@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250616082518.10411-15-jasowang@redhat.com>

On Mon, Jun 16, 2025 at 04:25:12PM +0800, Jason Wang wrote:
> Let's determine the last descriptor by counting the number of sg. This
> would be consistent with packed virtqueue implementation and ease the
> future in-order implementation.
> 
> Reviewed-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> Signed-off-by: Jason Wang <jasowang@redhat.com>
> ---
>  drivers/virtio/virtio_ring.c | 25 +++++++++++++------------
>  1 file changed, 13 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
> index af32d1a1a1db..d5e4d4cd2487 100644
> --- a/drivers/virtio/virtio_ring.c
> +++ b/drivers/virtio/virtio_ring.c
> @@ -570,7 +570,7 @@ static inline int virtqueue_add_split(struct vring_virtqueue *vq,
>  	struct vring_desc_extra *extra;
>  	struct scatterlist *sg;
>  	struct vring_desc *desc;
> -	unsigned int i, n, avail, descs_used, prev, err_idx;
> +	unsigned int i, n, c, avail, descs_used, err_idx;
>  	int head;
>  	bool indirect;
>  
> @@ -626,46 +626,47 @@ static inline int virtqueue_add_split(struct vring_virtqueue *vq,
>  		return -ENOSPC;
>  	}
>  
> +	c = 0;

initialize at point of declaration?

>  	for (n = 0; n < out_sgs; n++) {
> +		sg = sgs[n];
>  		for (sg = sgs[n]; sg; sg = sg_next(sg)) {
>  			dma_addr_t addr;
>  			u32 len;
> +			u16 flags = 0;
>  
>  			if (vring_map_one_sg(vq, sg, DMA_TO_DEVICE, &addr, &len, premapped))
>  				goto unmap_release;
>  
> -			prev = i;
> +			if (++c != total_sg)
> +				flags = VRING_DESC_F_NEXT;
> +

Don't like it how the logic is split.
flags isn't used before that.
So I prefer:

	flags = ++c == total_sg ? 0 : VRING_DESC_F_NEXT;

and at that point, we do not really need flags anymore:


>  			/* Note that we trust indirect descriptor
>  			 * table since it use stream DMA mapping.
>  			 */
>  			i = virtqueue_add_desc_split(vq, desc, extra, i, addr, len,
> -						     VRING_DESC_F_NEXT,
> +						     flags,

So just:


	i = virtqueue_add_desc_split(vq, desc, extra, i, addr, len,
				     ++c == total_sg ? 0 : VRING_DESC_F_NEXT,

here and we are done.


>  						     premapped);
>  		}
>  	}
>  	for (; n < (out_sgs + in_sgs); n++) {
>  		for (sg = sgs[n]; sg; sg = sg_next(sg)) {
> +			u16 flags = VRING_DESC_F_WRITE;
>  			dma_addr_t addr;
>  			u32 len;
>  
>  			if (vring_map_one_sg(vq, sg, DMA_FROM_DEVICE, &addr, &len, premapped))
>  				goto unmap_release;
>  
> -			prev = i;
> +			if (++c != total_sg)
> +				flags |= VRING_DESC_F_NEXT;
> +

Don't like it that above it's "=" here it is "|=".
And flags isn't used before that.
So I prefer:

	flags = ++c == total_sg ? VRING_DESC_F_WRITE : VRING_DESC_F_WRITE | VRING_DESC_F_NEXT;

and again we don't really need the variable:


>  			/* Note that we trust indirect descriptor
>  			 * table since it use stream DMA mapping.
>  			 */
>  			i = virtqueue_add_desc_split(vq, desc, extra, i, addr, len,
> -						     VRING_DESC_F_NEXT |
> -						     VRING_DESC_F_WRITE,


so just:

		i = virtqueue_add_desc_split(vq, desc, extra, i, addr, len,
					     (++c == total_sg ? 0 : VRING_DESC_F_NEXT) |
					     VRING_DESC_F_WRITE,


is clearer, and the patch smaller.



> -						     premapped);
> +						     flags, premapped);
>  		}
>  	}
> -	/* Last one doesn't continue. */
> -	desc[prev].flags &= cpu_to_virtio16(vq->vq.vdev, ~VRING_DESC_F_NEXT);
> -	if (!indirect && vring_need_unmap_buffer(vq, &extra[prev]))
> -		vq->split.desc_extra[prev & (vq->split.vring.num - 1)].flags &=
> -			~VRING_DESC_F_NEXT;
>  
>  	if (indirect) {
>  		/* Now that the indirect table is filled in, map it. */
> -- 
> 2.34.1

