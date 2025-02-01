Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88022208A9
	for <linux-kernel@vger.kernel.org>; Sat,  1 Feb 2025 17:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738430344; cv=none; b=H5/Ki96BAFeh+4YOZDcl3w+z7vMWTEmICAScIcc5ZgMqW9zM5oBQToIOLnwoYV29zSWGZDoAq4MlUbHxG5+iGqTks6k44PSuUY7aGVDNtHmWT7qlr4LDdaCp3cIFdqE1rIC7kCdQmi0eSLzAqtN4jR9NkzPS0OGijDdGcLbea3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738430344; c=relaxed/simple;
	bh=P5SMiT6W2VSy1LPpYGAMuHFMpRUAucOiINT/6LBA860=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R2S7OPJ8zYTpd61Hz2wjlKrgCaoT4Pw7sfbawukiqetWjTLFce6a3QBZpkWNrsorkFNDKR8fKWU55nnZe7G7iC/YiSXtKDSCPtxjPkq8fziWHhs57LoJSX7NppASpDBoTxHDFIPHFVrtBppPH7NlTzsYAMMUNLuDseLKH0kO0vY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hid2WSAP; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hid2WSAP"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-54021daa6cbso3231441e87.0
        for <linux-kernel@vger.kernel.org>; Sat, 01 Feb 2025 09:19:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738430340; x=1739035140; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=71bnsC2oO6LHEbwy3diuH2zhR6b0aYnH+9+cp/aJomY=;
        b=hid2WSAPBsjtFELFT6TKfcJpAq/dDyTZk07uPh010kUg5FJynwiU8VBUlrlgkLoy/e
         7qVAJQHEFNX1n3TAkjsc2GNrdKLQjwef5ozigMEWkgs3tekwwxpVSmpJTCYAyYrHym/1
         WrD6iQRc2z4623V8M8qHEUg0Lxx72sqalELkhfOdJcMe9LcbP5HQpmbTH7y5DiN05uSM
         gC3SpDt2vBkZiRqLSAdcr6LtZNw6fjj+28Clv7y/3sxazrP8BXlytuHYxktU9uYMlpoA
         hOBiCxhahZnkJ6hwvsl8DFfTtpa7UHH3nRczTXgkAzbRgvPcxD2sdbLLw3zf5m6BkbDa
         fE0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738430340; x=1739035140;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=71bnsC2oO6LHEbwy3diuH2zhR6b0aYnH+9+cp/aJomY=;
        b=F/YD5eO+T8KgidOeMNIr10thtukCeeTCkdZVWlGar+GFXczgOZMR/mcSqig3M2Bckj
         vd6lc53aQQQKNhTIYYUiwi6QISeT8GSuNvY4vQAt8ia5+1NV7BlqbDtD+NffWrnD2ZGT
         kpGoxTHiA8+Mq3k+rg5cSY4IvYrmqyP+DdD7wm+lovZvHHAJwHvjBsjFgOamNhWDr/74
         1ril9h/4Hi7W8FCKuz6juXg3Qv+HGn8KM2wqDYlXKuIPF3PXQc8ObuIbFXGo7HmC/oVG
         nifN0K7dtUHEYerWF3ubnRYIND3Y00lIIrpT7LWr3c2xIaSByDjbJbIOMB1SiE/Jvfba
         LNTA==
X-Forwarded-Encrypted: i=1; AJvYcCXeljQ2xOtFQiSVN35sOXCSQykGJwQmNUkK5IDgXp88uvWf9tD+RxtVBw1ANw7cdZZzSMeIoUEHjl/vMCY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyE0fWqiQZVomfuOrb9/IvTBmDqVUL99ByOn5+G3fOqSvSw6K/A
	z2AVdF5WGeSU/KU5JGqFDh0kfl7v6PMNRSBbC/ardKzzp/668avVJIkZhqoFKy0=
X-Gm-Gg: ASbGnctgLh0qUaoRM8CdENSSgkFRJDH+NCVPu4KG4ycgeisthGslCuyqe7tyTxd4ZQd
	0gplMfRc4uIfs7zeqyMXwXMFS5n4tFQgiXmsHtehkc4/A5AHC2747BfMiZYQ9DqIcX79w16QsRM
	mpO1F3KxqQZaRs4bwXMZ4fhNVpK4hskXa5+2kjvQdjjfZTOChNfUvlmhBBi+RXSXx77FenJBe5M
	Ul5qUjjWTOrgXEC9Oq15RMJyOz0zVs1eMzYWeQ5z1wYfBJWmCtYJ5XVCOfOhRkxHmL7RprADIrz
	ol60d+gRb3LnxwvY7y2DFnMV5hW0+g1wMtD3/Ih/BoRxV+rwlJjJVPilSX9xpIs/BZ+tLUI=
X-Google-Smtp-Source: AGHT+IGP/gG4Q+cDNWpkoWzbMqHda4mKxSbGl6ubfsg5AbMmMLOWCJBBnITp7IdIj8yWTDNIAVEjVA==
X-Received: by 2002:ac2:42c7:0:b0:540:2ef4:9cf0 with SMTP id 2adb3069b0e04-543e4beac3emr4169598e87.18.1738430340412;
        Sat, 01 Feb 2025 09:19:00 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543ebebea39sm780238e87.224.2025.02.01.09.18.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Feb 2025 09:18:58 -0800 (PST)
Date: Sat, 1 Feb 2025 19:18:56 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, 
	Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, DRI mailing list <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v3 1/1] regmap: Synchronize cache for the page selector
Message-ID: <eyjsejpx7klztr4k7xmrvceosfykyozs736kycdnf5uur5by43@5i5x7tsuxtpg>
References: <a193bcb5-1b35-48ba-801b-925ab2f92d6f@samsung.com>
 <Z4pktkZ1ihfkZjHm@smile.fi.intel.com>
 <Z4ppo8wV3nicOfAQ@smile.fi.intel.com>
 <8a7581e4-6422-4d77-8027-02df0d7da489@samsung.com>
 <Z4qTQ9ypkX6iS1Pl@smile.fi.intel.com>
 <42fe4488-0ff2-4b92-ae11-cce1664a7176@samsung.com>
 <Z4-hMdUUTeQHN5W_@smile.fi.intel.com>
 <6b4cba29-786c-4999-ac1d-27b3e4cea6f8@samsung.com>
 <Z5kJLrE6xOzOKaeb@smile.fi.intel.com>
 <Z5pESDSekep9ChAN@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z5pESDSekep9ChAN@smile.fi.intel.com>

On Wed, Jan 29, 2025 at 05:07:52PM +0200, Andy Shevchenko wrote:
> On Tue, Jan 28, 2025 at 06:43:26PM +0200, Andy Shevchenko wrote:
> > On Tue, Jan 28, 2025 at 05:08:08PM +0100, Marek Szyprowski wrote:
> > > On 21.01.2025 14:29, Andy Shevchenko wrote:
> > > > On Tue, Jan 21, 2025 at 08:33:09AM +0100, Marek Szyprowski wrote:
> > > >> On 17.01.2025 18:28, Andy Shevchenko wrote:
> > > >>> On Fri, Jan 17, 2025 at 05:05:42PM +0100, Marek Szyprowski wrote:
> > > >>>
> > > >>> Does it fail in the same way?
> > > >> Yes, the hw revision is reported as zero in this case: LT9611 revision:
> > > >> 0x00.00.00
> > > > Hmm... This is very interesting! It means that the page selector is a bit
> > > > magical there. Dmitry, can you chime in and perhaps shed some light on this?
> > > >
> > > >>>> Does it mean that there is really a bug in the driver?
> > > >>> Without looking at the datasheet it's hard to say. At least what I found so far
> > > >>> is one page of the I²C traffic dump on Windows as an example how to use their
> > > >>> evaluation board and software, but it doesn't unveil the bigger picture. At
> > > >>> least what I think is going on here is that the programming is not so easy as
> > > >>> just paging. Something is more complicated there.
> > > >>>
> > > >>> But at least (and as Mark said) the most of the regmap based drivers got
> > > >>> the ranges wrong (so, at least there is one bug in the driver).
> > > >> I can do more experiments if this helps. Do you need a dump of all
> > > >> regmap accesses or i2c traffic from this driver?
> > > > It would be helpful! Traces from the failed and non-failed cases
> > > > till the firmware revision and chip ID reading would be enough to
> > > > start with.
> > > 
> > > I'm sorry for the delay, I was a bit busy with other stuff.
> > 
> > No problem and thanks for sharing.
> > 
> > > Here are logs (all values are in hex):
> > > 
> > > next-20250128 (probe broken):
> > > root@target:~# dmesg | grep regmap
> > > [   14.817604] regmap_write reg 80ee <- 1
> > > [   14.823036] regmap_read reg 8100 -> 0
> > > [   14.827631] regmap_read reg 8101 -> 0
> > > [   14.832130] regmap_read reg 8102 -> 0
> > 
> > 
> > 
> > > next-20250128 + 1fd60ed1700c reverted (probe okay):
> > > root@target:~# dmesg | grep regmap
> > > [   13.565920] regmap_write reg 80ee <- 1
> > > [   13.567509] regmap_read reg 8100 -> 17
> > > [   13.568219] regmap_read reg 8101 -> 4
> > > [   13.568909] regmap_read reg 8102 -> 93
> > 
> > Something is missing here. Like we have an identical start and an immediate
> > failure. If you did it via printk() approach, it's probably wrong as my patch
> > uses internal regmap function. Most likely you need to enable trace events
> > for regmap and collect those for let's say 2 seconds:
> > 
> > 	echo 1 > ...trace events...
> > 	modprobe ...
> > 	sleep 2
> > 	echo 0 > ...trace events...
> > 
> > and dump the buffer to a file. It might have though more than needed
> > as some other devices might also use regmap at the same time. I don't remember
> > if the trace events for regmap have a device instance name field which can be
> > used as a filter.
> > 
> > Alternatively you may also try to add a printk() into regmap core, but I don't
> > think it's more practical than trace events.
> 
> Meanwhile, can you test this patch (on top of non-working case)?
> 
> diff --git a/drivers/base/regmap/regmap.c b/drivers/base/regmap/regmap.c
> index 2314744201b4..f799a7a80231 100644
> --- a/drivers/base/regmap/regmap.c
> +++ b/drivers/base/regmap/regmap.c
> @@ -1553,8 +1553,19 @@ static int _regmap_select_page(struct regmap *map, unsigned int *reg,
>  		 * virtual copy as well.
>  		 */
>  		if (page_chg &&
> -		    in_range(range->selector_reg, range->window_start, range->window_len))
> +		    in_range(range->selector_reg, range->window_start, range->window_len)) {
> +			bool bypass, cache_only;
> +
> +			bypass = map->cache_bypass;
> +			cache_only = map->cache_only;
> +			map->cache_bypass = false;
> +			map->cache_only = true;
> +
>  			_regmap_update_bits(map, sel_register, mask, val, NULL, false);
> +
> +			map->cache_bypass = bypass;
> +			map->cache_only = cache_only;
> +		}
>  	}
>  
>  	*reg = range->window_start + win_offset;
> 
> If I understood the case, the affected driver doesn't use case and we actually
> write to the selector register twice which most likely messes up the things.

Unfortunately I can not comment regarding the LT9611UXC itself, the
datasheet that I have here is pretty cryptic, incomplete and partially
written in Mandarin.

This patch though fixes an issue for me too, So:

Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org> # Qualcomm RB1

> But this is only a theory (since we don't have the traces yet).
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 

-- 
With best wishes
Dmitry
