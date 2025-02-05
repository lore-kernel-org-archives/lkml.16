Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CC0C21C180;
	Wed,  5 Feb 2025 05:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738734793; cv=none; b=LNMFEpqCsxNGOTgwp8auoFtpYSIAO3ySO5U7NZVEp6CR/P+2yrIZIaLW/ylOesuORU2S0pEA1rMSaHRbh/8qq2Ls1OW+KTuXnECHNhcb3Dhj9GnZPOMajaP4DnnXs2FxAyXfS+FQHkSoS5mpSF2AMlFuyKlDvnURfVkqn3Y2h5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738734793; c=relaxed/simple;
	bh=8mwSHqZQKhJOlaXESW0xdhEaUn92ll4wFZkP/ap6cgI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EXxarMp0bMsaoMfCP9pibVOs3duUZzW/eIG5Y7On7OlipTaWOeBQrk8AaKmKpaS8wefJzM/NcLFJbTWGbmSar8c5xO0mpV0eZ7/hCMTR2tOGn360MaYtTPnzIPtEKbDXmz06moXl2mihyCyzU5ElMgkZQ1X3ObSong29qH5H1EM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=VlfG/DEF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="VlfG/DEF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C801BC4CED1;
	Wed,  5 Feb 2025 05:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1738734792;
	bh=8mwSHqZQKhJOlaXESW0xdhEaUn92ll4wFZkP/ap6cgI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VlfG/DEFprwAW7T8CFJ7mKnVsyCA2qqyyoncwqpW65blJmNDol3pD/Zn64mSpc4IF
	 VbyRIZQF/up8iUaiHt+EVu5FRAG0XUpQLw8URJ3oOThoimi4aChEyo6ihY8R3gSkbu
	 Yp49Q+JjhPCLO+YdPvv/wf++mfkjcgXwxxcGTwcA=
Date: Wed, 5 Feb 2025 06:53:09 +0100
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
Message-ID: <2025020518-outcome-harbor-6281@gregkh>
References: <2025020421-poster-moisture-534b@gregkh>
 <2025020424-retrain-recharger-407c@gregkh>
 <fd6250102ea9d869448e7a40a60a02f8b167d4ac.camel@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fd6250102ea9d869448e7a40a60a02f8b167d4ac.camel@redhat.com>

On Tue, Feb 04, 2025 at 06:10:36PM -0500, Lyude Paul wrote:
> OK I definitely should have waited to write the actual bindings before review
> - sorry! There was one other small thing I ended up noticing:
> 
> On Tue, 2025-02-04 at 12:09 +0100, Greg Kroah-Hartman wrote:
> > diff --git a/include/linux/device/faux.h b/include/linux/device/faux.h
> > new file mode 100644
> > index 000000000000..2c8ae5bd7ae8
> > --- /dev/null
> > +++ b/include/linux/device/faux.h
> > @@ -0,0 +1,31 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +/*
> > + * Copyright (c) 2025 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > + * Copyright (c) 2025 The Linux Foundation
> > + *
> > + * A "simple" faux bus that allows devices to be created and added
> > + * automatically to it.  This is to be used whenever you need to create a
> > + * device that is not associated with any "real" system resources, and do
> > + * not want to have to deal with a bus/driver binding logic.  It is
> > + * intended to be very simple, with only a create and a destroy function
> > + * available.
> > + */
> > +#ifndef _FAUX_DEVICE_H_
> > +#define _FAUX_DEVICE_H_
> > +
> > +#include <linux/device.h>
> > +
> > +struct faux_device {
> > +	struct device dev;
> > +};
> > +#define to_faux_device(x) container_of_const((x), struct faux_device, dev)
> > +
> > +struct faux_driver_ops {
> > +	int (*probe)(struct faux_device *faux_dev);
> > +	void (*remove)(struct faux_device *faux_dev);
> > +};
> > +
> > +struct faux_device *faux_device_create(const char *name, struct faux_driver_ops *faux_ops);
> > +void faux_device_destroy(struct faux_device *faux_dev);
> 
> Should we add faux_get_drvdata()/faux_set_drvdata() since we've got a
> probe/remove function? Doesn't really look like the platform driver equivalent
> does mcuh, but I assume just having an inline function for this would make
> things a little less confusing for users.

You already have a reference counted object returned to you, why do you
need to increment/decrement it again?  All of the users I've found in
the kernel so far didn't need that, do you have a specific example where
it would be useful?

I'll be glad to add it, I just didn't think anyone would ever call it.

thanks,

greg k-h
