Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D8BA2AD22
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 16:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748448992; cv=none; b=cNerWTB7J6qWZojl1ca7T9eKwEkA+ovJiwSx114bbl0eIuLaXG6UerwMnszi85isdQl+IhFrhxBHkQXw0I9hCe+4LwNzbTArrLaA/chgLx+XOVPGkPJoG0c7U5VVVsYKZLakuLC42L+3OXOFw//I2hcrDfB2KdldcizOl3ZcfW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748448992; c=relaxed/simple;
	bh=CsGfA4wkOwc0c4xkoTehp9aLRXYbsmL82sZWemT3BpY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kultk04tZxi+AmTrNBtayyINgvqyMWSVi0d531qrozZ9mJ8xlHKw7SBehGhXRtcrQBMW/vStoKMeRiibCAbYXmGXjtgWg1EBPLQRVHlIIrj196eHXhsQS8WYIDU8XEVldYu+fms0qOa2bGOJvJkIekDfQqJtcEIyssVUkHHofAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=t-8ch.de; spf=pass smtp.mailfrom=t-8ch.de; dkim=pass (1024-bit key) header.d=t-8ch.de header.i=@t-8ch.de header.b=HsULcoZA; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=t-8ch.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=t-8ch.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=t-8ch.de header.i=@t-8ch.de header.b="HsULcoZA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=t-8ch.de; s=mail;
	t=1748448981; bh=CsGfA4wkOwc0c4xkoTehp9aLRXYbsmL82sZWemT3BpY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HsULcoZAIFQsgKD2wj/ubVAKDL7YejxUoTfKiRX+euF317szG3hp7I0PLdyoBcsVt
	 jnyw6Y0n/IxbKioaceb7/KJntgyxDxuUAEETvKAgFD9USMjyvR13wXY4QKPJuOXANg
	 NceE96icKuNGiue84QWHihKfE7tVszaEyV2UWhTA=
Date: Wed, 28 May 2025 18:16:21 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas@t-8ch.de>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, 
	Andrew Morton <akpm@linux-foundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
	Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [GIT PULL] Driver core changes for 6.16-rc1
Message-ID: <35e4b33f-d9e4-41d6-8a47-644fda5b1b7f@t-8ch.de>
References: <aDcyRMojWUbAllVX@kroah.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aDcyRMojWUbAllVX@kroah.com>

Hi Greg,

On 2025-05-28 17:56:52+0200, Greg KH wrote:
> The following changes since commit 82f2b0b97b36ee3fcddf0f0780a9a0825d52fec3:
> 
>   Linux 6.15-rc6 (2025-05-11 14:54:11 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git tags/driver-core-6.16-rc1
> 
> for you to fetch changes up to 071d8e4c2a3b0999a9b822e2eb8854784a350f8a:
> 
>   kernfs: Relax constraint in draining guard (2025-05-21 14:23:13 +0200)
> 
> ----------------------------------------------------------------
> Driver core changes for 6.16-rc1
> 
> Here are the driver core / kernfs changes for 6.16-rc1.
> 
> Not a huge number of changes this development cycle, here's the summary
> of what is included in here:
>   - kernfs locking tweaks, pushing some global locks down into a per-fs
>     image lock
>   - rust driver core and pci device bindings added for new features.

>   - sysfs const work for bin_attributes.  This churn should now be
>     completed for those types of attributes

This is missing the switch away and removal of the transitional
struct members, "read_new", "write_new" and "bin_attrs_new".
These are the actually churny changes.

I have a branch with those, based on current linux-next/master, at
https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/sysfs-const-bin_attr-final

(Has not yet passed 0day, but earlier versions this week did)

Do you want me to resubmit it to you? Now or shortly before the end of
the merge window?

>   - auxbus device creation helpers added
>   - fauxbus fix for creating sysfs files after the probe completed
>     properly
>   - other tiny updates for driver core things.
> 
> All of these have been in linux-next for over a week with no reported
> issues.

<snip>

> Thomas Weißschuh (2):
>       sysfs: constify bin_attribute argument of bin_attribute::read/write()
>       sysfs: constify attribute_group::bin_attrs

<snip>


Thomas
