Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55C8A52F88
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 04:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738212736; cv=none; b=U4nhRq99P6MZBdklsqYdGuO3b1Uh1tcMQDgv9zp4UEOQfk0LG0O42H4Fud2NdF/U7V3wScM8yF7mjnfqlGGaiX+MdWbFKzaTdu3QFEckFzFBVRwpjnxnU3aHryEnYS3y/ir13ZXLQ2ODTgsW7AdsFugqvX1mSkBd7KFR/XXm+Jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738212736; c=relaxed/simple;
	bh=3GPSD3CC3zwmo69e6REkVvZqSFbNyvhfSLsEom8DXvc=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p5hAamVh1ZZg71zGVXG3Xi549V6nPAkZT3jj9uAD10zKJ12/EhHxBT/rPYaDneEi7RM4SvymmaTPyEgIHVNAjeJxvTMENnppWYXb9WeYfHevJEIs9TrZAGrQQcnUR5i7IP9ec9e6Y/FTi1+wU++F1hV5MRN/THc4x9zgbd+g2oI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=CHHOq9SR; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="CHHOq9SR"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50U4pn4c2292267
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Wed, 29 Jan 2025 22:51:49 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738212709;
	bh=7XxGmCX2ekXL3zSY/uKne+uElJCOAi5ipt9bPEl308I=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=CHHOq9SRdPPC357R+DdipK+jjFMopZ2yJks3YTWy+thPkUtX4DyaSn6uGHi0YyDJC
	 vRmrSoufZNvwHsi6AMyhDB904MpZdWtOmOQmblKgHODGqwvjVFvG1kdl2a5fvWfeBk
	 EL+muRX8Ra7eO+P7UCVLCvBtL/Tr+JJQIwcNOXMo=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50U4pnq5036930;
	Wed, 29 Jan 2025 22:51:49 -0600
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 29
 Jan 2025 22:51:48 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 29 Jan 2025 22:51:48 -0600
Received: from localhost (lcpd911.dhcp.ti.com [172.24.227.226])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50U4plGF093028;
	Wed, 29 Jan 2025 22:51:48 -0600
Date: Thu, 30 Jan 2025 10:21:47 +0530
From: Dhruva Gole <d-gole@ti.com>
To: Ayush Singh <ayush@beagleboard.org>
CC: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        <lorforlinux@beagleboard.org>, <jkridner@beagleboard.org>,
        <robertcnelson@beagleboard.org>, Nishanth Menon <nm@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] arm64: defconfig: Enable gb_beagleplay
Message-ID: <20250130045147.ji2tnogbgxim26pw@lcpd911>
References: <20250129-defconfig-beagleplay-v2-1-5a890943d223@beagleboard.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250129-defconfig-beagleplay-v2-1-5a890943d223@beagleboard.org>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On Jan 29, 2025 at 18:44:54 +0530, Ayush Singh wrote:
> Enable greybus driver used by TI K3/AM625 BeaglePlay.

Nit: TI K3 AM625 BeaglePlay , no "/" required. It can lead to confusion
that K3/AM625 are different chips.

> 
> The driver communicates with Ti CC1352P7 co-processor which acts as

s/Ti/TI

> Greybus SVC. Additionally, it also provides firmware upload API support
> for Ti CC1352P7 over UART.

ditto

> 
> Signed-off-by: Ayush Singh <ayush@beagleboard.org>
> ---
> Enable greybus driver for Ti CC1352P5 over UART used in TI K3/AM625
> BeaglePlay [0].
> 
> [0]: https://elixir.bootlin.com/linux/v6.13/source/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts
> ---
> Changes in v2:
> - Add hardware name to commit message.
> - Use savedefconfig option to update config.
> - Link to v1: https://lore.kernel.org/r/20250127-defconfig-beagleplay-v1-1-22a60085e313@beagleboard.org
> ---
>  arch/arm64/configs/defconfig | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index cb7da44155999b59aff95966f4cdc9107f2af46a..62309fd2482ab35e917aea2e63780c45a4347f43 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -1270,6 +1270,8 @@ CONFIG_VIRTIO_BALLOON=y
>  CONFIG_VIRTIO_MMIO=y
>  CONFIG_XEN_GNTDEV=y
>  CONFIG_XEN_GRANT_DEV_ALLOC=y
> +CONFIG_GREYBUS=m
> +CONFIG_GREYBUS_BEAGLEPLAY=m

With that,
Reviewed-by: Dhruva Gole <d-gole@ti.com>

-- 
Best regards,
Dhruva Gole
Texas Instruments Incorporated
