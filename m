Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 015072DC768;
	Wed, 30 Apr 2025 16:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746030778; cv=none; b=qCo7xYOFrradL4SzFqRrocf1CEPa34Akg0MPA1W2Q2IQXA1BZcMTLo9uUtQKaQnK/KQ1iT9BZRP6aCHSUHuSBr4oYM1wjkWr0UO+TrJrFbC5XDBPgzfeB18Z4X924+QaLV7FdSPBKRuIB2dAK5wHfDvGdy6IZOTGqkxbkYMq4yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746030778; c=relaxed/simple;
	bh=6Eg5Y4/rwVqIGf5W318Jzy8DyWKM01YESmSAk1Erv9w=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=QNzTEJGhjgUEgAEMcbxViWqVP4yReEMbx8H5uKxosBwxuwFH/XDO1C3qHJJKm1yk1F6spr9vMbGZlE5FLtbaBh8zW9HILS3ZRaWuBIykx1WPskCYKoxraqqoexOioMjZTU7xS1A66vHcB8HAW6S1ASl95aX03yyejiqWSvV/w/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=rHdQ6S2L; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="rHdQ6S2L"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53UGWab54018227
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 30 Apr 2025 11:32:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746030756;
	bh=2/VRFfnkqVPnUwIAJmS6kQe55c2crnb7DT2VESQPAmo=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=rHdQ6S2L3udZ7GKOjOQW92zdjKcvoewSBCMLj119fxri7UxzF8eXLVUZcT/jz6xE9
	 BoZpHTjdFxex1Yoang9Sb5aLTpGZDaxUV7hSE0rQXJfs9+T196YFVIYhKpGsS7cnHI
	 p8LJ90rPJLolLpyXRHhhrKCiCOKJmDxQWyef3T5M=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53UGWahr088425
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 30 Apr 2025 11:32:36 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 30
 Apr 2025 11:32:36 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 30 Apr 2025 11:32:35 -0500
Received: from [10.249.48.175] ([10.249.48.175])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53UGWZQW064226;
	Wed, 30 Apr 2025 11:32:35 -0500
Message-ID: <413691a4-7c00-f82f-2481-1b7029631c9e@ti.com>
Date: Wed, 30 Apr 2025 11:32:35 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2] arm64: dts: ti: k3-am62-main: Add PRUSS-M node
To: Judith Mendez <jm@ti.com>, Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra
	<vigneshr@ti.com>
CC: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Beleswar Padhi <b-padhi@ti.com>
References: <20250430144343.972234-1-jm@ti.com>
Content-Language: en-US
From: Hari Nagalla <hnagalla@ti.com>
In-Reply-To: <20250430144343.972234-1-jm@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 4/30/25 09:43, Judith Mendez wrote:
> From: Kishon Vijay Abraham I <kishon@ti.com>
> 
> Add the DT node for the PRUSS-M processor subsystem that is present
> on the K3 AM62x SoCs. The K3 AM62x family of SoC has one PRUSS-M
> instance and it has two Programmable Real-Time Units (PRU0 and PRU1).
> 
> Signed-off-by: Kishon Vijay Abraham I <kishon@ti.com>
> [ Judith: Fix pruss_iclk id for pruss_coreclk_mux ]
> Signed-off-by: Judith Mendez <jm@ti.com>
> ---

Acked-by: Hari Nagalla <hnagalla@ti.com>

> Changelog:
> - drop internal tags
> - rebase against ti-k3-dts-next
> - fix header
> 
> Link to v1:
> https://lore.kernel.org/linux-devicetree/20250108222048.818835-1-jm@ti.com/
> ---
>   arch/arm64/boot/dts/ti/k3-am62-main.dtsi | 90 ++++++++++++++++++++++++
>   1 file changed, 90 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am62-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
> index 7d355aa73ea2..ee53e663b5bd 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
> @@ -1079,6 +1079,96 @@ dphy0: phy@30110000 {
>   		status = "disabled";
>   	};
>   

