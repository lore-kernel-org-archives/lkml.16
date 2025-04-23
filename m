Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28A8D27990F
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 16:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745426825; cv=none; b=dGZ7Ig4QKgd+eUSgRbk11KQG4ljp2fwNf9rcNjLBgOhxrGxNISzm3e8f/TjV5x6Ar0q2sH0fWEtkiOaHxVbqfU0EaYF62Z7nayWE8+G4XjDe9JrwloF/mfJhrzJGT1uI+UF4ow1VW4ujZPa/LBNyEy4wBem7+mhLxHuypIIDk/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745426825; c=relaxed/simple;
	bh=m4WVOwAjcjgnM8goDGj/NfyDxwbR3w9B3VjTYwZ8Bzk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A8vRUmCMMO0nYIU29PiTsPh/3MG0+M9vhifhs6Wb4MeMNNCYExDyNqA57Z9PMurSppsEN5rzrVqMgRskCPgoHNoXwiFDvVV6FExeSgb3UjhSOQetJ5t0X1LKZoxkaYIs2gCDbnL0qAaJSTt6S6xwodvR0+up737KgL9pozw/MFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=aG3/JcJe; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="aG3/JcJe"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7c55500d08cso5109785a.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 09:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1745426822; x=1746031622; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6+8rggCr0z1qPiuM8lIjq53Nx8yYtHzEKWUk97MIIIU=;
        b=aG3/JcJehGtN5aPn4nqpjh6+S2p4m/HqYdWqtjI5VLMeTk0Tr7Z3qYGrBKAt3PfxQS
         goY81zdEoda9BMpYW92G7O8OJ8kd2RM9SCRrZP9cGm6N3wqqIse9lboVBtWExHJzl+cV
         ohOA5YXjcaxnzJJ0Nfjjcxpa6hla15OS21/j/TRhDTYhnbaXOvUdjpQnbzWCYPvvjB2p
         I8Txqw8cyc/xHS7/9KhiKJScOWQKRiHamiJLsTEtxU4WIs5+yO+Zb4kZoseVd7s34vtx
         2+YnIcVTTmpWd/g1tNKp+gGIpWMMOOGk/qvHFATj1d9hH8Wdtc9RtNYOYfwCb8oTY+6K
         2fuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745426822; x=1746031622;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6+8rggCr0z1qPiuM8lIjq53Nx8yYtHzEKWUk97MIIIU=;
        b=fxTzppgllOiwGZA3t2Ep95Wrd5rLbY5O/lZ6h3mKPII+r8e7+ByO5Q4k0KcC52D11/
         5HBzHP827aWyJLXQxXU9jPHdn8f49XQL586DAJ/yLNa2s+rBtTxEJ756pcAvkUQMK6tT
         aJ8ds7+nSEih3RfiwIQssw57k26IBqbPuYIRUm0a4Jp3VKIiO3YqV0JiIzhHpCSb2NML
         7vWy8rUQ49q9zryZuFUiM5MLDXWZ9XP5Z5c3NRga2/xwWzNtOd/KNU28TzeCYjjBRck7
         oBHYscwXLab+7ez1pNcYBHyRfckatVbeawWBRo7sChzxSb8viGYosPfTguNL4c7kRQtk
         kWsg==
X-Forwarded-Encrypted: i=1; AJvYcCWT3sTMWd0VX5pH7MxMVPXnIevPWxhTmle+EKOEynUZDShu240QBlpIHnl0ZpsgA2Ot27y0KQGz+Fuq8ak=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0X/080ED8kBj53faTKZN6gMYKMTubcp2wnjYUyP1mfRyfnM4B
	+ICM7HRyhGul9LNeljtP+p1ulZXGy9ocn6V/p+ktk/k1qdUNOi5p5xkpHeZ+SU0=
X-Gm-Gg: ASbGncv4SntN75+8o4B5xucN6CPYHqQH9KnRm089l5RVcOyWbYaGJL4oEStiGoOYEhq
	JTJRNlFeJmVclGYcffs7Q3YuoSTHbN07vpU/605TpGIY8fHPh/omKEg8lvk1U+/ZFbedFl/dZr5
	Bx/85v6t/5WFlhhy5WBd1aRAUJoU9rIFFA3SQ95PVb5Mi3MXvBK6zwQ70o5zC3USccFgKp9+A9t
	8EADnYowNGOMJXeEamX5t/FrS7oWgwlpZ7iisDqI1nwQdgIJZ4SKUIiUgQ6YO49xPRz/1Kzq1bx
	vEqqqkIuAN5ffC9MnNn6mGG0qgjJ8bKwUjew8OJofsQ+5vXUvDtZejdZMFbc2Pr2+PNOeuBN0Hk
	A8TiuCGl+A+hqReRxqXk=
X-Google-Smtp-Source: AGHT+IHLwFuRAmk7gfG53u60+o1yuFvnpHCWeSmLNb9pe/u1DKOYa+3/GqvlkBEaYk0caxSiBgYSCA==
X-Received: by 2002:a05:620a:8017:b0:7c5:48af:7f99 with SMTP id af79cd13be357-7c955e6b6d6mr45515185a.35.1745426821711;
        Wed, 23 Apr 2025 09:47:01 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-219-86.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.219.86])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c925b4dbe7sm700352585a.87.2025.04.23.09.47.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 09:47:01 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1u7dFU-00000007LB5-344v;
	Wed, 23 Apr 2025 13:47:00 -0300
Date: Wed, 23 Apr 2025 13:47:00 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Magnus Damm <damm+renesas@opensource.se>,
	Arnd Bergmann <arnd@arndb.de>, Robin Murphy <robin.murphy@arm.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	Vasant Hegde <vasant.hegde@amd.com>, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iommu: ipmmu-vmsa: avoid Wformat-security warning
Message-ID: <20250423164700.GF1213339@ziepe.ca>
References: <20250423164006.2661372-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250423164006.2661372-1-arnd@kernel.org>

On Wed, Apr 23, 2025 at 06:40:02PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> iommu_device_sysfs_add() requires a constant format string, otherwise
> a W=1 build produces a warning:
> 
> drivers/iommu/ipmmu-vmsa.c:1093:62: error: format string is not a string literal (potentially insecure) [-Werror,-Wformat-security]
>  1093 |         ret = iommu_device_sysfs_add(&mmu->iommu, &pdev->dev, NULL, dev_name(&pdev->dev));
>       |                                                                     ^~~~~~~~~~~~~~~~~~~~
> drivers/iommu/ipmmu-vmsa.c:1093:62: note: treat the string as an argument to avoid this
>  1093 |         ret = iommu_device_sysfs_add(&mmu->iommu, &pdev->dev, NULL, dev_name(&pdev->dev));
>       |                                                                     ^
>       |                                                                     "%s",
> 
> This was an old bug but I saw it now because the code was changed as part
> of commit d9d3cede4167 ("iommu/ipmmu-vmsa: Register in a sensible order").
> 
> Fixes: 7af9a5fdb9e0 ("iommu/ipmmu-vmsa: Use iommu_device_sysfs_add()/remove()")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/iommu/ipmmu-vmsa.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
