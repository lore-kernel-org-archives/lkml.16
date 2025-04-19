Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FB9554654;
	Sat, 19 Apr 2025 03:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745035152; cv=none; b=sc6lXpKL9jPWGVeLeWk3VKSaQVsuugnWjr5RYQK4RerTUheQRLSsc+rXt/HvzWmxIbyfb044n/o8ihRUZ9flJPabciSGQfwn8VXwKL/6Ub2kArBYrwP7mCTsqBdtEpqlU9MradwleohyTWSnvBjEYiwQwhz2HnDneLJOWhmHZfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745035152; c=relaxed/simple;
	bh=LAZLZXXR4fpH4UmJ7A0K0g2nbKcoE4qbISCBceZtsLE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=AjIM/EUsEE1TG/GIeovU5WSwc0iBwHfRz4XO0c7y32VpzXYWH/CQJ+dfqwnLJMy+KEkA2YegXfs6mhiPpx5qyVXnrxnTwsz2THMsy43qgQzedNR4NtWDDqQZJNd07wBLACqx9ohxDf0m/vvIR7L8OX5Rf9rJ7oTfeO6xAKUGlpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=UtdRLOIu; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="UtdRLOIu"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53J3x1jV1073856
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 18 Apr 2025 22:59:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745035141;
	bh=OxIm5BWYRHWRtfm3BI4yfvGxCISf/AMNRZprOku6zEE=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=UtdRLOIu0pJM/6XS5NGxLt3cnLdiygCDXQ/ujxTPjbsX+mBNG/QBs2WHXto0YAQZL
	 QThe7bTqs19acGe17QtazFNyPc5lbM5uyEi2z7qus6Izdy7sAouZQIiL4SrAJJJ87J
	 OOQsZeQy+LZ4UlN+sZPtfRMx2/LFe+O/hFviUXsQ=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53J3x1fX045034
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 18 Apr 2025 22:59:01 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 18
 Apr 2025 22:59:01 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 18 Apr 2025 22:59:01 -0500
Received: from [10.249.141.75] ([10.249.141.75])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53J3wwhQ128798;
	Fri, 18 Apr 2025 22:58:59 -0500
Message-ID: <80b5867b-958a-41ff-854a-6a3173ddbdc0@ti.com>
Date: Sat, 19 Apr 2025 09:28:57 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: ti: k3-j721e-common-proc-board: Add
 bootph-all to HBMC nodes
To: Anurag Dutta <a-dutta@ti.com>, <nm@ti.com>, <vigneshr@ti.com>,
        <kristo@kernel.org>
CC: <vaishnav.a@ti.com>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250411082637.2271746-1-a-dutta@ti.com>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <20250411082637.2271746-1-a-dutta@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea


On 4/11/2025 1:56 PM, Anurag Dutta wrote:
> Add bootph-all to HBMC controller and hyperflash nodes for successful
> hyperflash boot on j721e-evm.
>
> Signed-off-by: Anurag Dutta <a-dutta@ti.com>
> ---
>
> Test logs : https://gist.github.com/anuragdutta731/90a492589557c2ec2881e1de50a62006
>
>   arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts | 7 +++++++
>   1 file changed, 7 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts b/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts
> index 4421852161dd..9ada749f16ba 100644
> --- a/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts
> +++ b/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts
> @@ -570,6 +570,13 @@ &usb1 {
>   	maximum-speed = "high-speed";
>   };
>   
> +&hbmc {
> +	bootph-all;
> +	flash@0,0 {
> +		bootph-all;
> +	};
> +};

Could you check once , if this is duplicated

commit fbdb8aa4eab84 "arm64: dts: ti: k3-j721e-evm*: Add bootph-* 
properties"

adds bootph-all in arch/arm64/boot/dts/ti/k3-j721e-som-p0.dtsi file for 
flash.

AFAIK, parent node should inherit property of child for bootph.

In case you are not getting in u-boot then u-boot shall fix this[0]

[0] : https://lore.kernel.org/all/20250327080642.2269856-1-m-shah@ti.com/

> +
>   &ospi1 {
>   	pinctrl-names = "default";
>   	pinctrl-0 = <&mcu_fss0_ospi1_pins_default>;
