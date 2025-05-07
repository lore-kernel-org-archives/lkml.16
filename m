Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD890283C9E
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 15:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746633441; cv=none; b=Z3qi+T2bHVvk6BPyLp3ljBEXgAcLHg0cfpmhKgAWA0MV4QFn3R+3TZm8jyT4csTKCLNO1u4gtGI+bTPaUKff9cafDQ2ei15G27vHaFQJKTAug+TTCR9XFZ6+OdLxWhoU4OwQwI8JXVmC7dZCsWN2oKACzAvpUU0XKM5/Pj1E6aA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746633441; c=relaxed/simple;
	bh=9eQK4QAEow732KG9bEcHB4AIdULBpH4BjFf16UDvexI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oLK4wdSLCtd8IczWMKzMhvYNx8u8c5C/0IcaSdw5yttlWNJcbJxiJyZk2u7fqJKZDJzmysswtEy0dv0UvdMwmIkg/GFNRS7/rAJ8/wacLdVuaZHlqzA2JEzGbOGEwR4ZgDf0+jx1N8/1Ree5Iq+PTcMKE7BI7KAYFo65Gz1RElc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=pMMiuLN9; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="pMMiuLN9"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6f545ae3c59so748016d6.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 08:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1746633438; x=1747238238; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oMpiX2oAeFJGOcPhonwGxFO2XwnOZnyIjVcioz4mPT0=;
        b=pMMiuLN9H8GWT9vgzKYdR2gLTVWIFxsAPrza74Z+IKJxwhCwbVzAEhxno6En0vVE+U
         fSWIn89yoWGU4CEhBbhWoEnUmIIOPshVAJNRmO2e34u+ogdwu5VPk3bYZTLcCktKGeiC
         nAF/kf9byW9C0LA/nlQipWOIunYDWmHpcgi+pAcCyRM+swVAB8RUz8fEi9nkvbDCDHIZ
         OU4O3KAixHSM0SSsQoY125K3M+RHqS+E/BPeS8R30Ll7XP68Om1jesuZU5ElAI/dRlCg
         S0oFb/vn0K7RJddNEHQmi1YXPBTTjVWn9etvytPLAcUy9D6At6A2v7VLxcXyn0l4tRS+
         I2Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746633438; x=1747238238;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oMpiX2oAeFJGOcPhonwGxFO2XwnOZnyIjVcioz4mPT0=;
        b=Z4emAc5SeY/PXGF95aeuGAYYZjLNsaU2XFhnE5eWWrva5imlTUVW4vCUS1YKRka6iK
         ImKiyJWIMWT/68H7tOouAnhqaFQ+ZXlkn8XGaHfZhmZ8JDJEADxkgExRyXVF7VPUGj+S
         9gC6oCid3AAedcUFct+PlVftJCyAz6Fcd5q5eakrVo1juWt1mMVxbCF9o8U6O/OuYqdo
         E0t3w/JQKTmnfgqRSZrcfy7hh6R0Q96OowZ/byRQ+HIPQGRSuxnTRD8lw1o/NAR6lcLc
         DUCOOpAjWkQUGhGktjK+2QMPkNng/8wGu7FJNp1YJ0RZe0VTPsPjnAugZqg4MujITFTm
         8/Nw==
X-Forwarded-Encrypted: i=1; AJvYcCUyfnUyDtf3YJDTZCAqfXdbIIkEuDJ1JOV8b7PCuGGJzTngR1vI3f3ps4OZ2MXfy91AXhcZclqP8X7VAnA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVBqqCi+C+0UfaJNZUecyzkqep8DLN35bqmuPRocncrRRaWoJG
	FUVy94lx4EVUIWWK6hdE216eiJ5iWXBZuXAkUbFfJvujTY0ZFUXfWG0k1txP2o0=
X-Gm-Gg: ASbGncv1chdfoyW8YgKXuF26hMm819EURMl/rqPQv0dhTdL025tLqlDfIPwAigGAVHS
	A8Cq7c5lOUsXEEdkiAEiuLYUIFRzOChsOuP2d9uo5gmoRIuBxBBPzBbkSGBxyq+XRmPgQnJyfIN
	ZP1/XftsbVfMb/iLVCjVYPSWLaZLfkrBw1C9EikLSrKb/4BJ+c6HLmvtaLAzfkoDIG5/vTN1p5C
	+g1wPc0u6vxxnKk8Ep2xLtbpIdmC1aL3Vm5p8S3YRHYGEv5qUHi/gr7LMGuRIxNfAAeE20dCWxt
	EVKawBb2H5flueLiiTTAmGx1CS0WRqjTTJRxTlreuD58XOwdZVcl5/JhEC+RLeftuhUejBzKIXt
	XkCUuG4i4DbyI9bD9oRxlfOmOdVJmCg==
X-Google-Smtp-Source: AGHT+IGY3INDtooQYmwyNQCIEwpt7xooKZ7sy3RzrPyXtK9PFRJuzWNKcBsIXTsgY0x3k40zEUppng==
X-Received: by 2002:a05:6214:e49:b0:6f5:106a:271e with SMTP id 6a1803df08f44-6f542b03fd6mr64088116d6.38.1746633438616;
        Wed, 07 May 2025 08:57:18 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-219-86.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.219.86])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f5427b31a0sm15299126d6.113.2025.05.07.08.57.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 08:57:18 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uCh93-00000001CGI-2d0i;
	Wed, 07 May 2025 12:57:17 -0300
Date: Wed, 7 May 2025 12:57:17 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Rob Clark <robdclark@gmail.com>, iommu@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
	Rob Clark <robdclark@chromium.org>, Will Deacon <will@kernel.org>,
	Joerg Roedel <joro@8bytes.org>, Kevin Tian <kevin.tian@intel.com>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Joao Martins <joao.m.martins@oracle.com>,
	"moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] iommu/io-pgtable-arm: Add quirk to quiet WARN_ON()
Message-ID: <20250507155717.GD33739@ziepe.ca>
References: <20250507142953.269300-1-robdclark@gmail.com>
 <20250507144038.GC33739@ziepe.ca>
 <8965ec0a-97d4-423b-97b9-7848454045d0@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8965ec0a-97d4-423b-97b9-7848454045d0@arm.com>

On Wed, May 07, 2025 at 04:09:47PM +0100, Robin Murphy wrote:
> On 07/05/2025 3:40 pm, Jason Gunthorpe wrote:
> > On Wed, May 07, 2025 at 07:29:51AM -0700, Rob Clark wrote:
> > > From: Rob Clark <robdclark@chromium.org>
> > > 
> > > In situations where mapping/unmapping sequence can be controlled by
> > > userspace, attempting to map over a region that has not yet been
> > > unmapped is an error.  But not something that should spam dmesg.
> > > 
> > > Now that there is a quirk, we can also drop the selftest_running
> > > flag, and use the quirk instead for selftests.
> > > 
> > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > ---
> > > Sending v2 stand-alone, since I'm not quite ready to send a new
> > > iteration of the full VM_BIND series.  And with selftest_running
> > > removed, I think this patch stands on it's own.  (And maybe there
> > > is still time to sneak this in for v6.16, removing an iommu dep
> > > for the VM_BIND series in v6.17?)
> > 
> > You should just remove the warn on completely, no other driver does this.
> 
> What do you mean "no other driver"?

The server drivers.
 
> From a quick look, these IOMMU drivers have some sort of visible warning
> related to the state of an existing PTE during map/unmap:

Many of them are just using this code.

> while these IOMMU drivers do not:
> 
> amd
> intel
> mtk_iommu_v1
> omap-iommu
> riscv
> sprd-iommu
> tegra-smmu
> virtio-iommu

Which I think proves we don't need it and shouldn't have it.

Jason
