Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E92E032C8B
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 14:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744728882; cv=none; b=kVfFuw09Lavzb7j2pTNuu8VtLktublKhzqxyA5CuctBiodHyQIVMap9Fz1ulfrmepSmIgcgkFZWqmV2D2/g9NeZpnT/Y/ZZIG+O/6sLC+4QOOvwAGIKagrTsqr2BQZaTXLGzeSkKvyAwuNsQo4mBAeYFwmCTbUBnLe0fy25sPbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744728882; c=relaxed/simple;
	bh=wl72Hhir29+MDWZwoyEX9Yt+SSRsS3b9puu637uV7UI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o9jn0v+3qrnPMzBNw7ulrr2TaxHhqX3vwqI7FaubZ2tmNyB/EYN+XzZOMzfzdmlfe+GgB6AR5Dbhk7946jnOVAjQ5lxT00XWYdy3lvIgYXOcu302DB7AOoBI9ldTkHd75OYbKvWzg2BCQYS2+S/RUY/eOeVrEbL9A9Hu65JFhWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=zLJWJLbw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="zLJWJLbw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E142FC4CEEB;
	Tue, 15 Apr 2025 14:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1744728881;
	bh=wl72Hhir29+MDWZwoyEX9Yt+SSRsS3b9puu637uV7UI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=zLJWJLbwzukCdFPNSdQJA1BxxeSoXP3JLm0tchnqnXhOEZg0/bsoZ/HnkN6y2BSQa
	 vWjO18yo5iL+qWMMVRd4TClkB6SdTQVSRYfgRMUsgJ0jHyiS7ecD00zHc+gVg5t+5S
	 q3GslLNtyOaSe2tMdPIuuiPnFYOqtzDuYDf5fnA4=
Date: Tue, 15 Apr 2025 16:54:38 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Salah Triki <salah.triki@gmail.com>
Cc: Jim Cromie <jim.cromie@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drivers: char: scx200_gpio: check return value of
 cdev_add()
Message-ID: <2025041527-festivity-monitor-6413@gregkh>
References: <Z_QDrlkYnmsVRe5w@pc>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_QDrlkYnmsVRe5w@pc>

On Mon, Apr 07, 2025 at 05:56:14PM +0100, Salah Triki wrote:
> Check return value of cdev_add() and in case of error unregister the
> range of device numbers.
> 
> Signed-off-by: Salah Triki <salah.triki@gmail.com>
> ---
>  drivers/char/scx200_gpio.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/char/scx200_gpio.c b/drivers/char/scx200_gpio.c
> index 700e6affea6f..36efcc828e8e 100644
> --- a/drivers/char/scx200_gpio.c
> +++ b/drivers/char/scx200_gpio.c
> @@ -107,10 +107,14 @@ static int __init scx200_gpio_init(void)
>  	}
>  
>  	cdev_init(&scx200_gpio_cdev, &scx200_gpio_fileops);
> -	cdev_add(&scx200_gpio_cdev, devid, MAX_PINS);
> +	rc = cdev_add(&scx200_gpio_cdev, devid, MAX_PINS);
> +	if (rc)
> +		goto unregister_chrdev_region;
>  
>  	return 0; /* succeed */
>  
> +unregister_chrdev_region:
> +	unregister_chrdev_region(devid, MAX_PINS);
>  undo_platform_device_add:
>  	platform_device_del(pdev);
>  undo_malloc:
> -- 
> 2.43.0
> 

How was this tested?

thanks,

greg k-h
