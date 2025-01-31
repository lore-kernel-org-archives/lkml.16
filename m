Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C60BA7081F;
	Fri, 31 Jan 2025 18:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738348993; cv=none; b=JU+c7b20SHvLCX+9sMJF7piKoLy8g/9DRD/NXy7pyDQRMDZ3Z7PKEHp75La4PGjnPKpKQ86hzwJIOLrXznOpne7wdMKvIAWvknDdXQTZ+cNYAFEWenYoTztdTURHmrS6Fv4KP3VYK76SwU6mDjwadq8Kwed4TcylJ3M+b7w11ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738348993; c=relaxed/simple;
	bh=lkEUZeq1BTatu9Yj1IRyQZ0OexnAyDj/jMfGjQxTQ0k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=moseoSuoSDkH325R/+OcSGktAfDlGnSACWgIygGah4MhhntzAJvx3zftjabI3TxeJhZD0ycRp+AY9wgcGBd/c6C4d8BsfgZh+9t7VnRGEvt1+ut5AJhE/tdg4zXDJ4/9JzalrHyGCjBU0NG9M5r9gGRl2i9/ZaxeX/hg/p+cDOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hIXD48ym; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hIXD48ym"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77961C4CED1;
	Fri, 31 Jan 2025 18:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738348993;
	bh=lkEUZeq1BTatu9Yj1IRyQZ0OexnAyDj/jMfGjQxTQ0k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hIXD48ymt2P0VwbagXw1N/awjcQKtHo6vl+QAeBCtUuFH+HR22p5N5vd6jgiALbvK
	 tm3kwlIB7upEXGUjiG5n8iwFHPCvdtpKXCwfrfBrucfynE41e3Rm4mqZogg0iVtn5L
	 kraHIe74/yWsdzgI5kAuSRJmrLS/kIfGAWQJyWGBXVpEj0OGmiryW3wNP/NYnaqXMX
	 3EIaZ/VcYy491fn6OsIGeg/o/ktfM8Quw9DG/ajkMNC/ctE1bvzVQU8rHEGi0Jsvth
	 bnO/UjIxhrayUgVVcdTKXOv+5pd+XymOU2QYNRXP9NbaYPU0IUoljXM9iKFj8PTElY
	 ACpUY+RM/yiMA==
Date: Fri, 31 Jan 2025 19:43:07 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Lyude Paul <lyude@redhat.com>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Zijun Hu <quic_zijuhu@quicinc.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Lukas Wunner <lukas@wunner.de>, Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH] WIP: drivers/base: Add virtual_device_create()
Message-ID: <Z50ZuzrDn-GQWOuP@cassiopeiae>
References: <Z5Nw8kaieLueWyUu@pollux>
 <20250130212843.659437-1-lyude@redhat.com>
 <2025013159-shabby-professor-515b@gregkh>
 <2025013140-propeller-dirtiness-6cb4@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025013140-propeller-dirtiness-6cb4@gregkh>

On Fri, Jan 31, 2025 at 05:40:01PM +0100, Greg Kroah-Hartman wrote:
> On Fri, Jan 31, 2025 at 09:00:32AM +0100, Greg Kroah-Hartman wrote:
> > On Thu, Jan 30, 2025 at 04:28:26PM -0500, Lyude Paul wrote:
> > > As Greg KH pointed out, we have a nice /sys/devices/virtual directory free
> > > for the taking - but the vast majority of device drivers concerned with
> > > virtual devices do not use this and instead misuse the platform device API.
> > > 
> > > To fix this, let's start by adding a simple function that can be used for
> > > creating virtual devices - virtual_device_create().
> > > 
> > > Signed-off-by: Lyude Paul <lyude@redhat.com>
> > > 
> > > ---
> > > 
> > > So, WIP obviously because I wrote this up in a few minutes - but this goes
> > > off the idea that Danilo suggested to me off-list of coming up with a
> > > simple API for handling virtual devices that's a little more obvious to
> > > use. I wanted to get people's feedback and if we're happy with this idea,
> > > I'm willing to go through and add some pointers to this function in various
> > > platform API docs - along with porting over the C version of VKMS over to
> > > this API.
> > 
> > This is a big better, but not quite.  Let me carve out some time today
> > to knock something a bit nicer together...
> 
> Ok, here's a rough first-cut.  It builds, and boots, and I've converted
> a driver to use the api to prove it works here.  I'll add a bunch more
> documentation before turning it into a "real" patch, but this should
> give you something to work off of.
> 
> I've run out of time for tonight (dinner is calling), but I think you
> get the idea, right?  If you want to knock up a rust binding for this
> api, it should almost be identical to the platform api you were trying
> to use before, right?

Yes, additionally, since this can't use the existing platform abstractions any
more, we need the bus abstraction for the virtual bus, i.e. the corresponding
driver::RegistrationOps implementation, module_virtual_driver macro, etc. Should
be a little less than 200 lines of code.

Other than in C, in Rust we don't need the "artificial" match between a virtual
device and a virtual driver to have automatic cleanup through things like
devm_kzalloc().

But I guess we want it for consistency and to have the corresponding sysfs
entries and uevents. OOC, are there any other reasons?
