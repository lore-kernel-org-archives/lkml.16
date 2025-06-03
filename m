Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4E7622FDEA
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 13:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748957714; cv=none; b=eLfEEVwfJ2Ct5RB6Lt0zCsrvlIBcCH0K7ydkqHEvD+jCSLx91HgfhhTLPoF7mZ1f2j3ysleC+uShhBAER0p7Klk1c7XJMt6/uRyEF6oM2LkE5zm31rK2bcwVSD1+HiSqKgpnDRcX2ACDpaqTySngARhQl2bj8MvNDt5HSrQwUFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748957714; c=relaxed/simple;
	bh=6aXyILyNFzvdfLvnjhe+7eEg65vKZaS3Xgt9s4P7IoA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yi3YyJz+2WrF+UaWK66JzU4v83E0O2GShGDmnmM20uLs0kMGD3KamKnSTEYCrE5B9r7gdSFd/7DuaXdRLNdvBKyLKS8Y8cHoCZNmv1ITASZCFTSRd4p8JtcPqsVpmUi6puyTH5OSNtkfP5K4Db+L792Gm8nm3x2ad7/fVrJ45ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=L9faMCZo; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="L9faMCZo"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6fad4e6d949so22732176d6.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 06:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1748957710; x=1749562510; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=csMjX6EgdDvsoUroDDkC2t6M2H8xOJU7irccfVA/OHY=;
        b=L9faMCZoU5k/eDkzQK021wVY5FNVNBtn7krLf6IoxlHpm1QF2vWzXGv0u7r8BdGjAm
         1ZfBSaDxx3E9EAaIl/9pE9ng1Ii3grLFqUSNGGaK/HmxD9aPIBsW35Zgihs/nAsL0Pj0
         DB8vqs9CFLwCTqERpAvT061kIhjcj3MYkTlunlPQb+nFkd+h4UHb1+UK5G6X5N4nFEQQ
         sJPnqYrKWS9tONkmVjTCC/GacIFCzFqn+4L4+rl4h+tk40iZk7kbUbSsFPC4JZsFF0YK
         YM+kJYa126BBD/AZ0Vw6T1+y8HPQFkyAjcpfoGYjT4hjB5l0PB43dSKVcIDuV8xRE9Cb
         gDPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748957710; x=1749562510;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=csMjX6EgdDvsoUroDDkC2t6M2H8xOJU7irccfVA/OHY=;
        b=cSHUqhgnRolKKiAB+OatTkVcQYOBF9qpZBdZygv0zF7sCGjqWYcGQCg0M9IgZkKYu6
         lLflq9sk2yoiXF+K7noRzxyPmEevKphegnj4OFpI24/Q1rNCvG7EwgN9RjdP3n57P74/
         K3q+NVNyEV+j0QgY86ZG0+X+BfE4/HfzJ01c8EsMiOTCGRhHdvKtWRRlPjy6abfdk7w7
         o5kHyk6JIXDj8wfb6vj5aYqynkbK1b7L5u346qcUvAzOuVfQY2jmQHwYGPef1LyQDEKw
         lpiLlWe2nWhoUVCQ6cd5jObbXL+YoPXCLbg0r7QdNfOmBCW/dZyDtBOlkrXfwEPYluuI
         hAEA==
X-Forwarded-Encrypted: i=1; AJvYcCU40UcqZYhVEuKjFBXPk6fXKgEj6ETB2HnTvxPXs5Rv/EwXGVdCgIDqLfgzswrQ8vJ5Khr5yV6MmPwehFQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJ+7fpMd6XJpIft9MUCEwO2wv+2+ZM3iKIIbjMr62FJtEI1pR7
	A72jF4jQqWrdcqxqWJoiz41zhLuTZgaXiEMXuntrGyyHOmR1AOdTnKm9T5wSiNiOH5I=
X-Gm-Gg: ASbGncsDn0O+BkrM14c5fT7bdrskPnzILtblf6lHibWVaIteUIJkcoPm+bEUTh/Mnsk
	N+AwirV1kPYlJKYgnE4M8G+638T/0Qpm3D1vL+c+ONTJuXVe8u2+Yul3WOTGX/lzz8/qgYeM1Qy
	HNNjXtV8qvgy5guX5NXHCapLQ0GJ4+hwQfg0mwajNY8U9ifVWxba20wS7xvErCaJ15rCEIA33HX
	twW3Od2PU/SRxSJTNK5uRxu/jyO+wHTKSjsTxRv2sJI9YrogIONvNMOuL4OIKjwUpH+ZJnsEkVf
	h/88233XdJ8JdA5DVTr/8gFSomQ5hfdH70eBfjI3e3SiAqIXr055LCIn2hbLm9jOC7hXEHf4mdc
	vGd7ScjCDwFpDmM/rDX9IgsGA+debe4ORpRQFKg==
X-Google-Smtp-Source: AGHT+IGTO1Uq6qWKkHjHjzXPtbeutCQLStskBTpgABiXf8IiWIF7+BRGzTPM/WsKdaJBbv1DscVTNw==
X-Received: by 2002:a05:6214:d87:b0:6eb:1e80:19fa with SMTP id 6a1803df08f44-6fad9090760mr153489766d6.1.1748957710547;
        Tue, 03 Jun 2025 06:35:10 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-56-70.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.56.70])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fac6e2fc45sm80639296d6.122.2025.06.03.06.35.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 06:35:10 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uMRnJ-00000001h4R-2OPU;
	Tue, 03 Jun 2025 10:35:09 -0300
Date: Tue, 3 Jun 2025 10:35:09 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Alistair Popple <apopple@nvidia.com>
Cc: linux-mm@kvack.org, gerald.schaefer@linux.ibm.com,
	dan.j.williams@intel.com, willy@infradead.org, david@redhat.com,
	linux-kernel@vger.kernel.org, nvdimm@lists.linux.dev,
	linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-xfs@vger.kernel.org, jhubbard@nvidia.com, hch@lst.de,
	zhang.lyra@gmail.com, debug@rivosinc.com, bjorn@kernel.org,
	balbirs@nvidia.com, lorenzo.stoakes@oracle.com,
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-cxl@vger.kernel.org, dri-devel@lists.freedesktop.org,
	John@groves.net
Subject: Re: [PATCH 02/12] mm: Convert pXd_devmap checks to vma_is_dax
Message-ID: <20250603133509.GC386142@ziepe.ca>
References: <cover.541c2702181b7461b84f1a6967a3f0e823023fcc.1748500293.git-series.apopple@nvidia.com>
 <224f0265027a9578534586fa1f6ed80270aa24d5.1748500293.git-series.apopple@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <224f0265027a9578534586fa1f6ed80270aa24d5.1748500293.git-series.apopple@nvidia.com>

On Thu, May 29, 2025 at 04:32:03PM +1000, Alistair Popple wrote:
> Currently dax is the only user of pmd and pud mapped ZONE_DEVICE
> pages. Therefore page walkers that want to exclude DAX pages can check
> pmd_devmap or pud_devmap. However soon dax will no longer set PFN_DEV,
> meaning dax pages are mapped as normal pages.
> 
> Ensure page walkers that currently use pXd_devmap to skip DAX pages
> continue to do so by adding explicit checks of the VMA instead.
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> ---
>  fs/userfaultfd.c | 2 +-
>  mm/hmm.c         | 2 +-
>  mm/userfaultfd.c | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
