Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E2A412F399
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 10:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747046331; cv=none; b=S4NnDkKOGx7icT7CYJLVkKLOp73NUxhvQRHbBUmtLwlH9ZFKG8LBKRngkq5h239AGXpaUGIOFk2hfHCPKvuEkaPI4hiw//sKnSQcQjR3P5xQyOzUWRZyce+iZAOvrMUZNo4rUuBQJNI4LAEGFU8ELJD/ZT/lPbWnC+nbSr2BpHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747046331; c=relaxed/simple;
	bh=uPYoh2qd9twXv2t/5rtKA9T/rK7iFC3czNcd8n+Ldl8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BspURFCJLUgaY2caFckae6roJAtgPqvkpji3eLUFeQwF0fBQ64QpbXLtQtlTXse/9hJSgm4lIRbT3jrtOPWCcDEdiSyVc6tevMR4XyM8vq3U7TRZmaxTBQQKqbSddpO0adPq4nvxxaCFA5VcBX8XOf8bGwMuIs2Ip7kUE4Kcu1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=frYmQFVC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="frYmQFVC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A14A2C4CEE7;
	Mon, 12 May 2025 10:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1747046331;
	bh=uPYoh2qd9twXv2t/5rtKA9T/rK7iFC3czNcd8n+Ldl8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=frYmQFVC+tRLHpAdv/XV0hLF+311U1qxNzvjyC0Cyp4TWIBhtnqc4Qu/inaXwS574
	 FRM7CWGtE1IcXy75061fW4yhBF+JKVp4VtikrFHSx5d2Bj7R8Wp8BSb3hI6kPy8Gog
	 CAPQpDAeU0ArAXV+zhRlD8ofsgYhen/0ou82C3ow=
Date: Mon, 12 May 2025 12:36:24 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Raag Jadav <raag.jadav@intel.com>
Cc: Lee Jones <lee@kernel.org>, david.m.ertman@intel.com,
	ira.weiny@intel.com, andriy.shevchenko@linux.intel.com,
	mika.westerberg@linux.intel.com, heikki.krogerus@linux.intel.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] mfd: core: Support auxiliary device
Message-ID: <2025051221-gulf-schematic-26e1@gregkh>
References: <20250428060207.3170325-1-raag.jadav@intel.com>
 <20250501125028.GM1567507@google.com>
 <aBVArb-zJ_aqicHW@black.fi.intel.com>
 <aCHL8WWV-Wt7OrII@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aCHL8WWV-Wt7OrII@black.fi.intel.com>

On Mon, May 12, 2025 at 01:22:41PM +0300, Raag Jadav wrote:
> On Sat, May 03, 2025 at 01:01:23AM +0300, Raag Jadav wrote:
> > On Thu, May 01, 2025 at 01:50:28PM +0100, Lee Jones wrote:
> > > On Mon, 28 Apr 2025, Raag Jadav wrote:
> > > 
> > > > Extend MFD subsystem to support auxiliary child device. This is useful
> > > > for MFD usecases where parent device is on a discoverable bus and doesn't
> > > > fit into the platform device criteria. Purpose of this implementation is
> > > > to provide discoverable MFDs just enough infrastructure to register
> > > > independent child devices without abusing the platform device.
> > > > 
> > > > Current support is limited to just PCI type MFDs, but this can be further
> > > > extended to support other types like USB in the future.
> > > > 
> > > > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> > > > ---
> > > > 
> > > > v2: Introduce a shared struct mfd_aux_device
> > > >     Introduce auxiliary device opt-in flag
> > > > 
> > > > v3: Fix device_type ABI breakage (Andy)
> > > >     Aesthetic adjustments (Andy)
> > > > 
> > > > v4: s/mfd_aux/maux
> > > >     Allow num_resources for child device (Andy)
> > > >     Fix build warning (Andy)
> > > > 
> > > >  drivers/mfd/Kconfig      |   2 +-
> > > >  drivers/mfd/Makefile     |   2 +-
> > > >  drivers/mfd/mfd-aux.c    | 156 +++++++++++++++++++++++++++++++
> > > 
> > > This looks like mostly duplicated platform device code.
> > > 
> > > If you are _certain_ that it needs to exist, you need to push it out to
> > > the auxiliary subsystem and remove any traces of it being MFD related.
> > > 
> > > If it's needed by MFD, it'll be needed by other auxiliary users.  Even
> > > if not now, sometime in the future.
> > 
> > Greg, if you are okay with this, please let me know. Or perhaps suggest
> > a better alternative.
> 
> Greg, any guidance on this?

I don't know what to say, I don't see the code here that is being
quoted, sorry.  If this should be in the aux code, add it and submit a
patch that uses it so we can see what you are referring to.

confused,

greg k-h
