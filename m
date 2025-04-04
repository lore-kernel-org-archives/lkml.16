Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F6391F37D4;
	Fri,  4 Apr 2025 14:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743776008; cv=none; b=CyXiZL1fezaxl8AbEiL8MtQyOYg/qz3JIR7B9JsvklVfVY6Yi24ZAYiBeKSg9dPgmGxJi5hHgPLsMKfpfVTCNm1QOBH7qeWGqLDH7ydrUCMc+WiS7G92RRV3O4I94uK8TZkBl/mIeKjKG50i8MF/+jfNr7IrzGqw0Gmu+PutdH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743776008; c=relaxed/simple;
	bh=6/ZliiFeJpRlMUpP4YFEsGIx2O3ziIJndM7oADHVj34=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fe1dksq8wB5+0Rtnb5ppmyE2j/ZyDAaEgS4GWDsfmSEJqq08NAHEubdrrZgv/+pYgalhOKcuN0m3bUD9bN3Van4CZruaTiEE+LTReDPIi1NcfWHFc7AUHxmoIKVQbPFufD0tPvzHsiZfDR6yO3ZKcfDS7Z+/Ujw2dNsDDjdNCUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BAE311515;
	Fri,  4 Apr 2025 07:13:27 -0700 (PDT)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 909073F63F;
	Fri,  4 Apr 2025 07:13:22 -0700 (PDT)
Date: Fri, 4 Apr 2025 15:13:20 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jerome Brunet
 <jbrunet@baylibre.com>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Chen-Yu Tsai <wens@csie.org>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 Emilio =?UTF-8?B?TMOzcGV6?= <emilio@elopez.com.ar>,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 4/5] clk: sunxi-ng: Do not enable by default during
 compile testing
Message-ID: <20250404151320.53c4698b@donnerap.manchester.arm.com>
In-Reply-To: <20250404-kconfig-defaults-clk-v1-4-4d2df5603332@linaro.org>
References: <20250404-kconfig-defaults-clk-v1-0-4d2df5603332@linaro.org>
	<20250404-kconfig-defaults-clk-v1-4-4d2df5603332@linaro.org>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 04 Apr 2025 13:57:00 +0200
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:

Hi 
> Enabling the compile test should not cause automatic enabling of all
> drivers.  Restrict the default to ARCH also for individual drivers, even
> though their choice is not visible without selecting parent Kconfig
> symbol, because otherwise selecting parent would select the child during
> compile testing.

so I remember we changed this to "default y", because there were some
tricky problems with regards to RISC-V and ARM. See commits:

commit 0ff347db4c97cc16b4e428dc1db550ba3628f1e2
Author: Samuel Holland <samuel@sholland.org>
Date:   Sat Dec 31 17:14:25 2022 -0600
    clk: sunxi-ng: Move SoC driver conditions to dependencies

and 

commit a26dc096f683ca27ac5e68703bfd3098b4212abd
Author: Samuel Holland <samuel@sholland.org>
Date:   Sat Dec 31 17:14:24 2022 -0600
    clk: sunxi-ng: Remove duplicate ARCH_SUNXI dependencies

Don't remember what broke, exactly, but just wanted to give a heads up.

Cheers,
Andre

> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/clk/sunxi-ng/Kconfig | 48 ++++++++++++++++++++++----------------------
>  1 file changed, 24 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/clk/sunxi-ng/Kconfig b/drivers/clk/sunxi-ng/Kconfig
> index 5830a9d87bf25d536ac787fe83669c64c8214952..8896fd052ef1784d60d488ab1498737c1405deb2 100644
> --- a/drivers/clk/sunxi-ng/Kconfig
> +++ b/drivers/clk/sunxi-ng/Kconfig
> @@ -9,123 +9,123 @@ if SUNXI_CCU
>  
>  config SUNIV_F1C100S_CCU
>  	tristate "Support for the Allwinner newer F1C100s CCU"
> -	default y
> +	default ARCH_SUNXI
>  	depends on MACH_SUNIV || COMPILE_TEST
>  
>  config SUN20I_D1_CCU
>  	tristate "Support for the Allwinner D1/R528/T113 CCU"
> -	default y
> +	default ARCH_SUNXI
>  	depends on MACH_SUN8I || RISCV || COMPILE_TEST
>  
>  config SUN20I_D1_R_CCU
>  	tristate "Support for the Allwinner D1/R528/T113 PRCM CCU"
> -	default y
> +	default ARCH_SUNXI
>  	depends on MACH_SUN8I || RISCV || COMPILE_TEST
>  
>  config SUN50I_A64_CCU
>  	tristate "Support for the Allwinner A64 CCU"
> -	default y
> +	default ARCH_SUNXI
>  	depends on ARM64 || COMPILE_TEST
>  
>  config SUN50I_A100_CCU
>  	tristate "Support for the Allwinner A100 CCU"
> -	default y
> +	default ARCH_SUNXI
>  	depends on ARM64 || COMPILE_TEST
>  
>  config SUN50I_A100_R_CCU
>  	tristate "Support for the Allwinner A100 PRCM CCU"
> -	default y
> +	default ARCH_SUNXI
>  	depends on ARM64 || COMPILE_TEST
>  
>  config SUN50I_H6_CCU
>  	tristate "Support for the Allwinner H6 CCU"
> -	default y
> +	default ARCH_SUNXI
>  	depends on ARM64 || COMPILE_TEST
>  
>  config SUN50I_H616_CCU
>  	tristate "Support for the Allwinner H616 CCU"
> -	default y
> +	default ARCH_SUNXI
>  	depends on ARM64 || COMPILE_TEST
>  
>  config SUN50I_H6_R_CCU
>  	tristate "Support for the Allwinner H6 and H616 PRCM CCU"
> -	default y
> +	default ARCH_SUNXI
>  	depends on ARM64 || COMPILE_TEST
>  
>  config SUN55I_A523_CCU
>  	tristate "Support for the Allwinner A523/T527 CCU"
> -	default y
> +	default ARCH_SUNXI
>  	depends on ARM64 || COMPILE_TEST
>  
>  config SUN55I_A523_R_CCU
>  	tristate "Support for the Allwinner A523/T527 PRCM CCU"
> -	default y
> +	default ARCH_SUNXI
>  	depends on ARM64 || COMPILE_TEST
>  
>  config SUN4I_A10_CCU
>  	tristate "Support for the Allwinner A10/A20 CCU"
> -	default y
> +	default ARCH_SUNXI
>  	depends on MACH_SUN4I || MACH_SUN7I || COMPILE_TEST
>  
>  config SUN5I_CCU
>  	bool "Support for the Allwinner sun5i family CCM"
> -	default y
> +	default ARCH_SUNXI
>  	depends on MACH_SUN5I || COMPILE_TEST
>  	depends on SUNXI_CCU=y
>  
>  config SUN6I_A31_CCU
>  	tristate "Support for the Allwinner A31/A31s CCU"
> -	default y
> +	default ARCH_SUNXI
>  	depends on MACH_SUN6I || COMPILE_TEST
>  
>  config SUN6I_RTC_CCU
>  	tristate "Support for the Allwinner H616/R329 RTC CCU"
> -	default y
> +	default ARCH_SUNXI
>  	depends on MACH_SUN8I || ARM64 || RISCV || COMPILE_TEST
>  
>  config SUN8I_A23_CCU
>  	tristate "Support for the Allwinner A23 CCU"
> -	default y
> +	default ARCH_SUNXI
>  	depends on MACH_SUN8I || COMPILE_TEST
>  
>  config SUN8I_A33_CCU
>  	tristate "Support for the Allwinner A33 CCU"
> -	default y
> +	default ARCH_SUNXI
>  	depends on MACH_SUN8I || COMPILE_TEST
>  
>  config SUN8I_A83T_CCU
>  	tristate "Support for the Allwinner A83T CCU"
> -	default y
> +	default ARCH_SUNXI
>  	depends on MACH_SUN8I || COMPILE_TEST
>  
>  config SUN8I_H3_CCU
>  	tristate "Support for the Allwinner H3 CCU"
> -	default y
> +	default ARCH_SUNXI
>  	depends on MACH_SUN8I || ARM64 || COMPILE_TEST
>  
>  config SUN8I_V3S_CCU
>  	tristate "Support for the Allwinner V3s CCU"
> -	default y
> +	default ARCH_SUNXI
>  	depends on MACH_SUN8I || COMPILE_TEST
>  
>  config SUN8I_DE2_CCU
>  	tristate "Support for the Allwinner SoCs DE2 CCU"
> -	default y
> +	default ARCH_SUNXI
>  	depends on MACH_SUN8I || ARM64 || RISCV || COMPILE_TEST
>  
>  config SUN8I_R40_CCU
>  	tristate "Support for the Allwinner R40 CCU"
> -	default y
> +	default ARCH_SUNXI
>  	depends on MACH_SUN8I || COMPILE_TEST
>  
>  config SUN9I_A80_CCU
>  	tristate "Support for the Allwinner A80 CCU"
> -	default y
> +	default ARCH_SUNXI
>  	depends on MACH_SUN9I || COMPILE_TEST
>  
>  config SUN8I_R_CCU
>  	tristate "Support for Allwinner SoCs' PRCM CCUs"
> -	default y
> +	default ARCH_SUNXI
>  	depends on MACH_SUN8I || ARM64 || COMPILE_TEST
>  
>  endif
> 

