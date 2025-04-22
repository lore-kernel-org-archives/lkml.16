Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EFEBEAFA;
	Tue, 22 Apr 2025 05:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745298069; cv=none; b=TEuXJOJHMUxPhPrr9TOgujnBUYuVi9+lXEl4iuPqlbM2lTRmaydZTl3sgqdmaAvPHR5t2Do7HXUfHZzkdmGOB6dwNEmNCz1PHFJSdrScsc+1lhCJ1j/HoyLtwCpee+ylZKkPolII2c69TnToRvAddSjTfHrKocp7/uUuNrqtXWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745298069; c=relaxed/simple;
	bh=WCouwR7uTqaHThXCXrNZQl8pWxx4Gkb+qwPRJNiDbJA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=XBKx2at9+jffBGF/sKPdjXv5HaHaU6RT/0sm2dxkGbKCezavKVtBTbUdgd4wuGu6Fe7AJksNnbPML1Oin0UYxSbGydyAM1fVmJpe4byxAcyXBfm0a7UMcKbmzmKOjVqpcAd1JTQR/gkpviZKGyxwWMNv56sIUsotrZqAuDkj2qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=MfieWodQ; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="MfieWodQ"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53M50rVn1116663
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 22 Apr 2025 00:00:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745298053;
	bh=S+rfxkhJ2uRVgkvDr5SGLSGdiYjFntxQGRjvdTnKR/M=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=MfieWodQynoJ9H638e1BShbI4G//i+9dDNYJBn1Cm4N5O58nSnlOssnB1QMcyuhcF
	 onJkVD8iIlRJLTjFAEO4Ee+/77iOF4+a0KPKaFIAevAJYZ03TZJl2stT22d0SMkQCs
	 RYysu3xCK7oVREKNQi9A02eZPGCEvr/MUnHTlxD4=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53M50rEG019135
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 22 Apr 2025 00:00:53 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 22
 Apr 2025 00:00:53 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 22 Apr 2025 00:00:52 -0500
Received: from [172.24.227.136] (moteen-ubuntu-desk.dhcp.ti.com [172.24.227.136])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53M50nMg123169;
	Tue, 22 Apr 2025 00:00:50 -0500
Message-ID: <bd73d05a-6859-42aa-b1d9-91d8e122a677@ti.com>
Date: Tue, 22 Apr 2025 10:30:49 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] arm64: dts: ti: k3-am65-main: Add missing taps to
 sdhci0
To: Judith Mendez <jm@ti.com>, Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra
	<vigneshr@ti.com>
CC: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250417233040.3658761-1-jm@ti.com>
 <20250417233040.3658761-4-jm@ti.com>
Content-Language: en-US
From: Moteen Shah <m-shah@ti.com>
In-Reply-To: <20250417233040.3658761-4-jm@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea


On 18/04/25 05:00, Judith Mendez wrote:
> For am65x, add missing ITAPDLYSEL values for Default Speed and High
> Speed SDR modes to sdhci0 node according to the device datasheet [0].
>
> Fixes: eac99d38f861 ("arm64: dts: ti: k3-am654-main: Update otap-del-sel values")
> [0] https://www.ti.com/lit/gpn/am6548
> Signed-off-by: Judith Mendez <jm@ti.com>
> ---
>   arch/arm64/boot/dts/ti/k3-am65-main.dtsi | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/ti/k3-am65-main.dtsi b/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
> index 94a812a1355ba..5ebf7ada6e485 100644
> --- a/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
> @@ -449,6 +449,8 @@ sdhci0: mmc@4f80000 {
>   		ti,otap-del-sel-mmc-hs = <0x0>;
>   		ti,otap-del-sel-ddr52 = <0x5>;
>   		ti,otap-del-sel-hs200 = <0x5>;
> +		ti,itap-del-sel-legacy = <0xa>;
> +		ti,itap-del-sel-mmc-hs = <0x1>;

Reviewed-by: Moteen Shah <m-shah@ti.com>

>   		ti,itap-del-sel-ddr52 = <0x0>;
>   		dma-coherent;
>   		status = "disabled";
