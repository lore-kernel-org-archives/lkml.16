Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F19BD1EB2F;
	Thu, 17 Apr 2025 12:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744893267; cv=none; b=pJNWv3QnX6vn4CAD+OoURHg5WezmSULjNISycDO9EeccMggkPMsXKrIILkXmKSJZHoS7f0/ZFiyqGily6vl2lNSpUgViq6vtUBvEH3wDkW/ZCopSEIoAKcYJUA3zcBXXu/A6U+PerMSGATxgF4JpOFLJob4GR/DA3d3E7UVShd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744893267; c=relaxed/simple;
	bh=ewChGJa/pDA64ON1Mo3kLbC08r17HE39rm6/OVxBAes=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J88VQMKhK1sRUDwOMPjX90UPeye+1oI3vzqt3rlfPMzsH7bcMWxUsejsbdASL29BFJu8nIEB3LVwuxLCk2uMicYxvixiETNAQDqAdhQRZ71fvExFdwLixFb+B2bdZurBTIoMO+nu1Gv67lVnRR2zbZgjBBK0e5aCOiixvyK8NXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=LAnlnd8E; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="LAnlnd8E"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53HCYJGR012975
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 17 Apr 2025 07:34:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744893259;
	bh=Zv6Sg9oriYz3cRSUGKqGu91FELTk5ukWJXCsL2561ks=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=LAnlnd8EbLuvdd7fbUuERIsjsKa4/3mayZu1noNOj+C1FaX9fijMPbi9j3ORA9zR2
	 GPQibpOCT5bQolJTqUYgIZ2fZOqd3RvvIxYbxMzztSjOPL8W2jIsyiKfqdA8/Jb31g
	 tN7Es/8joOFgvkaPwMhM6b3mOLLkIx1cAznw6Uuk=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53HCYJKT095064
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 17 Apr 2025 07:34:19 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 17
 Apr 2025 07:34:19 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 17 Apr 2025 07:34:19 -0500
Received: from localhost (uda0492258.dhcp.ti.com [10.24.72.113])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53HCYICZ038854;
	Thu, 17 Apr 2025 07:34:18 -0500
Date: Thu, 17 Apr 2025 18:04:17 +0530
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: Nishanth Menon <nm@ti.com>
CC: Siddharth Vadapalli <s-vadapalli@ti.com>, <vigneshr@ti.com>,
        <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <u-kumar1@ti.com>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <srk@ti.com>
Subject: Re: [PATCH 0/2] J722S: DT Node cleanup for serdes0 and serdes1
Message-ID: <c952d708-fd56-408b-ad16-15c1c013c396@ti.com>
References: <20250412052712.927626-1-s-vadapalli@ti.com>
 <20250414120930.m7x7zfmyby22urpo@ultimate>
 <79ef7f50-22d5-4c40-ae28-02bf297ca79c@ti.com>
 <20250414143916.zhskssezbffmvnsz@dragonfly>
 <4106b4b8-6ca7-400f-8862-a45214284326@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <4106b4b8-6ca7-400f-8862-a45214284326@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On Mon, Apr 14, 2025 at 08:13:19PM +0530, Siddharth Vadapalli wrote:
> On Mon, Apr 14, 2025 at 09:39:16AM -0500, Nishanth Menon wrote:
> > On 18:30-20250414, Siddharth Vadapalli wrote:
> > > On Mon, Apr 14, 2025 at 07:09:30AM -0500, Nishanth Menon wrote:
> > > 
> > > Hello Nishanth,
> > > 
> > > > On 10:57-20250412, Siddharth Vadapalli wrote:
> > > > > Hello,
> > > > > 
> > > > > This series is based on the following series:
> > > > > https://patchwork.kernel.org/project/linux-arm-kernel/cover/20250408103606.3679505-1-s-vadapalli@ti.com/
> > > > > Based on the discussion in the above series which disabled 'serdes_wiz0'
> > > > > and 'serdes_wiz1' nodes in the SoC file and enabled them in the board
> > > > > file, Udit pointed out that it wasn't necessary to disable 'serdes0' and
> > > > > 'serdes1' in the SoC file anymore, since that is not a working
> > > > > configuration - serdes_wizX enabled and serdesX disabled doesn't work.
> > > > > 
> > > > > Hence, this series aims to cleanup the serdesX nodes after the changes
> > > > > made by the above series.
> > > > > 
> > > > > Regards,
> > > > > Siddharth.
> > > > > 
> > > > > Siddharth Vadapalli (2):
> > > > >   arm64: dts: ti: k3-j722s-main: don't disable serdes0 and serdes1
> > > > >   arm64: dts: ti: k3-j722s-evm: drop redundant status within
> > > > >     serdes0/serdes1
> > > > > 
> > > > >  arch/arm64/boot/dts/ti/k3-j722s-evm.dts   | 2 --
> > > > >  arch/arm64/boot/dts/ti/k3-j722s-main.dtsi | 4 ----
> > > > >  2 files changed, 6 deletions(-)
> > > > > 
> > > > > -- 
> > > > > 2.34.1
> > > > > 
> > > > 
> > > > 
> > > > I do not understand the logic here. serdes cannot operate without wiz
> > > > nodes, correct? why would we leave serdes on by default?
> > > 
> > > Yes, serdesX requires serdes_wizX, but at the same time, serdesX is the
> > > child node of serdes_wizX. Therefore, without enabling serdes_wizX, we
> > > cannot enable serdesX.
> > > 
> > > Prior to this series, but with the dependent series at:
> > > https://patchwork.kernel.org/project/linux-arm-kernel/cover/20250408103606.3679505-1-s-vadapalli@ti.com/
> > > applied, the nodes look like:
> > > 
> > > 	serdes_wizX {
> > > 		...
> > > 		status = "disabled";
> > > 
> > > 		serdesX {
> > > 			...
> > > 			status = "disabled";
> > > 		};
> > > 	};
> > > 
> > > The dependent series fixes 'serdes_wizX' by disabling it in the SoC file
> > > k3-j722s-main.dtsi. But after the fix, we have a 'status = "disabled";'
> > > within the serdesX node which isn't required since:
> > > a) serdes_wizX enabled but serdesX disabled is non-functional and
> > > unusable
> > > b) serdes_wizX disabled in DT implies that serdesX is also disabled
> > 
> > 
> > Can we handle all of this in one series instead of two series?
> 
> The idea behind splitting it was that the dependent series is a "Fix":
> - Fix to follow the convention of disabling nodes in SoC file and enable
>   them in the board file.
> while the current series is a "cleanup":
> - No fixes are introduced by this series and therefore it doesn't
>   require a backport.
> 
> I can squash the two series and post them as a v2 if that helps.

I have squashed the series and have posted it at:
https://lore.kernel.org/r/20250417123246.2733923-1-s-vadapalli@ti.com

Regards,
Siddharth.
