Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CF1A2E645
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 09:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747041426; cv=none; b=M9bs3zk9Mb7+TVWOAi3HGmVUbPyDv2vnizkHAaGvzpT3G6NSoWznv/1iDo4vHYnu8JdPk3jeT849JwuNtv2Ga/dt56R9Qctd2Em8d9zZZIFVoVZsMdQrOkf3cerijYPJ60L0L+4sUaPyzcONg3CBgLZYNVpVLVQOlxdkfJqg46E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747041426; c=relaxed/simple;
	bh=4JHWQtD5VUidfJI5qSDVeFsSE96Iacz0eGd/SM8Rb7w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YyEULQO/3mntI2LlQnfqWpqKybnjFf+CN4CW2MX+DTO1vlxz7bBADkIx6eYLl3NVTmIoYehOR59ATPOkdZnq8mqkLM6CJvftsk6lCHDfuCNmAlAOYx4G6ZJGB7tosibLsRoUKwjqh/4kiCGAJdt3s5B8c5Pee+/vSmdVbe9B6WI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QheC9Z9G; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QheC9Z9G"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-441d1ed82faso29094255e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 02:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747041423; x=1747646223; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nRFLE3s9Bruf1VCyUAW6Rf8xhCic7rN3m+YlZIBz8vQ=;
        b=QheC9Z9GfSng6VcX1HAL5tLJG/nOdrajH7f1BLvj7r5qx5KUTHi4N9iETeRzar1Qxs
         NVO9MF7xo5MKG/ILR0D9g0J63UlRdl4PnPP4pyGHBtS9WrMMiVLz5Seb5iksYuCt2AJ1
         T7yZ4uzbz5KeZsi/RnRyi/abAejvsI/87JYTpXzP/2A8qvAUyW9VtHN8QLh2dAFA4Yrg
         UHZh8Umwz0YbTzEqMMKSX+GOeWC/NOEUe4flmWiq8KegNTU/zL9KNgN0JAK9dF4SaxEL
         NvvkP3B4jaHKSiJjvV2aGq1VYVnOsZnGK6nnXebKXoqut71wxKamkk07qBjRRqaz0t/x
         eMzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747041423; x=1747646223;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nRFLE3s9Bruf1VCyUAW6Rf8xhCic7rN3m+YlZIBz8vQ=;
        b=SlfHYWdWFHd+TUta5N54dWufnniYiJpzuiXFvihTiC5EzKXrhGzvuaBs1El+dYZ9fk
         mL8NMFshktJOqyMUljEhMrLbA0OM75x0YB/EyUBGRYclpaRYoqzeOU8nve/7h0P4pWzL
         MA65ZMLgsalsuMYKwh0vKBpZ73gtbIxQGa8C1I5KCAWAQ4YTKRQGYS3lEN2QwI/FoYhq
         4RV60zYtg56UJukKezb3WLNosz86PgjtuztxkRPsx07joB8Zix88LXpWvaxAzzUD81tw
         7ZhaevvCN5DYDTc8+ysdBOM02Xt32XE3ME4h6RJXuEnFKO3WK8d+o3a6XYphAO+/ymoZ
         Ei0g==
X-Forwarded-Encrypted: i=1; AJvYcCWHRLW9dJVb97O3nYXow+1Ks3/ZiobMh93rdKo130NvSflqcirSmEsryEpn5fGsbDZskH7avLY9aaIlBss=@vger.kernel.org
X-Gm-Message-State: AOJu0YxahwjMpBDv0+C72MqWqzByc4kU1neUfpW+iO56ifYN2YAvmASF
	u2l8gxz4BOiCcXcX7LZX2izTEmVt7uLoArNyvNg77reiEJ3UQAfK
X-Gm-Gg: ASbGncv35MOPAuV4MvCEu2u/BogAyqP9GK3etTmro1tWt+Vcr68zq0YUQRp853EtNMg
	QXhhSPJZ/em6Cqp/eOuDrer4Pl+18Qmi9r4p0yeDypTQLO7jllVxgz/6FTAy9Alcl0y4ohiUQAT
	CB+Y0L6Ro6J9FtcJTfb9ueyplLd+6BW1eL9imPkjcggGrHjcxaSag5izAmNqMxdntNZ/t7Wdkxx
	h5nOc3Fsy516mRC2A364ek63EPEttYLrXug7s0aYC5j19srOFkpRYMFFxTxD/wG8L19dLvZPPil
	/1VjWBnDsX8+qyn+MHzYcngU9lFHSsF8cGHHZYiC4ppR
X-Google-Smtp-Source: AGHT+IEkFmH1KxHL9I9yJXaVSzYPTzM7e7It56PAmN5cCAz7vgAoMC4bm8LOyC0GJ+1F/pUgvWXhMw==
X-Received: by 2002:a05:600c:8212:b0:43d:b3:fb1 with SMTP id 5b1f17b1804b1-442d6ddd806mr99404725e9.27.1747041423109;
        Mon, 12 May 2025 02:17:03 -0700 (PDT)
Received: from egonzo ([2a01:e0a:9ad:d3b0:ec4c:9f30:1dfe:440a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f57ddfd6sm11596764f8f.4.2025.05.12.02.17.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 02:17:02 -0700 (PDT)
Date: Mon, 12 May 2025 11:16:58 +0200
From: Dave Penkler <dpenkler@gmail.com>
To: Thomas Andreatta <thomasandreatta2000@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Thomas Andreatta <thomas.andreatta2000@gmail.com>
Subject: Re: [PATCH] Staging: gpib: iblib: iboffline check if board is in use
Message-ID: <aCG8ivhN64EYsuki@egonzo>
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

use_count is never zero for an initialised board so this would always
return -EBUSY not allowing a board to be placed offline

> +		mutex_unlock(&board->user_mutex);
> +		return -EBUSY;
> +	}
> +
>  	if (board->autospoll_task && !IS_ERR(board->autospoll_task)) {
>  		retval = kthread_stop(board->autospoll_task);
>  		if (retval)
> @@ -262,6 +270,7 @@ int iboffline(struct gpib_board *board)
>  	board->online = 0;
>  	dev_dbg(board->gpib_dev, "board offline\n");
>  
> +	mutex_unlock(&board->user_mutex);
>  	return 0;
>  }
>  
> -- 
> 2.34.1
> 
