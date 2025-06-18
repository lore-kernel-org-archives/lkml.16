Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DF772F2346
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 18:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750270598; cv=none; b=FAGYCzeIyZk77DXrDA4sr6gNHSufsT7RMSa2HoGG5DyCB0RCWKjB6ke8z/pZEtrS7NMw9MYzYB+Rjf3tK5EBtZqzkXSWL56ui2rIvH3QczQ2REvjnKWfv8Wa5/gi73gfTv15ILHhWgM5SZJNdj1NgcLbvYPvCZebXE+xfvrOSYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750270598; c=relaxed/simple;
	bh=4Fd9qcUJXzQbN+9KTtCF1fqWdiXzbwzF6B966ci6XRI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s8oUMyTPsefwUFKJHRw4bu4Ks3XU9iiVIWbUXMFMig3C1ggfGr82ONm10yPDHzvQSK+Q3gcpmoBeV1637fvKCOy3cR8RDpD1sROixvqFqrcdiiDIIOpNEFxXXaft6FFB7HknNbQexFKv8yAwduu/LymbpM9IgKXSn2jHFTymCRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wid0jK4Q; arc=none smtp.client-ip=209.85.161.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wid0jK4Q"
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-6114114daddso535340eaf.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 11:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750270595; x=1750875395; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lQ6KRNqHtUH9Gf6fw/A7PLcOlEK5Gn0mWYnHJo+61Ac=;
        b=wid0jK4Q15Vl/kw4kZKo7qejb44EIxGfESRFu6tffrMzE2exUJ6vtd1TQjIN+a49HH
         FPWBBAUbGVT0/6aKrHPY68p/dajy468RNMNnCnE8qhmCjdvLcF1d+IdJO+y4NnN9kwE1
         3RO8N5hKPqhhuFbL7zyTtQ1WLKHnWE/nqIIGB4u6g5N7oVSBJSio4RUTWh4AL4rQncP+
         FuXNB71wtpDaMWMTAUy99HRxRrToWljSkN9MpXMTfZvvfgff8Ow1RAno42NJREY84zO+
         GCR7/L3aqB9qmH9rD+uSWHYo6xQvvjBTxwkD8EpFXrctx/nIiXv7x39wn5J64mdplqSB
         4Hew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750270595; x=1750875395;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lQ6KRNqHtUH9Gf6fw/A7PLcOlEK5Gn0mWYnHJo+61Ac=;
        b=W1wFL7Jk04K3zLYstfgn8MMkgoxkotlFHZF3oSyZLrGScIgM4dZJSu+QekqJIsD3g/
         dvavo31JBYc7iCvtaAoTWE0/ZpG9aJxEA3Yk+1qDKQ/TbhjlPKEflyCSIr7Nj7f0SSFj
         5yYuHHUQ7aHA1P1MEI34YDeLs0cPfqLebGIG4lSMvvHCsbPyOPTrsyrkZwkF87PkshGa
         rqNBlRYjAvocC+RsWZMzpgwY29AzWJ7pErW7Qbw7+Bis7AxFea6x9Ou4QA3oSTXlMwMP
         T8ItDq/WNXihosjcs/CrM14pKhRK3D6AQyAAvUhDsex8f/TTtHhtslVbdAxuNvCa2nTh
         w4Gg==
X-Forwarded-Encrypted: i=1; AJvYcCU71Rtk+p3h6vTHGtEyma3UsQHwKDtxa79jIO7XsGafSSiNEEs/bUiMJViZn1ZOstQql5ktySgiajV5tq4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxvFTP7zLCyKm54GkSt5o8uNiahrtqTk0PvmQuCiitxEihdvXtz
	wTHlGnpiyaazAOFFDTlI9JGD8BziMaO/RzlYgzP7lhJbzbquCnFAiZQZv1eMWsEC3EE=
X-Gm-Gg: ASbGncvqOr5uDrff2E8x9+JOOKs3J+7SUGM6aN9VhpPyd0MNrG7h+wMmqW93MB3pdEC
	+V6CMjnAvtC7vZM34OYEnnrxATCbRU+g20qSG4uks/AntU7zJI3UWpIMGBq57pJi01m4fSU9H8v
	VBGdg52VhLUE9OyZW/R6sJ6yfSDqaCltPC+jKvRra8g76R+B/MyOGKEhI2x9MYYHPGVkEWEZCdy
	NIq1wdqhDv92DBGCXFijJSvpU3FVHUw6DBt8tZbmXyNbUvxjL6EW9umVGWKRzTrKx9OWqeqjpWO
	6ybps1Mw9/ighQlqErKPYvhFsZWKJ3mugi1rAeZ3asOoO3K7Qs9PSxSrG8p6KiqB/ZD4fw==
X-Google-Smtp-Source: AGHT+IERtISn8EPb8IizUWIQkj9b9iJsEPiQd/pV7ijZ/mH9QjGYp3xZSAl/4Lp/uwu1uArVd8eRSg==
X-Received: by 2002:a05:6820:1c8e:b0:611:3eb5:7272 with SMTP id 006d021491bc7-6113eb58a0amr3281471eaf.0.1750270595379;
        Wed, 18 Jun 2025 11:16:35 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:1b3b:c162:aefa:da1b])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-61108f0b2fasm1471880eaf.30.2025.06.18.11.16.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 11:16:34 -0700 (PDT)
Date: Wed, 18 Jun 2025 21:16:32 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Kevin Hilman <khilman@baylibre.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
	arm-scmi@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC v3 2/2] pmdomain: core: add support for subdomains
 using power-domain-map
Message-ID: <e463a278-7e6e-4287-9093-42d0a0d365d2@suswa.mountain>
References: <20250613-pmdomain-hierarchy-onecell-v3-0-5c770676fce7@baylibre.com>
 <20250613-pmdomain-hierarchy-onecell-v3-2-5c770676fce7@baylibre.com>
 <CAPDyKFrO9rb0eDb2qO+EGaVjOFG=7emgca8511XACDhWY=dt5g@mail.gmail.com>
 <7hsejzp4xg.fsf@baylibre.com>
 <CAPDyKFo-iPBPgkM43q+5cGR2sptkLk4E6TAERCQbCu24o1RfFQ@mail.gmail.com>
 <7hcyb1os9y.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7hcyb1os9y.fsf@baylibre.com>

On Wed, Jun 18, 2025 at 10:48:09AM -0700, Kevin Hilman wrote:
> diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
> index 88819659df83..3ede4baa4bee 100644
> --- a/drivers/pmdomain/core.c
> +++ b/drivers/pmdomain/core.c
> @@ -3220,6 +3220,40 @@ int of_genpd_parse_idle_states(struct device_node *dn,
>  }
>  EXPORT_SYMBOL_GPL(of_genpd_parse_idle_states);
>  
> +int of_genpd_add_subdomain_map(struct device_node *np,
> +			       struct generic_pm_domain *domain,
> +			       int index)
> +{
> +	struct of_phandle_args parent_args;
> +	struct generic_pm_domain *parent_pd;
> +	struct device *dev = &domain->dev;
> +	int ret;
> +
> +	if (!domain)
> +		return -ENODEV;
> +
> +	/*
> +	 * Check for power-domain-map, which implies the primary
> +	 * power-doamin is a subdomain of the parent found in the map.
> +	 */
> +	ret = of_parse_phandle_with_args_map(np, NULL, "power-domain",
> +					     index, &parent_args);
> +	if (!ret && parent_args.np) {

Sorry for the pedanticry but could we flip this around?

	if (ret)
		return ret;

	if (!parent_args.np)
		return 0;

> +		parent_pd = genpd_get_from_provider(&parent_args);
> +		of_node_put(parent_args.np);
> +
> +		if (IS_ERR(parent_pd))
> +			return -EINVAL;

		return PTR_ERR(parent_pd);

> +
> +		ret = pm_genpd_add_subdomain(parent_pd, domain);
> +		if (!ret)

	if (ret)
		return ret;

	dev_dbg(dev, "adding PM domain %s as subdomain of %s\n",
		domain->name, parent_pd->name);

	return 0;

> +			dev_dbg(dev, "adding PM domain %s as subdomain of %s\n",
> +				domain->name, parent_pd->name);
> +	}
> +
> +	return ret;
> +}
> +

