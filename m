Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C0EA19F40A
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 08:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744014790; cv=none; b=sxFq/DqoZwsCPDREYif9Sny/PiPT0cIERwFZOAZT8O6cPVJ/RW25VmMCWf+BI9DTiaXKGG6fUASIP/2AVXiPl6orMdNquNJg95n2dchkNF4eIp+IUN2x8AiHHCk23vVESUUMvRULNdSYFhNXGnqHoq5N7/4VTjiMx4Bwj4UJiWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744014790; c=relaxed/simple;
	bh=0MJ7kNuETLjZlpYnEIkw7jNM8In9lI+eax564Kt2b3o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QPWqIAthurij8+MJVv63XOMKDWdRwwF0Lc3PpyrKp7K8w7I1BUd9wATFsXtRbL+W5+P9tE3GyLc1cK3Enkx+CqTc24Nt0nm0Hi01PfLk6I3KNTkgwh5/hjna26tdYli0xX+yDtRB8DGQp9F44jOGeRId22bC3gAXX3Oq+3+P1ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Mt+vLAzd; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Mt+vLAzd"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2264c9d0295so324255ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 01:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744014788; x=1744619588; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jcXjjA+jirbGtlXlcOVxvxixEqyX9/ZtaNYQ+3n7vks=;
        b=Mt+vLAzdLAVjPBPep3lija0ZbWpVydjPxs/u/UQEa29Uz/dfb51UKWLQIbToTiK17j
         2V8hfwJ2m8c8+fsCT34NqdeWlXNXfXVKxdEtdX/oFhWfNZ+I4aVWLR/XickqxemgxW6i
         3alP5R8ToTaiR8PtXUbYkApOPHKI4iCSwTW+XiogMwNQEEudckiiy22T/fPdKKMJEdcZ
         fyLGwa4zDW71X9ihBAcuIxneto8IEnzGXJ7arhzF3WUoJWtooBXh26D+BfwT9Y73ZNa9
         yJMjr4TArAS2IABFZN6vwOxfFFXU8EUqJ0kikvhsDX9dR+yX8fUyr9aW7vArKHRvu9cq
         MaKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744014788; x=1744619588;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jcXjjA+jirbGtlXlcOVxvxixEqyX9/ZtaNYQ+3n7vks=;
        b=Hf06+Rs//OpnZaEkIkVL9EZJuDpC0Lny2Dd4P8p9WV1FNhr9dcnU6lqvCxbsFl+1jr
         wvBXlYrjgEAzM1zTYW1GFKqSK5DPFP9Efalcu0ImLRi/RLxaGdCj0M+/NAQc4fqVEFY1
         1vGFgwKxn6feVsCfCNPzzEs+qQvfl1tqfg4l/TYlvU0BcJfBqjpHSAvCh4yWwb0gt3PG
         8h5qYLxZHn1oCqPI5GYOH2oqCOFrMy2Lz3x91k1nvX9FMgrTEa6FxsJP9E5+V4NHFjvl
         fT7SViHe5g87bs8vq6LpOqyOu1h5h7G2lzOCqgvV+jQCaaPMQ/DNSlk0/DqYrAQz6IA5
         THDw==
X-Forwarded-Encrypted: i=1; AJvYcCX+zW11P6ePZBLkx4zQDv6pxrT7ndcncXxmCWpthWIXsmQuqB5RTX2ykPVG6nHOhcyF1He5GCEkSa7Q8F0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDarLh4sXdIJXi25J8Ig2Qy2epP1lVK6sNExcSSUcKOk6CNvDZ
	0U1RtqBwvPI4AXIsPG/jk8i1hI2wWKlACf9mwS9VyAcFCMYq0rsr+huytYEtOg==
X-Gm-Gg: ASbGnctrrdmUEYqOe3SZl1eYnUJjFS+rulh7zDZc8cjMhssXF5XeQd+chmMuX+523LZ
	1AQv31CR24re8Cp2IU+UUgxY8PEgjyOsOZf7fCjz6GWWRiJuPemLVjsuLrDn1lMfHULSRNzhpsH
	MPvibIhwcXd5A6RIvf39N87VuljM9rVETW7bXc/5NBhNH9v8hu6u+UOatz6UCuApiO851ZqLxpZ
	pEvvkjaDN18p36t/XOVzRTLK0Usi12vj44jZ2QZpMrhaRyb3F1O79LKdJufrUwgl74MX7FN+DU0
	MdjiblOukoHgDCUFVHUjWq5Uch14FmJapjCiCVGvOrNA8rOAPlmpj4FGgxRbSiMwfijIYKwDsH2
	9Pr1LGzKZKburjg==
X-Google-Smtp-Source: AGHT+IGgoaBTlg9BjbIvqCWdACY/aXtozoW3tXEbZzO1wBZolldhDpZWuJ7yv4qhtjzddz/sud5TLQ==
X-Received: by 2002:a17:903:c4a:b0:215:aca2:dc04 with SMTP id d9443c01a7336-22a95eb8d41mr3228575ad.26.1744014788291;
        Mon, 07 Apr 2025 01:33:08 -0700 (PDT)
Received: from google.com (188.152.87.34.bc.googleusercontent.com. [34.87.152.188])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-229785c385csm75476405ad.81.2025.04.07.01.33.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 01:33:07 -0700 (PDT)
Date: Mon, 7 Apr 2025 08:32:59 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: will@kernel.org, robin.murphy@arm.com, jgg@nvidia.com, joro@8bytes.org,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, shameerali.kolothum.thodi@huawei.com
Subject: Re: [PATCH v1 1/4] iommu/arm-smmu-v3: Pass in vmid to
 arm_smmu_make_s2_domain_ste()
Message-ID: <Z_ONu4pIDyiWr2DK@google.com>
References: <cover.1741150594.git.nicolinc@nvidia.com>
 <214b10db02f1046efdc70e2c4803111357f60070.1741150594.git.nicolinc@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <214b10db02f1046efdc70e2c4803111357f60070.1741150594.git.nicolinc@nvidia.com>

On Tue, Mar 04, 2025 at 09:04:00PM -0800, Nicolin Chen wrote:
> An stage-2 STE requires a vmid that has been so far allocated per domain,
> so arm_smmu_make_s2_domain_ste() has been extracting the vmid from the S2
> domain.
> 
> To share an S2 parent domain across vSMMUs in the same VM, a vmid will be
> no longer allocated for nor stored in the S2 domain, but per vSMMU, which
> means the arm_smmu_make_s2_domain_ste() can get a vmid either from an S2
> domain (non nesting parent) or a vSMMU.
> 
> Allow to pass in vmid explicitly to arm_smmu_make_s2_domain_ste(), giving
> its callers a chance to pick the vmid between a domain or a vSMMU.
> 
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>

Reviewed-by: Pranjal Shrivastava <praan@google.com>

> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h         | 2 +-
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c | 6 ++++--
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c    | 3 ++-
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c         | 6 +++---
>  4 files changed, 10 insertions(+), 7 deletions(-)
> 

Thanks
