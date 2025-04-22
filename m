Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0639827CB21;
	Tue, 22 Apr 2025 12:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745325477; cv=none; b=UDGpkaUVoz/7FHINyhXD6TAJO5hZJcFp8p+QU/cuAMEpjYGua1p9APOPTllcWFABaUpsxYybh2kL98UyKL9WSmOtMUPz5o2VtDBwHJxooiNCNBQdApUzJ/BGq5KaslvPoZFyG6sLNREfxMzBnAKuc9K2PwIN9RMK6dNhLkRcHps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745325477; c=relaxed/simple;
	bh=9LWctCLAOk2V79wAkjedn9g538XpW9ER6OkbM2hGwVg=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WMG+RCHMyywqWfTUJH1Vhu4jbSbHdFV4vOp4Q+ACeKejfaHGJ1p8mZDx6X/ofJWn55jLbSeUCbmAuNuTupMIdQ/4l0GPUnHYeQQMeehwjQH1zqcGBsJpxT7A6AfqATAqgolrZwhwNhGWz5CZ9ZzTOvJYyYIorhdAQzJB3D0A1TU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=nzTvVaGa; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="nzTvVaGa"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53MCbmQX1942937
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 22 Apr 2025 07:37:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745325468;
	bh=LBqzgSLKnZOtYJIVdn3cY8acSWUiPCLaVMtrkuGzAUI=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=nzTvVaGaRA4JlcEZwe194GvVcw1nFB14VP1ecyYbblLDxmNKbwHf/tZIOOWjD/F1b
	 DDZ5aeJSEklX+WuZHW4uk06SR8eRm2DjMGcc4S+2gu6/XFrbfeZk8gHilADXjtpo+/
	 vwqR7UuB1j9Gv2PE/YB8Y5BpxQScvQA3Iq3kml2Q=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53MCbmi5017900
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 22 Apr 2025 07:37:48 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 22
 Apr 2025 07:37:47 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 22 Apr 2025 07:37:48 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53MCbm6K005363;
	Tue, 22 Apr 2025 07:37:48 -0500
Date: Tue, 22 Apr 2025 07:37:48 -0500
From: Nishanth Menon <nm@ti.com>
To: Judith Mendez <jm@ti.com>
CC: "Kumar, Udit" <u-kumar1@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Moteen Shah <m-shah@ti.com>
Subject: Re: [PATCH v2 1/5] arm64: dts: ti: k3-am6*: Set eMMC clock parents
 to default
Message-ID: <20250422123748.ugkk2pzp54vzmyii@acorn>
References: <20250417233040.3658761-1-jm@ti.com>
 <20250417233040.3658761-2-jm@ti.com>
 <8f9aad2c-8e51-409e-be90-21230a53a4cf@ti.com>
 <7bc92282-6ce3-4ae4-8eef-897df992487f@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7bc92282-6ce3-4ae4-8eef-897df992487f@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 09:36-20250421, Judith Mendez wrote:
> Hi Udit,
> 
> On 4/19/25 10:00 AM, Kumar, Udit wrote:
> > 
> > On 4/18/2025 5:00 AM, Judith Mendez wrote:
> > > Set eMMC clock parents to the defaults which is MAIN_PLL0_HSDIV5_CLKOUT
> > > for eMMC. This change is necessary since DM is not implementing the
> > > correct procedure to switch PLL clock source for eMMC and we have a
> > > non-glich-free mux. To remove any potential issues, lets switch back to
> > > the defaults.
> > 
> > IMO, we need to fix DM  if not then documentation [0] .
> 
> DM cannot be fixed for only one IP and documentation says what clock
> parents are supported, it does not have to say what are the issues
> that come with using a specific clock parent.

As I understand the arasan IP requirement is that the IP must be held in
reset while the clock is switched, which is not reasonable to implement
given decoupled systems like DM and Linux OS.

> 
> > 
> > Then only this patch is ok because as per document [0]
> > 
> > removed clock by this patch is valid parent for eMMC.
> 
> The clock parent currently set is a valid parent, but we have non-
> glitch-free muxes and to avoid any potential issues with these, we
> should switch back to the defaults. It seems like we randomly switched
> from the default for no good reason and it has been copy paste per
> platforms since then, so we are switching back to the defaults now.
> 
> ~ Judith
> 
> > 
> > [0] https://software-dl.ti.com/tisci/esd/latest/5_soc_doc/j722s/clocks.html
> > 
> > Thanks
> > 
> > Udit
> > 
> > > 
> > > Fixes: c37c58fdeb8a ("arm64: dts: ti: k3-am62: Add more peripheral
> > > nodes")
> > > Fixes: d3ae4e8d8b6a ("arm64: dts: ti: k3-am62a-main: Add sdhci0
> > > instance")
> > > Fixes: b5080c7c1f7e ("arm64: dts: ti: k3-am62p: Add nodes for more IPs")

Please follow ./Documentation/process/stable-kernel-rules.rst - this is
easier to backport if these were to be split into 3 different patches.
Please do not forget to add Cc: stable@vger.kernel.org as per the rules
as well.

> > > Signed-off-by: Judith Mendez <jm@ti.com>
> > > ---
> > >   arch/arm64/boot/dts/ti/k3-am62-main.dtsi               | 2 --
> > >   arch/arm64/boot/dts/ti/k3-am62a-main.dtsi              | 2 --
> > >   arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi | 2 --
> > >   3 files changed, 6 deletions(-)
> > > 
> > > [..]
> 

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
