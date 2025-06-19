Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 480C4221286;
	Thu, 19 Jun 2025 09:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750326859; cv=none; b=iOXxlcPhWsclR92ddSLOaZJun0XtQvNJfQEo91WwHc6O4l0zbkXiZVGK5etIfma1M1c899pghbzRDRE2YmzUA+l/7W5c+mCB6HFcxQOb+fUMO8BC77MjObqhAanwq9L48Q3as/s5o0LgywCGvztiuM1Cq/0kRHEXYshbLzJWZwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750326859; c=relaxed/simple;
	bh=liBrC581olewIxjbEjqmezkc4FAvhL6bE6utTt8dFjU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HB91ON/fkDr0wuzIYTEv48x5/yOf2hmgHInCWS/1voTxvOrLTy0xFHVfPsAX5KXPbMaRLZqZhisGZAW5S2H3n5GtsvIFN+dsks+j5DOlJSCA23F+z8FC6aMBmp28wgQCnB3gA5qPxMc28Lq0esL0VFUVpG5lYyDBACTpQSFz22Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z5pcnnEL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z5pcnnEL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 426C3C4CEEA;
	Thu, 19 Jun 2025 09:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750326857;
	bh=liBrC581olewIxjbEjqmezkc4FAvhL6bE6utTt8dFjU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z5pcnnELNdgWWTpUPqvWO/Rjn59mzJal3u0PTtDti6dHWFKIeZ9bYaddL+4kJYJsY
	 +imfxJt+pi3/S79q8A25sV833O7pajN7iYJR4F8wzkP04ZeRLpzC2N26SF0XiYQyzz
	 0SXoZguPVAbHYQ1idOBHeuHxYh8hXzLDqWYiF4dSpWcFtp8R4QdGnLfQUu3CSUjR6D
	 xTXQIFzHKKXhYyB5/rzqzgdG9vKqbHPdS6ccjWvYPtlTeKNieMbs80rtW0ls0Hyvm0
	 XwsTe6eYbyGy2gWPm3phDYEtrviPH+8L+0qMtYrwUfu6XqQHSJsXFjKL9z46UICmKN
	 z+oIUFNTFph8g==
Date: Thu, 19 Jun 2025 11:54:15 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Quentin Schulz <foss+kernel@0leil.net>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Sebastian Reichel <sebastian.reichel@collabora.com>, 
	Lukasz Czechowski <lukasz.czechowski@thaumatec.com>, Daniel Semkowicz <dse@thaumatec.com>, 
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Quentin Schulz <quentin.schulz@cherry.de>
Subject: Re: [PATCH v3 1/5] dt-bindings: mfd: rk806: allow to customize PMIC
 reset mode
Message-ID: <20250619-unselfish-gorilla-of-joy-13fb93@kuoka>
References: <20250618-rk8xx-rst-fun-v3-0-081f02d3d348@cherry.de>
 <20250618-rk8xx-rst-fun-v3-1-081f02d3d348@cherry.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250618-rk8xx-rst-fun-v3-1-081f02d3d348@cherry.de>

On Wed, Jun 18, 2025 at 12:32:40PM GMT, Quentin Schulz wrote:
> From: Quentin Schulz <quentin.schulz@cherry.de>
> 
> The RK806 PMIC allows to configure its reset/restart behavior whenever
> the PMIC is reset either programmatically or via some external pins
> (e.g. PWRCTRL or RESETB).
> 
> The following modes exist:
>  - 0; restart PMU,
>  - 1; reset all power off reset registers and force state to switch to
>    ACTIVE mode,
>  - 2; same as mode 1 and also pull RESETB pin down for 5ms,
> 
> For example, some hardware may require a full restart (mode 0) in order
> to function properly as regulators are shortly interrupted in this mode.
> 
> This is the case for RK3588 Jaguar and RK3588 Tiger which have a
> companion microcontroller running on an independent power supply and
> monitoring the PMIC power rail to know the state of the main system.
> When it detects a restart, it resets its own IPs exposed to the main
> system as if to simulate its own reset. Failing to perform this fake
> reset of the microcontroller may break things (e.g. watchdog not
> automatically disabled, buzzer still running until manually disabled,
> leftover configuration from previous main system state, etc...).

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

