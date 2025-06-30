Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFC27235074
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 12:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751288101; cv=none; b=D2wRsYlIjU+ZTwfy0Bj54DpU7i3o0u9WlDfaDucarVD20vDRGiguNMaWj1pXEnICjmxuC4ScmD6BxWJp50bxUYiU9kXjn+Qdt5saC2r706aqS7Rz6F3I3ANCZgip3+3OeE/bOsM2GtwxPt9hIUjfwChMtoEw4fn1PYv8+I4aRzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751288101; c=relaxed/simple;
	bh=120QU6A9t6aYG5PTSl23sa0udVq59hsYqgehlJS2Kjs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Msr2RoSH1ttl3+o4m0J9YuPdV/eJvJzQ3QAGpEGanTeebi8WoluZuAruZiOTfBVZpmcdi2UvrAHm20BmNRq4GcAyN70xavwaZStN8iCIjV2LMSeHMTKE2MoZPtjHgST85bi4HzoKGyDPGJ03ZamRAnAYXCx7pf7YVAFMzYTawgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=GGDMa+TJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="GGDMa+TJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44697C4CEE3;
	Mon, 30 Jun 2025 12:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1751288100;
	bh=120QU6A9t6aYG5PTSl23sa0udVq59hsYqgehlJS2Kjs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GGDMa+TJxWZMYFieaYGSLwXDroThg4x90nLKbB7mSCF2xlZosON+SY+Hey18d4HSk
	 C3iJQXpeFCItH5/v81RYgEodKrCjzAevrvdTn4kAgRBCXmF9/rLzaWue8q+pjN3cUi
	 CfXPuxm393Gr0xiL4SWYBs4OuaOnXoH9i9OnTdo8=
Date: Mon, 30 Jun 2025 14:54:57 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Usyskin, Alexander" <alexander.usyskin@intel.com>
Cc: "Abliyev, Reuven" <reuven.abliyev@intel.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [char-misc-next v2] mei: bus: fix device leak
Message-ID: <2025063042-usual-acutely-0d3b@gregkh>
References: <20250624110520.1403597-1-alexander.usyskin@intel.com>
 <2025062836-twentieth-kudos-1148@gregkh>
 <CY5PR11MB63664DE1B93F480CCC199D8FED46A@CY5PR11MB6366.namprd11.prod.outlook.com>
 <2025063022-riverbed-country-5c2b@gregkh>
 <CY5PR11MB6366BBFF44C7F21C24292590ED46A@CY5PR11MB6366.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CY5PR11MB6366BBFF44C7F21C24292590ED46A@CY5PR11MB6366.namprd11.prod.outlook.com>

On Mon, Jun 30, 2025 at 11:27:14AM +0000, Usyskin, Alexander wrote:
> > Subject: Re: [char-misc-next v2] mei: bus: fix device leak
> > 
> > On Mon, Jun 30, 2025 at 10:52:08AM +0000, Usyskin, Alexander wrote:
> > > > Subject: Re: [char-misc-next v2] mei: bus: fix device leak
> > > >
> > > > On Tue, Jun 24, 2025 at 02:05:20PM +0300, Alexander Usyskin wrote:
> > > > > The bus rescan function creates bus devices for all clients.
> > > > > The fixup routine is executed on all devices, unneeded
> > > > > devices are removed and fully initialized once set
> > > > > is_added flag to 1.
> > > >
> > > > I don't understand why the mei bus is so special that it has to have
> > > > this type of flag, when no other bus has that for its devices.  The bus
> > > > code should know if the device has been properly added or not, if not,
> > > > then no release function can be called and the structure isn't even
> > > > viable to be used or touched at all.
> > > >
> > > > So why is this needed?
> > >
> > > It seems that is_added can be replaced by device_is_registered().
> > 
> > Again, why do you need to track that?
> > 
> > But yes, that should work, although using it is usually a sign that
> > something is a bit broken in the design.
> > 
> 
> Mei bus uses device_initialize() and device_add() pair.
> After device_initialize() there are different hooks and filters called,
> that may lead to dropping the device or adding with device_add().
> Thus, we should track if device_add() is called when destroying the device.
> Not sure if this can be re-architected to use device_register().

You don't need to use device_register() but perhaps stop it with the
"rescan the bus and attempt to add all devices again" logic that is in
mei_cl_bus_rescan()?  There's no need to call device_add() on a device
and then way later attempt to initialize it, right?

Just find any new devices that you don't already have on your list of
registered devices, and then only add/initialize them, should be a lot
simpler logic overall than what the code is currently doing.

greg k-h
