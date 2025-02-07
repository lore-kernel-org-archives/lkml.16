Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6295F18F2C3;
	Fri,  7 Feb 2025 17:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738947980; cv=none; b=WIFuadZPRhUW8yS9OCmwf4qtAX2JqhAH/GT/ST9Df8CzH7d6c6mCmStsRdZeqtgqbNZXlFSBJH0DX2Vs98auu21sQsR4t30EStoXlAwYfuPUm8Y10cOjt3Tu8uJOW1+7ZFoVY9onYoDa70Vi04jrjc4JXcahTk2qQFsp/jZj/QE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738947980; c=relaxed/simple;
	bh=ktAytdhP7Jqzfb4Gb4RpwSmijPunS2K5G9emEQcuePM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=t0yvf7foC/RErdNf0JQEr0H2Oov1VvtNv4PwHET5C0TnIDz3X3wCow22lSGpPHCRj9i8o/b0C2ZbjWdaTomfTZQeYEhkA8SeEmri8jK+nj2F7L7Es7DGAOCwHBiIclWpn2eg0s+XqHTRMJJ0vEgC8qr/WU/3AMTGsyb3YIDZj0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=leL05ieF; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="leL05ieF"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 517GwfnQ3861324
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 7 Feb 2025 10:58:41 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738947521;
	bh=2zri0YGU7tlFtITZQ9YMGtcv5e9E37p1MNnjf0vhx08=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=leL05ieF6zpLhg2FiTFTeRMLLae99qfp4tExBvi3pzjhdFroseaKK5JCD0Tk3zq18
	 eW3IKGeGD+IxR5sGR63deUXFee/iTp3JHlbsbTGORS14jIV+oWp0OFxtxSqe6kBz0K
	 Tw/G3jXxXy2zf3Kv0y5urFjXWJ+XWK50bPvXKxLM=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 517Gwf6n060034;
	Fri, 7 Feb 2025 10:58:41 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 7
 Feb 2025 10:58:41 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 7 Feb 2025 10:58:41 -0600
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 517GweNg097409;
	Fri, 7 Feb 2025 10:58:40 -0600
Message-ID: <32358aa1-0c02-4f4d-9782-2d8376c0d9fc@ti.com>
Date: Fri, 7 Feb 2025 10:58:40 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/9] arm64: dts: ti: k3-am62p5-sk: Enable IPC with
 remote processors
To: Judith Mendez <jm@ti.com>, Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra
	<vigneshr@ti.com>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Hari Nagalla
	<hnagalla@ti.com>
References: <20250206235200.3128163-1-jm@ti.com>
 <20250206235200.3128163-7-jm@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20250206235200.3128163-7-jm@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 2/6/25 5:51 PM, Judith Mendez wrote:
> From: Devarsh Thakkar <devarsht@ti.com>
> 
> For each remote proc, reserve memory for IPC and bind the mailbox
> assignments. Two memory regions are reserved for each remote processor.
> The first region of 1MB of memory is used for Vring shared buffers
> and the second region is used as external memory to the remote processor
> for the resource table and for tracebuffer allocations.
> 
> Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
> Signed-off-by: Hari Nagalla <hnagalla@ti.com>
> Signed-off-by: Judith Mendez <jm@ti.com>
> ---
> Changes since v3:
> - Add SRAM child node for am62p MCU R5 core 0
> ---
>   .../dts/ti/k3-am62p-j722s-common-mcu.dtsi     | 13 +++++
>   arch/arm64/boot/dts/ti/k3-am62p5-sk.dts       | 50 ++++++++++++++++---
>   2 files changed, 57 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-mcu.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-mcu.dtsi
> index b33aff0d65c9d..0be3463bc21c5 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-mcu.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-mcu.dtsi
> @@ -6,6 +6,18 @@
>    */
>   
>   &cbass_mcu {
> +	mcu_ram: sram@79100000 {
> +		compatible = "mmio-sram";
> +		reg = <0x00 0x79100000 0x00 0x80000>;
> +		ranges = <0x00 0x00 0x79100000 0x80000>;
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +
> +		mcu_sram1@0 {

What does this node do for us? Seems you reserve the whole SRAM
area from the start, but shouldn't the phandle in mcu_r5fss0_core0
point to this node? Or better it would use the normal SRAM API
to request an allocation from this region.

Since this is still not resolved, and you don't mention it in
the commit message, might be good to drop this SRAM part of this
patch and deal with this in a later series.

Andrew

> +			reg = <0x0 0x80000>;
> +		};
> +	};
> +
>   	mcu_pmx0: pinctrl@4084000 {
>   		compatible = "pinctrl-single";
>   		reg = <0x00 0x04084000 0x00 0x88>;
> @@ -213,6 +225,7 @@ mcu_r5fss0_core0: r5f@79000000 {
>   			ti,atcm-enable = <0>;
>   			ti,btcm-enable = <1>;
>   			ti,loczrama = <0>;
> +			sram = <&mcu_ram>;
>   		};
>   	};
>   };
> diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
> index ad71d2f27f538..9609727d042d3 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
> +++ b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
> @@ -48,6 +48,30 @@ reserved-memory {
>   		#size-cells = <2>;
>   		ranges;
>   
> +		mcu_r5fss0_core0_dma_memory_region: mcu-r5fss-dma-memory-region@9b800000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0x00 0x9b800000 0x00 0x100000>;
> +			no-map;
> +		};
> +
> +		mcu_r5fss0_core0_memory_region: mcu-r5fss-memory-region@9b900000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0x00 0x9b900000 0x00 0xf00000>;
> +			no-map;
> +		};
> +
> +		wkup_r5fss0_core0_dma_memory_region: r5f-dma-memory@9c800000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0x00 0x9c800000 0x00 0x100000>;
> +			no-map;
> +		};
> +
> +		wkup_r5fss0_core0_memory_region: r5f-memory@9c900000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0x00 0x9c900000 0x00 0x1e00000>;
> +			no-map;
> +		};
> +
>   		secure_tfa_ddr: tfa@9e780000 {
>   			reg = <0x00 0x9e780000 0x00 0x80000>;
>   			no-map;
> @@ -57,12 +81,6 @@ secure_ddr: optee@9e800000 {
>   			reg = <0x00 0x9e800000 0x00 0x01800000>; /* for OP-TEE */
>   			no-map;
>   		};
> -
> -		wkup_r5fss0_core0_memory_region: r5f-dma-memory@9c900000 {
> -			compatible = "shared-dma-pool";
> -			reg = <0x00 0x9c900000 0x00 0x01e00000>;
> -			no-map;
> -		};
>   	};
>   
>   	vmain_pd: regulator-0 {
> @@ -638,6 +656,26 @@ mbox_mcu_r5_0: mbox-mcu-r5-0 {
>   	};
>   };
>   
> +&wkup_r5fss0 {
> +	status = "okay";
> +};
> +
> +&wkup_r5fss0_core0 {
> +	mboxes = <&mailbox0_cluster0 &mbox_r5_0>;
> +	memory-region = <&wkup_r5fss0_core0_dma_memory_region>,
> +			<&wkup_r5fss0_core0_memory_region>;
> +};
> +
> +&mcu_r5fss0 {
> +	status = "okay";
> +};
> +
> +&mcu_r5fss0_core0 {
> +	mboxes = <&mailbox0_cluster1 &mbox_mcu_r5_0>;
> +	memory-region = <&mcu_r5fss0_core0_dma_memory_region>,
> +			<&mcu_r5fss0_core0_memory_region>;
> +};
> +
>   &main_uart0 {
>   	pinctrl-names = "default";
>   	pinctrl-0 = <&main_uart0_pins_default>;
