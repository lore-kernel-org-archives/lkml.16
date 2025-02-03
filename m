Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F01014F12D;
	Mon,  3 Feb 2025 15:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738597567; cv=none; b=kJw9i9Jgsc4EbQaXuY1E2PnvQuuXs0Oo7iJtXLUJX73pvzb6yZxFMWbfwt8B/5EEwHvMo/fTsopUnodqT9uZT86g/qXVSwJohTTiGvTL6Wn4XNhE7TZPoGt4bsr3HMArSgkecovS39VbN9YonNq3c5i32vCI1k0J+sattkiZJoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738597567; c=relaxed/simple;
	bh=jaYinU+QnQfEY5yFyQZV4YjBXqkEFnOQyHwM0AfRWPI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UufAugG6GfZDfKD7O4pq0WKiPniYyeD4jgDknpXCEVrhiFtDTSYUxfJfc278fR9jS7IqEzcnPMJNiudIabkdJI0VIulHLOscaojgTlQnHYUzHzOlIVqCUx52uHHXk0pdQp9uj8K8eh9UAPpU2Z7XUndT89bmWfotlNittF4G+Mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=tmQlvmc4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="tmQlvmc4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00671C4CED2;
	Mon,  3 Feb 2025 15:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1738597565;
	bh=jaYinU+QnQfEY5yFyQZV4YjBXqkEFnOQyHwM0AfRWPI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tmQlvmc41AoJ2uckKW8/OhwLRJ5n5oUhG3fXvOAjG0zi6PN0n2xYLdXxA1GKKN64s
	 ej4+B5rRb6x6AVaAyTAoDoKAA1R85Orv2f1R9TaXMGs/K2FoJXTyqo0Q6hlOE150xT
	 8BFhlDQ1cJXBYm83A2jR4St/itScLyn5GRwCNxDQ=
Date: Mon, 3 Feb 2025 16:46:02 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Lyude Paul <lyude@redhat.com>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Lukas Wunner <lukas@wunner.de>,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
	Robin Murphy <robin.murphy@arm.com>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Zijun Hu <quic_zijuhu@quicinc.com>, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 2/3] regulator: dummy: convert to use the faux bus
Message-ID: <2025020313-constant-ravishing-1506@gregkh>
References: <2025020324-thermal-quilt-1bae@gregkh>
 <2025020326-applicant-unwomanly-13df@gregkh>
 <3238a3af-3296-435a-a326-859d0188d51c@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3238a3af-3296-435a-a326-859d0188d51c@sirena.org.uk>

On Mon, Feb 03, 2025 at 03:39:06PM +0000, Mark Brown wrote:
> On Mon, Feb 03, 2025 at 03:25:18PM +0100, Greg Kroah-Hartman wrote:
> > The dummy regulator driver does not need to create a platform device, it
> > only did so because it was simple to do.  Change it over to use the
> > faux bus instead as this is NOT a real platform device, and it makes
> > the code even smaller than before.
> 
> No, they did this because you explicitly asked that this be done....

I did?  What was it attempting to be before this?  I don't remember that
at all, sorry.

> > -static int dummy_regulator_probe(struct platform_device *pdev)
> > +static int dummy_regulator_probe(struct faux_device *vdev)
> 
> Just dev or fdev - we could just pass a struct device in here, we don't
> actually care that it's a platform device at this point.  Having the
> abbreviation mismatch with the device type is odd.

Ah, that's a mistake from my first pass when this was a "struct
virtual_device" and I called this "vdev".  I'll go fix that up, thanks.

greg k-h
