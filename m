Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9C6EA32;
	Fri, 16 May 2025 12:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747398227; cv=none; b=gwPGxvG95/8scYTelDwlgqBrQDYme4TABc0oUTGSrGtP3yMsFuyg+FQV81R8ud/s3LViPuJ4/sUfBf69qgrp9LwobVc9c4m53BNC9Rnh+sKUSyHe3aKtDkruD/axqQ8Ro3NTcyrr7x5NoXIU60n7C6HyLzhl1WRsTGOjDFES93Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747398227; c=relaxed/simple;
	bh=bjzThxf/c/OGwSuGkaNZ2A0kuLvtKeT6WOSMB+/xIws=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bcv0Cbo550T2Xy7DKvPWIFaSN46lYfRs9ImhTdtI+r7OFa4Kq9H5S9s248tCE9QtMxjtus+qQOw4eMLN3IkLQFwhiD+Jc6wmeJDPYJVxcoqb2CCWipgfS46n969nCRvOjpjjTUaUmPIebf469Q2P01KlCpsMSmP4t+wJoOJ9d4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=c1mRWIOr; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="c1mRWIOr"
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 54GCNMFH293612;
	Fri, 16 May 2025 07:23:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1747398202;
	bh=9iSprpDD9MEcLp1Bth1jKr1zlM+Nrfxm/TVqYUucfos=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=c1mRWIOrLxBSJS9eRA4NySuP5YocU+FwobraV0WAqYdrecvvi0jhnUB3aKbCqOBDi
	 guiNPHWk601pHe/lGM7Am+aAQBc4OUNgkMI9I/vNYEkVEQ7KqF2BYDfM+UKLgsc+br
	 dpVe6kJKbYPC6Z87TU9ClIMhyceajXkLxemF7+tQ=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 54GCNL3J2216929
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 16 May 2025 07:23:21 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 16
 May 2025 07:23:21 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 16 May 2025 07:23:21 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 54GCNLMM102938;
	Fri, 16 May 2025 07:23:21 -0500
Date: Fri, 16 May 2025 07:23:21 -0500
From: Bryan Brattlof <bb@ti.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
CC: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        Tero
 Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Dhruva
 Gole <d-gole@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 2/3] arm64: dts: ti: k3-am62l: add initial
 infrastructure
Message-ID: <20250516122321.ng33ei7zlabmrod6@bryanbrattlof.com>
X-PGP-Fingerprint: D3D1 77E4 0A38 DF4D 1853 FEEF 41B9 0D5D 71D5 6CE0
References: <20250507-am62lx-v5-0-4b57ea878e62@ti.com>
 <20250507-am62lx-v5-2-4b57ea878e62@ti.com>
 <aCcSG5ah12N0yOwi@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <aCcSG5ah12N0yOwi@pengutronix.de>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On May 16, 2025 thus sayeth Sascha Hauer:
> Hi All,
> 
> On Wed, May 07, 2025 at 10:09:20PM -0500, Bryan Brattlof wrote:
> > +	rti0: watchdog@e000000 {
> > +		compatible = "ti,j7-rti-wdt";
> > +		reg = <0x00 0x0e000000 0x00 0x100>;
> > +		clocks = <&scmi_clk 273>;
> > +		power-domains = <&scmi_pds 60>;
> > +		assigned-clocks = <&scmi_clk 273>;
> > +		assigned-clock-parents = <&scmi_clk 1>;
> > +	};
> > +
> > +	rti1: watchdog@e010000 {
> > +		compatible = "ti,j7-rti-wdt";
> > +		reg = <0x00 0x0e010000 0x00 0x100>;
> > +		clocks = <&scmi_clk 279>;
> > +		power-domains = <&scmi_pds 61>;
> > +		assigned-clocks = <&scmi_clk 279>;
> > +		assigned-clock-parents = <&scmi_clk 1>;
> > +	};
> 
> In the TI downstream TF-A we have this in the readme:
> 
> | AM62L Clock SCMI ID List:
> | =========================
> | 
> | **Note:** For using the clock parents, the scmi clock ID will not be the actual number itself,
> | rather will be starting with 0 for respective parents similar to how it's being done in TI SCI
> | Documentation: https://software-dl.ti.com/tisci/esd/09_02_07/5_soc_doc/am62ax/clocks.html
> | 
> | For eg. for AM62LX_DEV_MCASP0_AUX_CLK device, clock ID will be 192, however if we require the parent
> | to be AM62LX_DEV_MCASP0_AUX_CLK_PARENT_HSDIV4_16FFT_WKUP_0_HSDIVOUT1_CLK then we would represent in
> | the device tree as:
> | 
> | ```
> | assigned-clocks = <&scmi_clk 192>;
> | assigned-clock-parents = <&scmi_clk 1>;
> 
> This doesn't work. It's not conforming to the SCMI specification and it
> also doesn't work with the Linux SCMI clk driver which will hang on a
> cat /sys/kernel/debug/clk/clk_summary. This is because all clock
> parents will be the SCMI clocks with the lowest ids including the clocks
> with the lowest ids which will expose themselves as parents.
> 
> It also prevents the userspace from being able to make a tree structure
> from the clock tree.
> 
> The corresponding TF-A code is requested for upstreaming here [1] where
> I also commented on with the same issue.
> 
> Please stop spreading this further. The parents must be the actual
> clk_id, not numbers from 0..n.
> 
> Sascha
> 
> [1] https://review.trustedfirmware.org/c/TF-A/trusted-firmware-a/+/34834
>

Ah my bad. I'll drop all nodes that need clock parents called out until 
this is resolved.

Thanks Sascha
~Bryan
