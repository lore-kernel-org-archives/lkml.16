Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98AF02505A6
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 12:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746448147; cv=none; b=IEkhGm7ZsPS9kTDNu+NyriPTqXSfscQgj871D9VSEz22APn2j+sdJkRwuC/uMQb8WT2ENozZTMxW/ZYpTpO7VD7C536wvV+J3GQ1+uspm9l7CXyj+qUozyKCG3VV7v88KLQa2G0gb2qftYQ7HmM/re1KepCCNEyrwEzpcJ0rQIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746448147; c=relaxed/simple;
	bh=8st2WkhNjYa0sS1ZjGydQ5cI8qeMQD3qVytw+PewtLU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V7eFdgEgaO3UPveEzFordoz4sC9wciBOSkPPbMG+RULcSF9DhVLltE08bNOaS5ir2Q+maoClJgS7coFT3vjfEB5D2e961CEKQPn4W+eKhmovV/8E88h/J1j8sHeppoi5k4KQPmPB9ZVle+aHwEHDuY5xHODIeuM0+dqF5aA0hlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=d5rF7RkT; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="d5rF7RkT"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6f4cd4c07c3so38122566d6.2
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 05:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1746448144; x=1747052944; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mfu+tu5hpHDhrhemjgH6VucLj0HupA6g7txg5hR1fns=;
        b=d5rF7RkTmsJIBWsVD7r8ZkiItKXsgG/IbfI1O5P30GgnZ18NuAXa9eP3PofKtR4MG0
         K3hKiOCDSlt1JiNQdhav+XFXb3Uu6gZqSHBorp5ZpiG1Hm/lph0vpRPQ0MP2poUZKyCZ
         gLaF+DKDt6doc4D+XMMDB+puE8X1g0e1seAAPnKRXk6pn30VYcTdFZ2Vv58Th9J4lcvu
         QFpQupl7AMl5vIx0jZlhfvDVfNplt3sa/ll0jeXRRN/jOxqPVOuRRbGLzME9SNr0s1jh
         r80iCVsOAcD5bTSFn1dsarpkJqTWD7NBAJ+kwQbClpuV4o31q9LP5LPBTWmmjxrOJai7
         Nf/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746448144; x=1747052944;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mfu+tu5hpHDhrhemjgH6VucLj0HupA6g7txg5hR1fns=;
        b=czkUIk41ghMJyuwv6j/IFtVVx84B0F9L8MzbDbaq0cvVF71ie+zlTyJTkXN5IoRJjJ
         qz4WwlFNWJEUTiQSZx24BwiLWaN5FB+9rg7WA2nD6yUws8354iHowul+f+yIUcDAUSrT
         1876P0Ka1OnE6aSvB/dCLzfIY2Ls2IgVD2Yt6xx9qEqE4Z6VGMSvIl4+kJE4WetJ1J9B
         VypWILzyuyJVa32ncq7+Y80N6iyGBRbw0o1dhf6ta3OWx0Gd79GEE6dcRchGi8F860rl
         /Aoe2yvE/7a+ok/9OtV6aSYx9WulanMHUVzezL9gS3ZRlOMs5Om+rTUBGAengHajIEu2
         w1cg==
X-Forwarded-Encrypted: i=1; AJvYcCV/XvAUHVAUM0GjNsDRSvMy6DfxvgJ4cKc3fR6eiLmxygm2YC5vTQ2Iq0Y1XxkSXWswhiTr0e2H4TyCxoc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyt/nWeiOJSYTC+g+uf8Om2ikZFruPKFtIN32acRjWaS6hx3xJv
	epel6RF1/WpFNgBPVE6qQVwbVvsLASBPfxvhhoAP1hgJqw7uBj+8Ib1ME3zBx+k=
X-Gm-Gg: ASbGncs4BX1unXurcbrCeESMPXB/AEc9g/ZYliLV84K/6PobYGKO1ADmVHoCjdyx4DE
	JaZIFW3Y4YQRtZcKGUbCP+9OyniUozGJe0+2Jyr+VGfDz2YCab6uWv1fEaUQxIXsl+840RNRqqy
	o8JSW+/BFxV22FQQfV3S1ho3pS27ZjRqt3sAKy20BDB1T2tCNBlnWIgQhjB8Q3pfuBxDpoMzEcD
	itJPGtYdrhWQOTQ4+8fGO8Md5+3IXVdHdHPIDMXwHDmWFDH/ymLJo9/zMP3a6evNwhUaYrWXVzN
	Z19LCUlWosEjYKO+OMiXi5qlUGGLhNfD0c1sZTBvmYI7zBVrxDH4kNb8o6xU9K31MeDzaTLV9Ly
	cobHxcfMOyvE9BkseZMU=
X-Google-Smtp-Source: AGHT+IHrrCkbPkXSi1eXZMzeybSC5P++W/lKXALdeEOdhNPGMmZG6yFN5oZZyeIbSctGCJtNUEnJAg==
X-Received: by 2002:a05:6214:b69:b0:6d8:99cf:d2db with SMTP id 6a1803df08f44-6f523852b68mr146814446d6.38.1746448144313;
        Mon, 05 May 2025 05:29:04 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-219-86.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.219.86])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f50f3c3887sm54983076d6.38.2025.05.05.05.29.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 05:29:03 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uBuwQ-0000000GxAs-3q1W;
	Mon, 05 May 2025 09:29:02 -0300
Date: Mon, 5 May 2025 09:29:02 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Leon Romanovsky <leon@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
	Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
	Keith Busch <kbusch@kernel.org>, Jake Edge <jake@lwn.net>,
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
Subject: Re: [PATCH v11 0/9] Provide a new two step DMA mapping API
Message-ID: <20250505122902.GF2260621@ziepe.ca>
References: <cover.1746424934.git.leon@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1746424934.git.leon@kernel.org>

On Mon, May 05, 2025 at 10:01:37AM +0300, Leon Romanovsky wrote:
> Hi Marek,
> 
> These are the DMA/IOMMU patches only, which have not seen functional
> changes for a while.  They are tested and reviewed and ready to merge.
> 
> We will work with relevant subsystems to merge rest of the conversion
> patches. At least some of them will be done in next cycle to reduce
> merge conflicts.

Please lets have this on a branch so I can do the rdma parts this
cycle.

Thanks,
Jason
