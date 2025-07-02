Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBC01224B01
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 06:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751438355; cv=none; b=gFpVWUXgYe+SWYcd6DEnyKh4hHivj1eW6syuDXQeihLrZ3gOnICsS3uOawrrvpUrqUqLmKeHJi4zJ7pk9d+WLEfWomXD7xNEKaXFSDCFog6BYUl8trQPEbFO964ckRE2RMOn7RfY59I4m4J8QD6NA4h68ki/i+uDgFV31fdfXYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751438355; c=relaxed/simple;
	bh=/eoPnEunEB76YC7IbsU/tHmmFPbDK2slXP9EaWP9oms=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cJChe9+ZKSX+1zL74MPvC71d5kliAFbdfGPFEe+GS/LjjCT9As9/gY5xRxniBDXxCldtSAlYSaRJ67E0UPduxOtyg5Ax0JUKL8IXuyxVutZ7SIdqB4M0zrM5U2W95+OKF/eIN3rhDwHk3XOpVsewf+12uJRcl/moNHVrwN82J0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PmMtyj5j; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PmMtyj5j"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-235a3dd4f0dso40338645ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 23:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751438353; x=1752043153; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SW9FatXBBr9uVZr3p1oMLELHRqOke3lhi3vQmmUuOgY=;
        b=PmMtyj5j5ZoFsoC8w2h0GTszuNCycPPIkZ1IZCZltwXLSUr0zWT3p8A98VYCu0QyA4
         TbE88KJAcZEnTYkOqzxWD5SGXdvO82tdvtDNJwZq+nIi8ivt7EbOpdrdtRz7cAzhDh0h
         gAvXjgn3ohA7sw3FtkiaRtXBD1O9VDhWGzMxIWG63oxnCiGWCfb1xWyFqBhnYAfbW8yX
         92Lz0IT09KiLjcltJDfqmbB+YZj0kB/ko0J/rFxCv7hBg32YFFaq+yzU22kvmBVQzaqy
         RRtW6tkrgD0uv7sN660R5TYdtOlJaFngVSebLtll/jyxxt9G8slxsXeoyyE5zfvnW4mg
         iM7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751438353; x=1752043153;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SW9FatXBBr9uVZr3p1oMLELHRqOke3lhi3vQmmUuOgY=;
        b=Et2rJL7W93Op7hFmzH0jn06/0gszW+baCJt33ywTlIlujRfym4Pk5PzyaYn/OFIKYE
         tzljuQ+KlvgiXKjCkB4n/qISW4caiXtnNeKspqlfdbMb68G6oO7jfe29h+26NH4KQLGM
         /b4KNjKzu/IECiKOVvZpmu0w6PyZCxwHAZLbEKkKCCMBwTnzLB6XidCEhTAnTgncXIPc
         iUJjER8ablbnWBWlBRIOZ55kZ+xakw/VvU/lItv8/6nCx/Px5pPv6MGcUMQh/NxnB7wL
         a/0hdYT307p/JHF/dBUOKKR9WFfU3hSsenl+59wfc2kKL51+jNS3SJA604sqo7OzFSCi
         yFCQ==
X-Forwarded-Encrypted: i=1; AJvYcCWb5c1U/oCTkKpUiJJAo1oXH8z4pa5Kk+I+XecAW+Cp6HLkzYPtCx7qhJH/qgaP+id95wZg5gILEoAIgQ4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxyJAm/5e3nJaU0IkeLNKv76RspbcgXCinCDgAiOTft3cRFzWC4
	2t/aoUNXMk8Syb6QJPfmiFAWBPOCdoIRvh/G9TSRIkoZ6x0DhBTjQtnPsdEYEsKWrYE=
X-Gm-Gg: ASbGncsBjAPaZ1LiE5wlIlAzsDQj9qxBTSsL0zQB6ibfCU5zsKHvhYKCig7mdTICkFu
	ceNcU1SHt/ZdnHBafM0bYPMqw946Mf7hHMgNcFMqYfrwD0Qya8j7yewe+ur/c6jRBEAQUfW0Ltq
	KrLTwMf+OvhXsoMNCT/T+P1b+j5EpD1tP9nA55Vd/s1/WLD6SuT1DwRzRHttQgrbQR2CJf+4yIW
	+K0uCFHWuH+2Kh+WLCKU+L46xQk+z+J1P6JiGsqhz13hgWpPqlNoMPVAV/ygOEmUF4cQlJTkZxI
	1DaXgJc8tHz+iRSmGlz4QbrOKfreU5v0e5eLYF0iacC220Z4MHl1Uw6Pld3hdqc=
X-Google-Smtp-Source: AGHT+IEyC4KmfLegb1B82Q909aH2SFqeih6Xb6CMFnbeqXshdOd8HpJJu9yHcNKFqbkSWsfoNu5s9Q==
X-Received: by 2002:a17:903:1b04:b0:234:8a4a:ada5 with SMTP id d9443c01a7336-23c6e5b5d10mr21914435ad.37.1751438352997;
        Tue, 01 Jul 2025 23:39:12 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb2f39bdsm128787855ad.80.2025.07.01.23.39.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 23:39:12 -0700 (PDT)
Date: Wed, 2 Jul 2025 12:09:09 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>,
	Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] cpufreq: armada-8k: Fix off by one in
 armada_8k_cpufreq_free_table()
Message-ID: <20250702063909.zeplodhdbvqscefm@vireshk-i7>
References: <7ae149bf-5e4d-40df-b1c2-31d5ef418f05@sabinyo.mountain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7ae149bf-5e4d-40df-b1c2-31d5ef418f05@sabinyo.mountain>

On 01-07-25, 17:30, Dan Carpenter wrote:
> The freq_tables[] array has num_possible_cpus() elements so, to avoid an
> out of bounds access, this loop should be capped at "< nb_cpus" instead
> of "<= nb_cpus".  The freq_tables[] array is allocated in
> armada_8k_cpufreq_init().
> 
> Cc: stable@vger.kernel.org
> Fixes: f525a670533d ("cpufreq: ap806: add cpufreq driver for Armada 8K")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/cpufreq/armada-8k-cpufreq.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied. Thanks.

-- 
viresh
