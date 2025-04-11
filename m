Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BFFD238C28
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 11:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744370908; cv=none; b=YHY0yEJTqdp59YAE+0QI2CKYNFt6Hr5V7kjz9h/KOfu/wIaqsF/QtNrovJ+4DDtYz6VOK0WGLG21HOF7yGfAPmqKslwfCd+ijkrV/f8KDWLYxFFoJINRKnjGTpc6TXnyVvDbzqP5lhJ3agCSQKJOENm6L7vI9pK2KETc8t51CYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744370908; c=relaxed/simple;
	bh=GmfhrdoIXCOx8+2ML/taaCPJtZgsvBlBclO6NoVKzt0=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tDs2F7MGX6y7SGa6bgiqtnfpo3ZKNUo8b9AGNB8lWyzh2p9Tutarae4qWTCcb96Yz3N4HM8NpL3QlODRoJYzSPknm6Knuwd6Ar13Z8Famupwnbyr6u0Y8OnDBrjyDrfwTvdrEQxOiOYrlhLQYtpkkBUGKULpv9+pkVih/nrlCwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Dwh7szJS; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Dwh7szJS"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53BBS3hL1427549
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 11 Apr 2025 06:28:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744370883;
	bh=oIJGwsqQ7lKoOCx6Fi+tAv4SNYqzbkt+9cXJq4ouMUA=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=Dwh7szJSiDDq6DuiAu2Mx43easmoFoh34tGCPC+kUYCpRe9kZsX1yqKKCrjnksGFa
	 CN8Qu5rMCGbsp3fT7Pwhwn3v5013UYn5Wvk6w+CgmtwwYnNM9s6+2vnEPnNXjGKXGt
	 Xccb9err9Cgvag2AAzxg2tffaj0jHWlCthWVagBk=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53BBS3Pw096576
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 11 Apr 2025 06:28:03 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 11
 Apr 2025 06:28:02 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 11 Apr 2025 06:28:02 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53BBS28a073227;
	Fri, 11 Apr 2025 06:28:02 -0500
Date: Fri, 11 Apr 2025 06:28:02 -0500
From: Nishanth Menon <nm@ti.com>
To: Jayesh Choudhary <j-choudhary@ti.com>
CC: <catalin.marinas@arm.com>, <will@kernel.org>,
        <linux-kernel@vger.kernel.org>, <bjorn.andersson@oss.qualcomm.com>,
        <krzysztof.kozlowski@linaro.org>, <geert+renesas@glider.be>,
        <lumag@kernel.org>, <nfraprado@collabora.com>, <quic_tdas@quicinc.com>,
        <elinor.montmasson@savoirfairelinux.com>, <ebiggers@google.com>,
        <ross.burton@arm.com>, <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] arm64: defconfig: Add CDNS_DSI and CDNS_PHY config
Message-ID: <20250411112802.x2q4f7cq4hwilxoe@blasphemy>
References: <20250411095043.272488-1-j-choudhary@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250411095043.272488-1-j-choudhary@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 15:20-20250411, Jayesh Choudhary wrote:
> Enable configs for cdns-dsi and cdns-dphy. (dsi wrapper for
> j721e is enabled by default if cdns-dsi config is enabled)

What upstream supported boards need this change? Add that to the commit
message. Beagley-AI64? or others - please enumerate.

> 
> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
> ---
>  arch/arm64/configs/defconfig | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 5c85e5da152f..4c0eb2711bbe 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -938,6 +938,7 @@ CONFIG_DRM_TI_SN65DSI86=m
>  CONFIG_DRM_ANALOGIX_ANX7625=m
>  CONFIG_DRM_I2C_ADV7511=m
>  CONFIG_DRM_I2C_ADV7511_AUDIO=y
> +CONFIG_DRM_CDNS_DSI=m
>  CONFIG_DRM_CDNS_MHDP8546=m
>  CONFIG_DRM_IMX8MP_DW_HDMI_BRIDGE=m
>  CONFIG_DRM_DW_HDMI_AHB_AUDIO=m
> @@ -1579,6 +1580,7 @@ CONFIG_PHY_CAN_TRANSCEIVER=m
>  CONFIG_PHY_NXP_PTN3222=m
>  CONFIG_PHY_SUN4I_USB=y
>  CONFIG_PHY_CADENCE_TORRENT=m
> +CONFIG_PHY_CADENCE_DPHY=m
>  CONFIG_PHY_CADENCE_DPHY_RX=m
>  CONFIG_PHY_CADENCE_SIERRA=m
>  CONFIG_PHY_CADENCE_SALVO=m
> -- 
> 2.34.1
> 

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
