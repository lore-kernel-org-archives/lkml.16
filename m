Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D1111F3BAB
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 16:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745513916; cv=none; b=PP834j9DpzchguOiRgn5xSycEmjCKMqrMD+6tDxqUwtwGqEo11tqLF62bQkLH6sO0S9ByFWMwZghFwZYTEtuYuxo2Ucan/uLeomEQhycrLTIyXlGrvWDxSwJCbp45qQ8E9/gaSlzNQxwXYgKzUnzdvfup+XForDAMB2JpqtvwqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745513916; c=relaxed/simple;
	bh=LikPWzHKXlZ0AYHql8L8oY6SV6BxDqyvwmWhGZMgt30=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DjPWsWXBW7RW3KgPbnw3kheBvrvO077icdoFSPvEOQCDHv2NmaQRAVBbTa67+Wps1yaLLAdYtsNEGT5Ug7KKhAK7tUEs6W62ImiyIorwaNIbeUq8FTcL+oHeCxO9H14UGQQxIIOPGHPGm6s8k5GsKruxF50c2JA6+FUOijYaw9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com; spf=pass smtp.mailfrom=fastly.com; dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b=hFLHoD2d; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastly.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b="hFLHoD2d"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2255003f4c6so15084095ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 09:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fastly.com; s=google; t=1745513914; x=1746118714; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3CRbLMNDhQNMb/odIgtWlV1wOeeHs/lBu8IWLIInXCM=;
        b=hFLHoD2dDxbEuqS4SMJ7Ad6I4sudpcVJli4ahff432zd6E5dmhkOOK68DzgT4mN//i
         tZSNPZaXSFvuoIor9RBAWpTB7S1AL4RxWsGyvEf4pssN4xR/KvEbdqcqKFBHccm5tr1b
         VGg+nY1qauYF6KVKgYsWeaLFmEDr6gdym/YDI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745513914; x=1746118714;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3CRbLMNDhQNMb/odIgtWlV1wOeeHs/lBu8IWLIInXCM=;
        b=FDPBsFaBTc1gNQSSkAgVKXHWqZmnOROgAwh12fhzB3+3nZjWOdRaAIl9r7mlT3lsLX
         HpMtzYaiZsiECUaiQMu/lJ+OiXvIuf/0GVykDxN0n8XTzlSuL4PDzxj2gyZpXXG/tsaA
         SQWeqVdaex0lBXOA5z17Q0T6fmRj/mDx4lmjyIVYdqCFy5hpg4iJkTOvoK/8ArO5MmkL
         RlevmzK+og2x6K2CoJMeW0eSe/ZhiM0qIgRZDcXgDSGfjSrKi8ZCe9a5osj1CAKwfcLP
         4CrdyX9Q/svi4IbAKb14XHjMPn6KFV/C2hWsRh5src8UScCisxf8m6PAgmtXwc+xGsMs
         VH6Q==
X-Forwarded-Encrypted: i=1; AJvYcCVjpyjZRJxbnTBISqtOxrh4xoHSm47qxSIrXectLXyJ1hz4RW8v54uHBYR0untxeXEcxb7kaJ5M86uYu7o=@vger.kernel.org
X-Gm-Message-State: AOJu0YzbObSdnHH1MutJoU3DG54KopARtrHeY+xLmrheQ0XqHYfZS5aX
	TJ3FG2NtBhNge8uW7dY84tyi8Fnan7lDKwMPk9zx89JkKkL5xq4y9qg9V6RbSUw=
X-Gm-Gg: ASbGncth8nYl1riAvkSEz0uPihueOCprvhlsES1KV61J7AtMyCjheLYMHQ81z2jA6QO
	Xyl+ieEFf0bWGbvMl9y6M2UkKIpioybSugfLDBjSp87WWAqVlhiH4uTMObWyvsazhC5tDIzWoCq
	YgOnvy9f7EM0+3e9jZwjHKiTHMmrxSzNogKV3kjhde1xUQE2TlWleGVWZ4l4O2MRqsV2jtzkjtM
	cXuWVBTqcdOexE8wq5yTKa+HR0Ll4U3/EJm5YsbHlJNV+NSLaFrY7kDBRz5n+Qw/LZziR18WM3H
	WdIuzE8OIkwZoIcvjyxnn2iCN+NrfYcXwfh+panYO6T7r9VdT4wtL1SQBWFqCYf1y0AiRbQVAwH
	oeJGI+izsaCEj
X-Google-Smtp-Source: AGHT+IE71FOArPf4fbjAK6Tz9mz5XvykXh05FzQ9Ed4nGtj0H+VIVi4oA8obRPXBo9ZdgRuJ/X8wkg==
X-Received: by 2002:a17:902:d589:b0:223:fb3a:8631 with SMTP id d9443c01a7336-22db3c33a03mr55527375ad.24.1745513914369;
        Thu, 24 Apr 2025 09:58:34 -0700 (PDT)
Received: from LQ3V64L9R2 (c-24-6-151-244.hsd1.ca.comcast.net. [24.6.151.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4dbbf8dsm16031545ad.65.2025.04.24.09.58.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 09:58:33 -0700 (PDT)
Date: Thu, 24 Apr 2025 09:58:31 -0700
From: Joe Damato <jdamato@fastly.com>
To: Justin Lai <justinlai0215@realtek.com>
Cc: kuba@kernel.org, davem@davemloft.net, edumazet@google.com,
	pabeni@redhat.com, andrew+netdev@lunn.ch,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	horms@kernel.org, pkshih@realtek.com, larry.chiu@realtek.com
Subject: Re: [PATCH net-next] rtase: Use min() instead of min_t()
Message-ID: <aApttwNRkiMP6xMJ@LQ3V64L9R2>
Mail-Followup-To: Joe Damato <jdamato@fastly.com>,
	Justin Lai <justinlai0215@realtek.com>, kuba@kernel.org,
	davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
	andrew+netdev@lunn.ch, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, horms@kernel.org, pkshih@realtek.com,
	larry.chiu@realtek.com
References: <20250424062145.9185-1-justinlai0215@realtek.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250424062145.9185-1-justinlai0215@realtek.com>

On Thu, Apr 24, 2025 at 02:21:45PM +0800, Justin Lai wrote:
> Use min() instead of min_t() to avoid the possibility of casting to the
> wrong type.
> 
> Fixes: a36e9f5cfe9e ("rtase: Add support for a pci table in this module")
> Signed-off-by: Justin Lai <justinlai0215@realtek.com>
> ---
>  drivers/net/ethernet/realtek/rtase/rtase_main.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/ethernet/realtek/rtase/rtase_main.c b/drivers/net/ethernet/realtek/rtase/rtase_main.c
> index 6251548d50ff..8c902eaeb5ec 100644
> --- a/drivers/net/ethernet/realtek/rtase/rtase_main.c
> +++ b/drivers/net/ethernet/realtek/rtase/rtase_main.c
> @@ -1983,7 +1983,7 @@ static u16 rtase_calc_time_mitigation(u32 time_us)
>  	u8 msb, time_count, time_unit;
>  	u16 int_miti;
>  
> -	time_us = min_t(int, time_us, RTASE_MITI_MAX_TIME);
> +	time_us = min(time_us, RTASE_MITI_MAX_TIME);
>  
>  	msb = fls(time_us);
>  	if (msb >= RTASE_MITI_COUNT_BIT_NUM) {
> @@ -2005,7 +2005,7 @@ static u16 rtase_calc_packet_num_mitigation(u16 pkt_num)
>  	u8 msb, pkt_num_count, pkt_num_unit;
>  	u16 int_miti;
>  
> -	pkt_num = min_t(int, pkt_num, RTASE_MITI_MAX_PKT_NUM);
> +	pkt_num = min(pkt_num, RTASE_MITI_MAX_PKT_NUM);
>  
>  	if (pkt_num > 60) {
>  		pkt_num_unit = RTASE_MITI_MAX_PKT_NUM_IDX;

This looks fine to me and the patch is against net-next according to
the subject line (I think?).

I suppose there might be the question of whether this should go
against net (because it has a fixes), but my vote is that this is
cleanup and should go in net-next as titled.

Unless you've seen a bug around this and it should be against net
instead?

I don't know, but I think it is unlikely there would be a bug in the
wild because:
  - RTASE_MITI_DEFAULT_TIME (128)
  - RTASE_MITI_DEFAULT_PKT_NUM (64) 
  - RTASE_MITI_MAX_TIME (491520)
  - RTASE_MITI_MAX_PKT_NUM (240) 

all seem to fit in an int, so I think this change is probably more
of a cleanup than a fixes ?

All that said:

Reviewed-by: Joe Damato <jdamato@fastly.com>
