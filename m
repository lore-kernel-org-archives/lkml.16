Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3D812857F6
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 17:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745429699; cv=none; b=d49w4oKIlCYLLrO6MiLbFQvSFiTMItZdOOHtiP7FzToQcHQEdmyNV7nSsITwWQkLrO53E1WLXRN2dOak85j1Hh/+7mLfq566vgdbJCOB+wFOjta4a2YS3xfDKtETNgnLmiehBDgVve0870dBPKmcMNuPAPZsKe0NFPn1uo0wH7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745429699; c=relaxed/simple;
	bh=zB24IJl1jZzMHzgO4K1Iy0NHxHgoWs9FaxvjZYsQalw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ODHvKcoz25qHk5sIHKs9NB552JzPiDJgEsLCR5bU4fJifjdrnsZCzKq9/b3Bd7PQEwVj2U0LiFOUy2OwDVeDgdGHE65X60j6+f7VN4N4PNPlB/UDbwnPwCJBYNT2/pg9M0aBZbG93+nuzQWAzNu5+Ucq41L3hmlKS5MOnUVl5HU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=jKeC0wG0; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="jKeC0wG0"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7c56a3def84so9680785a.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 10:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1745429696; x=1746034496; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=I+fayQ/PBTnrOfxtrw3IgFnI1QJK9xAjEiHuuXs7Kpg=;
        b=jKeC0wG0Rxs29aLtFTXrwvm6sCjBlI+WjPNCPmALgo/mjnmuyNi8RzQ8EoTi2n9ato
         G2uR8+wTHeXdzUwlwgxBh5NicR8ymrLhg0bWgtzToqLWFgmbk1yR2sBCKvTWpQ2XzEqK
         c+gqSngWmaHabqIMpagt+bie9Wb3ZUbIY0uf9WN8dkBe5oq6/jz0Omc/q/isRe5XxD6s
         wIyd2QIvWZ+V+k8HV/tY0iBuNr8JlAnZaGxdHRzWwWJdpEc7zUCULfC7NElEQ7ugzKS1
         ukaL0jDlfBwfBtKiA5JthSNqw13rTy4KL+WCFZHxth3Teiilhqthip7KWkPBUKtkiX7c
         Z7dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745429696; x=1746034496;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I+fayQ/PBTnrOfxtrw3IgFnI1QJK9xAjEiHuuXs7Kpg=;
        b=vefaVV7xfpJsq5iOmjKoyORKKEiWpjFHyEu0lcWtdi2uW0e4W+RGF0syZHaqxE1gTb
         kHQwtOL/nrt+4VC4aOzwSMRtzKgaJxdlXHQiB9M3lnoQSHUOcS4q+/Y6VGnsxtqWBP0D
         vWs11oGmaYd66967IBAIQtVX8XrZomJ35xitHkjadvveR8/oJggl5RlgMe4V6jfo+L4p
         zOw1+4LbbcHXNFiUtWaRbJLMpW3d5nplxlD6Vlr4+1y3GnRs+Eiq17anPSHSDvcRtZ1S
         0DdqIB03UzGdctT5jU7srK4JnLPlpRQslaTZgJUhg6zde6gPaVgKGtyJr8dnLzNqZAt/
         sCkg==
X-Forwarded-Encrypted: i=1; AJvYcCX9wM6oq9Ivt5x5l4/1vyzkvAgZwxW4/iTD4CHRGSdGceaGBsSpxECmqJqL3VLwKqrZD8mabZIm/MOaKRY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+rtouuR5AEMydZQJot0pmh1xFzNH+ASJ3ZkX3rjMbV9uZ36DK
	XCCb98DaXeFg4FT/KBzJT4k1VPj3UefiedJ/kVyxq8O/he6NG1RaEDoo48iLTqY=
X-Gm-Gg: ASbGnctPv6pRVZhW0psc8cLmyYCXoqovt/fqJbWs6xU/+9RH6I3m97pvJDs57IKf1vk
	bF1z12zmalhw49weTXahImTXcK5hPuFj/QcfclpG1ZZr+2Bwp+9BGJZZUgh7f7FYW5YyCt4cn0x
	LQuJIvn+Lj5Tk96lWv7KnVXGh5bjoT/O+iZgDlzfqnwU6Az4eurI89hIydJ9GhgTScoYk3JlAya
	lKjASi02/fDM5yiEHN8Jam36N6/V0zIrpPbvUSOCydUTpF4uUKIz5RpdbJB6IlILy80IOPUzjjj
	1sPwwlNdmuypCi3C8/pNB23IpHmPw1y2MHXb0gkVFRzPB3MDQewLcJMJ1eamC5Q1wSk8utEOn6G
	iyCxHFGdaJg/ekgyvU6k=
X-Google-Smtp-Source: AGHT+IHrcKTZfJXCAhkO2WaOum0PT2hRMW3vGaRhpe2sCjwAXzgjbldqD9beTUKDcznlrIIPKNuBAw==
X-Received: by 2002:a05:620a:2953:b0:7c7:97ff:ca42 with SMTP id af79cd13be357-7c955e7c7d7mr65261285a.41.1745429696505;
        Wed, 23 Apr 2025 10:34:56 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-219-86.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.219.86])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c925a8bf65sm707741185a.25.2025.04.23.10.34.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 10:34:56 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1u7dzr-00000007LbA-2PtY;
	Wed, 23 Apr 2025 14:34:55 -0300
Date: Wed, 23 Apr 2025 14:34:55 -0300
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
Subject: Re: [PATCH v9 12/24] RDMA/umem: Store ODP access mask information in
 PFN
Message-ID: <20250423173455.GN1213339@ziepe.ca>
References: <cover.1745394536.git.leon@kernel.org>
 <f81331e55cf95b941e6c57f940a2a204141bf2e1.1745394536.git.leon@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f81331e55cf95b941e6c57f940a2a204141bf2e1.1745394536.git.leon@kernel.org>

On Wed, Apr 23, 2025 at 11:13:03AM +0300, Leon Romanovsky wrote:
> From: Leon Romanovsky <leonro@nvidia.com>
> 
> As a preparation to remove dma_list, store access mask in PFN pointer
> and not in dma_addr_t.
> 
> Tested-by: Jens Axboe <axboe@kernel.dk>
> Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
> ---
>  drivers/infiniband/core/umem_odp.c   | 103 +++++++++++----------------
>  drivers/infiniband/hw/mlx5/mlx5_ib.h |   1 +
>  drivers/infiniband/hw/mlx5/odp.c     |  37 +++++-----
>  drivers/infiniband/sw/rxe/rxe_odp.c  |  14 ++--
>  include/rdma/ib_umem_odp.h           |  14 +---
>  5 files changed, 70 insertions(+), 99 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
