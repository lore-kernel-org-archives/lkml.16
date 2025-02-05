Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABDB521C180;
	Wed,  5 Feb 2025 05:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738734721; cv=none; b=YQLMhc/sREhtXK4XkdxOO4gojJy5qnn0ZZZAd3YGWhGeB1l2WDYc4Z4UXpNvAVZ/x6Ia1ygNBM+q4DMBDOYEu/DYs9r1DTOs5+jpqwdLrKijH/kjnAmX+B6B1s9TPTNVx4HO1mH0V6i1co1j1ZoIDSxf1Boq6PpaNgVKILXKAMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738734721; c=relaxed/simple;
	bh=2sYCnDc9FmR/l4oxfn4t/2bbF2ESa5u+swYCCVzXV6s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ChZYS1JrtfsHDcGZXP+RD0oXj/yQExnU5cEHMb/FEuw/5EW2VRwVxtMtOj2FmabQeGFZo3NNwSfXbgPZcyFHaxZ/4IsZ3ADpeMjJbIA5w9A0b0ja95I/6hSGc6aF6eH9CTL2IiFnXjFiaET1UCVaV9zX0OR8/McWk63k0xtajkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Cg2f8yrb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Cg2f8yrb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4985DC4CED1;
	Wed,  5 Feb 2025 05:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1738734721;
	bh=2sYCnDc9FmR/l4oxfn4t/2bbF2ESa5u+swYCCVzXV6s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Cg2f8yrbUfDqNu4MXpPRXwezSpetu3QDAsbXJawU/Aje0YUbESaHqFx1q6PwQ89RJ
	 D07bUgkLyJDc+KhfmSn/3YwdXRvskBCj5IVGvNjH6ekYJzgwQX/GJUHqUQ3RvueSLx
	 brM9peU6klMBwJJjcW3+EK6PsqX4aqVXPw7I3A2c=
Date: Wed, 5 Feb 2025 06:51:57 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Lyude Paul <lyude@redhat.com>
Cc: linux-kernel@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
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
Message-ID: <2025020523-gesture-concave-a87d@gregkh>
References: <2025020421-poster-moisture-534b@gregkh>
 <2025020424-retrain-recharger-407c@gregkh>
 <5da9a28a00b6ab3a756aff34dc872905acd610ad.camel@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5da9a28a00b6ab3a756aff34dc872905acd610ad.camel@redhat.com>

On Tue, Feb 04, 2025 at 05:51:25PM -0500, Lyude Paul wrote:
> Oops! I actually caught one small nitpick I didn't notice before when writing
> up the bindings:
> 
> On Tue, 2025-02-04 at 12:09 +0100, Greg Kroah-Hartman wrote:
> > +/**
> > + * faux_device_create - create and register a faux device and driver
> > + * @name: name of the device and driver we are adding
> > + * @faux_ops: struct faux_driver_ops that the new device will call back into, can be NULL
> > + *
> > + * Create a new faux device and driver, both with the same name, and
> > + * register them in the driver core properly.  The probe() callback of
> > + * @faux_ops will be called with the new device that is created for the
> > + * caller to do something with.
> > + *
> > + * Note, when this function is called, the functions specified in struct
> > + * faux_ops will be called before the function returns, so be prepared for
> > + * everything to be properly initialized before that point in time.
> > + *
> > + * Return:
> > + * * NULL if an error happened with creating the device
> > + * * pointer to a valid struct faux_device that is registered with sysfs
> > + */
> > +struct faux_device *faux_device_create(const char *name, struct faux_driver_ops *faux_ops)
> 
> ^ Why not const struct faux_driver_ops? Doesn't seem like there's any need to
> mutate faux_ops.

Yes, Rob also pointed this out, I'll make this change, and the
documentation updates, later today.

thanks,

greg k-h
