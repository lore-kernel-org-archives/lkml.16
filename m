Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF7C62DFA2D
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 16:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744732901; cv=none; b=ABuahSLlcSfnWdlOC+3MeEktZWl+n+mVkRjfsb+KqgB5Q66Qu3bnv7AvozaI7SCKrAGw2F46kUgaa+sRyi/1q/UhzGECx9c6BPz3QZlJZm9fJ4k5xPeuF/zC7IW24Kg+X5fTo8JtR5iu2Sd/nvr3HKAwI6V+MJ45tFjOBsv1ff0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744732901; c=relaxed/simple;
	bh=R2C5a+LRB7Cb0G1OYKOMLmKsZ1sMW8O1Tb//+s9xJ+8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lNhGk3R2jlI5GRJvHKD/Wy2EOK5XdFHK20+GEK9Ls7NifEE7626Zj49xSDcEH+TEksZRpleqC6XXyCgzL+RZD0xrz4eiYj5+WezoSe1/IsSa1zUW2MoW+7KkgkGuyac+oWWA1Q7OJrqDwpQGWZ6WF8ppNsYZlEuTPIJX7xQ8T60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=QrU119sd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="QrU119sd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 775C8C4CEEB;
	Tue, 15 Apr 2025 16:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1744732900;
	bh=R2C5a+LRB7Cb0G1OYKOMLmKsZ1sMW8O1Tb//+s9xJ+8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QrU119sdxkYbdeWhMS7dHHXKCd6mlVFa24ZFLIPCw1BafHTlHKo5OBhov4fvh8gJw
	 a7dGoGVoqjHMycRsIZcqZ8ESyy+i5clNZhr8UX2ksE/DIrKvFHX7R0lMmTfEgl36Zo
	 Wd5N8NUvsLlGWI14oWxNaR0Z6VOFmhb9l2R0+8R0=
Date: Tue, 15 Apr 2025 18:01:38 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Salah Triki <salah.triki@gmail.com>
Cc: Jim Cromie <jim.cromie@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drivers: char: scx200_gpio: check return value of
 cdev_add()
Message-ID: <2025041532-sappiness-rental-e7e2@gregkh>
References: <Z_QDrlkYnmsVRe5w@pc>
 <2025041527-festivity-monitor-6413@gregkh>
 <Z_57gC8Vb0nPrjO0@pc>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_57gC8Vb0nPrjO0@pc>

On Tue, Apr 15, 2025 at 04:30:08PM +0100, Salah Triki wrote:
> On Tue, Apr 15, 2025 at 04:54:38PM +0200, Greg Kroah-Hartman wrote:
> > On Mon, Apr 07, 2025 at 05:56:14PM +0100, Salah Triki wrote:
> > > Check return value of cdev_add() and in case of error unregister the
> > > range of device numbers.
> > > 
> > > Signed-off-by: Salah Triki <salah.triki@gmail.com>
> > > ---
> > >  drivers/char/scx200_gpio.c | 6 +++++-
> > >  1 file changed, 5 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/char/scx200_gpio.c b/drivers/char/scx200_gpio.c
> > > index 700e6affea6f..36efcc828e8e 100644
> > > --- a/drivers/char/scx200_gpio.c
> > > +++ b/drivers/char/scx200_gpio.c
> > > @@ -107,10 +107,14 @@ static int __init scx200_gpio_init(void)
> > >  	}
> > >  
> > >  	cdev_init(&scx200_gpio_cdev, &scx200_gpio_fileops);
> > > -	cdev_add(&scx200_gpio_cdev, devid, MAX_PINS);
> > > +	rc = cdev_add(&scx200_gpio_cdev, devid, MAX_PINS);
> > > +	if (rc)
> > > +		goto unregister_chrdev_region;
> > >  
> > >  	return 0; /* succeed */
> > >  
> > > +unregister_chrdev_region:
> > > +	unregister_chrdev_region(devid, MAX_PINS);
> > >  undo_platform_device_add:
> > >  	platform_device_del(pdev);
> > >  undo_malloc:
> > > -- 
> > > 2.43.0
> > > 
> > 
> > How was this tested?
> > 
> 
> I only compiled it.

Please properly test it.
