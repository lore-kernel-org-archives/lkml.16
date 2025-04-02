Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04AE73C17
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 07:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743577545; cv=none; b=rPkM0COSmB+TE0xOg6tjec9r+kb7vFTsV26Goz25Zh28qojeZWIXA41dqtBqVvl22m4KTGWUA0pDm8OpYG4MkhTWvue9z25fDlIb7KA1ti9ufILvP8JRxqlhrD44HrZ0nYNMBsw2hua5RCL4k9UMMbLd4nOkHYNTVELp5Q0Bsos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743577545; c=relaxed/simple;
	bh=RvVuEhU6H4q0EhDx1tiAt5dp2ujQ9LsTsA8B4iwksyk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IslDkAXM4l9ojFUB6nEg68VMM3dOggszlS+1q3Js2UUFcj+MeXzSNJh8gfNJ3cugIwddhE3uOAYEr89Mo+XpADBWvpLn5N9sfFZzsMRKIMhSMcCOCio9phLNZvtkrccGSxqznx0xN+tBt3UaCNxi4zlhKibRsVfzDOvebtnSlaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BACCBC4CEE5;
	Wed,  2 Apr 2025 07:05:42 +0000 (UTC)
Date: Wed, 2 Apr 2025 09:05:39 +0200
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: tglx@linutronix.de, linux-kernel@vger.kernel.org, 
	thomas.fossati@linaro.org, Larisa.Grigore@nxp.com, ghennadi.procopciuc@nxp.com, S32@nxp.com, 
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	"moderated list:ARM/STM32 ARCHITECTURE" <linux-stm32@st-md-mailman.stormreply.com>, 
	"moderated list:ARM/STM32 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v3 2/2] clocksource/drivers/nxp-timer: Add the System
 Timer Module for the s32gx platforms
Message-ID: <20250402-ginger-hare-of-action-dc3fff@krzk-bin>
References: <20250401224644.3389181-1-daniel.lezcano@linaro.org>
 <20250401224644.3389181-3-daniel.lezcano@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250401224644.3389181-3-daniel.lezcano@linaro.org>

On Wed, Apr 02, 2025 at 12:46:42AM +0200, Daniel Lezcano wrote:
> +
> +static const struct of_device_id nxp_stm_of_match[] = {
> +	{ .compatible = "nxp,s32g2-stm" },
> +	{ .compatible = "nxp,s32g3-stm" },

Drop, the entire point of me asking for compatibility is not to have
useless entries for the same devices.

> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, nxp_stm_of_match);
> +
> +static struct platform_driver nxp_stm_probe = {
> +	.probe	= nxp_stm_timer_probe,
> +	.driver	= {
> +		.name		= "nxp-stm",
> +		.of_match_table	= of_match_ptr(nxp_stm_of_match),

Drop of_match_ptr, you have here a warning.

> +	},
> +};
> +module_platform_driver(nxp_stm_probe);
> +
> +MODULE_DESCRIPTION("NXP System Timer Module driver");
> +MODULE_LICENSE("GPL");
> -- 
> 2.43.0
> 
