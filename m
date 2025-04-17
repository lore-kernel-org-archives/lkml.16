Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 611B953363
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 04:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744863906; cv=none; b=u6+yILUSkZsTPs3TY8btOa/DndwtSbAZKE7N8PfZF45WdjC/KUMlQ2gCZFHa/InCMxgZAEdtjnWj5YzznoU4oBcLCTOZgaPvP/fZKHQfGCNNEJxnarchxAoT9L2bi9tDDuPB7zv+tSxpZYa7URMIM/HoqZcxOGBIT9+cyn/hcNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744863906; c=relaxed/simple;
	bh=MlMsrIFgwNPUXQlQUeeWv3zwmDoBQ1Ow0x+5qtQ/UTU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YPwA0YqoGp1l53F6aXB0B6K82jFjMkHjwm5OXBQD7mlG2/OAxHz0D2/Lq3Gsw7luBGKoimFPBWMeoz47D0Q688fjj6HWA4or1rxgfmswDj6YmiH7xxiRqBB6tTcxwc0xXI/zTOIVHXinPHMqfM0YUomiiRm1ZHzgsXG7bGVaHuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cWd9cHjI; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cWd9cHjI"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-225477548e1so3629965ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 21:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744863904; x=1745468704; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YmiUHUUBKI8PJIWV5sMJoVG3SND4wAcYpi9OlzawyYI=;
        b=cWd9cHjIVTvVSQg102VkIRw+6iNTK9k4thWf3OrpsHsGkb9K72QzzvVzMcNaB+NfyX
         O3+GLEAuLJW91+a8kV/PMc+WUYfxIOfx+Cy7hhRZ3JO18y5+alQ2SJBocZR9D8IWS97V
         qfjxdfAWUvA2WoXgAjRJl4ZlQV9gm6sKNzeHK1g+mM+PZbzxTeK6z41T6ItOkrdsnXbE
         lBCsCY4qR2LSjjuK27qoDLvtG2jB2cpWU1QYHjE3T+MtaHtdeA0OOiZwnqZl5pml86Hc
         CWaVuGOSbhEqpTb1JEIM9aq9wPFkW0h3oIgKF5q8TYkYHDFewkQTbCPn2VhKYLjE8Z1u
         tcgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744863904; x=1745468704;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YmiUHUUBKI8PJIWV5sMJoVG3SND4wAcYpi9OlzawyYI=;
        b=hj8I09p1zbPS/r2LRUv70tGrxLObVRRw9Kjvt3PvrNy5U18BUUxNAWYXjE9ZvBAf4N
         9xz93rSlNcvfDwSNIYw1hwNVTmA/+idtSl8viTzSa1dr88EMYhqQYnQ27S7mwa0KR6WA
         icyXIjR5sY1m3qZZXptowyt3eyASMQRkD55GTSroDxx2SNfXWxfBnmw6eRP5qLYgkBN8
         9UBjCj87RvLq03Fz8+AlBRJPQh5WaPVGreD0WHUp+irTJKmFAfzzdsjSIJJ7LT5A9cyq
         ZU7m6+F6NeuE7hUwGJ348ISXlL4xXEoiJAk5a7xEYzzPhEjrWYyzEmy0T1i6Huz6nbuE
         4gUQ==
X-Forwarded-Encrypted: i=1; AJvYcCUD0KOgiKRCqqFXKVpgUvw6gHtglp0s2Np0rqjZsU2e6ZdlnzWSnzLPKNfQrSo5jW/KgjP8OlIYKmEReeE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwT8OLnrjMj6EogxCHyzorfFC+KvQsbAg9ghvaa0+9inm9SMzCV
	oq/H6fYteLCRYDkmtNVa/uRGjb8bm6VVcWGP9L/psNhMWOPxBLS8ljFL2oHW3C8=
X-Gm-Gg: ASbGncv0gPntYgiOskOkhy5b5DsdTux9o0lhlzNCVlybafeul6RqIEJTIacCTjyEGg/
	A+tel2HWA0pXyzQMxiNJscGqopPowGk+eBR36Q24ArRWjxYncHof/93lclch6ZmxHj1OwUu9t6x
	sV5L9uLj5t71JPD3UbFVrMU0suNwETdF/eZanU6CnFohVXtLX4ByjvZ3Y7h8GriCzSzXj1IVuzu
	2PHyLl7xvu7TGvPFeXnpRJC0b8MGXqSYszYFa68Hee4SZjyKg+bmQ/eafGP68TEVnQdFGBDl+Rv
	S19IhWOGydqNmftGT+2XhTrlAW3mjuOnRg1UAYZwHQ==
X-Google-Smtp-Source: AGHT+IG2v69nuDWH4FgYa76B5nKgqy58L4Wid65MFMUFPK5+zr5XnBZE9bRrkKyZECa0wTorHqTLjA==
X-Received: by 2002:a17:903:1cb:b0:224:721:ed9 with SMTP id d9443c01a7336-22c35981e16mr67570055ad.44.1744863903581;
        Wed, 16 Apr 2025 21:25:03 -0700 (PDT)
Received: from localhost ([122.172.83.32])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd2333859sm11288413b3a.158.2025.04.16.21.25.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 21:25:02 -0700 (PDT)
Date: Thu, 17 Apr 2025 09:55:00 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Johan Hovold <johan+linaro@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	"Rob Herring (Arm)" <robh@kernel.org>, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] cpufreq: fix compile-test defaults
Message-ID: <20250417042500.tbuupp3jdpfkk7kh@vireshk-i7>
References: <20250416134331.7604-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416134331.7604-1-johan+linaro@kernel.org>

On 16-04-25, 15:43, Johan Hovold wrote:
> Commit 3f66425a4fc8 ("cpufreq: Enable COMPILE_TEST on Arm drivers")
> enabled compile testing of most Arm CPUFreq drivers but left the
> existing default values unchanged so that many drivers are enabled by
> default whenever COMPILE_TEST is selected.
> 
> This specifically results in the S3C64XX CPUFreq driver being enabled
> and initialised during boot of non-S3C64XX platforms with the following
> error logged:
> 
> 	cpufreq: Unable to obtain ARMCLK: -2
> 
> Fix the default values for drivers that can be compile tested and that
> should be enabled by default when not compile testing.
> 
> Fixes: 3f66425a4fc8 ("cpufreq: Enable COMPILE_TEST on Arm drivers")
> Cc: stable@vger.kernel.org	# 6.12
> Cc: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>  drivers/cpufreq/Kconfig.arm | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)

I have already applied a similar patch:

https://lore.kernel.org/all/20250404124006.362723-1-krzysztof.kozlowski@linaro.org/

Can you rebase over that please ?

-- 
viresh
