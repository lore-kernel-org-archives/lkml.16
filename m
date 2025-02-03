Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 839D91FF1B6
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 09:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738574370; cv=none; b=XudndodCT9but+JUVY2kcNdVd/ZkSIVGMj+WgXwReJchnolGt0ztVp4D1WVqybNv39AkX9qThKak9K1zee2v30WqFExITV+I8XMWEg0pgA6KbU5cS+FDBLvKjFmjIAqucDSaNHygCd90r5mEJpbO8MQMtXmsU/PaWreK83JwX5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738574370; c=relaxed/simple;
	bh=Xgv9cXby25MnVXgPbDZH0JSH1bW2Lin3jEG1CUba0Us=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FoorllbBON1Fh/9gtub9mYsyDuYtpsjhMApZCb4Qrt5ah9cGFqYLcH5717ugeetQ0BpaQgT8p2+m0BoLC3SaQGYOW/f41mg1P+DvTg4nBUAnaMEupDDrdSF1/FdKnR2tKwEztT7i/AJNjafWu1R06H1hjDDSwWyVVbklCdl08sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EBNGj2n2; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EBNGj2n2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738574369; x=1770110369;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Xgv9cXby25MnVXgPbDZH0JSH1bW2Lin3jEG1CUba0Us=;
  b=EBNGj2n2CLzAZmLxxaaOf9R1g2/mrNemDgzRKtasapRDaaFqFGE4Yl/h
   oOTsjLete0hOpBHiexVHtkz3wJNO8HqOaFJpzi/SwC/ipUnTsC7yd9dcF
   AGgUuIGQzBcAitsgM9Uf07zR52MBYuB5EXmjvYFasSpkEePn1kOaXL2cd
   WtaQ8VzT9bxfmd1UVViuv8GRcdIzUA5Edj5zg9X31cmWACPIoA28yJ1Y3
   SBDVSJU1fzxtM+8Ty+0amtwInGjww677mCb+q0VCMRgIxKQZgvAcend4q
   ZU7gF0S1MYpxs504Mh7SyYURNyIa1IQ1f3Wi47PQgtOtYA2vJBj7vj6z7
   Q==;
X-CSE-ConnectionGUID: i+nvMVsVSF2/Pys5dIkwmw==
X-CSE-MsgGUID: eKo6ZDGuT+ad03j4dU6A7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11334"; a="50448244"
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="50448244"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 01:19:28 -0800
X-CSE-ConnectionGUID: +bqc7yNkQ06rdEd5R5s9WA==
X-CSE-MsgGUID: XE2gxrdCTdixbMGJbvgpAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="110806587"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 01:19:27 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tesbz-00000007maz-0agV;
	Mon, 03 Feb 2025 11:19:23 +0200
Date: Mon, 3 Feb 2025 11:19:22 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
	Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	DRI mailing list <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v3 1/1] regmap: Synchronize cache for the page selector
Message-ID: <Z6CKGu7URC1iGOVO@smile.fi.intel.com>
References: <Z4pktkZ1ihfkZjHm@smile.fi.intel.com>
 <Z4ppo8wV3nicOfAQ@smile.fi.intel.com>
 <8a7581e4-6422-4d77-8027-02df0d7da489@samsung.com>
 <Z4qTQ9ypkX6iS1Pl@smile.fi.intel.com>
 <42fe4488-0ff2-4b92-ae11-cce1664a7176@samsung.com>
 <Z4-hMdUUTeQHN5W_@smile.fi.intel.com>
 <6b4cba29-786c-4999-ac1d-27b3e4cea6f8@samsung.com>
 <Z5kJLrE6xOzOKaeb@smile.fi.intel.com>
 <Z5pESDSekep9ChAN@smile.fi.intel.com>
 <eyjsejpx7klztr4k7xmrvceosfykyozs736kycdnf5uur5by43@5i5x7tsuxtpg>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <eyjsejpx7klztr4k7xmrvceosfykyozs736kycdnf5uur5by43@5i5x7tsuxtpg>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Sat, Feb 01, 2025 at 07:18:56PM +0200, Dmitry Baryshkov wrote:
> On Wed, Jan 29, 2025 at 05:07:52PM +0200, Andy Shevchenko wrote:
> > On Tue, Jan 28, 2025 at 06:43:26PM +0200, Andy Shevchenko wrote:
> > > On Tue, Jan 28, 2025 at 05:08:08PM +0100, Marek Szyprowski wrote:
> > > > On 21.01.2025 14:29, Andy Shevchenko wrote:
> > > > > On Tue, Jan 21, 2025 at 08:33:09AM +0100, Marek Szyprowski wrote:
> > > > >> On 17.01.2025 18:28, Andy Shevchenko wrote:
> > > > >>> On Fri, Jan 17, 2025 at 05:05:42PM +0100, Marek Szyprowski wrote:
> > > > >>>
> > > > >>> Does it fail in the same way?
> > > > >> Yes, the hw revision is reported as zero in this case: LT9611 revision:
> > > > >> 0x00.00.00
> > > > > Hmm... This is very interesting! It means that the page selector is a bit
> > > > > magical there. Dmitry, can you chime in and perhaps shed some light on this?
> > > > >
> > > > >>>> Does it mean that there is really a bug in the driver?
> > > > >>> Without looking at the datasheet it's hard to say. At least what I found so far
> > > > >>> is one page of the I²C traffic dump on Windows as an example how to use their
> > > > >>> evaluation board and software, but it doesn't unveil the bigger picture. At
> > > > >>> least what I think is going on here is that the programming is not so easy as
> > > > >>> just paging. Something is more complicated there.
> > > > >>>
> > > > >>> But at least (and as Mark said) the most of the regmap based drivers got
> > > > >>> the ranges wrong (so, at least there is one bug in the driver).
> > > > >> I can do more experiments if this helps. Do you need a dump of all
> > > > >> regmap accesses or i2c traffic from this driver?
> > > > > It would be helpful! Traces from the failed and non-failed cases
> > > > > till the firmware revision and chip ID reading would be enough to
> > > > > start with.
> > > > 
> > > > I'm sorry for the delay, I was a bit busy with other stuff.
> > > 
> > > No problem and thanks for sharing.
> > > 
> > > > Here are logs (all values are in hex):
> > > > 
> > > > next-20250128 (probe broken):
> > > > root@target:~# dmesg | grep regmap
> > > > [   14.817604] regmap_write reg 80ee <- 1
> > > > [   14.823036] regmap_read reg 8100 -> 0
> > > > [   14.827631] regmap_read reg 8101 -> 0
> > > > [   14.832130] regmap_read reg 8102 -> 0
> > > 
> > > 
> > > 
> > > > next-20250128 + 1fd60ed1700c reverted (probe okay):
> > > > root@target:~# dmesg | grep regmap
> > > > [   13.565920] regmap_write reg 80ee <- 1
> > > > [   13.567509] regmap_read reg 8100 -> 17
> > > > [   13.568219] regmap_read reg 8101 -> 4
> > > > [   13.568909] regmap_read reg 8102 -> 93
> > > 
> > > Something is missing here. Like we have an identical start and an immediate
> > > failure. If you did it via printk() approach, it's probably wrong as my patch
> > > uses internal regmap function. Most likely you need to enable trace events
> > > for regmap and collect those for let's say 2 seconds:
> > > 
> > > 	echo 1 > ...trace events...
> > > 	modprobe ...
> > > 	sleep 2
> > > 	echo 0 > ...trace events...
> > > 
> > > and dump the buffer to a file. It might have though more than needed
> > > as some other devices might also use regmap at the same time. I don't remember
> > > if the trace events for regmap have a device instance name field which can be
> > > used as a filter.
> > > 
> > > Alternatively you may also try to add a printk() into regmap core, but I don't
> > > think it's more practical than trace events.
> > 
> > Meanwhile, can you test this patch (on top of non-working case)?
> > 
> > diff --git a/drivers/base/regmap/regmap.c b/drivers/base/regmap/regmap.c
> > index 2314744201b4..f799a7a80231 100644
> > --- a/drivers/base/regmap/regmap.c
> > +++ b/drivers/base/regmap/regmap.c
> > @@ -1553,8 +1553,19 @@ static int _regmap_select_page(struct regmap *map, unsigned int *reg,
> >  		 * virtual copy as well.
> >  		 */
> >  		if (page_chg &&
> > -		    in_range(range->selector_reg, range->window_start, range->window_len))
> > +		    in_range(range->selector_reg, range->window_start, range->window_len)) {
> > +			bool bypass, cache_only;
> > +
> > +			bypass = map->cache_bypass;
> > +			cache_only = map->cache_only;
> > +			map->cache_bypass = false;
> > +			map->cache_only = true;
> > +
> >  			_regmap_update_bits(map, sel_register, mask, val, NULL, false);
> > +
> > +			map->cache_bypass = bypass;
> > +			map->cache_only = cache_only;
> > +		}
> >  	}
> >  
> >  	*reg = range->window_start + win_offset;
> > 
> > If I understood the case, the affected driver doesn't use case and we actually
> > write to the selector register twice which most likely messes up the things.
> 
> Unfortunately I can not comment regarding the LT9611UXC itself, the
> datasheet that I have here is pretty cryptic, incomplete and partially
> written in Mandarin.
> 
> This patch though fixes an issue for me too, So:
> 
> Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org> # Qualcomm RB1

Thank you, guys, for reporting an testing, but it seems the simple problem
to solve requires a lot of changes to be done without regressions
(this fix on fix makes a regression to those who have cache enabled), which
means that for now I propose to revert it (or drop) if possible, Mark,
what is your preference?

> > But this is only a theory (since we don't have the traces yet).

-- 
With Best Regards,
Andy Shevchenko


