Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84FA727D762;
	Tue, 22 Apr 2025 12:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745325528; cv=none; b=s3DkbkhJZlTXHG6xoN8A9NBaBiPF74tM8nX5mUncrhvTUuEcBD7YppolSHlXtPt9w/gvo4r7xjBrQ4zsVhnKVYoAKsYmlmG9yuO6vhdjzNlTvTqU9yLMYK8M5agj5E+gweFJcYjndjsrN4G8J4ey7yCUzQdHAKtuL+7geY95J2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745325528; c=relaxed/simple;
	bh=zZesQnhJCh0jvbuM8vT7IkVhJz3hiYg0Fy04+rCT1Vw=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bA1CdzpNUL8FgZinEf/UoPsfb7WCbnwf6gKduuMUC9AkGZ+nrWiIOGlrITC8hjGIg7aSOuSs9VzlBQOhea93TN4pQFwk9DtkH651URZxHOzU3ETxdi3CsLEwTbQppapnFsMyHtHJ8SSRso1TeD//PJmESFJlDA0s448JM2ZKLd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=CsESrhHP; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="CsESrhHP"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53MCcb2L1943131
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 22 Apr 2025 07:38:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745325518;
	bh=4hFUNmLBRh4VveH2rb85NwamzBJC3ETXpv4CzWL79j0=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=CsESrhHPI3hUH0Su+441aV/y7m9+oGDeKaOULp5JXFPf+PEtFplxyXjeuOkTWhvwl
	 uzOaVMApu5uYbBEfde1K1i/KFSwWWGgiWybdrU4w39Vbx9H5skcgJigd6j8IIcr2hR
	 y4FB1RgfKqjDdk5mZo/QI30yDdDqGD1lqQRkecGo=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53MCcbPZ021431
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 22 Apr 2025 07:38:37 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 22
 Apr 2025 07:38:37 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 22 Apr 2025 07:38:37 -0500
Received: from localhost (uda0492258.dhcp.ti.com [10.24.72.113])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53MCcaQI006395;
	Tue, 22 Apr 2025 07:38:37 -0500
Date: Tue, 22 Apr 2025 18:08:35 +0530
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: "Kumar, Udit" <u-kumar1@ti.com>, <parth105105@gmail.com>
CC: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        Tero
 Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Siddharth
 Vadapalli <s-vadapalli@ti.com>,
        Parth Pancholi <parth.pancholi@toradex.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] arm64: dts: ti: k3-j784s4-main: Enable ACSPCIE
 outputs for PCIe interfaces
Message-ID: <69155658-f138-4b10-a6fc-c036ebf65c0d@ti.com>
References: <20250404101234.2671147-1-parth105105@gmail.com>
 <7da470c6-5426-48bf-838a-bc7a5b5dc5db@ti.com>
 <eff95b10-f20e-4abc-b519-36fd80843954@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <eff95b10-f20e-4abc-b519-36fd80843954@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On Sun, Apr 20, 2025 at 08:25:22AM +0530, Siddharth Vadapalli wrote:
> On Sat, Apr 19, 2025 at 06:38:00PM +0530, Kumar, Udit wrote:
> > Thanks for patch, Parth
> > 
> > On 4/4/2025 3:42 PM, Parth Pancholi wrote:
> 
> Hello Parth,
> 
> > > From: Parth Pancholi <parth.pancholi@toradex.com>
> > > 
> > > TI J784S4-based devices, such as the AM69 SoC, provide PCIE_REFCLK outputs
> > > from the SoC, which can be used to clock external PCIe endpoint devices.
> > > Each PCIE_REFCLK output is enabled via the corresponding ACSPCIE clock
> > > buffer, with each buffer supporting two PADs to provide reference clocks
> > > for two associated PCIe instances. The mappings are as follows:
> > >          - PCIe0 -> ACSPCIE1 PAD0
> > >          - PCIe1 -> ACSPCIE0 PAD0
> > >          - PCIe2 -> ACSPCIE1 PAD1
> > >          - PCIe3 -> ACSPCIE0 PAD1
> > > 
> > > This patch enables each ACSPCIE module and its corresponding PADs to ensure
> > > that all PCIE_REFCLK outputs are functional.
> > > 
> > > This change have been tested on an AM69-based custom hardware platform,
> > > where all four PCIe instances (PCIe0, PCIe1, PCIe2, and PCIe3) with the
> > > internal PCIE_REFCLK are utilized with various endpoint devices such as
> > > a WiFi card, NVMe SSD, and PCIe-to-USB bridge.
> > 
> > You can enabling REFCLK to be out as default.
> > 
> > There are few boards, on which this clock is either terminated at test point
> > or not connected at all
> > 
> > Example AM69 board
> > 
> > PCIE_REFCLK2_P_OUT is not connected and PCIE_REFCLK0_P_OUT is terminated at
> > test points.
> > 
> > 
> > IMO, this clock to be enabled where this can be connected to PCIe EP.
> > 
> > Let Siddharth also share his comment, where to enable these clocks board
> > file or SOC file.
> 
> As Udit has pointed out, the reference clock outputs from ACSPCIE
> buffers should be enabled in the board files. I will be updating the
> patch that I had posted for enabling output of ACSPCIE0 PAD0 for PCIe1
> by moving the changes to the board file
> k3-j784s4-j742s2-evm-common.dtsi
> 
> Please update your patch accordingly. The overrides will no longer be
> required as the property will be defined in the board file itself for
> AM69.

I have posted the v3 series [0] which does the following:
1. Introduce the ACSPCIE0 node in the SoC file to allow reuse across:
   J784S4, J742S2 and AM69
2. Update 'pcie1_rc' node in the Board file specific to J784S4 and J742S2
   to drive the reference clock from PAD0 of ACSPCIE0

As a result, the current patch for AM69 can be converted to a series
which does the following:
1. Introduce the ACSPCIE1 node in the SoC file to allow reuse across:
   J784S4, J742S2 and AM69
2. Update 'pcie0_rc', 'pcie1_rc', 'pcie2_rc' and 'pcie3_rc' in the Board
   files to drive the reference clock from PAD0 and PAD1 of both
   ACSPCIE0 and ACSPCIE1

[0]: https://lore.kernel.org/r/20250422123218.3788223-1-s-vadapalli@ti.com/

Regards,
Siddharth.
