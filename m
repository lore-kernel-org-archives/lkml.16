Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E07D13DBB1
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 13:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743167399; cv=none; b=tEYmhn16tZVS4m6ib/IsKxnqzZo48Ni7o3TCCjIgpQSAOBKDO3p8n+dGx3T086XnYiEd0DTBFSD6jy47qpq6kCTV6oU8m0P7UoC2Hg5nrc0Fx65TZ7okryXxxEibnL9LGZ2PwTmY6QqTIPR5HDy8d+8ZXqqarT2pjVwkgRZ8AJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743167399; c=relaxed/simple;
	bh=nsTbKkWCqPsRPDxW3L9BiP9mUlaPvv6pz4JS3WdUmiU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sxphCdgHCzkxIGfuZRcFN1puPJe6ZhlQItwgDBEclt92YK1SIqLxo0DrOGtWTpfw+d1Ul6LljNiOkmYUNH8Yizd26BFYRWk/FmFJQ1po47i18uMsnCdwE1/SmEByluKaQfe4YHKrCCyAB97y3isuaaKJFyiqqlLOIGk/wi+2S9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=IxxbTDhB; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="IxxbTDhB"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6e8efefec89so17327906d6.3
        for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 06:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1743167395; x=1743772195; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GrbE8iOj+o8uLnkO2AV/Y6hVNF8UOVIwZLvvFnjPOyM=;
        b=IxxbTDhBl/JZTWnlZSJY4+sLUV+RIYtQE3cH9UOnGzQICwpB+gKSnuauTlYqq5+/47
         AoWsyMxiaxl+BDMJPgACorgeLu4LbN4NGSmB6RqvkiCoJm2kJwFnn9ZDNYLMh9W3ED3J
         x68PgVjll0inblfjkuHgKD+5vUQIMRZ/cKJhUkf3RZE3nYYZ4yS4VWkPT3SSVtHA7ZPp
         7y1ApYYCOS4z0Ggn0cAlu07waCyT8Bd+sjzr0LiwGxtZEweuBJqrKj9ZEVgs/Ha26Qv1
         6JIQZunyDTyK/4HYWmeK7gGCthpbC7eTQuGR8n6iCgnZ3YYYMapmLdNqIerfW/pkk4nx
         DXiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743167395; x=1743772195;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GrbE8iOj+o8uLnkO2AV/Y6hVNF8UOVIwZLvvFnjPOyM=;
        b=K1P7pDzLNhqA52Kr9pnUj+oep6porogixvsHiw7QZdmdeMvUOLsbQk0NswFxXnNQqO
         tl2rIhZoPUxNWOvtmmbz1J9uqJifUf5McY+eVjnt73ExADAgyxvh3ekMMOvhLoit51I3
         JASnRBKBVxKAXWcw/0jtvGl/y7sEkF/woNOUzl5mCFhqMiKpNThDRrpMJ25uVZkXeeik
         lNqly1IBwCCOUo7va1DAKcBN5p1OuR7+VI7NJ1TPahxAEgFoLmHBlCJOFIBicnnBmI8b
         XO8FjyW0DF+odKepJpE0bcPFMysyVfPkLxgXDrvT2eImBoDSOGCqOe1xn8Zd9dFtGWxl
         isdw==
X-Gm-Message-State: AOJu0YyW3pxuV0YlsPUblxGXkpW0TLOk7embbaT3qTe7iHYwOxQR3PDk
	WWPSyVH7JwbG3POR0cVFn+XRyiXJexpTa8R0+H5yqbuVsD+RXZfttjSsPyT6ymY=
X-Gm-Gg: ASbGncvDgqcrm7djQEqG4v6Qi35gTAkT4Uvg0TkyS8GgYy4iVzwz0Q5SAt2I34sWM1n
	laaAoXIPVrXfVQHbgTjsyJj5hYvFLvIGSD+sIT5p4OZ8yHAvgWjtDHlP22oYRT/Tfg1WUN/maGD
	bxi2yGTZ6/FUygsXOV7wCVdUf9TkG75krCMdWbt4TfEvuNmSmurLO0nA0IJYpOUldqT/52D/n/L
	BVCfOfOI61e26xEki5dXz+PJYznCEd5JJIj0ncem9FvY90kPsQZt7HO5OViRBM8jyDYkbghRl22
	U4wqgZWxvGZPXFit6YIEdaUi28XpBaG28aPadGKaHsT8PdMwPvcW50OHJnRYEuCJ7rJlAD0dJzl
	VQJbzFVNOgUlQZg4YM6pbgV0=
X-Google-Smtp-Source: AGHT+IHidI8Os+Ek5ST85eRSABKJEnwVGlnRgxl/M61KkTTVspVJqP5FKyEOIMZ6GGbE0+O2r3M/8Q==
X-Received: by 2002:a05:6214:19c6:b0:6e8:fa72:be49 with SMTP id 6a1803df08f44-6ed238a5684mr100935736d6.12.1743167394762;
        Fri, 28 Mar 2025 06:09:54 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-219-86.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.219.86])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c5f7659ae3sm116989685a.5.2025.03.28.06.09.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 06:09:54 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1ty9T7-000000005Qn-1rpo;
	Fri, 28 Mar 2025 10:09:53 -0300
Date: Fri, 28 Mar 2025 10:09:53 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux IOMMU <iommu@lists.linux.dev>,
	Kevin Tian <kevin.tian@intel.com>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH] iommufd: Fix iommu_vevent_header tables markup
Message-ID: <20250328130953.GA20836@ziepe.ca>
References: <20250328114654.55840-1-bagasdotme@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250328114654.55840-1-bagasdotme@gmail.com>

On Fri, Mar 28, 2025 at 06:46:54PM +0700, Bagas Sanjaya wrote:
> Stephen Rothwell reports htmldocs warnings on iommu_vevent_header
> tables:
> 
> Documentation/userspace-api/iommufd:323: ./include/uapi/linux/iommufd.h:1048: CRITICAL: Unexpected section title or transition.
> 
> ------------------------------------------------------------------------- [docutils]
> WARNING: kernel-doc './scripts/kernel-doc -rst -enable-lineno -sphinx-version 8.1.3 ./include/uapi/linux/iommufd.h' processing failed with: Documentation/userspace-api/iommufd:323: ./include/uapi/linux/iommufd.h:1048: (SEVERE/4) Unexpected section title or transition.
> 
> -------------------------------------------------------------------------
> 
> These are because Sphinx confuses the tables for section headings. Fix
> the table markup to squash away above warnings.
> 
> Fixes: e36ba5ab808e ("iommufd: Add IOMMUFD_OBJ_VEVENTQ and IOMMUFD_CMD_VEVENTQ_ALLOC")
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Closes: https://lore.kernel.org/linux-next/20250318213359.5dc56fd1@canb.auug.org.au/
> Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
> ---
>  include/uapi/linux/iommufd.h | 25 ++++++++++++++++---------
>  1 file changed, 16 insertions(+), 9 deletions(-)

Applied, thanks

Jason
