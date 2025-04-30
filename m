Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DBFA23506E
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 09:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746007168; cv=none; b=l2s5jQnueVdfoXuFlu4uNAZK9w09z9DrFR1Fu+6oPSaJL7lHbyGoaoohK71SAfa3EDuiRDBojDjZaLc01FwFHsoYCfwLC1LYwS29XDMx0FQL+AmzFdUvm6NUmlPU0wP5R+chkB06sFayRG80qQnT6sdc84uGaS0vgGVotbZQU7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746007168; c=relaxed/simple;
	bh=gU0cK+6rYhoCrfmO8Zc168gkmlEzEUm0imiU4BkXnxU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q+n3D5tI8N2f8TxyqbbYeldafzSVBLVoPtKFXyorw1b5NKk7vppeiNeC5oLyVrFMjpsSBpxt0hREcfiJJ9HPdd7D8E3V98xAONVV0gfwRo3tJLjQSwjmsvYWB5/A2DxaoMCGYFw1PjSHK9W97Gw+JYrpGRpGUSncq2cWzzs4d24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DdmQfHzR; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DdmQfHzR"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-39ee5a5bb66so4645053f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 02:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746007165; x=1746611965; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6I143zOtsIb3U6VlapVBXBqNO181vL3QULnfrrsNbrQ=;
        b=DdmQfHzRHQn+QHmOY/jAwJGVb9U2v6D940luAPQsGcklSA0gIn310szYtwjcTZD3ZJ
         53c0V6W3pVUvqz6SDoR7AyJLH4ixqX9/A9Cx1ZBTujxw7qpYAIqz3D3TgCeRV+dPxfxT
         OEH7NUJQoOUvaSjRXmAkncSXOrE84m4j0q94pCp+Hi6IyYYMxh++nb0N1E2JQjpuWKpx
         O5qfVa3eYZV468Lh+pkywF2YdSunRfAT3eVaO69I01f6r5cJo1pAsLKFBUmAP4WSC+b9
         sRlm4mvd8doYs9kCdHpUCqgnn7MkBn1iV8g2Id6h9vHaIkddFUhVbrq/F7CyKb3z8/GP
         4zpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746007165; x=1746611965;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6I143zOtsIb3U6VlapVBXBqNO181vL3QULnfrrsNbrQ=;
        b=wtwsUjszJKh5qt5FtV2SgZYtTPBStUA+XRDa2oUk+yEd3VrdIn7VKNIhaTwmlyREDK
         0JFrQrxzdVxPvuRJL4U8E0wU3GhTg7Zt3cu2buMigYIKpglP3crjPN6+L2Q2e22RmF0u
         lryHUdTEMGVPtbXzAD6vzEK+LRF1jCrA/+ryx1FiFymC5YZFhlbHT2SnHusKOsfujyEM
         dsVQB9xaHuUWWaN4859kcGBpsOTTgwcy43KY6YhT4zGuInacN0RaUj3EodxzqShO6bqW
         TMcnzKddF4NOHpxCQRZC4odsKmU2RRzUsWQ/BsCJ08KztqHsVg9H+5jLgN3m06y01HvT
         pgVg==
X-Forwarded-Encrypted: i=1; AJvYcCXvurarQGxs4JTzKQwp3/Clr5UNMbTKAFCiwe5drEgrQBwSZRjw+GRxkU6wa8w0Q0/gKu0uEaoxQVccrOM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZuoHmo5Vy1N27Hf3ZDe6fxfPHRhWnE7WHwpRdPOpVJIuQ3DMt
	ilwNP6n3Hqeyrs40kio998FOkcU3QPmm8yZ32pe+aFdyFzWq1XEBX2MU1n8zNLY=
X-Gm-Gg: ASbGnctYPphFQGAfcLpAttjhdMXiMZUhRyNMECzGf3F36JSByGj604ZFnVKuvTMqcVz
	zZitIofXhVef9ijZgpqJHOM6AS/1QOMg3XZcC52+ErQiRHyU8883EzKLIVoolT+yuderL1V/+2E
	N5Ag7csdiXzwAyEZCH5RW2JOJyexcPI+swIMTvjjiZrWSPvbpNidEUPZXP5PmjtqSribNE+GqJg
	qtZcx98s1/IDEf9DZLN1CbD53tmYdF5yTDMWQLPg7csgqwBvXrNL5lebHnEmDidzdtY9ivslXgN
	dBtCV/htMV4SxJVQWW19rsjYTzguIQG9LPPs8xj3OmA3tw==
X-Google-Smtp-Source: AGHT+IHLLxyeTc1HcEGag1qjfI4wrS/rupaaqDuV0HhYG9K4MQxOD+AmR9eIPJEaGfGvBmIL287Urw==
X-Received: by 2002:a05:6000:2509:b0:391:3f64:ed00 with SMTP id ffacd0b85a97d-3a08f7793cdmr1998311f8f.26.1746007165306;
        Wed, 30 Apr 2025 02:59:25 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a073e5d479sm17012964f8f.92.2025.04.30.02.59.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 02:59:24 -0700 (PDT)
Date: Wed, 30 Apr 2025 12:59:21 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Tarang Raval <tarang.raval@siliconsignals.io>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Shravan Chippa <Shravan.Chippa@microchip.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/3] media: i2c: imx334: uninitialized variable in
 imx334_update_exp_gain()
Message-ID: <255a8604-5aa9-441a-a4d6-ebc592a00be9@stanley.mountain>
References: <cover.1746001540.git.dan.carpenter@linaro.org>
 <ee811e7c6eabc390241e0227f7a26d1eaa7818a1.1746001540.git.dan.carpenter@linaro.org>
 <PN3P287MB18296802E1A6C2CD55997BC68B832@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <PN3P287MB18296802E1A6C2CD55997BC68B832@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>

On Wed, Apr 30, 2025 at 09:47:44AM +0000, Tarang Raval wrote:
> Hi Dan,
> 
> > The "ret" variable is not initialized on the success path.  Set it to
> > zero.
> >
> > Fixes: 7b19b0fc8ac8 ("media: i2c: imx334: Convert to CCI register access helpers")
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> >  drivers/media/i2c/imx334.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/i2c/imx334.c b/drivers/media/i2c/imx334.c
> > index fc875072f859..846b9928d4e8 100644
> > --- a/drivers/media/i2c/imx334.c
> > +++ b/drivers/media/i2c/imx334.c
> > @@ -536,7 +536,8 @@ static int imx334_update_controls(struct imx334 *imx334,
> >  static int imx334_update_exp_gain(struct imx334 *imx334, u32 exposure, u32 gain)
> >  {
> >         u32 lpfr, shutter;
> > -       int ret, ret_hold;
> > +       int ret_hold;
> > +       int ret = 0;
> 
> I think this initialization may not really be necessary.
> 
> If all of those cci_write are skipped, then yes, using ret uninitialized 
> would be a problem.
> 
> However, I don’t see any case where they would be skipped in the 
> current implementation.
> 
> So, is this initialization really needed?
> 
> Best Regards,
> Tarang

This is a new bug that was introduced in linux-next...

drivers/media/i2c/imx334.c
   536  static int imx334_update_exp_gain(struct imx334 *imx334, u32 exposure, u32 gain)
   537  {
   538          u32 lpfr, shutter;
   539          int ret, ret_hold;
   540  
   541          lpfr = imx334->vblank + imx334->cur_mode->height;
   542          shutter = lpfr - exposure;
   543  
   544          dev_dbg(imx334->dev, "Set long exp %u analog gain %u sh0 %u lpfr %u\n",
   545                  exposure, gain, shutter, lpfr);
   546  
   547          cci_write(imx334->cci, IMX334_REG_HOLD, 1, &ret);

This first call will do an unitialized read of ret to check if it holds
an error code.

   548          cci_write(imx334->cci, IMX334_REG_VMAX, lpfr, &ret);
   549          cci_write(imx334->cci, IMX334_REG_SHUTTER, shutter, &ret);
   550          cci_write(imx334->cci, IMX334_REG_AGAIN, gain, &ret);

cci_write() is designed to preserve the error codes from previous calls.
It will only write error codes to "ret", it will not write success.  If
everything succeeds then "ret" is uninitialized.

   551  
   552          ret_hold = cci_write(imx334->cci, IMX334_REG_HOLD, 0, NULL);
   553          if (ret_hold)
   554                  return ret_hold;
   555  
   556          return ret;
   557  }

In production then everyone should run with INIT_STACK_ALL_ZERO.  In that
case everything works fine.  However some older distributions do not use
this option.  Also in testing, I would encourage everyone to run with
INIT_STACK_ALL_PATTERN.

regards,
dan carpenter

