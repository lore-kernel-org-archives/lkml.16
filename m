Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F09541A5B8F;
	Thu,  6 Feb 2025 14:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738852110; cv=none; b=iR46SPagbnd6Z1tkn0fCw03AA27eFyN7RPB2Y5/byA7SNM4MBQ1coaOZptA8xO+eJQkj1IdpwE5q5aJdBWe5X1sdYB5GnmT/Z67QI09vpC/oWMaN/bYRJh+/AC4okqmDO1aR+WSyeAwM7fTGnlJ7R/GjKwyY9De/TM3aNTJrZaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738852110; c=relaxed/simple;
	bh=iTfHKvbnhZt+g/hfLvuOilfEg1gjiVZgATfj6qx2TsQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uA8k64uceIvQuRKrg5xTWVnled+OF7FAh2akn6RKkGG1U99cOuKmLkMAvzreEzcmKrsx/BsK2hL0eJSfBddkV/ACn0Mb97er96uV6tAAh7uX2cy184H6qUJhJmDbig2l1vcN5LtrCAZpkOaxeWZQhB/WsmHv9Ob3OrBjqrI8fMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=mTDoWcyY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="mTDoWcyY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 449F2C4CEE2;
	Thu,  6 Feb 2025 14:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1738852109;
	bh=iTfHKvbnhZt+g/hfLvuOilfEg1gjiVZgATfj6qx2TsQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mTDoWcyYkRuZ0wTByIxvK7HVriZOqbhex3SP6cySEh0D6DVyYCx5JOB1sqgmRONpD
	 1ygT8DDQlKMOd9Q09mlxWqVGyxCfyWmO6Pq+aK6v5Wlr31hdlAtzTUnHyT+8oGeItc
	 rSFCLm+0iyZwl+m0qUbghwGgQeQ9vfuXWYhiYcB0=
Date: Thu, 6 Feb 2025 08:44:14 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: linux-kernel@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Lyude Paul <lyude@redhat.com>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
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
Message-ID: <2025020657-product-embody-dc2e@gregkh>
References: <2025020421-poster-moisture-534b@gregkh>
 <2025020424-retrain-recharger-407c@gregkh>
 <28e9ed5a-9437-4a53-a099-a8df27ca8a91@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <28e9ed5a-9437-4a53-a099-a8df27ca8a91@rowland.harvard.edu>

On Tue, Feb 04, 2025 at 10:31:46AM -0500, Alan Stern wrote:
> On Tue, Feb 04, 2025 at 12:09:13PM +0100, Greg Kroah-Hartman wrote:
> > Many drivers abuse the platform driver/bus system as it provides a
> > simple way to create and bind a device to a driver-specific set of
> > probe/release functions.  Instead of doing that, and wasting all of the
> > memory associated with a platform device, here is a "faux" bus that
> > can be used instead.
> > 
> > Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > ---
> 
> 
> > +/**
> > + * faux_device_create - create and register a faux device and driver
> > + * @name: name of the device and driver we are adding
> > + * @faux_ops: struct faux_driver_ops that the new device will call back into, can be NULL
> > + *
> > + * Create a new faux device and driver, both with the same name, and
> > + * register them in the driver core properly.
> 
> Along the same lines as Danilo's comment, this routine does not create a 
> new driver any more.

Thanks, I'll re-read all the documentation and make sure it all makes
sense now.

greg k-h
