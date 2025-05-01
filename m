Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC09B19F101
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 13:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746106628; cv=none; b=YKQdXTWP2d3ByZi70bkepI4ACNMuIkQ1cfg6ZwSxpUg26Ik97pdBtdDxKCiaUS7kS23eZBhSOC3UJ/OHqFm1VKpTwuc4+0N7q8JxEfPjxyzAFnwk26YevABUoYh+YJC4+lX2zrzeHynmZfp8dA7DBYfDJk1IPgFvQWo2sHDGEkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746106628; c=relaxed/simple;
	bh=9MNpS1gJG0qyHRf2FJfHx17kDP9N8N1hNQWavkpaHFU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S4t7aeR0aKkbpKOfhqFGdmnDZPjMnKcffC/LjiO13XHaKi/txn1+Mc0N32NXatjhAgHU/C39W17ZA5LuuM2p+eRvH+7Z8b2FtBV1YVUMVy0JTCGP3Myl9MXNiM5emIudexSvcNf0hXMUt+P9Jcsh20U7R8xQATMGn8YYdRBiIjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=k9WLwoj8; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="k9WLwoj8"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-39bf44be22fso664513f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 May 2025 06:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1746106624; x=1746711424; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IVJu0wRzEXe69H/pIntKvn73bqLsL3OYyEuqMHp/wd0=;
        b=k9WLwoj8R6Lwcqz8gF+6ASnsAu/MSALdgx9WrG7GAztAPHAXuifA36BrtNaEqwNeVx
         jOq98QYeOogpKM+RxgPfn6qEvZj1ONay/gPPMjP2Pd4oSoF1RH2zXRObgZ+zxxlIWphv
         p52Zi/mNOV8CU6hsCN/AA745wOP9JhcFPWv275wbTTtim9xK/Bi2RN6wnDEDxDGUZ877
         n30rzLFy3iik00p05fObBKweioObXk51GzGOc0yM5bYb20wVUVilW289iEorJhrK+YWa
         gKOe9rxYja73bfLTAtoPU84KWztj33O+8pUtdRxz4XXDtWu829kwto1QwN3Eyhy3Naex
         9U6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746106624; x=1746711424;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IVJu0wRzEXe69H/pIntKvn73bqLsL3OYyEuqMHp/wd0=;
        b=kxy+/p9wnDoapAo69SQ8oYoj4Yt8mDasSm75BzMjZBdSTZ4qatMH8E5RrwEVAWpLuf
         O8znr+ucy74C/0t2FA7NXp/57XMmkFQZ/iVjxfAzOEPmVnkAXLve708A3fEjSUmDw02s
         ERmQvh95z3uNxUvYK8eEnjgaD9X8HsVEwHIWgCfmp0dnW8Sul/z8+uU0YTSW9bRlUGAk
         Kmds5aVnz6jymfjDZ9FCfPVZMpUC7ywgjWw/zasNsk/CzguIGexbT5/0NMw+gxXwVOTf
         msqfkzGeH0vLIIyJlP4JaRCpipmkj38/szBLNMq2nDOkwpXaLCgQFD5RIGZ025L/6tHz
         KA6A==
X-Forwarded-Encrypted: i=1; AJvYcCUxSrlmj7tcUEOf49n9OnA7m2z12CGQvBP08BwDLWBvp6Yj45VbJ/Xc8IVdWEOjmVSSAVfG9gayhAFrTxA=@vger.kernel.org
X-Gm-Message-State: AOJu0YylhmEPR8247ypYktd+A/6ZvvItALJPqyPGbbIUcUi5SroXL4XM
	MokdJBCcHyywBZbgudVxZ247Oz6OqBXHxohT50EehodksVqQyPc3wP9j+TcfDAA=
X-Gm-Gg: ASbGncvAMj38IENRZX/pR7lAfwjTgd2romCUIEM/+1p1S3sb+h9WKzF0MeqA8vrPP7s
	U1jVeLOsa7GebNBYMgXUmDJM+zvl64D9lKRy1kGa4H19NxFjk6M8J2XGmkoFRhV9HVDiUmZumu0
	Bsq+zvQw4H9wHPMo3q3qDaizCccRnSHHpXVLz0rqj4jNqAqkpETzXFonyMhOsPDLV6lj8sSLogJ
	3Yl7aJUc/UDNpfwY90b56zZ75ErMOcAUHc6HJ3IpRl5oC0MIPu4b8W83u+tL8vYBNkeGIL0SDHW
	6IfX8+3u5pprTr15XxcXFVx7Om7BfKzD2udqnHxlC4gn5rQCiOWKBB6FJdHy84Aviq/2V+KtE1z
	NqBWcnfY=
X-Google-Smtp-Source: AGHT+IGdPBuoaPeINXPNqsaOhchsX0XkfzRa1+uOWIy0i9ZUyGPNCW3n5dd65l40+aOPl7d3QgDt+g==
X-Received: by 2002:a5d:5f44:0:b0:3a0:8465:43 with SMTP id ffacd0b85a97d-3a093073423mr2527425f8f.43.1746106624153;
        Thu, 01 May 2025 06:37:04 -0700 (PDT)
Received: from archlinux (host-87-8-31-78.retail.telecomitalia.it. [87.8.31.78])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a095a88250sm843781f8f.80.2025.05.01.06.37.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 06:37:03 -0700 (PDT)
Date: Thu, 1 May 2025 15:35:52 +0200
From: Angelo Dureghello <adureghello@baylibre.com>
To: David Lechner <dlechner@baylibre.com>
Cc: Jonathan Cameron <jic23@kernel.org>, 
	Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, 
	Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH 5/5] iio: adc: ad7606: add gain calibration support
Message-ID: <y6hss7bo25hiwzzplbbhmdodpmqbgpkarqvemn3tn3fig26tb2@753sxtygndaz>
References: <20250429-wip-bl-ad7606-calibration-v1-0-eb4d4821b172@baylibre.com>
 <20250429-wip-bl-ad7606-calibration-v1-5-eb4d4821b172@baylibre.com>
 <0677db3c-9c36-4f34-93c0-5c53d702c4bd@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0677db3c-9c36-4f34-93c0-5c53d702c4bd@baylibre.com>

On 29.04.2025 17:46, David Lechner wrote:
> On 4/29/25 8:06 AM, Angelo Dureghello wrote:
> > From: Angelo Dureghello <adureghello@baylibre.com>
> > 
> 
> ...
> 
> > +static int ad7606_chan_calib_gain_setup(struct iio_dev *indio_dev,
> > +					struct iio_chan_spec *chan)
> > +{
> > +	struct ad7606_state *st = iio_priv(indio_dev);
> > +	unsigned int num_channels = st->chip_info->num_adc_channels;
> > +	struct device *dev = st->dev;
> > +	int ret;
> > +
> > +	device_for_each_child_node_scoped(dev, child) {
> > +		int reg, r_gain;
> > +
> > +		ret = fwnode_property_read_u32(child, "reg", &reg);
> > +		if (ret)
> > +			return ret;
> > +
> > +		/* channel number (here) is from 1 to num_channels */
> > +		if (reg < 1 || reg > num_channels) {
> > +			dev_warn(dev, "invalid ch number (ignoring): %d\n", reg);
> > +			continue;
> > +		}
> > +
> > +		ret = fwnode_property_read_u32(child, "adi,rfilter-ohms",
> > +					       &r_gain);
> 
> Instead of...
> 
> > +		if (ret)
> > +			return ret;
> 
> ... we need:
> 
> 		if (ret == -EINVAL)
> 			r_gain = 0;
> 		else if (ret)
> 			return ret;
> 
> Otherwise driver fails to probe if adi,rfilter-ohms is missing.
>

Correct, i changed this before sending and could not catch it.
But not totally sure of applying a 0.
We are here after chip reset. So conceptually, would not apply any default,
ince it is already set after reset. What about:

		if (ret == -EINVAL)
			contnue;
		else if (ret)
			return ret;
 
> > +
> > +		if (r_gain < AD7606_CALIB_GAIN_MIN ||
> > +		    r_gain > AD7606_CALIB_GAIN_MAX)
> > +			return -EINVAL;
> > +
> 
> Also, return dev_err_probe() on the returns above would have made debugging
> easier.
> 
ack

> > +		/* Chan reg is 1-based index. */
> > +		ret = st->bops->reg_write(st, AD7606_CALIB_GAIN(reg - 1),
> > +					  r_gain / AD7606_CALIB_GAIN_STEP);
> > +		if (ret)
> > +			return ret;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
