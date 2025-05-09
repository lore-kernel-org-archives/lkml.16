Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DDC32741C2;
	Fri,  9 May 2025 08:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746779121; cv=none; b=mRypnUfNKENWC+c1h7k04MNIaiLVMFK8Yroc3H8AYMIrd6IQrjMF4WIN+upbMA9emDOpWBPTmL8FROy5qZ42YHiJ4IVzj/XClzjG0EKq+A6loYDL7+DR63xYEkn/n7i0pUCliHELs9B/ImKL8hUoDmkCa3fOPT2csyI4zfVG3ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746779121; c=relaxed/simple;
	bh=FZBqXwcIMmYLzGhJ9dLe2kFxSIhbEIMwpZODYkuQj44=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u06+10bR95pvtnb5q4E5dmzvMzRpJlmYEPxyurst1hefCQbaQGs2kSFjx5AVYa4JdRTfkRbxxA2NgDzbGetKqDQp2RQOUeFYJQ+R9RITY7XOzb2iXcMc0Q5SWPF6lYSzDWHbg2SByRUkJKneY5qvj/yEvnE+zProfetc3FPk6oY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=xELnqpi5; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="xELnqpi5"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 5498PAbZ1345842
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 9 May 2025 03:25:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746779110;
	bh=HCP/12rAyQwOl5LrFAi4QTkdDpc/orvAD1e4tN/2d7M=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=xELnqpi5bJF6eitop24E6D+ONFUP6vAFMe4viDUsGo918leyJuxKbUUP/VzPAV2qS
	 xoV9sxH7fdjs5eTTB19jWdnUxuk4C0HVcMUIHD1x+X7l5lvEGOtH3csGwW340ZpscN
	 sJJyR8R3NOE2W292EGMNF42N05Q62iAFN+TEgtvE=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 5498PAm6095237
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 9 May 2025 03:25:10 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 9
 May 2025 03:25:09 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 9 May 2025 03:25:10 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5498P9uR003472;
	Fri, 9 May 2025 03:25:09 -0500
Date: Fri, 9 May 2025 03:25:09 -0500
From: Nishanth Menon <nm@ti.com>
To: Prasanth Babu Mantena <p-mantena@ti.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-kernel@vger.kernel.org>, <u-kumar1@ti.com>
Subject: Re: [PATCH v2] arm64: dts: ti: k3-j721e-common-proc-board: Enable
 OSPI1 on J721E
Message-ID: <20250509082509.ogfs2ulyfgk6etxc@unshaved>
References: <20250507050701.3007209-1-p-mantena@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250507050701.3007209-1-p-mantena@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 10:37-20250507, Prasanth Babu Mantena wrote:
> J721E SoM has MT25QU512AB Serial NOR flash connected to
> OSPI1 controller. Enable ospi1 node in device tree.
>
> Fixes: cb27354b38f3b ("arm64: dts: ti: k3-j721e: Add DT nodes for few peripherials")

Yes, cb27354b38f3b ("arm64: dts: ti: k3-j721e: Add DT nodes for few
peripherials") did not enable the node, But back then, we used to
ensure all nodes were left default (okay) and then disable unused
nodes in board dts.

BUT, we ended up having a bunch of maintenance issues and board bring
up problems and looking at the rest of the ARM ecosystems (you can
check the mailing list for all the discussions on the topic), we
flipped the order for peripherals that need board level connectivity
for functionality to be disabled in SoC.dtsi and enabled explicitly at
board level and when that occurred, specifically:
73676c480b72 ("arm64: dts: ti: k3-j721e: Enable OSPI nodes at the board
level") which enabled ospi0 at SoM level, but missed fixing this up,
whoops!

I will fix this up locally when I apply this patch. but FYI.

> Signed-off-by: Prasanth Babu Mantena <p-mantena@ti.com>
> ---
> Test log : https://gist.github.com/PrasanthBabuMantena/9dda540dce88282117de7e0e945e24ca
>  arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts b/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts
> index e3d0ef6913b2..45311438315f 100644
> --- a/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts
> +++ b/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts
> @@ -573,6 +573,7 @@ &usb1 {
>  &ospi1 {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&mcu_fss0_ospi1_pins_default>;
> +	status = "okay";
>
>  	flash@0 {
>  		compatible = "jedec,spi-nor";
> --
> 2.34.1
>
>

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
