Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52F5D4B1E69
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 14:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746628844; cv=none; b=aqtpSnXoWt+eGp7Lueo1+uKWqqrA0QX4BtGOqlQkFyE58aifFUxuAZwvZsr9Sh0XMR6aFDo81bzVSoUR2dZPDJF7kliVSwtY+SobPxEULE2MQ5WcTLmfhOhW5mrL9LE8Pr+NaiNUkGwfddjfxovZGWQW/UL1ovfBLiCrhHKZi8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746628844; c=relaxed/simple;
	bh=cUb158x33akkosvBbXGRgoNYLmW5StrRgcPT7blbiXM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LuyQZ8D0IApUGAXUiv3cH5M0xv3UbgN0ygBUn84MDB4Aycocp3EQBybFNmxe3r0ELhqe1nShKZRvOy4E6hLNjVrvEoNCcpGFSh7JS5Jx4diKs4W+eQ19CTQ8IpQrW3Rvo9MPOOIBKh3xu+ZP4JrFIVQfLDO3YX1HaP6RfSimtm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=SxbO0evW; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="SxbO0evW"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7c922734cc2so125726485a.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 07:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1746628840; x=1747233640; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hE5pqIIiTRP3xPbQUA3RBdQkSkJonXNdeQ/5U/JPsWw=;
        b=SxbO0evW5Z0FwMJ9ZNJxYXb89n//48gvBEGuxfB54XEALJ7sVAH77gUs6I/QJrU2O3
         QB+TQ4TvTWxDPH7807sdv9yCzFTFbNRTjll5bb/rp/fRkIQbq5sP7/H2ycLRGSdCN0DV
         kwWwBYs2VdVQQRm2bws7YS8aiJl6MRYbSZtJFZPkE7Hb1fKfULXQWcnsbCDESfTwv8bq
         bBfBWbmNyq4hcJpeE1vm9XrAdUguO4fcv2s77Wz4Mz9y7VfhSLdXEoBC3/iN3reyYvMX
         gPxkrX9fKw0riCgckECCQkGfku+UbF4mVw2/sxYIAn2L5Q/02zBXE5vYtdFq7tM0wU0N
         lDCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746628840; x=1747233640;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hE5pqIIiTRP3xPbQUA3RBdQkSkJonXNdeQ/5U/JPsWw=;
        b=ZatOu8j/MrTqgVVqSzpzIkS36qG4e7DEunH4h36TWSV96Gm+Glp+qgb844vz/xb1Ys
         GBn4A4BDG06iKptEUlZCZ60JLYQDOUUbgGhJ+k4j5tqRUX5uLAngkY5Wf+IEttPnVBBy
         Ft9PyQQxA0a19gIdmZfOiLoSf4H+VD4f5z/Iua+ZHsIWq6minvAxYWzAAu2yjygZUOwX
         wahqVSfI20s0h0Plx2aSDIESoVgBZ6+UO1h9ijRExLikKTAueYa0WqCC9fKsuaPJ4mWx
         X06GY1uvkFM5SBOTVF1JvzZP6rSxXLZq10Qszt6WL2rVtURgvCAtwsMoByCb3xMsmtEt
         MWNQ==
X-Forwarded-Encrypted: i=1; AJvYcCVJBh81UCb2vvrQb97GDF9JdmCZMsRon8XtX+XNSpGMXmucGDKSIWw3uZ6TvsSKeIjejPw1yoW4RlrPZRM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzeAncY0s04+lbfqGmcOV1GxFYxTYb89ZrlBvp9gXSf3aVLTjmg
	We2/6sxnn5gpI17oibluxeZeD2doaTaIE19t5t05oXQ4hoC/5Ib7BFCsdb87JmE=
X-Gm-Gg: ASbGnctcheBdD7C0+RlpA6WKeQI71nJacuv8D6ucDwo9qy87KP7W9y6UF2YLuT5dfZv
	QmGoEFZM2kS04g4wij5NsC4P8pGg0SDyj6TxjMKV3IK9kaoZXuXsHSlXx8Js23eMBKRkwLRSUK4
	+502WvfmbnXuzpUbyW0phH1NL22GVFfWdd7mz1hA2g5zHuTWbAYzfjaTws29/dBan8mEfL/swSk
	ck3XYLs/nJ+AoK3kIYD5t9E/iH1j2C58h83HXiqcVXRGau+BI7PErHNe9+/oKSiFOuTAjbbJ9g0
	P0fJ6bE1YJCX+k0Qo6/T9amAwhIbpeiBhkg1zmSFrBxGpuPThTITJT0mKHpqUzOkmumUsi5RQgI
	ehq9igj8OkawLLPobFWiUdxmd31eEBw==
X-Google-Smtp-Source: AGHT+IFBJ2lDgmMwPn9NZnZ8/xbfRhIS1u/h+c1wZoIdheyW8lXaMbj8dqq9Df2szLQOMYCQifNTEg==
X-Received: by 2002:a05:620a:370d:b0:7c7:c1f8:34eb with SMTP id af79cd13be357-7caf6d53f0cmr559703785a.23.1746628839912;
        Wed, 07 May 2025 07:40:39 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-219-86.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.219.86])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7caf752a60fsm159257985a.42.2025.05.07.07.40.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 07:40:39 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uCfws-000000011tV-36y7;
	Wed, 07 May 2025 11:40:38 -0300
Date: Wed, 7 May 2025 11:40:38 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Rob Clark <robdclark@gmail.com>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>, Kevin Tian <kevin.tian@intel.com>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Joao Martins <joao.m.martins@oracle.com>,
	"moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] iommu/io-pgtable-arm: Add quirk to quiet WARN_ON()
Message-ID: <20250507144038.GC33739@ziepe.ca>
References: <20250507142953.269300-1-robdclark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250507142953.269300-1-robdclark@gmail.com>

On Wed, May 07, 2025 at 07:29:51AM -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> In situations where mapping/unmapping sequence can be controlled by
> userspace, attempting to map over a region that has not yet been
> unmapped is an error.  But not something that should spam dmesg.
> 
> Now that there is a quirk, we can also drop the selftest_running
> flag, and use the quirk instead for selftests.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
> Sending v2 stand-alone, since I'm not quite ready to send a new
> iteration of the full VM_BIND series.  And with selftest_running
> removed, I think this patch stands on it's own.  (And maybe there
> is still time to sneak this in for v6.16, removing an iommu dep
> for the VM_BIND series in v6.17?)

You should just remove the warn on completely, no other driver does this.

Jason
