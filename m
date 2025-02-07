Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7561192D77;
	Fri,  7 Feb 2025 09:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738919710; cv=none; b=HdMBFpWA9wN3C0M5/lPP5MONUssyZqTQD9C7My/zL50DkNuDke+65Q1ARkryFvnpsalQah5E+TpSGgGmeWDun1lVhCf7DPmKszjwel3ckhBRi40vFwnpPaoG1flzb0f47RV85FCEsIOqE/NRDRlnHZMLozdN+G1SuUA7GIwrsFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738919710; c=relaxed/simple;
	bh=9AqNrbdvIP8oserBpCnBqRLo4RX/LKTDbq+VMX0h7GI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oShdIFUo9a1FqX/Dh7Z0JGVANldMIvi91FTEqNH8vGWb/jgHGe/WjPozq0colaT3c4dzdCqeGLQpQal9yASSWPdL5CRwl2wEuZn61pho/XwjVZdyaxf+/+f3UcNuwa5D9mAghijWnRvPdUkegV2fDRZZdTfl2Av5jqthIuEf7KY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=2mkBBXud; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="2mkBBXud"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92DA8C4CED1;
	Fri,  7 Feb 2025 09:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1738919709;
	bh=9AqNrbdvIP8oserBpCnBqRLo4RX/LKTDbq+VMX0h7GI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=2mkBBXudH+DzeMvbZMg1Ayl0THZVRIA7Xbqw7k/3P49FYhgN58Vrebem8tT4/achQ
	 YOmQVIuK2MrwX8cbQPb+wFVv1X1aY/Lx0fZhxNaEvlLfUAyat7p6/kx4P/1y2ZO2yE
	 gMj2adknK20ZqgLvKxcwH9Fz/+25ASFbcuMYO0fA=
Date: Fri, 7 Feb 2025 10:15:05 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
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
Subject: Re: [PATCH v3 1/8] driver core: add a faux bus for use when a simple
 device/bus is needed
Message-ID: <2025020742-overprice-december-f68e@gregkh>
References: <2025020620-skedaddle-olympics-1735@gregkh>
 <2025020623-chemo-amends-102a@gregkh>
 <20250206185314-a69d5f40-abd9-4dce-863a-b85e0b4c6c82@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250206185314-a69d5f40-abd9-4dce-863a-b85e0b4c6c82@linutronix.de>

On Thu, Feb 06, 2025 at 07:08:18PM +0100, Thomas Weiﬂschuh wrote:
> On Thu, Feb 06, 2025 at 06:38:15PM +0100, Greg Kroah-Hartman wrote:
> > Many drivers abuse the platform driver/bus system as it provides a
> > simple way to create and bind a device to a driver-specific set of
> > probe/release functions.  Instead of doing that, and wasting all of the
> > memory associated with a platform device, here is a "faux" bus that
> > can be used instead.
> > 
> > Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> > Reviewed-by: Danilo Krummrich <dakr@kernel.org>
> > Reviewed-by: Lyude Paul <lyude@redhat.com>
> 
> Some tiny nitpicks below, but still:
> 
> Reviewed-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>

Thanks!

> > +#include <linux/err.h>
> > +#include <linux/init.h>
> > +#include <linux/slab.h>
> > +#include <linux/string.h>
> > +#include <linux/container_of.h>
> > +#include <linux/device/faux.h>
> > +#include "base.h"
> 
> Weird order.

I don't believe in any specific header file ordering, that's done by
maintainers for other reasons to see if people are paying attention in
reviews :)

> > +	struct device *dev;
> > +	struct faux_object *faux_obj;
> > +	struct faux_device *faux_dev;
> > +	int name_size;
> > +	int ret;
> > +
> > +	name_size = strlen(name);
> > +	if (name_size > MAX_FAUX_NAME_SIZE)
> > +		return NULL;
> > +
> > +	faux_obj = kzalloc(sizeof(*faux_obj) + name_size + 1, GFP_KERNEL);
> 
> The name is not actually stored in the object anymore.

Ick, you are right, I'll go clean that up.

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
> 
> #include <linux/container_of.h>

This is the second time it's come up, I'll fix it up :)

thanks again for the review,

greg k-h
