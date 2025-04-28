Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4999710785;
	Mon, 28 Apr 2025 16:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745857771; cv=none; b=MnYycGJAlAyEGOZII6kNKjQ2E7uJIncMXL3Ord5HO6byB00Gzn/VonVRDdMir5GnAp4FK5hgBf+ztgqLp/8v3jS84d8GFc6ryQqwgXDGn7pzOTlKAI0zrngVwl6L0ud/ABZIeN9aa7Hbdpc94i2MAsJnutbXSIJJ7+WbwYE8JqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745857771; c=relaxed/simple;
	bh=m1KW2SFSkgFKhXNf4Eel1GF9v1x3akKZrVsdSjAMAWE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=NVUxIYzf3Yg26oGZaLDjNfCkTLeGFfwS+XmECTqCZ4g7dLbPRsy7t1MI/IpTCSUVsbDgWvtabWgNPxpsAj9Q2ThrodriYi1q3kl/CaJjZuE9nY+nja9nnI5/l9NeAqRZf2z7FfwLQ11CmxjeS2aF9moFfbD6X6urqCltfrRxyII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=YkUKNpGu; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="YkUKNpGu"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53SGTOo53610771
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 28 Apr 2025 11:29:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745857764;
	bh=6ktsSLpDHL/YXYlSRA4w0F/KyZ2Iy1Ve2h1qSr/sg/w=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=YkUKNpGuYviCbnm2NmUujjNnyx/hsW+3bCF6vezGm8SuvlAaH0MlZsc0p93R/UtbV
	 mzaWHWPV73W7SGNfjSrGF+PRLwhukngK60e4PECqq4pJQpDsUIULLPhtZ1x1pOBsjE
	 Xa/94eYWpJcYTAf0QFodPVPn9JsJAhqSqCcjMzqo=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53SGTOp0031572
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 28 Apr 2025 11:29:24 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 28
 Apr 2025 11:29:23 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 28 Apr 2025 11:29:23 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53SGTMkS115141;
	Mon, 28 Apr 2025 11:29:22 -0500
Message-ID: <72e88ddd-dcf6-42ad-92c7-15869f83dd8c@ti.com>
Date: Mon, 28 Apr 2025 11:29:22 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 10/11] arm64: dts: ti: k3-am62a7-sk: Reserve main_rti4
 for C7x DSP
To: Judith Mendez <jm@ti.com>, Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra
	<vigneshr@ti.com>
CC: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Hari Nagalla <hnagalla@ti.com>,
        Beleswar
 Prasad <b-padhi@ti.com>,
        Markus Schneider-Pargmann <msp@baylibre.com>,
        Devarsh Thakkar <devarsht@ti.com>
References: <20250415153147.1844076-1-jm@ti.com>
 <20250415153147.1844076-11-jm@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20250415153147.1844076-11-jm@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 4/15/25 10:31 AM, Judith Mendez wrote:
> From: Hari Nagalla <hnagalla@ti.com>
> 
> The main rti4 watchdog timer is used by the C7x DSP, so reserve the
> timer in the linux device tree.
> 
> Signed-off-by: Hari Nagalla <hnagalla@ti.com>
> Signed-off-by: Judith Mendez <jm@ti.com>
> ---

Reviewed-by: Andrew Davis <afd@ti.com>

>   arch/arm64/boot/dts/ti/k3-am62a7-sk.dts | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
> index 8d7645bb90337..032f1f18d184e 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
> +++ b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
> @@ -830,3 +830,8 @@ &c7x_0 {
>   			<&c7x_0_memory_region>;
>   	status = "okay";
>   };
> +
> +/* main_rti4 is used by C7x DSP */
> +&main_rti4 {
> +	status = "reserved";
> +};
