Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3621327055D;
	Fri,  9 May 2025 07:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746776925; cv=none; b=dkgrSc1xPSc8tnxtnrEs5kzOIIqdOqX+INFSQiNiyXvf6uTZKm0lZmS7hCh4h0Qf3cTlNWYkTBMhK9xQUxmm2bhkZfcB2hH0C63wkdL8t1D4gLtjyKJCGi71GymCFK8iQdA6BpiwJbkaUNoToWKfuEdBQ30otoFAj3XBziXua0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746776925; c=relaxed/simple;
	bh=vWmlIJ/bfhkqfGW/df/LkQdIFbwYFHZ3jlpCzpw/fpo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=L5pFjXiQ1YfvO4QQYxgmTMVf8Ij1d30BPNN1WpiLd+TmeIjhR0wSat2C5KDMN09nMTHLAghdpmoJHrab3dPTdtHJtDKoZhE6rKW5mUJ84sXuj9y5PhASoLNaSWTAy3cylfylRu+tMSWEMc+iFa+nPBE32S1GCF/nlvHiDA7+3EE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=LsNxdgh3; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="LsNxdgh3"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 5497mYic1338029
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 9 May 2025 02:48:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746776914;
	bh=4e3+vQC7jXYNsVDluYv45Cizxg84x2l6/EsV/UN5RrA=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=LsNxdgh3gojJqGeRhZ57VCZixcngOvhwEVRwU4kGNf66o8780ILuReluAeb4hJpvj
	 3So/V3RiXReOHTZbWod4SReP02ZLxnrQQD7FJcD4wHegNapOQwdwgOvNrg2xEAqvR5
	 bNvGyVou+rMVmz+aFXGt0w92DkRrKBGC/jVLwJcE=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 5497mYPV112184
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 9 May 2025 02:48:34 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 9
 May 2025 02:48:33 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 9 May 2025 02:48:33 -0500
Received: from [172.24.19.187] (lt5cd2489kgj.dhcp.ti.com [172.24.19.187])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5497mTof084167;
	Fri, 9 May 2025 02:48:30 -0500
Message-ID: <fed0d761-2793-4204-aff5-f65ba7dbc4bd@ti.com>
Date: Fri, 9 May 2025 13:18:29 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] arm64: dts: ti: j722s-evm: Add MUX to control
 CSI2RX
To: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>, <nm@ti.com>,
        <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <vaishnav.a@ti.com>, <r-donadkar@ti.com>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <jai.luthra@linux.dev>,
        <linux-kernel@vger.kernel.org>, <u-kumar1@ti.com>
References: <20250508155134.2026300-1-y-abhilashchandra@ti.com>
 <20250508155134.2026300-3-y-abhilashchandra@ti.com>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <20250508155134.2026300-3-y-abhilashchandra@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea


On 5/8/2025 9:21 PM, Yemike Abhilash Chandra wrote:
> J722S EVM has the CSI2RX routed to a MIPI CSI connector and to 22-pin RPi
> camera connector through an analog mux with GPIO control, model that so
> that an overlay can control the mux state according to connected cameras.

In case you are another version,

consider to change in commit message "model that so that" to "model mux 
so that".

Reviewed-by: Udit Kumar <u-kumar1@ti.com>


>
> Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
> ---
>   arch/arm64/boot/dts/ti/k3-j722s-evm.dts | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/ti/k3-j722s-evm.dts b/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
> index 0f18fe710929..43256c71a19c 100644
> --- a/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
> +++ b/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
> @@ -266,6 +266,20 @@ transceiver2: can-phy2 {
>   		max-bitrate = <5000000>;
>   		standby-gpios = <&exp1 17 GPIO_ACTIVE_HIGH>;
>   	};
> +
> +	csi01_mux: mux-controller-0 {
> +		compatible = "gpio-mux";
> +		#mux-state-cells = <1>;
> +		mux-gpios = <&exp1 6 GPIO_ACTIVE_HIGH>;
> +		idle-state = <0>;
> +	};
> +
> +	csi23_mux: mux-controller-1 {
> +		compatible = "gpio-mux";
> +		#mux-state-cells = <1>;
> +		mux-gpios = <&exp1 7 GPIO_ACTIVE_HIGH>;
> +		idle-state = <0>;
> +	};
>   };
>   
>   &main_pmx0 {
