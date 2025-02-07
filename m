Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29EA71D6DB5;
	Fri,  7 Feb 2025 09:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738919624; cv=none; b=jJzSa4SQHWyDSERBriNCUrGZMK3BiDOZjK1qS6hyBac4sR9dg7iICtZVLdJn9hOhUbFXa/x1GdPhqsENFmEEUFJUyEbnOgxsDz6um5V9LWt9ozAP0R+j+/9NM/1gaqLhqbcU23U2uZvaWTnqXUZ2ldYwVqwR7zeMJF1qaviMFwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738919624; c=relaxed/simple;
	bh=9PvSG4zdzbcGhJAC7UkL/ZDLIQi3DrjcxfU8idWQ4js=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o5ZWVvIfwkb7NBiMCQPd3EqQiIfsSPLbxIxh4vbMEXCQRznwo0bVOUrPpq8+Uw3jFlaX60zCQfmQCjA0fQKC7Z2DxfCimq83PlXZliA2aAH7cjCal455kaEO/sPxMcXfp403qT/GCdVd/Ek9C/PN8ml3/TNOsOkWMhWRyKn6U/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=iuQCqS0x; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="iuQCqS0x"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFDC7C4CED1;
	Fri,  7 Feb 2025 09:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1738919623;
	bh=9PvSG4zdzbcGhJAC7UkL/ZDLIQi3DrjcxfU8idWQ4js=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iuQCqS0xKAXw/friBRMWhGTIQOy7X0g4pYAYNlJAFXmuMtPKn+FcjSHf/dLkq9hHH
	 8N4lfp2+KbCMOWiGPHdgL3X1t+Kqt4MIMGwzxqRyAnCpJRSKt+b2LeWwHRITEcH4YE
	 gDdWS0r9nHZW+gubSRFIg/ZgEXCjByawnXmb02w8=
Date: Fri, 7 Feb 2025 10:13:40 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Lyude Paul <lyude@redhat.com>
Cc: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>,
	linux-kernel@vger.kernel.org,
	"Rafael J. Wysocki" <rafael@kernel.org>,
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
Subject: Re: [PATCH v3 1/8] driver core: add a faux bus for use when a simple
 device/bus is needed
Message-ID: <2025020748-savings-porthole-9e27@gregkh>
References: <2025020620-skedaddle-olympics-1735@gregkh>
 <2025020623-chemo-amends-102a@gregkh>
 <20250206185314-a69d5f40-abd9-4dce-863a-b85e0b4c6c82@linutronix.de>
 <53d57b821c484c3e229686b4643fbf9486e1e150.camel@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <53d57b821c484c3e229686b4643fbf9486e1e150.camel@redhat.com>

On Thu, Feb 06, 2025 at 03:07:59PM -0500, Lyude Paul wrote:
> On Thu, 2025-02-06 at 19:08 +0100, Thomas Weißschuh wrote:
> > > +
> > > +	device_initialize(dev);
> > > +	dev->release = faux_device_release;
> > > +	dev->parent = &faux_bus_root;
> > 
> > I guess nobody will want to hang these off a different parent.
> 
> Oh - this is a good point that slipped my mind, how would we want to handle
> this case? The reason I ask is since we have things like
> drivers/gpu/drm/display/drm_dp_aux_dev.c which currently use the virtual
> device API but iirc do actually assign the DRM device owning the aux device as
> the parent.

Having a parent is fine, I just hadn't found any users of that yet.
I'll go add that option for v4.

thanks,

greg k-h
