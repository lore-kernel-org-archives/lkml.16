Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4C10285C9E
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 13:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750079355; cv=none; b=nuMk1DbrkMSyZfxdUa6oLUewjRewn/fYiYkOvJqVo7PNnbwD2L4/2rMQDu03oqOAyy5rUotGuXfMJ+pmEI3frQPLPh+NXYDYhnEReIoQhH93IzOypP0sfBJlw2jBsGcxJgEtljNaksDQw3zIA2HtD2JB4awa1toiF8gzrV02UrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750079355; c=relaxed/simple;
	bh=mbyl5OXkWqYUPxXU7YEwGwzWceS42PNsUXDiLKdjHeM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ONAYLINeL2E7Rzx5ryUiR321Me4tV6r5lWP4y/gelSKXsVXkLdIasttxvBQmwmxutefdC6/thSPuHbO/ld2MXYS3Mcm5J8BUVWcHhex+MmLp8Ih1T+MRwai6ptH4nBtz2GOsULaxL86e8U8ZOc9pyDNSqXEi9wYFxNeS8ijC6tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=adHw9e5z; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="adHw9e5z"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-6ecf99dd567so48045126d6.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 06:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1750079353; x=1750684153; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OlPt6HGrhBZHmQKdGeykmC3k0brj4QqdFhzAJiZkO8k=;
        b=adHw9e5zGGe0tObvkCm206nPr7XYfppmXqyx6ru2fg7iN0VEhmk8x1dMlwd5kOGevR
         LrPiZmJRSrXDzXU7fPCV5zoc+udPjLvhFut19IlNDRssW5toyyhHzJEGCgAv0nMgVbP/
         8LUxCTF1XOJh+Uol1xrJAc1p1MPN7BAu0pxfF7bRhiO7inckBk2wSGbPgCyVchrK7PFX
         FxMunE1GYXc1qaLfudxwAYSMtiNiTvqY5tC0WBFHkAQX/JaKXUXw8WYWfU1ZJFNc+tLp
         uqCtTtXQVnwVOF+PSVN8/uKYXJDIBPAld5TsYcjT/W6MUbYpGyewReBbySD4pGO/V5i3
         zl9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750079353; x=1750684153;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OlPt6HGrhBZHmQKdGeykmC3k0brj4QqdFhzAJiZkO8k=;
        b=rRI0j/3OwoSehOq9DfKpCTomMYYSERIcopNMpl/Z6lEMweV3pVw715BTXqWn2IuyvJ
         TELyWdVdgiVzNc0AIRVDlb5g9eMkcsVfbedD7UIQmTnrigGZyQWbpxxZ2md/qZZf+5KV
         bEITk5SnDU/22BBJ8L1Fnli1occLlb1VopGqg4rOuGqjUyUN8q0yqk2pKbL0XwPLwX4N
         19Lhial2kUr+8LMajX7j2WEGHtvx9VVdVU9PakyLjdd4YsMGjXuSR9NACag09oZddvYN
         ZV2K2X0YupFm4q5ff1WoLblkWYmwoXX3HdN4ms6ezCH6vco2AVv4WsGxps5Sz2gWQmpM
         ko8A==
X-Forwarded-Encrypted: i=1; AJvYcCU4uCM+9JpWgIkkxFesRGkJBYm4G441eGjZaP4S9ENDHCeaUbreXzz3IVYYkKzsz3A2Wsu2vvkWuVt8cUY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+ob06RrlYBYtWVKaeu2Zv2Flo5kaTGJQkVfD2i6bn8TwW7rPJ
	AsdU0T2j/FtTzHxZQ+98kY/QyTR/CRJJ36Fgwp4oAem157MeoAmIO8/wdGK5VQQaGg0=
X-Gm-Gg: ASbGncsd640L7mtDEWeDb/nKlowrt5xLtGsuSJbWBj/luIcResuktW6tStMvXJOw/eI
	O+2Icp7N1kCvzMNvpS24NpZx6AnEbHUOhlT08jzN90UlG6g240ruVG4Yw/XUFxLcnmiMKv0ngLn
	n3Tv/57CL6VGj3ByoqLNl2AzHQBQqwF0lQAvdzSDxu2rVtL4OHzLAfM/WfXL1tN4f9Ci0isiWn6
	lFtEPbSAesL83CGT5aDySiCKOo8ZbREkIa+CgG5pgETYHUl5ILbaB/hPuQREnk81YMg5QZ1ExHp
	C4MJ3JdSMR0a7E3yk27dX7Ul6hm6JEUioFaiF4otGZI0ai2uixv9a07U0odR76cXJ34J0q8T46R
	AINpsNGjc45JbaVAauoJ8jIlGYXnYCMeOFdVc+A==
X-Google-Smtp-Source: AGHT+IFYwnfrlyEOgdj8TrGnzF9X6IlaZQJ38GRIzTE1wgTjrgnCanKObhnDaStP1HkHOZyR/IYWjw==
X-Received: by 2002:ad4:5d6f:0:b0:6fa:d8bb:294c with SMTP id 6a1803df08f44-6fb47726e99mr137566516d6.14.1750079352531;
        Mon, 16 Jun 2025 06:09:12 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-56-70.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.56.70])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fb35b20f67sm50759076d6.16.2025.06.16.06.09.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 06:09:11 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uR9aJ-00000005gPp-17Iv;
	Mon, 16 Jun 2025 10:09:11 -0300
Date: Mon, 16 Jun 2025 10:09:11 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Robin Murphy <robin.murphy@arm.com>, Nicolin Chen <nicolinc@nvidia.com>,
	joro@8bytes.org, will@kernel.org, bhelgaas@google.com,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, patches@lists.linux.dev,
	pjaroszynski@nvidia.com, vsethi@nvidia.com
Subject: Re: [PATCH RFC v1 0/2] iommu&pci: Disable ATS during FLR resets
Message-ID: <20250616130911.GA1354058@ziepe.ca>
References: <20250610163045.GI543171@nvidia.com>
 <20250613192709.GA971579@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250613192709.GA971579@bhelgaas>

On Fri, Jun 13, 2025 at 02:27:09PM -0500, Bjorn Helgaas wrote:
> On Tue, Jun 10, 2025 at 01:30:45PM -0300, Jason Gunthorpe wrote:
> > On Tue, Jun 10, 2025 at 04:37:58PM +0100, Robin Murphy wrote:
> > > On 2025-06-09 7:45 pm, Nicolin Chen wrote:
> > > > Hi all,
> > > > 
> > > > Per PCIe r6.3, sec 10.3.1 IMPLEMENTATION NOTE, software should disable ATS
> > > > before initiating a Function Level Reset, and then ensure no invalidation
> > > > requests being issued to a device when its ATS capability is disabled.
> > > 
> > > Not really - what it says is that software should not expect to receive
> > > invalidate completions from a function which is in the process of being
> > > reset or powered off, and if software doesn't want to be confused by that
> > > then it should take care to wait for completion or timeout of all
> > > outstanding requests, and avoid issuing new requests, before initiating such
> > > a reset or power transition.
> > 
> > The commit message can be more precise, but I agree with the
> > conclusion that the right direction for Linux is to disable and block
> > ATS, instead of trying to ignore completion time out events, or trying
> > to block page table mutations. Ie do what the implementation note
> > says..
> > 
> > Maybe:
> > 
> > PCIe permits a device to ignore ATS invalidation TLPs while it is
> > processing FLR. This creates a problem visible to the OS where ATS
> > invalidation commands will time out. For instance a SVA domain will
> > have no coordination with a FLR event and can racily issue ATC
> > invalidations into a resetting device.
> 
> The sec 10.3.1 implementation note mentions FLR specifically, but it
> seems like *any* kind of reset would be vulnerable, e.g., SBR,
> external PERST# assert, etc?

Yes, there are a bunch of states where a PCI devices is permitted to
ignore ATC invalidation TLPs.. Aside from all the resets power
management is also a problem.

Jason
