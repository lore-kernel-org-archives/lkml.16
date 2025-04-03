Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 300F624EF7E
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 14:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743690290; cv=none; b=i5LtSETvFlYGJQRtL38AsTAf6QQIQFQOlN9kciWC1+oDfjZN79W6obLpdixnBFrWqRe9uXgLx+lb7BcM81SMPbu6rezqhDp5YHqwC+M8OV7yarm9v/1FRzyvW2aJsczz60mxfM2rbpgU1iiqseR4/KlDoGHRrVGiEoQvCEC95jI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743690290; c=relaxed/simple;
	bh=ULh4LiwYDnoWTct7omJfi80raYIjgsafQ/+mOn4NKcQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DudAV0YXawpGP0iMNcWYaZMjN4rK+Iu+A72nBL4HrMWq6Ybrz0EYnd9hYrTH6y1o/y8wYyBZi2hMFm/yjCuHvltpov7o6ySOJROZ4O5BZ/vXRDY1l8liSKyIFw+pCD3GT/vSvLuMfh8A1dZtHQGSCUG4QPnAdnJ3di1euyKWOkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=GU8llk2h; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="GU8llk2h"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36F36C4CEE7;
	Thu,  3 Apr 2025 14:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1743690289;
	bh=ULh4LiwYDnoWTct7omJfi80raYIjgsafQ/+mOn4NKcQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GU8llk2h+13k4nu1+zl+CXUhQiNV9YWOcz87Pe/dPRmmRRnFqHZ5jHh6KiIQboJ8D
	 iLfaolKJY4mUybcQ3e0NWxAEU1NQ2usHqWtkmYiz4JR86duS3N8nF4sI0Ofzju4qiV
	 wiaYvT05X7hp4HT1oFzzh7QriKh8tEgHs1KSGGYw=
Date: Thu, 3 Apr 2025 15:23:22 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Raag Jadav <raag.jadav@intel.com>, david.m.ertman@intel.com,
	ira.weiny@intel.com, lee@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] mfd: core: Support auxiliary device
Message-ID: <2025040343-vascular-swung-f124@gregkh>
References: <20250403110053.1274521-1-raag.jadav@intel.com>
 <2025040336-ethically-regulate-3594@gregkh>
 <Z-6YU24dhxF5PRaw@smile.fi.intel.com>
 <Z-6Y6lbLSbe46-uQ@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z-6Y6lbLSbe46-uQ@smile.fi.intel.com>

On Thu, Apr 03, 2025 at 05:19:22PM +0300, Andy Shevchenko wrote:
> On Thu, Apr 03, 2025 at 05:16:51PM +0300, Andy Shevchenko wrote:
> > On Thu, Apr 03, 2025 at 03:02:47PM +0100, Greg KH wrote:
> > > On Thu, Apr 03, 2025 at 04:30:53PM +0530, Raag Jadav wrote:
> 
> ...
> 
> > > > 2. Should we allow auxiliary drivers to manage their own resources
> > > >    (MEM, IO, IRQ etc)?
> > > 
> > > The resources are all shared by the "parent" device, that's what makes
> > > aux drivers work, they need to handle this as there is no unique way to
> > > carve up the resources here.
> > > 
> > > So I don't know how you would do this, sorry.
> > 
> > I think we should simply enforce the requirement that MFD on AUX bus must use
> > regmap. This will solve the serialisation and common access to the resources.
> 
> That said, make an additional API call like
> 
> dev_mfd_add_aux_devices() which should enforce new infrastructure and convert
> drivers one by one. Also with that you may add a warning to the existing (PCI)
> drivers that are using old API
> 
> 	if (dev_is_pci(parent))
> 		dev_warn(parent, "Uses old API, please switch to ...\n");

Don't add "warnings" like this if you aren't also going to actually
convert the code.  Just convert it, otherwise you pester users with
problems that they have no idea how to fix.

thanks,

greg k-h
