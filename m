Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AD4C25A626;
	Tue,  4 Feb 2025 06:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738649134; cv=none; b=A79FQs7ki82jl2nnUc//S+fzfT3nCJm3gaoqJcRKvtL05cjx+W+MSv1u7vv9QzywVjTyfcxr+YrWzdeGeMkEFtmzAGcMSYrmTonJMXvdqS35bn+C8wX2llHl06l+poSY/onA+Qcf+bK4fLNLs/LeJXpZxPo9bVp0ke3eJbuMJLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738649134; c=relaxed/simple;
	bh=vX4aA/6gkr5S2EYZ7q8VfH/ypL6/uNym6ZXM18apQJo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ml8xzgGa9zBpMldn2CixVd/2iII7TOdGDeOoyHicc5Oefj80UJj/6VeSg4K3QAPDtK+2VEmrWCTWfeCR4Vda641PNLbHEcMBlktVQk4Rc/HDXQGSNwyNrHVdbxbF9UUwzV26ysxiSUEWbBvHEC0cP7EcFNBq+46T2txYI23GVp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=XBauSiml; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="XBauSiml"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D48D1C4CEDF;
	Tue,  4 Feb 2025 06:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1738649133;
	bh=vX4aA/6gkr5S2EYZ7q8VfH/ypL6/uNym6ZXM18apQJo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XBauSiml7rsXsJLVT/9dhzQHeRfEkaO733Tjj+9Gmm8Isv4FHUMqvzlebYyoG60zr
	 2FYI1duA78ZXvsaYO1wJb/m6vKF9XcSJs/sRs5I3e+fpYS4KtghuNmPZIxt4n8lhA3
	 8YHxvVRDsaWKSA3Unt3y1Tb6kqZygBKH9ZG54WeY=
Date: Tue, 4 Feb 2025 07:05:29 +0100
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
	Lukas Wunner <lukas@wunner.de>, Bjorn Helgaas <bhelgaas@google.com>,
	Simona Vetter <simona.vetter@ffwll.ch>
Subject: Re: [RFC] driver core: add a virtual bus for use when a simple
 device/bus is needed
Message-ID: <2025020427-urgency-preplan-baaa@gregkh>
References: <Z5Nw8kaieLueWyUu@pollux>
 <20250130212843.659437-1-lyude@redhat.com>
 <2025013159-shabby-professor-515b@gregkh>
 <2025013140-propeller-dirtiness-6cb4@gregkh>
 <Z50ZuzrDn-GQWOuP@cassiopeiae>
 <2025020106-avert-senorita-4181@gregkh>
 <2025020306-overhang-glider-7d42@gregkh>
 <Z6Ch8O-0oY70Jhi6@pollux>
 <2025020307-cavalier-knapsack-7f89@gregkh>
 <Z6ExZOzIgAHlX_MP@pollux>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z6ExZOzIgAHlX_MP@pollux>

On Mon, Feb 03, 2025 at 10:13:08PM +0100, Danilo Krummrich wrote:
> On Mon, Feb 03, 2025 at 12:25:23PM +0100, Greg Kroah-Hartman wrote:
> > On Mon, Feb 03, 2025 at 12:01:04PM +0100, Danilo Krummrich wrote:
> > > On Mon, Feb 03, 2025 at 10:39:58AM +0100, Greg Kroah-Hartman wrote:
> > > > From 4c7aa0f9f0f7d25c962b70a11bad48d418b9490a Mon Sep 17 00:00:00 2001
> > > > From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > > > Date: Fri, 31 Jan 2025 15:01:32 +0100
> > > > Subject: [PATCH] driver core: add a virtual bus for use when a simple
> > > >  device/bus is needed
> > > > 
> > > > Many drivers abuse the platform driver/bus system as it provides a
> > > > simple way to create and bind a device to a driver-specific set of
> > > > probe/release functions.  Instead of doing that, and wasting all of the
> > > > memory associated with a platform device, here is a "virtual" bus that
> > > > can be used instead.
> > > > 
> > > > Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > > 
> > > I think it turned out pretty nice combining the driver and device creation for
> > > convenience.
> > > 
> > > But I think we may still need the option to create multiple devices for the same
> > > driver, as mentioned by Sima.
> > 
> > That will work just fine, the api will allow that, just give each device
> > a unique name and you are good to go.
> > 
> > > @Sima: I wonder if the number of devices could just be an argument?
> > 
> > Then the virtual bus logic will have to create some sort of number/name
> > system and I don't want to do that.  It's a "first caller gets the name"
> > type thing here.  You can easily in a driver do this:
> > 
> > 	my_dev_1 = virtual_device_create(&my_virt_ops, "my_dev_1");
> > 	my_dev_2 = virtual_device_create(&my_virt_ops, "my_dev_2");
> > 	my_dev_3 = virtual_device_create(&my_virt_ops, "my_dev_3");
> > 	...
> > 
> > You share the same callbacks, and that's all you really care about.  If
> > you want to hang sysfs files off of these things, I can make them take a
> > device_groups pointer as well, but let's keep it simple first.
> 
> Sure, that works perfectly. Just thought, we might not want to also create a new
> struct driver for each device.

Oooh, good catch, I can get rid of that now and just use a single
internal driver structure.  The "driver vs. device" shouldn't really
matter anymore as that's not the goal here.

I'll keep my v1 version of the virtual bus code here and rename it to
something else (simple?) as we do want tht for other platform devices
that need/want to have a real driver, but for this api for now, that's
not needed.

thanks,

greg k-h
