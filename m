Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4179927A936
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 11:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744717152; cv=none; b=mmGPmH8y70eB2X152bk2aFjl3o1Dz/5pDaZhjZY9F0Dg5ixSUF0S6jzEMIqCsklNIR3rwxRCNE+YscY37uByGUcbWRe31EZ/5TBVuX/pCi+t80ITieW53LvJzP1G5cpiiCi0m71/kYerxMV9zYCpddlbX0LgC5JxflH5aN5E1CA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744717152; c=relaxed/simple;
	bh=BhNz9z2uhmXkHpxm02pi4D65XhZgtBupMPkVQYFgDBo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GPp8VF+E28IUhVgC3JxytT6vHokGZGqk1FSBhcR5rEV3yTHrD+SB3RE/aiP1lLNXL24WAaiO0NiJE/salj1mtH4Bj6Zkn099LwQYAm5UiChXnfwm913ifcSd9Kfo+gXZJioBVjXUUQHXTBTAewvEngh1ujsqlawa23TMaqp/qp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minyard.net; spf=none smtp.mailfrom=minyard.net; dkim=pass (2048-bit key) header.d=minyard-net.20230601.gappssmtp.com header.i=@minyard-net.20230601.gappssmtp.com header.b=0bk7+Ubh; arc=none smtp.client-ip=209.85.161.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minyard.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=minyard.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=minyard-net.20230601.gappssmtp.com header.i=@minyard-net.20230601.gappssmtp.com header.b="0bk7+Ubh"
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-601a46ee19fso2611908eaf.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 04:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minyard-net.20230601.gappssmtp.com; s=20230601; t=1744717150; x=1745321950; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sdC+ybos8o0ITBqE7ZOhXVTr+xRo3uW3qXJPs1bo0DU=;
        b=0bk7+UbhC4l7eHuMQ7SWrQDB1rZYQ2gEZyIZhPLRDkjX93yAMW2QcxSkKq+W41V3Kc
         pA2NW+0OWruD1Kr1BJoqru3QiKhAv9b0lHjBXWU0OSG/HuGRshZWEnscGGdOTJj81sBj
         50xL3M3SPHiHtyenEc3pQqdkLdxx9FlulFdTLiF8ESzCPgAqQ5binIEht2gZ2lQhlFHd
         voAe3nAGO7GR4UGUlE6bNS7dM//VxWlOfWUdE0h5YMR7TF55lhx8q6vYhLiJssqkF1cH
         WZWbyWPenDWzdWSGB0qsQjVCswHcSUAdr0KS2e8qXPpj8LqmxP68nI3MCraeB8Aktm3d
         rHUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744717150; x=1745321950;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sdC+ybos8o0ITBqE7ZOhXVTr+xRo3uW3qXJPs1bo0DU=;
        b=ftoy04r3BuNh0aIoJYJkW9aL3aiOqimYsAJvMA+ZfbypT5fgwrbq1VB92DwfjI5oMG
         CBhxr4ENZOAjFEPWHfoW+j7xjczK4i76Q4G0qDMxu7KNCiNDWpGHIePFff+acbu6j0DS
         j90ykDc9yTQL9oqsKYhhWCH/A48xm5z1DNKgonwTPrhNZD7pvUA+aiUxMwEkKYkW5AXC
         7xfAOAbNH1Wxg3qXd8d+D+cQjNIRze52zv0DiUd8l8gLK4GOBPyShUTzs4RgSfv2bOjg
         VZ4jjk+5q+Iv4bjYgXBOzMteqs9QABnaN4nS0FIEGSOuPAmuIp0zebHj/9ygPscXkTaB
         P+yw==
X-Forwarded-Encrypted: i=1; AJvYcCVZt17hypThN4dYHsNWS5NhR9c3MJLIUKyOvTx4oetdQ9PXWvuh8F/t+QxAwauyF0cbv2wZY+4N8Ut8vBE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJTcr2yC3inqKFJEJF/XuTS+k3ed9ueweO7/RzRihwh5Zv8I9P
	MDLrdbojVW182hlHFxW6dVoBYZZcRG4J+1iuPJ71n9x61iMNxd54zwlf65JqlG4=
X-Gm-Gg: ASbGncsnslQsUTpblTOZIrAw5wMri5hVBEwHNXEh5p9OsViS1hSPL+a1uc/Lkl++CHB
	I/+kg5faMEDVnoEGjO5TC14VSTql3ESzmiKIQxWe6/+UeaIebxsCBZhBiWE5hwlDxPFEmklBsW1
	n7QQQCSXYlOo7tL5B+g+Kb39VPueGUjlb5zbgiG2Ow1MDqnC/H3sHSBJlYfEtlY4L77h8wl214+
	bkXXiF35anXIZmFlA7Zd2RKZlplmJPfKi4s/WzwIX//pyZUetDQRzJlI0/5YG9KgWG9j4a/hRRK
	+693kohyZ5QOLVlMSO5RmKnFhtDMuQrm/lzYED4LLXtA
X-Google-Smtp-Source: AGHT+IEWPVoxhxIvxVHdnqC7V9/omUZ3FlFGZ3fwPxEPX6EqBcnW2Xm7wlYDSJKTdcPaMOSX3JLTkg==
X-Received: by 2002:a05:6820:99b:b0:604:d2b:c585 with SMTP id 006d021491bc7-6046f587ad1mr9852773eaf.3.1744717150155;
        Tue, 15 Apr 2025 04:39:10 -0700 (PDT)
Received: from mail.minyard.net ([2001:470:b8f6:1b:2b95:bd83:8713:77cf])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6045f53776esm2340926eaf.22.2025.04.15.04.39.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 04:39:08 -0700 (PDT)
Date: Tue, 15 Apr 2025 06:39:03 -0500
From: Corey Minyard <corey@minyard.net>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: openipmi-developer@lists.sourceforge.net, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>
Subject: Re: [PATCH v1 1/1] ipmi: si: Cast to smaller integer type without
 warning
Message-ID: <Z_5FV65cyIwiI9rs@mail.minyard.net>
Reply-To: corey@minyard.net
References: <20250415085156.446430-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250415085156.446430-1-andriy.shevchenko@linux.intel.com>

On Tue, Apr 15, 2025 at 11:51:56AM +0300, Andy Shevchenko wrote:
> Debian clang version 19.1.7 is not happy when compiled with
> `make W=1` (note, CONFIG_WERROR=y is the default):
> 
> ipmi_si_platform.c:268:15: error: cast to smaller integer type 'enum si_type' from 'const void *' [-Werror,-Wvoid-pointer-to-enum-cast]
>   268 |         io.si_type      = (enum si_type)device_get_match_data(&pdev->dev);
> 
> Fix this by intermediate cast to the uintptr_t, that makes compiler happy.

Unless things have changed recently, Linus prefers "unsigned long" per
https://patchwork.kernel.org/project/linux-hardening/patch/20220616143617.449094-1-Jason@zx2c4.com/#24899749

And it would match what is in the match table.

Is that change ok?

-corey

> 
> Fixes: 5be50eb5ae99 ("ipmi: si: Use device_get_match_data()")
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/char/ipmi/ipmi_si_platform.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/char/ipmi/ipmi_si_platform.c b/drivers/char/ipmi/ipmi_si_platform.c
> index 550cabd43ae6..47d3cbeb3fa0 100644
> --- a/drivers/char/ipmi/ipmi_si_platform.c
> +++ b/drivers/char/ipmi/ipmi_si_platform.c
> @@ -265,7 +265,7 @@ static int of_ipmi_probe(struct platform_device *pdev)
>  	}
>  
>  	memset(&io, 0, sizeof(io));
> -	io.si_type	= (enum si_type)device_get_match_data(&pdev->dev);
> +	io.si_type	= (enum si_type)(uintptr_t)device_get_match_data(&pdev->dev);
>  	io.addr_source	= SI_DEVICETREE;
>  	io.irq_setup	= ipmi_std_irq_setup;
>  
> -- 
> 2.47.2
> 
