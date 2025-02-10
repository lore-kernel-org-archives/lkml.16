Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A31CC259487;
	Mon, 10 Feb 2025 22:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739228344; cv=none; b=loKgKpAq1AdahqArRztoQW/7DBsFOKG+vdRda+pKrOdI1ZpFDWTjDG5Zd8E13UsbB6jZ5HRmdyO/w4NRAdqQD/hWX18MF3Pxy+F5M0+nlDN4cRa5jj9JBtLs6EDZpcql74dCmiLiQ2G2M/ZvoDxCrTGykfBr4qZMu1LfIefYiJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739228344; c=relaxed/simple;
	bh=pZYQdXNFzRf8C0YJAzloVfDX1NE2ZpT9HDzfyjFymh8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=YWhAXJw8qiMxJWHuhnOfOzDGnbWGcwf0humdfhyb3OrJGC4C6AJM7kf9knHY6C7SwQWH8+OBQ7v+vyYC1LGBHI62FFGfpe7rxZ9xSil58tL4YuZ7wdsy3hl29x/i/O509LmLS2X2SjsDRu4jErJQIvfh6HGjIEWfnQHE2uIpBhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=dqnejJ/X; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="dqnejJ/X"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51AMwugi3582852
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 10 Feb 2025 16:58:56 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1739228336;
	bh=iC2U8Wn7kGF2PEm+pmf5NLerIZgG0BIk56qtZD7q44Q=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=dqnejJ/X0ryB7ScIfgsJFcvSNN3cmwt973RK9/Tgwh8KgAoUYuLA58xQVl8Vc/WN5
	 S5+jivfP8OAQPWkjozy2v4OfymtO04aJPtD7q6Ytrzxy1ufts3i0MytshV4fQx0ODd
	 iu+DY2942lNE1m7aZB2etsX3PlcgcCQe3S+k4Zpo=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 51AMwuJ6008459
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 10 Feb 2025 16:58:56 -0600
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 10
 Feb 2025 16:58:55 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 10 Feb 2025 16:58:55 -0600
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51AMwtCc052847;
	Mon, 10 Feb 2025 16:58:55 -0600
Message-ID: <fa37b036-7ff0-46d4-b276-f97a7eab7dfb@ti.com>
Date: Mon, 10 Feb 2025 16:58:55 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 04/10] arm64: dts: ti: k3-am62a-main: Add C7xv device
 node
To: Judith Mendez <jm@ti.com>, Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra
	<vigneshr@ti.com>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Hari Nagalla
	<hnagalla@ti.com>
References: <20250210221530.1234009-1-jm@ti.com>
 <20250210221530.1234009-5-jm@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20250210221530.1234009-5-jm@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 2/10/25 4:15 PM, Judith Mendez wrote:
> From: Jai Luthra <j-luthra@ti.com>
> 
> AM62A SoCs have a C7xv DSP subsystem with Analytics engine capability.
> This subsystem is intended for deep learning purposes. Define the
> device node for C7xv DSP.
> 
> Signed-off-by: Jai Luthra <j-luthra@ti.com>
> Signed-off-by: Hari Nagalla <hnagalla@ti.com>
> Signed-off-by: Judith Mendez <jm@ti.com>
> ---

Acked-by: Andrew Davis <afd@ti.com>

> Changes since v4:
> - No change
> ---
>   arch/arm64/boot/dts/ti/k3-am62a-main.dtsi | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am62a-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62a-main.dtsi
> index a1daba7b1fad5..f6ebc4eabaf14 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62a-main.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62a-main.dtsi
> @@ -1123,6 +1123,18 @@ vpu: video-codec@30210000 {
>   		power-domains = <&k3_pds 204 TI_SCI_PD_EXCLUSIVE>;
>   	};
>   
> +	c7x_0: dsp@7e000000 {
> +		compatible = "ti,am62a-c7xv-dsp";
> +		reg = <0x00 0x7e000000 0x00 0x00100000>;
> +		reg-names = "l2sram";
> +		ti,sci = <&dmsc>;
> +		ti,sci-dev-id = <208>;
> +		ti,sci-proc-ids = <0x04 0xff>;
> +		resets = <&k3_reset 208 1>;
> +		firmware-name = "am62a-c71_0-fw";
> +		status = "disabled";
> +	};
> +
>   	e5010: jpeg-encoder@fd20000 {
>   		compatible = "ti,am62a-jpeg-enc", "img,e5010-jpeg-enc";
>   		reg = <0x00 0xfd20000 0x00 0x100>,
