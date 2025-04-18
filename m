Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9071D211A0E
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 10:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744971387; cv=none; b=Q+JO34GBGLyKsJW79MjKxciQND+738kXEl0E25Ve2hG1qQsSJErtfxT4OGW/7AruFhw6ZsB2lSxYsgFz219jCt8629QBNDaFBnkI43RWzQRHfzcvS1sXKAd4JaM3zfNqjPChfiS0UpoOxa205KsXEzx9z9AuXhYpTaxH2V8jYm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744971387; c=relaxed/simple;
	bh=Lp5BhMcVKSsFsdsphNab3vl7zSMQBiTnGPfS7Mtuwdc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p+XheM1INKZQwAKVbfHLm732IqlZnIyKmHpPlFq9lSl4TbtWwkq8KICg/my5QoS8Pdgv2FFefo2o9Zo+WRJhwvCoV+J7AgesJKog5t95Vn8WD+Wn29ZvyshmFLWDp8sY3gX7m3lFBJy9TnLvQZSHV40yajDXm+sw2Iz8LvEOLqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=K5HAevjk; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="K5HAevjk"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-39c1efc457bso991312f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 03:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744971383; x=1745576183; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IiDBnIbN2ErdrAZnJdVTPEl8ORr2jBX+0bJeY940wkA=;
        b=K5HAevjkTyQM0IciGnF879tXYoqLCjZwCbSJhjpnUzPYRigEcshKpxtPK6eqVJV8fY
         hzRnN7hMi3AM25VpthXqc/Jr5mccamj/GhsJhPr0a1o36a0lz2gU080UIYrQ4mg1tav+
         6Bem6u9QXEnomNqjSxPWichvjGh0cbpFrXUB7ef/G3F0wxxaFH/4bAnVSvswH69eduB/
         jRfrspbD1LYa6UVfE9d6EAbC56D6ejt79Y2rW8bo+CDRVaGgG9SNFpTL1eDMPeXHeyi5
         +vUAxo9Jty9tfG1eTE0oWLSEmgnurmJKG0/BhMD8nral04/Ic7u8iJ2roGGTZyhHwCdJ
         rKcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744971383; x=1745576183;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IiDBnIbN2ErdrAZnJdVTPEl8ORr2jBX+0bJeY940wkA=;
        b=Gt6+FGqTKcv3kEBxZ8Tfbr1rRt1F1zILP19DdiBe0ttVAAPEuz0GfkOYNVxTBcD3NC
         UEtuG5w949gPVwPcER6UIw3bHaXZtUOCQv/w5wH3W6GpXAS2nv6JUSQYH4bQ12nYoZTz
         sZgGAZWGSmetsNpbKudUXMArejY7kGV/e5FhMngE/yYeP8BPLrJyl+tg9KHmyQD6nOWA
         irzzicSnEYUzNswal13RDFTt2lEtS+gzaekPfa7Sp7YoFULyyN+YAoUqWV10jvUX/v34
         gBeY12neKEiRo75f7HJsBGpsCTVIkafcN5YVN3v0DfJQaMOJMd/AUQQrb+D02z/2o4dz
         Hnaw==
X-Forwarded-Encrypted: i=1; AJvYcCWB4uyJPi6yOzpO6R77eHzheDobufk6dNzAr0whcp8AZPDqvfHs3S5b1JLhNeTujbmiaW5Wh0/JqqZHqR4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yywkg330C85VyOzrUK1HpTH99ChOqx3vWU+jpyb8VakWDC2N5d+
	vwIZJtA3gg29DhHd3j4CL7fZ2S7OnESH5yFWJG8FRfX/OUWzsV+7D2z7JOpxFSM=
X-Gm-Gg: ASbGncsWfO26ecz40IUX6DCLJCdHZ77en9+EKa+U1Odlx26QPTeA+DZzK0y8z8y9uBO
	fMMT3/wYc1Z23jDQnMOyJqXQrhdtG3XP+ow/qjSadjMFPj7V7cKWkQyNCGSPZgOxHJO3iCOJ1DP
	aGSmJZNFsNvGOIagHNjvzLPIT+KnENQ8ljWTe+iMhJ058W6Uh5QC467iRVv6pCfPp9M43yaG51s
	wde/jy64+u5FvEjQ4p24V/kcsZb6U5YdyNVw0xJkDRF+jPNBctmfZRkCP4CwuPwpUPKjNS3i9ze
	2K4nqAmLOx52aKsJaLujYY2miVfXzKbEldwMYlLD2mKXZRsmYYlUCIa6NFYsW6oPgZUhuF5N/y7
	L+sG3d+0nlGClsQ==
X-Google-Smtp-Source: AGHT+IEhVsv0Ij1c7fYpfyCnxhTynvdaKQ/MYv7KemDDNjedaaUCumCbBnsf/IltIZ7kk3yXig1l8w==
X-Received: by 2002:a05:6000:2489:b0:39c:11c0:eb95 with SMTP id ffacd0b85a97d-39efba460e6mr1527952f8f.17.1744971382884;
        Fri, 18 Apr 2025 03:16:22 -0700 (PDT)
Received: from mai.linaro.org (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa493377sm2340627f8f.62.2025.04.18.03.16.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 03:16:22 -0700 (PDT)
Date: Fri, 18 Apr 2025 12:16:20 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: rafael@kernel.org, rui.zhang@intel.com, lukasz.luba@arm.com,
	matthias.bgg@gmail.com, npitre@baylibre.com, jpanis@baylibre.com,
	nfraprado@collabora.com, wenst@chromium.org, bchihi@baylibre.com,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH] thermal/drivers/mediatek/lvts: Fix debugfs unregister on
 failure
Message-ID: <aAImdJFvfLTKe-TY@mai.linaro.org>
References: <20250402083852.20624-1-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250402083852.20624-1-angelogioacchino.delregno@collabora.com>

On Wed, Apr 02, 2025 at 10:38:52AM +0200, AngeloGioacchino Del Regno wrote:
> When running the probe function for this driver, the function
> lvts_debugfs_init() gets called in lvts_domain_init() which, in
> turn, gets called in lvts_probe() before registering threaded
> interrupt handlers.
> 
> Even though it's unlikely, the last call may fail and, if it does,
> there's nothing removing the already created debugfs folder and
> files.
> 
> In order to fix that, instead of calling the lvts debugfs cleanup
> function upon failure, register a devm action that will take care
> of calling that upon failure or driver removal.
> 
> Since devm was used, also delete the call to lvts_debugfs_exit()
> in the lvts_remove() callback, as now that's done automatically.
> 
> Fixes: f5f633b18234 ("thermal/drivers/mediatek: Add the Low Voltage Thermal Sensor driver")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---

Applied, thanks
