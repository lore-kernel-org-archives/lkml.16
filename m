Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF1B3235074
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 20:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747857642; cv=none; b=VPJGtioPRASBmIkjVYiFHOy8wJTrWQ0Vfk86sulTkrM4/OmFnhf6NU7+ebNfWRTJMEtCToMbRo40SS/Emu+wWzid+HlXSl2vq0LDmE2gV3cax/FSPSh2BgW+x7eJePAyxXFfGQdIc3GhwsBgl21/oB94jldqV6VbSXVCJW44GKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747857642; c=relaxed/simple;
	bh=FLdGAjW0ervgkl6ULHtgn05JK80AMWZ7mlHdaJ48SKs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QdfVcA6zRCQDjZjFQISPfav9b3STLx1taVO9+T6mK3ge0F9QsZ/XJ4YS7mQnK1vYZUoaanwy3l7k9ZAFbeiamKR0+RrTYzTPmhMbr24G9PQFknK9/OmVepojG0ophTbc+G1s9AD4zlSym5BwSHSp03Hiig2xNlhn7ydoKgLp6yM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bMpN5NbG; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bMpN5NbG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747857639;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YcCgMFV9L/DlaugznX+AK32Fe6PE9U4WUXzCuFd+lzo=;
	b=bMpN5NbG9GKetdnVdZipJrZh6AW+7Jgep9JCuRIZ3qoAH51M1jNHGTNvq7QByN5ARSV65x
	7blMz1YWOOiWi1nyQR5w5r5feLPHew5EtQy/J4luuJz5LHeNvvrXAdpqjD3z7LMjeHzXa8
	Mfp6SwvDLYYLC03iquZ6jxdjp2sE6Ls=
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-61-K5YBCTwqPZGM1LjO3YERqA-1; Wed, 21 May 2025 16:00:37 -0400
X-MC-Unique: K5YBCTwqPZGM1LjO3YERqA-1
X-Mimecast-MFC-AGG-ID: K5YBCTwqPZGM1LjO3YERqA_1747857637
Received: by mail-io1-f72.google.com with SMTP id ca18e2360f4ac-85b3e93e052so128563339f.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 13:00:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747857637; x=1748462437;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YcCgMFV9L/DlaugznX+AK32Fe6PE9U4WUXzCuFd+lzo=;
        b=XX9Rxonp3TFdI1h9VsJOszcFd46Dxg/wROPNzuKiNGIjr14mHkgMRomj0xg91Q0ePD
         ThTfL90atRMUSZjpvwIoUxJoPJ7CoupoPSHQvmbkyKpxHibV5osPgJ/gvdjH/iRXNhk/
         9eYiUBNMAVyTk2zjxp8URUUj7lwcRENXmHvm3fj1jGzT12RXBaNMMF5B35TLlzTGkNwA
         N7+qlcsC66Evxvo9DeczgG6Rq6ajAnsuW/K0usZPb7zFZ7sp9RZ+wp9flIEb8a+9PjNl
         s6Eqnu/QkE8MtOefkaelm8vq1CzVl2vgwTqdgVj28ekQSmlD0+oMoxgGVXp2UyvqWrQk
         9sDw==
X-Forwarded-Encrypted: i=1; AJvYcCU6m4k6nZ9uM/QB5Sd1dvtYTA4otDm4280uSyoeCT1i0fQAP3SB+p4dAFMlcy/rA/p+7SaJDKapVn0DO20=@vger.kernel.org
X-Gm-Message-State: AOJu0YylD/Wc3kgqhVox87KGjyVNmkHZ3b7yj8ZPYJqkw9STZWcs5PfN
	0Q/7chvZoT57wxPUBvBRp6uibki03fXy5ERsD+hqeXbiOiV7LgF5kBRwrKGiPAEg/RH9hLCM3D3
	rFWPRAmzXb0qeeFcTLljlPhvbE6RdoxSwJXCsOajbGqicSTD02Z4QU2t7baSf+H9sYQ==
X-Gm-Gg: ASbGncuU5iVmeGjI3zeLnKVDgnb7FANNJs0FBnVHHTV3op3HrSHXou9OTk4HA7me2J4
	x79QbrwkIqZQ02SD1qrIMwGAHQ2R9f/5qGwAzCIurlqSwbB0m27qH22HQRSRR/klq+/6bcE6QXK
	QhNthVCCAI/D27gZInyqNYkBcl+inBxfXjTJ1qE+DstCplz1N+3EvGnFVeTQIrUHB3/GlmypYfj
	ChJZ4zMFFoyuLIn7n9UKD1/FqrwZ8UGUkd6MXbOuRr+R+YQ2CsDA5lqM1IwpffvmYTOdVuQQbOB
	WneFAJoBgUE5u3g=
X-Received: by 2002:a05:6e02:2592:b0:3d6:cd13:8465 with SMTP id e9e14a558f8ab-3db842976eemr58520295ab.1.1747857636742;
        Wed, 21 May 2025 13:00:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGfbRH8sG+hMDJ4twll4a3+7UTBjij7/0NpcW2K6tYmMF450LaaEk1bRsfCpUPqXNVzkfCvJg==
X-Received: by 2002:a05:6e02:2592:b0:3d6:cd13:8465 with SMTP id e9e14a558f8ab-3db842976eemr58520195ab.1.1747857636370;
        Wed, 21 May 2025 13:00:36 -0700 (PDT)
Received: from redhat.com ([38.15.36.11])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4fbcc4ea690sm2792806173.142.2025.05.21.13.00.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 13:00:35 -0700 (PDT)
Date: Wed, 21 May 2025 14:00:34 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: lirongqing <lirongqing@baidu.com>
Cc: <kwankhede@nvidia.com>, <yan.y.zhao@intel.com>, <cjia@nvidia.com>,
 <kvm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] vfio/type1: fixed rollback in
 vfio_dma_bitmap_alloc_all()
Message-ID: <20250521140034.35648fde.alex.williamson@redhat.com>
In-Reply-To: <20250521034647.2877-1-lirongqing@baidu.com>
References: <20250521034647.2877-1-lirongqing@baidu.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 21 May 2025 11:46:47 +0800
lirongqing <lirongqing@baidu.com> wrote:

> From: Li RongQing <lirongqing@baidu.com>
> 
> The vfio dma bitmap of p should be freed, not n
> 
> Fixes: d6a4c185660c ("vfio iommu: Implementation of ioctl for dirty pages tracking")
> Signed-off-by: Li RongQing <lirongqing@baidu.com>
> ---
>  drivers/vfio/vfio_iommu_type1.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
> index 0ac5607..ba5d91e 100644
> --- a/drivers/vfio/vfio_iommu_type1.c
> +++ b/drivers/vfio/vfio_iommu_type1.c
> @@ -293,7 +293,7 @@ static int vfio_dma_bitmap_alloc_all(struct vfio_iommu *iommu, size_t pgsize)
>  			struct rb_node *p;
>  
>  			for (p = rb_prev(n); p; p = rb_prev(p)) {
> -				struct vfio_dma *dma = rb_entry(n,
> +				struct vfio_dma *dma = rb_entry(p,
>  							struct vfio_dma, node);
>  
>  				vfio_dma_bitmap_free(dma);

Good find.  The change looks correct to me.  For the benefit of stable
backports, let's venture towards being overly verbose in the subject and
commit log.  My suggestion would be:

    vfio/type1: Fix error unwind in migration dirty bitmap allocation

    When setting up dirty page tracking at the vfio IOMMU backend for
    device migration, if an error is encountered allocating a tracking
    bitmap, the unwind loop fails to free previously allocated tracking
    bitmaps.  This occurs because the wrong loop index is used to
    generate the tracking object.  This results in unintended memory
    usage for the life of the current DMA mappings where bitmaps were
    successfully allocated.

    Use the correct loop index to derive the tracking object for
    freeing during unwind.

This gives us some context relative to when we might encounter this
issue (pretty rare) and the scope of the issue (bound to the lifetime
of the vfio_dma object).  If you approve I can incorporate this to v1
or feel free to send a v2 with these updates.  Thanks,

Alex

