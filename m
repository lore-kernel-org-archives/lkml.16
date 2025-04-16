Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B5021FCFF8;
	Wed, 16 Apr 2025 14:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744814534; cv=none; b=oCHxZSPcrYZBqcBmfNt/aHA06yAHsQ7D6Z2bVFiQeLt8NoqOXLN8y+/AHisLM8LojZXs9iOgiGVe/Np/Sui47wVHrRsxkTNBBmfG5M9yoG0BYqXl35Qc9OGJwhg/0rPgUEDHJg2Rrf9jfgV4QcFl4wVWfxKbgTbMtIvHRdKnNhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744814534; c=relaxed/simple;
	bh=WjJ/D8M8D8sGQPgYLXPhFqo8sie98FkpbdJ3xoMIPDk=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VphMtMrty5OF/CppWXtFKpN0xZ/SVic9dfAIXtaz4Y4ebqvKKquEqTpZMoWC0gWdODyn18SY2LDEpv+Tx4aIv3O5xTUy0vPv5v6jHWtdQqWgMah9aPNJMBDJ6SIYd7JZaxedonCk/mVUtNw5SID8aOSwZlsEV7fE1OoHRqW8fNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=ESC/IdM4; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="ESC/IdM4"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53GEg3RV370663
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 16 Apr 2025 09:42:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744814523;
	bh=ZXKZ/QBlw91XJiqZtti7QrRoymu1XI2lK56ZzBX/0vg=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=ESC/IdM4GeB5oosu399uiU+IJn4WFdbS/hDnBUdqritQRt0r6NsU8UfRX7iKbaKYj
	 kR2bIvCy5bOs0rtBBMAF1PRld/H5lHOMnYN1IEyp7O2YSdKlWaP8QIhARjzwW2Ok8K
	 KcA0D37wGz2g/X2Wrnyfn9PPFXispMrgvwPKGfq8=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53GEg3ZX024384
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 16 Apr 2025 09:42:03 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 16
 Apr 2025 09:42:02 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 16 Apr 2025 09:42:02 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53GEg2SE061927;
	Wed, 16 Apr 2025 09:42:02 -0500
Date: Wed, 16 Apr 2025 09:42:02 -0500
From: Bryan Brattlof <bb@ti.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
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
Message-ID: <20250416144202.4bmm566iqaz6adzo@bryanbrattlof.com>
X-PGP-Fingerprint: D3D1 77E4 0A38 DF4D 1853 FEEF 41B9 0D5D 71D5 6CE0
References: <20250407-am62lx-v4-0-ce97749b9eae@ti.com>
 <20250407-am62lx-v4-2-ce97749b9eae@ti.com>
 <20250409-calculating-hungry-mosquito-f8cfeb@shite>
 <20250411182608.cpxr357humjq6ln7@bryanbrattlof.com>
 <859a4fc2-45f5-4d72-9727-7979e4c15bd5@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <859a4fc2-45f5-4d72-9727-7979e4c15bd5@kernel.org>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On April 12, 2025 thus sayeth Krzysztof Kozlowski:
> On 11/04/2025 20:26, Bryan Brattlof wrote:
> >>> +
> >>> +		usb0_phy_ctrl: syscon@45000 {
> >>> +			compatible = "ti,am62-usb-phy-ctrl", "syscon";
> >>> +			reg = <0x45000 0x4>;
> >>> +			bootph-all;
> >>> +		};
> >>> +
> >>> +		usb1_phy_ctrl: syscon@45004 {
> >>> +			compatible = "ti,am62-usb-phy-ctrl", "syscon";
> >>> +			reg = <0x45004 0x4>;
> >>
> >> No, you do not get syscon per register. The entire point of syscon is to
> >> collect ALL registers. Your device is the syscon, not a register.
> >>
> > 
> > My understanding from [0] was that we would need to break this up into 
> > smaller syscon nodes because the alternative would be to mark the entire 
> > region as a syscon and every other node using it would need to use it's 
> > base + offset which was kinda undesirable especially for the small 
> > number of drivers that need data from this region.
> > 
> >     a-device {
> >         clocks = <&epwm_tbclk 0>;
> 
> 
> Hm? That's how you use the syscon, so how it can be undesirable?
> 
> Anyway, one register is not a device, so no device node per register.
> 
> In the link you provided I was repeating the same, so you got same
> review in multiple places.
> 

Interesting. The way I read that thread was the opposite and it's why we 
did this for the 62, 62A, and 62P devices. I mainly say it's unfortunate 
because if we have a block of miscellaneous registers there's no clear 
guidance on how big or small that range can or should be and we still 
need to encode the offset to that exact register.

By labeling each register we at least have the opportunity to describe 
each register and if they are even used.

~Bryan
