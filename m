Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3E2B253939;
	Mon, 14 Apr 2025 14:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744641565; cv=none; b=qvmh0rEzBVSSfdZDJYFy8bgHMWXiCOWTRpqUN1c36gzWNg8656xonoMM3E1jzaphNXO9IngxhhH+fkWKvQ/d7XJi/MymKNTMbMsuZ1NUkTPq7foVh8rYnOSFAuBTJBznYAzpNmiUdKlwynUARLCZsY1ODNIa9xQGE317hAdRAr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744641565; c=relaxed/simple;
	bh=dN/mp2yb6Vyluny35NznME5OES8c23IkRVI3W3K2ki0=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZDlf6mhAQreDyzGDKjrEQfYBWpG14l0+enU8N8q1vsn5+MdBd1ecPZm8oeC4Gy5jARN139uJ8HVSppN487DIAOAQnMJXQ0bH3dUQwvjVmB8ElYO6hLpCYH/+nnqsznMc5906scAz5+1gjxKKE0yXv4GkUwrwKjYNWk24/FN6oW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=oBUxOJNF; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="oBUxOJNF"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53EEdH2C2082862
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 14 Apr 2025 09:39:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744641557;
	bh=fEPgO6nsWxDMhcy69FrfMIaR0CqA/3l+hKQM8diis4M=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=oBUxOJNFmj+s6rDyqWI8q+/h0cMaEO62LC5qknhy/X9b5623vfJJLxPQ47iI1Gu+f
	 elar/5WqF2HWWwxj6A/hMQWJuX4e0jVL8hg5f8pjENJhEPkJaN54+G6AAyFrKioUXY
	 6nSkqGqbhtKrAlmiNl6QjqoPxWuDSJ6Pq51c468U=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53EEdHo7089201
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 14 Apr 2025 09:39:17 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 14
 Apr 2025 09:39:16 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 14 Apr 2025 09:39:16 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53EEdGVp005436;
	Mon, 14 Apr 2025 09:39:16 -0500
Date: Mon, 14 Apr 2025 09:39:16 -0500
From: Nishanth Menon <nm@ti.com>
To: Siddharth Vadapalli <s-vadapalli@ti.com>
CC: <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <u-kumar1@ti.com>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>
Subject: Re: [PATCH 0/2] J722S: DT Node cleanup for serdes0 and serdes1
Message-ID: <20250414143916.zhskssezbffmvnsz@dragonfly>
References: <20250412052712.927626-1-s-vadapalli@ti.com>
 <20250414120930.m7x7zfmyby22urpo@ultimate>
 <79ef7f50-22d5-4c40-ae28-02bf297ca79c@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <79ef7f50-22d5-4c40-ae28-02bf297ca79c@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 18:30-20250414, Siddharth Vadapalli wrote:
> On Mon, Apr 14, 2025 at 07:09:30AM -0500, Nishanth Menon wrote:
> 
> Hello Nishanth,
> 
> > On 10:57-20250412, Siddharth Vadapalli wrote:
> > > Hello,
> > > 
> > > This series is based on the following series:
> > > https://patchwork.kernel.org/project/linux-arm-kernel/cover/20250408103606.3679505-1-s-vadapalli@ti.com/
> > > Based on the discussion in the above series which disabled 'serdes_wiz0'
> > > and 'serdes_wiz1' nodes in the SoC file and enabled them in the board
> > > file, Udit pointed out that it wasn't necessary to disable 'serdes0' and
> > > 'serdes1' in the SoC file anymore, since that is not a working
> > > configuration - serdes_wizX enabled and serdesX disabled doesn't work.
> > > 
> > > Hence, this series aims to cleanup the serdesX nodes after the changes
> > > made by the above series.
> > > 
> > > Regards,
> > > Siddharth.
> > > 
> > > Siddharth Vadapalli (2):
> > >   arm64: dts: ti: k3-j722s-main: don't disable serdes0 and serdes1
> > >   arm64: dts: ti: k3-j722s-evm: drop redundant status within
> > >     serdes0/serdes1
> > > 
> > >  arch/arm64/boot/dts/ti/k3-j722s-evm.dts   | 2 --
> > >  arch/arm64/boot/dts/ti/k3-j722s-main.dtsi | 4 ----
> > >  2 files changed, 6 deletions(-)
> > > 
> > > -- 
> > > 2.34.1
> > > 
> > 
> > 
> > I do not understand the logic here. serdes cannot operate without wiz
> > nodes, correct? why would we leave serdes on by default?
> 
> Yes, serdesX requires serdes_wizX, but at the same time, serdesX is the
> child node of serdes_wizX. Therefore, without enabling serdes_wizX, we
> cannot enable serdesX.
> 
> Prior to this series, but with the dependent series at:
> https://patchwork.kernel.org/project/linux-arm-kernel/cover/20250408103606.3679505-1-s-vadapalli@ti.com/
> applied, the nodes look like:
> 
> 	serdes_wizX {
> 		...
> 		status = "disabled";
> 
> 		serdesX {
> 			...
> 			status = "disabled";
> 		};
> 	};
> 
> The dependent series fixes 'serdes_wizX' by disabling it in the SoC file
> k3-j722s-main.dtsi. But after the fix, we have a 'status = "disabled";'
> within the serdesX node which isn't required since:
> a) serdes_wizX enabled but serdesX disabled is non-functional and
> unusable
> b) serdes_wizX disabled in DT implies that serdesX is also disabled


Can we handle all of this in one series instead of two series?

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
