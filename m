Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 468F2207E16;
	Tue,  4 Feb 2025 10:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738664055; cv=none; b=YYZrWbBRHgx/icgnqcFjGIbRnwgUS/GW9lV29C/zmqSt2drw6xp7jPdI/XtohFygSFmcgNgoRwYaPQRdTwqA9upuzzITyrAlqCIEXacCF+A+qsQjtpFb9Yrawq0q0NrKw67D50SrfM6L7SmP8FfhGHYcNHRTu384qWDW3UDX5fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738664055; c=relaxed/simple;
	bh=RkxODEFpB8fv7RdYzLfqVvAGBBluOBtbGS2gKd28fUM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l9+WdDb246wKmReZtYnQcv83J4pfpQuzC0nEmH2YSVbzlSBQnM5uV/Ks2GSNpONkdu6LQDw2TXHFpkJ1x7xm76vCGXDc1pX/pchWciWXnuYb4v9C6ZQk3bcLPSkxo20nGd1ciOGOKInOTeXxb6MxOUwS71IPwBQLIFBJBpbaeug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=dl3hal5O; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="dl3hal5O"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B391C4CEDF;
	Tue,  4 Feb 2025 10:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1738664054;
	bh=RkxODEFpB8fv7RdYzLfqVvAGBBluOBtbGS2gKd28fUM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dl3hal5OqfgiV9YkYCbMwmFflfs8ZYEqJ2nVOuOj6uQX5wPEkmiTDtpoHYDX8CUB0
	 O4xsejKCWMYxRgNxesFCp22yHmxKWcYCEKs9y3yxA0UMG51kNj6coG4Uw3NCj3lpjG
	 XziJ0Ipjo4aM0sJqGSyCFojrtxEXqFTw16Fe4dKU=
Date: Tue, 4 Feb 2025 11:14:11 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Lyude Paul <lyude@redhat.com>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Lukas Wunner <lukas@wunner.de>,
	Mark Brown <broonie@kernel.org>,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
	Robin Murphy <robin.murphy@arm.com>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Zijun Hu <quic_zijuhu@quicinc.com>, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 1/3] driver core: add a faux bus for use when a simple
 device/bus is needed
Message-ID: <2025020423-mahogany-skewed-9588@gregkh>
References: <2025020324-thermal-quilt-1bae@gregkh>
 <2025020326-backer-vendetta-7094@gregkh>
 <20250204092532.000001ca@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250204092532.000001ca@huawei.com>

On Tue, Feb 04, 2025 at 09:25:32AM +0000, Jonathan Cameron wrote:
> On Mon,  3 Feb 2025 15:25:17 +0100
> Greg Kroah-Hartman <gregkh@linuxfoundation.org> wrote:
> 
> > Many drivers abuse the platform driver/bus system as it provides a
> > simple way to create and bind a device to a driver-specific set of
> > probe/release functions.  Instead of doing that, and wasting all of the
> > memory associated with a platform device, here is a "faux" bus that
> > can be used instead.
> > 
> > Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> 
> Nice. One trivial thing inline.
> 
> 
> > diff --git a/drivers/base/faux.c b/drivers/base/faux.c
> > new file mode 100644
> > index 000000000000..0eba89a5cd57
> > --- /dev/null
> > +++ b/drivers/base/faux.c
> > @@ -0,0 +1,189 @@
> 
> 
> > +int __init faux_bus_init(void)
> > +{
> > +	int error;
> > +
> > +	error = device_register(&faux_bus_root);
> > +	if (error) {
> > +		put_device(&faux_bus_root);
> > +		return error;
> > +	}
> > +
> > +	error =  bus_register(&faux_bus_type);
> 
> Odd bonus space after = 

Thanks!  I caught that when I just rewrote this function, and I finally
got around to running checkpatch which found another error in it that I
missed.  It's sometimes easier to notice changes in other's code than
your own :)

greg k-h
