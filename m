Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 591DA1F0E3A
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 19:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747681486; cv=none; b=fX4SO5wGKbZ3pUgMPFQ7jqV68pTeUfjGtipxYt2u8SDN+feZjPPjXftXgUKFnfm6oNvOY11StOg8KdLHvDbLw6VxN9q79Xucs6lTyPoM0rQ/O2lpU4/XYosYw3qkjsISPkMaO5UesjZGebA6UvyV9J2t48zrNY6lcwdxdyHRovE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747681486; c=relaxed/simple;
	bh=FC7RbwbffCmHIOvlfYKmpJXp1hBMGdDWHZzX/7A6nVI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A84zAQpYPk40brFcR7wEc5pY6xHS4Riyf14wU07MuUQiIbeVLOKRT8SdyFZ3qRH6BFxIUCD2fK3HBAGJ7DUWAphx3ugQT6oBzvnw2ls5AkZ/BUQoiEansVo6pLp6KU64LrD5ED45OeD/nTsyw1WHBoZSB6a6tBznqCtve6Zwko4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=pavuSD2X; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="pavuSD2X"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43d04dc73b7so52276485e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 12:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1747681482; x=1748286282; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4XNb1JKrT79y/jX94Y16n0TqlNGI73gZefjMQ0RRsOg=;
        b=pavuSD2X5bRcrBds1hkVRWqFoB8+DCzkjyRmymu1904jk87VSlj5OHcXYIbiiHK9J6
         LhkowR+qOJPIOtOTLf1O39AvH1+5TgmNaVeQtx8itkWauCdOIGKEG7AAO1u0z3tACwww
         PQIzVplyJH90rKvz0XUfr4c6m6EOFEvXnNMmN1dMetoD4yt8s056M7x6eFWzOkpRxHx8
         AxjkAB2TsDBSqIXgP3h9xfwdKKjJSvSPVWJ6pJVeRozJU94b0OUek2C5GXb4qvHDC72Z
         oyMOErn9LlJEQfSHZTW42ySyXFLTj3c5YkQjkCt5MstosKVcLxanVAsGU5Ijxy/zG4pF
         GU3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747681482; x=1748286282;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4XNb1JKrT79y/jX94Y16n0TqlNGI73gZefjMQ0RRsOg=;
        b=oSzBmxwkKSGfFjd0vgtu0VtwOovfdpo12cKi0pyVcgzAjuvs17g6v9GSIANFAnsl3f
         aAesI0LPKuyy4XbOsdIZ+qG8ynsXR1saXGjf1apN+8URhSlFqVnOg2+NlhGUYZS5qoV4
         Jn4vZrPr80gccNBEyyXtlB2pNSDw6FfYbn++XpHtrWVgEY8hCMTEFoAQX5bnBroHzH/A
         UloXaKFWfcufvbTmUEhFVDw7MwyhOpULn+QSuhEa70bVZvDXnTcm+W4NmnDvoRrDCxIn
         IUCXX/c/v5omQMhOm/UTg7KFfi6Xq9RINasdMqAeSQToKWXytZsJ3DboJ/g9jcHpmWGt
         2FyA==
X-Forwarded-Encrypted: i=1; AJvYcCUDwEC3n26nnUOKG/U5s23XQBXRtPTIUy6i352jLz3456Gqx30z1KP2BE8T748k5Cof/pxBHF3EycfU2dg=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywjy1jSDd/KfDzSvkW9bwpPt4cTaqZ6oj0fIa+hqCaj+143zu7Y
	a/lv8X7WCc3BeGmQSPqhPQJ8a/xVVekIqdJMdmGHm7tO7cDYiGdrkxtFbx0EL2yDHJo=
X-Gm-Gg: ASbGncsXDjypz+XFZ3/zHzj6Cud/4dhXuITYUq60fAMm8eaFGdLuwgHp82N8AFnlSrK
	ULzaLULYzTXoxQe/RGL16N9n3LRDW3jBBBUmFakQCZY/jbWV2rfFbhyvom7qUHA5qkCt5YUVNp9
	LPifMAAiF9SvwGFb4p0Mfs6aXgdQ/dOWxsOJyrJzsFAodu9SP6JVqjR97MSsIOd34p4xTlo1siX
	kaFJKgK4Aj5vhIo1QH2NJjfyUIRWsLIg9ywPTkjFdCO0atvr6MlzNINrlDLMye3grOkgzsar/Yx
	KuZfn11yfqM/K+gymon2vWMqVQdrlqSTAi4CJBISJlcv/25usMjuOHBbqDzXw3WlQ7z6+E3omPx
	e7trGOEGWz06kaRqFONzDLl4B1HeGlQ==
X-Google-Smtp-Source: AGHT+IGV2wo1Es1/ud7FICV93AjG19DqzBSSt64cTEHOlS+HwYpgGt+xRT/5xYKWNInkozP3PLP3gA==
X-Received: by 2002:a05:6000:430a:b0:3a3:648d:aa84 with SMTP id ffacd0b85a97d-3a3648dab2fmr8204843f8f.5.1747681482496;
        Mon, 19 May 2025 12:04:42 -0700 (PDT)
Received: from archlinux (host-80-116-51-117.pool80116.interbusiness.it. [80.116.51.117])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f78b2f19sm103365e9.32.2025.05.19.12.04.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 12:04:40 -0700 (PDT)
Date: Mon, 19 May 2025 21:03:29 +0200
From: Angelo Dureghello <adureghello@baylibre.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
	Nuno Sa <nuno.sa@analog.com>, Lars-Peter Clausen <lars@metafoo.de>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, David Lechner <dlechner@baylibre.com>, 
	Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] iio: dac: adi-axi-dac: fix for wrong bus read
Message-ID: <l7e6pddcnlj6jjiqeyotozxgese7hl6zkpbli3h2zsfjkezksv@gw2qvb3muzt3>
References: <20250409-ad3552r-fix-bus-read-v2-0-34d3b21e8ca0@baylibre.com>
 <ac50109f06d7191549a91779028aca6d639998cc.camel@gmail.com>
 <zca24hgtpycx3l2knyqdt3eu7mfyulzxjphsypae2jzxjgvbsu@2kslj4tcihv4>
 <20250505133801.372738d7@jic23-huawei>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250505133801.372738d7@jic23-huawei>

Hi Jonathan,

i did a mistake on the second patch 2/2.

in axi_dac_wait_bus_free()

	ret = regmap_read_poll_timeout(st->regmap, AXI_DAC_UI_STATUS_REG, val,
		FIELD_GET(AXI_DAC_UI_STATUS_IF_BUSY, val) == -1, 10,

must be

	ret = regmap_read_poll_timeout(st->regmap, AXI_DAC_UI_STATUS_REG, val,
		FIELD_GET(AXI_DAC_UI_STATUS_IF_BUSY, val) == 0, 10,

Not clear what's happen, i missed something while testing.

I apologize, not sure if it is already queued, please let me know
how to fix it.

Regards,
angelo


On 05.05.2025 13:38, Jonathan Cameron wrote:
> On Mon, 5 May 2025 13:33:16 +0200
> Angelo Dureghello <adureghello@baylibre.com> wrote:
> 
> > Hi Jonathan,
> > 
> > asking info about this patch.
> > 
> > As explained, would not do anything else here, please let me know if it can
> > be accepted or how to proceed.
> I've queued up patch 1 as a fix.  Patch 2 will need to wait on that.
> 
> > 
> > Thanks a lot,
> > angelo
> > 
> > On 09.04.2025 14:57, Nuno Sá wrote:
> > > On Wed, 2025-04-09 at 11:16 +0200, Angelo Dureghello wrote:  
> > > > This patchset is intended to fix a random wrong chip ID read, or a
> > > > scratchpad test mismatch, tests done in the ad3552r-hs driver probe. The 
> > > > bus "read" operation must always check for busy flag before reading.
> > > > 
> > > > First patch reorganizes a bit the busy-wait polling code, second patch
> > > > fixes the wrong bus read occurence. 
> > > > 
> > > > NOTE: due to ongoing changes in adi-axi-dac.c, this patch is intended to be
> > > > applied after the linked "ramp generator" patch.
> > > > 
> > > > Link:
> > > > https://lore.kernel.org/linux-iio/20250408-wip-bl-ad3552r-fixes-v4-0-b33c0264bd78@baylibre.com
> > > > Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
> > > > ---  
> > > 
> > > LGTM,
> > > 
> > > Reviewed-by: Nuno Sá <nuno.sa@analog.com>
> > >   
> > > > Changes in v2:
> > > > - invert patch order, fix first.
> > > > - Link to v1:
> > > > https://lore.kernel.org/r/20250408-ad3552r-fix-bus-read-v1-0-37add66aeb08@baylibre.com
> > > > 
> > > > ---
> > > > Angelo Dureghello (2):
> > > >       iio: dac: adi-axi-dac: fix bus read
> > > >       iio: dac: adi-axi-dac: use unique bus free check
> > > > 
> > > >  drivers/iio/dac/adi-axi-dac.c | 40 +++++++++++++++++++++++++---------------
> > > >  1 file changed, 25 insertions(+), 15 deletions(-)
> > > > ---
> > > > base-commit: 6fb85f14853ddde06d57030c753168402bf69cd9
> > > > change-id: 20250408-ad3552r-fix-bus-read-1522622fbd2b
> > > > 
> > > > Best regards,  
> > 
> 
