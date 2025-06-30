Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17C3B1FBEA2
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 11:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751282298; cv=none; b=nLemiaYjXTz5mCBOmls4RaOfjHOrUZwAvouUzjk9LAN20Fp9XKQ9O8jSdtxEr4ZAX7SPvmir++U7tQglIhbTAGqpAWAr9T4d0UbDHJHSW2sRr+CZfdo8UgZdoakOtgO07DKuWyoO4GgGaIocgSGZqS8T+xts5hKEY5hxMx6bexY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751282298; c=relaxed/simple;
	bh=MziSsbUpL94Lns71SSNJngkRsPxn3AuHUaO6kj7V1Sc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pjyxKtkm2NNWil3Ry9VSQguc9m3EED0RC406Lb0ElUVLGALao2+t21gkP1RXsI8PIRianYNX+9fW/zx/EdPW9vUF/tmVh/CBKRgFQhw58YXYUHz86EMN8WvkgO34DzsXE2Ac2T+z4S+KJdUSxKPrUEWjDYwel0nJFxabjYlrvtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ZgsoOqTz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ZgsoOqTz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4712EC4CEE3;
	Mon, 30 Jun 2025 11:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1751282297;
	bh=MziSsbUpL94Lns71SSNJngkRsPxn3AuHUaO6kj7V1Sc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZgsoOqTzkaeYzhL3c+d99KhMM+vhkr1UISAsbqD6SwxhDtny1nJQbbl08oGCIbq/4
	 Uhsph0zeVB3HzuQ9atBuh11UiIoW/rA3REd6gW/upHeuewvsVreYggL6Pje80mQjqC
	 ogQWdFJlz/blTDieBUQzhG8TVP7Y1SGVwgOqZ/Rg=
Date: Mon, 30 Jun 2025 13:18:14 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Usyskin, Alexander" <alexander.usyskin@intel.com>
Cc: "Abliyev, Reuven" <reuven.abliyev@intel.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [char-misc-next v2] mei: bus: fix device leak
Message-ID: <2025063022-riverbed-country-5c2b@gregkh>
References: <20250624110520.1403597-1-alexander.usyskin@intel.com>
 <2025062836-twentieth-kudos-1148@gregkh>
 <CY5PR11MB63664DE1B93F480CCC199D8FED46A@CY5PR11MB6366.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CY5PR11MB63664DE1B93F480CCC199D8FED46A@CY5PR11MB6366.namprd11.prod.outlook.com>

On Mon, Jun 30, 2025 at 10:52:08AM +0000, Usyskin, Alexander wrote:
> > Subject: Re: [char-misc-next v2] mei: bus: fix device leak
> > 
> > On Tue, Jun 24, 2025 at 02:05:20PM +0300, Alexander Usyskin wrote:
> > > The bus rescan function creates bus devices for all clients.
> > > The fixup routine is executed on all devices, unneeded
> > > devices are removed and fully initialized once set
> > > is_added flag to 1.
> > 
> > I don't understand why the mei bus is so special that it has to have
> > this type of flag, when no other bus has that for its devices.  The bus
> > code should know if the device has been properly added or not, if not,
> > then no release function can be called and the structure isn't even
> > viable to be used or touched at all.
> > 
> > So why is this needed?
> 
> It seems that is_added can be replaced by device_is_registered().

Again, why do you need to track that?

But yes, that should work, although using it is usually a sign that
something is a bit broken in the design.

thanks

greg k-h
