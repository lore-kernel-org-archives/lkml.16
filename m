Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A08B9198E8C;
	Mon, 10 Feb 2025 08:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739176838; cv=none; b=IaDg8EM+riYKKliD9eEvs5+PpsN+XA155k/vq3ZtSFeQI4uqr9zJU9E/3CrAgfNoEAQiiZcHA0jMk7J3OM3XCdQLDqK73foqO2YVHGHFECkV5gtW5rzPuVDdIYyxE0YOWia0XvD34RpCKoaRGM+NCTQBDosk8KAbazbTIDw1bzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739176838; c=relaxed/simple;
	bh=XKvZjH43uSODLFHOvevQgmYK+STeblNM4b+uwge5+ys=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eWkf5/AolG1uOZDvQgfn69hLO3f0aQuTRFTNhcPdvaJV1G8cHEazkJ1YT7rDMK4OOzD3itpJEaYLKkBEoPL2nZ5dE6Que3LpEPEaRhirJZ54sxQK7qan0sP11Xx7vXVL6Lhab/cdbiyXctFVptkYXSWVy/9cyu4rDZaAHGq8v1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SPei3Jh6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SPei3Jh6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40F89C4CED1;
	Mon, 10 Feb 2025 08:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739176838;
	bh=XKvZjH43uSODLFHOvevQgmYK+STeblNM4b+uwge5+ys=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SPei3Jh6r2tV1Gw0PfO9tFdQVc15hAXIIjyOo5ZmTfaZJTOXQ5vCnNSN74dnxFADw
	 GMjUpLA7eifOBtkLF9/Kp0Ygo41+hhjtBK1ryavt7pw5ABvIHBtWx/xN4oNUUNOOYj
	 WigTbtALmO5//n8E4CxYMJ7o6YTOjV1dkwNS0Kl/oXQ7UDMGMVW+ZhrMWkrOQ0o0j6
	 8QDve95p60LwwFN0VWQ/X5cYtbkGwybT3MXAgyJ1HLhopJjpi2KzO+T4M96j9C3Oee
	 4TTqTzokxMPPHIITX6tRHL+HVdxRpFzkLRB89ipouChR+JSxY59Y/RBM+BUwDuXTAQ
	 YqYpihqYNj0Zg==
Date: Mon, 10 Feb 2025 09:40:34 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "Celine Joy A. Capua" <celinejoy.capua@analog.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] regulator: ltc7871: Add driver for LTC7871
Message-ID: <20250210-fresh-spiked-finch-d7357e@krzk-bin>
References: <20250210-staging-ltc7871-v1-0-c593ad86aab2@analog.com>
 <20250210-staging-ltc7871-v1-1-c593ad86aab2@analog.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250210-staging-ltc7871-v1-1-c593ad86aab2@analog.com>

On Mon, Feb 10, 2025 at 10:30:52AM +0800, Celine Joy A. Capua wrote:
> +	chip = devm_kzalloc(dev, sizeof(*chip), GFP_KERNEL);
> +	if (!chip)
> +		return -ENOMEM;
> +
> +	crc8_populate_msb(ltc7871_crc8_table, LTC7871_CRC8_POLY);
> +
> +	chip->spi = spi;
> +
> +	ret = ltc7871_parse_fw(chip);
> +	if (ret < 0)
> +		return ret;
> +
> +	config.dev = dev;
> +	config.init_data = init_data;
> +	config.driver_data = chip;
> +
> +	chip->rdev = devm_regulator_register(dev, &ltc7871_regulator_desc,
> +					     &config);
> +
> +	return PTR_ERR_OR_ZERO(chip->rdev);
> +}
> +
> +static const struct of_device_id ltc7871_of_match[] = {
> +	{ .compatible = "adi,ltc7871", },
> +	{ .compatible = "adi,ltc7872", },


This means devices are compatible?

> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, ltc7871_of_match);
> +
> +static const struct spi_device_id ltc7871_id[] = {
> +	{"ltc7871" },
> +	{"ltc7872" },
> +	{ },

Keep your code consistent. In OF table you have comma after each
compatible, but not here. Space before field, but not here. No trailing
comma on last entry, but it is here. I don't care about the actual
style, just write something consistent, not random.

Best regards,
Krzysztof

