Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4732266569
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 17:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745429789; cv=none; b=ncYmGySJCBePhjkSLRRnz1xg++oCSAGLw+11lUDC9IdGCIa886kZFgwgr1nw4lKlabCCFtVXtnwnI2EGniuYIk1P0AO3t9+wiQpAHA2Why/8wKJXQ4TICKG3GUc8CeJcEPtBLCxyy+uv10k40D1MsdiEo7dFHNtia01xccZCwA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745429789; c=relaxed/simple;
	bh=drAiBKTIiyi9mLR+BwbEskkyvzsYVuH4EzXGje0dF0c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Khh1iwo2HRKiQjYd6uAMol8V/qUX0ojlgWsr7BgTe83GNhJQg7vXjVY9KjjYKZcML9QMhx76CjQk5tqs01CC8SPKbWxT7ip8cAREExcjml5q0sgXtMuXRFPvK+h7W+C4DQU09CiKbZTdGbRrlPqiE5yTOgxVZyvjAHybwxx45rA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=nECGOegw; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="nECGOegw"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7c08fc20194so13549585a.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 10:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1745429786; x=1746034586; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rNJodNA/CGOE8qYPmCoAIvEyeqrCcwNf4apB4pxSGaA=;
        b=nECGOegwoDaon8i7eVtKxXoiAeyi+dwz/Mu4/CD/hldn1xswY9Jn8BCh4H3ajxW1i0
         LYO5ucHVY+hQ6Enk8MJef6znkZLkmrsKK498EwoF216ulIsuSKn9KaxdU4cFdbcPVGD4
         jalkaWuOrHVCdfs5yVqjLX7mi2DMOINJAtF2iY1DKphNwhBU1BAt8TNjjo/7TQi9EWoE
         10WiL8VhTOgMQMWGR9lRHkTcsIOzU7y12U8RAeJT32k19zA0zXtL3WLyTpaYzOO+dcno
         stvqp3Wc7DgapQLNyGoyKUxeLxhjaHDNkRzqHhIwiuTIRTwQ+OimLmRQ9y52fkxYGEJG
         LN/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745429786; x=1746034586;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rNJodNA/CGOE8qYPmCoAIvEyeqrCcwNf4apB4pxSGaA=;
        b=ehYDzMq6GOBzkXzKsvOx5hdjuo5hfocrzX5kF2xHHxDh6JHj7iGtjAC71dUICgAOfS
         DNLln1oNB3ZulgTE9+h7kWDqCcabsIeyqLL6i5T5tnR6k1O5QrNn2jpB60NZVateb+2T
         Vt4k+ggvnHWdgJQOMiPQA015HEapmzLsWOn7yUtv4WbOlqYz3J7zkCNxqd8rtdewjCCM
         Q9tx7LQ2etudKO+4s6ZBxIVImRIuG1JdeQBB2t6Gl4olxAgVUaoTyu3t4bFhbSzwQtku
         ojV/SLX98Q8HrTGLhAdLBPxWwS5u8TKUmetFRQ4O+SS28Coya5lrBzZDA+RsvGMSW8Tn
         DCyg==
X-Forwarded-Encrypted: i=1; AJvYcCW+5cnWv33qQXsELZEK8oTyVaGteJMaOH6yeHEkf4U1h8+xX3kaxHh8+HGn3lK29QSb+LOq1NeiNUwSwC4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxfuB2RTIAUX4v1EpQ+tZVlZfGy56pFV+uSoTnSaEjChCvtLE1F
	ElWMmHkZKX1g/aaEGHE03EINmx2Om5HpPDna6LP0cv94LZe60g3y9OeQLzhY82Q=
X-Gm-Gg: ASbGncthGJnkgO6TddDuAzczyRn3FJihdPORbWHFLcKgGsfgq+DOy/Mul3olU67Gcrr
	9pYXBgpLSYJ0O+616K+0qJpNK/jgNehvOlMlcwit5TCythZsqu1NlsKVjsZA6RvRJowwFodNdjl
	R2O0h6i537zG8BJ4EvuPPEx29CcBcG5EPwrmB/IjC8OcoUK3NolEyG4+6G5FM5HOPlLjuhKA7zW
	009Hds5+qPr0em0RuclmWdnc5JGYHYPeweqrlq5MU+8XtDhHACNs524nYVWAj7JJfRy4Z2GyPUA
	cf2XGEyN0J5IP9FFBfGc25ciR6U4Hh5tQUuy5teD5iM9pevSZQXvHGosAFGlOBNotv9zZM7eJHu
	mn/ssorDDkRSMSA+BOi8=
X-Google-Smtp-Source: AGHT+IFfYFJ3H6MHGXkZxUwtNrKhvKS2i7aEibqmChB9ejFnkuFqgY0c21HHcZ68bh6mda7wa7inKA==
X-Received: by 2002:a05:620a:44d3:b0:7c7:a5ce:aaf1 with SMTP id af79cd13be357-7c928018e95mr2986289985a.35.1745429786563;
        Wed, 23 Apr 2025 10:36:26 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-219-86.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.219.86])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c925a6eb31sm709808085a.3.2025.04.23.10.36.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 10:36:26 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1u7e1J-00000007Lca-2cT8;
	Wed, 23 Apr 2025 14:36:25 -0300
Date: Wed, 23 Apr 2025 14:36:25 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Leon Romanovsky <leon@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
	Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
	Keith Busch <kbusch@kernel.org>,
	Leon Romanovsky <leonro@nvidia.com>, Jake Edge <jake@lwn.net>,
	Jonathan Corbet <corbet@lwn.net>, Zhu Yanjun <zyjzyj2000@gmail.com>,
	Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Sagi Grimberg <sagi@grimberg.me>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Logan Gunthorpe <logang@deltatee.com>,
	Yishai Hadas <yishaih@nvidia.com>,
	Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	=?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, linux-rdma@vger.kernel.org,
	iommu@lists.linux.dev, linux-nvme@lists.infradead.org,
	linux-pci@vger.kernel.org, kvm@vger.kernel.org, linux-mm@kvack.org,
	Niklas Schnelle <schnelle@linux.ibm.com>,
	Chuck Lever <chuck.lever@oracle.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Dan Williams <dan.j.williams@intel.com>,
	Kanchan Joshi <joshi.k@samsung.com>,
	Chaitanya Kulkarni <kch@nvidia.com>
Subject: Re: [PATCH v9 13/24] RDMA/core: Convert UMEM ODP DMA mapping to
 caching IOVA and page linkage
Message-ID: <20250423173625.GO1213339@ziepe.ca>
References: <cover.1745394536.git.leon@kernel.org>
 <7d6f3d50c4e6eb3ab75fd4c5bbaa8efcb1a15b3c.1745394536.git.leon@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7d6f3d50c4e6eb3ab75fd4c5bbaa8efcb1a15b3c.1745394536.git.leon@kernel.org>

On Wed, Apr 23, 2025 at 11:13:04AM +0300, Leon Romanovsky wrote:
> From: Leon Romanovsky <leonro@nvidia.com>
> 
> Reuse newly added DMA API to cache IOVA and only link/unlink pages
> in fast path for UMEM ODP flow.
> 
> Tested-by: Jens Axboe <axboe@kernel.dk>
> Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
> ---
>  drivers/infiniband/core/umem_odp.c   | 104 ++++++---------------------
>  drivers/infiniband/hw/mlx5/mlx5_ib.h |  11 +--
>  drivers/infiniband/hw/mlx5/odp.c     |  40 +++++++----
>  drivers/infiniband/hw/mlx5/umr.c     |  12 +++-
>  drivers/infiniband/sw/rxe/rxe_odp.c  |   4 +-
>  include/rdma/ib_umem_odp.h           |  13 +---
>  6 files changed, 71 insertions(+), 113 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
