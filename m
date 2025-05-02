Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1CC322A4F8;
	Fri,  2 May 2025 12:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746187264; cv=none; b=a6HGjQ6u2V02Hn3tq6wwjPEHmwEjRrUspGu3IbfcqITScu1Jq8XVBg8oSXWblaCN5KTmTnW7GTDfeDqi+Tayd5cq0100eoIHwFIEClj4vgnK0iJ5Y/6mXXL4ZwDElIOTqQOEB9tGau/rKGJS8zNg/19mJFVw2Moltkyd072ttVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746187264; c=relaxed/simple;
	bh=vYjehJTQeTra4Wg2YLqg6IISQamP1T2bBS/IT6QHVXM=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OuEvb86xTjgbBwhQ+EfyasAN/ibBtGn2dnCOn/9/laMoqdo70FcaXON1D0E6XrcvzOAV43gWNuNp1LnMhWgE+5VBaAzlADG0Y2DD/ak7WIWwbUXp36Q41nElvC6S/Y3P10949pMT1JJGGWinBlZX/lOhRgqeUiYwb0kIHpdpO+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=MZuIJTKu; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="MZuIJTKu"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 542C0sxq398062
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 2 May 2025 07:00:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746187254;
	bh=I5AEfoX8egocTPO++2eMREVjlJDtW+Hj61LvDCDccGA=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=MZuIJTKu64T471E1iFKTntrDzK1KknS29QHal0soQiWcyVkbpqDJGKJcHW+ROZdNU
	 vboEA/u7QZkORUni2+Fm1Yu7mD0kxc/vOertf/hDVT3E5TGZJtrMinnlE6NFsHyS5r
	 Ar9rnFpnBnRy8G7yQ3QFVeuzSn3JcJPw4/sh5/NE=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 542C0sAr094309
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 2 May 2025 07:00:54 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 2
 May 2025 07:00:53 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 2 May 2025 07:00:53 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 542C0r7e112887;
	Fri, 2 May 2025 07:00:53 -0500
Date: Fri, 2 May 2025 07:00:53 -0500
From: Nishanth Menon <nm@ti.com>
To: "Vankar, Chintan" <c-vankar@ti.com>
CC: Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Tero Kristo
	<kristo@kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>, <srk@ti.com>,
        <s-vadapalli@ti.com>, <danishanwar@ti.com>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Roger
 Quadros <rogerq@kernel.org>
Subject: Re: [PATCH v4 2/2] arm64: dts: ti: k3-am62p*/k3-j722s: Add
 bootph-all property to enable Ethernet boot
Message-ID: <20250502120053.zvtxmjuybetlk2er@manhood>
References: <20250429072644.2400295-1-c-vankar@ti.com>
 <20250429072644.2400295-3-c-vankar@ti.com>
 <20250429112728.m54x2jwyjykcuus7@unzip>
 <511ef271-ed0b-40b6-9abc-9fce0081d25b@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <511ef271-ed0b-40b6-9abc-9fce0081d25b@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 11:18-20250430, Vankar, Chintan wrote:
> Hello Nishanth,
> 
> On 4/29/2025 4:57 PM, Nishanth Menon wrote:
> > On 12:56-20250429, Chintan Vankar wrote:
> > > Ethernet boot requires CPSW nodes to be present starting from R5 SPL
> > > stage. Add bootph-all property to required nodes to enable Ethernet boot
> > > for AM62P5-SK and J722S-EVM.
> > > 
> > > Reviewed-by: Roger Quadros <rogerq@kernel.org>
> > > Signed-off-by: Chintan Vankar <c-vankar@ti.com>
> > > ---
> > > 
> > > Link to v3:
> > > https://lore.kernel.org/r/20250425051055.2393301-3-c-vankar@ti.com/
> > > 
> > > Changes from v3 to v4:
> > > - No changes.
> > > 
> > >   arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi | 3 +++
> > 
> > Please notice that we have the same problem[1] here as well.
> > 
> > [1] https://lore.kernel.org/all/20250425212427.vvyocc4mmne5g3vq@vividly/
> 
> I have added "bootph-all" property in the common file of J722S-EVM and
> AM62P5-SK since we are enabling Ethernet boot for both the boards. Are
> you referring to move the nodes I have added in
> "k3-am62p-j722s-common-main.dtsi" to respective board files,
> "k3-am62p5-sk.dts" and "k3-j722s-evm.dts".

Yes, bootph properties should not be done in SoC dtsi files unless it is
mandatory for all boot-modes and all boards. That is not the case here
as well. This is the exact comment provided in the previous version for
patch 1 with the expectation that you'd apply it to the rest of your
series.

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
