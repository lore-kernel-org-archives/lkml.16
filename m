Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FF9318D65E
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 22:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744755644; cv=none; b=ffgHXtDj2GAO8tIlpjanJJ1xgplhkMq8LRmPNsqVvk/5SZ4L+QUr8aJkBr3U1RID+3r0QSKSy3nADChhxhG5Bhwunm5U70wiQ3g5SMO5BHjWWzTY33ge6bHRYQLrU3ozvvSkCJxTLkLhvHwgz4MaG7Oj9pOwInI/7xKrm4jM8x8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744755644; c=relaxed/simple;
	bh=UHzHycK20zsFi3d4fs3DfZjJSULXdWxYM//X3eI9/WA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OihI4I94hQODmR3bojJ6HWq0PZsbrrml/pq6cYsdOluoDGGtGsIrDyai28C3TuepCxCND4oNe9fOdHo3ntVHDYVIB8QRv6R6msZWtcUZ9ixZUlFdaxK5ImTksKk44gE4OA6aW+CiH3aMcaLY6H0+lPUcN1a+ok9K/SVMQv0OLmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Rt0TYKEm; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Rt0TYKEm"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-73bf1cef6ceso2845686b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 15:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744755642; x=1745360442; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=W6vwe4C4wJYttVSB+Lg7PbLoAnIqQQn3ppM6t9bMgHo=;
        b=Rt0TYKEmF909K4z/VLeYlNoG6LkO5+TBgnio/AJdal4EEzYBELpRvrt8brKH6qN4pQ
         uMehKtEl+T7MaFynJ+ShrIsFeQCSar5BdEpsjx4MGZLUwpWBYnahFiVu+rg3FV1fRgnk
         UnNiCVHtVGAUxBm+jJBVYQeeb8jgko2s4Z97SUaznVyhGkyzLVLPMsiMXR75klqaMUEu
         xzf9gt3ZRJBauktQlJ71+nD3Zn6KPEjL51YwNX1gx51eiumMk0exG3BCEbVmw+IVp2v4
         BKtfQG9VkmCedPKJC5Q9hXQXizZfD2kpM1N+8/Ij6SqXlLk0BUOYnaOF9i4vR4Mixocm
         ltTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744755642; x=1745360442;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W6vwe4C4wJYttVSB+Lg7PbLoAnIqQQn3ppM6t9bMgHo=;
        b=eGUEPN7O5ju2P9+M6jBAnFhOwFmvh2TCo+J09rZF3iNybu5CLc5JtT+F/86pkKrZu1
         tAMNUffZyPXUC7thl8jqy7+bGGSU5go62gI84Kr0VbTgV2XTzX8sQncm26m05+eWa6dW
         z8SN09uOyrv+rLHioDlohVtWFsipzB13DkUJt/5OXtpyr93B6hWrvug8pLW0IXlyHkA6
         38/VF9oCCHCirNfcFrS/Y5as/OiNXVMzIEItzS8D1KI7STi9ijTxw5UCYwH3dXJMIA30
         hNOTlfGzRTSRJT3FdOHSWBC6F6bm5LT7PGNtZCmw/Wd8RHDAZNCQ4SRQn0WP/7I5PwZ7
         zlgg==
X-Forwarded-Encrypted: i=1; AJvYcCW8c0RBeIF8Nz0H4Utui2NwLn6eZ3Kp3NMy61b9n+OKroMr7KLtA5JVUVh4UVn1+mUx2/NeGIw+hch/Ttw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxA6ubKnpQvmGpNvRCgGxiURcbrfLKesaNUG807Cp5AgSOBUO+z
	tj+ixrvZzPYEIzXuUltMggrDMHI14Ewt0RA37sXWfiMvhAAL89pm8G7xt2g/CBY=
X-Gm-Gg: ASbGncvQvLU/dOVDkJygKcqedlM4B1TCzmAuVkCJC5iLntpqE/DFpYooy1iKvTYtHDD
	3A+/D9imNY5+gesilpX8idvBNdUChQiYwwQSS8mL/Ach6Vk757TURH8OJ3GgheDhC+jAWb/WWrJ
	WrDQHEOiOmB/lH1S9ynMgTmEhhjv7P0+0WiUM9rEuNSA/XETnU98ja10T2P34Qn3eYMpSqzwzae
	0A3ceE0SKCvPdFAnWNFLv+pOoT/Trhafi//j89ttlJwZqzg6fWT1h9iWt0fHEVJb0AsZX98CGxC
	069VM1BfJ6BE7TFCdB/Br3tS9WPKh08rbJvRvcO1sOeQ4iigxj/PXLXBnHqqSVRZLYK3Z/goyoq
	rB/sh32atguI=
X-Google-Smtp-Source: AGHT+IEpDLdrfoDSU5ZuyftzTYl/brewAw2M8CSwWMhS4Uire6Dc0mWmKitFnwhPrIFIGJwg/pUw0Q==
X-Received: by 2002:a05:6a00:190c:b0:734:b136:9c39 with SMTP id d2e1a72fcca58-73c1faee36amr1644462b3a.19.1744755641712;
        Tue, 15 Apr 2025 15:20:41 -0700 (PDT)
Received: from dev-linux (syn-076-088-115-008.res.spectrum.com. [76.88.115.8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd21c65c9sm9401091b3a.61.2025.04.15.15.20.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 15:20:41 -0700 (PDT)
Date: Tue, 15 Apr 2025 15:20:38 -0700
From: Sukrut Bellary <sbellary@baylibre.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Lars-Peter Clausen <lars@metafoo.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Angelo Compagnucci <angelo.compagnucci@gmail.com>,
	Nishanth Menon <nm@ti.com>, linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] iio: adc: ti-adc128s052: Add lower resolution
 devices support
Message-ID: <Z/7btoHi03NftNQJ@dev-linux>
References: <20250408132120.836461-1-sbellary@baylibre.com>
 <20250408132120.836461-3-sbellary@baylibre.com>
 <20250412141253.6d57032e@jic23-huawei>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250412141253.6d57032e@jic23-huawei>

On Sat, Apr 12, 2025 at 02:12:53PM +0100, Jonathan Cameron wrote:
> On Tue,  8 Apr 2025 06:21:20 -0700
> Sukrut Bellary <sbellary@baylibre.com> wrote:
> 
> > The adcxx4s communicates with a host processor via an SPI/Microwire Bus
> > interface. The device family responds with 12-bit data, of which the LSB
> > bits are transmitted by the lower resolution devices as 0.
> > The unavailable bits are 0 in LSB.
> > Shift is calculated per resolution and used in scaling and
> > raw data read.
> > 
> > Lets reuse the driver to support the family of devices with name
> > ADC<bb><c>S<sss>, where
> > * bb is the resolution in number of bits (8, 10, 12)
> > * c is the number of channels (1, 2, 4, 8)
> > * sss is the maximum conversion speed (021 for 200 kSPS, 051 for 500 kSPS
> > and 101 for 1 MSPS)
> > 
> > Complete datasheets are available at TI's website here:
> > https://www.ti.com/lit/gpn/adc<bb><c>s<sss>.pdf
> > 
> > Tested only with ti-adc102s051 on BegalePlay SBC.
> > https://www.beagleboard.org/boards/beagleplay
> > 
> > Co-developed-by: Nishanth Menon <nm@ti.com>
> > Signed-off-by: Nishanth Menon <nm@ti.com>
> > Signed-off-by: Sukrut Bellary <sbellary@baylibre.com>
> > ---
> > Changes in v3: 
> >         - used be16_to_cpu() for the endian conversion.
> >         - used config index enum while setting up the adc128_config[]
> > 
> > - Link to v2: 
> >         https://lore.kernel.org/lkml/20231022031203.632153-1-sukrut.bellary@linux.com/
> > 
> > Changes in v2:
> >         - Arranged of_device_id and spi_device_id in numeric order.
> >         - Used enum to index into adc128_config.
> >         - Reorder adc128_config in alphabetical.
> >         - Include channel resolution information.
> >         - Shift is calculated per resolution and used in scaling and 
> >         raw data read.
> > 
> > - Link to v1: https://lore.kernel.org/all/20220701042919.18180-1-nm@ti.com/
> > ---
> >  drivers/iio/adc/ti-adc128s052.c | 149 ++++++++++++++++++++++++--------
> >  1 file changed, 112 insertions(+), 37 deletions(-)
> > 
> > diff --git a/drivers/iio/adc/ti-adc128s052.c b/drivers/iio/adc/ti-adc128s052.c
> > index a456ea78462f..d4b76fd85abd 100644
> > --- a/drivers/iio/adc/ti-adc128s052.c
> > +++ b/drivers/iio/adc/ti-adc128s052.c
> > @@ -7,6 +7,22 @@
> >   * https://www.ti.com/lit/ds/symlink/adc128s052.pdf
> >   * https://www.ti.com/lit/ds/symlink/adc122s021.pdf
> >   * https://www.ti.com/lit/ds/symlink/adc124s021.pdf
> > + *
> > + * The adcxx4s communicates with a host processor via an SPI/Microwire Bus
> > + * interface. This driver supports the whole family of devices with a name
> > + * ADC<bb><c>S<sss>, where
> > + * bb is the resolution in number of bits (8, 10, 12)
> > + * c is the number of channels (1, 2, 4, 8)
> > + * sss is the maximum conversion speed (021 for 200 kSPS, 051 for 500 kSPS
> > + * and 101 for 1 MSPS)
> > + *
> > + * Complete datasheets are available at TI's website here:
> > + *   https://www.ti.com/lit/gpn/adc<bb><c>s<sss>.pdf
> > + *
> > + * 8, 10, and 12 bits converters send 12-bit data with
> > + * unavailable bits set to 0 in LSB.
> > + * Shift is calculated per resolution and used in scaling and
> > + * raw data read.
> >   */
> >  
> >  #include <linux/err.h>
> > @@ -53,7 +69,7 @@ static int adc128_adc_conversion(struct adc128 *adc, u8 channel)
> >  	if (ret < 0)
> >  		return ret;
> >  
> > -	return ((adc->buffer[0] << 8 | adc->buffer[1]) & 0xFFF);
> > +	return be16_to_cpu(*((__be16 *)adc->buffer));
> 
> I think we now have a convenient adc->buffer16 (probably introduced in Matti's
> series.  Sorry I missed the overlap of the two series until now. These part numbers
> are too long and confusing to stick in my head!
> 
> Matti took on maintaining that driver because he wanted to see any changes
> that might affect the Rohm part it now supports.  If anyone wants to volunteer
> from the TI side of things that would be ideal - just send a patch adding to
> the new MAINTAINERS entry.

Thanks for the review.
Sure, I can work on the TI side of things.

> Jonathan
> 
> 
> >  }
