Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B8351362;
	Sun, 20 Apr 2025 02:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745117736; cv=none; b=agjlCok2k369dJ2EnU2ZcKSsvG9PkJTMIv4jmjsZ3jFoY8Pn7sTLjb3ioyHlRvUAy48kscC/K2K92mgCInJ5J6IlOhp/9LJY05I0GxqLaSnVVjyKtndo5hCH7Hb64usu53LxRTo6uSavII2Tu+cEqw3bdO2D8FiWSKS45EPlTIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745117736; c=relaxed/simple;
	bh=c3jOrFSkCMgUYHAs7dPrHrWEDL3YTPIEhuxclNShS9E=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CVF8HPEtPnAODuJ1mkoQtvDJ3l45WKreqiGIDxM9VVzssIqdRGXEPxtUwMd0RDm+AQH8K/f3eZUENC/sPVFCck5yxDhALGHWSUD0lHjfJIPVi6coA13njOajz27uqEUs0zgx5p+qXvebW5DX3UgsLI9FgvU3UL1Ls9Ibzkm6uRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=cRq8fDhZ; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="cRq8fDhZ"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53K2tOOQ600937
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 19 Apr 2025 21:55:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745117724;
	bh=lZ9w+jX4HPs2mGR4VxFyzGa0tGlVAKTYcixiaE4r9zI=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=cRq8fDhZFMiOkVpmjEPqJkX1AufaZciDHzGgRKq32dXkRAl2ahzNW0nLbrUVqAQzm
	 awlGn0oMmwIQ1+yhuVWEaDUp9kzDlzMIf/bcedg/T4A55yVvFyDVVdIZAM8e/2ht5E
	 pDz8Mp7NjvFYq17tI4R1DwyjbkN/a43TNuRwrwng=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53K2tOD4069781
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sat, 19 Apr 2025 21:55:24 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sat, 19
 Apr 2025 21:55:23 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sat, 19 Apr 2025 21:55:24 -0500
Received: from localhost (uda0492258.dhcp.ti.com [10.24.72.113])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53K2tMud050184;
	Sat, 19 Apr 2025 21:55:23 -0500
Date: Sun, 20 Apr 2025 08:25:22 +0530
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: "Kumar, Udit" <u-kumar1@ti.com>
CC: Parth Pancholi <parth105105@gmail.com>, Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
        Rob
 Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor
 Dooley <conor+dt@kernel.org>,
        Siddharth Vadapalli <s-vadapalli@ti.com>,
        Parth
 Pancholi <parth.pancholi@toradex.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] arm64: dts: ti: k3-j784s4-main: Enable ACSPCIE
 outputs for PCIe interfaces
Message-ID: <eff95b10-f20e-4abc-b519-36fd80843954@ti.com>
References: <20250404101234.2671147-1-parth105105@gmail.com>
 <7da470c6-5426-48bf-838a-bc7a5b5dc5db@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <7da470c6-5426-48bf-838a-bc7a5b5dc5db@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On Sat, Apr 19, 2025 at 06:38:00PM +0530, Kumar, Udit wrote:
> Thanks for patch, Parth
> 
> On 4/4/2025 3:42 PM, Parth Pancholi wrote:

Hello Parth,

> > From: Parth Pancholi <parth.pancholi@toradex.com>
> > 
> > TI J784S4-based devices, such as the AM69 SoC, provide PCIE_REFCLK outputs
> > from the SoC, which can be used to clock external PCIe endpoint devices.
> > Each PCIE_REFCLK output is enabled via the corresponding ACSPCIE clock
> > buffer, with each buffer supporting two PADs to provide reference clocks
> > for two associated PCIe instances. The mappings are as follows:
> >          - PCIe0 -> ACSPCIE1 PAD0
> >          - PCIe1 -> ACSPCIE0 PAD0
> >          - PCIe2 -> ACSPCIE1 PAD1
> >          - PCIe3 -> ACSPCIE0 PAD1
> > 
> > This patch enables each ACSPCIE module and its corresponding PADs to ensure
> > that all PCIE_REFCLK outputs are functional.
> > 
> > This change have been tested on an AM69-based custom hardware platform,
> > where all four PCIe instances (PCIe0, PCIe1, PCIe2, and PCIe3) with the
> > internal PCIE_REFCLK are utilized with various endpoint devices such as
> > a WiFi card, NVMe SSD, and PCIe-to-USB bridge.
> 
> You can enabling REFCLK to be out as default.
> 
> There are few boards, on which this clock is either terminated at test point
> or not connected at all
> 
> Example AM69 board
> 
> PCIE_REFCLK2_P_OUT is not connected and PCIE_REFCLK0_P_OUT is terminated at
> test points.
> 
> 
> IMO, this clock to be enabled where this can be connected to PCIe EP.
> 
> Let Siddharth also share his comment, where to enable these clocks board
> file or SOC file.

As Udit has pointed out, the reference clock outputs from ACSPCIE
buffers should be enabled in the board files. I will be updating the
patch that I had posted for enabling output of ACSPCIE0 PAD0 for PCIe1
by moving the changes to the board file
k3-j784s4-j742s2-evm-common.dtsi

Please update your patch accordingly. The overrides will no longer be
required as the property will be defined in the board file itself for
AM69.

Regards,
Siddharth.
