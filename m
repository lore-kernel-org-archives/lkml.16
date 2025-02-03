Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 714DD205E12;
	Mon,  3 Feb 2025 15:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738597620; cv=none; b=MblMZvxTBt+LX8nv86rMq39ax2RVrJdl6aJ9+84tCvc0pZZ9bsolYbKoOM7/SW9V+I7v4CUdKt4+K/ctViAS/wSa81x3gSW8FsnMFw+8KUCSE6fB8M93G8oHOtd4inpuBkia1m1Su+vWmmdtzys3fam8CeFj3VPyXRKH3jSKt8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738597620; c=relaxed/simple;
	bh=3JIFy9yC+Zkwr+QsSfGenMJKEGpT65ER3lGktOs1qmM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cGwdmP4/+HRVAzWwbgtLqF7xIBnqgkRZ0wd7uiL7YPHdPbMmzzk9tM+gq5c6S1C7X+mGfBR/Nbm9amHGH5yZsLwAIksXyTMSQ+vt87jDbOqPkEqiyvRuuOjMBNcCajyrtm28TYDeS2o3k7FbNQEzYHGpFFoZbGHL7jDBi0jtS8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=iJvek9q9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="iJvek9q9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4071FC4CED2;
	Mon,  3 Feb 2025 15:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1738597619;
	bh=3JIFy9yC+Zkwr+QsSfGenMJKEGpT65ER3lGktOs1qmM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iJvek9q9lvw2bVSOMUGghoKXUTGSc8f2yuK/YX1ohsicCpC0byuYEtzPL973972ZY
	 IUl5D9Axe5Von0Dc+0ngRFk+ER8kVq1P2JK4yV4KM+esYRuktUIT1zLM/Toub5x0k2
	 su4OV5KqhDdc4Y8AclR2miIWBntF0zGck3XrxFyI=
Date: Mon, 3 Feb 2025 16:46:56 +0100
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
Message-ID: <2025020308-shrill-brewery-38d6@gregkh>
References: <2025020324-thermal-quilt-1bae@gregkh>
 <2025020326-backer-vendetta-7094@gregkh>
 <Z6DchyPieQKBJ0SN@smile.fi.intel.com>
 <2025020300-gown-outmatch-1343@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025020300-gown-outmatch-1343@gregkh>

On Mon, Feb 03, 2025 at 04:35:45PM +0100, Greg Kroah-Hartman wrote:
> > > + */
> > > +struct faux_device *__faux_device_create(const char *name,
> > > +					       struct faux_driver_ops *faux_ops,
> > > +					       struct module *owner)
> > > +{
> > > +	struct device_driver *drv;
> > > +	struct device *dev;
> > > +	struct faux_object *faux_obj;
> > > +	struct faux_device *faux_dev;
> > > +	int ret;
> > 
> > > +	faux_obj = kzalloc(sizeof(*faux_obj) + strlen(name) + 1, GFP_KERNEL);
> > 
> > Potential overflow. To avoid one may use struct_size() from overflow.h.
> 
> Users should not be providing the string here.  Again, this comes from
> platform.c.

Sima just proved me wrong, I'll go check for this now, thanks for
pointing it out.

greg k-h
