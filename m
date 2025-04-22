Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C200428A415
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 13:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745328526; cv=none; b=nIDndoVbah//YLZHMbAJ2tpHjUsewXyQKrEx1hrAfV8tY5xLFaK4/p4Abc0NxxDVuOW8iLFZMIp01BuVLZ3tlLjCvVgWhijsKNjSwksXrDiw0/7BJIS6exTiR+VLFvOuS39afny2BPt+tt7g8EQm9hyHqj18TE4n1sLmF7e2kyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745328526; c=relaxed/simple;
	bh=ViyHovAi2SEzHa4yd1kygd9djfXSry24UVYbk29LzYU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ml1jCCkcBTS9uxTIs/javwZa108+YGkFfSh8VaKJfScjWmrLydec2FksxsioAwMhKV2SBIO+/t7kve7x1vzp7jrXIxkupxLCjmkjCyslUZI0YZjIhWPIrwuRhaXwj9w3TdVi4eQAZbcmowNUwGdFnB9yD4XAjKF0g3ZB1QLPT5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cEygV0Vh; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cEygV0Vh"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ac339f53df9so880621966b.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 06:28:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745328523; x=1745933323; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zJrR2JxkMMZwCpTNb/tpAEcXKA5Fk1cxT8LzYQjHkvI=;
        b=cEygV0VhiRrFgEb55teIQdho0agfPekqntBYy/gt2d1h/cMYxBXTZcyHgqGsIerG9O
         X/BWFWvFBY3chXiX57JdzRkpKE4jPV2ZN1owIWaVMMX7mc0YcQz5dRkPyyAD2NFq3EnZ
         MihYXJZVR4G47EH1KkzxLVRl2la/OaRs/Hu6uKrerxX9jMn0RqSTcdKMapFyyKcx4781
         Re2pUuF+x0pgiUGKFIzMLqmLfQxcPmLbvAF1AYqp61YP/TaMglPiSDeB162/3N/k1JWL
         IZElrEdBADoSa+ufmV7gsaK7eVtxj+LKkEDVeYS3Cj0e9WwizZxE8gRrevAQGBoxc11y
         d3ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745328523; x=1745933323;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zJrR2JxkMMZwCpTNb/tpAEcXKA5Fk1cxT8LzYQjHkvI=;
        b=XXqddWCN5A1ntb2O+khM03d9JjyacYYnaF4EPTsVZTGRF/fK9UB5wZTLc8bLkw0ede
         /UrcEs1K8BRfRLbJGeX6ikgbzq7PnjGjRsG5NYTOz7EdCQ6hAMdNHMdUK0A7c23oaNYD
         fvxH2LTh18zCh1DS94fJJzhXpvI4Qgo5DOFkRPORzqxSsyBw6ckr26pLLc/LOk4yR0hJ
         27EGmHurPoJqRdNY9PIt/N/E877u2G9dKteJh5S19X3okUtOUFG40LTYsBqqhtG6knHc
         uXfqIbQTW9vEogqaW36TBWwn2jtVfzyIDOGrpJY3zbOnDQzDpMZyrHvCcJYHyR86nyNG
         aA3A==
X-Forwarded-Encrypted: i=1; AJvYcCUFcoztn/eKIRx+EuuyyKzAwYRcYeTaKF+w8b8X3iv6mTqHUvdyMDuinrdZotmCXNPiTMhIYQqTRhd0qPQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yztsnmo5in8k0dZhjseD7LususB0MqwgeJ9gC0tA76lnFy34/fp
	o92KcO4b0cB4A4KGM9zr3cxoxnAyg4rMymIQV9ERLzU5Kl02Lmi9YeeDQ+v/5MU=
X-Gm-Gg: ASbGncswSrO/K7epaXZpFbwmKGHIV1GxYhvqx765SuXNwQ/JK2y9LbnXl3qo5l3TsFv
	vqFvM6Ld8vKF3rr8wEVAFMWhNZ2jfvQR7ytO2t8Dxq57MJ53j1fGUi9BwCgJAi+GwlVnZbRsM8g
	wEVHQw37v5O7UJEP5rq9SwLTAaE89f7qtCIXHAsvoUFq2IfnvqH1ycVfDLxVyKmn0iLOLu0FQHu
	vGiUN7f1YGa9Yy4n9YMW8rE1nMbg6SQ62sqO9LsTFuLcfynEN4jt7uK/kUOGu2inWqh94otWXBe
	eDNwEFRfSBnHVCKhc6pocmQA0+iU4xDwlvIv3Q==
X-Google-Smtp-Source: AGHT+IGBZS9qAdq9W3YkRDXdH/Hs9bjK7HcuVeE81Ft+GPykI97oKk1Nc4VkNoyA40tEDn0sMITw8A==
X-Received: by 2002:a17:907:da3:b0:ac4:76d:6d2c with SMTP id a640c23a62f3a-acb74dba1e2mr1407490766b.40.1745328523115;
        Tue, 22 Apr 2025 06:28:43 -0700 (PDT)
Received: from linaro.org ([62.231.96.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace3175d95esm78875166b.173.2025.04.22.06.28.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 06:28:42 -0700 (PDT)
Date: Tue, 22 Apr 2025 16:28:40 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Saravana Kannan <saravanak@google.com>, Stephen Boyd <sboyd@kernel.org>,
	linux-pm@vger.kernel.org, "Rafael J . Wysocki" <rafael@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Grzeschik <m.grzeschik@pengutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Devarsh Thakkar <devarsht@lewv0571a.ent.ti.com>,
	Peng Fan <peng.fan@oss.nxp.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Johan Hovold <johan@kernel.org>,
	Maulik Shah <maulik.shah@oss.qualcomm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 02/11] pmdomain: core: Simplify return statement in
 genpd_power_off()
Message-ID: <aAeZiIE9URMmf3JE@linaro.org>
References: <20250417142513.312939-1-ulf.hansson@linaro.org>
 <20250417142513.312939-3-ulf.hansson@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250417142513.312939-3-ulf.hansson@linaro.org>

On 25-04-17 16:25:00, Ulf Hansson wrote:
> Rather than using two if-clauses immediately after each to check for
> similar reasons to prevent the power-off, let's combine them into one
> if-clause to simplify the code.
> 
> Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

> ---
>  drivers/pmdomain/core.c | 20 +++++++-------------
>  1 file changed, 7 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
> index 574a0de1696a..34a85bf347ad 100644
> --- a/drivers/pmdomain/core.c
> +++ b/drivers/pmdomain/core.c
> @@ -917,20 +917,14 @@ static void genpd_power_off(struct generic_pm_domain *genpd, bool one_dev_on,
>  
>  	/*
>  	 * Do not try to power off the domain in the following situations:
> -	 * (1) The domain is already in the "power off" state.
> -	 * (2) System suspend is in progress.
> +	 * The domain is already in the "power off" state.
> +	 * System suspend is in progress.
> +	 * The domain is configured as always on.
> +	 * The domain has a subdomain being powered on.
>  	 */
> -	if (!genpd_status_on(genpd) || genpd->prepared_count > 0)
> -		return;
> -
> -	/*
> -	 * Abort power off for the PM domain in the following situations:
> -	 * (1) The domain is configured as always on.
> -	 * (2) When the domain has a subdomain being powered on.
> -	 */
> -	if (genpd_is_always_on(genpd) ||
> -			genpd_is_rpm_always_on(genpd) ||
> -			atomic_read(&genpd->sd_count) > 0)
> +	if (!genpd_status_on(genpd) || genpd->prepared_count > 0 ||
> +	    genpd_is_always_on(genpd) || genpd_is_rpm_always_on(genpd) ||
> +	    atomic_read(&genpd->sd_count) > 0)
>  		return;
>  
>  	/*
> -- 
> 2.43.0
> 
