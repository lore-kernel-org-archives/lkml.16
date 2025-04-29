Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E346C21ABC6;
	Tue, 29 Apr 2025 18:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745950975; cv=none; b=pb3tWFct3QHvRPsk7LMmk5P1wf15ZKs6faK18sxuPtPfa0VU20lk5tRZ/G5O9qTIzpNoP+wLAV9w/0s2hiY0kuEXWDwDj1Nmdfluk/o5sNIRpzWFyRQEeiK2ml5eEREyTa9hzk/ub9a+9Y0h04R7RWKrGk0EKFIVIGWPOkj+kI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745950975; c=relaxed/simple;
	bh=N3Qj2TqfFbgAxadAz4oK7Q3Wyu5VyC12MZnmSfOgenM=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HbG8Owf2wSuSPt1m4RpotpUBoRUlCLF/Xsca6bf0aoz3Sx0fpFK5XwiN+rYV8c81Wt33lGOBjkp679+oTu1db615tSqWQgkji3aNJUxr0buCOO7geldrmxAQaAFLqmvswJouNyCiVc38Xiqs5JuPoC0JmVqvS728e1RBN8ymNKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=cMDS6aqD; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="cMDS6aqD"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53TIMiCd3915107
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 29 Apr 2025 13:22:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745950964;
	bh=PcLmyf/yI3lueA2N9Nh2ktmh9qhX02LazNi5j2d4bz8=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=cMDS6aqDUJhMt1cRjkuTnmzyoSSfP0KPWP1+tF4U+2iSAodzSyP5wQroUsgh8+MxW
	 +TRZC1pDtOxQ7kDGVv7wyLgGxWh/dkS0XToHLdAUuMIMpEkmbE9wNq48YeaZM0eZKf
	 2XcoU4zlSn/0mD65/bT+P5eHJ6JQy9AmmBqBx0Tw=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53TIMiFb023800
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 29 Apr 2025 13:22:44 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 29
 Apr 2025 13:22:44 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 29 Apr 2025 13:22:44 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53TIMi6Q093030;
	Tue, 29 Apr 2025 13:22:44 -0500
Date: Tue, 29 Apr 2025 13:22:44 -0500
From: Bryan Brattlof <bb@ti.com>
To: Judith Mendez <jm@ti.com>
CC: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        Tero
 Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Moteen Shah <m-shah@ti.com>,
        Udit Kumar
	<u-kumar1@ti.com>
Subject: Re: [PATCH v2 0/3] Set eMMC clock parent to default
Message-ID: <20250429182244.vm2atpuvmdfhtmlc@bryanbrattlof.com>
X-PGP-Fingerprint: D3D1 77E4 0A38 DF4D 1853 FEEF 41B9 0D5D 71D5 6CE0
References: <20250429163337.15634-1-jm@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20250429163337.15634-1-jm@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On April 29, 2025 thus sayeth Judith Mendez:
> This series was split-off from "Misc MMC updates" patch series [0] and the
> original patch further divided into three to help with backporting as per
> review comments [1].
> 
> This series sets clock parent for eMMC to the default clock parent
> MAIN_PLL0_HSDIV5_CLKOUT for am62, am62a, & am62p/j722s SoCs. Software (DM)
> does not switch MMC clock parent correctly as per the Arasan IP requirement
> to hold the IP in reset while clock source is switched. Since muxes to
> switch clock parent are not glitch-free and the default parent is tested
> and working fine, switch to the default as a preventative action.
> 
> Changes since v1:
> - split original patch into three
> - add cover-letter
> - reword patch descriptions
> - add review tags
> 

Acked-by: Bryan Brattlof <bb@ti.com>

~Bryan

> [0] https://lore.kernel.org/linux-devicetree/20250417233040.3658761-1-jm@ti.com/
> [1] https://lore.kernel.org/linux-devicetree/20250429142825.bvrbpoc5iz32wh35@garment/
> 
> Link to v1:
> https://lore.kernel.org/linux-devicetree/20250429142333.4140010-1-jm@ti.com/
> 
> Judith Mendez (3):
>   arm64: dts: ti: k3-am62-main: Set eMMC clock parents to default
>   arm64: dts: ti: k3-am62a-main: Set eMMC clock parents to default
>   arm64: dts: ti: k3-am62p-j722s-common-main: Set eMMC clock parents to
>     default
> 
>  arch/arm64/boot/dts/ti/k3-am62-main.dtsi               | 2 --
>  arch/arm64/boot/dts/ti/k3-am62a-main.dtsi              | 2 --
>  arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi | 2 --
>  3 files changed, 6 deletions(-)
> 
> 
> base-commit: d864bb528a6725e775d564fd4430762acbb9dd0d
> -- 
> 2.49.0
> 
