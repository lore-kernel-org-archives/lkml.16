Received: from out-189.mta1.migadu.com (out-189.mta1.migadu.com [95.215.58.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA0411FF1B4
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 20:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744921233; cv=none; b=p+5txVPCo2oDl6tR7QssBAveC1UB4QDoQIVBjq9SMVzJrdBDc0xbFFyXYpraWNFPVmWF3cXlLFSevXA1cbPttGw9/JgZdn9CzjbU0bu9c3vqV9A8EJFYi7BNbsrgBd0g6lxRHtz0mQ2jEewjL43Tk6Ur48Ly6VXzVDhBPt2EnR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744921233; c=relaxed/simple;
	bh=6E/EicMaKI2Ej7Kdf3RzZOCJM07RYIg7HQ6HNVLwqzI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EbiqE8z/Kp7EtqeEJ4EKgI9Y/7BUJDyd7WwLIj542zaKe2Dc631shqiMPQye01kD2NCyUE1Tv0NhnQLWl2JGYGVXR17xf22nK3J7zrHFbqE1AM7eO6i9A/3Jbf33B2W0DNfcTeU1O9FnDY1rSBzOJbekKG1LcbVjJR1vzyK4PUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosenzweig.io; spf=pass smtp.mailfrom=rosenzweig.io; dkim=pass (2048-bit key) header.d=rosenzweig.io header.i=@rosenzweig.io header.b=UOHhvVBm; arc=none smtp.client-ip=95.215.58.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosenzweig.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rosenzweig.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rosenzweig.io header.i=@rosenzweig.io header.b="UOHhvVBm"
Date: Thu, 17 Apr 2025 16:20:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
	s=key1; t=1744921215;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CxvYpumBEozSHV1DnKr6eE5OC/BNJCiIXETzkliOdRU=;
	b=UOHhvVBmkAgd9WPNP7A5w8ORvh53ti6pcpvBWVConhhHfLt9Ugsr6o2Shy84/azCIHLw1H
	QSOBOqgRmlbhVRoAWfjInC3LY0E5a3xRx/YlDLiu4fAQvviI9yuq+UrItgYhjZDKwU9WBD
	u7wtaDjpDbEdmPpjOdVMZGei9lVtmNQNYoAFWuL+ia9uUMCRV1qsa2B0Zk641GEs+Aciti
	MHt0M3lJcZFRv3ooqkdF6Enc3Q9K4jr7oYbbP3ZmThFVP4FtLwpmxV9LYZUkcqRVlUmiI4
	r3dndD7W7iKWfdN0JEfPv54uFOM9UDEZRLxIvND4WJg+0QhnqAUuvSXf/jqczQ==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: fnkl.kernel@gmail.com
Cc: Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Hector Martin <marcan@marcan.st>
Subject: Re: [PATCH v2 3/3] arm64: dts: apple: Add PMU NVMEM
Message-ID: <aAFid7N3XiERXTbl@blossom>
References: <20250417-spmi-nvmem-v2-0-b88851e34afb@gmail.com>
 <20250417-spmi-nvmem-v2-3-b88851e34afb@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250417-spmi-nvmem-v2-3-b88851e34afb@gmail.com>
X-Migadu-Flow: FLOW_OUT

Reviewed-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>

Le Thu , Apr 17, 2025 at 10:14:51PM +0200, Sasha Finkelstein via B4 Relay a écrit :
> From: Hector Martin <marcan@marcan.st>
> 
> Add device tree entries for NVMEM cells present on the PMU
> 
> Signed-off-by: Hector Martin <marcan@marcan.st>
> Co-developed-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
> ---
>  arch/arm64/boot/dts/apple/t6001.dtsi      |  1 +
>  arch/arm64/boot/dts/apple/t6002.dtsi      |  1 +
>  arch/arm64/boot/dts/apple/t600x-die0.dtsi | 50 +++++++++++++++++++++++++++++++
>  arch/arm64/boot/dts/apple/t8103.dtsi      | 50 +++++++++++++++++++++++++++++++
>  arch/arm64/boot/dts/apple/t8112.dtsi      | 50 +++++++++++++++++++++++++++++++
>  5 files changed, 152 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/apple/t6001.dtsi b/arch/arm64/boot/dts/apple/t6001.dtsi
> index 620b17e4031f069874aaabadbf06b7b29ec4031e..d2cf81926f284ccf7627701cc82edff31d4d72d6 100644
> --- a/arch/arm64/boot/dts/apple/t6001.dtsi
> +++ b/arch/arm64/boot/dts/apple/t6001.dtsi
> @@ -11,6 +11,7 @@
>  #include <dt-bindings/interrupt-controller/apple-aic.h>
>  #include <dt-bindings/interrupt-controller/irq.h>
>  #include <dt-bindings/pinctrl/apple.h>
> +#include <dt-bindings/spmi/spmi.h>
>  
>  #include "multi-die-cpp.h"
>  
> diff --git a/arch/arm64/boot/dts/apple/t6002.dtsi b/arch/arm64/boot/dts/apple/t6002.dtsi
> index a963a5011799a0480f88688fb4372a31f0bbf806..e36f422d257d8fe3a62bfa6e0f0e0dc6c34608a4 100644
> --- a/arch/arm64/boot/dts/apple/t6002.dtsi
> +++ b/arch/arm64/boot/dts/apple/t6002.dtsi
> @@ -11,6 +11,7 @@
>  #include <dt-bindings/interrupt-controller/apple-aic.h>
>  #include <dt-bindings/interrupt-controller/irq.h>
>  #include <dt-bindings/pinctrl/apple.h>
> +#include <dt-bindings/spmi/spmi.h>
>  
>  #include "multi-die-cpp.h"
>  
> diff --git a/arch/arm64/boot/dts/apple/t600x-die0.dtsi b/arch/arm64/boot/dts/apple/t600x-die0.dtsi
> index 4c224e686ffe5602329f7f394d3354559c4130ab..fba01727ee8bd67990cb001a5727d5dd2d01e2ee 100644
> --- a/arch/arm64/boot/dts/apple/t600x-die0.dtsi
> +++ b/arch/arm64/boot/dts/apple/t600x-die0.dtsi
> @@ -50,6 +50,56 @@ nub_spmi0: spmi@2920a1300 {
>  		reg = <0x2 0x920a1300 0x0 0x100>;
>  		#address-cells = <2>;
>  		#size-cells = <0>;
> +
> +		pmic1: pmic@f {
> +			compatible = "apple,maverick-pmic", "spmi-nvmem";
> +			reg = <0xf SPMI_USID>;
> +
> +			nvmem-layout {
> +				compatible = "fixed-layout";
> +				#address-cells = <1>;
> +				#size-cells = <1>;
> +
> +				pm_setting: pm-setting@1405 {
> +					reg = <0x1405 0x1>;
> +				};
> +
> +				rtc_offset: rtc-offset@1411 {
> +					reg = <0x1411 0x6>;
> +				};
> +
> +				boot_stage: boot-stage@6001 {
> +					reg = <0x6001 0x1>;
> +				};
> +
> +				boot_error_count: boot-error-count@6002 {
> +					reg = <0x6002 0x1>;
> +					bits = <0 4>;
> +				};
> +
> +				panic_count: panic-count@6002 {
> +					reg = <0x6002 0x1>;
> +					bits = <4 4>;
> +				};
> +
> +				boot_error_stage: boot-error-stage@6003 {
> +					reg = <0x6003 0x1>;
> +				};
> +
> +				shutdown_flag: shutdown-flag@600f {
> +					reg = <0x600f 0x1>;
> +					bits = <3 1>;
> +				};
> +
> +				fault_shadow: fault-shadow@867b {
> +					reg = <0x867b 0x10>;
> +				};
> +
> +				socd: socd@8b00 {
> +					reg = <0x8b00 0x400>;
> +				};
> +			};
> +		};
>  	};
>  
>  	wdt: watchdog@2922b0000 {
> diff --git a/arch/arm64/boot/dts/apple/t8103.dtsi b/arch/arm64/boot/dts/apple/t8103.dtsi
> index bdb1cb9e406a441e458b1c735359b0148146e91b..3892fbe6a955513cad2ae836acc3e83009ab7cc5 100644
> --- a/arch/arm64/boot/dts/apple/t8103.dtsi
> +++ b/arch/arm64/boot/dts/apple/t8103.dtsi
> @@ -747,6 +747,56 @@ nub_spmi: spmi@23d0d9300 {
>  			reg = <0x2 0x3d0d9300 0x0 0x100>;
>  			#address-cells = <2>;
>  			#size-cells = <0>;
> +
> +			pmic1: pmic@f {
> +				compatible = "apple,sera-pmic", "spmi-nvmem";
> +				reg = <0xf SPMI_USID>;
> +
> +				nvmem-layout {
> +					compatible = "fixed-layout";
> +					#address-cells = <1>;
> +					#size-cells = <1>;
> +
> +					boot_stage: boot-stage@9f01 {
> +						reg = <0x9f01 0x1>;
> +					};
> +
> +					boot_error_count: boot-error-count@9f02 {
> +						reg = <0x9f02 0x1>;
> +						bits = <0 4>;
> +					};
> +
> +					panic_count: panic-count@9f02 {
> +						reg = <0x9f02 0x1>;
> +						bits = <4 4>;
> +					};
> +
> +					boot_error_stage: boot-error-stage@9f03 {
> +						reg = <0x9f03 0x1>;
> +					};
> +
> +					shutdown_flag: shutdown-flag@9f0f {
> +						reg = <0x9f0f 0x1>;
> +						bits = <3 1>;
> +					};
> +
> +					fault_shadow: fault-shadow@a67b {
> +						reg = <0xa67b 0x10>;
> +					};
> +
> +					socd: socd@ab00 {
> +						reg = <0xab00 0x400>;
> +					};
> +
> +					pm_setting: pm-setting@d001 {
> +						reg = <0xd001 0x1>;
> +					};
> +
> +					rtc_offset: rtc-offset@d100 {
> +						reg = <0xd100 0x6>;
> +					};
> +				};
> +			};
>  		};
>  
>  		pinctrl_nub: pinctrl@23d1f0000 {
> diff --git a/arch/arm64/boot/dts/apple/t8112.dtsi b/arch/arm64/boot/dts/apple/t8112.dtsi
> index 950d1f906ba3023c1d118179207a2099345aae94..325e2ac22b3c88d863b2270c39a0a05d625e3f10 100644
> --- a/arch/arm64/boot/dts/apple/t8112.dtsi
> +++ b/arch/arm64/boot/dts/apple/t8112.dtsi
> @@ -787,6 +787,56 @@ nub_spmi: spmi@23d714000 {
>  			reg = <0x2 0x3d714000 0x0 0x100>;
>  			#address-cells = <2>;
>  			#size-cells = <0>;
> +
> +			pmic1: pmic@e {
> +				compatible = "apple,stowe-pmic", "spmi-nvmem";
> +				reg = <0xe SPMI_USID>;
> +
> +				nvmem-layout {
> +					compatible = "fixed-layout";
> +					#address-cells = <1>;
> +					#size-cells = <1>;
> +
> +					fault_shadow: fault-shadow@867b {
> +						reg = <0x867b 0x10>;
> +					};
> +
> +					socd: socd@8b00 {
> +						reg = <0x8b00 0x400>;
> +					};
> +
> +					boot_stage: boot-stage@f701 {
> +						reg = <0xf701 0x1>;
> +					};
> +
> +					boot_error_count: boot-error-count@f702 {
> +						reg = <0xf702 0x1>;
> +						bits = <0 4>;
> +					};
> +
> +					panic_count: panic-count@f702 {
> +						reg = <0xf702 0x1>;
> +						bits = <4 4>;
> +					};
> +
> +					boot_error_stage: boot-error-stage@f703 {
> +						reg = <0xf703 0x1>;
> +					};
> +
> +					shutdown_flag: shutdown-flag@f70f {
> +						reg = <0xf70f 0x1>;
> +						bits = <3 1>;
> +					};
> +
> +					pm_setting: pm-setting@f801 {
> +						reg = <0xf801 0x1>;
> +					};
> +
> +					rtc_offset: rtc-offset@f900 {
> +						reg = <0xf900 0x6>;
> +					};
> +				};
> +			};
>  		};
>  
>  		pinctrl_smc: pinctrl@23e820000 {
> 
> -- 
> 2.49.0
> 
> 
