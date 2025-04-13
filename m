Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0D2211185;
	Sun, 13 Apr 2025 09:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744537714; cv=none; b=E876SypP9h5IlxYqu4ksAIOl1LTSFbFX51o51+E1pFZaCdy9dg9PPykB3vMn4/9kFnDP0Xa3vu7kyje3bRIQ+cPmyI5xEmuPrpD/XTPvAPIjGuwEbPid91qdnJjSHzLVLNVV6eC5mCV0skHlS75uKUhf155VbE4WHe3bIxZN0Xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744537714; c=relaxed/simple;
	bh=evbW1UMZTXtgrSS6WaivWbsQAAqfuSpZTorFCUwUM4w=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=FM25fFcj+WAEZ9hZD8TQ56gEEjq/cDkGYgzH8mS5htBPPDNOCcQRCExHsDpIYg9IuxjkZE4vq0NcsPaeXtEx8BZQW/1aJYKOCjntUxg8s8xkajjz17687PpSau7wlSFxNjsUwRZqPdpy2fNdHdIC0FkAoXtnxl9EjMJ+ly9zg3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=AsiBlB4Z; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="AsiBlB4Z"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53D9mAQ51793023
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 13 Apr 2025 04:48:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744537690;
	bh=XcFXvWp+8y1C0Jh84T5AKaDALbMP9vd9zmnZkTJ7y5E=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=AsiBlB4ZoYWF2U9lu/WtajZBi4vcmvTuTg3KXFIBfQbYIjhLsVM/4meBLfZ9ANsDq
	 afsDbMX92q1joGAbQ1HnhEc+8yXPA5/AQDqCgp7WzHrXScj1AERxNBVgOqPZ9p1WQ9
	 qI6TZUaq/nytY8qtJ0BvTNpmspLyWVd15Z4rYByE=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53D9mA6r076798
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 13 Apr 2025 04:48:10 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sun, 13
 Apr 2025 04:48:09 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sun, 13 Apr 2025 04:48:09 -0500
Received: from [10.249.141.75] ([10.249.141.75])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53D9m5pE090639;
	Sun, 13 Apr 2025 04:48:06 -0500
Message-ID: <8c2aeee1-585f-495b-87a5-93b003709afd@ti.com>
Date: Sun, 13 Apr 2025 15:18:04 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] J722S: DT Node cleanup for serdes0 and serdes1
To: Siddharth Vadapalli <s-vadapalli@ti.com>, <nm@ti.com>, <vigneshr@ti.com>,
        <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        <u-kumar1@ti.com>
References: <20250412052712.927626-1-s-vadapalli@ti.com>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <20250412052712.927626-1-s-vadapalli@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Thanks Siddharth

On 4/12/2025 10:57 AM, Siddharth Vadapalli wrote:
> Hello,
>
> This series is based on the following series:
> https://patchwork.kernel.org/project/linux-arm-kernel/cover/20250408103606.3679505-1-s-vadapalli@ti.com/
> Based on the discussion in the above series which disabled 'serdes_wiz0'
> and 'serdes_wiz1' nodes in the SoC file and enabled them in the board
> file, Udit pointed out that it wasn't necessary to disable 'serdes0' and
> 'serdes1' in the SoC file anymore, since that is not a working
> configuration - serdes_wizX enabled and serdesX disabled doesn't work.
>
> Hence, this series aims to cleanup the serdesX nodes after the changes
> made by the above series.
>
> Regards,
> Siddharth.
>
> Siddharth Vadapalli (2):
>    arm64: dts: ti: k3-j722s-main: don't disable serdes0 and serdes1
>    arm64: dts: ti: k3-j722s-evm: drop redundant status within
>      serdes0/serdes1

For series

Reviewed-by: Udit Kumar <u-kumar1@ti.com>


>   arch/arm64/boot/dts/ti/k3-j722s-evm.dts   | 2 --
>   arch/arm64/boot/dts/ti/k3-j722s-main.dtsi | 4 ----
>   2 files changed, 6 deletions(-)
>
