Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF306133987;
	Fri,  7 Feb 2025 01:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738892579; cv=none; b=BH4u1psOaB6+PssYcY3tqevu2UCCr+mFi9hvB4TEtejRyE2UaM8CxjtnMXzdzt6LEq+2y5pJhYHXVjH1P2QSoQ3c8P4miDw7eju10gtQRqiukhLn8wIsPjUkGMlpOg7RMnDOgjH0qT/PEUGxzsLJ6VFMT1dtK9PfII7E1Zgnp5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738892579; c=relaxed/simple;
	bh=bV+VETLIvHm0HeOjf+9+/XgiUHfPISVbDALV+wvdT7A=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P63ghVk5Y1ok45OU6cX2GPLfs20yvKcpsSA2PaRjxTL0ejj13+UowO1VQ+ebDl1p9+dcq5r+VCz3ES1OXwZ0t4IgSOfrNSifmaIORmdERDVz6hTGk/pzMq1XhHm9Hoj6ZyJqgF7wHaehIXEzgjJ6JEW7onMKuJ7RIk62PEgMmZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=yGkUlGwi; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="yGkUlGwi"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 5171geKL3735092
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 6 Feb 2025 19:42:40 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738892560;
	bh=2qbcY8LfMeC70utkdYzDbp4vKmOxEokKzG/s6jdwbe0=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=yGkUlGwiltG3sTc6kk+urLbxITx9zlEzty9BG3fnNt4HQn5xEnsVxQfhouh82mehx
	 nrQF80lsPHGLKCGeoh+N5gGY5p47ISkZXYfCuoaFeV3l3i+wanYmlgDjmD9DOvRRuM
	 ena8MsMlB3wsVjiCyqyvpLkWcG1aQR5ADiQvSLK0=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 5171geCa006289
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 6 Feb 2025 19:42:40 -0600
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 6
 Feb 2025 19:42:39 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 6 Feb 2025 19:42:39 -0600
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5171gdQR001088;
	Thu, 6 Feb 2025 19:42:39 -0600
Date: Thu, 6 Feb 2025 19:42:39 -0600
From: Nishanth Menon <nm@ti.com>
To: Francesco Dolcini <francesco@dolcini.it>
CC: Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Francesco Dolcini
	<francesco.dolcini@toradex.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1] arm64: dts: ti: k3-am62p: Enable AUDIO_REFCLKx
Message-ID: <20250207014239.xzm6rfnusckql2uo@litigator>
References: <20250206153911.414702-1-francesco@dolcini.it>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250206153911.414702-1-francesco@dolcini.it>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 16:39-20250206, Francesco Dolcini wrote:
> From: Francesco Dolcini <francesco.dolcini@toradex.com>
> 
> On AM62P-based SoCs the AUDIO_REFCLKx clocks can be used as an input to
> external peripherals when configured through CTRL_MMR, so add the
> clock nodes.
> 
> Link: http://downloads.ti.com/tisci/esd/latest/5_soc_doc/am62px/clocks.html
> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> ---
>  arch/arm64/boot/dts/ti/k3-am62p-main.dtsi | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am62p-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-main.dtsi
> index 420c77c8e9e5..4b47b0774330 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62p-main.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62p-main.dtsi
> @@ -42,6 +42,26 @@ &inta_main_dmss {
>  	ti,interrupt-ranges = <5 69 35>;
>  };
>  
> +&main_conf {

	Why not add it to main_conf section it self in the file?

> +	audio_refclk0: clock-controller@82e0 {
> +		compatible = "ti,am62-audio-refclk";
> +		reg = <0x82e0 0x4>;
> +		clocks = <&k3_clks 157 0>;
> +		assigned-clocks = <&k3_clks 157 0>;
> +		assigned-clock-parents = <&k3_clks 157 16>;
> +		#clock-cells = <0>;
> +	};
> +
> +	audio_refclk1: clock-controller@82e4 {
> +		compatible = "ti,am62-audio-refclk";
> +		reg = <0x82e4 0x4>;
> +		clocks = <&k3_clks 157 18>;
> +		assigned-clocks = <&k3_clks 157 18>;
> +		assigned-clock-parents = <&k3_clks 157 34>;
> +		#clock-cells = <0>;
> +	};
> +};
> +
>  &main_pmx0 {
>  	pinctrl-single,gpio-range =
>  		<&main_pmx0_range 0 32 PIN_GPIO_RANGE_IOPAD>,
> -- 
> 2.39.5
> 

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
