Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7F9F20A5CB;
	Mon,  3 Feb 2025 16:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738599217; cv=none; b=GHIDEzBRGsng/r3tc+2PN5rCNehThUtlxJS2rEXypjtu8NdWfUMHW6Ic3zBFNvGEobIFFdzDyAJuQcGzU+i+4j/OZcKz2CHDVsOjJEiQG6ZwTIw6tYZjNXKf9/mXueELXq5OEMgk5QuzGqs+kifDqch6lrm6LN7c4mBpf+K6U3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738599217; c=relaxed/simple;
	bh=t/Y+Z+5KTI+edvzeLZ3jJzu3xlo3CBjQnZgM83t7eCA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NOEe77VRlK2ppq+WBYXBQHD3Rz8zUJubQeiCqiaqXXTlduPfoMREoGU7QgAHlPwOGTIEg0TLdGk+ysAYH2HaiO+ygvhVyM3x7BZy1XK2EOQ3SwVjYxX4uqvXkbt8Za6Qd6SO223QS7b+s5gm7JqTTZutcLWPh/bpDPQN+N/ov08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=PqP7LvUN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="PqP7LvUN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB68AC4CED2;
	Mon,  3 Feb 2025 16:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1738599216;
	bh=t/Y+Z+5KTI+edvzeLZ3jJzu3xlo3CBjQnZgM83t7eCA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PqP7LvUNUQ5wLFIgTKsUlVmDB2F52hSIRFrsNKXjHo4mbls7wv3/e9BEc/wErpvAV
	 5cZAoIWNixGZOU/u8YSStbnASLWuEhk3M1F76f8UJz985iTGt6glnFYyY1GTo8FAY9
	 3R0BVWzBKU0olMmA9YzVplvMnInGXc0jdRK5jnDY=
Date: Mon, 3 Feb 2025 17:13:28 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Lyude Paul <lyude@redhat.com>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Lukas Wunner <lukas@wunner.de>,
	Mark Brown <broonie@kernel.org>,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
	Robin Murphy <robin.murphy@arm.com>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Zijun Hu <quic_zijuhu@quicinc.com>, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 1/3] driver core: add a faux bus for use when a simple
 device/bus is needed
Message-ID: <2025020337-obstruct-washbasin-63a4@gregkh>
References: <2025020324-thermal-quilt-1bae@gregkh>
 <2025020326-backer-vendetta-7094@gregkh>
 <Z6DchyPieQKBJ0SN@smile.fi.intel.com>
 <2025020300-gown-outmatch-1343@gregkh>
 <Z6DpP3qMNYZoKEP2@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z6DpP3qMNYZoKEP2@smile.fi.intel.com>

On Mon, Feb 03, 2025 at 06:05:19PM +0200, Andy Shevchenko wrote:
> > > > +/**
> > > > + * __faux_device_create - create and register a faux device and driver
> > > > + * @name: name of the device and driver we are adding
> > > > + * @faux_ops: struct faux_driver_ops that the new device will call back into, can be NULL
> > > > + * @owner: module owner of the device/driver
> > > > + *
> > > > + * Create a new faux device and driver, both with the same name, and register
> > > > + * them in the driver core properly.  The probe() callback of @faux_ops will be
> > > > + * called with the new device that is created for the caller to do something
> > > > + * with.
> > > 
> > > The kernel-doc will complain on missing Return: section.
> > 
> > Is that new?  Does that mean platform.c has lots of complaints in it as
> > well?  What does platform_find_device_by_driver() give you for a
> > documentation issue?
> > 
> > And as I didn't hook this up to the kernel documentation build yet, it
> > shouldn't produce any warnings anywhere :)
> 
> I would rather say it's old.
> 
> Run
> 
> 	kernel-doc -Wall -none -v ...your file...
> 
> and find the warning. During the kernel builds this is moved to extra warnings.

Ah, nice, didn't know about that.  Now fixed up.

> > > > + */
> 
> ...
> 
> > > > +	faux_obj = kzalloc(sizeof(*faux_obj) + strlen(name) + 1, GFP_KERNEL);
> > > 
> > > Potential overflow. To avoid one may use struct_size() from overflow.h.
> > 
> > Users should not be providing the string here.  Again, this comes from
> > platform.c.
> 
> I'm not sure I follow. The name parameter is not limited anyhow, so one may
> provide non-terminated string and strlen() will return an arbitrary number.
> Potentially this can lead to big numbers and become an overflow when gets
> to a parameter for kmalloc(). This most likely never happen in real life,
> but still the overflow is possible.

I've now bounded at 256, because really, who needs a bigger name for a
device than that :)

thanks,

greg k-h
