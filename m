Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80EE0227E8C
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 07:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744788866; cv=none; b=kY0UP0MFT7DOufg2KrtPmFIRA9HkPbSuxFWdp9HM9I22+ugCsbN87zY1tAFzY5g0QtzR/Z0a9H/Jr085JdbAyba2Ud54ffPWbuTXBOGtGoSxgE7YHAvPaGTMsor6aX7MmsnOLa7zDrNLiz2h6IHeK2H4saAqPs8HHFiJNVCUCDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744788866; c=relaxed/simple;
	bh=Osz8UwWeE7SoEkx8hhEOY9AIQrzeHRMkeYvC/KMmssg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NdH4bANeO5VLroR4/z0zbbJd5Dvxbvc6UZGT2eAFlGKoVhwn9m0QWPRrQsiNw6fGjyNTAo4ZN5h5B6QDWWYM3qV2ZBSpRWAE3SnRFZ2OGVhIRqzsntTsITJrVWNotdWTO0gjIHLI/2iV0zn9p5cb8gIrGuyz8aA3DpCjfeSuE68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=k9RTKt/u; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="k9RTKt/u"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-7fd581c2bf4so5634539a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 00:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744788864; x=1745393664; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9OojZ/Set6ofgNmoLSDBYOLQFH7SYSkSj18BSfmQvXU=;
        b=k9RTKt/uvTR1WeO25aPrI229c1HvXDZofuLiap+ruI3JkoA/nbq6fxCTIUUZe4DZQB
         Z2VrF+lzQeUmdPOGe0qYh79VHj6jnLB/CcnmG5hj1jwLJHHaA5G8pzwslRCmDORUPcMP
         mv2ncRtLlJfvz5n/1l+9NERw5IPD5RFut3RVRM5E6KfbIixxLtluGo+se7AQRY+DBv9q
         EaN2EyBVD/oXrhonMyPWkfvVX/DRkS5DE7fsqrVXMaP9R++w0rgR4z6onWJgd7LrMwYe
         LY2boD/J2CazvI0xDpDHP3XT9nPUrfGGxrsnkWcQecFqKrsg1n6T/lQV2ATfS06dne8B
         siEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744788864; x=1745393664;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9OojZ/Set6ofgNmoLSDBYOLQFH7SYSkSj18BSfmQvXU=;
        b=ANPHjytHsiVOI2x/DRwszIqLQcnpDeOv/kRqH1IUHO7AatWawdEpy2hAorQo1ccEbf
         0mkcnEyKCxcgKvaWSdTJqeSDMd6sY0PHoir9mpMTv+T8Ging4va0PoritbVIpD4GvNj8
         417Isyj/aoFRXHWY7t4XwGKgTvMJ39c1WsClIRCTXUCWzUsyyisNIgii7RiRCpI+Z4Hn
         vgxlCKdOSiXMnNqBRgAZlVLUB9nB5DLzSGD5q04ROksXK0EzcOHCoZeYYk9KxrKTJ3Pu
         tGpE3WSvGJcPuAjMmoi/w08gNjEUXbOMMe1HaH19E9DBEe6wLJcgesVP5/qVZqfGOS4h
         QroQ==
X-Forwarded-Encrypted: i=1; AJvYcCVg/4SWH7w6xZuLibTiWkyzQ/rbCbdnyzTQBcy7GvQzADUQO4jxebYLJnXbPkG5mNFcG2xUh9KdLbbWKIo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFstLGm6RMxMkctxZAAX419uJKohwIAbpRXJpOLtLatJ43yYQ5
	okDNF0soj0GPthVsO3G9Spaj6Vayy0NEtuFwLj2WvQ2AQfEjIG7KCSfgcGaaMls=
X-Gm-Gg: ASbGnctpKfhzT0j6p5HX5ZyeChgkfpeZVjxtQgIPV+cVEYelh9u7l6LRBRlpOyBXSvc
	+To4aoBNV70P5gmFpibPVZ7teDdqd8pXt1W0eJq0HosmtJcnWzhrQCopQn4InP/gXhXDyMS1SE+
	tcrqPvy/zvZHJSa3HIoTcDYV4KYgIIeURnBZB5unmOGQOXhS/8zkeTR8TUVLuLPCK7Xk1iEvSHd
	YW0TiQyginejgJnPsbHU+bcyjmRnQPli8ksoZxurR3gZwFBq8xWcgr0SBU6cofpghxXfwoNDgiL
	hE96CT+lgjX5zv48VXESHTYPpBvKRKgKyBvcazKa1g==
X-Google-Smtp-Source: AGHT+IF5gr7KTNmsoqWboKzNZwhfvZjvETmtD0k891OgOb0tDlIqVA7ofglJmZDsPCASVeystx4Ztg==
X-Received: by 2002:a17:90b:520a:b0:2fe:8282:cb9d with SMTP id 98e67ed59e1d1-3086415c684mr1191209a91.28.1744788863789;
        Wed, 16 Apr 2025 00:34:23 -0700 (PDT)
Received: from localhost ([122.172.83.32])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30861212c3esm872339a91.25.2025.04.16.00.34.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 00:34:23 -0700 (PDT)
Date: Wed, 16 Apr 2025 13:04:20 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: rafael@kernel.org, Marc Zyngier <maz@kernel.org>
Cc: Chenyuan Yang <chenyuan0y@gmail.com>, sven@svenpeter.dev, j@jannau.net,
	alyssa@rosenzweig.io, neal@gompa.dev, marcan@marcan.st,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] cpufreq: apple-soc: Fix possible null pointer dereference
Message-ID: <20250416073420.xrhwnzy22zf6yltm@vireshk-i7>
References: <20250412160518.1824538-1-chenyuan0y@gmail.com>
 <86bjt0l6q4.wl-maz@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86bjt0l6q4.wl-maz@kernel.org>

On 13-04-25, 11:02, Marc Zyngier wrote:
> Irrespective of this, it would be good to describe under which
> circumstances this can occur, because I can't see *how* this can
> trigger. The policy is directly provided by the core code and provide
> its association with a cpu, and is never NULL at the point of init.
> 
> And if it can trigger, why only fix this one particular case?
> Dereferences of policy are all over the map, and would be just as
> wrong.
> 
> So while this is not wrong, I don't think this serves any real
> purpose.

I have applied such patches in the past, considering the same as good
practice. But I do understand your inputs.

And so I tried to see if there is actually a way to trigger this.

- Platform with two cpufreq policies (freq domains) with one CPU in
  each of them.
- Boot the kernel, policies will initialize for both the domains.
- Hotplug out CPU1, that will remove the policy as well.
- Call cpufreq_quick_get(1), this will call the ->get() callback for
  CPU1, for which there is no policy available.

But this is the case only for drivers with `setpolicy` callback, this
shouldn't happen on apple-soc.

I am not sure now if we should just apply this patch to be safe, or
leave it as is. The cpufreq core may change in the future and call the
`get` callback for all drivers.

Rafael, what do you suggest ?

-- 
viresh
