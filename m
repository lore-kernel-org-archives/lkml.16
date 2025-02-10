Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58AB2259486;
	Mon, 10 Feb 2025 22:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739228321; cv=none; b=VZf6/w0eWGPw90kTheCSFiUsA1DbRKlvLVv5OH7OZkZWnbd+WCy7tyTPeuByhB0y2TtqCMas5d8kpCX8zAg5M0XoAt54ggs2PdQjpe5FDvx1DWXUUKpKdVrOI5Le5ejXDRw0xG3S2UZKMputEvOLz6X9wZAOMJmFCzQxdljiSTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739228321; c=relaxed/simple;
	bh=hfwJf4L+Q95kQOOlFh2Swb258GLVBZjpCsc36W1RI74=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=DAkKlbpC9jwb4rtEE4WR9a+lPxV1P+OooYe5WhRFtp1DgL3/qnSRQlIEI0CvNRhu9prR3v59B6hN2zQhYeehJQo8Vhv/qC8BHAfOeRUoRUTiEQgjc8WDeFbap1PtjwEKA+c771REG66HaO3Q4pb/4Y247hEfPExDhQsn+K73AzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=vm/z2t/2; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="vm/z2t/2"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51AMwSG53582840
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 10 Feb 2025 16:58:28 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1739228308;
	bh=D3h/ZSOBQq4p7/VYCUqu8pLi2T/O9RoNHeBynGSWXSo=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=vm/z2t/28tMfK8icNbCZ8S0BYoH64C/ZIo9cEONNXJkHaVtbrXPOLb2aJ3UIGM3S9
	 aKylijCt+GCCkCFoKhBMhtxqdytLwx2K5Y5Ix7kzVRxtFWH4hI11h0bYB41aHMGpXf
	 wDNT8zvAqNYlkSadnOv74tOINGE3idf13Au7EpQ0=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 51AMwSO8008376
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 10 Feb 2025 16:58:28 -0600
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 10
 Feb 2025 16:58:28 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 10 Feb 2025 16:58:28 -0600
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51AMwR4K052593;
	Mon, 10 Feb 2025 16:58:27 -0600
Message-ID: <2491d950-4a1c-497c-a3a8-d322e1021031@ti.com>
Date: Mon, 10 Feb 2025 16:58:27 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 02/10] arm64: dts: ti: k3-am62a-mcu: Add R5F remote
 proc node
To: Judith Mendez <jm@ti.com>, Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra
	<vigneshr@ti.com>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Hari Nagalla
	<hnagalla@ti.com>
References: <20250210221530.1234009-1-jm@ti.com>
 <20250210221530.1234009-3-jm@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20250210221530.1234009-3-jm@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 2/10/25 4:15 PM, Judith Mendez wrote:
> From: Hari Nagalla <hnagalla@ti.com>
> 
> AM62A SoCs have a single R5F core in the MCU voltage domain.
> Add the R5FSS node with the child node for core0 in MCU voltage
> domain .dtsi file.
> 
> Signed-off-by: Hari Nagalla <hnagalla@ti.com>
> Signed-off-by: Judith Mendez <jm@ti.com>
> ---

Acked-by: Andrew Davis <afd@ti.com>

> Changes since v4:
> - Drop SRAM node for am62ax MCU R5fSS0 core0
> ---
>   arch/arm64/boot/dts/ti/k3-am62a-mcu.dtsi | 25 ++++++++++++++++++++++++
>   1 file changed, 25 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am62a-mcu.dtsi b/arch/arm64/boot/dts/ti/k3-am62a-mcu.dtsi
> index 0469c766b769e..1178cc6a9be8c 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62a-mcu.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62a-mcu.dtsi
> @@ -175,4 +175,29 @@ mcu_mcan1: can@4e18000 {
>   		bosch,mram-cfg = <0x0 128 64 64 64 64 32 32>;
>   		status = "disabled";
>   	};
> +
> +	mcu_r5fss0: r5fss@79000000 {
> +		compatible = "ti,am62-r5fss";
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges = <0x79000000 0x00 0x79000000 0x8000>,
> +			 <0x79020000 0x00 0x79020000 0x8000>;
> +		power-domains = <&k3_pds 7 TI_SCI_PD_EXCLUSIVE>;
> +		status = "disabled";
> +
> +		mcu_r5fss0_core0: r5f@79000000 {
> +			compatible = "ti,am62-r5f";
> +			reg = <0x79000000 0x00008000>,
> +			      <0x79020000 0x00008000>;
> +			reg-names = "atcm", "btcm";
> +			ti,sci = <&dmsc>;
> +			ti,sci-dev-id = <9>;
> +			ti,sci-proc-ids = <0x03 0xff>;
> +			resets = <&k3_reset 9 1>;
> +			firmware-name = "am62a-mcu-r5f0_0-fw";
> +			ti,atcm-enable = <0>;
> +			ti,btcm-enable = <1>;
> +			ti,loczrama = <0>;
> +		};
> +	};
>   };
