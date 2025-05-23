Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D101E1F09B4;
	Fri, 23 May 2025 09:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747992765; cv=none; b=fh9UdhajfkK+KuZ4+ompfoZbtuJPtzYGxVBEIOn7JsopmQ6bjWE+wSEfCYIH9zIPVUxsUksTiUTM6kSSE66kCAau5sQQcxKl7vHRNaagXzjsQyEtNxITjtbIf8fXB4RhucaIIHLgC76TZTEk1ZiRPd5gu1MuOYwlIwp7HG+1iBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747992765; c=relaxed/simple;
	bh=iU/xJjq4FaJfWHD8Blp4CTuwvFTl784xpt03cEdDEDc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=qOcIMsFn8z+ggUS6+DUDo8kJhcfaU4adRq7x/TJn+WAX+mkA79TiRpRdJgWmn1RjwofhFcdNOnKdjeX69lLDl2uzWmlEJ23M3pQ9nkp5CFKsl3a2w13YE5g+Vmh9Ck5meFiFDoNsISOWv4kTUSOJd84eVBpn2SmL2Vee4KwvUhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=E42gUiMU; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="E42gUiMU"
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 54N9WQCg880752;
	Fri, 23 May 2025 04:32:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1747992746;
	bh=IwXNYwMt/ZQYpLBw6rioL9Zt/gPDdC2LapQUC2nE+SE=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=E42gUiMU8z0rYBiIsNPYL56L35AsFCVw5FOjnOkT8UglQTpsEXPCFMHzz81p5Jogi
	 B5jjAyuW6aHh87C5VTWh3mcFzR/IMbawSSYp0uKdkmBpF/8ck3y5gnlTWUI6uyzphz
	 ZEmlNgVvir0rIMDMB1q6CvTz3ng0f4Dm3ZT+t3Q0=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 54N9WPUs4178683
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 23 May 2025 04:32:25 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 23
 May 2025 04:32:25 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 23 May 2025 04:32:25 -0500
Received: from [172.24.18.216] (lt5cd2489kgj.dhcp.ti.com [172.24.18.216])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 54N9WK4s105573;
	Fri, 23 May 2025 04:32:21 -0500
Message-ID: <479609b2-1953-4e8a-a7c8-87dcd2eff3d9@ti.com>
Date: Fri, 23 May 2025 15:02:20 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] arm64: dts: ti: k3-j784s4-main: Add PBIST_14 node
To: Neha Malcom Francis <n-francis@ti.com>, <nm@ti.com>, <vigneshr@ti.com>,
        <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <u-kumar1@ti.com>
References: <20250514072056.639346-1-n-francis@ti.com>
 <20250514072056.639346-3-n-francis@ti.com>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <20250514072056.639346-3-n-francis@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hello Neha

On 5/14/2025 12:50 PM, Neha Malcom Francis wrote:
> Add DT node for PBIST_14 that is responsible for triggering the PBIST
> self-tests for the MAIN_R5_2_x cores.
>
> Signed-off-by: Neha Malcom Francis <n-francis@ti.com>
> ---
> Changes since v2:
> - remove ti,bist-under-test property and use ti,sci-dev-id
>
>   arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi | 11 +++++++++++
>   1 file changed, 11 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi b/arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi
> index 0160fe0da983..fd098aac3989 100644
> --- a/arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi
> @@ -113,6 +113,17 @@ serdes2: serdes@5020000 {
>   			status = "disabled";
>   		};
>   	};
> +
> +	bist_main14: bist@33c0000 {
> +		compatible = "ti,j784s4-bist";
> +		reg = <0x00 0x033c0000 0x00 0x400>,
> +		      <0x00 0x0010c1a0 0x00 0x01c>;
> +		reg-names = "cfg", "ctrl_mmr";
> +		clocks = <&k3_clks 237 7>;
> +		power-domains = <&k3_pds 237 TI_SCI_PD_EXCLUSIVE>;
> +		bootph-pre-ram;
> +		ti,sci-dev-id = <234>;
> +	};

Please extend this support to j742s2 SOC as well.

With above change

Reviewed-by: Udit Kumar <u-kumar1@ti.com>


>   };
>   
>   &scm_conf {
