Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5973915B554;
	Mon,  7 Apr 2025 21:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744061765; cv=none; b=TQMQ1t34Wn/oA9YVvkmsX33ANFxR1c8f4NDhUlwrdQxsjZXddN8KSDvm9h8YkHL1L8bOQSKxZDZYYvN+Co5zKtMZoN+CvAhG+2fKQMNgTx4G7c4NBWV++UKl1K+u4X6UvnTrQpE/JN/BTO2ASXQNlx1Q2f2TpBIYzmLQ5QWHHTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744061765; c=relaxed/simple;
	bh=a5b0WvpQMoPPq7yfGlCcyxkDNvmGvof8hOvH9QCyHBc=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D7FaEfAHDP0B2AwvRvUPzfoI0cRA/ncqCrFPiXp1c+PB74MH6OIHZQUGZUGyQRXmc6BvFn1EKhwkSQfy+eSMJTj3GXm/emSTdPRDmvzq2HKm/nJ61uS4x1H8iXvSKH6KRliI9gu8I9EtDAPOl6OLesA2Kg0pMVAcfFYk8iNB1K0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=sZ0VMVL6; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="sZ0VMVL6"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 537LZt2v978209
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 7 Apr 2025 16:35:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744061755;
	bh=DPD3Ics/DkuZFkrnuOdnN9s5GAjNkBL8wq880h+djCY=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=sZ0VMVL6qUcE0R9qxNs9WN3+lpi5QfJk+p52qAptEyoKdSoTP0AgLJ5Mq3SRisJyi
	 K+nNtuzSA9+b14vdJRkdxzMSRdCjGTvIOlLP0CZCYLk26ln4Bg8dU9qSiu0i0zeVDd
	 7gsn0bse2V+mLoab/I8D6+07u2oGkq00x3us+GZE=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 537LZtQj056827
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 7 Apr 2025 16:35:55 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 7
 Apr 2025 16:35:54 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 7 Apr 2025 16:35:54 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 537LZseS016539;
	Mon, 7 Apr 2025 16:35:54 -0500
Date: Mon, 7 Apr 2025 16:35:54 -0500
From: Bryan Brattlof <bb@ti.com>
To: Andrew Davis <afd@ti.com>
CC: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        Tero
 Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 2/3] arm64: dts: ti: k3-am62l: add initial
 infrastructure
Message-ID: <20250407213554.hzfwic55j5y335jz@bryanbrattlof.com>
X-PGP-Fingerprint: D3D1 77E4 0A38 DF4D 1853 FEEF 41B9 0D5D 71D5 6CE0
References: <20250407-am62lx-v4-0-ce97749b9eae@ti.com>
 <20250407-am62lx-v4-2-ce97749b9eae@ti.com>
 <d6ba8b6b-bbd8-4f55-a0a8-347bd15784f0@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <d6ba8b6b-bbd8-4f55-a0a8-347bd15784f0@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On April  7, 2025 thus sayeth Andrew Davis:
> On 4/7/25 10:34 AM, Bryan Brattlof wrote:
> > From: Vignesh Raghavendra <vigneshr@ti.com>
> > 
> > Add the initial infrastructure needed for the AM62L. ALl of which can be
> > found in the Technical Reference Manual (TRM) located here:
> > 
> >      https://www.ti.com/lit/pdf/sprujb4
> > 
> > Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
> > Signed-off-by: Bryan Brattlof <bb@ti.com>
> > ---
> > Changes in v3:
> >   - Added more nodes now that the SCMI interface is ready
> > 
> > Changes in v1:
> >   - switched to non-direct links to TRM updates are automatic
> >   - fixed white space indent issues with a few nodes
> >   - separated out device tree bindings
> > ---
> >   arch/arm64/boot/dts/ti/Makefile              |   3 +
> >   arch/arm64/boot/dts/ti/k3-am62l-main.dtsi    | 672 +++++++++++++++++++++++++++
> >   arch/arm64/boot/dts/ti/k3-am62l-thermal.dtsi |  19 +
> >   arch/arm64/boot/dts/ti/k3-am62l-wakeup.dtsi  | 144 ++++++
> >   arch/arm64/boot/dts/ti/k3-am62l.dtsi         | 121 +++++
> >   arch/arm64/boot/dts/ti/k3-am62l3.dtsi        |  67 +++
> >   arch/arm64/boot/dts/ti/k3-pinctrl.h          |   2 +
> >   7 files changed, 1028 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
> > +

...

> > +	fss: bus@fc00000 {
> > +		compatible = "simple-bus";
> > +		reg = <0x00 0x0fc00000 0x00 0x70000>;
> 
> The reg node does nothing for a "simple-bus", put the used
> register ranges in the ranges node, see how we did for some
> other devices:
> 
> https://lore.kernel.org/all/20240326205920.40147-2-afd@ti.com/
> 

As sweet. Thanks for the link. I'll get this updated

~Bryan
