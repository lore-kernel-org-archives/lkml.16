Received: from fgw21-7.mail.saunalahti.fi (fgw21-7.mail.saunalahti.fi [62.142.5.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D8CC2C3251
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 21:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.82
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748899636; cv=none; b=XGdI9qchO2TSAAtm/w+Z29zoHgkvjm7HdvIwUEOrbXP3KiyaBX9PU3zA6GacDmsjCzs1qmKnLOsPn5X+/NCCNadU+xNETBtJW6Bde8Z+lYt+LT9TnU6yZ4PnhmkOjkywX166Kn8yKhwgePQDnGpwq4bWwVy7+Vxg39FaqZ0y3N8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748899636; c=relaxed/simple;
	bh=jNUNQAqQgPC6l0XchUq2j78f67t3HtqKvRqBBAoRDbU=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KPwwXIFZD4V1nVqo8wCvOq//KtZQ2K/FxJhjfYTF5Qj72JFP9r5v7uCiG2vGHVVDijonF9Q6uUPa+bgkBFzYv5hygdJrykepm7Gli0jhaOxlFoj/Fawp5QCgiWtH51riCHphXfw3/cXpE/3BNCBEjVP45tFvIaOYBKiYEJMhTjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-26-232.elisa-laajakaista.fi [88.113.26.232])
	by fgw23.mail.saunalahti.fi (Halon) with ESMTP
	id 220d7b81-3ff8-11f0-a94d-005056bdfda7;
	Tue, 03 Jun 2025 00:25:41 +0300 (EEST)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 3 Jun 2025 00:25:40 +0300
To: andriy.shevchenko@linux.intel.com
Cc: Andy Shevchenko <andy@kernel.org>,
	Jonathan Santos <Jonathan.Santos@analog.com>,
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-acpi@vger.kernel.org, nuno.sa@analog.com,
	Michael.Hennerich@analog.com, marcelo.schmitt@analog.com,
	jic23@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, marcelo.schmitt1@gmail.com,
	linus.walleij@linaro.org, brgl@bgdev.pl, lgirdwood@gmail.com,
	broonie@kernel.org, dlechner@baylibre.com, rafael@kernel.org,
	djrscally@gmail.com
Subject: Re: [PATCH v9 09/12] iio: adc: ad7768-1: add support for
 Synchronization over SPI
Message-ID: <aD4WndkKGIWVVWx6@surfacebook.localdomain>
References: <cover.1748447035.git.Jonathan.Santos@analog.com>
 <27cccb51cc56f1bb57cb06d279854a503d779e25.1748447035.git.Jonathan.Santos@analog.com>
 <aDnuvAdkcTAP2tMt@smile.fi.intel.com>
 <aD3cK5PioN7Rw3pP@JSANTO12-L01.ad.analog.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aD3cK5PioN7Rw3pP@JSANTO12-L01.ad.analog.com>

Mon, Jun 02, 2025 at 02:15:23PM -0300, Jonathan Santos kirjoitti:
> On 05/30, Andy Shevchenko wrote:
> > On Thu, May 29, 2025 at 07:50:29PM -0300, Jonathan Santos wrote:

...

> > > +static int ad7768_trigger_sources_sync_setup(struct device *dev,
> > > +					     struct fwnode_handle *dev_fwnode,
> > > +					     struct ad7768_state *st)
> > > +{
> > > +	struct fwnode_reference_args args;
> > > +
> > > +	struct fwnode_handle *fwnode __free(fwnode_handle) =
> > > +		fwnode_find_reference_args(dev_fwnode, "trigger-sources",
> > > +					   "#trigger-source-cells", 0,
> > > +					   AD7768_TRIGGER_SOURCE_SYNC_IDX, &args);
> > 
> > I don't see how args are being used. This puts in doubt the need of the first
> > patch.
> 
> If the wrapper is the issue, maybe it is better doing this instead?
> 
> static int ad7768_trigger_sources_sync_setup(struct device *dev,
> 					     struct fwnode_handle *dev_fwnode,

Name it fwnode...

> 					     struct ad7768_state *st)
> {
> 	struct fwnode_reference_args args;
> 	struct fwnode_handle *fwnode __free(fwnode_handle) = NULL;

...and this one something like 'ref'. Also I'm not sure the __free() will do
what you expect from it.

> 	int ret;
> 
> 	ret = fwnode_property_get_reference_args(dev_fwnode, "trigger-sources",
> 						 "#trigger-source-cells", 0,
> 						 AD7768_TRIGGER_SOURCE_SYNC_IDX, &args);
> 	if (ret)
> 		return ret;
> 
> 	fwnode = args.fwnode;

Yes, please. This looks better.

> > > +	/* First, try getting the GPIO trigger source */
> > > +	if (fwnode_device_is_compatible(fwnode, "gpio-trigger")) {
> > > +		st->gpio_sync_in = devm_fwnode_gpiod_get_index(dev, fwnode,
> > > +							       NULL,
> > > +							       0,
> > > +							       GPIOD_OUT_LOW,
> > > +							       "sync-in");
> > > +		return PTR_ERR_OR_ZERO(st->gpio_sync_in);
> > > +	}
> > > +
> > > +	/*
> > > +	 * TODO: Support the other cases when we have a trigger subsystem
> > > +	 * to reliably handle other types of devices as trigger sources.
> > > +	 *
> > > +	 * For now, return an error message. For self triggering, omit the
> > > +	 * trigger-sources property.
> > > +	 */
> > > +	return dev_err_probe(dev, -EOPNOTSUPP, "Invalid synchronization trigger source\n");
> > > +}
> 
> Then we can get rid of the first patch.

-- 
With Best Regards,
Andy Shevchenko


