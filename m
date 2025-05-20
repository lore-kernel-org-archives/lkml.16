Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFF991BD01D
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 08:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747729667; cv=none; b=Q19EtGmO/BKfTTCzqCBMFX8vdAdo5iEP+UFbHHcwuUcIRDVXhzU53uUMFZFOZNBtvBlaZF7dUTIY/2WO7eSx3IkpapwjopjheDOosMS1Z5TzULo+Sgn8UqgUkNlAtA9FgslFApinDBHQw4cfRFb0PsWm/pdz1AlKFZa2HgZ6l6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747729667; c=relaxed/simple;
	bh=xDriFHHEzUbZyotSRsYYBdZzAU2QomAsXKO+q4kWyxY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=n2UceA3jhYYRA3diqCJDEpFr3imKoc/PBokz9am4zLoo8JI8HBkyY2mNlzOcKBtMaaCGWSJ2tjkoLLjTx+cSFhIqd5+5u4PP0EL0vz0O35roD50azerhKnW+BLCF+WA6+oLYTDF/uuY+MI7f9kmequlLCBJ727zgQVjPa2o6YAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=0L5WNatZ; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="0L5WNatZ"
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54K8R6Mx032271;
	Tue, 20 May 2025 10:27:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	bGpQ2EmPbJzylBZdpgSXUtnBLBsdGU1pVS2JhOoqres=; b=0L5WNatZulsDRa/O
	Wh0CQhOYcR4shNjqXYSvw56GiTk4AzionMz3pDYHp3obZeYv/n9w/SYr3Wh5g6aA
	nnbR0InGpYcsTHS3Nby1NwPJ2vNkx6RmMVRwGafmo7DczDPNdCtrbbu/ZYsJqqE8
	RMMT88XEWzASUnjADQYebEhcZquab9xqkrh6HQFpQ7m/OwziV/VNPs1rwaB5T7b0
	9aOwcd5pPxYE1hIM2rXkQ6QAfyGQxRWCadhLtDCNyA6sFegFhL2+DhjoF8HoWJVl
	e5DXzP2DfwOq/1RuIe7WWknpvbUoLn4WAjd23GxY6aTVtvxDVPqUkfc8TtQFtZVg
	iHaRfA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46phbgkp40-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 May 2025 10:27:40 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 1CE5740098;
	Tue, 20 May 2025 10:27:01 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2FE2CB2DB2C;
	Tue, 20 May 2025 10:26:48 +0200 (CEST)
Received: from [10.252.30.65] (10.252.30.65) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 20 May
 2025 10:26:47 +0200
Message-ID: <f1ffb147-459a-4b3b-b109-9b07b25c99ac@foss.st.com>
Date: Tue, 20 May 2025 10:26:46 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [V1 1/2] arm stm32mp131.dtsi: add "encoding_mode" nvmem
 definition
To: Rodolfo Giometti <giometti@enneenne.com>, <linux-kernel@vger.kernel.org>
CC: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        Eric Fourmont <eric.fourmont-ext@st.com>
References: <20250519130859.3389704-1-giometti@enneenne.com>
 <20250519130859.3389704-2-giometti@enneenne.com>
Content-Language: en-US
From: Yann Gautier <yann.gautier@foss.st.com>
In-Reply-To: <20250519130859.3389704-2-giometti@enneenne.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_03,2025-05-16_03,2025-03-28_01

On 5/19/25 15:08, Rodolfo Giometti wrote:
> This patch adds the definition for the nvmem location "encoding_mode"
> related to the "cpu0" node.
> 
> Signed-off-by: Rodolfo Giometti <giometti@enneenne.com>
> ---
>   arch/arm/boot/dts/st/stm32mp131.dtsi | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/st/stm32mp131.dtsi b/arch/arm/boot/dts/st/stm32mp131.dtsi
> index e555717c0048..52bf497e26bb 100644
> --- a/arch/arm/boot/dts/st/stm32mp131.dtsi
> +++ b/arch/arm/boot/dts/st/stm32mp131.dtsi
> @@ -24,6 +24,9 @@ cpu0: cpu@0 {
>   			clocks = <&scmi_perf 0>;
>   			clock-names = "cpu";
>   			#cooling-cells = <2>;
> +
> +			nvmem-cells = <&encoding_mode_otp>;
> +			nvmem-cell-names = "encoding_mode";
>   		};
>   	};
>   
> @@ -1167,6 +1170,10 @@ part_number_otp: part-number-otp@4 {
>   				reg = <0x4 0x2>;
>   				bits = <0 12>;
>   			};
> +			encoding_mode_otp: encoding-mode-otp@4 {

This node should end with @0 instead of 4.
It should also be placed before part-number-otp node.

> +				reg = <0x0 0x1>;

If I'm not mistaken, this should be:
	reg = <0x0 0x2>;


Best regards,
Yann

> +				bits = <0 9>;
> +			};
>   			vrefint: vrefin-cal@52 {
>   				reg = <0x52 0x2>;
>   			};

