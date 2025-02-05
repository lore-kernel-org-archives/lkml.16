Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE869131E2D;
	Wed,  5 Feb 2025 08:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738745907; cv=none; b=gcouDjuKhCIRXLDH6YZuj/zl2W9ptHnXe225Cu9697DMpDy4Qsl7rqWLH9CluR6nN2k6lxJhG44EBezApoLVixPbV5u1r58EwjNvjI3UNprRmbo9Ms4NTK9l3m0idVjwYuZ9x7QUAWG+ObXfqSEqGiKy3i7RLrrw+STWiAfrlaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738745907; c=relaxed/simple;
	bh=kM+s4n5cpTUxbpdFjbbygnhho55AYGXNqAnpq2otDrc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kR9bckvrxLblWNX8s1JgvzuNRqlhuhvDkQPt9dxuZ8fyl/oNosVzxJ0J8LsGFwxJQg3OdnWzwFf+0wa5hz49eBCFv4iMHH4NHUHW65V59UP4i9Yp/9bvaM/ZeqgWUS/P5l6blTLt8NFFr70+LFogI/B/SgvUt84rekCeAExpa60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=MF+JRaed; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="MF+JRaed"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98C34C4CEE3;
	Wed,  5 Feb 2025 08:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1738745905;
	bh=kM+s4n5cpTUxbpdFjbbygnhho55AYGXNqAnpq2otDrc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MF+JRaedzFhC02VvWAnRJsrSKgURKLoUr4td1lMNV9SvTbmWosd4VhpLEGX2Px9in
	 cgXkIRER1tvfjR1AHvUV4o/FBypC0CIZ0aDhl0ci3BwgKu5oC5e01elbDrqFATTeQC
	 F8xyoSGl6mpFuFKJu5DbfIcATVA7+A/1BrHVH3Rg=
Date: Wed, 5 Feb 2025 09:58:21 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Lyude Paul <lyude@redhat.com>, linux-kernel@vger.kernel.org,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Lukas Wunner <lukas@wunner.de>,
	Mark Brown <broonie@kernel.org>,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
	Robin Murphy <robin.murphy@arm.com>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Zijun Hu <quic_zijuhu@quicinc.com>, linux-usb@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 1/5] driver core: add a faux bus for use when a simple
 device/bus is needed
Message-ID: <2025020548-fringe-humbly-3ceb@gregkh>
References: <2025020421-poster-moisture-534b@gregkh>
 <2025020424-retrain-recharger-407c@gregkh>
 <fd6250102ea9d869448e7a40a60a02f8b167d4ac.camel@redhat.com>
 <2025020518-outcome-harbor-6281@gregkh>
 <Z6MZ7JdP6tynvYRr@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z6MZ7JdP6tynvYRr@smile.fi.intel.com>

On Wed, Feb 05, 2025 at 09:57:32AM +0200, Andy Shevchenko wrote:
> On Wed, Feb 05, 2025 at 06:53:09AM +0100, Greg Kroah-Hartman wrote:
> > On Tue, Feb 04, 2025 at 06:10:36PM -0500, Lyude Paul wrote:
> > > On Tue, 2025-02-04 at 12:09 +0100, Greg Kroah-Hartman wrote:
> 
> ...
> 
> > > Should we add faux_get_drvdata()/faux_set_drvdata() since we've got a
> > > probe/remove function? Doesn't really look like the platform driver equivalent
> > > does mcuh, but I assume just having an inline function for this would make
> > > things a little less confusing for users.
> > 
> > You already have a reference counted object returned to you, why do you
> > need to increment/decrement it again?  All of the users I've found in
> > the kernel so far didn't need that, do you have a specific example where
> > it would be useful?
> 
> It's about getter and setter for the .driver_data field, I don't see how
> reference counting can help with this.

{sigh}

I saw get and thought get_device() as my coffee hadn't kicked in, my
fault.

You both are right, I'll go add these wrappers.

thanks,

greg k-h
