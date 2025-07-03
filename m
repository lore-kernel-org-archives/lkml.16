Received: from fgw20-7.mail.saunalahti.fi (fgw20-7.mail.saunalahti.fi [62.142.5.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81E9E28D831
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 08:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751529623; cv=none; b=M/PZS2y0AM146KSj7LpuRHz42uT37einuPMsdSKl5FK6cuFr+I5pbR8buVjfEuUslYsKarySTz4rmi+gJWZCL6Y6Sp0/EQDYPctPloXKOWo54Y8WqFUhhoVfd/lQqV+AXZaH4VwkZc3Yh26xiU+jJkm27OCz1XZ6OE8RFuMhQzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751529623; c=relaxed/simple;
	bh=eNXha8VcPCqxvSPbnOWlzIBa3iPzaXkNKo/ZQv+7GH8=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BA9aizNx4hL+7FvCUWa9ZaoFZk1vjceLlq0sal8vbG+tHcX5eKRZxt8auTLTtWiy2mjoM3YAJXhZu9gd5yj4GL5kw04NMvUUpdKRVOCWO9tiXy4atDDbL4OnRsmT5hn19UVxE7ggfkiGM4byoMCzVn2iuMqKyBFMxFMQciJZKsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-26-232.elisa-laajakaista.fi [88.113.26.232])
	by fgw21.mail.saunalahti.fi (Halon) with ESMTP
	id b8dddcc2-57e3-11f0-9796-005056bdd08f;
	Thu, 03 Jul 2025 11:00:02 +0300 (EEST)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 3 Jul 2025 11:00:01 +0300
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
	"Colin King (gmail)" <colin.i.king@gmail.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>, nuno.sa@analog.com,
	Andy Shevchenko <andy@kernel.org>,
	Gustavo Bastos <gustavobastos@usp.br>,
	Andrew Ijano <andrew.ijano@gmail.com>,
	Julien Stephan <jstephan@baylibre.com>, linux-iio@vger.kernel.org,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: iio: accel: sca3000: dead code issue
Message-ID: <aGY4gbEW7wJ8bhjh@surfacebook.localdomain>
References: <1c1e39cb-5fe0-46b3-898e-c65bbb3beb30@gmail.com>
 <aGUh7uXenHc7NYB2@smile.fi.intel.com>
 <20250702164022.000027e8@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250702164022.000027e8@huawei.com>

Wed, Jul 02, 2025 at 04:40:22PM +0100, Jonathan Cameron kirjoitti:
> On Wed, 2 Jul 2025 15:11:26 +0300
> Andy Shevchenko <andriy.shevchenko@intel.com> wrote:
> > On Wed, Jul 02, 2025 at 10:00:55AM +0100, Colin King (gmail) wrote:
> > 
> > >                 ret = spi_w8r8(st->us,
> > > SCA3000_READ_REG(SCA3000_REG_BUF_COUNT_ADDR));
> > >   
> > > >>>  the call to spi_w8r8 returns 0 on success or -ve on an error  
> > 
> > Where did you get this from, please?  Any link to elixir or Git repo?
> 
> Hmm.  Just for reference the docs of spi_w8r8 are:
> 
> * Return: the (unsigned) eight bit number returned by the
> * device, or else a negative error code.
> 
> Not 0 on success (well not unless it is zero.

Right. My point was that the comment is misleading. With the adjusted comment
the rest becomes immediately clear.

> So the check indeed looks wrong as should be if (ret < 0)

Exactly. Report is valid, the comment in the analysis is not.

> https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git/commit/?h=testing&id=ca66d8208762492df8442a503db568d9aab65f2f
> It's in my tree.

I was asking for the link to the spi_w8r8() where it's written like '0 on
success and -ve on error'. Not needed anymore as you cited the documentation.

> I'll drop the patch when I'm on the right machine.  Andrew, could
> you do a new version fixing this up?  If not can make the changes
> but will be at least the weekend before I get a chance.
> 
> Looks like there are a couple of instances of this.
> 
> > >                 if (ret)
> > >                         goto error_ret;  

-- 
With Best Regards,
Andy Shevchenko


