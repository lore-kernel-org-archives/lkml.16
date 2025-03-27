Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D449320B209
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 08:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743065863; cv=none; b=kkEKbD14gEIeYQ3zUBwAAKK4juZOyDvJKkaQxQ2kOcQYPJZ7iadX26fpGh7yiyc5lSbt3iL46IlpB3bSo6NbPvxmWiPhNm5mRtRXF7jv1I6RDkhXlHopbSEBfOvkpVy5A3LYRmBsS/kv5s3Rv0F5CkH3Z/+PZPzJYj6gviZImYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743065863; c=relaxed/simple;
	bh=zA3DMC1VmWmNMDN8cvaRBASwF4IuKwVTadBoBZ7jbhg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ya/80zRDxMIzP1A+RlboAlkuVmaZRNvv8nPo3J72mpJrpVdJiKAFRN2UrsW+f4/WxPNW0/g6th4d5f1/yICYT1SLKQXhYdItwRrtVxy3P0dQrhdxMVyHecwCkUBNe0vChYjSoGBQyvECk5gIvUh5rtp9cptBQUcwxdOMexAmBYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=LXWs4mA0; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="LXWs4mA0"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-39ac8e7688aso495992f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 01:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1743065859; x=1743670659; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ILDVNVv1RvawRizYUQVDbq/vojCQOenZ2+2HfMuJMPA=;
        b=LXWs4mA0uf+uDk4bcBJAuIDVZK93dzIF36ZSSclJol+62HdH2bDQ2uM5N48zBSoDD0
         BXhU7/aqYgtc3XWyWQcwoO9X2nkxXNfnxleeWmPaidYraeGHPUUAvgG7IBCElLSluP/l
         TSgnIjfmM8/D0OY2KLboLc/51XGXtLjAS3s+m+C0tW6UZGsQ8pZRJcCxHiu44RfD4un5
         aXmeq6eBNFU0Bk+PkRRyqmxV0mIvpBugD2nXrwApqbW71MYo9dg6RxZJVZP5oitnPRKs
         M24NVse44XDvw3UYqpwRgfmxrJV0bJtgr/WZV6YIdfgsHOquzi5p1HdhdXN+t3Rk6Dg6
         AXaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743065859; x=1743670659;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ILDVNVv1RvawRizYUQVDbq/vojCQOenZ2+2HfMuJMPA=;
        b=a9KZMMaBvc4fbJ1JBwlkqikcj+5WXEZJt5DvYmsNsLIbUa8mNpScyKHsK26I5+4vsl
         G9cQlteXjt+FDOA8ublXJuU57sOrh8d/RA+H06LavSjV4nHSwtg4yl8UnVV7V0k082v+
         RLiLDSAGnhT0ja9gKDjS7g0kndqJkm+OwQ3M7zBQqhaemEkgCeWIs84qseQ1vKgYDumu
         eRKlrUtigZWsqJDsQzUMX99Y9bsAoQuvctH6u2KIX/kjfYpur7X4DT/xh8Mjwr4Oydg2
         ImIDPZ2G5kuXFmQbTgMxNM2PX0d0S4VDGO65Lc0d0eJWu3FW62pndYOa2PG2kHnnz51A
         zOgw==
X-Forwarded-Encrypted: i=1; AJvYcCWKL5phDgBX8WHE1qjnqx75Gn0vFk0p8IJuFYTkevuwEKsanwDqN/iQgPFdBR0mjDzfUYShLte8+5ekmn0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYi4h3+sUgQLI0Eg31D4kZfaOcM3xGETn3xgJH5zoK0o19ARX8
	AzgYHoZutsMGwUBhqe098xn8iH93EnSZcITo5a048zvlvp5BGcKnv7PhkfPRtYI=
X-Gm-Gg: ASbGncvP1O0gDnJ9G/FY6F0XJ5wmE64WIiP0h+wIZavfqMrNxzWFTP/22ZlQQvG1Fr0
	CE5RrCuHS9/tgDdvyUu4Q7FOpwBiJgXHqjsFQWxqQ+RJM8XbpuvV/TfMTJW0/RoVmVhmo5pdn2g
	mS673w2qr+eHLpzy4XqmC/SVktlJTAcxkbg4/x8hvjQsp7g50Yq/lSjFeWC/L4Z/AOkvWuLHGDy
	fSPun+t93zDVidpnEqSCZTMXIYZUO+JU00tTJ1B4kSBQuWXFCbvDtK3PsSCOr6qirXsILW317jn
	sQDUjoUMtkUasyujokFSRQL9UQGGbhJyDsp1a5VkwcmppJGm7nRmYKpFf8FbO2U2WluYLky7r9b
	5ybbetKJu8pauGKGyLsc=
X-Google-Smtp-Source: AGHT+IF831tQlelv85SsABv3DgsXTx7KGpQ21LJbgFu8q9NZS/DONYGdNcdiUm3qsfAnp3/ISEkoUA==
X-Received: by 2002:a05:6000:188c:b0:399:737f:4df4 with SMTP id ffacd0b85a97d-39ad17583c0mr1910197f8f.28.1743065859078;
        Thu, 27 Mar 2025 01:57:39 -0700 (PDT)
Received: from archlinux (host-87-14-238-193.retail.telecomitalia.it. [87.14.238.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9efca6sm19475766f8f.93.2025.03.27.01.57.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 01:57:38 -0700 (PDT)
Date: Thu, 27 Mar 2025 09:56:26 +0100
From: Angelo Dureghello <adureghello@baylibre.com>
To: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
Cc: Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, 
	Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, 
	Jonathan Corbet <corbet@lwn.net>, Olivier Moysan <olivier.moysan@foss.st.com>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, linux-iio@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] iio: dac: ad3552r-hs: add support for internal ramp
Message-ID: <yxhvtline3ey3ekybqfe3k4y4sm6746wpqwpydxv2brryironl@u2ezr3sryqxs>
References: <20250321-wip-bl-ad3552r-fixes-v1-0-3c1aa249d163@baylibre.com>
 <20250321-wip-bl-ad3552r-fixes-v1-4-3c1aa249d163@baylibre.com>
 <Z-R3E23hWiUKDc6q@debian-BULLSEYE-live-builder-AMD64>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z-R3E23hWiUKDc6q@debian-BULLSEYE-live-builder-AMD64>

On 26.03.2025 18:52, Marcelo Schmitt wrote:
> Hello Angelo,
> 
> Patch looks good to me.
> One minor comment bellow.
> 
> On 03/21, Angelo Dureghello wrote:
> > From: Angelo Dureghello <adureghello@baylibre.com>
> > 
> > The ad3552r can be feeded from the HDL controller by an internally
> > generated 16bit ramp, useful for debug pourposes. Add debugfs a file
> > to enable or disable it.
> > 
> > Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
> > ---
> >  drivers/iio/dac/ad3552r-hs.c | 106 ++++++++++++++++++++++++++++++++++++++++---
> >  1 file changed, 100 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/iio/dac/ad3552r-hs.c b/drivers/iio/dac/ad3552r-hs.c
> > index 37397e188f225a8099745ec03f7c604da76960b1..41fe78d982a68980db059b095fc27b37ea1a461b 100644
> > --- a/drivers/iio/dac/ad3552r-hs.c
> > +++ b/drivers/iio/dac/ad3552r-hs.c
> > @@ -7,6 +7,7 @@
> ...
> > +
> > +static ssize_t ad3552r_hs_write_data_source(struct file *f,
> > +					    const char __user *userbuf,
> > +					    size_t count, loff_t *ppos)
> > +{
> > +	struct ad3552r_hs_state *st = file_inode(f)->i_private;
> > +	char buf[64];
> > +	int ret;
> > +
> > +	ret = simple_write_to_buffer(buf, sizeof(buf) - 1, ppos, userbuf,
> > +				     count);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	buf[count] = 0;
> Shouldn't it be
> 	buf[count] = '\0';

Why ? I am zero-terminating the string properly.

> ?

Regards,
angelo
