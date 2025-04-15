Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4C6B21E092
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 15:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744731014; cv=none; b=amuwb8oOf02ZTIluq9wwMEmCSp0tLKAD6ipL9yOcbkF5JKvV4Nnk+SCdWbuBaOu/GqMI3u1HFujszYlXfX9BPSdYtVROrbBqARSmcgqOUkxtj1rXzyNxHR2btrbdxa8+PBrtjeO1bIkpjqVhNvGWcwmyrEzCxxn6Ln6TzaMTz50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744731014; c=relaxed/simple;
	bh=p7zSZ32zjyr49H77bZ3TIqUbm2mFIW1PT0ujVl+2Kkw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dwsnN/cu2LMzcesFQOxGuMkIzIsKvgqCTApq4ziX5ot8nqTV1lfrP+VpR5WMMaVdb/HPKaeta0w9Qrsvl2siTExLUBm0Cle6gqBWmQuoX3ae+asL1eHSPiG5YUie23pZtb3cN/k/hev9wEncw8/HBdjVpssWjUNNW1IOWGgiKJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mG1Kj98G; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mG1Kj98G"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-39129fc51f8so4992752f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 08:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744731011; x=1745335811; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vC4AXr6vHEfMxs8nlfti/TDYKJrFEovi0WF9Ac+HAcI=;
        b=mG1Kj98GXexx5LpH83KERRVQQcMzirk45pO4p2pInOpi6VZF3Ad/ito2M1Tm7VQt28
         G8ePYEAjOjmkzTqURfoBpSkNSDMDL8mMHwkPCDlm23Ro2Py+DVLs3Ej41obHpCviEWFx
         NiK3RKd3IUA+vwLQLl/AgSeS2cke4rTxWaE7M0/tWgogXYfc8DgNpDzkpohg9nRrRWgu
         Br033ujMWyCQ3N+/Nu0dH8SN2wwYnu/JZzVVKcvW1jvJFTkU9Y8K2/erJelv2MVzc/mA
         fZgP4SrOHmTG7jxtJ46Wsrd9CzStCupVF8PbzGQF++gAErUK9Y/19MRlfbQICCOXNy0i
         QfEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744731011; x=1745335811;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vC4AXr6vHEfMxs8nlfti/TDYKJrFEovi0WF9Ac+HAcI=;
        b=gtQa1LKRuVBQQ4PCKeybRP4p5mR2SLvl44op9tT5lc2wRW/AvIYf0w/bmOUTbjuBpe
         F7+O/pHKdyxuFdbIo3q2Z29jUaqiXTYBPWnurUGeqBdAiwqzPBicvYCxEibRjPsXmmG2
         Rl5LIIQTZ8ukOR7TTsPF+GS+HJkbIQCjHElP2XOaZdEFELK7IY71xpFM8W0+PKuu1V2x
         uiI33DwXw+0cpXbubG71CfoIXVPv3ZfDkt51cEkl5YzT4PBvjIeoh8zO97IIRHKowsSY
         yf+1gPcyrgZYpXsiAUnK0Vky+gILXgnLIfKl2o/98j/y56eYBAWP9IneY9mZO7KSwq0g
         fN+Q==
X-Forwarded-Encrypted: i=1; AJvYcCV3Gbg25vKVOxCLWXIukGHXPdWKhnFq5T59cQG7gKXhZOMUlgtSEfH0FFxtBb2f5zy8TbA0j1sDMFTgLjI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUbiF8ZnfKOqq2BeeBmtWiQmGET3haPKktV2n5QtBjBEWk8Stv
	bVkNIcJiOz+SnImI82fZ8Jf6kX+xS1KkP08zszj5ouq5Wf/9OGp8
X-Gm-Gg: ASbGncvUcvi3t1MooyYUAXdT8M50XAT6s4Y3P++5uHOMt+4WHulADT4ET8yUqM3vok6
	3H2iyBnUo08AJHu8Qrc6xCVRsxHSYS5q6J8s/LBILflQob4Jy6mIueEuitPPaZJPPOdlOD9nTgC
	FOFF/YMO3jMfD6kdkd8eyPGIENcHWJukc6tvGIHzUHEXciYvoEMv1o16S+FejWr36zud1iX/sqz
	km3iYM7dIEOqiAmQwCi93js9j2f3Dg93HdML+pIbcNrcdEArJkUrQpgLFIEVzmWAUlxS5g56dx4
	iTPQ/UfFNK8KQv13UNidJIZ8/GkQwcjM/MIo0lXN
X-Google-Smtp-Source: AGHT+IEKLeOfQG6JWb92OMinJq21OOv3PSwq/Miz2ytD+kWgtp3qJ9InJjXBkLNllsDQun5Xb8nF7w==
X-Received: by 2002:a05:6000:2911:b0:39c:30fc:20 with SMTP id ffacd0b85a97d-39eaaebe985mr12685914f8f.37.1744731010861;
        Tue, 15 Apr 2025 08:30:10 -0700 (PDT)
Received: from pc ([165.51.55.171])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae96c102sm14712585f8f.35.2025.04.15.08.30.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 08:30:10 -0700 (PDT)
Date: Tue, 15 Apr 2025 16:30:08 +0100
From: Salah Triki <salah.triki@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jim Cromie <jim.cromie@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drivers: char: scx200_gpio: check return value of
 cdev_add()
Message-ID: <Z_57gC8Vb0nPrjO0@pc>
References: <Z_QDrlkYnmsVRe5w@pc>
 <2025041527-festivity-monitor-6413@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025041527-festivity-monitor-6413@gregkh>

On Tue, Apr 15, 2025 at 04:54:38PM +0200, Greg Kroah-Hartman wrote:
> On Mon, Apr 07, 2025 at 05:56:14PM +0100, Salah Triki wrote:
> > Check return value of cdev_add() and in case of error unregister the
> > range of device numbers.
> > 
> > Signed-off-by: Salah Triki <salah.triki@gmail.com>
> > ---
> >  drivers/char/scx200_gpio.c | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/char/scx200_gpio.c b/drivers/char/scx200_gpio.c
> > index 700e6affea6f..36efcc828e8e 100644
> > --- a/drivers/char/scx200_gpio.c
> > +++ b/drivers/char/scx200_gpio.c
> > @@ -107,10 +107,14 @@ static int __init scx200_gpio_init(void)
> >  	}
> >  
> >  	cdev_init(&scx200_gpio_cdev, &scx200_gpio_fileops);
> > -	cdev_add(&scx200_gpio_cdev, devid, MAX_PINS);
> > +	rc = cdev_add(&scx200_gpio_cdev, devid, MAX_PINS);
> > +	if (rc)
> > +		goto unregister_chrdev_region;
> >  
> >  	return 0; /* succeed */
> >  
> > +unregister_chrdev_region:
> > +	unregister_chrdev_region(devid, MAX_PINS);
> >  undo_platform_device_add:
> >  	platform_device_del(pdev);
> >  undo_malloc:
> > -- 
> > 2.43.0
> > 
> 
> How was this tested?
> 

I only compiled it.

ST 

> thanks,
> 
> greg k-h
