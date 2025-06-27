Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 547211B423C;
	Fri, 27 Jun 2025 19:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751051589; cv=none; b=i7ZzrTTaJBsJgVTInlkUfvQP58vdku5CR1NZoCIcnFczt5swC5stcr6l9mTaoWliUO62/M/oD+vWLDgZEBrNQpx46d7M7qMMo7FM5hvjwenlKAJe8c0RD98nLL6E5p5lLD6bUe/xHN/lfiZQy5X1T+n78J16g7hPjHQxBJW4fMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751051589; c=relaxed/simple;
	bh=uJye5eK2gZUT/fK47GMXXoLFMlDyOz0ZGd3spyloggQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gVsu9xnPWVQQnaj7tuoLJcUMQMFLtemkmJsPn0VHW+4IemFqrx0vbK9rf56JZMoUFNVvm5Wux28k+qpw5rLl6qQaTGdgfI4IZSmjU9m1ROgmelkVbsli8JwlF56KaBkfnalUPhnsvxc/dMw58XpCGk0KKuNF50yLrGpBLTPk4YM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iB1lk3F2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iB1lk3F2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8AA3C4CEE3;
	Fri, 27 Jun 2025 19:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751051589;
	bh=uJye5eK2gZUT/fK47GMXXoLFMlDyOz0ZGd3spyloggQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iB1lk3F2T356oNJVMmfGW3mUXttN+O4Q0YNEqBR16/Y2HcYAsOsQmrZwAcIpxtqG7
	 kMYVAVn1kM5gkteG+F2XtyiQt1YhpaCut8LnHkpqwxqt9TPuvYlAxzdUg5xW3H7KjV
	 PgFHanWaxdwksk1wc7/+BRW8WPGVGbE+ZsZNz3Vz840c09y4aPgl4p3qxPHFq9PFs4
	 KgSFAD4nH6Veqn3mYE6K7UsOxZWPhhDW+ncaizatpW1U8B+kWfpKKFU3ONZ9yu0BzX
	 7B6cjHqR6FxQl2qagJ/qumO64/KC5wzOIMLW/9EkI72myLEC+HaSeP/LVl00Cnx01i
	 zw9JOvo3R3ljA==
Date: Fri, 27 Jun 2025 14:13:08 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Quentin Schulz <foss+kernel@0leil.net>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Daniel Semkowicz <dse@thaumatec.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	Lukasz Czechowski <lukasz.czechowski@thaumatec.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org,
	Heiko Stuebner <heiko@sntech.de>, Lee Jones <lee@kernel.org>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/5] dt-bindings: mfd: rk806: allow to customize PMIC
 reset mode
Message-ID: <175105158757.4019943.860671576753586474.robh@kernel.org>
References: <20250627-rk8xx-rst-fun-v4-0-ce05d041b45f@cherry.de>
 <20250627-rk8xx-rst-fun-v4-1-ce05d041b45f@cherry.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250627-rk8xx-rst-fun-v4-1-ce05d041b45f@cherry.de>


On Fri, 27 Jun 2025 12:53:53 +0200, Quentin Schulz wrote:
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
> 
> Some other systems may be depending on the power rails to not be
> interrupted even for a small amount of time[1].
> 
> This allows to specify how the PMIC should perform on the hardware level
> and may differ between harwdare designs, so a DT property seems
> warranted. I unfortunately do not see how this could be made generic
> enough to make it a non-vendor property.
> 
> [1] https://lore.kernel.org/linux-rockchip/2577051.irdbgypaU6@workhorse/
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
> ---
>  .../devicetree/bindings/mfd/rockchip,rk806.yaml     | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

