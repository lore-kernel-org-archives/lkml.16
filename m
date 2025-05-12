Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F6AE291874
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 11:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747048906; cv=none; b=f+4HK91T4UDj+NwOMNXvswpnFaO8T5d6wgMN52n4+PqzHSKcShnDsHQPPlSq5emUbZ5VR0mLdVq1ZxWcgkBiA1GiQ3HiFsOmRgozhGL4EFMMSxzwCdiYAsXdUfbJBK+oVaED5WVzcql8U30e4XTQ7epNa0JcJfVG8friJRaiJ+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747048906; c=relaxed/simple;
	bh=OICwPD9q56AbfM7Zw3tr6vLqg/viLoQkZfyvp3hefYA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KipPhY6NY/7aKQoMSNExogrYK9be7soj05WQma9ZHWGkCkWlML/W2G+Y42MJps4JVwblz+pTb3yzvhIWODfwGhtQz/qzfN8sl1/NhDIj82gBpoGXHWX8M4ZzWeou0sbYCt61JPu4IgHBuXpX7mnIxN+a4Rc1ryIrM6NFmXvxcTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=BnDs5e9m; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="BnDs5e9m"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D2FBC4CEF1;
	Mon, 12 May 2025 11:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1747048904;
	bh=OICwPD9q56AbfM7Zw3tr6vLqg/viLoQkZfyvp3hefYA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BnDs5e9mMXyMYKUXmLOnkTiZEPGElgYEYymXDwsRww2CNUtTIuSFpWU28RYG+Ss2A
	 RfGRomRqqFsGfPdI7lYREwBYz9Y+BIClrXgPHb2sruILuJrsd2QHLqt2tDKn1rm0fG
	 o3DcSMu15k21S539i1aKpKD7Sp5j1HMGGlgMukNw=
Date: Mon, 12 May 2025 13:21:42 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Raag Jadav <raag.jadav@intel.com>
Cc: Lee Jones <lee@kernel.org>, david.m.ertman@intel.com,
	ira.weiny@intel.com, andriy.shevchenko@linux.intel.com,
	mika.westerberg@linux.intel.com, heikki.krogerus@linux.intel.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] mfd: core: Support auxiliary device
Message-ID: <2025051255-tusk-vest-0f42@gregkh>
References: <20250428060207.3170325-1-raag.jadav@intel.com>
 <20250501125028.GM1567507@google.com>
 <aBVArb-zJ_aqicHW@black.fi.intel.com>
 <aCHL8WWV-Wt7OrII@black.fi.intel.com>
 <2025051221-gulf-schematic-26e1@gregkh>
 <aCHXLarju7hOXL40@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aCHXLarju7hOXL40@black.fi.intel.com>

On Mon, May 12, 2025 at 02:10:37PM +0300, Raag Jadav wrote:
> On Mon, May 12, 2025 at 12:36:24PM +0200, Greg KH wrote:
> > On Mon, May 12, 2025 at 01:22:41PM +0300, Raag Jadav wrote:
> > > On Sat, May 03, 2025 at 01:01:23AM +0300, Raag Jadav wrote:
> > > > On Thu, May 01, 2025 at 01:50:28PM +0100, Lee Jones wrote:
> > > > > On Mon, 28 Apr 2025, Raag Jadav wrote:
> > > > > 
> > > > > > Extend MFD subsystem to support auxiliary child device. This is useful
> > > > > > for MFD usecases where parent device is on a discoverable bus and doesn't
> > > > > > fit into the platform device criteria. Purpose of this implementation is
> > > > > > to provide discoverable MFDs just enough infrastructure to register
> > > > > > independent child devices without abusing the platform device.
> > > > > > 
> > > > > > Current support is limited to just PCI type MFDs, but this can be further
> > > > > > extended to support other types like USB in the future.
> > > > > > 
> > > > > > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> > > > > > ---
> > > > > > 
> > > > > > v2: Introduce a shared struct mfd_aux_device
> > > > > >     Introduce auxiliary device opt-in flag
> > > > > > 
> > > > > > v3: Fix device_type ABI breakage (Andy)
> > > > > >     Aesthetic adjustments (Andy)
> > > > > > 
> > > > > > v4: s/mfd_aux/maux
> > > > > >     Allow num_resources for child device (Andy)
> > > > > >     Fix build warning (Andy)
> > > > > > 
> > > > > >  drivers/mfd/Kconfig      |   2 +-
> > > > > >  drivers/mfd/Makefile     |   2 +-
> > > > > >  drivers/mfd/mfd-aux.c    | 156 +++++++++++++++++++++++++++++++
> > > > > 
> > > > > This looks like mostly duplicated platform device code.
> > > > > 
> > > > > If you are _certain_ that it needs to exist, you need to push it out to
> > > > > the auxiliary subsystem and remove any traces of it being MFD related.
> > > > > 
> > > > > If it's needed by MFD, it'll be needed by other auxiliary users.  Even
> > > > > if not now, sometime in the future.
> > > > 
> > > > Greg, if you are okay with this, please let me know. Or perhaps suggest
> > > > a better alternative.
> > > 
> > > Greg, any guidance on this?
> > 
> > I don't know what to say, I don't see the code here that is being
> > quoted, sorry.  If this should be in the aux code, add it and submit a
> > patch that uses it so we can see what you are referring to.
> > 
> > confused,
> 
> Apologies for snipping the context in attempt to reduce noise.
> 
> Original patch[1] with Lee's recommendation to move all the resource()
> helpers from MFD to auxiliary subsystem, or perhaps an alternative way
> to manage resources for the usecase.
> 
> [1] https://lore.kernel.org/r/20250428060207.3170325-1-raag.jadav@intel.com
> 
> I can still send out a v5 if it doesn't help. Let me know.

I really don't know, as there's no context here :(

Also, I strongly recommend that you contact the Intel kernel group, as
you don't seem to be following the requirements of them at the moment
when asking for reviews from community members...

good luck!

greg k-h
