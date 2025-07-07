Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A587D944F
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 07:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751874407; cv=none; b=MK1weyDV2XQzqOZh46SSv/GE0b0yHCF7Xl74AnP8C49xeOPrYYc0bzowgA3mpFYr0/aT5InfIJv5zgB6nP+5JcpniFOvuN6aAYdajSYdheRJzMZLc4LY7SibVgBEQo/0NZxxvetcwcellpL+l4dSmxfPTv6iSk64S+PtlwISKLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751874407; c=relaxed/simple;
	bh=RHS1kEt/R1LtPeuN6Hb8NzwmJ5aGjq8jLqTwouNfDc0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oZLNnZo4HtGnP9JaVlJjekgSc4eu02W9w7rcpBhZjbjB99sBRVlulb5oKkf2f4yyGUf80wHE42AqmwbXWBx66XPpVhDEuybPklvjds3bJKKedRJBWPZ1dIZY5mJx9Sfj3jQ4HFOVw79SGCcNgOzQe2xoy9ztrLdelQwWUuisILk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=c2pG/QzZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="c2pG/QzZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE2BBC4CEE3;
	Mon,  7 Jul 2025 07:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1751874407;
	bh=RHS1kEt/R1LtPeuN6Hb8NzwmJ5aGjq8jLqTwouNfDc0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c2pG/QzZbWK/wG5wHA3ElW8SsJmI34657ByG/+axtYuojbxQI8f5Ao3DggsVs2Urd
	 xoabl2Rh6K2AATLZCz2mk5CaZFmbN3oNHQ31c0Z01EHhXZoG/y22qWg/jj1BEaFLK4
	 OCsmbLSG5En3UsXPNIqwRglqlmwzNd2RJ04LPtms=
Date: Mon, 7 Jul 2025 09:46:43 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Usyskin, Alexander" <alexander.usyskin@intel.com>
Cc: "Abliyev, Reuven" <reuven.abliyev@intel.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [char-misc-next v2] mei: bus: fix device leak
Message-ID: <2025070710-civil-laborious-ad3c@gregkh>
References: <20250624110520.1403597-1-alexander.usyskin@intel.com>
 <2025062836-twentieth-kudos-1148@gregkh>
 <CY5PR11MB63664DE1B93F480CCC199D8FED46A@CY5PR11MB6366.namprd11.prod.outlook.com>
 <2025063022-riverbed-country-5c2b@gregkh>
 <CY5PR11MB6366BBFF44C7F21C24292590ED46A@CY5PR11MB6366.namprd11.prod.outlook.com>
 <2025063042-usual-acutely-0d3b@gregkh>
 <CY5PR11MB636694A9C7A086AF584B7CDDED4FA@CY5PR11MB6366.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CY5PR11MB636694A9C7A086AF584B7CDDED4FA@CY5PR11MB6366.namprd11.prod.outlook.com>

On Mon, Jul 07, 2025 at 07:08:33AM +0000, Usyskin, Alexander wrote:
> > Subject: Re: [char-misc-next v2] mei: bus: fix device leak
> > 
> > On Mon, Jun 30, 2025 at 11:27:14AM +0000, Usyskin, Alexander wrote:
> > > > Subject: Re: [char-misc-next v2] mei: bus: fix device leak
> > > >
> > > > On Mon, Jun 30, 2025 at 10:52:08AM +0000, Usyskin, Alexander wrote:
> > > > > > Subject: Re: [char-misc-next v2] mei: bus: fix device leak
> > > > > >
> > > > > > On Tue, Jun 24, 2025 at 02:05:20PM +0300, Alexander Usyskin wrote:
> > > > > > > The bus rescan function creates bus devices for all clients.
> > > > > > > The fixup routine is executed on all devices, unneeded
> > > > > > > devices are removed and fully initialized once set
> > > > > > > is_added flag to 1.
> > > > > >
> > > > > > I don't understand why the mei bus is so special that it has to have
> > > > > > this type of flag, when no other bus has that for its devices.  The bus
> > > > > > code should know if the device has been properly added or not, if not,
> > > > > > then no release function can be called and the structure isn't even
> > > > > > viable to be used or touched at all.
> > > > > >
> > > > > > So why is this needed?
> > > > >
> > > > > It seems that is_added can be replaced by device_is_registered().
> > > >
> > > > Again, why do you need to track that?
> > > >
> > > > But yes, that should work, although using it is usually a sign that
> > > > something is a bit broken in the design.
> > > >
> > >
> > > Mei bus uses device_initialize() and device_add() pair.
> > > After device_initialize() there are different hooks and filters called,
> > > that may lead to dropping the device or adding with device_add().
> > > Thus, we should track if device_add() is called when destroying the device.
> > > Not sure if this can be re-architected to use device_register().
> > 
> > You don't need to use device_register() but perhaps stop it with the
> > "rescan the bus and attempt to add all devices again" logic that is in
> > mei_cl_bus_rescan()?  There's no need to call device_add() on a device
> > and then way later attempt to initialize it, right?
> > 
> > Just find any new devices that you don't already have on your list of
> > registered devices, and then only add/initialize them, should be a lot
> > simpler logic overall than what the code is currently doing.
> > 
> > greg k-h
> 
> This will require a big refactoring. I'll look how that can be done.
> Meanwhile can this fix be merged on current codebase and
> refactoring will be done separately?

Why not do it properly just once?  What is urgent about this rare leak
now?

thanks,

greg k -h
