Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09CE212B71
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 03:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749525022; cv=none; b=bEAEiMWI580TyNk9wZQyUk6eJwUnudmdhT3FQRrLYkLGCtX+EZUrMpVkyz2l0oPPQEp8/Xtjrwho0fO0eXQtg54cDRLl8fJdOj4FQSTtuRH48WE7glW4vuIacLlMfsq4LXGu+zPKnLdHuvXZMeKn26RgBvQxm1xPHrc1SVhz/FY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749525022; c=relaxed/simple;
	bh=TLDsesR3FB85CcRPvN7xaybHG5IAe3goaTAopvfhqpI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pVwyDCmKAvs+GBVaUCXmiVt82ZJ+AZz3GU7Fly9uFUx8Z6lLqj95XPPzCjXdoPqFsb9MEuaR9/Km14XcZSnsn0OvTlLuLuI1l79ww8SedNKsHMI8TdV3AO0Ld8mJ8iNAybaMGitfoMMmezNBWTbpnsy2pr6D1BoIbqO5xLuZudw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=f28ByPgh; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="f28ByPgh"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-b2c40a7ca6eso4748099a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 20:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1749525019; x=1750129819; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dGSjBB1o7uoKjmCv6ULP4PpjQhWXvfAV8Yt/lfU7YU0=;
        b=f28ByPghLYGl5fYxf0is8W5bkeD11SnwpndoQ1paQhPfuIF6uFdvSSoxwPaIyRobS9
         vLHMTtwWXQ0hoOZSvLKE3+saAAUWpKd2hUpXw1MiJd2mZifqxRLdLxhIj5jIXRReT7cA
         ZREvGEra+/2Hh72Ctp3x9k8EFo6vFoLQyyqVv0/SYm8DPzdb1xVwcO/Bt/QEP2rFTwPt
         HdXhrWsjMjZv9hfYrwYqIWTqsdhFzrqPD80TVEzLS4NN7ffPkdq1R7ZH5BT6Awl7Jz2W
         8LfdOdTEO6K3PJLTAdYdGhaH/6plcYvS7sfvh5/imfT3tI1ze1SrBoWy9xs36605yV9g
         kOxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749525019; x=1750129819;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dGSjBB1o7uoKjmCv6ULP4PpjQhWXvfAV8Yt/lfU7YU0=;
        b=A3nyPnS3+Zm9PEJM/s5CGpjTvBnPVVG699lnlyYTVKG6A829jynu0ypuyUyVC7aL+I
         GSnbr7aK8aTeSwdq66HWO3k6Aw8Ry17ZaQ5hjZl+UBC9C+DqIcLVUrQ11r1zUFS4FrZf
         Gm8wrKcjQkqKAMB45KxY5C9vPcUKdskIuWXvOGEoazwWZJY5/GSsW7oqqIG+ir5c3JLv
         E6jv92ineKgAKjs6SI2LJaWpSd/A0ebRO38a8SCHD2axYAcQrJ0M2ZO5gfle002e6aLE
         sFvn/Ln66Qp+XUZW76TV519UDyho2ByH33T9U53jzvY8NYWwE+7LB2rlscmRBysmRSC9
         QckQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1K97IbdwRJwuWPk8ksz4fr43BXXzKbWt6i1y1XEo6glVkf1OTUSPrkkj2wMdGhQAiDkX8tztWChrbX6Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YxNJ+0u5AiLrSdb1bFYUKMsPvnplSD+H+eI01z5GN4HDb7qibyx
	FjN+rRnF5i3F7pRgrcrdZ5h0zOQtp9OzC5Jzjw+KQ+t+EAf6X8yX0Ek282MCcU56nnM=
X-Gm-Gg: ASbGnctAVg3rZZq9MldRmdYluMSJJy7qufraaBbe8P6ME1Kn6aT6IIbLFCEpzl857to
	rb7K1pjBIp6VrK6ufMDPNfOTfqv8oyLl22gMOAqsYeNxcjHx910h03aXs1IfrjQhoNXF5BHPNXi
	zpRzZRDxpOG5Z5fuxXz5/sFA/YTeXsOyx0GJLHmjdvmeZN8giAaUwsAVy+SNhPDUlCeSBTUMjGA
	UDgJYEO0rnqhGJKuOcgfB3sJqBENP1feyKzcvEToJc48VeNt6e1P7NbqXJhcytcoujtsnGzDLxa
	0e77aV6Wcdw8mHdqQ1FG355JNZHDktjFD/SpoNdMHbcFCSbtrVZ9x3D6a8HXjhYqBZJ8UeuL8/R
	aE9LWDg26o8lb8w==
X-Google-Smtp-Source: AGHT+IFpEJ4q9YgS64amgMJXFTU6cuDFvbWPHGRI/n1F0zZgpuiRp/i0Y01L+MJGgZel/MfyZz7maw==
X-Received: by 2002:a17:903:110f:b0:234:e3b7:5ce0 with SMTP id d9443c01a7336-23638358859mr12501955ad.47.1749525019141;
        Mon, 09 Jun 2025 20:10:19 -0700 (PDT)
Received: from localhost.localdomain ([203.208.189.10])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31349f34afesm6410725a91.19.2025.06.09.20.10.16
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Jun 2025 20:10:18 -0700 (PDT)
From: lizhe.67@bytedance.com
To: alex.williamson@redhat.com
Cc: kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lizhe.67@bytedance.com
Subject: Re: [RFC] vfio/type1: optimize vfio_unpin_pages_remote() for large folio
Date: Tue, 10 Jun 2025 11:10:13 +0800
Message-ID: <20250610031013.98556-1-lizhe.67@bytedance.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250605100958.10c885d3.alex.williamson@redhat.com>
References: <20250605100958.10c885d3.alex.williamson@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, 5 Jun 2025 10:09:58 -0600, alex.williamson@redhat.com wrote:

> On Thu,  5 Jun 2025 20:49:23 +0800
> lizhe.67@bytedance.com wrote:
> 
> > From: Li Zhe <lizhe.67@bytedance.com>
> > 
> > This patch is based on patch 'vfio/type1: optimize vfio_pin_pages_remote()
> > for large folios'[1].
> > 
> > When vfio_unpin_pages_remote() is called with a range of addresses that
> > includes large folios, the function currently performs individual
> > put_pfn() operations for each page. This can lead to significant
> > performance overheads, especially when dealing with large ranges of pages.
> > 
> > This patch optimize this process by batching the put_pfn() operations.
> > 
> > The performance test results, based on v6.15, for completing the 8G VFIO
> > IOMMU DMA unmapping, obtained through trace-cmd, are as follows. In this
> > case, the 8G virtual address space has been separately mapped to small
> > folio and physical memory using hugetlbfs with pagesize=2M. For large
> > folio, we achieve an approximate 66% performance improvement. However,
> > for small folios, there is an approximate 11% performance degradation.
> > 
> > Before this patch:
> > 
> >     hugetlbfs with pagesize=2M:
> >     funcgraph_entry:      # 94413.092 us |  vfio_unmap_unpin();
> > 
> >     small folio:
> >     funcgraph_entry:      # 118273.331 us |  vfio_unmap_unpin();
> > 
> > After this patch:
> > 
> >     hugetlbfs with pagesize=2M:
> >     funcgraph_entry:      # 31260.124 us |  vfio_unmap_unpin();
> > 
> >     small folio:
> >     funcgraph_entry:      # 131945.796 us |  vfio_unmap_unpin();
> 
> I was just playing with a unit test[1] to validate your previous patch
> and added this as well:
> 
> Test options:
> 
> 	vfio-pci-mem-dma-map <ssss:bb:dd.f> <size GB> [hugetlb path]
> 
> I'm running it once with device and size for the madvise and populate
> tests, then again adding /dev/hugepages (1G) for the remaining test:
> 
> Base:
> # vfio-pci-mem-dma-map 0000:0b:00.0 16
> ------- AVERAGE (MADV_HUGEPAGE) --------
> VFIO MAP DMA in 0.294 s (54.4 GB/s)
> VFIO UNMAP DMA in 0.175 s (91.3 GB/s)
> ------- AVERAGE (MAP_POPULATE) --------
> VFIO MAP DMA in 0.726 s (22.0 GB/s)
> VFIO UNMAP DMA in 0.169 s (94.5 GB/s)
> ------- AVERAGE (HUGETLBFS) --------
> VFIO MAP DMA in 0.071 s (224.0 GB/s)
> VFIO UNMAP DMA in 0.103 s (156.0 GB/s)
> 
> Map patch:
> ------- AVERAGE (MADV_HUGEPAGE) --------
> VFIO MAP DMA in 0.296 s (54.0 GB/s)
> VFIO UNMAP DMA in 0.175 s (91.7 GB/s)
> ------- AVERAGE (MAP_POPULATE) --------
> VFIO MAP DMA in 0.741 s (21.6 GB/s)
> VFIO UNMAP DMA in 0.184 s (86.7 GB/s)
> ------- AVERAGE (HUGETLBFS) --------
> VFIO MAP DMA in 0.010 s (1542.9 GB/s)
> VFIO UNMAP DMA in 0.109 s (146.1 GB/s)
> 
> Map + Unmap patches:
> ------- AVERAGE (MADV_HUGEPAGE) --------
> VFIO MAP DMA in 0.301 s (53.2 GB/s)
> VFIO UNMAP DMA in 0.236 s (67.8 GB/s)
> ------- AVERAGE (MAP_POPULATE) --------
> VFIO MAP DMA in 0.735 s (21.8 GB/s)
> VFIO UNMAP DMA in 0.234 s (68.4 GB/s)
> ------- AVERAGE (HUGETLBFS) --------
> VFIO MAP DMA in 0.011 s (1434.7 GB/s)
> VFIO UNMAP DMA in 0.023 s (686.5 GB/s)
> 
> So overall the map optimization shows a nice improvement in hugetlbfs
> mapping performance.  I was hoping we'd see some improvement in THP,
> but that doesn't appear to be the case.  Will folio_nr_pages() ever be
> more than 1 for THP?  The degradation in non-hugetlbfs case is small,
> but notable.

After I made the following modifications to the unit test, the
performance test results met the expectations.

diff --git a/vfio-pci-mem-dma-map.c b/vfio-pci-mem-dma-map.c
index 6fd3e83..58ea363 100644
--- a/vfio-pci-mem-dma-map.c
+++ b/vfio-pci-mem-dma-map.c
@@ -40,7 +40,7 @@ int main(int argc, char **argv)
 {
        int container, device, ret, huge_fd = -1, pgsize = getpagesize(), i;
        int prot = PROT_READ | PROT_WRITE;
-       int flags = MAP_SHARED | MAP_ANONYMOUS;
+       int flags = MAP_PRIVATE | MAP_ANONYMOUS;
        char mempath[PATH_MAX] = "";
        unsigned long size_gb, j, map_total, unmap_total, start, elapsed;
        float secs;
@@ -131,7 +131,7 @@ int main(int argc, char **argv)
        
                start = now_nsec();
                for (j = 0, ptr = map; j < size_gb << 30; j += pgsize)
-                       (void)ptr[j];
+                       ptr[j] = 1;
                elapsed = now_nsec() - start;
                secs = (float)elapsed / NSEC_PER_SEC;
                fprintf(stderr, "%d: mmap populated in %.3fs\n", i, secs);

It seems that we need to use MAP_PRIVATE in this unit test to utilize
THP, rather than MAP_SHARED. My understanding is that for MAP_SHARED,
we call the function shmem_zero_setup() to map anonymous pages with
"dev/zero." In the case of MAP_PRIVATE, we directly call the function
vma_set_anonymous() (as referenced in the function __mmap_new_vma()).
Since the vm_ops for "dev/zero" does not implement the (*huge_fault)()
callback, this effectively precludes the use of THP.

In addition, the expression (void)ptr[j] might be ignored by the
compiler. It seems like a better strategy to simply assign a value
to it.

After making this modification to the unit test, there is almost no
difference in performance between the THP scenario and the hugetlbfs
scenario.

Base(v6.15):
#./vfio-pci-mem-dma-map 0000:03:00.0 16
------- AVERAGE (MADV_HUGEPAGE) --------
VFIO MAP DMA in 0.048 s (331.3 GB/s)
VFIO UNMAP DMA in 0.138 s (116.1 GB/s)
------- AVERAGE (MAP_POPULATE) --------
VFIO MAP DMA in 0.281 s (57.0 GB/s)
VFIO UNMAP DMA in 0.313 s (51.1 GB/s)
------- AVERAGE (HUGETLBFS) --------
VFIO MAP DMA in 0.053 s (301.2 GB/s)
VFIO UNMAP DMA in 0.139 s (115.2 GB/s)

Map patch:
------- AVERAGE (MADV_HUGEPAGE) --------
VFIO MAP DMA in 0.028 s (581.7 GB/s)
VFIO UNMAP DMA in 0.138 s (115.5 GB/s)
------- AVERAGE (MAP_POPULATE) --------
VFIO MAP DMA in 0.288 s (55.5 GB/s)
VFIO UNMAP DMA in 0.308 s (52.0 GB/s)
------- AVERAGE (HUGETLBFS) --------
VFIO MAP DMA in 0.032 s (496.5 GB/s)
VFIO UNMAP DMA in 0.140 s (114.4 GB/s)

> The unmap optimization shows a pretty substantial decline in the
> non-hugetlbfs cases.  I don't think that can be overlooked.  Thanks,

Yes, the performance in the MAP_POPULATE scenario will experience
a significant drop. I've recently come up with a better idea to
address this performance issue. I will send the v2 patch later.

Thanks,
Zhe
