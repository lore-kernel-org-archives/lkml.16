Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E5A719F130
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 06:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751352300; cv=none; b=SqlFY1sdDH/F5N3KirgH2w9aqbjaP1qqiA59gbYBazQ6Em8oiLiQbShOKjNW6R1vmk4LeYRUs40xf2MrgzKiYi5t8NI5w0L36g3ryZX05BjyJemi89ZKHbrkvaMZ0pvUEqM3jC+DkqVYdh8uMyBhRi9Fwe7FGOoWdu6pFeFWO84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751352300; c=relaxed/simple;
	bh=2cq/p3Ujf/QZM6znvEBgDgRTAL2DLiphSQdkZ4i4r80=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FEh3DyLjmNzay98EJNADeyln6TexUFHNhsOJ9Aeh9G9gCJZkjoRG7SFSJu8QFTCHU9/yxvd9pbL98DLhqzsA0lueaNtriz2PXUt85LZWWBTdN2wkYZk04eLO39k0k4jXjtZj0+QyeiSz5SC2pUEsC9+Qsh8id6ISrPhqzPSRITA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EyBvBqBA; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EyBvBqBA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751352298;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Biae0HaOibcJc+UiP0IzJsOLAa3a5dn69Z3XEzox1Hg=;
	b=EyBvBqBAs923tajWyt0KNe88GW/ct6FPTGCN6jIGSFWuS9ygAfkqlZYZMFQVWriOHnCIGn
	Vk0ecuutRLvJ3NMTYksi0dW9H+RJYjMsSopZtQjkIK/mWjDGIu6hzLqPwQlNMlapeuE5ls
	jRtmwOlDp++sr/UEKeDgG+m4ccHiMAg=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-571-nzEL2oXHOwC0J_FmWCtybw-1; Tue, 01 Jul 2025 02:44:56 -0400
X-MC-Unique: nzEL2oXHOwC0J_FmWCtybw-1
X-Mimecast-MFC-AGG-ID: nzEL2oXHOwC0J_FmWCtybw_1751352296
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a6da94a532so1854177f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 23:44:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751352295; x=1751957095;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Biae0HaOibcJc+UiP0IzJsOLAa3a5dn69Z3XEzox1Hg=;
        b=usuZ1DCREMwHi8vxwR6baqT0o3ITRN+0AkYopPidBW2ZJEoe4amU9CSGoNNcaot1yA
         h/Vm19myfNqwUHYbprwc4x8QZ/rQmO60vxDBLFUjhKRLvBIexuW+bFqsgLKqtnHD4IXX
         ngam2LLw8MZ+i3jHdpamvY49frL7GKKuTR83WScY63l7dgbddFy7dw7Pb73e7evXfRHF
         hTE2AxBZBkuYE8t3/YA+ECjXGgnTNC9O/iTcNl2GkVlTt3EHq1fzZmoDNlOL/puwY0xR
         Q65sBVPkA8vEPDBDSt016UvpavGIH5zcybPzgAeKMGwBll+uLlnNWhAJx+l/FTPdkOZv
         SGXQ==
X-Forwarded-Encrypted: i=1; AJvYcCWpOIH5tfjeQqShMo9zTTr44/INcNBsNtLYrY9O8TMKU6nlNvcvvVsAwIcUjjUDBxUI8CdT29V7Cz/u+S0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxnqNRwJZTf7cPTFzTIipqyAS8N2A//2DOMdAS7VmauGZlW/vMq
	2NRvQOP9zc1lrpAvAjoRmMlYLNF9J2AyX89DP+wG+zW4r4csZRPkFNVMYmUhoJLMEQV5HDE/GfK
	o/c9s3aRIog7UG4uwYi6+HGlhFTSLRlGIOuRDLpYoPFruL7ZiQ06jxDhwaGpN99a8RQ==
X-Gm-Gg: ASbGncvQOBMxbqR4uZ9etT2PVB/IpChaxRyRFL6c0D68EduswviKz2T/qv5/++SQfnq
	QPe2yqMr5BR/nv+U2NDoCVbiGkerbGXBaYAJQOX4v8KBChzwpXx1xYHkgOt6DIIsDh1KgfOMHn3
	c3tBdxOSZzxHkqcktMtA+yP9iNRKGLq6bAifSiZQzjCD4G6mHLrYZT8To73A3k9YU6wCySFQjL1
	K5N5ARl3+b2SUWynGhvtd3kJ4HAxZKFNmgQQKuOF8/uFF/RW1qNipXwz0+6zdsbbAKsS8hfXUbh
	lv2BEt/HhNJZA564
X-Received: by 2002:a5d:59c7:0:b0:3a4:fc3f:ed28 with SMTP id ffacd0b85a97d-3a8fee64fafmr16298906f8f.29.1751352295491;
        Mon, 30 Jun 2025 23:44:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF5SZYUakeo17am0QQzCalgVq4U/8EgA20Q1A9i6qzirA4ICaPsq6bSj8ZyqMWcbiRUOp1koQ==
X-Received: by 2002:a5d:59c7:0:b0:3a4:fc3f:ed28 with SMTP id ffacd0b85a97d-3a8fee64fafmr16298883f8f.29.1751352295096;
        Mon, 30 Jun 2025 23:44:55 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:152e:1400:856d:9957:3ec3:1ddc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453823ad03asm187610015e9.23.2025.06.30.23.44.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 23:44:54 -0700 (PDT)
Date: Tue, 1 Jul 2025 02:44:52 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Cc: xuanzhuo@linux.alibaba.com, eperezma@redhat.com,
	virtualization@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V3 17/19] virtio_ring: factor out split indirect
 detaching logic
Message-ID: <20250701024441-mutt-send-email-mst@kernel.org>
References: <20250616082518.10411-1-jasowang@redhat.com>
 <20250616082518.10411-18-jasowang@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250616082518.10411-18-jasowang@redhat.com>

On Mon, Jun 16, 2025 at 04:25:15PM +0800, Jason Wang wrote:
> Factor out the split indirect descriptor detaching logic in order to
> make it be reused by the in order support.

allow it to be reused

> 
> Reviewed-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> Signed-off-by: Jason Wang <jasowang@redhat.com>
> ---
>  drivers/virtio/virtio_ring.c | 63 ++++++++++++++++++++----------------
>  1 file changed, 35 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
> index e8e0d1204f52..259380797ec4 100644
> --- a/drivers/virtio/virtio_ring.c
> +++ b/drivers/virtio/virtio_ring.c
> @@ -773,11 +773,42 @@ static bool virtqueue_kick_prepare_split(struct vring_virtqueue *vq)
>  	return needs_kick;
>  }
>  
> +static void detach_indirect_split(struct vring_virtqueue *vq,
> +				  unsigned int head)
> +{
> +	struct vring_desc_extra *extra = vq->split.desc_extra;
> +	struct vring_desc *indir_desc =
> +	       vq->split.desc_state[head].indir_desc;
> +	unsigned int j;
> +	u32 len, num;
> +
> +	/* Free the indirect table, if any, now that it's unmapped. */
> +	if (!indir_desc)
> +		return;
> +	len = vq->split.desc_extra[head].len;
> +
> +	BUG_ON(!(vq->split.desc_extra[head].flags &
> +			VRING_DESC_F_INDIRECT));
> +	BUG_ON(len == 0 || len % sizeof(struct vring_desc));
> +
> +	num = len / sizeof(struct vring_desc);
> +
> +	extra = (struct vring_desc_extra *)&indir_desc[num];
> +
> +	if (vq->use_dma_api) {
> +		for (j = 0; j < num; j++)
> +			vring_unmap_one_split(vq, &extra[j]);
> +	}
> +
> +	kfree(indir_desc);
> +	vq->split.desc_state[head].indir_desc = NULL;
> +}
> +
>  static void detach_buf_split(struct vring_virtqueue *vq, unsigned int head,
>  			     void **ctx)
>  {
>  	struct vring_desc_extra *extra;
> -	unsigned int i, j;
> +	unsigned int i;
>  	__virtio16 nextflag = cpu_to_virtio16(vq->vq.vdev, VRING_DESC_F_NEXT);
>  
>  	/* Clear data ptr. */
> @@ -801,34 +832,10 @@ static void detach_buf_split(struct vring_virtqueue *vq, unsigned int head,
>  	/* Plus final descriptor */
>  	vq->vq.num_free++;
>  
> -	if (vq->indirect) {
> -		struct vring_desc *indir_desc =
> -				vq->split.desc_state[head].indir_desc;
> -		u32 len, num;
> -
> -		/* Free the indirect table, if any, now that it's unmapped. */
> -		if (!indir_desc)
> -			return;
> -		len = vq->split.desc_extra[head].len;
> -
> -		BUG_ON(!(vq->split.desc_extra[head].flags &
> -				VRING_DESC_F_INDIRECT));
> -		BUG_ON(len == 0 || len % sizeof(struct vring_desc));
> -
> -		num = len / sizeof(struct vring_desc);
> -
> -		extra = (struct vring_desc_extra *)&indir_desc[num];
> -
> -		if (vq->use_dma_api) {
> -			for (j = 0; j < num; j++)
> -				vring_unmap_one_split(vq, &extra[j]);
> -		}
> -
> -		kfree(indir_desc);
> -		vq->split.desc_state[head].indir_desc = NULL;
> -	} else if (ctx) {
> +	if (vq->indirect)
> +		detach_indirect_split(vq, head);
> +	else if (ctx)
>  		*ctx = vq->split.desc_state[head].indir_desc;
> -	}
>  }
>  
>  static bool virtqueue_poll_split(const struct vring_virtqueue *vq,
> -- 
> 2.34.1

