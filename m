Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54A661E2845
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 14:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747061943; cv=none; b=h9P3rIkLc9TE43NePTGBkHboLQ2lsKcjXs9yNEYLJAyOPj76wB5CfN5kx6byb07eWt4wO7K3pXiogxetScpBUSvvJu2ecGbACM/q5oX3P1Ad/Nvbz/uke9EVxFPq5Auu8pvU6WgEhO3R71UkALF7OqT8tmhG/AFeBw4IuGxM02k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747061943; c=relaxed/simple;
	bh=nX4mrCmrV7a8TXs8dMRqXfhV5Pu7RxOI1NSvV5NmIJw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QM80CY56Dck3STrFKIE5AcLgmwtuyQCDbaF6GICAQf4TnkPFlXGxF1RJ5c1vF1lBU6jvAlqVdfuw8h1PIMhm9RziQuUdLwUUL5YKeVVmWc/f70LA3WA2fgK39gi9D3SQQeW8tSW3o8F7MzhR81CJRIMIwoecZc8AtI8EQ/dIRhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IvI9wS1d; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IvI9wS1d"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a0adcc3e54so2752205f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 07:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747061939; x=1747666739; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DtZnGYGPMyogZRHWWFnmILYOBdf7NNPZ8lnkGuF8Wjs=;
        b=IvI9wS1dpKj6UHWGd1+70O1qPuh9JujYeb0BnF/xf6IRPaGWNO/hSTOG1SZxu7yAAn
         et9o8kdEzr0WaqIno5HxASO1odfUUoSdeYuNMZOXDVKSfo5eKCPCMPicP8fCBxUS1WE7
         MZsEbNS1vlw7A8Ku40j8LsrFe83CGmjIzK7Mn6yC001MAesy8MdHLtNPhu9Ye7okDxHx
         +s/cSzINi5KkOi9BtzP5OfoUU8Wy1V9zHf0vzBqwor7Z0XvRUt98s4NYlN138oqBveLH
         /NU1UGTkVCToK2vM7lH81lKYTdc9sjgr1+9czZxJk+naJ1HtIljNovLjoA6cBcQSw+dD
         njJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747061939; x=1747666739;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DtZnGYGPMyogZRHWWFnmILYOBdf7NNPZ8lnkGuF8Wjs=;
        b=rJoK//itKdpDNBpyp5/FfDS9RVVMDhyojp9i3c1tIcyN7+Y4LZ/iD/YgyUIpnveb9r
         2obFlm7d2wyIgY1dZOFDpOZ/UDpJy7gWiiC6XZHa+pKxgiUvkFnuzFSRun8CWvcINK8W
         VoT5MeFfRE/ourmY5ktBR50mmZYfvuKVj/64Q0GUYfBHjCXyKHbIDd/tkmhWDeTqOGIJ
         ItZo9Kn8HqcmPJek8sKtMgsfRsrOlU8W/w8YWN5dpw/w01Q1E4M4eu/CkZaPrCcyAhUE
         MBbbco5p67RhZH8LEwWVzSZIDKBhEV06eVTpNhL6XRFgHQeR7u6JUcDWkHuf6GngOkbH
         P7Bg==
X-Forwarded-Encrypted: i=1; AJvYcCVqMMEJKzGG5pJgRe3DP7DK2g2cjSbToeAlLhZyfdThA9b+0CbSCjHMEWXiO7O1mAvVFdGdeK2fiZb4hyo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXb0m6cPqQeB/ujGctR5c5gCGcoz+7dZULVJq1C4Jjq2s2wPCu
	8LyBNoRcWSiVkde6JBx1RNDs16zzEcQ8GOMiSpei6pav1DyvBrzqijWQ0AVKKfI=
X-Gm-Gg: ASbGnctbaiRjI0fofiT/VRAY1FUBcHn23XMDXNERqQ3ivvKzFSvn372Yza4GUuh3ZDh
	Gv03UCq1k5C+jS5nWY1MvFTejXRjNcCSqYc2B7a4NTPZu93bgdnxbBXdh+xd/6WQa78eIVLSyxC
	3lyzSJFzvUnoLUuZA7YtQsEziiI9JMLspE1KavKvryU+RZwKjxNkqsF8G2Cdguhb8e1Ida93Fgj
	j1Cf03EWUEDYVYzzBR0ppN1RsGeHL+jHvF/GmtcFltk2aVAFf+ho6Dpn0etxBchA9pVteQ3LG47
	ZLKDBskFBeqSDqoLDjS10HqQRvr2isLkQ9GVFb6qy4ZWOqhTpT6YcH9ixikKoMVsB0+qOpUHI0K
	nXtHBjA==
X-Google-Smtp-Source: AGHT+IFK2Io9T0LoWMfGqVukVC0DwlRDYE+gJbyTdOM/SShFC3RaE97AQZzfdNXn4Tu00BPTMA461g==
X-Received: by 2002:a05:6000:1882:b0:39c:30c9:822 with SMTP id ffacd0b85a97d-3a1f6488d3dmr10395567f8f.30.1747061939570;
        Mon, 12 May 2025 07:58:59 -0700 (PDT)
Received: from localhost (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f58ec8f1sm12519850f8f.26.2025.05.12.07.58.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 07:58:59 -0700 (PDT)
Date: Mon, 12 May 2025 17:58:58 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Thomas Andreatta <thomasandreatta2000@gmail.com>
Cc: dpenkler@gmail.com, gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
	Thomas Andreatta <thomas.andreatta2000@gmail.com>
Subject: Re: [PATCH] Staging: gpib: iblib: iboffline check if board is in use
Message-ID: <9632c958-9c35-4282-9e20-ce84d10a6b20@suswa.mountain>
References: <20250510172419.274616-1-thomas.andreatta2000@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250510172419.274616-1-thomas.andreatta2000@gmail.com>

On Sat, May 10, 2025 at 07:24:20PM +0200, Thomas Andreatta wrote:
> Ensures that a board cannot be taken offline while it's still in use.
> 
> Signed-off-by: Thomas Andreatta <thomas.andreatta2000@gmail.com>
> ---
>  drivers/staging/gpib/common/iblib.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/gpib/common/iblib.c b/drivers/staging/gpib/common/iblib.c
> index 7a44517464ab..0ab5680457ac 100644
> --- a/drivers/staging/gpib/common/iblib.c
> +++ b/drivers/staging/gpib/common/iblib.c
> @@ -240,7 +240,6 @@ int ibonline(struct gpib_board *board)
>  	return 0;
>  }
>  
> -/* XXX need to make sure board is generally not in use (grab board lock?) */
>  int iboffline(struct gpib_board *board)
>  {
>  	int retval;
> @@ -250,6 +249,15 @@ int iboffline(struct gpib_board *board)
>  	if (!board->interface)
>  		return -ENODEV;
>  
> +	/* Ensure board is not in use */
> +	if (mutex_lock_interruptible(&board->user_mutex))
> +		return -ERESTARTSYS;
> +
> +	if (board->use_count > 0) {

We're not holding this mutex in ibopen() and not necessarily
in ibclose() either so this doesn't work.  It's racy.

You'd have to change the ioctl as well.

regards,
dan carpenter

