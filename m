Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CB7F280CDC
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 17:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745429284; cv=none; b=fQau4eXmFA1WPbdtdNqYQQCotwFkr7OpJoEangXAFPQTW57jqYuAct8csmBMN5TGtVnuvFCng/NqldhrkE7MReUqxjfz+Ir+8MKIkkpTmVnEuH3nH7uZYCtpzCEKoDSjZwodBPKMIMIhrJfqaqn/1C8NNvUGFyxZ+gQiGL8UfGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745429284; c=relaxed/simple;
	bh=To5+mXKVqJ4D8W9A86Idf9GAwp67sMMUFZetXoeXhNQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ukXWrriPvZSqPSEGVszpujnTIBjsg1ean5FY5lV4StauFvyVquhwwIJsp7qUZIgEViLkMM1bnZKNTiNii07Fs7SNdIUG0t9ANY8Pxno699VtnDPrvolXDlLwxueE5vIPPGoqP0800C7XWa0CfLB/Gf2f0DCo2Jr8dkgc9/ZAe3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kwptRyiN; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kwptRyiN"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2260c91576aso592785ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 10:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745429282; x=1746034082; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZpN3s3qmY26UBKN47K4OXTIlbbWZaDEQfwBQfiV1DYQ=;
        b=kwptRyiNCqvGFx3+PD7w7R4QKX4gHQ+pl8yv9mEO2J8SrWhAi21JpGuYcLSM8wMHGE
         ifw25qSB4pR+IYmmzG3TtVSmZxe9ngqSd1eOIkE4uvxmdGAFHY3Ji+Nn0zLEHpnQRKO6
         t6O0nbPGwMpyJ6e/q09r++UcdFllVRG3gafZINDPDK+yGwXc9hW0TPebyabqxSh8gTj2
         /R0alS72ta1gDZoxdxzuUgv6eURI9OQK/GRnjfgZJBRYEdBPrycAvQF8+5mDE26EYxNy
         vjqHlHnn9fF4125j5oC3V3VMcERB1yapMngeH2vfKIIQbdAykUEf7tuvV07uV+4K/9Ac
         a9EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745429282; x=1746034082;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZpN3s3qmY26UBKN47K4OXTIlbbWZaDEQfwBQfiV1DYQ=;
        b=rLCHyHw/Pn7/UacnY/G8gSrr7sOtQNLTbXBUKvNaflfw8yKE7/Cl3lFQWOq/4oBnKp
         7FJZEgm4kebv2lhnJCEBLI6S7al/+aIpkayX6y0pvRM4Woy+YNbRIF5c8V4e81gY9HMj
         bLsZrPbaidttSI11Z8EjI6GVQqomEcaVE2wLWK+L2MOAItTcHLfp+LBP9yKPW1cYWOo1
         G4LVfoLwIulmVE1oxXR3CE+zTSVfkM+GupTg4N0cy4yHKemYy7NCiDH6s9aaI3InXNN5
         tmIdLOi2PV0mKKKNEMowCNW6Qx7+0rEeGeLmfxPQXOvoRF6UIxD5VRFPL2NkZeUd1eti
         k7cQ==
X-Forwarded-Encrypted: i=1; AJvYcCVbtvFQQaiw6T3FDhIeC5prFQzedSTEHgVyKoWLBVwCXCrLKIEazOwZNMSPOnJKoY0+Udff6i0mPSlE3KA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwCTcTbgeTU34bGZzUnFy8NBcAcoX0wPumGcKgsOL23DVuzaBsR
	7V3ikBgHSK484de3Qmx7GD47V+zrLQvH3MzGF+ObiC2LK8Dpr0gessUu1MZHKw==
X-Gm-Gg: ASbGncuFAftJyQWgulxbaAW3bj1sATsIe1mYaz1eIQq2pcpE1tGiQ8ASgG06zFQouun
	gYRYwvKnUgoN6WeFXDFRJjPS3I1h/+t8vd6sGAXkzS5ZbN8eH3Sqh0yKaGQrK1FivBA7t91WIH2
	vXpEI+inbfnTNVkTt0n+VIEsOGoKABVtPXIOKbl4oC/H242WwQi+qsXu8YYiPmt3FW7IddsIFZF
	NjBAl7XwfaJL95AIRvOXJmjQzjvzto0QfXa1Hnuy9nrDUkIONmsmRBgSWDvdtDASDEQ91aUsUp/
	noY4xrRFH8+h3IOTR/vR83j6lJjN4vTprOCwrsuXM65u+UZBz/dj4chCdBLLcutV60K6zvyGMwi
	h/w2YLg==
X-Google-Smtp-Source: AGHT+IHa77CexBJ8kZ0MMVz4lBWN5XuYsJm19QW6W7Xn3LZrvzkSypYq7z6BTcnhDO0elSznGaYPdA==
X-Received: by 2002:a17:902:e5c5:b0:224:c7c:7146 with SMTP id d9443c01a7336-22c53573e54mr225103025ad.6.1745429281505;
        Wed, 23 Apr 2025 10:28:01 -0700 (PDT)
Received: from google.com (7.104.168.34.bc.googleusercontent.com. [34.168.104.7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50eced45sm107077345ad.175.2025.04.23.10.28.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 10:28:00 -0700 (PDT)
Date: Wed, 23 Apr 2025 10:27:56 -0700
From: William McVicker <willmcvicker@google.com>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>,
	"Rob Herring (Arm)" <robh@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Joerg Roedel <jroedel@suse.de>, Bjorn Helgaas <bhelgaas@google.com>,
	iommu@lists.linux.dev, Saravana Kannan <saravanak@google.com>,
	kernel-team@android.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] platform: Fix race condition during DMA configure at
 IOMMU probe time
Message-ID: <aAkjHMCQ82v5Ea0n@google.com>
References: <20250423150823.GA422889@bhelgaas>
 <4129dca9-07fa-4b9d-a7d8-de7561d509e7@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4129dca9-07fa-4b9d-a7d8-de7561d509e7@arm.com>

On 04/23/2025, Robin Murphy wrote:
> On 2025-04-23 4:08 pm, Bjorn Helgaas wrote:
> > On Tue, Apr 22, 2025 at 04:26:49PM -0700, Will McVicker wrote:
> > > If devices are probed asynchronously, then there is a chance that during
> > > the IOMMU probe the driver is bound to the device in parallel. If this
> > > happens after getting the platform_driver pointer while in the function
> > > `platform_dma_configure()`, then the invalid `drv` pointer
> > > (drv==0xf...ffd8) will be de-referenced since `dev->driver != NULL`.
> > 
> > I need a little more hand-holding to make sense out of this.

Sorry for not making it super clear :/ I was trying to find the right balance
between being too verbose and not clear enough. I guess a threaded call flow
might help visually demonstrate the race condition.

> > 
> > After digging out
> > https://lore.kernel.org/all/aAa2Zx86yUfayPSG@google.com/, I see that
> > drv==0xf...ffd8 must be a result of applying to_platform_driver() to a
> > NULL pointer.  This patch still applies to_platform_driver(NULL), but
> > avoids using the result by testing drv for NULL later, which seems
> > prone to error.
> > 
> > I think this would all be clearer if we tested for the NULL pointer
> > explicitly before applying to_platform_driver().  I don't like setting
> > a pointer to an invalid value.  I think it's better if the pointer is
> > either valid or uninitialized because the compiler can help find uses
> > of uninitialized pointers.
> 
> Yeah, I was also in the middle of looking at this after managing to hit it
> playing with driver_async_probe at the end of last week. I guess when I
> originally wrote this pattern I was maybe thinking the compiler would defer
> the to_x_driver() computation to the point it's eventually dereferenced, but
> I suppose it can't since dev is passed to an external function in program
> order in between.

Glad to hear I'm not the only one hitting this. I agree we should test for the
NULL pointer first before trying to get the platform driver. I'll send a v2 for
this.

> 
> Indeed in my half-written version of this patch I was leaning towards
> removing the drv variable altogether (just doing
> to_x_driver(dev->driver)->driver_managed_dma inline), or at least doing the
> same as Will's previous diff. I figure the one-liner replacing
> "!dev->driver" with "!&drv->driver" would be too disgustingly non-obvious
> for anyone else's tastes...
> 
> For consistency we should really fix all the buses the same way - sorry for
> the bother (I can write up the other patches if you'd like). FWIW this part

Yes please. Thanks!

> really was the most temporary stopgap, as my planned next step is to propose
> moving driver_managed_dma and the use_default_domain() call up into the
> driver core and so removing all this bus-level code anyway, hence trying to
> minimise the effort spent churning it. Oh well.
> 
> > > To avoid a kernel panic and eliminate the race condition, we should
> > > guard the usage of `dev->driver` by only reading it once at the
> > > beginning of the function.
> > > 
> > > Fixes: bcb81ac6ae3c ("iommu: Get DT/ACPI parsing into the proper probe path")
> > > Signed-off-by: Will McVicker <willmcvicker@google.com>
> > > ---
> > >   drivers/base/platform.c | 7 ++++---
> > >   1 file changed, 4 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/drivers/base/platform.c b/drivers/base/platform.c
> > > index 1813cfd0c4bd..b948c6e8e939 100644
> > > --- a/drivers/base/platform.c
> > > +++ b/drivers/base/platform.c
> > > @@ -1440,7 +1440,8 @@ static void platform_shutdown(struct device *_dev)
> > >   static int platform_dma_configure(struct device *dev)
> > >   {
> > > -	struct platform_driver *drv = to_platform_driver(dev->driver);
> > > +	struct device_driver *drv = READ_ONCE(dev->driver);
> 
> Beware this might annoy a different set of people as it's not paired with a
> WRITE_ONCE(), but for now I guess using it is still arguably better than
> not. Really we should be under device_lock at this point and so have no race
> at all, but we can't do that without keeping track of which devices are
> IOMMUs themselves to avoid deadlock, and that's not something I fancy
> throwing out as an -rc fix in a hurry...
> 
> Thanks,
> Robin.

Thanks again!
--Will

> 
> > > +	struct platform_driver *pdrv = to_platform_driver(drv);
> > >   	struct fwnode_handle *fwnode = dev_fwnode(dev);
> > >   	enum dev_dma_attr attr;
> > >   	int ret = 0;
> > > @@ -1451,8 +1452,8 @@ static int platform_dma_configure(struct device *dev)
> > >   		attr = acpi_get_dma_attr(to_acpi_device_node(fwnode));
> > >   		ret = acpi_dma_configure(dev, attr);
> > >   	}
> > > -	/* @drv may not be valid when we're called from the IOMMU layer */
> > > -	if (ret || !dev->driver || drv->driver_managed_dma)
> > > +	/* @dev->driver may not be valid when we're called from the IOMMU layer */
> > > +	if (ret || !drv || pdrv->driver_managed_dma)
> > >   		return ret;
> > >   	ret = iommu_device_use_default_domain(dev);
> > > -- 
> > > 2.49.0.805.g082f7c87e0-goog
> > > 
> 
