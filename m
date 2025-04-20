Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AA7815D1;
	Sun, 20 Apr 2025 03:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745118312; cv=none; b=C7WsdYg8se4Rc/k2BjiC7sa+Tp6/2Ootm30xoN0UYd3jwutJ2czBQ3sXUf9y5PJ4sAxL9tGfdeDJ8igPVW2TAm6idcKtUdlXrJ1bzCwW7jcTqVHX3M5apfTDVIPL/R2ymJl5sI+mDx6hZLkyswFer/TTs7Bhr85vU8NQNYAbeG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745118312; c=relaxed/simple;
	bh=XXPr06KzWm878iqOS5CflCy1fXQr3c2IadOUe/BBCzg=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vGYWG1u0xa+zWv8dRtTvsCPPFlGDIsW1abf+sxiImkpmOsRNvT9FfFfg6X+jl6kSoylnr3z/qNqUQegwNf/EO3FLBgDClBZNbcTXHnB4f+YP/po3ShV7+YH7/O8tYygfXxm3/2yp7SX7x2xehuURVRn9fkKPk9h7GQPLCv5IYGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=ByXi7g+h; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="ByXi7g+h"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53K355Yb602066
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 19 Apr 2025 22:05:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745118306;
	bh=oZ9ziYOK8AMefDH28dk974JiuKuWWef/8ABJn5sihOQ=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=ByXi7g+hVtHcSvxqCy/g9v+ZWvKGpszt+SVj8dJmxQviJbwzMEooOvBSFz8JlktXK
	 PDXMzvizbU6jQqci0CNUejg9I5I9xE92FmxtYnU3ZI4N6kL2Cf/TdEAryEdYDiApR2
	 83qYxQBdfDdG05yRV7aVrRYy0sETCQJd0591fGfE=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53K355og075840
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sat, 19 Apr 2025 22:05:05 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sat, 19
 Apr 2025 22:05:05 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sat, 19 Apr 2025 22:05:05 -0500
Received: from localhost (uda0492258.dhcp.ti.com [10.24.72.113])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53K354MJ060597;
	Sat, 19 Apr 2025 22:05:05 -0500
Date: Sun, 20 Apr 2025 08:35:03 +0530
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: "Kumar, Udit" <u-kumar1@ti.com>
CC: Siddharth Vadapalli <s-vadapalli@ti.com>, <nm@ti.com>, <vigneshr@ti.com>,
        <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <srk@ti.com>
Subject: Re: [PATCH 3/7] arm64: dts: ti: k3-j721e: add ranges for PCIe0 DAT1
 and PCIe1 DAT1
Message-ID: <45e368a9-43ed-4d03-9a03-f60abee698ca@ti.com>
References: <20250417120407.2646929-1-s-vadapalli@ti.com>
 <20250417120407.2646929-4-s-vadapalli@ti.com>
 <f9cb52e2-d211-47b1-9536-3aa81db916c7@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <f9cb52e2-d211-47b1-9536-3aa81db916c7@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On Sat, Apr 19, 2025 at 11:39:55PM +0530, Kumar, Udit wrote:

Hello Udit,

> 
> On 4/17/2025 5:34 PM, Siddharth Vadapalli wrote:
> > The PCIe0 DAT1 and PCIe1 DAT1 are 4 GB address regions in the 64-bit
> > address space of the respective PCIe Controllers. Hence, update the
> > ranges to include them.
> > 
> > Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
> > ---
> >   arch/arm64/boot/dts/ti/k3-j721e.dtsi | 2 ++
> >   1 file changed, 2 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/ti/k3-j721e.dtsi b/arch/arm64/boot/dts/ti/k3-j721e.dtsi
> > index a7f2f52f42f7..4f5d277c97a4 100644
> > --- a/arch/arm64/boot/dts/ti/k3-j721e.dtsi
> > +++ b/arch/arm64/boot/dts/ti/k3-j721e.dtsi
> > @@ -126,6 +126,8 @@ cbass_main: bus@100000 {
> >   			 <0x00 0x10000000 0x00 0x10000000 0x00 0x10000000>, /* PCIe DAT */
> >   			 <0x00 0x64800000 0x00 0x64800000 0x00 0x00800000>, /* C71 */
> >   			 <0x00 0x6f000000 0x00 0x6f000000 0x00 0x00310000>, /* A72 PERIPHBASE */
> > +			 <0x40 0x00000000 0x40 0x00000000 0x00 0x08000000>, /* PCIe0 DAT1 */
> > +			 <0x41 0x00000000 0x41 0x00000000 0x00 0x08000000>, /* PCIe1 DAT1 */
> 
> Do you want to map whole 4GB or just 128M ?

It should have been 4 GB and needs to be updated. Thank you for
reviewing the patch and pointing this out. I will fix this in the next
version of the series.

Regards,
Siddharth.
