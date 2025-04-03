Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47A42250C18;
	Thu,  3 Apr 2025 16:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743696375; cv=none; b=SDXhT85Ob+s1ZKlE6LcZnFP51Jj0fzd0QnCtFlzeAYHKdy8nWUFGPkRbvdlmubyJp07630UMPdLco+qJvBx5yikovzYKhzEm97kzspyng3fED7wDPmKZ5KGqoHk2D+jZ8HpjRjS29LQ0XInJNxWxSKk97+YosAmA3ke0YQLpVlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743696375; c=relaxed/simple;
	bh=2bb6Ld60XxrGe0E0RuTu+nVe0hVCJMLe31QcComJ1fY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IhofXRBWdVOa1LBEQupCXZP/qUpx8biYfhCEdsPwsgzQMLEYbRfI5nUo3JWzISbaZfVYo7MoVZ/Tq/D5Oj2ZytV0KQPDUBkOd3PBKFZTMo/s2l1LN9KAD1XB8hkT/UkJPa0qoYkRU4C8OCILpciY7nM++fj6R/rrk3KPT8GXr94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lkosQB/V; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lkosQB/V"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-22928d629faso12230805ad.3;
        Thu, 03 Apr 2025 09:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743696371; x=1744301171; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ymem3tx1RtUYQNeKWESyhB5mrJPO3NU+wgpTLwBG5zw=;
        b=lkosQB/V/LKPc6cV66V4uiVEy9ctFVWm735NZpPOrsgQ/JylJIUfc1RIEOi/hNrVWx
         byQMKIaprqHDWYkcXAeQx27wYf5mm5VXsOG47JUqxak70UyuUZ3ntAgavA6hvjRHtzdp
         SSt20Zk5R1OqTRgylIuH+0Y2+VkNNHGHykxatGxDhcQZimSB9rxvSqI+ad3Le2D+rDxd
         cIZkqFYL9feKvpMCjKOelKp665VVQ40x2X0HXN8BdOsL99pCe2GwfQZdlWg7Fc6ENinV
         KgVGMBTsNXFh3QuWV3tOdvU652tJOJy0SAI44hpP9qaXNeYx9ZtDHHreb1KwbdAcmGF5
         zG5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743696371; x=1744301171;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ymem3tx1RtUYQNeKWESyhB5mrJPO3NU+wgpTLwBG5zw=;
        b=R7scFLckNhFpXbHX0q1oQGZeJ+tQ988wxpln6MgXDwbLuhQ+BhDyO0nEpm0pUmENdG
         omGM3HOC0KsTldWzlyNOHmEMqtvceUII2n3I7osK4N/PIEJRM7eroECviLcMgAnEC0Sg
         Q/F4llxh3toSc5SDwrCAPq43bq3ItUD0XFpHJulNiCT8wg1QqwBoQqlMRt+lfY49gsmx
         K5Jr7ohrTZrAzA/zdSA6kKAEUsoIsBwR5Gdu5jkQKAij0nZe/NYoAOPL/s9PgES8xDxD
         hYlNZc/YTPSC1NIXZmUrPj0ikKNfbUZWySzmPczsFoZn7f7puF975PlrGyj0nSJ2dU4i
         Mh9A==
X-Forwarded-Encrypted: i=1; AJvYcCXTHGV5xiIpHbLqFGphvux3z2cNOCaymYy20/hXVkcPUI2dFO0YwqFoIoR0ANSbl+z9wpyW5RCjFFTH9D2A@vger.kernel.org, AJvYcCXs4G/08vo+wjgIXTtbGyVoivpUvWR379P3ihXLbQbNZufX50g8L/7/FWzA/1DM+Fz1A140w5YR3uiK+Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6Kf9SDfEN7VINV41Tbcj3rUv+Tw/YboMcxN06ER1EoOtoJ5t2
	9WRX46xnm04as2x7Gp6lQZknDPXSHOz0nBkoMhqkJAsS0+e/ADX0
X-Gm-Gg: ASbGncvxsb0OYOVhcuHGEp0lYHRf77yIASTurVIRlrfR5KRsTTH285v3F8mHCoX8UUo
	XP4mlEerwRBwU7Z4Zspx8QITHq8W6CGAj5niDe8dLbHVblFGa4E1l/RehmaaqaDUtaw7Bt2yzX3
	O8G+cXbPcJr8xfDKDjmAIZb1rcgeGjD0QCjyyW2zwJGGZ97Ep9M4GXoDXIoVwXdORK5h1UMVXTx
	8xb+ztrt89JVoJcAv5VrMY7s3MS7wZbAcEs8KG/vnmf0OQ++TbSHvALFlV2pT71bU82G6RHhbOZ
	FLnZ3XJ8oBY3u8ObdqTmiesfMybx7p9sckfJOnS4b5Vk5ZGmTY7uy7tNCw==
X-Google-Smtp-Source: AGHT+IFZkonlx+6d8LKTvVVrgjpNIPXSRTv3sgQYVB8/1U4DEhJPtbnWrrEfecPZfpwRnFXq86U+5g==
X-Received: by 2002:a17:902:cec2:b0:223:fabd:4f99 with SMTP id d9443c01a7336-2292f94a06emr338298535ad.5.1743696371495;
        Thu, 03 Apr 2025 09:06:11 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739d97effe5sm1727414b3a.61.2025.04.03.09.06.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 09:06:10 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 3 Apr 2025 09:06:09 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, NXP S32 Linux <s32@nxp.com>,
	imx@lists.linux.dev, Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Eric Chanudet <echanude@redhat.com>,
	Florin Buica <florin.buica@nxp.com>
Subject: Re: [PATCH] hwmon: (ina2xx) make regulator 'vs' support optional
Message-ID: <2a12e6be-c253-4542-86a0-aacb71671ed6@roeck-us.net>
References: <20250403101516.3047802-1-ciprianmarian.costea@oss.nxp.com>
 <dab2f459-240f-4e4c-9bf6-8c0285354cfb@roeck-us.net>
 <4efff19d-b5e6-49b5-9a15-e4af622c6ebf@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4efff19d-b5e6-49b5-9a15-e4af622c6ebf@oss.nxp.com>

On Thu, Apr 03, 2025 at 05:29:26PM +0300, Ciprian Marian Costea wrote:
> On 4/3/2025 3:15 PM, Guenter Roeck wrote:
> > On 4/3/25 03:15, Ciprian Costea wrote:
> > > From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> > > 
> > > S32G2/S32G3 based boards which integrate the ina231 sensor do not have a
> > > dedicated voltage regulator.
> > > 
> > > Co-developed-by: Florin Buica <florin.buica@nxp.com>
> > > Signed-off-by: Florin Buica <florin.buica@nxp.com>
> > > Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> > > ---
> > >   drivers/hwmon/ina2xx.c | 4 ++--
> > >   1 file changed, 2 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/hwmon/ina2xx.c b/drivers/hwmon/ina2xx.c
> > > index 345fe7db9de9..ab4972f94a8c 100644
> > > --- a/drivers/hwmon/ina2xx.c
> > > +++ b/drivers/hwmon/ina2xx.c
> > > @@ -959,8 +959,8 @@ static int ina2xx_probe(struct i2c_client *client)
> > >           return PTR_ERR(data->regmap);
> > >       }
> > > -    ret = (dev, "vs");
> > > -    if (ret)
> > > +    ret = devm_regulator_get_enable_optional(dev, "vs");
> > 
> > devm_regulator_get_enable() should provide a dummy regulator if there is
> > no explicit regulator. Why does this not work ?
> > 
> > > +    if (ret < 0 && ret != -ENODEV)
> > 
> > Why this added check ?
> > 
> > I know it used to be necessary if regulator support is disabled,
> > but that is no longer the case.
> > 
> > Guenter
> > 
> 
> Hello Guenter,
> 
> I've just tested and devm_regulator_get_enable() does work as you've
> described, providing a dummy regulator.
> 
> But, according to the 'ti,ina2xx' binding [1] I see that the `vs-supply`
> property is not required. Hence wouldn't it be correct for `vs-supply` to be
> optional ? Using 'devm_regulator_get_enable_optional()'
> 
Yes, but the reasoning you provided is different and suggested that the
current code would not work. Since that is not the case, the change would
be purely cosmetic. Also, I still don't see why the -ENODEV check would be
necessary.

Guenter
