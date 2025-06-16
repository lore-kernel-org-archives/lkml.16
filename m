Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD0B5224AE0
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 22:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750111829; cv=none; b=ef9RmQ+NrS6ZYypyZNZZW0ePi7sWDYa+uZQCOix0maTT8c7gRnRD4t6RbystSjJFyntmAVsb5OtPhr2ExzmNP2WdHgQexrAsFly0H3YG+8O529YG4Yxl1tJLjEZT7fwbAYjy0B7UCzVfUn8UhJo94tUCEPTnJZSIP3mcNt4dx4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750111829; c=relaxed/simple;
	bh=8MpOJnSEQjfDa1EhgGnvBups2yrDGZ61bYb4+vQnEzI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BreJ49w2y+Z4ibgV9o9gPqMS0KsDbqpoC24cHjK1Uy9yPPWyguYMn4twxTD7rbPbmG+2cSl5NNq7yLdFV3kqx6/Fzh4eHtKAYu8auLuFxl3/VBnnbDeAf7NAhrd9U87592R/OXxYm8GFKA9+Y/uxgZ3uV4U+Fw44ni3UFPuztTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qDQqkVCB; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qDQqkVCB"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-235ca5eba8cso61015ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 15:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750111827; x=1750716627; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0kNU98GqvoY/2N+rHSgzZWQGmQpqcL99KyddV2L+Mps=;
        b=qDQqkVCB4TEAJjn7jRQzbWHFXwKmi0MPhYXzN4qMUENL2X3Yp7KDQri+ScCyC9pR5u
         l0MlJSA8YYePwFFfvTizIfZzXz6nsRUUd8kdoA194mf3UkHNpybT9az3DPZKjZ1dmki1
         zvgkmcS2lUkSsc2IUPV4Z2lwqGQR7jfsDtnSztBEVJxi6wKkG6e1I6URXiP781SfB6Qd
         kgQeVl4RFgX/UlsevLcsl1iPXIMYsbThA64Mx8q7P37Xo6TMJTArdEMUuLnoKXcxsGon
         50cblzIkFTB0pzFYm70nf9E2xLONo+CgXPkf80UuGMC5XmBmqUq9qx4DTEZjXKr8q383
         iZcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750111827; x=1750716627;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0kNU98GqvoY/2N+rHSgzZWQGmQpqcL99KyddV2L+Mps=;
        b=MBXZH3r6LSClMEr0NzG3EV3uh0vbKnlxWguaIE8clnUxAiKOVhn4hvCBH1jdjwxAYo
         ukNjRVwVBkA12pnYj6zVIrXrdvZkouuWpolYlcQx8i0nlCBEwVCarGYz8+SaeLeIc9KV
         HT/rxkRUCxbOls0ZVxx2Xnl/nMAGNEvTe1wqcrDpz9I/E8SOyMbCwJe3RWjrQrXrYVMd
         3OCQ5mzRmAn7NPf2f7Igi1PcDigBj1/ze0f6Tc+aA8Z4/NkEAx6xJE+4Z8/+Sg37Fggq
         0/I/YdWGLWOH73wB6urd5Wla3EPtBnPKpxJusCUyfo4s53r8LbXzwyqdyKtlynpSDyuo
         BnLA==
X-Forwarded-Encrypted: i=1; AJvYcCWZtxq3Bx8qTKoOuZ7vefhneV3qXHmw7G4w1M+MMskn4m5iXkW5YZRzaTXjphwun9DViXX5xJ+SS2V3SM0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVBEhYhWPt5axa8j/E0bRjMyIv3rGVUylgpcTzK5f95XYmi3mE
	RIfwAjxoBehr6KsDuobwJR4L2Pwu6O3rHoG8iudXuq+KS+5sXOq1Qzqx4Rx4JyAXayvyECdCQ0e
	GvvQ70ViD
X-Gm-Gg: ASbGncsIxujWtSlT+tCrwvGuZUT6DhBmymJZs/+AgisWkLfczoTK7XOMxcXSaUN50Xo
	WDW2Nhn9bgB3Nje6WQNmF7OCrJwCySW7wBUIFIfzyc2tWhiRk856Q3gYMzhUBOfPaEc2NlKHW+p
	/91qwFpynKOICbSGznOX3++8gdtYGRnMX2za6OjdqwE0Vjo5bdj53nhOyZJJ4J/FNYXvCBR7iQu
	N8LJaWtcLpAZYobQe4xw/6Oul7Vbikb2jmxAo/9qWC0buGbtpwJcE8+XW5mlJ286mgwN7RDWJKY
	DQcXEaaydAkzJH+8hu8xqHXsF7qPUNvyF4XwfGqjzrprgg3iH1aGSH4HzG/m6UZ4c5OaVYLBMxQ
	uaKu/Trqpvso5c0Pwy2PG
X-Google-Smtp-Source: AGHT+IHafQhQzPRhJ3j9d6qdD5hPqdbdu9Gdsdh0mrYjgCf+ykHfOaUnI39p3vGID7jjfHRJysZXkA==
X-Received: by 2002:a17:902:d48f:b0:223:2630:6b86 with SMTP id d9443c01a7336-2366eef035dmr5556855ad.7.1750111826636;
        Mon, 16 Jun 2025 15:10:26 -0700 (PDT)
Received: from google.com (232.98.126.34.bc.googleusercontent.com. [34.126.98.232])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365de78e8asm66412495ad.132.2025.06.16.15.10.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 15:10:26 -0700 (PDT)
Date: Mon, 16 Jun 2025 22:10:17 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: jgg@nvidia.com, kevin.tian@intel.com, will@kernel.org,
	robin.murphy@arm.com, joro@8bytes.org, yi.l.liu@intel.com,
	peterz@infradead.org, jsnitsel@redhat.com,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, patches@lists.linux.dev,
	baolu.lu@linux.intel.com
Subject: Re: [PATCH v2 06/14] iommu: Introduce get_viommu_size and
 viommu_init ops
Message-ID: <aFCWSZpFuhAweGdb@google.com>
References: <cover.1749882255.git.nicolinc@nvidia.com>
 <3ab52c5b622dad476c43b1b1f1636c8b902f1692.1749882255.git.nicolinc@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3ab52c5b622dad476c43b1b1f1636c8b902f1692.1749882255.git.nicolinc@nvidia.com>

On Fri, Jun 13, 2025 at 11:35:18PM -0700, Nicolin Chen wrote:
> So far, a vIOMMU object has been allocated by IOMMU driver and initialized
> with the driver-level structure, before it returns to the iommufd core for
> core-level structure initialization. It has been requiring iommufd core to
> expose some core structure/helpers in its driver.c file, which result in a
> size increase of this driver module.
> 
> Meanwhile, IOMMU drivers are now requiring more vIOMMU-base structures for
> some advanced feature, such as the existing vDEVICE and a future HW_QUEUE.
> Initializing a core-structure later than driver-structure gives for-driver
> helpers some trouble, when they are used by IOMMU driver assuming that the
> new structure (including core) are fully initialized, for example:
> 
> core:	viommu = ops->viommu_alloc();
> driver:	// my_viommu is successfully allocated
> driver:	my_viommu = iommufd_viommu_alloc(...);
> driver:	// This may crash if it reads viommu->ictx
> driver:	new = iommufd_new_viommu_helper(my_viommu->core ...);
> core:	viommu->ictx = ucmd->ictx;
> core:	...
> 
> To ease such a condition, allow the IOMMU driver to report the size of its
> vIOMMU structure, let the core allocate a vIOMMU object and initialize the
> core-level structure first, and then hand it over the driver to initialize
> its driver-level structure.
> 
> Thus, this requires two new iommu ops, get_viommu_size and viommu_init, so
> iommufd core can communicate with drivers to replace the viommu_alloc op:
> 
> core:	viommu = ops->get_viommu_size();
> driver:	return VIOMMU_STRUCT_SIZE();
> core:	viommu->ictx = ucmd->ictx; // and others
> core:	rc = ops->viommu_init();
> driver:	// This is safe now as viommu->ictx is inited
> driver:	new = iommufd_new_viommu_helper(my_viommu->core ...);
> core:	...
> 
> This also adds a VIOMMU_STRUCT_SIZE macro, for drivers to use, which would
> statically sanitize the driver structure.
> 
> Suggested-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  include/linux/iommu.h   | 15 +++++++++++++++
>  include/linux/iommufd.h |  6 ++++++
>  2 files changed, 21 insertions(+)
> 

Reviewed-by: Pranjal Shrivastava <praan@google.com>


