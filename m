Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D1142144A3
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 14:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743432098; cv=none; b=lX7/ORG+U/2vKZpJc8mmabcevx/oSTJ3j2ihuY/8HKep8aQJpn3DySZ83oFL7MZm2wMEo3Jtu/JIwevoB0y4Jz8Smcg+flAyJU/zcSKXajpUouNgdFDfqpNUy4Wf0Amns0+XLMli8EzWzinHe2Qn6Xv4J4luF/ba0KqH2tn435Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743432098; c=relaxed/simple;
	bh=tYar64a7LJgzPpBoDPfByq9zrSr9vfE+S3XfNMgean4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BNhCeJIPIslnCqh0DXgOrJ9maVAF5Qu+gzWSsedvJmN5EUpAgn3gvJm1djD7fT46xj0GC2HPwfjtO4/4B9UPvYwH2DLPI1Gd3WjKBL8ldRA00UhdnDaDNzpRI7EwExy4UmC0Xg9Q38aTJucFeZJEKhSgbZ131wN/y8ga7sAZ9aE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=iSa0YJmr; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="iSa0YJmr"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5efe8d9ebdfso1714377a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 07:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1743432095; x=1744036895; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2joevmLMx/nCxcJS4GzPP4F+qPu43CQEw2Tr1q0fZPU=;
        b=iSa0YJmr0RHx36jdCXRKkNWc/Y3mUOcH/CfbCqZaERwQYMjcZJlc15i8W+coAdimty
         4hTHzW5VJCga0YRInVg21jd07pr4kANXXl4Foy2zqyVumoAP6xYwmJJov8X1rE7Haeos
         zYGNdQIGdQzo1w7RBTpTq2Glw46mpC5yp6UKr3/5VyZ5AuWOPN8JZheIytbYUu4rGjQb
         2GgqV8SkuzwjdPe5A7qfvHotR0xCbPG/XnlDRk7aIoYAGUvpcjM4wAG4MupNdHKHDkWC
         8aXvzL8BMQ22ra96LaMKiiuisdwmOnQrQDDaueiGLdWR92CLcCZZM+qWTcY1CzlLEnTy
         Tolw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743432095; x=1744036895;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2joevmLMx/nCxcJS4GzPP4F+qPu43CQEw2Tr1q0fZPU=;
        b=E/lnKKQG3+HbhPC5cq+wXf9TV7AsLnpYOWVum0BLWXBoBRraAlWixBtKsF5/g/GIAx
         MBTc4c5/QmpMFoOryxQDDAjvE2W8Y5rKbk6e2Oo3AQblQQJwOtFIzb/8jCFpb5Kflo+W
         ASQq8x6g8G+yLi8TwuyRsXztrqBRyd2/3+TzYy8shxvdQqYZpDhBGM6AUzWosbVplZKo
         sK4qMibUmCUMDGQMrUQkUxV/8DIlrm7YGx7tCPfkBv5JSlcl0XUAMm8SlljWo2NvwMge
         mlOvcFHV9szoGWDOuQ8Vk6wAVqnytUsMlnJlHFG7KNm1GK4zZC0PP1ak3jXF9AsX/61w
         QpIw==
X-Forwarded-Encrypted: i=1; AJvYcCW/vFpiVZX82WEntccsY7tQhhh2pw/NECL9bxiC55MAsKjCVDYE4P3K6a8J1Oj4a+3tqEhnfOIQGQ7n4/w=@vger.kernel.org
X-Gm-Message-State: AOJu0YxxgTKK4SyS09pzb8UeaXInTHAIXDrCKztYGsVf/ts8iJA7xp6a
	HZIqZ5eV/lpQsJzg50PxTpx1djJdBEh3vnTo94qTq5mtX3y61nYdLo1v60ZKqlk=
X-Gm-Gg: ASbGnctXEVk/a8I8ReJv06BBPQvMySbnTSsxmlrF7YPEXrBfYLagQqlEd4fE1Ioxztd
	oR7PkrF0Dm3MTD6jBg5cIw4dOulSsy3SEq1lsG/c38EmhX1fPQsXSczn70DIQ4i7yhioSJDNoBM
	h0nvyPg1SF4EHG9fuRjIeTPdadt2Q1gEa18hOc4l82+RJLpmeFCyhJgFsyyz0pSFwLOiu+C0/Bo
	xcP4Sd0tBOp+A5rQCTnjuoftDipYIT6Y3LNJj0YGLTbD3gWgf7TsNjaUIpHjvzGSSjm0zuSc8AA
	1hw9/uwtkzLpO6igV8GeT0Pi/qMBgg5LSMqptlSN6ev/Vh3Kg0w/QFMca79RptcWLjFHBIeaqN4
	pLYFFjD4QlB7uf6ftvhNpx0w=
X-Google-Smtp-Source: AGHT+IF1U3QWc8JPArGLqoT/gBbbv0Yoen8kIp/Txzj1BypW2JMf+MKRmbSd9tBOJY+YsGViY97BOg==
X-Received: by 2002:a17:907:6d05:b0:ac6:bca0:eb70 with SMTP id a640c23a62f3a-ac738bfef11mr824600366b.56.1743432094778;
        Mon, 31 Mar 2025 07:41:34 -0700 (PDT)
Received: from archlinux (host-80-116-51-172.pool80116.interbusiness.it. [80.116.51.172])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac71922bf43sm628845666b.6.2025.03.31.07.41.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 07:41:34 -0700 (PDT)
Date: Mon, 31 Mar 2025 16:40:23 +0200
From: Angelo Dureghello <adureghello@baylibre.com>
To: Nuno =?utf-8?B?U8Oh?= <noname.nuno@gmail.com>
Cc: Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, 
	Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, 
	Jonathan Corbet <corbet@lwn.net>, Olivier Moysan <olivier.moysan@foss.st.com>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, linux-iio@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] iio: dac: adi-axi-dac: add data source get
Message-ID: <7bacip7jwyz7w2fsnnpwbhxg67pwakej46a7bpwxilwkl265d5@jfz7yee7arly>
References: <20250321-wip-bl-ad3552r-fixes-v1-0-3c1aa249d163@baylibre.com>
 <20250321-wip-bl-ad3552r-fixes-v1-3-3c1aa249d163@baylibre.com>
 <88c86ac453ccf968422350d788ab35fd55dd8496.camel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <88c86ac453ccf968422350d788ab35fd55dd8496.camel@gmail.com>

On 28.03.2025 08:15, Nuno Sá wrote:
> On Fri, 2025-03-21 at 21:28 +0100, Angelo Dureghello wrote:
> > From: Angelo Dureghello <adureghello@baylibre.com>
> > 
> > Add data source getter.
> > 
> > Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
> > ---
> >  drivers/iio/dac/adi-axi-dac.c | 27 +++++++++++++++++++++++++++
> >  1 file changed, 27 insertions(+)
> > 
> > diff --git a/drivers/iio/dac/adi-axi-dac.c b/drivers/iio/dac/adi-axi-dac.c
> > index
> > 892d770aec69c4259de777058801c9ab33c79923..a6abd828ebdb34800cc08a2151e52a9acda9eba1
> > 100644
> > --- a/drivers/iio/dac/adi-axi-dac.c
> > +++ b/drivers/iio/dac/adi-axi-dac.c
> > @@ -514,6 +514,32 @@ static int axi_dac_data_source_set(struct iio_backend *back,
> > unsigned int chan,
> >  	}
> >  }
> >  
> > +static int axi_dac_data_source_get(struct iio_backend *back, unsigned int chan,
> > +				   enum iio_backend_data_source *data)
> > +{
> > +	struct axi_dac_state *st = iio_backend_get_priv(back);
> > +	int ret;
> > +	u32 val;
> > +
> > +	ret = regmap_read(st->regmap, AXI_DAC_CHAN_CNTRL_7_REG(chan), &val);
> > +	if (ret)
> > +		return ret;
> 
> Is chan something that we can validate? Do we reliable know max number of channels?
>

Ack, will set it to 15, 0 to 15 is what the documentation says.
But at this point should be set in a diffetrent patch for the "set"
too.

Btw, there is something odd here. I tested the generator and it works,
i am enabling RAMP for both channels 0 and 1.
The channel offset here is 0x40, while in ad3552r and generic dac doc
it is 0x58. So, since ramp is working i am supposing the documentation 
can be wrong. 
 
> > +
> > +	switch (val) {
> > +	case AXI_DAC_DATA_INTERNAL_TONE:
> > +		*data = IIO_BACKEND_INTERNAL_CONTINUOUS_WAVE;
> > +		return 0;
> > +	case AXI_DAC_DATA_DMA:
> > +		*data = IIO_BACKEND_EXTERNAL;
> > +		return 0;
> > +	case AXI_DAC_DATA_INTERNAL_RAMP_16BIT:
> > +		*data = IIO_BACKEND_INTERNAL_RAMP_16BIT;
> > +		return 0;
> > +	default:
> > +		return -EINVAL;
> 
> More of a nitpick comment but I would some other error code. This is not really an
> "Invalid argument" situation. Maybe -EIO as the HW is giving something unexpected? or
> ENOTSUPP (likely not exactly like this)...
>
Correct, will set EIO.
 
> - Nuno Sá
> 
> >  	.ddr_disable = axi_dac_ddr_disable,
> >  	.data_stream_enable = axi_dac_data_stream_enable,
> > 
> 
