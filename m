Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8FE719A;
	Mon, 14 Apr 2025 13:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744635671; cv=none; b=r2RqJuigEmVmFnv+QRNzv9PegCl03MyLg4PmYVl2SF2+JTS+aX6HoM2yIk09r5iGRLU8udaXm1yHOZSR45V5uvqKdQ4k+ALo35z0iiwyG4AwdLC2cl1/w6yHG3ciz2h7PoqIr6zmYE6C/G9paIx7m/hUdGkrYuw9RWhXGX2aeyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744635671; c=relaxed/simple;
	bh=8S+AeCn4r6iTGoohI4XSgodtSjUncIB/ERERwnjLzLc=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XvsWEJIQ83Ipdx0diGh8YGqc6b5zby3jpfqOI38nnCAvr+y0NiIRTV9cOluS5lv31hARh8Td0WAR+5gq624zHhSyo4gix5SAdsLP2JTB4eM7cC2P3XU8CZ1+hFDuGgLV2a5TzAikL8If5oTimsr+XeT8Khnp3H/3Lar5COApTy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=JG4xywC2; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="JG4xywC2"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53ED0tBe2062857
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 14 Apr 2025 08:00:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744635655;
	bh=VX8a/yvVIobMpnRl8a6ZehZn3dZHFdJf7iaKYTSI3Nw=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=JG4xywC2mDpw8S6eXsJk0pcJbPrkdw1+4Am3wGY+xOZsTUmA9lvISe9h64MMGDsAk
	 UR7wYuXzsJtS5GXPWAziYI5ufrbwnoBkuHqY1hYiALh/lN0a3DlXrR71Ic2nnXTGiv
	 H3b6sEMD5uHL8kXUqHuzzR6sPOwOflVgoFHq18jc=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53ED0tKH129700
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 14 Apr 2025 08:00:55 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 14
 Apr 2025 08:00:54 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 14 Apr 2025 08:00:54 -0500
Received: from localhost (uda0492258.dhcp.ti.com [10.24.72.113])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53ED0r0g024564;
	Mon, 14 Apr 2025 08:00:54 -0500
Date: Mon, 14 Apr 2025 18:30:53 +0530
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: Nishanth Menon <nm@ti.com>
CC: Siddharth Vadapalli <s-vadapalli@ti.com>, <vigneshr@ti.com>,
        <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <u-kumar1@ti.com>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <srk@ti.com>
Subject: Re: [PATCH 0/2] J722S: DT Node cleanup for serdes0 and serdes1
Message-ID: <79ef7f50-22d5-4c40-ae28-02bf297ca79c@ti.com>
References: <20250412052712.927626-1-s-vadapalli@ti.com>
 <20250414120930.m7x7zfmyby22urpo@ultimate>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250414120930.m7x7zfmyby22urpo@ultimate>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On Mon, Apr 14, 2025 at 07:09:30AM -0500, Nishanth Menon wrote:

Hello Nishanth,

> On 10:57-20250412, Siddharth Vadapalli wrote:
> > Hello,
> > 
> > This series is based on the following series:
> > https://patchwork.kernel.org/project/linux-arm-kernel/cover/20250408103606.3679505-1-s-vadapalli@ti.com/
> > Based on the discussion in the above series which disabled 'serdes_wiz0'
> > and 'serdes_wiz1' nodes in the SoC file and enabled them in the board
> > file, Udit pointed out that it wasn't necessary to disable 'serdes0' and
> > 'serdes1' in the SoC file anymore, since that is not a working
> > configuration - serdes_wizX enabled and serdesX disabled doesn't work.
> > 
> > Hence, this series aims to cleanup the serdesX nodes after the changes
> > made by the above series.
> > 
> > Regards,
> > Siddharth.
> > 
> > Siddharth Vadapalli (2):
> >   arm64: dts: ti: k3-j722s-main: don't disable serdes0 and serdes1
> >   arm64: dts: ti: k3-j722s-evm: drop redundant status within
> >     serdes0/serdes1
> > 
> >  arch/arm64/boot/dts/ti/k3-j722s-evm.dts   | 2 --
> >  arch/arm64/boot/dts/ti/k3-j722s-main.dtsi | 4 ----
> >  2 files changed, 6 deletions(-)
> > 
> > -- 
> > 2.34.1
> > 
> 
> 
> I do not understand the logic here. serdes cannot operate without wiz
> nodes, correct? why would we leave serdes on by default?

Yes, serdesX requires serdes_wizX, but at the same time, serdesX is the
child node of serdes_wizX. Therefore, without enabling serdes_wizX, we
cannot enable serdesX.

Prior to this series, but with the dependent series at:
https://patchwork.kernel.org/project/linux-arm-kernel/cover/20250408103606.3679505-1-s-vadapalli@ti.com/
applied, the nodes look like:

	serdes_wizX {
		...
		status = "disabled";

		serdesX {
			...
			status = "disabled";
		};
	};

The dependent series fixes 'serdes_wizX' by disabling it in the SoC file
k3-j722s-main.dtsi. But after the fix, we have a 'status = "disabled";'
within the serdesX node which isn't required since:
a) serdes_wizX enabled but serdesX disabled is non-functional and
unusable
b) serdes_wizX disabled in DT implies that serdesX is also disabled

Regards,
Siddharth.
