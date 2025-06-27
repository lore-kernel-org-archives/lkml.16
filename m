Received: from fgw22-7.mail.saunalahti.fi (fgw22-7.mail.saunalahti.fi [62.142.5.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1611D12E7E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 04:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750997732; cv=none; b=ZOY1Jsjh3xdDT9u8FGPakrV/6muobtHRBAEGzaFy3dMwUiskqXNvMBeTF1/1Pv/njTXlCu0+oVZyPL92y4k19+L1wUQaOvkbVvS5Vs2OrgAPCFM4nGKKg6HMBx3FQ4D5mFHUPJqLXmdPGlVOJkeSAXGQscRNXgqmOKHW13gsFtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750997732; c=relaxed/simple;
	bh=TqZWZoJ8DMWJrNQMQe3yzhICWYkUUbAv01mUzV5AOPk=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mwZ5TexU8ihxIkzatMdNZlSJz/kvLkrq1epAZIaMNH8WiNIY/+hHa1o9/x3Oo/fJL4LOwIikmDnQR0nfea7UjoOWqVBwcHxbGTq0qADM+snXYz6cn1JGfbqY8nBBUMFLFpOHnl5bYiy0SAGfa+s8A3238WC7M262zaQXXnCC+tU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-26-232.elisa-laajakaista.fi [88.113.26.232])
	by fgw23.mail.saunalahti.fi (Halon) with ESMTP
	id 57e79094-530d-11f0-a9b8-005056bdfda7;
	Fri, 27 Jun 2025 07:15:23 +0300 (EEST)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 27 Jun 2025 07:15:22 +0300
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>
Subject: Re: [PATCH v17] pwm: airoha: Add support for EN7581 SoC
Message-ID: <aF4a2tLzLDOYlw6T@surfacebook.localdomain>
References: <20250625194919.94214-1-ansuelsmth@gmail.com>
 <aF1RIVzVNcdsU1DB@smile.fi.intel.com>
 <685dcf1b.050a0220.2cbe17.6342@mx.google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <685dcf1b.050a0220.2cbe17.6342@mx.google.com>

Fri, Jun 27, 2025 at 12:52:06AM +0200, Christian Marangi kirjoitti:
> On Thu, Jun 26, 2025 at 04:54:41PM +0300, Andy Shevchenko wrote:
> > On Wed, Jun 25, 2025 at 09:49:01PM +0200, Christian Marangi wrote:

...

> > > +	if (refcount_read(&pc->buckets[bucket].used) == 0) {
> > > +		pc->buckets[bucket].period_ticks = period_ticks;
> > > +		pc->buckets[bucket].duty_ticks = duty_ticks;
> > > +		ret = airoha_pwm_apply_bucket_config(pc, bucket,
> > > +						     duty_ticks,
> > > +						     period_ticks);
> > > +		if (ret)
> > > +			return ret;
> > > +
> > > +		refcount_set(&pc->buckets[bucket].used, 1);
> > 
> > What happens if refcount is updated in between? This is wrong use of atomics.
> > 
> > > +	} else {
> > > +		refcount_inc(&pc->buckets[bucket].used);
> > 
> > Ditto.
> > 
> > You probably wanted _inc_and_test() variant.
> 
> The main problem is that adding macro for refcount and atomic is that
> normaly you expect to have parallel ASM code for it to have real aotmic
> OP. Anyway I think I solved it with a simple mutex.
> 
> The usage of refcount here it's not really for atomic but for object
> tracking but refcount doesn't love to initialize from 0 and incremented
> so I have to use this _set and _inc thing.

Indeed, the main use of refcount is to start with 1, when object gets
initialised and free it on 0, hence if there are more users the count
goes up and drops when a user of the resource drops.

> > > +	}

-- 
With Best Regards,
Andy Shevchenko


