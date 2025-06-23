Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1FEB276024
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 15:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750692781; cv=none; b=L+0QrdG2oQXst3baEJX2SVPP2sgtVDDwgLDQZZ9N301gKCMNINWXW1T2nccX/HVVtbXxCWRG9a5xAeL8DigCUGCMthmC3R4uaYqOi3lxE31zCK/NlWLYK/7wjWjm3Hcs0R0jhkEy5udM2iKYg8V6dKxPfMWYha9yAm98GD6zHCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750692781; c=relaxed/simple;
	bh=K7nJQgtBbSh9bg4c43k2d/lR0pxtXBYTwkLYTeoGBZg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RudqsWldBeGc7fCtwogUSN6xwDK2wnLWh6t7CCYM5i0Earjyo4Z+iXV06AZr0b2DLPk3xBqNdBPYau2slqdztWpGRuiprCxszcypPHpUaQOe42dM+LlHSC7kRZyAgKGPqLBA2xS9DINw+V7FsYXaF895CYaFCBoClXLMz/1aNJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Sz/7GcPR; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Sz/7GcPR"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-b31e076f714so3571949a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 08:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750692778; x=1751297578; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1KRVwjnf5Gu74AF6Zl0ciz1iQ0kZ7/1mY4qiKdYpBHw=;
        b=Sz/7GcPRzGtRWzkw6jaJTglWqDbL3fett95gP0SRFVHbyZwdkqOIpE59YJP7pYPOQl
         WMqoIrOpLYnvKy85aGOncZMDb+cQ7PG4niWqtG8ZOLi5TJpHaoh0iZXdBv1JDsIDeQwn
         hV9KnSjS4N/4T9ME5WB44xEdt+PRvA86O8qBYHKmWTg3i6nPQWFVCeQtZGkfzVqNw/4V
         YhcSKrOOguwi/DO/aZ58zB3T3sq57FCZ3pyb02sJvJgLBV9reQop9nhR3r2Bht/0vGfJ
         qltMvcpUbin93ibHPG8EyjqO4b8nQElvO8jygX4he2fISU1xXRbOT3A3AzqNr7BbkRZs
         F+rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750692778; x=1751297578;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1KRVwjnf5Gu74AF6Zl0ciz1iQ0kZ7/1mY4qiKdYpBHw=;
        b=hyX7vVKVYXR3eCv6dUp8hnM+sQB1Z6eoF9Va6TsjUXHhYNm+bR4Ilf36k9LyuGfM7Z
         N/otlzGrHnXQ1OtMzfBYV60pdbbZ9T/Q34zYEICTksCZePen6/L1dZBUS8JJL2e7QQVx
         NETxVI6UDzK/ojXufWr2Vnd+Bd7gzRqnCOU2E9mMI8fP/mjmBqAGp804/rB22Vg9qJWR
         i6MKEx0PxzTOXTfGB22Aa+ohUNEGH1Dt685kPKUlZ/TXaeMVHftSDk2FkhbNl053HZ+y
         g2m5KZH89jleDWEYTy6S7qF+qGQMfqamL7jdaKUYVSbSc7FEl0kV4XBt2C3EjR+lAc4L
         89pQ==
X-Forwarded-Encrypted: i=1; AJvYcCVxirvCt50XJqqiOfgXCEEVk4oZwqSUHKAbfAyqt+AL+Txc5vb4E+m/EO2yqU8inZl0Hzk02nb9CAVCiwQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTUnNCBCmKM9Rn1cP9Lgd75tFzlaef9jlZyCI6nOfIAV2/aYYh
	HfkwDslmfdsv8GNw+rk9bQYciwUTfRpNPwsGxDhAcw97fRgyei4wrgVivoKvFzCOqR0=
X-Gm-Gg: ASbGncvX3EVJ+gwOblko2DPuvxQ+sD2T1gc1DzTOY7sFoH7qTHBdNCIMW4uVinEdB6v
	nAV/gY1LR5s2O2zkthRidA4XlJq4Iat2C4LzQo5l1Jc0Km0wcqEFlClxHnlhxWFaPIcZLSXTLYr
	cMJtCnhDYgmAfATW/KMtE6bBBou7B0kautxSjQnuV2eraErwpEH7H23ZT9gNJPi5IbatBOSiv9S
	OM70UdUXPlB06jH323XyK4OPH8AOuUZQQSIu/xxtesfIwJJNyovjE8ALt7HI0QaT3di9N9OQC/h
	kI46XqkkXkd8fpOzaivrWAM2iyZknKU/OBeE3LRhQuJdUEl36rvMmYSKMM0GE0+w
X-Google-Smtp-Source: AGHT+IGNVVPK2gkJtWTZs/pQbffW/A6+VZyFx1ATrRb4chkU190AUhzC35954VZWOOfCqbAJDEPO/A==
X-Received: by 2002:a17:90b:2e04:b0:30c:4bac:1da1 with SMTP id 98e67ed59e1d1-3159f52d0fbmr19149295a91.17.1750692777852;
        Mon, 23 Jun 2025 08:32:57 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:d145:b99:ea4b:a65f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3158a226f6fsm11220540a91.6.2025.06.23.08.32.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 08:32:57 -0700 (PDT)
Date: Mon, 23 Jun 2025 09:32:54 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Hiago De Franco <hiagofranco@gmail.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, linux-pm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Hiago De Franco <hiago.franco@toradex.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@oss.nxp.com>, daniel.baluta@nxp.com,
	iuliana.prodan@oss.nxp.com,
	"Rafael J . Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH v5 0/3] remoteproc: imx_rproc: allow attaching to running
 core kicked by the bootloader
Message-ID: <aFlzpnT1yNGdWWkH@p14s>
References: <20250617193450.183889-1-hiagofranco@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250617193450.183889-1-hiagofranco@gmail.com>

On Tue, Jun 17, 2025 at 04:34:47PM -0300, Hiago De Franco wrote:
> From: Hiago De Franco <hiago.franco@toradex.com>
> 
> This patch series depends on Ulf's patches that are currently under
> review, "pmdomain: Add generic ->sync_state() support to genpd" [1].
> Without them, this series is not going to work.

Please resend this patchset when [1] and the work in patch 1/3 have been merged.

Thanks,
Mathieu

> 
> For the i.MX8X and i.MX8 family SoCs, currently when the remotecore is
> started by the bootloader and the M core and A core are in the same
> partition, the driver is not capable to detect the remote core and
> report the correct state of it.
> 
> This patch series implement a new function, dev_pm_genpd_is_on(), which
> returns the power status of a given power domain (M core power domains
> IMX_SC_R_M4_0_PID0 and IMX_SC_R_M4_0_MU_1A in this case). If it is
> already powered on, the driver will attach to it.
> 
> Finally, the imx_rproc_clk_enable() function was also changed to make it
> return before dev_clk_get() is called, as it currently generates an SCU
> fault reset if the remote core is already running and the kernel tries
> to enable the clock again. These changes are a follow up from a v1 sent
> to imx_rproc [2] and from a reported regression [3].
> 
> [1] https://lore.kernel.org/all/20250523134025.75130-1-ulf.hansson@linaro.org/
> [2] https://lore.kernel.org/lkml/20250423155131.101473-1-hiagofranco@gmail.com/
> [3] https://lore.kernel.org/lkml/20250404141713.ac2ntcsjsf7epdfa@hiago-nb/
> 
> v5:
> - pm_runtime_get_sync() removed in favor of pm_runtime_resume_and_get(),
>   checking the return value of it.
> - Added pm_runtime_disable() and pm_runtime_put() to imx_rproc_remove().
> - Fixed missing "()" in dev_pm_genpd_is_on description.
> - Updated dev_pm_genpd_is_on() function description to be explicit the
>   function reflects the current power status of the device and that this
>   might change after the function returns, especially if the genpd is
>   shared.
> 
> v4:
> - https://lore.kernel.org/lkml/20250602131906.25751-1-hiagofranco@gmail.com/
> 
> v3:
> - https://lore.kernel.org/all/20250519171514.61974-1-hiagofranco@gmail.com/
> 
> v2:
> - https://lore.kernel.org/lkml/20250507160056.11876-1-hiagofranco@gmail.com/
> 
> v1:
> - https://lore.kernel.org/lkml/20250505154849.64889-1-hiagofranco@gmail.com/
> 
> Hiago De Franco (3):
>   pmdomain: core: introduce dev_pm_genpd_is_on()
>   remoteproc: imx_rproc: skip clock enable when M-core is managed by the
>     SCU
>   remoteproc: imx_rproc: detect and attach to pre-booted remote cores
> 
>  drivers/pmdomain/core.c        | 33 +++++++++++++++++++++++++++
>  drivers/remoteproc/imx_rproc.c | 41 ++++++++++++++++++++++++++++------
>  include/linux/pm_domain.h      |  6 +++++
>  3 files changed, 73 insertions(+), 7 deletions(-)
> 
> -- 
> 2.39.5
> 
