Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC13315C15F
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 16:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746461357; cv=none; b=fBEjHD5T3FU6JpEbv6MOFamVr6roOY9/A/dt6/fiibRmY9pws2EKrioNVyEdUlM2KvuYWkvkWDz1E6sGfJJA1L6Grr5eOLe9kN4brrAwHUbvuGAQ7qdH2c6aQvCgtCSdWJl60jjYXtoGBoZAZnHlK+k5tkqOWUcWimXOZ5erb4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746461357; c=relaxed/simple;
	bh=iJ5SpkhBGvECSaWeBIwDeP6OMBAoZ/IKXxgtjOCQoC8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H7KSx+O8q2Pf8z6fcKzO65jY2HHseymNXopBBr5a/8zq7a4c7NYIx9F6I9NZi+IjWAqOyP+8ALaLwV6OurPkQfjJKhFk4Q6GnAciSXSukRQMGiS1peVsuuhqvZ4H7WInoqXuQVl37dB71KqqyOKrL8UNv/YlmlHCWsIqJun8cTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minyard.net; spf=none smtp.mailfrom=minyard.net; dkim=pass (2048-bit key) header.d=minyard-net.20230601.gappssmtp.com header.i=@minyard-net.20230601.gappssmtp.com header.b=EoAWB5EY; arc=none smtp.client-ip=209.85.160.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minyard.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=minyard.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=minyard-net.20230601.gappssmtp.com header.i=@minyard-net.20230601.gappssmtp.com header.b="EoAWB5EY"
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-2d4f832069bso2086915fac.3
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 09:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minyard-net.20230601.gappssmtp.com; s=20230601; t=1746461353; x=1747066153; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IqEKM/OjnSYzN6ZOnaif2KiyQ/v82RpALfNylkwGH+w=;
        b=EoAWB5EYvT30S76DZArRG6e7DrGJ0pKQuJL3m6zCN4mwuUR4zbS/uvG2r0+SVHcSYt
         ZqgQkM0rabsNyzZTvndEbugVkPFWL6qeOyy+XXMg0vQgUzdEUCjhc5USRKlQb+ojbaHZ
         mjCF3UgQNwq8QIUfFixT8/fMGAKI2JNqKOR/IbFKoz9jhcXCFPdBKHrYi9jjjVmXwJ+7
         5D6fjTxZeKCoQ5g3p0hyXJCFJJXWaXN4sOuTaEbYC+3FkBoXIEe7lkBoLNjuHijjrrHN
         tf0Smay/AFd5vk8Hz6QxlgCzKkoKKVJg9EySebhn6RRytHSLPakIjB7T7czZ4axC2kLC
         ahLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746461353; x=1747066153;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IqEKM/OjnSYzN6ZOnaif2KiyQ/v82RpALfNylkwGH+w=;
        b=rMNue+JZVqqtuVW1l5u20MnlCORl/LCDfjtcgRbNb4dYMXYkPV60lXb6MAYRs/OPrF
         1yAu9uXlmLUbrm39+5qf3hWhlBshBSiRXCx19yqesTzxJ0QwBUitfY9EUL79vdcX8Tvr
         8ao3KULV5n27eA7grQTqlpLiiEiKfb3dFaXP+s1Idfk2zaPq7y8MgDCqshety9mJcdQH
         S40rAI0RLoU2gexwb1ZhHoxMhOdTiqanYa3N2ZH3GpBg67y6Gfduwe3aHvdELniAM66/
         G6yJxzpR6xTaPmT2m0sa1y5D5j3r49l41U1Xd6LbidBqqtSGlihiKm8iUVHfTCwiBNVb
         9KRA==
X-Forwarded-Encrypted: i=1; AJvYcCV1juks0REAAMXXfyCQJ727fdth6C1nwRpQOFqYR15wlNpqM3GNcCkYHR7BJmDocRl0f3RgdNyLru43N9c=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYiTbo+tcJlfNAe+HOK4dyhh0hF828tFN6LGMhFGg90f34hu/A
	sOMDGZDDn9c+uo1ozlQ0jwxUVV7ed7OHQqcsbb/+FYTsw+Ft19AU6aJS7n88NRY=
X-Gm-Gg: ASbGncvDOMiUBzvBZQ0HGxss2XXY0xWjBKvaRCpdTGzH0LrAN9+KEdxA9I2sHAL2200
	XDbzBRG+/PAym8CzQK3kEUL80B0CbVPrmuNFP1Zg9+SG/RHT/tS22SbZt3X/UFuS3N2TwuYqLMU
	AGBhhGjv0yXmlQ3b29eVaFugSROkmVMgtaEPcGArN7SvGV3evl+Vh6q7K38ZIzKd4xKvFDUN1gS
	sATAv0mfO+nm6pERH3Mgtjnviycte69wFjnpib1UVjTO9wyleAKY7YJaF8+b8jaeFmcnFK4yMUA
	2U0/o7cWBBvQLKt8GuL+kVCB8iFvrVoeFActy/PxoggA
X-Google-Smtp-Source: AGHT+IGJHBe1tE73+gCUVJrtdihmneKyQqRpzUdV8C0iHKB/EZurcAQuVHRzs5jeBKVkgUEGi5SiuA==
X-Received: by 2002:a05:6870:8990:b0:2d5:246d:4b67 with SMTP id 586e51a60fabf-2dab331fea1mr7891413fac.24.1746461353628;
        Mon, 05 May 2025 09:09:13 -0700 (PDT)
Received: from mail.minyard.net ([2001:470:b8f6:1b:ec53:8290:86a1:aa7c])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2daa0e59e30sm2058124fac.3.2025.05.05.09.09.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 09:09:12 -0700 (PDT)
Date: Mon, 5 May 2025 11:09:07 -0500
From: Corey Minyard <corey@minyard.net>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Corey Minyard <cminyard@mvista.com>,
	openipmi-developer@lists.sourceforge.net,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] ipmi:msghandler: Fix potential memory corruption in
 ipmi_create_user()
Message-ID: <aBjioyOkty40OVd5@mail.minyard.net>
Reply-To: corey@minyard.net
References: <aBjMZ8RYrOt6NOgi@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBjMZ8RYrOt6NOgi@stanley.mountain>

On Mon, May 05, 2025 at 05:34:15PM +0300, Dan Carpenter wrote:
> The "intf" list iterator is an invalid pointer if the correct
> "intf->intf_num" is not found.  Calling atomic_dec(&intf->nr_users) on
> and invalid pointer will lead to memory corruption.
> 
> We don't really need to call atomic_dec() if we haven't called
> atomic_add_return() so update the if (intf->in_shutdown) path as well.

Thanks, this is in my tree now.

-corey

> 
> Fixes: 8e76741c3d8b ("ipmi: Add a limit on the number of users that may use IPMI")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/char/ipmi/ipmi_msghandler.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/char/ipmi/ipmi_msghandler.c b/drivers/char/ipmi/ipmi_msghandler.c
> index 8b2c3fca9c4c..064944ae9fdc 100644
> --- a/drivers/char/ipmi/ipmi_msghandler.c
> +++ b/drivers/char/ipmi/ipmi_msghandler.c
> @@ -1240,12 +1240,12 @@ int ipmi_create_user(unsigned int          if_num,
>  	}
>  	/* Not found, return an error */
>  	rv = -EINVAL;
> -	goto out_kfree;
> +	goto out_unlock;
>  
>   found:
>  	if (intf->in_shutdown) {
>  		rv = -ENODEV;
> -		goto out_kfree;
> +		goto out_unlock;
>  	}
>  
>  	if (atomic_add_return(1, &intf->nr_users) > max_users) {
> @@ -1293,6 +1293,7 @@ int ipmi_create_user(unsigned int          if_num,
>  	} else {
>  		*user = new_user;
>  	}
> +out_unlock:
>  	mutex_unlock(&ipmi_interfaces_mutex);
>  	return rv;
>  }
> -- 
> 2.47.2
> 
