Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CFEC2882AB;
	Fri,  4 Jul 2025 09:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751620937; cv=none; b=rBPz70HMYscaYiEYge/TwXymCZ6EFTXudv8y0DYnl+jdGeWPApHR/IrCw5Q8zQCXdFPsWYL2qOETbWRrvi5CwGCdOn6jasvTDe0KwJtsP+OFgXcu89ftJs9YTtLASExvnV7cqK4Wpsze+5Or7sMAl9Tv79PVdLBrXsDCqFn3FiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751620937; c=relaxed/simple;
	bh=8FO5F5EjVx57TSKaa67OcTlNYBBnxgV5KHWrj4CW2js=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=K99F5WUqBsePrQU2uSIzbdQta3WwCLNTKB5k9APFplgLgNJNtLEtL38FQwzoD2vv0v1kVI1tp56eshPec6jLPtP5j757behSwpngulKtoctoV2SmzYOMWB47q2EaOd/fJ3cpwy7XUP2HmHx++7cAThjYx7RNRuhBNXB+LWBRAhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=sNef83OI; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="sNef83OI"
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5647ZvmT028297;
	Fri, 4 Jul 2025 11:22:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	xsJ35DXIFyb8IUUDkRLbnd+X8cIaumQnRj2kaGGtJi8=; b=sNef83OIHgj3F115
	o4AALg+zZxQDdJCTO6KCuqgN/pa5mBGofZMlMVo+nveSjlE5cIFp4k8voMjRgUd9
	nFbIfhETkVp2+ZH3XAYApA6FgTFwhVfzudS0Ai1+wz373rWqbrUws4vo4K6MPyuT
	5jotQEMIhZG/ggNhBMCXEh3hiurcV8nK8Amcjy96DMGzMQXjj8Cnb0OGW5EncJAT
	hKb7F7T6VtpEmcu7Mx2k9o6NqSGRm4ue7qI7TYkcwTDszxDDfGekhrj/cSZFZwgO
	PIlXznP+370DUfnC5BpQ2oeuVy2jNhWPMk0FahSGvblDDyolZ8dU2dCHFOpSXfN4
	AwvQ2w==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47j5tmmj89-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Jul 2025 11:22:02 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 53E7D4004F;
	Fri,  4 Jul 2025 11:21:10 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 60B8BA5594F;
	Fri,  4 Jul 2025 11:20:37 +0200 (CEST)
Received: from [10.48.86.79] (10.48.86.79) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 4 Jul
 2025 11:20:36 +0200
Message-ID: <ec89779f-2193-42a1-b980-de904be9d388@foss.st.com>
Date: Fri, 4 Jul 2025 11:20:37 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: stm32: add system-clock-direction-out on
 stm32mp15xx-dkx
To: Olivier Moysan <olivier.moysan@foss.st.com>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20250521150418.488152-1-olivier.moysan@foss.st.com>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20250521150418.488152-1-olivier.moysan@foss.st.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_03,2025-07-02_04,2025-03-28_01

Hi Olivier

On 5/21/25 17:04, Olivier Moysan wrote:
> The commit 5725bce709db
> ("ASoC: simple-card-utils: Unify clock direction by clk_direction")
> corrupts the audio on STM32MP15 DK sound cards.
> The parent clock is not correctly set, because set_sai_ck_rate() is not
> executed in stm32_sai_set_sysclk() callback.
> This occurs because set_sysclk() is called with the wrong direction,
> SND_SOC_CLOCK_IN instead of SND_SOC_CLOCK_OUT.
> 
> Add system-clock-direction-out property in SAI2A endpoint node of
> STM32MP15XX-DKX device tree, to specify the MCLK clock direction.
> 
> Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
> ---
>   arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi b/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi
> index a5511b1f0ce3..c74e36676d1b 100644
> --- a/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi
> +++ b/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi
> @@ -515,6 +515,7 @@ sai2a_endpoint: endpoint {
>   				remote-endpoint = <&cs42l51_tx_endpoint>;
>   				dai-format = "i2s";
>   				mclk-fs = <256>;
> +				system-clock-direction-out;
>   				dai-tdm-slot-num = <2>;
>   				dai-tdm-slot-width = <32>;
>   			};

Applied on stm32-next.

Thanks !!
Alex
