Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5114013C3F2;
	Sat, 19 Apr 2025 18:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745086209; cv=none; b=BMpDiyh2prxOVzMWuU0ZgC+psYNM/1cjm1LH3xJf3m9hjTk8NRMCZtf4oH1gFyisDUCRIwUr1ew5eUYybJNe19vKgOim7bQ/lIoAZ8nMuyx6gyRugchYhYVWYxAtmzsmo03aOQoINWxGmeJHxo+sCuE2IcrTKicvvnW9iWOKfDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745086209; c=relaxed/simple;
	bh=/IuFW5aK4FfMSf52f3qJzkXebXja+M+kxr/aRzHxdQ0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=mclO6I6geNhwoDaiDfehVLces4yi30yqkhroq18Ng304itOo47iOBMr8uZR2XxQjueRAS0WbiqBIB5vYX8lwuYvHH0LrxncGji3PUFT0VgrUpdK11ywd6NxXF+VDeiPzoI1s/9LgQopmwOsOCEzkx+AUhdZN3Q/XM7RAmGpRM5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=YhqxFwNb; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="YhqxFwNb"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53JIA2NU1243663
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 19 Apr 2025 13:10:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745086202;
	bh=VY17ZoztUK1pT2AXyZLmBdvwKx3peOWAZrkwlCco0uU=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=YhqxFwNbNXQkPfqJXbR4q6CJmrabNNr657kRZobA205KRF53mUgOHFlecDuzOO44+
	 Cq3wEZ6d9yxKeHo2ndqHRdrTTzNd8uQk6hsuW0IObJQLwJGsscghRLJnFEh/4BngRM
	 E6hL/ifdchctkF92VCqwzxSKTJ4OyiwpE3r+pIGw=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53JIA2Ac003447
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sat, 19 Apr 2025 13:10:02 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sat, 19
 Apr 2025 13:10:01 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sat, 19 Apr 2025 13:10:01 -0500
Received: from [10.249.141.75] ([10.249.141.75])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53JI9uIZ071610;
	Sat, 19 Apr 2025 13:09:57 -0500
Message-ID: <f9cb52e2-d211-47b1-9536-3aa81db916c7@ti.com>
Date: Sat, 19 Apr 2025 23:39:55 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] arm64: dts: ti: k3-j721e: add ranges for PCIe0 DAT1
 and PCIe1 DAT1
To: Siddharth Vadapalli <s-vadapalli@ti.com>, <nm@ti.com>, <vigneshr@ti.com>,
        <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        <u-kumar1@ti.com>
References: <20250417120407.2646929-1-s-vadapalli@ti.com>
 <20250417120407.2646929-4-s-vadapalli@ti.com>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <20250417120407.2646929-4-s-vadapalli@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea


On 4/17/2025 5:34 PM, Siddharth Vadapalli wrote:
> The PCIe0 DAT1 and PCIe1 DAT1 are 4 GB address regions in the 64-bit
> address space of the respective PCIe Controllers. Hence, update the
> ranges to include them.
>
> Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
> ---
>   arch/arm64/boot/dts/ti/k3-j721e.dtsi | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/ti/k3-j721e.dtsi b/arch/arm64/boot/dts/ti/k3-j721e.dtsi
> index a7f2f52f42f7..4f5d277c97a4 100644
> --- a/arch/arm64/boot/dts/ti/k3-j721e.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-j721e.dtsi
> @@ -126,6 +126,8 @@ cbass_main: bus@100000 {
>   			 <0x00 0x10000000 0x00 0x10000000 0x00 0x10000000>, /* PCIe DAT */
>   			 <0x00 0x64800000 0x00 0x64800000 0x00 0x00800000>, /* C71 */
>   			 <0x00 0x6f000000 0x00 0x6f000000 0x00 0x00310000>, /* A72 PERIPHBASE */
> +			 <0x40 0x00000000 0x40 0x00000000 0x00 0x08000000>, /* PCIe0 DAT1 */
> +			 <0x41 0x00000000 0x41 0x00000000 0x00 0x08000000>, /* PCIe1 DAT1 */

Do you want to map whole 4GB or just 128M ?


>   			 <0x44 0x00000000 0x44 0x00000000 0x00 0x08000000>, /* PCIe2 DAT */
>   			 <0x44 0x10000000 0x44 0x10000000 0x00 0x08000000>, /* PCIe3 DAT */
>   			 <0x4d 0x80800000 0x4d 0x80800000 0x00 0x00800000>, /* C66_0 */
