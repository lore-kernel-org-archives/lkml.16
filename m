Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13DCC3FC2;
	Fri, 30 May 2025 04:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748580997; cv=none; b=K2LwcZ29Wo8pEeirY4iSaN7NlYvIe7VwEBE3sBGVKFsgY1P1uV+E2dfU/wVey4R9hMmu+mew03VJYitSKSb2qqUMgKHN8x5X4Flo7eHQh+tt/C8Be7SEfB0T1YJk1cROsSI3EHic92OBDS+uilXaV8zELCgHRDzF4QGIUlLDK5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748580997; c=relaxed/simple;
	bh=d8qeTcx8Dtn6UvF1DkcYO97rxfLSomDcYySH4FK1nLo=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J0YLrVP6eIhCVz2d3bU/uk4S1RwOfSEr3eRO8yCd+iQJaDq1seAFWuFmNdL+Cv7sJau8LPBOHc84S85z/gg1tzbN7fpcplTyy59mXCCUZ4TLecuMdbKd0Bf4AWiDmgp1LpDZH6YGuPOQUhD9q51PFU2g4fkWLDrRdgWP6Av7zVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=hD5a5PJP; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="hD5a5PJP"
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 54U4uUDJ3690456;
	Thu, 29 May 2025 23:56:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1748580990;
	bh=GYZfOBCMU4FoxcQrKpFL+3hZqE6akIUbeovKq52WWWU=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=hD5a5PJPJIZXd8sFr1BtYsRbzG3da5X9QPAn/OA/Vb1UkJqJvtQkxXLUicxheNc73
	 2xDA8AzhtTilRu85J924xksMb5kx/QOGowxeodxXIwp6L+WgskYrkqFJM3oykRkdqi
	 yRDV6XOx1tsEThm6obbTtJpT67zBLo9xngSdXkyY=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 54U4uUQj635168
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 29 May 2025 23:56:30 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 29
 May 2025 23:56:29 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 29 May 2025 23:56:29 -0500
Received: from localhost (uda0492258.dhcp.ti.com [172.24.227.169])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 54U4uTBo2610556;
	Thu, 29 May 2025 23:56:29 -0500
Date: Fri, 30 May 2025 10:26:28 +0530
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Siddharth Vadapalli <s-vadapalli@ti.com>, <nm@ti.com>, <vigneshr@ti.com>,
        <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <srk@ti.com>
Subject: Re: [PATCH 13/13] arm64: dts: ti: k3-j721s2-mcu-wakeup: Disable
 "mcu_cpsw" in the SoC file
Message-ID: <62c3a4e6-ffa3-4fc4-a0b1-c8b4bbec684b@ti.com>
References: <20250529133443.1252293-1-s-vadapalli@ti.com>
 <20250529133443.1252293-14-s-vadapalli@ti.com>
 <4d2eeedb-0b3e-485c-ba15-82fb78fca4c7@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <4d2eeedb-0b3e-485c-ba15-82fb78fca4c7@kernel.org>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On Thu, May 29, 2025 at 03:38:10PM +0200, Krzysztof Kozlowski wrote:
> On 29/05/2025 15:34, Siddharth Vadapalli wrote:
> > Following the existing convention of disabling nodes in the SoC file and
> > enabling only the required ones in the board file, disable "mcu_cpsw" node.
> > 
> > Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
> > ---
> >  arch/arm64/boot/dts/ti/k3-j721s2-mcu-wakeup.dtsi | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> Really all of this is fake split. One line per commit.

I split the patches into Board and SoC specific changes. I was following
the split used when we add new device-tree nodes:
- Add the node to SoC file in the first commit
- Enable it in the Board file in the next commit

Since this is a cleanup, the above split may not be required and I
understand that. I will squash the changes in the next version of this
series.

Thank you for your feedback.

Regards,
Siddharth.
