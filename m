Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D8EE339A1;
	Sun, 20 Apr 2025 02:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745117559; cv=none; b=DQYfQsSpotSdf/GTUQTIPGzW2w/gu4Cul3oPYUTJBwY4PEtUkEqA2u68Hs6FJOofivad+qO3r/bDumGyS53L6n6XH0QDTYLwL64gfXIq8i7wx0GWzaCfVAEJq42AsGuHhPgLZX1BxhATOXIpzD7+B39/dXUJDnduNrsV7vNQc64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745117559; c=relaxed/simple;
	bh=JvmOz/csBGp2dWkXB9B+d5pMF6vdeZQji5HZh5c7hhI=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BrRrb3G+Z8IAGFP+3EQwqIPLl8hBuDpPPOppIsFLz93FbuDOmgOUB2zxh5hwmplCOdEjDiZJ0yWJywBedvBhaPKDMF9hR0IAtUpl1Q/T5fS9iMjuYdh4k1CjFdkAIW5Ir0mhqIi/SIvgKw489Rdnbn3bG9X8dvUY5gTR+PrtGAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=ftcZLP3+; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="ftcZLP3+"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53K2qN2X1306184
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 19 Apr 2025 21:52:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745117543;
	bh=Jdb6fGowj8MOn7lR8S02/xlv03Rnfa4V8/OICBYHGZU=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=ftcZLP3+vwY97bAs2Q/l/sPgdcjcS9lOssOuwRu3/7Ss9oLnyJ86kCMItN0xC1DGU
	 szI5ibIqAi6F58/y6zKC3w09w/HknmTrdC9VMmV58kuwktm53yoO1yxpspyeteuMCx
	 rwxQqG16ZWt7OkKeAw67MO6vTu0HJWGkDs62zI8o=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53K2qNri003700
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sat, 19 Apr 2025 21:52:23 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sat, 19
 Apr 2025 21:52:23 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sat, 19 Apr 2025 21:52:23 -0500
Received: from localhost (uda0492258.dhcp.ti.com [10.24.72.113])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53K2qLDA047520;
	Sat, 19 Apr 2025 21:52:22 -0500
Date: Sun, 20 Apr 2025 08:22:21 +0530
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: "Kumar, Udit" <u-kumar1@ti.com>
CC: Siddharth Vadapalli <s-vadapalli@ti.com>, <nm@ti.com>, <vigneshr@ti.com>,
        <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <srk@ti.com>
Subject: Re: [PATCH v2 RESEND] arm64: dts: ti: k3-j784s4-j742s2-main-common:
 Enable ACSPCIE output for PCIe1
Message-ID: <bc44c867-ef94-4fb2-90fc-6281aa8d195d@ti.com>
References: <20250411121307.793646-1-s-vadapalli@ti.com>
 <a64ebeae-c05b-4228-9714-308d655ca383@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <a64ebeae-c05b-4228-9714-308d655ca383@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On Sat, Apr 19, 2025 at 08:03:49PM +0530, Kumar, Udit wrote:

Hello Udit,

> 
> On 4/11/2025 5:43 PM, Siddharth Vadapalli wrote:
> > The PCIe reference clock required by the PCIe Endpoints connected to the
> > PCIe connector corresponding to the PCIe1 instance of PCIe on J784S4-EVM
> > and J742S2-EVM is driven by the ACSPCIE module. Add the device-tree support
> > for enabling the same.
> 
> Please check once if you want to enable PCIe ref clock on AM69 as well.
> 
> unlike EVM, this clock is terminated on test point.

I will move the changes into the board file
k3-j784s4-j742s2-evm-common.dtsi
and post the next version. Thank you for reviewing the patch.

Regards,
Siddharth.
