Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 015EC216E2B
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 14:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745937253; cv=none; b=YP1DGVnY6ZxslQx5qvMWLbk7cu8kv+z759gVMTiFVTlG+YmPcneU3pE/IFstCDPn/TxBCnUaX12RfBANchmou25gM311OkjhM625DlUs5Nn1GVRBmtnFcF56Zbpqtkp2CsXitFVI60aG0WrVp4+qAUK96FYqVcxh/WK9XoY0xbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745937253; c=relaxed/simple;
	bh=lmnxHLF68riBzOKcdJcpU+85GKfF7cyH/K4951Aw5B4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DmNx67P+3YYx1zU9QUSQCZpEFY8wRV/7iRtdcRgMT4S1Sfm+6Qut4/78Qk+FiCjYd8Zz7ubP1nAr0xQ3QotcJNQroxOLLQW99JvViVZzoH5uF6zwSRyk9e0A7wxq48QYqQGllKiubI++3Glk6jxjWmkkhnxg/tv83nAS0x4Qocc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=ymv23thJ; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="ymv23thJ"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43690d4605dso46776605e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 07:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745937250; x=1746542050; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bgm1hI8+hceaGAXwVfwpPvCd/kO4SsvuWHjINi5EhqY=;
        b=ymv23thJSwg9o/lVvcIIUrqYxumM702nerPYUBJ9GdKaxEEiF2s/bBYtk+cKRYfuOC
         dLgcbK1FOdIrEya7oa/Kd1ojQwO0CPa7Ah8QjKneXd/8ejbCZOqv1VGCXS9EEMJERrJ1
         HaY6o1tGP+qnoWRemzTCe1DD5EVpAQjPcRn2+vQegsxRCLxOnFWWHJvspak7Cryl4D9P
         NZzxJW2tT1v/nex9hqU0OeMMGGJjsHR2ldAGhs6hdq8sdAWi/rIdIFanqaD+x32x3vPM
         ycdPRQ6INaM4G8D3awSfrf61D6ibd9jtTSyUk57/g0bpLELLRghk3tWQtbUME9jfyxva
         16BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745937250; x=1746542050;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bgm1hI8+hceaGAXwVfwpPvCd/kO4SsvuWHjINi5EhqY=;
        b=MgBvGm30v6G2H3Y7YiZsjpJy6aBDv2RVh/o2lqO8171Nuywb0vDHlyZ0x8p93we3pT
         DwBdq/29JwuWmnKn936G4CO+UtBz8IYYYfF8GeCD3UcqV/D65gTIg5PaLHyWMqR26aSQ
         2kUwnDEXunrboh2BNQQS/jo44BH4lxtsuJNoXVC8bIiosEb7e5uXNpm/+/svc1shCcwt
         p0+UUfHKE3ZoJbJ9730qf7awQfU/i5RHCAF/B5OfjW4U4Qb4oxjzhxUPN+pey/9V3g82
         Ophus740dHaDaFlW6uzRDfzQSlNiQYfMBC8TqflCjO4MC9GOIa2MFzvXxGsBGXbInwkG
         vRAA==
X-Forwarded-Encrypted: i=1; AJvYcCUq9k2cKdgP2T+JrQpJhrP2TjcOdKwbQpD1kMSnkYxcXzmOeLffPm8GlgIq0lHeLswxIxkwMrS2ZawhCH8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYrFbY7/howIslZLgzg6q2JBRtRJqtR2orWouhMtw/1DGtagLb
	mY2k/2Jkztaxqfa1fYe2JsM82kM8dwmFgnXAQbp83NDtkhOlQF4LHdHXD61Nq3s=
X-Gm-Gg: ASbGncseybCBH+bNlktcrgmvAJwM58Z/ZpjzoCABsali9dT/BGr430xGjzyoKDVVLlH
	PnHNw1KmlCWAzGyhZpCNTEjdz8f42U6zP/r80rPqlkR0P44ykqkd9AH+MwHrmlqhMQ88kEQP8zI
	p5oU1owq8SpIlnFOSZbvkxV4Y4l0uihjRBfhN0wANJt7QE11S4YudmG8UsHWUH0tE3crr+CYEKS
	x2NPO9RCeGY+tXZGJqkGdkVuziA4NBRSKC7aHRCRofPcS/u0zsAxfGmQ9WzI1z7FTAPGyH2VSjF
	kq/6EAfNAiINVWllhIxups0rRT8sDucDNprUM6YXvTGb0dNlg7712cntmopZRa5wT5nKgh0uegi
	EDtijyPE=
X-Google-Smtp-Source: AGHT+IE1rlODd7Ymc+mVPNqfJSWt71txKxyIzWpUA/SAeTWDWH9SzzrOEc7XraHSBNM+FxFeWIKGvA==
X-Received: by 2002:a05:600c:4708:b0:43c:fe15:41dd with SMTP id 5b1f17b1804b1-440ab77d015mr101725595e9.6.1745937250205;
        Tue, 29 Apr 2025 07:34:10 -0700 (PDT)
Received: from archlinux (host-87-8-31-78.retail.telecomitalia.it. [87.8.31.78])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d29b990sm196420085e9.4.2025.04.29.07.34.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 07:34:09 -0700 (PDT)
Date: Tue, 29 Apr 2025 16:32:57 +0200
From: Angelo Dureghello <adureghello@baylibre.com>
To: Andy Shevchenko <andy@kernel.org>
Cc: Nuno Sa <nuno.sa@analog.com>, Lars-Peter Clausen <lars@metafoo.de>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: [PATCH v2 2/2] iio: dac: adi-axi-dac: use unique bus free check
Message-ID: <udqm2qkw3yrewmovua54twfzbsfduojc5f5uoj4nptxldpbbr5@75bb2pldwq7f>
References: <20250409-ad3552r-fix-bus-read-v2-0-34d3b21e8ca0@baylibre.com>
 <20250409-ad3552r-fix-bus-read-v2-2-34d3b21e8ca0@baylibre.com>
 <Z_alpFoaQQUlWdfo@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_alpFoaQQUlWdfo@smile.fi.intel.com>

Hi Andy,

sorry, seen this message now only, for some reason sometimes your emails
goes to the spam. Now i marked all as "not spam", let's see.

On 09.04.2025 19:51, Andy Shevchenko wrote:
> On Wed, Apr 09, 2025 at 11:16:55AM +0200, Angelo Dureghello wrote:
> > From: Angelo Dureghello <adureghello@baylibre.com>
> > 
> > Use a unique function for the bus free check by polling, to reduce
> > duplicated code. An error is always thrown in case of timeout.
> 
> ...
> 
> > +static int axi_dac_wait_bus_free(struct axi_dac_state *st)
> > +{
> > +	u32 val;
> > +	int ret;
> > +
> > +	ret = regmap_read_poll_timeout(st->regmap, AXI_DAC_UI_STATUS_REG, val,
> > +		FIELD_GET(AXI_DAC_UI_STATUS_IF_BUSY, val) == -1, 10,
> > +		100 * KILO);
> 
> Same comment as in the previous patch. Okay, it seems more than in the single
> case. Perhaps to change that as well here?
> 

for my personal taste would not use more specific named defines here,
would not change this, in case we can send a separate patch to fix
them all. 

> > +	if (ret == -ETIMEDOUT)
> > +		dev_err(st->dev, "AXI bus timeout\n");
> 
> Why do you need this? The error code will go to the user space at the end? If
> yes, it will be enough to have it printed there, no?
> 

This warning means something very bad happen at AXI level. I never seen
this warning issued, but it may help to debug AXI/HDL issues, would not 
remove it. 

> > +	return ret;
> > +}
> 
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 
Regards,
angelo
