Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D7F46136;
	Mon, 23 Jun 2025 14:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750688999; cv=none; b=S74Z47phXSMeOUf4mqy02a5FcyRurhtcI7rC5mt9W0V16+sONz1D76bj7FVKlruZujNlhsmJaIK42SRAxq9FY7as/dQpG4Bvcwh768hY7ssj0s5PJln49UpSHs5QojQ3zR/vs8tOwggSeBL2u9cO9AaSb2vpLsYcig5gqcnnhDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750688999; c=relaxed/simple;
	bh=kNgh50wRPa1IpbsSrhyg1ta6hy97Cr5M4hdhDESZDk4=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JtcScOMnShj03L1CM5RwpjJWfOKmoIgnPF4f6OR4ePNowMpX6IJuzgmfrlxHvwOxvCDJldCrvLyyfRow3SbueGsrCXR97wEOZp2neboi7jKXx6YHvlUJTydVEaMUMBjSPAnPDQ3SBKFmCG0lr59xxzlCV2R0YBm0yld7WZUSCd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=gV+sSAhA; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="gV+sSAhA"
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55NETrJ0907681;
	Mon, 23 Jun 2025 09:29:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1750688993;
	bh=S1mJZ57ChC5HqF8yPvS2kAr0B+cCQirxzf4xeYNbbxk=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=gV+sSAhAdO2pOPeHwvwH6k/6kRqUkxKj1vrCc2OtWjHVj1tD2Cx3YaK8/GwfsPMTi
	 G+kmt3rjT9ohl6SBQVj7CnT3ke37A08UiUQ4LVyQkcrDjjr/wkf/0espnNpNLlb15P
	 JeW1hMnEaM6PE0WltdGRg7iAHWcLCu0MXOVHTTHo=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55NETr38586092
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 23 Jun 2025 09:29:53 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 23
 Jun 2025 09:29:52 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 23 Jun 2025 09:29:52 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55NETq4w4009277;
	Mon, 23 Jun 2025 09:29:52 -0500
Date: Mon, 23 Jun 2025 09:29:52 -0500
From: Bryan Brattlof <bb@ti.com>
To: Paresh Bhagat <p-bhagat@ti.com>
CC: <nm@ti.com>, <vigneshr@ti.com>, <praneeth@ti.com>, <kristo@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <khasim@ti.com>, <v-singh1@ti.com>,
        <afd@ti.com>, <devarsht@ti.com>
Subject: Re: [PATCHv4 5/6] arm64: dts: ti: Update firmware-name for IPC
Message-ID: <20250623142952.3aeec366w2lmoswv@bryanbrattlof.com>
X-PGP-Fingerprint: D3D1 77E4 0A38 DF4D 1853 FEEF 41B9 0D5D 71D5 6CE0
References: <20250623141253.3519546-1-p-bhagat@ti.com>
 <20250623141253.3519546-6-p-bhagat@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20250623141253.3519546-6-p-bhagat@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On June 23, 2025 thus sayeth Paresh Bhagat:
> Update the firmware-name properties in the dts file to point to new IPC
> firmware binaries for both the mcu-r5 and c7x core.
> 

Same here. This seems like we should have squashed this into 4/6

~Bryan

> Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
> ---
>  arch/arm64/boot/dts/ti/k3-am62d2-evm.dts | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts b/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
> index 8fde89ecba67..c98e4c98c956 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
> +++ b/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
> @@ -487,6 +487,7 @@ &mcu_r5fss0_core0 {
>  	mboxes = <&mailbox0_cluster2 &mbox_mcu_r5_0>;
>  	memory-region = <&mcu_r5fss0_core0_dma_memory_region>,
>  			<&mcu_r5fss0_core0_memory_region>;
> +	firmware-name = "am62d-mcu-r5f0_0-fw";
>  };
>  
>  &c7x_0 {
> @@ -495,6 +496,7 @@ &c7x_0 {
>  	mboxes = <&mailbox0_cluster1 &mbox_c7x_0>;
>  	memory-region = <&c7x_0_dma_memory_region>,
>  			<&c7x_0_memory_region>;
> +	firmware-name = "am62d-c71_0-fw";
>  };
>  
>  &cpsw3g {
> -- 
> 2.34.1
> 
