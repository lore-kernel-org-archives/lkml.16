Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 772AB2165E9
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 19:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751053169; cv=none; b=QWYq56MRAkBRHjaRnMuAHzc9tnfYCi4AphNp+DvzDQ35J6LDWJPNDfyhxQxEFRid1jwg8Pgb2elZdxCIwrBYwrOafAyN4/XVIrbcbVDW9J1DnzI8You44uI8W0iIaxVwKWvJ4tIEFug+JTscz/cDrADNPdftdrj4ZqNbJu58oMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751053169; c=relaxed/simple;
	bh=fN0Kh2ojk27IcYub4BPpYkImoeGoFKi6u7WjndHiWkA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XegQJwB98OBqcs+WbY0X6AuaS/WdTtCN/cr5UEvUHrKdbgorjJcsDr0WgGqaLbhrU/xcJKrOBTKBlQcW3V226pc53oEj60g7PLNMlEb5qxxrlLQaYvkriHoY3ofYMEfbEuWq/DYyzvtyKeAzsl4M838Rg9xBt8nHjIXRWnWy4Kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ClbQgmRd; arc=none smtp.client-ip=209.85.161.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ClbQgmRd"
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-6118b000506so762918eaf.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 12:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751053166; x=1751657966; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=suI3XDptlOt7dxiujjvASAv8boeYPAFXuAl8v0Kjmgk=;
        b=ClbQgmRdxBmEgEXLif5gvb9zYhGpMr7rh2gVVmWCY5DlCow7eWtUty7FvDby/QWYgi
         Di7Fj8kTIiNDa3EtwsZKeQSxLHWDDZlIWuUr/k5/z6QtyZK3vvXh3Z6J83ToIneKDwoL
         2CET2ktqtjDh9/GFCHc8Xq4nqKlxwX6AjYBjHlUG8NQv1OT9CldWle9GPHLEA8A4XSEn
         XR6O8Ql4+LAlz3oJkCg50s3XT2n7dWwIXD8Z9z4phojBcGgdNZkYjKCuO56hkrtNX1Vi
         NpGL+U/+q4VAPuvH+eusloNmFjDxWXM2s+WrrYhYxBXynSlu9jLlvf7ObeolTMX70hJ5
         oVkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751053166; x=1751657966;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=suI3XDptlOt7dxiujjvASAv8boeYPAFXuAl8v0Kjmgk=;
        b=kAx4/OMpnad50WUSSLqedUXI05OO6fa9rCuAmdGEqeDnjfympsM7N73Jiq1ybT+gRr
         PnsCgfYt4JR0DykPZ49T4B29ZgeMMZrTtluTyQ0r0h6/nhkv26Wfs0q+3amFTGadK7Ac
         oiI9a+x3ErsGYDRH9tACrRi20lfDE9Ql86t2vjA6LF3bFk1Bw/8xuU67hBYeGDghTLKk
         XvVxgLGTYxlJSTk8iykdoiTW3Fv20GeE6Rxf/sam7YulD8uBOotuH7ch2UokqSE6P8JG
         g8rOYeQ+8FwazxQjvz2FT8WAr54E8Xo2Z5PhPDuIh8R/XLbU+Krv7zX+z4SBIF5JnJYi
         i8kQ==
X-Forwarded-Encrypted: i=1; AJvYcCVyj9EK+z95K7hibCrWQERGa5YafE1qCym9pbu+MOLiQ/oKAa3FW2nfBp3uKLtJ+dEuPva83JcW04pvJBo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXzXweq59dwenkDu5GmfmqazWxg80yhGQ4iTtU7N5jdTFt7J88
	x/JeEoshBe/vOLduej9VkozboJTgEfUp6phpxC45WU5UrJiSvf3wXNuuLX5E7zzA3Kw=
X-Gm-Gg: ASbGncs8b35qsJ+b44iQ4qB7qY5O/TCJcR0IJR9rPo//Hsjabxh3BvTbHJvFPm/JISp
	Kz5yHnLZayD837nUQCcLWBs+0K3kCQ+l1OViu82toJeNtMR6x3XU9LsgbtM1T0aXmiKDh1FCoHk
	FKMp7BTjJhGfi7scJt1yt5laZZm+yKEH8Y2OcD6jqhYp85MCpFqNoBUUfMIeuoGZYx/CEMUr/3I
	NPA6T1Ed19BWbYzLS1Qg1wih/In3k3ThqUT2s3xKG/3htw0Bj/3vK0/LyLhYfQmm3x5jHaWaf/C
	UppZ/vaxbzG5lKV97QJMP08YG78gqxcJ6DE6NaRoVWoV/mKgDtMtWPA/sJhvMySQhunOjw==
X-Google-Smtp-Source: AGHT+IF/5yUXUJ1U/LstDtUP6YpGrdRLcEbQGFsZNqCq52p8mdReUkf+RyutYfRViO/wlG1V6E9mTw==
X-Received: by 2002:a4a:e90b:0:b0:611:80f3:eb44 with SMTP id 006d021491bc7-611b90eca36mr3218582eaf.3.1751053166574;
        Fri, 27 Jun 2025 12:39:26 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:f3a4:7b11:3bf4:5d7b])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-611b848d77fsm311990eaf.14.2025.06.27.12.39.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 12:39:26 -0700 (PDT)
Date: Fri, 27 Jun 2025 22:39:23 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Abdalla Al-Dalleh <abdalla.ahmad@sesame.org.jo>
Cc: Dave Penkler <dpenkler@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Rubin <matchstick@neverthere.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Paul =?iso-8859-1?Q?Retourn=E9?= <paul.retourne@orange.fr>,
	"open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drivers: staging: gpib: minor fixes for some C macros.
Message-ID: <4edd380e-6314-4fa0-8051-ac55144e061d@suswa.mountain>
References: <20250627193613.552193-1-abdalla.ahmad@sesame.org.jo>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250627193613.552193-1-abdalla.ahmad@sesame.org.jo>

On Fri, Jun 27, 2025 at 10:36:13PM +0300, Abdalla Al-Dalleh wrote:
> Ran checkpatch.pl on drivers/staging/gpib/, found the following:
>  - gpio: gpib_bitbang.c: wrapped LINVAL macro w/ parenthesis.
>  - hp_82341: hp_82341.c: Used comments instead of "#if 0"
>  - tnt4882: tnt4882_gpib.c: Used comments instead of "#if 0"
> 
> Signed-off-by: Abdalla Al-Dalleh <abdalla.ahmad@sesame.org.jo>
> ---
>  drivers/staging/gpib/gpio/gpib_bitbang.c    |  4 ++--
>  drivers/staging/gpib/hp_82341/hp_82341.c    | 14 +++++++-------
>  drivers/staging/gpib/tnt4882/tnt4882_gpib.c | 14 +++++++-------
>  3 files changed, 16 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/staging/gpib/gpio/gpib_bitbang.c b/drivers/staging/gpib/gpio/gpib_bitbang.c
> index 625fef24a0bf..45cf4571c58d 100644
> --- a/drivers/staging/gpib/gpio/gpib_bitbang.c
> +++ b/drivers/staging/gpib/gpio/gpib_bitbang.c
> @@ -47,10 +47,10 @@
>  			dev_dbg(board->gpib_dev, frm, ## __VA_ARGS__); } \
>  	while (0)
>  
> -#define LINVAL gpiod_get_value(DAV),		\
> +#define LINVAL (gpiod_get_value(DAV),		\
>  		gpiod_get_value(NRFD),		\
>  		gpiod_get_value(NDAC),		\
> -		gpiod_get_value(SRQ)
> +		gpiod_get_value(SRQ))

This breaks the build.

regards,
dan carpenter

