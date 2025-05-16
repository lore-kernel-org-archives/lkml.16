Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2494922E3E2
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 09:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747387259; cv=none; b=bi4ZF4PPxeKXJXocGCVzMGn26aaKTyXEBn1mRtxHy2yzJowd0fPncN6ATgmOJu50HsYmFgww76BBY3U7QmSHyEsAkulx+7hdCVbEDn5Zfsz/zLJ2rXpaFmaugqItL0Dkg6ro5XN7P6Fxd2HPUA3D2FXHyO5/TnMOUAk+ew3QRhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747387259; c=relaxed/simple;
	bh=LKnFOUwwXq/9fAvcKvTjoW/6ZFr5JUhO2L711QhoihA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c2OkZlaoVQzpAgKLr3OLidxDY/AyHflWhxV8iMhHVf1BvbYFSgOIiNKZ60t4dCY4gN4XUrepJWaQiP5H2d7s4fiXi/0lCMSY170O3pWsf7x/p6qbCFeVqLakb83OaDnOfHxehVj1SGCla1SjkMqi294l7EeD2WdSPOuSJavIVdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yt97lc3e; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yt97lc3e"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43d0618746bso14928915e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 02:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747387256; x=1747992056; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oVkdhl0yZ1MFLhzxiopsXMYZ7EZJ0whWLEhnArATGGM=;
        b=yt97lc3e5iz9s7CTwnr5fw38Q04ZN+A9rhPxyeIhYoC1E/Z6M2KlEH0gLtv29oBBDj
         Gv0zvo5yQSvwgBPht518ICoLAM3dP/x9QrstAsaogn+8F9KXqPHKBb7Or1lYlTEwEKFU
         22SvuXQfLDDdYr2pPWrKPsudEk8lwDrmGFgFq+Nrc697Ym2/8kMCKaM09k3q00B6DUIV
         50Y4leJyswQUOe55uu+aKouyephrTKusMS3Rfa5tY663V1BwAJg8Vh2MLkttdpLrJ+qp
         NnNEYot0MFayLff8B5Ws/fpK5FmTwggGs1IcfAh2FTjtrn6RO+dLLRDGtx3MloIBy45k
         3+dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747387256; x=1747992056;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oVkdhl0yZ1MFLhzxiopsXMYZ7EZJ0whWLEhnArATGGM=;
        b=TKz7OgonU6wtaVXMAzZwUxoqWiV2hfQvfmpPHK/H+lAUbEj1qU6nQBfA3DOFm988yi
         oMqRTkFtym/DjxQDpzzPT40Pf1mamZthg8rerG2dbfPKxnXK/f89hY5Tua2dZnKcK7VT
         nbC9ansLz85UQlRzhIcbt0nH65CfaoBEKKzYgD4sKw5npjbIv9ZFj4bxakm0JylphEDK
         b6ThKY8wJ51CjTuPrKo53Gg0dy7lmHADBL16uSbM4i622Y+YO+9QA11xunClwpeyfRzC
         wsiE/7PC7v17NNJru6NzWa7+FGB6FDdqZCtxCH2AZuJf2JD16t4S4jcFlW54oYY70lFU
         z8Wg==
X-Forwarded-Encrypted: i=1; AJvYcCWfInEHKXWeERLGLr7Qnaf8cXdVXRr8pKwlodpxkr/ycO63aUXwaZxlU6XE/IXbqdWXmM0UyvkcJLb+sRA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwovcdTnsLUnFiRLY0TqjIXZs61H8MnjmWORR6qNs5j6/ubEsEo
	zlG3hGQ2qezYu6/EXE+5jLlqu0rIHMw5HbyFc+7Zv9jfJF8rWbZgIyLLXDyIr+pUYhE=
X-Gm-Gg: ASbGncv9xNsmtGTd1dGysvWesog1QTPabvfPtpTDCLhvrweG3XkPbxHY1MLiWxSNYbX
	y7v7e9mlPLBo+NwSkjrmLUVbWZy2H14mEcxlOiAl2bVlI3svm4Jj9dzcx5IzZTKO7xgLtzL3fl9
	alxB5upK7eN9l2Acmdw1ulIy0TkBqpQNCR4REsKDxKZIkPJNgHYViQuCjdEs6+ak1o/dcOI8axQ
	fTd9kt0i+m2Js1lu75l4HdvlFU/IDyNZupKQMcfwkVkM86pWb/G0hXpJ+r/E7H7Sk6Vqv2I5W3Z
	hapKJlJj8GeZt7Yjv3Tvqp9Ey5vNGTxLzi/2YucNZY+c9gE1GBnMkc0ST2osIclwEJNNd2cQtmt
	C1Zw5wolF2fBE8g==
X-Google-Smtp-Source: AGHT+IES3ifXyD0j3PvByP7vCZ00BMKCLJoV59bgFS9BgxMTVRCSsT0jxN+o23wdcE+SKI61YC0zEw==
X-Received: by 2002:a05:600c:34d5:b0:43c:e7a7:1e76 with SMTP id 5b1f17b1804b1-442fefd5e7fmr17195875e9.1.1747387256441;
        Fri, 16 May 2025 02:20:56 -0700 (PDT)
Received: from mai.linaro.org (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca4d263sm2210297f8f.3.2025.05.16.02.20.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 02:20:55 -0700 (PDT)
Date: Fri, 16 May 2025 11:20:54 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Thierry Reding <treding@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>, linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/5] soc: tegra: fuse: add Tegra114 nvmem cells and
 fuse lookups
Message-ID: <aCcDdqXo_d34BHpE@mai.linaro.org>
References: <20250321145326.113211-1-clamor95@gmail.com>
 <20250321145326.113211-2-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250321145326.113211-2-clamor95@gmail.com>

On Fri, Mar 21, 2025 at 04:53:22PM +0200, Svyatoslav Ryhel wrote:
> Add missing Tegra114 nvmem cells and fuse lookups which were added for
> Tegra124+ but omitted for Tegra114.
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  drivers/soc/tegra/fuse/fuse-tegra30.c | 122 ++++++++++++++++++++++++++
>  1 file changed, 122 insertions(+)
> 
> diff --git a/drivers/soc/tegra/fuse/fuse-tegra30.c b/drivers/soc/tegra/fuse/fuse-tegra30.c

Why this code does not end up in a fuse-tegra114.c ? (as there is
speedo-tegra114.c along in the directory) ?

-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
