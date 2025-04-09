Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B3491DE2CE;
	Wed,  9 Apr 2025 06:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744178650; cv=none; b=bmgIqOyCP8WwAuEe+cSQmGfAhPd5n+C6kZoHOEXls96gPEfYVAZHhnzz/167J69A/aUWrCSWCjyGwsODTdMludKrGFWdCP1pMKHSHep4CcTdFDQaN5F6AQQPRIo7sjijYtpIHg1Mfiq9NqKcvgeOZ8nXaIcbhW9MvBpwgvFtlSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744178650; c=relaxed/simple;
	bh=LCt1JcHMg8pRSVZaE4n+Mp0vhppDZrDQ0k9XUTxKLhY=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jy21LsjyM4qqtf48VVFQsyXGAF86M1vmh3epDifgApChxTrOTEZpMBeopod4H9BUpoxXheXGGIuw+pPpecwztEb6mmd/G/zKFwwplGDgkgH+H4m1gE4byC7cGDL/p0T27yrnSJIQBqONUijktVF5Uew7JwGkqyNU+ylcqi8GVFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=OrdZ3X75; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="OrdZ3X75"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 539640em1391408
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 9 Apr 2025 01:04:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744178640;
	bh=JS0HHH35yYyVcWUAh1e+7fAO/3pPcg4V8aNA2A38XfA=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=OrdZ3X75qbHUJkwHdjca3u3vZ9i6nadLqUn48RpcK/gY6gW28GTVS/DUZlpbyDOap
	 P8smHX4Nvl0BL+h3dcAiXU5OUFK2OgTvWdV3UR6BS8p2hDiVJz424mZRj7lQMJkntB
	 LoTmwCRf95o5PVvwx40DfBgpBXqyayQf+d8y2jbk=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 539640Lo048307
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 9 Apr 2025 01:04:00 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 9
 Apr 2025 01:03:59 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 9 Apr 2025 01:03:59 -0500
Received: from localhost (lcpd911.dhcp.ti.com [172.24.227.226])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53963wl5097075;
	Wed, 9 Apr 2025 01:03:59 -0500
Date: Wed, 9 Apr 2025 11:33:58 +0530
From: Dhruva Gole <d-gole@ti.com>
To: Robert Nelson <robertcnelson@gmail.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Vignesh
 Raghavendra" <vigneshr@ti.com>, Nishanth Menon <nm@ti.com>,
        Andrew Davis
	<afd@ti.com>, Roger Quadros <rogerq@kernel.org>,
        Siddharth Vadapalli
	<s-vadapalli@ti.com>, Judith Mendez <jm@ti.com>,
        Andrei Aldea
	<a-aldea@ti.com>,
        Jason Kridner <jkridner@beagleboard.org>,
        Deepak Khatri
	<lorforlinux@beagleboard.org>,
        Ayush Singh <ayush@beagleboard.org>
Subject: Re: [PATCH v2 2/2] arm64: dts: ti: Add k3-am62-pocketbeagle2
Message-ID: <20250409060358.bj4dd7kq42nc26hx@lcpd911>
References: <20250408231823.826163-1-robertcnelson@gmail.com>
 <20250408231823.826163-2-robertcnelson@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250408231823.826163-2-robertcnelson@gmail.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On Apr 08, 2025 at 18:18:23 -0500, Robert Nelson wrote:
> BeagleBoard.org PocketBeagle 2 is an upgraded version of the popular
> PocketBeagle.  It is based on Texas Instruments AM6232 or AM6254 SoC.
> Its dual or quad A53 cores can provide higher performance than classic
> PocketBeagle. The new design comes with pre-soldered headers, a 3-pin
> JST-SH 1.00mm UART debug port, a USB-C port, Texas Instruments
> MSPM0L1105 Cortex-M0+ MCU for ADC, 512MB RAM, and a LiPo Battery charger.
> 
> https://www.beagleboard.org/boards/pocketbeagle-2
> https://openbeagle.org/pocketbeagle/pocketbeagle-2
> 
> Signed-off-by: Robert Nelson <robertcnelson@gmail.com>
> CC: Rob Herring <robh@kernel.org>
> CC: Krzysztof Kozlowski <krzk+dt@kernel.org>
> CC: Conor Dooley <conor+dt@kernel.org>
> CC: Vignesh Raghavendra <vigneshr@ti.com>
> CC: Nishanth Menon <nm@ti.com>
> CC: Andrew Davis <afd@ti.com>
> CC: Roger Quadros <rogerq@kernel.org>
> CC: Siddharth Vadapalli <s-vadapalli@ti.com>
> CC: Judith Mendez <jm@ti.com>
> CC: Andrei Aldea <a-aldea@ti.com>
> CC: Dhruva Gole <d-gole@ti.com>
> CC: Jason Kridner <jkridner@beagleboard.org>
> CC: Deepak Khatri <lorforlinux@beagleboard.org>
> CC: Ayush Singh <ayush@beagleboard.org>
> ---
> Changes since v1:
>  - fix '_' in main-i2c2-default-pins
>  - aliases i2c match original pocketbeagle
>  - add mcu_m4fss with reseved memory and mailbox
>  - drop unused main_gpio0_pins_default pinmux
>  - drop unused main_gpio1_pins_default pinmux
>  - drop unused main_spi2_pins_gpio pinmux
>  - Reserve 128MiB of global CMA

Thanks for addressing comments from last revision,

Reviewed-by: Dhruva Gole <d-gole@ti.com>


-- 
Best regards,
Dhruva Gole
Texas Instruments Incorporated
