Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EBF5220F21
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 20:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748463115; cv=none; b=UxmblzBwV0oK2WnVJ9lnjowmE3NxlHTJ5NRFf2KQGXkgRBQVOFKbr8y48IIWORBA6jBJV+mDmqXkvN8KH4Cjgi1NsW27z27/9+t92Z9unFOnKbjvSNNND7adv7ziu684n9KJ68TwPjqgYNdlXBUpw1dOg5OG+YBnhvukqIxrvpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748463115; c=relaxed/simple;
	bh=yTibps6sQtyWOT1ZpkEFcbp9vQHKMOZepSb52BCrQZw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rw3gpDfdTRhV2SQg9KAufm6ISKfzqEcCVpQcOElGG7whf9EfmUzlwuud0qnFGYahHpYjHzi+O3fozw+PK+Idf3tw3mx9pWaBVUmqzFwW+Lx1qshfNOaJrDFtTICL1XNAFnaz/HcoH2iMtSJhODAm7e3GokOdkItj+BIm36Cxl5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AJSjY46j; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AJSjY46j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748463112;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AXTVaff9a+Mqy0vxS6aINGdRM0ujSeLiK0Ywdp1i2eg=;
	b=AJSjY46jN118BqOXZarL+HRMXys0oPIugMdNYtFiwMN2OKzUXqLgm3UUAU7FTClwEsPZvT
	R3X0n96tZoRfPyZelD9GilJJcKuvSlkJpncfK62qfpwTZ7GbvfHYrtXVZcqvhVSB7kp3cd
	nn1iEm2sVE4E8rYtM0JORLpRFu7YL4s=
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-191-wldPqpuEMOiTAvvoYqV6Cg-1; Wed, 28 May 2025 16:11:50 -0400
X-MC-Unique: wldPqpuEMOiTAvvoYqV6Cg-1
X-Mimecast-MFC-AGG-ID: wldPqpuEMOiTAvvoYqV6Cg_1748463110
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3dd77a1db0bso800805ab.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 13:11:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748463110; x=1749067910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AXTVaff9a+Mqy0vxS6aINGdRM0ujSeLiK0Ywdp1i2eg=;
        b=Vd/B40fd9s7itQRXNDYYOhCoh59mFfhoBYHSXgnHPpKTus3SC9pfVIuzoT8+4mDBZs
         CBVDIqoWxh4+OQ6/sE8qva1lQ8XsQlvfsM9rphv+geqjnC3qA9XSThTdJcvYAg7R7qd9
         TQL40RQLkiYH0Bgj0WttZ12itLQbKpiGeFgWOFRibzLd87uwBohH7blMJunXI55CvIi1
         QJPdGUcntMXnLchoJia76FJWxjbQ0+36ZAtQTWHmcqNT9qK9L63AMHVwjcB463IFwLmw
         uQR4jXoc8cQ4zJ5rz4T5RvSS0jnDXulF9cM5hejl1M8Dfn4EfCMnoZ0T7PNYHUkvex2J
         SgQA==
X-Forwarded-Encrypted: i=1; AJvYcCU8t4LI9pYL2I6t7FPBu3PHzvmxb2zLBdsX1DFb2JvYfIDig2oTtuwvYq8oFIm5zlZf5OFZ1CY7q79mbaM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3szRRnb7YPk/b7gzYeawxY1euI6kQqPrZU2e5gjwy6zWionjp
	AKACqqFdpa2IWnf/gkhpiOl8sMgEJcebUK5MI4cj1PcTb+T+Fn+bYRy8u4geqqCXNxVO3ZKmGod
	993RAxHfG2JXpBumqj78FbV8zJIaARCmo+A+Dei3HBI+nZQEES8mhfACNBUczydepSA==
X-Gm-Gg: ASbGncsee6+l3YpOw9y1NsaxOfHhou0B2JAkaAL2IakLRGqmufZEVTFzId6F3lhVNPD
	ChOYs1F6Rhn7LELm/0WYvabaIxw9XXXxYifzvQqd/yBIo27I583hg3hZ9xG52D0tDlw3WzYSIcV
	jJ+qNZnLnD2WGmKyjFm3oID13GTpTgrie9p8LJH0S54RcUb0u6bZtmPxIQVBFUCzgng5kKkyoWY
	scL8kLC5kpR5XF7av1rK9Ht3LopqeaucItmv/ALDa51OXfzwyxbvIRI9qrwZ8ekzyXAtHxfSlWw
	glIJMe/Oj90WmcM=
X-Received: by 2002:a05:6602:13cb:b0:85e:5cbc:115 with SMTP id ca18e2360f4ac-86ce9603c1amr143964439f.1.1748463109993;
        Wed, 28 May 2025 13:11:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHWRD0ZinUQC5DXrMjGiU9am068ESztzqYYU2+gGmoY/VB0ikpKuuvysopy0HHu0Fgc4j91Pw==
X-Received: by 2002:a05:6602:13cb:b0:85e:5cbc:115 with SMTP id ca18e2360f4ac-86ce9603c1amr143962939f.1.1748463109617;
        Wed, 28 May 2025 13:11:49 -0700 (PDT)
Received: from redhat.com ([38.15.36.11])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4fdbd5a8db5sm360812173.122.2025.05.28.13.11.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 13:11:48 -0700 (PDT)
Date: Wed, 28 May 2025 14:11:47 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: lizhe.67@bytedance.com
Cc: david@redhat.com, kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
 muchun.song@linux.dev, peterx@redhat.com
Subject: Re: [PATCH v4] vfio/type1: optimize vfio_pin_pages_remote() for
 large folio
Message-ID: <20250528141147.2d91370c.alex.williamson@redhat.com>
In-Reply-To: <20250528042124.69827-1-lizhe.67@bytedance.com>
References: <20250527131450.7e961373.alex.williamson@redhat.com>
	<20250528042124.69827-1-lizhe.67@bytedance.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 28 May 2025 12:21:24 +0800
lizhe.67@bytedance.com wrote:

> On Tue, 27 May 2025 13:14:50 -0600, alex.williamson@redhat.com wrote: 
> 
> > > The utilization of the function vpfn_pages() is undoubtedly a
> > > good idea. It can swiftly determine the num of vpfn pages
> > > within a specified range, which will evidently expedite the
> > > process of vfio_pin_pages_remote(). Given that the function
> > > vfio_find_vpfn_range() returns the "top" node in the rb tree
> > > that satisfies the condition within the range
> > > [iova_start, iova_end), might we consider implementing the
> > > functionality of vpfn_pages() using the following approach?
> > > 
> > > +static long _vpfn_pages(struct vfio_pfn *vpfn,
> > > +               dma_addr_t iova_start, dma_addr_t iova_end)
> > > +{
> > > +       struct vfio_pfn *left;
> > > +       struct vfio_pfn *right;
> > > +
> > > +       if (!vpfn)
> > > +               return 0;
> > > +
> > > +       left = vpfn->node.rb_left ?
> > > +               rb_entry(vpfn->node.rb_left, struct vfio_pfn, node) : NULL;
> > > +       right = vpfn->node.rb_right ?
> > > +               rb_entry(vpfn->node.rb_right, struct vfio_pfn, node) : NULL;
> > > +
> > > +       if ((vpfn->iova >= iova_start) && (vpfn->iova < iova_end))
> > > +               return 1 + _vpfn_pages(left, iova_start, iova_end) +
> > > +                               _vpfn_pages(right, iova_start, iova_end);
> > > +
> > > +       if (vpfn->iova >= iova_end)
> > > +               return _vpfn_pages(left, iova_start, iova_end);
> > > +
> > > +       return _vpfn_pages(right, iova_start, iova_end);
> > > +}  
> > 
> > Recursion doesn't seem like a good fit here, the depth is practically
> > unbounded.  Why not just use the new range function to find the highest
> > point in the tree that intersects, then search each direction in
> > separate loops (rb_next/rb_prev), counting additional entries within
> > the range?  Thanks,
> > 
> > Alex  
> 
> Oh, I see what you mean. So the implementation of vpfn_pages() might be
> something like this.
> 
> +static long vpfn_pages(struct vfio_dma *dma,
> +               dma_addr_t iova_start, long nr_pages)
> +{
> +       dma_addr_t iova_end = iova_start + (nr_pages << PAGE_SHIFT);
> +       struct vfio_pfn *top = vfio_find_vpfn_range(dma, iova_start, iova_end);
> +       long ret = 1;
> +       struct vfio_pfn *vpfn;
> +       struct rb_node *prev;
> +       struct rb_node *next;
> +
> +       if (likely(!top))
> +               return 0;
> +
> +       prev = next = &top->node;
> +
> +       while ((prev = rb_prev(prev))) {
> +               vpfn = rb_entry(prev, struct vfio_pfn, node);
> +               if (vpfn->iova < iova_start)
> +                       break;
> +               ret++;
> +       }
> +
> +       while ((next = rb_next(next))) {
> +               vpfn = rb_entry(next, struct vfio_pfn, node);
> +               if (vpfn->iova >= iova_end)
> +                       break;
> +               ret++;
> +       }
> +
> +       return ret;
> +}

Yes, that looks like it should work to me.  Thanks,

Alex

