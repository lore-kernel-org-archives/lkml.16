Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6CC32E11DF;
	Fri, 13 Jun 2025 14:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749823337; cv=none; b=MG5YcbrDDOtz+URuIRACr2qW4/oHN2tjS2XhHPIBTfkZQEpe1+S5fHmvTKiLgzyuSxoUeTqsMyn7IVelZGoTlI5Y/tn+DCvUrtQE6lh3KyqmBg+VEsmHoLAp1x2YKKUKvJPSiCXii8kIVz+7a++aQhaUBYXVJApaLlTQonquie0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749823337; c=relaxed/simple;
	bh=CQucgb1bg0xXPls5H7qr6pbanXMG619gYuEhe3r6jdw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ADCG3Z8ceuUqjyEWEitgZ4G0w8NBSNznAVOHVa/6b1yCg3Cb5X+LL0D9bRMrPzbvQe2bzrehC3jwogd6R+mzl1UiizpL+c/txrDHMTdKGDiJSKYOOexgphGHS3qlP3cuF/FJjDuMPeJgdTqUsTMVe71FXASqZYrGpw6KCkWHc+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ur3kkzed; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ur3kkzed"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92389C4CEEF;
	Fri, 13 Jun 2025 14:02:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749823337;
	bh=CQucgb1bg0xXPls5H7qr6pbanXMG619gYuEhe3r6jdw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ur3kkzedQWntfr0lGNXGpqQBM2QdnEihDlqla44a5n6yOytZZEuWdRGcNq6Y91SZ5
	 54CjUgweeYK6CndciVGUbjwh4UK5+u9Lu9WSD4RDbChIgCn1kXkse0BUGrt8eUxOhF
	 t5uuj0X3cKmjV5Kf9AplE1T4SNDVUMT1JujcSNwdOHLXt+WZxlICwYL+B2eWdJutUq
	 BYYC/VSwUEst5VJO5gER5ynfRq3Kn6zWZy8kqx+VV9mQ01nbeuzR0XuHyooCDGfGih
	 tV/9MB3R8rmuY+fEUMl5k2lSGvcBtChKwa4nLgCY8CLxyJH5S/2++EPWyG2ad7RcQe
	 gkEm2Y3e8QrjA==
Date: Fri, 13 Jun 2025 15:02:11 +0100
From: Lee Jones <lee@kernel.org>
To: Quentin Schulz <foss+kernel@0leil.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Lukasz Czechowski <lukasz.czechowski@thaumatec.com>,
	Daniel Semkowicz <dse@thaumatec.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	Quentin Schulz <quentin.schulz@cherry.de>
Subject: Re: [PATCH 2/4] mfd: rk8xx-core: allow to customize RK806 reset
 method
Message-ID: <20250613140211.GC897353@google.com>
References: <20250526-rk8xx-rst-fun-v1-0-ea894d9474e0@cherry.de>
 <20250526-rk8xx-rst-fun-v1-2-ea894d9474e0@cherry.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250526-rk8xx-rst-fun-v1-2-ea894d9474e0@cherry.de>

On Mon, 26 May 2025, Quentin Schulz wrote:

> From: Quentin Schulz <quentin.schulz@cherry.de>
> 
> The RK806 PMIC (and RK809, RK817; but those aren't handled here) has a
> bitfield for configuring the restart/reset behavior (which I assume
> Rockchip calls "function") whenever the PMIC is reset (at least by
> software; c.f. DEV_RST in the datasheet).
> 
> For RK806, the following values are possible for RST_FUN:
> 
> 0b00 means "restart PMU"
> 0b01 means "Reset all the power off reset registers, forcing
> 	the state to switch to ACTIVE mode"
> 0b10 means "Reset all the power off reset registers, forcing
> 	the state to switch to ACTIVE mode, and simultaneously
> 	pull down the RESETB PIN for 5mS before releasing"
> 0b11 means the same as for 0b10 just above.
> 
> This adds the appropriate logic in the driver to parse the new
> rockchip,rst-fun DT property to pass this information.
> 
> If it is missing, the register is left untouched and relies either on
> the silicon default or on whatever was set earlier in the boot stages
> (e.g. the bootloader).
> 
> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
> ---
>  drivers/mfd/rk8xx-core.c  | 15 +++++++++++++++
>  include/linux/mfd/rk808.h |  2 ++
>  2 files changed, 17 insertions(+)

The test robots seem unhappy with this.  Please fix and resubmit.

-- 
Lee Jones [李琼斯]
