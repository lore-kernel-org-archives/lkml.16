Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 356BB35964;
	Sat,  1 Feb 2025 08:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738396804; cv=none; b=ZZjMjJAV7NxFS5YxNX5ITpDismSrvzRw4WaNO9H+vyQ22LiLJTwSdV8YumyOSoNtbq7QwwfNrWkt38UAJfOOrV/jL9R9Ke3tKcz3jw/YQiIRcxFne+c1enhB0c90K+J3yjMNtUlb3TXq7DN9avMYF3ko8W3zs5skmP9tB1hGOgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738396804; c=relaxed/simple;
	bh=BtcIWuOCGHQ5+IzimSwnBfVecSjkh1falInYDVXT6sU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u3R7il4YhVDqEl7/AACV45xHt+AxxWD7yIGguVFBy3LP207/ES/u1LlZPv7405PvXTUnvN5b8dA3jCsKCJK5uIGYY77WNP3bK1IvB3s1EyCz/fUrNONo8/6J/xnDu394hUIHKQIVpB0mJZVTAO6bzRKLiIQ+PMspmk2NgwAaxSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=v4gdl81t; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="v4gdl81t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06520C4CED3;
	Sat,  1 Feb 2025 08:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1738396803;
	bh=BtcIWuOCGHQ5+IzimSwnBfVecSjkh1falInYDVXT6sU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=v4gdl81tuOCb0iKlWz6cgOhrk+/+MtXf5lMaihwpNnVGfhs760uR243zSPWr1/LLl
	 vWUZyWx7ykM5OVuSGWbmpzWYeWPKgsoMExq4CfBTTVYvwN64D+M4YKEM0g9YMSelRD
	 DHEuEPbeHyB4DqtXCb+fV7aXGWL4yYhDabPonixM=
Date: Sat, 1 Feb 2025 09:00:00 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Danilo Krummrich <dakr@kernel.org>
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
Message-ID: <2025020106-avert-senorita-4181@gregkh>
References: <Z5Nw8kaieLueWyUu@pollux>
 <20250130212843.659437-1-lyude@redhat.com>
 <2025013159-shabby-professor-515b@gregkh>
 <2025013140-propeller-dirtiness-6cb4@gregkh>
 <Z50ZuzrDn-GQWOuP@cassiopeiae>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z50ZuzrDn-GQWOuP@cassiopeiae>

On Fri, Jan 31, 2025 at 07:43:07PM +0100, Danilo Krummrich wrote:
> On Fri, Jan 31, 2025 at 05:40:01PM +0100, Greg Kroah-Hartman wrote:
> > On Fri, Jan 31, 2025 at 09:00:32AM +0100, Greg Kroah-Hartman wrote:
> > > On Thu, Jan 30, 2025 at 04:28:26PM -0500, Lyude Paul wrote:
> > > > As Greg KH pointed out, we have a nice /sys/devices/virtual directory free
> > > > for the taking - but the vast majority of device drivers concerned with
> > > > virtual devices do not use this and instead misuse the platform device API.
> > > > 
> > > > To fix this, let's start by adding a simple function that can be used for
> > > > creating virtual devices - virtual_device_create().
> > > > 
> > > > Signed-off-by: Lyude Paul <lyude@redhat.com>
> > > > 
> > > > ---
> > > > 
> > > > So, WIP obviously because I wrote this up in a few minutes - but this goes
> > > > off the idea that Danilo suggested to me off-list of coming up with a
> > > > simple API for handling virtual devices that's a little more obvious to
> > > > use. I wanted to get people's feedback and if we're happy with this idea,
> > > > I'm willing to go through and add some pointers to this function in various
> > > > platform API docs - along with porting over the C version of VKMS over to
> > > > this API.
> > > 
> > > This is a big better, but not quite.  Let me carve out some time today
> > > to knock something a bit nicer together...
> > 
> > Ok, here's a rough first-cut.  It builds, and boots, and I've converted
> > a driver to use the api to prove it works here.  I'll add a bunch more
> > documentation before turning it into a "real" patch, but this should
> > give you something to work off of.
> > 
> > I've run out of time for tonight (dinner is calling), but I think you
> > get the idea, right?  If you want to knock up a rust binding for this
> > api, it should almost be identical to the platform api you were trying
> > to use before, right?
> 
> Yes, additionally, since this can't use the existing platform abstractions any
> more, we need the bus abstraction for the virtual bus, i.e. the corresponding
> driver::RegistrationOps implementation, module_virtual_driver macro, etc. Should
> be a little less than 200 lines of code.

I hope so as the original C code for this is less than 200 lines of code :)

I wonder what it would look like to do a "real" bus in rust, maybe I'll
try that someday, but for now, I want this to be used by C code...

> Other than in C, in Rust we don't need the "artificial" match between a virtual
> device and a virtual driver to have automatic cleanup through things like
> devm_kzalloc().

What artificial match?  Ah, you mean they would both be in the same
"object"?

> But I guess we want it for consistency and to have the corresponding sysfs
> entries and uevents. OOC, are there any other reasons?

I don't really understand the objection here.  Oooh, you want the C code
to both create/manage the driver AND the device at the same time?  Hey I
like that, it would make the interface to it even simpler!  Let me go
try that, and see if it is what you are thinking of here...

thanks!

greg k-h
