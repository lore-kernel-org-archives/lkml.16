Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BA531FFC4C;
	Mon,  3 Feb 2025 09:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738576368; cv=none; b=YWtf8B4UkVx4lhgcrfTpbMURiSmuM+3Y3E4BZrwXIayPp9wXEOHkNF4u8p14tgd3hQLhJ9lIUkHAHihShovfXLTlYp6TDvQI+H+ULBboTqN1o1TAK/d8KARVDBen4qYE/2CnSWvakaPnkP3R7Y/1DcMgFBDQcPLN5RERny+UuZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738576368; c=relaxed/simple;
	bh=ZXpevS1Mmi8yjIFsOyg/6dm3QjL5MGX7lBk7dnD8LAY=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VGuy1TEsAhyK83k/E8k48s6d+mDLJk9wJIs+9hfFjaxcf2m+jbg8YjO14iL/8sUyFDOdkOd0S5DByZDevJfGz5usn70s3IRj9ESBhhy9xeJnxQ7gyyDTFhXkLMKQmxrQlRh/SRxEi5qUNOSRf7s/GhbTO+nKZNdUCOLJc6tDRrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=te9GJZZD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="te9GJZZD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD2B6C4CEE0;
	Mon,  3 Feb 2025 09:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1738576367;
	bh=ZXpevS1Mmi8yjIFsOyg/6dm3QjL5MGX7lBk7dnD8LAY=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=te9GJZZDlSUvNUpXY48YSFKjY1FuwPesPaECOQYFxgeclz/2hbpxy3IRw0467XGfC
	 kkm+ipCBv0Lis1zja5HmmWEwW1qqW5sFUpRDn9+QehZWJn1W/od9mMLCz1T9w9Qmxz
	 eBA/nXqwJnKlpnOMR1nwh5bxzTKLRZlut+0P6xv4=
Date: Mon, 3 Feb 2025 10:51:45 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Danilo Krummrich <dakr@kernel.org>, Lyude Paul <lyude@redhat.com>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Zijun Hu <quic_zijuhu@quicinc.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Lukas Wunner <lukas@wunner.de>, Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH] WIP: drivers/base: Add virtual_device_create()
Message-ID: <2025020339-unwomanly-amulet-96cf@gregkh>
References: <Z5Nw8kaieLueWyUu@pollux>
 <20250130212843.659437-1-lyude@redhat.com>
 <2025013159-shabby-professor-515b@gregkh>
 <2025013140-propeller-dirtiness-6cb4@gregkh>
 <Z50ZuzrDn-GQWOuP@cassiopeiae>
 <2025020106-avert-senorita-4181@gregkh>
 <Z6CQQZ5fbBwCJ63K@phenom.ffwll.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z6CQQZ5fbBwCJ63K@phenom.ffwll.local>

On Mon, Feb 03, 2025 at 10:45:37AM +0100, Simona Vetter wrote:
> On Sat, Feb 01, 2025 at 09:00:00AM +0100, Greg Kroah-Hartman wrote:
> > On Fri, Jan 31, 2025 at 07:43:07PM +0100, Danilo Krummrich wrote:
> > > On Fri, Jan 31, 2025 at 05:40:01PM +0100, Greg Kroah-Hartman wrote:
> > > > On Fri, Jan 31, 2025 at 09:00:32AM +0100, Greg Kroah-Hartman wrote:
> > > > > On Thu, Jan 30, 2025 at 04:28:26PM -0500, Lyude Paul wrote:
> > > > > > As Greg KH pointed out, we have a nice /sys/devices/virtual directory free
> > > > > > for the taking - but the vast majority of device drivers concerned with
> > > > > > virtual devices do not use this and instead misuse the platform device API.
> > > > > > 
> > > > > > To fix this, let's start by adding a simple function that can be used for
> > > > > > creating virtual devices - virtual_device_create().
> > > > > > 
> > > > > > Signed-off-by: Lyude Paul <lyude@redhat.com>
> > > > > > 
> > > > > > ---
> > > > > > 
> > > > > > So, WIP obviously because I wrote this up in a few minutes - but this goes
> > > > > > off the idea that Danilo suggested to me off-list of coming up with a
> > > > > > simple API for handling virtual devices that's a little more obvious to
> > > > > > use. I wanted to get people's feedback and if we're happy with this idea,
> > > > > > I'm willing to go through and add some pointers to this function in various
> > > > > > platform API docs - along with porting over the C version of VKMS over to
> > > > > > this API.
> > > > > 
> > > > > This is a big better, but not quite.  Let me carve out some time today
> > > > > to knock something a bit nicer together...
> > > > 
> > > > Ok, here's a rough first-cut.  It builds, and boots, and I've converted
> > > > a driver to use the api to prove it works here.  I'll add a bunch more
> > > > documentation before turning it into a "real" patch, but this should
> > > > give you something to work off of.
> > > > 
> > > > I've run out of time for tonight (dinner is calling), but I think you
> > > > get the idea, right?  If you want to knock up a rust binding for this
> > > > api, it should almost be identical to the platform api you were trying
> > > > to use before, right?
> > > 
> > > Yes, additionally, since this can't use the existing platform abstractions any
> > > more, we need the bus abstraction for the virtual bus, i.e. the corresponding
> > > driver::RegistrationOps implementation, module_virtual_driver macro, etc. Should
> > > be a little less than 200 lines of code.
> > 
> > I hope so as the original C code for this is less than 200 lines of code :)
> > 
> > I wonder what it would look like to do a "real" bus in rust, maybe I'll
> > try that someday, but for now, I want this to be used by C code...
> > 
> > > Other than in C, in Rust we don't need the "artificial" match between a virtual
> > > device and a virtual driver to have automatic cleanup through things like
> > > devm_kzalloc().
> > 
> > What artificial match?  Ah, you mean they would both be in the same
> > "object"?
> > 
> > > But I guess we want it for consistency and to have the corresponding sysfs
> > > entries and uevents. OOC, are there any other reasons?
> > 
> > I don't really understand the objection here.  Oooh, you want the C code
> > to both create/manage the driver AND the device at the same time?  Hey I
> > like that, it would make the interface to it even simpler!  Let me go
> > try that, and see if it is what you are thinking of here...
> 
> So at least in vkms we plan to allow instantiating more than one device,
> with the same driver, so not sure we really want this. The idea is that
> you can also validate the multi-gpu (or at least multi-display) code of
> compositors with entirely fake hw in CI. It is a pretty common pattern
> though for these virtual devices/drivers, but not universal I think.

See the patch I just posted, it creates internal drivers for every
device you create, so in reality, you don't need to worry about the
driver portion at all, just provide a probe/release callback if you want
to and you are good to go!

thanks,

greg "drivers for everyone!" k-h
