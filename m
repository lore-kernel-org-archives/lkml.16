Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5102190468
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 15:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743609005; cv=none; b=kWOCWiiWK+yVq/KIswQwBzwopLHL2IYX/9B0bOqzDXRgqYdgxb+9cisYkNZgy7edvRL0ih8FUk0tmuLQvfLgBq44r2S6gJ3J3yuTleiw5XQnPD9tYuFKMKj5nFn96EKe8eAFb32nY2gaohgdx+J75NQl4IogixqzNNxktrq3zu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743609005; c=relaxed/simple;
	bh=9AxsPXpV33aro4Ehcz2kdnc997kXrIf8ngyB8rmtuTU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J8wSm8fojUbq1H2I5Tp5q4hkpE+SUfymG7n185TCaTN+YRHO3sqvpM8BEb/CLcGvGauCf3hV/1fAqAnVDvm+BEnHttg7PPqqF5i4yqrzVUgfJi+zju9LL4l51CBg8ji6i2Ld2rghfEshY2Ou7A+qZ/14r/f0FnloKeqAkO8hBPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com; spf=pass smtp.mailfrom=fastly.com; dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b=a+nRQyLG; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastly.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b="a+nRQyLG"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-736b0c68092so324737b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 08:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fastly.com; s=google; t=1743609003; x=1744213803; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tts1PyQeFznPaCzX89s9ejnq18G5xStDhXIRY8gowkM=;
        b=a+nRQyLG2PBgSzkwuJgMLJIQNg7taSkiw7QXwh/MIR4zvWKkmwHFWTKpsJjrkNpftM
         OKy7Cr8DjgJHNYThFvfrVlcxYORtlNZkR9pdxXrXgFmSTU9jhdVEbCxmGu8IJiK+E2pp
         718wxdWo9hdiIaxgHjd38Yi+4mWqW4ARzTYd0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743609003; x=1744213803;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tts1PyQeFznPaCzX89s9ejnq18G5xStDhXIRY8gowkM=;
        b=rMdPhleByX7xsnxKF+cLh7fxpuHTjBLIDSg22pM5u0n3OG9Hr12m6WiroWQbz6nCC0
         497lSI2/Z0C0VLlFpmVChG3XFhYexw9WaXu02N++wjp8D5G5vVc9e4U+CwILtyrKoXRt
         uMPYDWJOrcSOYAwTMGPGmXwRukhOe4H0o/GJHxstXYMOoheJRobud0RibTeKzkBq7DWJ
         QFwtCQKNFJI0qqoD0A22WL75TLjpb9AMoedgiwqaGefQhMUCEWCqx0V6znFly9Yh4PJJ
         /yOTD5y08kUxn5e2uOEVQrxkuxX2e7Yo0mz+eWGvgAspWwI/DyLHTxTBfDTpAnC8lpms
         YVdw==
X-Forwarded-Encrypted: i=1; AJvYcCXWpi+WEalG4RAX31ROUSkvTAI+QJjGdghgt5K4XdSdlRX4H5K+pqC4hYHZ8gvqF6JJPtSpEdZd/FjYb4o=@vger.kernel.org
X-Gm-Message-State: AOJu0YwcWQXCxvWFyLzvBIan9NzZ7yI8I1HAaTTEInJAvqsEeGuGFlLN
	egIP1yGCHyBeGbX9lgI19foFoh7k9pGDFrWdmlq3dWEWvVo0i1/Y4KqJN5W3XQk=
X-Gm-Gg: ASbGncuC31m0OKIXb3PgVji9sNSK+B1o2HE2HJNLQnhj2guq4seie5WK8PNeuTVI1z1
	TPox9s8sduNd6CuT33/Ix2Ifmv8w8YMuFU1lUK9GRz/c7s9VsbDUWMiROppKRE6Jyg2BG8NGFls
	ry9t9Ghju/3Ws/7tIfvVDvs1ewZU7KtpYeVdwnCouACE8RShxVvTb3i2V29Qn2BS6Vwq6Sq/nkm
	uxj9gJ6u9B/mdcT0gPsR6t2CesbsAWYKxX/tUKl1v6ZXkjb3Ss2vrubJ/NjCZPPdGDOSd1rpa0W
	viOgvHMnl7ZlZSzgtWW2TRCWxnaqzW8zip6BMrfpHrMOqT/oiRjOwg==
X-Google-Smtp-Source: AGHT+IGZ1aQVeL8ZtNpOc9vdjnGS61ySWE+2f6wBfYggOgsl/7d3plYh+nmllez0zd6VBQlgQIBh4A==
X-Received: by 2002:a05:6a00:885:b0:736:5e28:cfba with SMTP id d2e1a72fcca58-739b60fc196mr11053193b3a.18.1743609002798;
        Wed, 02 Apr 2025 08:50:02 -0700 (PDT)
Received: from LQ3V64L9R2 ([208.184.224.238])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73970e2245fsm11062809b3a.42.2025.04.02.08.50.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 08:50:02 -0700 (PDT)
Date: Wed, 2 Apr 2025 08:50:00 -0700
From: Joe Damato <jdamato@fastly.com>
To: Greg Thelen <gthelen@google.com>
Cc: Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] eth: mlx4: select PAGE_POOL
Message-ID: <Z-1cqKd-2avzWQtI@LQ3V64L9R2>
Mail-Followup-To: Joe Damato <jdamato@fastly.com>,
	Greg Thelen <gthelen@google.com>, Jakub Kicinski <kuba@kernel.org>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250401015315.2306092-1-gthelen@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250401015315.2306092-1-gthelen@google.com>

On Mon, Mar 31, 2025 at 06:53:15PM -0700, Greg Thelen wrote:
> With commit 8533b14b3d65 ("eth: mlx4: create a page pool for Rx") mlx4
> started using functions guarded by PAGE_POOL. This change introduced
> build errors when CONFIG_MLX4_EN is set but CONFIG_PAGE_POOL is not:
> 
>   ld: vmlinux.o: in function `mlx4_en_alloc_frags':
>   en_rx.c:(.text+0xa5eaf9): undefined reference to `page_pool_alloc_pages'
>   ld: vmlinux.o: in function `mlx4_en_create_rx_ring':
>   (.text+0xa5ee91): undefined reference to `page_pool_create'
> 
> Make MLX4_EN select PAGE_POOL to fix the ml;x4 build errors.
> 
> Fixes: 8533b14b3d65 ("eth: mlx4: create a page pool for Rx")
> Signed-off-by: Greg Thelen <gthelen@google.com>
> ---
>  drivers/net/ethernet/mellanox/mlx4/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/net/ethernet/mellanox/mlx4/Kconfig b/drivers/net/ethernet/mellanox/mlx4/Kconfig
> index 825e05fb8607..0b1cb340206f 100644
> --- a/drivers/net/ethernet/mellanox/mlx4/Kconfig
> +++ b/drivers/net/ethernet/mellanox/mlx4/Kconfig
> @@ -7,6 +7,7 @@ config MLX4_EN
>  	tristate "Mellanox Technologies 1/10/40Gbit Ethernet support"
>  	depends on PCI && NETDEVICES && ETHERNET && INET
>  	depends on PTP_1588_CLOCK_OPTIONAL
> +	select PAGE_POOL

I didn't look, but I assume that mlx4 does not use page pool stats?

If it does, there might be a follow-up change to select
PAGE_POOL_STATS?

Reviewed-by: Joe Damato <jdamato@fastly.com>
