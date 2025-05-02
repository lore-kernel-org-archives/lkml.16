Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F20A156C63;
	Fri,  2 May 2025 14:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746197390; cv=none; b=DJvEpaFqAI6VOyJf9hUNr4fA0DHzqFR9heFWlr1Hox89O4k1b/R0bOA7Yp8DK+sOcW8zptUV55Kb9dFpoWqftF5YYMR13ERbMdAg2PRvaGHhG5X52DiuzWP9O8Nn0p3lEpqxq9tDj9DImcCmQLEgMGYnbvgWWxTuB1/F2zM146Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746197390; c=relaxed/simple;
	bh=WdSkY0SFbzKaDrAB0hKsDpkwOWOA9GGQwzYI390I1AI=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O6sShvNBnFTvXvzzhKl45u3q5EpLldejTAHCo+hz/xxZmKLPDkvlyywDJkz+aLVw8nxBhi3FEA7v0vgEQmSc+nTf4nLRiBA1y8bGOjPD/TMzhgy9iEX5mCTbneBXlkofigxEAOAYj3TZv3CtlZqhraY34klS/ZVxp59j0nKK6Z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=YINDoVXX; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="YINDoVXX"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 542EnZlG253461
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 2 May 2025 09:49:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746197375;
	bh=i4/jusf2Aa0zeSOt4O3iLnwmJBt0CRJJuL2eBj1uMhU=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=YINDoVXXjJDbV7erQnWP0Gty7XaKwMtMNJ94QIn2McScwhf7BP2GRa57kfacI13DO
	 eBYLoRDgRqzEigr7YH4WULQroKOHjtNR0LQscKx4Bqa3u1L3jkOX1KlCVRGJUgK8H3
	 b038iefF/rnE2UtIwTagAUce/CG3rNoEMcq1ZWTk=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 542EnZ3a064657
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 2 May 2025 09:49:35 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 2
 May 2025 09:49:34 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 2 May 2025 09:49:34 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 542EnYM0003137;
	Fri, 2 May 2025 09:49:34 -0500
Date: Fri, 2 May 2025 09:49:34 -0500
From: Nishanth Menon <nm@ti.com>
To: Daniel Schultz <d.schultz@phytec.de>
CC: <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <upstream@lists.phytec.de>
Subject: Re: [PATCH 2/3] arm64: dts: ti: k3-am62a: Set Critical Temp. to 105C
Message-ID: <20250502144934.t6hjiwp2f64ovb34@deeply>
References: <20250502142606.2840508-1-d.schultz@phytec.de>
 <20250502142606.2840508-2-d.schultz@phytec.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250502142606.2840508-2-d.schultz@phytec.de>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 07:26-20250502, Daniel Schultz wrote:
> The AM62Ax SoC supports two temperature ranges:
> * A: -40 to 105C - Extended Industrial
> * I: -40 to 125C - Automotive
> 
> By default, use the lower limit (105 °C) so that any AM62A running
> in Extended Industrial mode will shut down safely before overheating.
> 
> If the bootloader detects an Automotive-grade device, it should
> override this and raise the critical trip point to 125 °C.
> 
> Signed-off-by: Daniel Schultz <d.schultz@phytec.de>
> ---
>  arch/arm64/boot/dts/ti/k3-am62a-thermal.dtsi | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am62a-thermal.dtsi b/arch/arm64/boot/dts/ti/k3-am62a-thermal.dtsi
> index 39ff9118b6c4..40dcb9bab965 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62a-thermal.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62a-thermal.dtsi

Why not create a separate header for industrial grade and rename this as
automotive grade and let the board file pick the right grade used on the
board?

> @@ -19,7 +19,7 @@ main0_alert: main0-alert {
>  			};
>  
>  			main0_crit: main0-crit {
> -				temperature = <125000>;	/* milliCelsius */
> +				temperature = <105000>;	/* milliCelsius */
>  				hysteresis = <2000>;	/* milliCelsius */
>  				type = "critical";
>  			};
> @@ -50,7 +50,7 @@ main1_alert: main1-alert {
>  			};
>  
>  			main1_crit: main1-crit {
> -				temperature = <125000>;	/* milliCelsius */
> +				temperature = <105000>;	/* milliCelsius */
>  				hysteresis = <2000>;	/* milliCelsius */
>  				type = "critical";
>  			};
> @@ -81,7 +81,7 @@ main2_alert: main2-alert {
>  			};
>  
>  			main2_crit: main2-crit {
> -				temperature = <125000>;	/* milliCelsius */
> +				temperature = <105000>;	/* milliCelsius */
>  				hysteresis = <2000>;	/* milliCelsius */
>  				type = "critical";
>  			};
> -- 
> 2.25.1
> 

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
