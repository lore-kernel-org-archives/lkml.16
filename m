Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95090275845
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 13:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750253731; cv=none; b=Zh/IkWf4aUz8ALLxvglkX/BKEjk8eX4T3aPg9zg9a8UhQrZ53m/WZLmAU8JauVQ4NtuCBHi2ibxwxFaKADzp0nOy6QwEdPd8EPsmS8ky8ZMqfAkpkk71KYJsg2E8l54m89aUyyOp1cw6+nviTr1uMF5ZMZIpTcXhg6kr1guZjJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750253731; c=relaxed/simple;
	bh=YUKuXh5SY0qUucAYNMWolGFEnAIAiKVHC/5zy2Dg11w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iIxeZ3h432kZytQ3LdiGapANTroRQM5exHkXzbpPrQlCAfTs9754zrVe6yJBJr7F/R/jpuxQOWus5t98pdWC4lbqax9Fn25Ai0Nsbi9osSDHhcb0pfBxCk0QmUT8vl9KdM6GPMrxG4rnrofb3rdpr+Drya8Gpig+kC86rBHiPko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=m4e4qo4/; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="m4e4qo4/"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-4a5ae2fdf4eso8065201cf.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 06:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1750253728; x=1750858528; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AY4ZJ1vscFIy0R+M6pav3Ha/u/JxcxhCRr8djwh7chI=;
        b=m4e4qo4/R/lnCfzq6vL7xRcgeMhf0Hk81hNNkhICIXJOe0IHCpH3J90tdrZv4y7rM/
         /ReS6ar91nNlx4NFcmXf55PNruu80en4vIGvihDUj4jDYFIvGB7kMtD+qZ3ha35S8tnw
         ZEovC7WA4rW2ib2zHB/L2tKsu0SLdXdYjAckBAsEPQUd2yYdy9CZqUCbde87uBeoKe6c
         mvus1Cib7enzFnd3GBYRq+ELga+ZdJF5n0Y3dFzU2/SYJCbYo9QNkVwpY+cks6I1Q5RB
         oLofcEjUqjDem4uigf9pUO9TIQvoXIK1nB/H4hMvBHoyXRVTI9xdpj0hl76/2iT+Wgxs
         b9Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750253728; x=1750858528;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AY4ZJ1vscFIy0R+M6pav3Ha/u/JxcxhCRr8djwh7chI=;
        b=DZSmeqXrzF1iysOQ11rM5J0Nvu48gtlYsa2kzwtZGTrniOEhvn3cPKFyz2BCJ2b70t
         4EpNNv2mUZpPmX5vGiati2WhDWlllPYPQGW15tN43OjuHb5ZJIb/vu+du9ZpdkfDiDo2
         QOqE4ZCG3wRvY5W6PDWI92Py5toOqpT4lHvN2OfBu4CWXhVcwmTkng2zRAInERGvSdc0
         UuCdt3RhIS/KeNNWqw9l+wnqxOS6Ru6CY+Ug/kuaamyvavFpHi5WFjngr+L090hsU7TI
         WXUdWcA64jb9nPaKhjgyuZLtqVidCm/OqTp62+4Dt1Gukirb0yJP4f5DRbfwhz7Er7S6
         i4nA==
X-Forwarded-Encrypted: i=1; AJvYcCUoIGa6J94yeJI8/k+4QwYPiUZZJGL7aLo12VGfAQzSIFjWhZeFyq7MdxMd7dv4JHaf2b7Xs1npCYUK+3I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzh+0IHflwRdCnrTcG/o/GO2lXtW6e0CRp2EPBC3O6ADwiUIp9q
	PfOR1l9SXiMpwtjzPJ3/q6mNVyfffUUG/x9JwhrBhHqg5iZoZdaXnEv5hgN/xBLduNU=
X-Gm-Gg: ASbGncveuiCf2vUg8Bc+QmRUY+hH0GjzF9sRWufoRLaAoXXNmE+zaZM6i1NTvE0QSK5
	4ctk6WlEoo3r4O4mG8nxICHVd7UWyuKyvBs5IBPs4kFPXmmmoLsSBEUKfMn8BEiGeTa8LpGKf7r
	fzNGzHIe6h52wxE8Ba6OFTY8QWeU+MDKfqQEo9jh1g/ftQTgv2rKywenVpw9Vtk0bl1tJmhygO3
	2z458juNyglRZfpz0EOdtDMCNhUu5rS3zqB+r59R0BD1w7JmWQe3xQMNmxzoKEx1VWimbD1GZHG
	nozZyDRQMCan1O1hbboPCABOMLHyRVGDFynjxQXaPGErivw42RHWdDJKw4Z8caDcGdo0syv2Ow0
	nLtnKaQaUM4aORxlJVEeefja20D/VHpBLn/XaLQ==
X-Google-Smtp-Source: AGHT+IGsYeo5oR58E16Y4uy0NYoRLYKcsVBhnBsH7gIPeELC0/haeVFoG0lLfoy8ZSud0bNejYLL9A==
X-Received: by 2002:ac8:5dc7:0:b0:4a6:f00f:6618 with SMTP id d75a77b69052e-4a764347083mr38170631cf.10.1750253728385;
        Wed, 18 Jun 2025 06:35:28 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-56-70.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.56.70])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a72a52a1ddsm72059761cf.81.2025.06.18.06.35.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 06:35:27 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uRswp-00000006n7F-1PfS;
	Wed, 18 Jun 2025 10:35:27 -0300
Date: Wed, 18 Jun 2025 10:35:27 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: "Tian, Kevin" <kevin.tian@intel.com>,
	"iommu@lists.linux.dev" <iommu@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>
Subject: Re: [RFC PATCH] iommufd: Destroy vdevice on device unbind
Message-ID: <20250618133527.GQ1376515@ziepe.ca>
References: <BN9PR11MB527606182417BB7A35349F598C74A@BN9PR11MB5276.namprd11.prod.outlook.com>
 <20250612172645.GA1011960@ziepe.ca>
 <BN9PR11MB5276B467ADCC57BC6571CA458C77A@BN9PR11MB5276.namprd11.prod.outlook.com>
 <20250613124202.GD1130869@ziepe.ca>
 <yq5abjqotim7.fsf@kernel.org>
 <BN9PR11MB527633CA2F698E83E12BFBD68C70A@BN9PR11MB5276.namprd11.prod.outlook.com>
 <20250616164941.GA1373692@ziepe.ca>
 <yq5azfe6ssev.fsf@kernel.org>
 <20250617183452.GG1376515@ziepe.ca>
 <yq5awm99sjmr.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <yq5awm99sjmr.fsf@kernel.org>

On Wed, Jun 18, 2025 at 10:59:00AM +0530, Aneesh Kumar K.V wrote:
> Jason Gunthorpe <jgg@ziepe.ca> writes:
> 
> > On Tue, Jun 17, 2025 at 01:37:04PM +0530, Aneesh Kumar K.V wrote:
> >  
> >> How do we reclaim that object id for further reuse? 
> >
> > Maybe just don't? Userspace did something it shouldn't, it now leaked
> > 8 bytes of kernel memory until the FD is closed.
> >
> 
> Between the two sequences below, Sequence 1 is the correct one, since we
> want the object ID to be released after calling ioctl(DESTROY,
> vdevice_id), right?
> 
> Sequence 1 (Correct):
> 
> close(vfio_cdev)          → triggers vdevice destruction  
> ioctl(DESTROY, vdevice_id) → reclaims vdevice object ID  
> close(iommufd)  

This is wrong, the vdevice has outlived the idevice

> Sequence 2:
> 
> ioctl(DESTROY, vdevice_id) → returns EBUSY

It should not return EBUSY, it should destry the vdevice.

The full sequence I would expect a sane userspace to do is:

open(vfio_cdev)
ioctl(vfio_cdev, VFIO_DEVICE_BIND_IOMMUFD, iommufd)
ioctl(iommufd, IOMMUFD_CMD_VIOMMU_ALLOC)
ioctl(iommufd, IOMMUFD_CMD_VDEVICE_ALLOC)
ioctl(iommufd, IOMMUFD_CMD_VDEVICE_DEALLOC)
ioctl(iommufd, IOMMUFD_CMD_VIOMMU_DEALLOC)
close(vfio_cdev);

> > You can keep the enum for flags, but 'force' isn't the right name. I
> > would think it is 'tombstone'
> 
> These values represent bit flags (e.g., 1, 2, 4, ...), meaning they are
> not mutually exclusive and can be combined using bitwise operations. As
> such, using an enum—which is typically intended for mutually exclusive
> values—is not appropriate in this case?

Meh. It is common to use enum for holding flags too. iommufd does it in many
places. There are good reasons to prefer to use enum vs #define.

Jason
