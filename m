Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD1051DF75B
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 05:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745990463; cv=none; b=JM1a4pUxP26nNPVmZJVW0C5pFa0FsJCM65Hz1nAkO2nHKq6+INlmPOPj5MrLl8U0osAXAh7I6kBxZEt0y5Oj4oT6GZjiJSRc92HdLOgI2PURl4ZlFhM8uXbJ9f7sCO7Vg0WsoVoqrVymfenXPSyTyNi60YyL4SH5TpDUVOBtRuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745990463; c=relaxed/simple;
	bh=3LBZ8CNZY6y9TZGjfZGOceqANuDT2oBaOWkru0fxFQw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NqBvpCgz0ZqsGWTIKF9jP8JZxQk1DSlObGNeFDQOKutspaaRYiaexNpexdDeARDt6cjbV+iGMyqsgrz8wSlzPwJJH7Qqx3l1RtnYuGTfqs/LUaHOpHyAdq0qs6zzpNTb+03K6zlDM9GXOzyzmylvQ4+3DyEioUY/+BDbQzBGkdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nZMCQJZ3; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nZMCQJZ3"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-39c266c2dd5so7484029f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 22:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745990459; x=1746595259; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EObNhpS6QTdve6kAkH7lX8BP03yhDQRh6hSnvdBfWqw=;
        b=nZMCQJZ3YHEiKRq9xdUEFaoGqNt69hP3P0w1XYeo9Ti5qpMznMI/wn7CysKlxaKzKs
         juknxhYTukcAvaVnD0w+9ABsnHGoBw0cSeZQPMsa492Y19Oha7aPjjdNQm0uGwbmEopE
         /bWZWAJ/AWVypjcStPK2ScZO+PG5JdoamwlmfTJ2rbLtMkv/3g1iKhoGpao7h1uMvz0N
         bIST50dmml5umjyNLCf+Asec1o4CUYE6usUaqgVEVJT/Kg93FJY2HZMJJ0CVHMlCgckQ
         Y1i9JAxjiaLxc0wkC6JXNw59AdEbXfVOnWl8/OpmWLeE9iqAU+DPHMR79kkCtC+oGYGy
         LrAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745990459; x=1746595259;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EObNhpS6QTdve6kAkH7lX8BP03yhDQRh6hSnvdBfWqw=;
        b=ecDFhKGNmcLwp/j9ezMoqMkcVtEG4Bwh2CjWD0rGcBGcllGI53PHPQN5lR2ZwHxkx9
         +SYc6oJKTkSEfBvBQqwfuHxNlQdvBcmCsd6uwBjQJOTCWvniUOpuEPPxI0MFCd7TqTAs
         PxwDCg7T8Ia+nezZ5ZtSmvsc0ZuqWWFaMd5GOln9AWbxSjFBE5LSb4qzlQsI7vp0f28W
         1hwJtE8rmis+ut3PoIQRXaQHUx+byh+UEe54Pp4krtLqGyNIOeQ/us6hlWi3u6dUME+F
         IvzpV15JMVWLbFglQrkZfIq6M/wNTmDdNn45q2XdQch6U11ZztLeSkTqFRl+k9ryBTXX
         hN6w==
X-Forwarded-Encrypted: i=1; AJvYcCXG2ufkBpk9Kk1gvFTgf5g+YsvYkFNetMxfcZm5QbarH8ktRtfUTu4A51nIrmdNJT1F5pARwjxmSq75DFM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxgClfE/yVqNjqZa9UADOOjpHD/ZgTrKjdXZi+C4cieMAnNw0t1
	2zOM5Ilvnxf/K11UAmjDukCPIcf2rpQx2DKv3KNfuWbk/xNkEV0Q9ZjCDyX7J0w=
X-Gm-Gg: ASbGncuqWjq/GrcyEqmoCKERJ882U/IszVXMBdn6+UL9OkaKb4n5rvjIPMaPusmolkk
	ZwexrO4yZOvQyvLLLcLrD+Ff+kzgyOp40MixI77+X0L9Pbe52k7CLCjBsnzefaz/vYfqbkNUX1K
	4bFd09y7KzxTKut5WMoAoVikGUPgz/YABuOTZ7VOmgS/eW3XoiQcb6hnaiMNpLVzQkVcoR8mVQu
	K24ikLz++836yHkK1xdsIFaiJ+fIiffxk+BkZp1WB9ImDxpflODhbaPPgoNiRMObJPU3M6Q/Kkn
	cWBfpKRE+PRFpjp6djFXx/TC5NTJLry6ek6c8FJJcDxWXtjrH2Ex0OI2
X-Google-Smtp-Source: AGHT+IG3i/sYdfjxVU/5DJKWsNnGTYm+BVMuqTqLUwyXPnfD53W2Wi3SUbcbcnKkL9uToGoA8/2P6Q==
X-Received: by 2002:a05:6000:2cb:b0:38d:e584:81ea with SMTP id ffacd0b85a97d-3a08f7a04c9mr1444347f8f.45.1745990459186;
        Tue, 29 Apr 2025 22:20:59 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-441b2bbf29dsm10403475e9.36.2025.04.29.22.20.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 22:20:58 -0700 (PDT)
Date: Wed, 30 Apr 2025 08:20:54 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Peter Huewe <peterhuewe@gmx.de>, Jarkko Sakkinen <jarkko@kernel.org>,
	Jason Gunthorpe <jgg@ziepe.ca>, linux-integrity@vger.kernel.org,
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] tpm: remove extraneous space after newline \n
Message-ID: <c4ee8e82-4021-418e-a822-34e56c7322c9@stanley.mountain>
References: <20250429163859.823531-1-colin.i.king@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250429163859.823531-1-colin.i.king@gmail.com>

On Tue, Apr 29, 2025 at 05:38:59PM +0100, Colin Ian King wrote:
> There is an extraneous space after a \n in a printk statement.
> Remove it.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>  drivers/char/tpm/eventlog/tpm1.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/char/tpm/eventlog/tpm1.c b/drivers/char/tpm/eventlog/tpm1.c
> index 12ee42a31c71..566f4df58d48 100644
> --- a/drivers/char/tpm/eventlog/tpm1.c
> +++ b/drivers/char/tpm/eventlog/tpm1.c
> @@ -258,7 +258,7 @@ static int tpm1_ascii_bios_measurements_show(struct seq_file *m, void *v)
>  
>  	eventname = kmalloc(MAX_TEXT_EVENT, GFP_KERNEL);
>  	if (!eventname) {
> -		printk(KERN_ERR "%s: ERROR - No Memory for event name\n ",
> +		printk(KERN_ERR "%s: ERROR - No Memory for event name\n",
>  		       __func__);
>  		return -EFAULT;

Let's change this to -ENOMEM as well.

regards,
dan carpenter

