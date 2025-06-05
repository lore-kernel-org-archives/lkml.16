Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2E6D1F4168
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 16:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749139808; cv=none; b=VAtZr/c+mG5Gwuk3MJ4qOd/7TxEy7R5hkCGjW8L4yzSEP7XAtxDWxCNYGCtgf+E08yL3gjtZNW6FniFphJ+j+pKiDoSF7uUBi6VMhIb1DJhNn+WadL3Za7OO6PAonx1u+J5+gfO0eY9WkjCEPp5sVip63+lHf3SUJzBuwQ1MOuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749139808; c=relaxed/simple;
	bh=o/Tlk9x1eSaxP1Eo8YyEvaZZuLAOeOGyA2Hs3yxwQXI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=J+ZV3ZSNovKBRFZ5EDUHUZmYTfnsdwCA9Al/EmPNzkg7fOap9isW7DMnUjYkyVWZ8lP1AOKfDoNDkAYf02zeyfDIgmx4CFsVYNX0ytNFUe3Apfm8qoauGgPJMKTQEXshc/ywSYafXf2Ranws1qhXnvNCBG+p0gh7RWhCeLUgm40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DA6xyS7R; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DA6xyS7R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749139805;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wDs1HzFrKoifF1hub98p0mc0v8p741xLPpTuV3UpURY=;
	b=DA6xyS7Roo3yzLc7aOvKqSQxpjBtJBR5DmiiX6ZWGHcEBaNYM+Zk2Gabsr8fAztMhyDDNq
	Za7Zt7QbtszofEJjf5fiD0/TTTOB8Ag1nXJLA0AwSWByiuDx7uDOmO+FImVm+ziTyYOeDE
	uBQE6rWOFwaFHX3KAoE/jh6DLWiwMmk=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-101-rSGf6ESROTKGDHIb_BhKbw-1; Thu, 05 Jun 2025 12:10:04 -0400
X-MC-Unique: rSGf6ESROTKGDHIb_BhKbw-1
X-Mimecast-MFC-AGG-ID: rSGf6ESROTKGDHIb_BhKbw_1749139804
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3ddb983411bso2706945ab.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 09:10:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749139803; x=1749744603;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wDs1HzFrKoifF1hub98p0mc0v8p741xLPpTuV3UpURY=;
        b=H9ORFhTe1jSxKwhGSSirKybkTRQPLYp6LaNBeaHx06jHc6GpglqlslM7AuE2I2vmk/
         zGyZkUYTxzXKOiKUkBFeCos6elkwiCNZ88EcrF5a5cF8Ov8Ru4YewM12Epb60J3RJOtB
         r9x9leLeLyotn4BguU6luGHeR2OZYa+vt4L3+FIMxRR4YwZnnLrv/IRgycG4iTEOYtug
         QujDAugWAY6erUenx7gYEW11vP74K1FzG6xIFdWkknuPPAJPy/mY4mbCb8aF2nyDqZ9j
         Q8P6r3+bLxqS7yNwrMfETNopOoUOSjWwfrrY3ttAavywYJWtySR7jk0dfuatVl9BmeDd
         phmw==
X-Forwarded-Encrypted: i=1; AJvYcCXQcOCCes6/Lb7/qxcNRv+BVCgmFf/JvqXFWwRx0f5jZdpRH2jduxfnt34EtnBu2XSLXmskB4DRekZQz30=@vger.kernel.org
X-Gm-Message-State: AOJu0YyvF0pIFJoklttQ4CmZDYId9WI0AKi8K0Zw1hX/YIhhKyNkwWSo
	2xRLjSZFMNlA9yYdmH0xspFX2UZ8s/eCgAWoVr0bD6aUMITEuqvXgvBjPW065BCdZzJGdjfb6j0
	0F1AH3P/Yn5jJ7HjZBBGX5cpQ3Nh+9xlCYaIy4h8oQnNOUZkkpHaJfomtb4dJkrei7gKkEkshtw
	==
X-Gm-Gg: ASbGncuEaEoUucz9iRKuHqPl/FLiVo5Ms8IiIVUAkSHGWE5kxLByFF/9sArlogOcJVf
	Bdewnn8KGhmdIuSznYhIWPugYL4nMSg+F7K2K05bTcJI/5ZzAlDVo0TZyBwPKwgJ5xubq6GDwo5
	fVuKQ7JH28WXNT+bCA2DKCg2Rv6JE966rAGBn2+8lNiJHZMZoRHcI5qVBnq4gM/tKWuuTvdvKgA
	nhRuj4a797Z3TuCuwTem6HhaSZJUIY+SqIOaPAnMZyuVwl9R4fyuJUSE2CfTGkaFqeoK5GD686W
	6kkMFeCOWyZ8w1k=
X-Received: by 2002:a05:6e02:2206:b0:3dd:b589:9da5 with SMTP id e9e14a558f8ab-3ddbece82afmr22588565ab.1.1749139803055;
        Thu, 05 Jun 2025 09:10:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEBfaCbaCOLCMKp+VFVqNAc7n8GjDzBAgP6HF7JopaVxLiFSueJ4pIKVONeJY/lKn0BrZzv1A==
X-Received: by 2002:a05:6e02:2206:b0:3dd:b589:9da5 with SMTP id e9e14a558f8ab-3ddbece82afmr22588485ab.1.1749139802661;
        Thu, 05 Jun 2025 09:10:02 -0700 (PDT)
Received: from redhat.com ([38.15.36.11])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4fdd7ed82fbsm3360220173.90.2025.06.05.09.10.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 09:10:00 -0700 (PDT)
Date: Thu, 5 Jun 2025 10:09:58 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: lizhe.67@bytedance.com
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC] vfio/type1: optimize vfio_unpin_pages_remote() for large
 folio
Message-ID: <20250605100958.10c885d3.alex.williamson@redhat.com>
In-Reply-To: <20250605124923.21896-1-lizhe.67@bytedance.com>
References: <20250605124923.21896-1-lizhe.67@bytedance.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu,  5 Jun 2025 20:49:23 +0800
lizhe.67@bytedance.com wrote:

> From: Li Zhe <lizhe.67@bytedance.com>
> 
> This patch is based on patch 'vfio/type1: optimize vfio_pin_pages_remote()
> for large folios'[1].
> 
> When vfio_unpin_pages_remote() is called with a range of addresses that
> includes large folios, the function currently performs individual
> put_pfn() operations for each page. This can lead to significant
> performance overheads, especially when dealing with large ranges of pages.
> 
> This patch optimize this process by batching the put_pfn() operations.
> 
> The performance test results, based on v6.15, for completing the 8G VFIO
> IOMMU DMA unmapping, obtained through trace-cmd, are as follows. In this
> case, the 8G virtual address space has been separately mapped to small
> folio and physical memory using hugetlbfs with pagesize=2M. For large
> folio, we achieve an approximate 66% performance improvement. However,
> for small folios, there is an approximate 11% performance degradation.
> 
> Before this patch:
> 
>     hugetlbfs with pagesize=2M:
>     funcgraph_entry:      # 94413.092 us |  vfio_unmap_unpin();
> 
>     small folio:
>     funcgraph_entry:      # 118273.331 us |  vfio_unmap_unpin();
> 
> After this patch:
> 
>     hugetlbfs with pagesize=2M:
>     funcgraph_entry:      # 31260.124 us |  vfio_unmap_unpin();
> 
>     small folio:
>     funcgraph_entry:      # 131945.796 us |  vfio_unmap_unpin();

I was just playing with a unit test[1] to validate your previous patch
and added this as well:

Test options:

	vfio-pci-mem-dma-map <ssss:bb:dd.f> <size GB> [hugetlb path]

I'm running it once with device and size for the madvise and populate
tests, then again adding /dev/hugepages (1G) for the remaining test:

Base:
# vfio-pci-mem-dma-map 0000:0b:00.0 16
------- AVERAGE (MADV_HUGEPAGE) --------
VFIO MAP DMA in 0.294 s (54.4 GB/s)
VFIO UNMAP DMA in 0.175 s (91.3 GB/s)
------- AVERAGE (MAP_POPULATE) --------
VFIO MAP DMA in 0.726 s (22.0 GB/s)
VFIO UNMAP DMA in 0.169 s (94.5 GB/s)
------- AVERAGE (HUGETLBFS) --------
VFIO MAP DMA in 0.071 s (224.0 GB/s)
VFIO UNMAP DMA in 0.103 s (156.0 GB/s)

Map patch:
------- AVERAGE (MADV_HUGEPAGE) --------
VFIO MAP DMA in 0.296 s (54.0 GB/s)
VFIO UNMAP DMA in 0.175 s (91.7 GB/s)
------- AVERAGE (MAP_POPULATE) --------
VFIO MAP DMA in 0.741 s (21.6 GB/s)
VFIO UNMAP DMA in 0.184 s (86.7 GB/s)
------- AVERAGE (HUGETLBFS) --------
VFIO MAP DMA in 0.010 s (1542.9 GB/s)
VFIO UNMAP DMA in 0.109 s (146.1 GB/s)

Map + Unmap patches:
------- AVERAGE (MADV_HUGEPAGE) --------
VFIO MAP DMA in 0.301 s (53.2 GB/s)
VFIO UNMAP DMA in 0.236 s (67.8 GB/s)
------- AVERAGE (MAP_POPULATE) --------
VFIO MAP DMA in 0.735 s (21.8 GB/s)
VFIO UNMAP DMA in 0.234 s (68.4 GB/s)
------- AVERAGE (HUGETLBFS) --------
VFIO MAP DMA in 0.011 s (1434.7 GB/s)
VFIO UNMAP DMA in 0.023 s (686.5 GB/s)

So overall the map optimization shows a nice improvement in hugetlbfs
mapping performance.  I was hoping we'd see some improvement in THP,
but that doesn't appear to be the case.  Will folio_nr_pages() ever be
more than 1 for THP?  The degradation in non-hugetlbfs case is small,
but notable.

The unmap optimization shows a pretty substantial decline in the
non-hugetlbfs cases.  I don't think that can be overlooked.  Thanks,

Alex

[1]https://github.com/awilliam/tests/blob/vfio-pci-mem-dma-map/vfio-pci-mem-dma-map.c

