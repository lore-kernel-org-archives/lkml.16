Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A32E118B46E
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 16:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746635030; cv=none; b=uI8e6vJ6gZNdTtYBzSAWVezZ9pKoUUSHtiU/MD23DL62e3qT0ZO/3rXqlrokLh4sFLCBvZ59xbK+YgfPWIJDeFzqfpG2d4B2Tklz42ap7xqIZHJ9mL8uHD7rAG9jywMxBoX4Q+F3jM7meDYp6ci3mzx+fEPhdMyRv0uwwspiODc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746635030; c=relaxed/simple;
	bh=GVDVeBab869aYBvCQlDw416oEjXOoR2zkFp+c7adIZk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=knwP/7ZamPUrMXGCSsckizLPyPC1k4aFvYgjlXqRH25wCQIO3rRUyNnzusXG3oZPeCqm1soUShhZLNjgoeRdMAKr1yjUFSx+ggMpEoaJmGzYSWgqisls7awU2V2S6QyKxpPraP4d7X3IsMc4+fRWGkDnwbaTKx/r/K75n4tZSgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QKQjP0u7; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QKQjP0u7"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43cf05f0c3eso649945e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 09:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746635027; x=1747239827; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NdgRnYflnPlN6KlJOaYP1q0InGmD8pNNwfuxpkTXEio=;
        b=QKQjP0u7j6tV0U62Bbj/W89PJ8hwqtbNlR8DMr8z2ONWvT1O0/64dta2QE7V7FuqyI
         uDHgMDgT8xPZS8BIJnrN/Y1Ua/QGjY+hhyPWMJGv9aCP9ZTvrNkRCuVyjHYvcB8pv5QW
         niB7ougtqQmCmuoNC2jYr1/P87vE1STe8RUlhNez8VQ+ECG+61a4z29ltD0B6GtPC8uj
         XqZMBCF1ijGJVds1W4vsIuHV6BlzAjfAW2RT/MHxW40Y9C4tuuPJm4PRR5FmfTQ4Zv06
         qKp36Kl99XH01i0N0DRo8e/emXChWby2Z9U6GnVOjPk5TA5ceTEMqzLmFgUadQsNXhJz
         3VSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746635027; x=1747239827;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NdgRnYflnPlN6KlJOaYP1q0InGmD8pNNwfuxpkTXEio=;
        b=oCmTVMZReeS73mQULK57DtGwf7MpjB2j1TUYulctr2tbThKnlMjWZpmwvK3pie+V1G
         NinCel4P/RTxMTzWvKM92D75znHho9Eb7Y9Mzkr8Ewa/8ch9/Il6nz1v/h+EcQgGC7sp
         cF1lE+jaK58EO3GInfWaIVItJ0WPFdjI5HFF2mE7dgd3FGCohXLCG71Cq/MuEUDb4W2O
         /BYkzJVh3xaO6077FA/Z3IvRGHRxOBhV/4gTfO51/jBvNOBvzex9OIcZfAQHPji/PY07
         CU7Pss9osJx6IOr0nRE9sLSa7a5GlbiMK8L2TpUVaFx2OLkp2p5VZUAJp+cHhs4ej0D2
         caZA==
X-Forwarded-Encrypted: i=1; AJvYcCXtJ6bo4BVDkb2Pfv7diRrVRZFlLs6a/BZU8D2Rnt92ZLzAW2+H9ISL5AIk0OJr0arV6DLQKwzFFdItdxA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxqzIuqwz1g6eSJNTkw3M5DD3BeXzrOUoa6U6Kv8Ob11vLiw16T
	fWFh4xZhCns6ow+KNgM/+pOgEeSo52Japz574cJxLEPk8IhKQ7kOfKEe3OqNAGg=
X-Gm-Gg: ASbGncud6n8UMrBR0/jE1h+KJgKYign8bQXI0DDIh+XhGOX7rEafV1fcbjjD+67gPh9
	cW8wGdo6YW+q17HrbHbvAOkzTiI3MexhK2QUYdYeiXrO22csxVmA7Gr4aVGmXeb5kwzBW/vxsPv
	xsv1Mxoh/QrEWt2raNlRIJn5T483ohuXEC7dBj3XPzTFfI9ELiupUa8LO9qN7jQUi1Z+3zb2l5w
	kT4FKHMTzLOC10UuzHFBVee0XSVNRzkagWl4Fh9cVT2rc7ejwCisw+XxwqBGiurTl6KKwWurUHZ
	pl17GaJJR51P9UCPgGUrx47xSiZJpPDYrJNtXhlYFvWovQ==
X-Google-Smtp-Source: AGHT+IE6y0LlIV4IlIooPu6OJTNcYKnkqYqnx0WCylTRROLNd4cSZyHpQkJmtgiFMm+bT9j1cn2H6g==
X-Received: by 2002:a05:600c:4e47:b0:43d:36c:f24 with SMTP id 5b1f17b1804b1-442d02ed455mr1853855e9.13.1746635026951;
        Wed, 07 May 2025 09:23:46 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-442cd32f0easm5943165e9.12.2025.05.07.09.23.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 09:23:46 -0700 (PDT)
Date: Wed, 7 May 2025 19:23:43 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Saravana Kannan <saravanak@google.com>, Stephen Boyd <sboyd@kernel.org>,
	linux-pm@vger.kernel.org, "Rafael J . Wysocki" <rafael@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Grzeschik <m.grzeschik@pengutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Devarsh Thakkar <devarsht@lewv0571a.ent.ti.com>,
	Peng Fan <peng.fan@oss.nxp.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Johan Hovold <johan@kernel.org>,
	Maulik Shah <maulik.shah@oss.qualcomm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 07/11] pmdomain: core: Export a common ->sync_state()
 helper for genpd providers
Message-ID: <aBuJD1izaMqKUJ_s@stanley.mountain>
References: <20250417142513.312939-1-ulf.hansson@linaro.org>
 <20250417142513.312939-8-ulf.hansson@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250417142513.312939-8-ulf.hansson@linaro.org>

On Thu, Apr 17, 2025 at 04:25:05PM +0200, Ulf Hansson wrote:
> +void of_genpd_sync_state(struct device *dev)
> +{
> +	struct device_node *np = dev->of_node;
> +	struct generic_pm_domain *genpd;
> +
> +	if (!np)
> +		return;
> +
> +	mutex_lock(&gpd_list_lock);
> +	list_for_each_entry(genpd, &gpd_list, gpd_list_node) {
> +		if (genpd->provider == &np->fwnode) {

Presumably this would be "== of_fwnode_handle(np)) {" as well...

regards,
dan carpenter

> +			genpd_lock(genpd);
> +			genpd_power_off(genpd, false, 0);
> +			genpd_unlock(genpd);
> +		}
> +	}
> +	mutex_unlock(&gpd_list_lock);
> +}

