Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97DEC2798E6;
	Mon, 28 Apr 2025 16:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745857790; cv=none; b=tqyqZmYQW7UcpwJGq3Wy1TCyZk+6Lj7UgMp4caOMa/JfVkaMc/Qx24/VA0I9bK+5nSj25g1eCvYFXAq0AeHilTJktwcy5FPQcxDm//X9GhhraO0MFFjlu2BMOW8U59kFcnW3RduDEeQaH7oEJpvA/lbnqnwe0JhBKTVEHdts2as=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745857790; c=relaxed/simple;
	bh=ga6YRTY6WCh1L3PSDfGaxU4liPTWXf5+phBc3jEYBdw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=fmsoeWUfzVwx4B729xZV9/SiUUO9wAebRtOkYKGdvmk+SUTAeMlRrVsQHvhFk765IYM2FAZTIeELuNKx+VD0p7gbeUrtwbdYtEVLAdn7XpFNX78Jak62Trp7jxAdCUU96WAK75tTS1Gd1T44Rat8E7acF0lXEpVVLbO2OsAwFG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=TTrhAMw7; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="TTrhAMw7"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53SGTh9h2821787
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 28 Apr 2025 11:29:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745857783;
	bh=NR/28dcL7nI8hDkC2wwHs3MBlvJxD46kc5grX9UascQ=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=TTrhAMw7/g1RHLGOcrk7iKNETSZPA/PPgo9nReedoXOC61UWUZSWF1ZDXREsK7lp3
	 jr5exOZ0pW7pUpczKqqzJ4RPs4jyQj7kKKyeRm5g46aQK15B90s7OpI5FMZ5/Ty8G2
	 rWB4eg5Jb1iwczdHh51Nhth33DFIpB6RPpAobLzk=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53SGTgJ8111210
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 28 Apr 2025 11:29:43 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 28
 Apr 2025 11:29:42 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 28 Apr 2025 11:29:42 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53SGTgit003059;
	Mon, 28 Apr 2025 11:29:42 -0500
Message-ID: <795d9fb3-a9d7-41b2-84e5-a3a6f25754a1@ti.com>
Date: Mon, 28 Apr 2025 11:29:42 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 11/11] arm64: dts: ti: k3-am64: Reserve timers used by
 MCU FW
To: Judith Mendez <jm@ti.com>, Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra
	<vigneshr@ti.com>
CC: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Hari Nagalla <hnagalla@ti.com>,
        Beleswar
 Prasad <b-padhi@ti.com>,
        Markus Schneider-Pargmann <msp@baylibre.com>,
        Devarsh Thakkar <devarsht@ti.com>
References: <20250415153147.1844076-1-jm@ti.com>
 <20250415153147.1844076-12-jm@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20250415153147.1844076-12-jm@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 4/15/25 10:31 AM, Judith Mendez wrote:
> From: Hari Nagalla <hnagalla@ti.com>
> 
> AM64x device has 4 R5F cores in the main domain. TI MCU firmware uses
> main domain timers as tick timers in these firmwares. Hence keep them
> as reserved in the Linux device tree.
> 
> Signed-off-by: Hari Nagalla <hnagalla@ti.com>
> Signed-off-by: Judith Mendez <jm@ti.com>
> ---

Reviewed-by: Andrew Davis <afd@ti.com>

>   arch/arm64/boot/dts/ti/k3-am642-evm.dts | 20 ++++++++++++++++++++
>   arch/arm64/boot/dts/ti/k3-am642-sk.dts  | 20 ++++++++++++++++++++
>   2 files changed, 40 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am642-evm.dts b/arch/arm64/boot/dts/ti/k3-am642-evm.dts
> index f8ec40523254b..5623ab354a1d5 100644
> --- a/arch/arm64/boot/dts/ti/k3-am642-evm.dts
> +++ b/arch/arm64/boot/dts/ti/k3-am642-evm.dts
> @@ -796,6 +796,26 @@ &mcu_m4fss {
>   	status = "okay";
>   };
>   
> +/* main_timer8 is used by r5f0-0 */
> +&main_timer8 {
> +	status = "reserved";
> +};
> +
> +/* main_timer9 is used by r5f0-1 */
> +&main_timer9 {
> +	status = "reserved";
> +};
> +
> +/* main_timer10 is used by r5f1-0 */
> +&main_timer10 {
> +	status = "reserved";
> +};
> +
> +/* main_timer11 is used by r5f1-1 */
> +&main_timer11 {
> +	status = "reserved";
> +};
> +
>   &serdes_ln_ctrl {
>   	idle-states = <AM64_SERDES0_LANE0_PCIE0>;
>   };
> diff --git a/arch/arm64/boot/dts/ti/k3-am642-sk.dts b/arch/arm64/boot/dts/ti/k3-am642-sk.dts
> index 33e421ec18abb..1deaa0be0085c 100644
> --- a/arch/arm64/boot/dts/ti/k3-am642-sk.dts
> +++ b/arch/arm64/boot/dts/ti/k3-am642-sk.dts
> @@ -710,6 +710,26 @@ &mcu_m4fss {
>   	status = "okay";
>   };
>   
> +/* main_timer8 is used by r5f0-0 */
> +&main_timer8 {
> +	status = "reserved";
> +};
> +
> +/* main_timer9 is used by r5f0-1 */
> +&main_timer9 {
> +	status = "reserved";
> +};
> +
> +/* main_timer10 is used by r5f1-0 */
> +&main_timer10 {
> +	status = "reserved";
> +};
> +
> +/* main_timer11 is used by r5f1-1 */
> +&main_timer11 {
> +	status = "reserved";
> +};
> +
>   &ecap0 {
>   	status = "okay";
>   	/* PWM is available on Pin 1 of header J3 */
