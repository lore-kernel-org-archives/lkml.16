Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73C34269CFA;
	Mon, 28 Apr 2025 16:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745857714; cv=none; b=soZBdYeWmIeN2KzTjfGP+VtT0CQ5TbgLcva0GbcFeXqK1ztpCQvFHtuWz9L/bd1qXonLhA7VOB9qD52r0+QTgLaFInCiBzT3Bjrgl2hKLbSFs1vHeP0WM0SB0UZ9kZgfipLZK7O/sT3YOATQxZC7baAIYOXCcapKuY7pUuZt03U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745857714; c=relaxed/simple;
	bh=fDw2gzzM83ZYTDixpGlU/gACzK5/CA2xabsIEj/d/9c=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=LhZ0ENLmeKNk6zp1UegQ26ydkv1UoDsDybNaf1TPzC8xYuCclPXw9yYofVHo5rmlvUWJh+QIcvEUuBcf3LjGYtcR2+uJw2qViMc2qxXVWvikReMh3rr5VLI2CSeDcA/3tp49T6NTGyx5A4nZu3HsXjshyXOnVh65ZHhWqwVwN34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=qDV8X6Iz; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="qDV8X6Iz"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53SGSQ6C2821463
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 28 Apr 2025 11:28:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745857706;
	bh=PH8LqPmdzTiyEIRldLyF2ISfaZauzPwN6cosQsO86rM=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=qDV8X6IzH1PUAHkhmVrfhtoObnZWlDkppcKErvmxXxjYVqtbOvT6h2QNCnZ03WwtC
	 W/WDPUTdPSv6VykJ5uNdHmglIhSGoT81YbKXxoy9Epup9XYdRJd7OGvw26d+kHDfvD
	 m54ZRX/DzE6DihLbFJjq49di4VwjCDdZB78LcxCs=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53SGSQB4025096
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 28 Apr 2025 11:28:26 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 28
 Apr 2025 11:28:26 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 28 Apr 2025 11:28:26 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53SGSPa9001778;
	Mon, 28 Apr 2025 11:28:25 -0500
Message-ID: <31b0b9ed-859b-44f7-89b0-26cc6384356d@ti.com>
Date: Mon, 28 Apr 2025 11:28:25 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 09/11] arm64: dts: ti: k3-am62a7-sk: Reserve
 main_timer2 for C7x DSP
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
 <20250415153147.1844076-10-jm@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20250415153147.1844076-10-jm@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 4/15/25 10:31 AM, Judith Mendez wrote:
> From: Hari Nagalla <hnagalla@ti.com>
> 
> C7x DSP uses main_timer2, so mark it as reserved in linux DT.
> 

The set of peripherals used by this C7x core depends on the firmware
running on the core. Long term we should think on a better way of
communicating this from firmware to Linux. Same goes for the next
two patches.

For now since these timers are always used by all firmware, this
will be safe to do, but for other peripherals we will need that
better solution.

Reviewed-by: Andrew Davis <afd@ti.com>

> Signed-off-by: Hari Nagalla <hnagalla@ti.com>
> Signed-off-by: Judith Mendez <jm@ti.com>
> ---
>   arch/arm64/boot/dts/ti/k3-am62a7-sk.dts | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
> index 7d817b447c1d0..8d7645bb90337 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
> +++ b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
> @@ -682,6 +682,11 @@ &main_uart1 {
>   	status = "reserved";
>   };
>   
> +/* main_timer2 is used by C7x DSP */
> +&main_timer2 {
> +	status = "reserved";
> +};
> +
>   &usbss0 {
>   	status = "okay";
>   	ti,vbus-divider;
