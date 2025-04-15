Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C35B62522BD;
	Tue, 15 Apr 2025 20:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744748970; cv=none; b=nutMBQse05QCx2PXTd4o/ObLXNB2bwLlQyb5Dq1LnbEzViwJz8/QYoxofYkx4763AMBnVG/bCfUtYU4JYckEebNfZXMjWAtYk0g7+hyEL5XZGZ9ru/lie0WdK2czLMm6ZDyv5deCeK+FWLTHwsCngdZouOfKabwoRTMEZFkRPb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744748970; c=relaxed/simple;
	bh=qBksyT2EfEsYqVSinfpjzL262zVYFpes9aCrLNSN+TM=;
	h=MIME-Version:Content-Type:Date:Message-ID:CC:Subject:From:To:
	 References:In-Reply-To; b=WY3oE/FjAreXp0HAFYY1g58CQ1IbLRxXRS7CM9gSmYk+pd+D0xei7186PBAmE0VGql1k6RhUo2hHswMumiXtb5TJhfjht1bnxZCSToEnL1s7+OFv8/12LhuRUSxvQYP2qt651/30k+7/mqAO6k6N0/wTgRr8nnvL6CnQ6t+HHsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=SWyx3Amm; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="SWyx3Amm"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53FKTFuw132148
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 15 Apr 2025 15:29:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744748956;
	bh=Dt+F+4fNm1LcRSmr3GDnsB8MmFE+gO5sTMiOLjM3yRc=;
	h=Date:CC:Subject:From:To:References:In-Reply-To;
	b=SWyx3AmmMrIv43dKfd22i8mv2lb3nCKBH3U3heM1QXblBqpY+yjOCxmO7aCLeTyck
	 /H2xqXDtbR4fC2OU0l0RS27XAH0QjRnrkG/w1BCDSE3Chaq7MCtRJ15FDSZexNJuNk
	 z/V+smRVugU9LYk9G1cR78ofjwrIYnsavFZ0bheY=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53FKTF79043236
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 15 Apr 2025 15:29:15 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 15
 Apr 2025 15:29:13 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 15 Apr 2025 15:29:13 -0500
Received: from localhost (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53FKTD9C078755;
	Tue, 15 Apr 2025 15:29:13 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 15 Apr 2025 15:29:13 -0500
Message-ID: <D97HVW413ESX.1EEP5D4O6HMOG@ti.com>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Frank Binns <frank.binns@imgtec.com>,
        Alessio
 Belle <alessio.belle@imgtec.com>,
        Alexandru Dadu <alexandru.dadu@imgtec.com>,
        Luigi Santivetti <luigi.santivetti@imgtec.com>,
        Darren Etheridge
	<detheridge@ti.com>
Subject: Re: [PATCH 2/2] arm64: dts: ti: k3-j721s2: Add GPU node
From: Randolph Sapp <rs@ti.com>
To: Matt Coster <matt.coster@imgtec.com>, Nishanth Menon <nm@ti.com>,
        Vignesh
 Raghavendra <vigneshr@ti.com>,
        Tero Kristo <kristo@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250415-bxs-4-64-dts-v1-0-f7d3fa06625d@imgtec.com>
 <20250415-bxs-4-64-dts-v1-2-f7d3fa06625d@imgtec.com>
In-Reply-To: <20250415-bxs-4-64-dts-v1-2-f7d3fa06625d@imgtec.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On Tue Apr 15, 2025 at 11:20 AM CDT, Matt Coster wrote:
> The J721S2 binding is based on the TI downstream binding in commit
> 54b0f2a00d92 ("arm64: dts: ti: k3-j721s2-main: add gpu node") from [1]
> but with updated compatible strings.
>
> The clock[2] and power[3] indices were verified from docs, but the
> source of the interrupt index remains elusive.
>

For future reference, interrupt maps are present in the TRM. "Table 6-89. G=
PU0
Hardware Requests" explicitly calls it out "GPU0 | GPU0_MISC_0_IRQ_0 |
GIC500_SPI_IN_56 | COMPUTE_CLUSTER0 | GPU0 interrupt request". Subtract 32 =
from
that pin number to get the DT number.

That comment aside, this series seems fine to me.
Reviewed-by: Randolph Sapp <rs@ti.com>

> [1]: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel
> [2]: https://downloads.ti.com/tisci/esd/latest/5_soc_doc/j721s2/clocks.ht=
ml
> [3]: https://downloads.ti.com/tisci/esd/latest/5_soc_doc/j721s2/devices.h=
tml
>
> Signed-off-by: Matt Coster <matt.coster@imgtec.com>
> ---
> This patch was previously sent as [DO NOT MERGE]:
> https://lore.kernel.org/r/20250410-sets-bxs-4-64-patch-v1-v6-18-eda620c58=
65f@imgtec.com
> ---
>  arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi b/arch/arm64/boot=
/dts/ti/k3-j721s2-main.dtsi
> index 92bf48fdbeba45ecca8c854db5f72fd3666239c5..a79ac41b2c1f51b7193e61338=
64428bd35a5e835 100644
> --- a/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
> @@ -2048,4 +2048,16 @@ watchdog8: watchdog@23f0000 {
>  		/* reserved for MAIN_R5F1_1 */
>  		status =3D "reserved";
>  	};
> +
> +	gpu: gpu@4e20000000 {
> +		compatible =3D "ti,j721s2-gpu", "img,img-bxs-4-64", "img,img-rogue";
> +		reg =3D <0x4e 0x20000000 0x00 0x80000>;
> +		clocks =3D <&k3_clks 130 1>;
> +		clock-names =3D "core";
> +		interrupts =3D <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
> +		power-domains =3D <&k3_pds 130 TI_SCI_PD_EXCLUSIVE>,
> +				<&k3_pds 373 TI_SCI_PD_EXCLUSIVE>;
> +		power-domain-names =3D "a", "b";
> +		dma-coherent;
> +	};
>  };

