Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E45E126D4E7;
	Fri,  9 May 2025 06:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746773288; cv=none; b=sj2slf7kHSbgA+yXp+BTELh7GjmX30Xle+D7SeI8z3XcRF+h28JjRbhmPJHW7HW1p3vr6RUdbyr5P+x2zN7UpQCy5ek3Ex7CxnV0UIKPuX5+MfWchqTeyui5kdhpOC3og9+hNjnCTEEJZAbD4iRG2A9Jc2ncwEkahQ0t9qGA0Ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746773288; c=relaxed/simple;
	bh=ESJOOpRDytjC3x/YAXpHHqQZnAge3a/YGaZJeN2c9PE=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dWdIAEyWJsvh1YhSzEPUcia3yBx2K2qiKVoVjKLGw0ulF4qko20Q4ER4xyikXBJ2YMjYzxoop52/i2y7mIyd0GvrJk0zPmlYaaFWgodNvoDid7lgQVIouD6oCG28zqXm4DvALUwrqcC2E3qtWNRybYFlB6aY5N4otbsZM4gFG5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=IYY8x33g; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="IYY8x33g"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 5496lrAE1327694
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 9 May 2025 01:47:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746773273;
	bh=eK58TLlJnYs4DpvxbqSmQLRIluJEvRYUiOzTtDtI3+c=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=IYY8x33gKiwejVo0tvlfS8U5sVeupJ9RbHkt+/GPceStVRaZ93dV8Grw0nF+ZRC2+
	 Cn942mk1WhviXOHInDyPkrUnVVSBieUosnHfgxLinhlU7WDoUcvMdgK3ite0zaiRtE
	 I8/514C+CT/sspGPoW6+oMt95CgnxXmUKADnCQI0=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 5496lrrQ014593
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 9 May 2025 01:47:53 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 9
 May 2025 01:47:53 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 9 May 2025 01:47:53 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5496lrlj014571;
	Fri, 9 May 2025 01:47:53 -0500
Date: Fri, 9 May 2025 01:47:53 -0500
From: Nishanth Menon <nm@ti.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
CC: Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: ti: k3-am625-sk: Add power/temperature
 sensors
Message-ID: <20250509064753.4ntxyozwlebnskod@compound>
References: <20250505-am625-sk-sensors-v1-1-688fb928b390@pengutronix.de>
 <20250507120104.4mhuaabe5auukarn@banter>
 <aB2hdA8mfKGlk8d8@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aB2hdA8mfKGlk8d8@pengutronix.de>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 08:32-20250509, Sascha Hauer wrote:
> Hi Nishanth,
> 
> On Wed, May 07, 2025 at 07:01:04AM -0500, Nishanth Menon wrote:
> > On 15:24-20250505, Sascha Hauer wrote:
> > > The AM625-SK has six power sensors and two temperature sensors connected
> > > to I2C. Add them to the device tree.
> > > 
> > > Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> > > ---
> > > The AM625-SK has six power sensors and two temperature sensors connected
> > > to I2C. Add them to the device tree.
> > 
> > Sascha,
> > 
> > I suggest making this as overlay. The reason is as follows: AM625-SK
> > among other TI evms do have automated power measurement capability from
> > XDS110 (accessible via USB port for jtag - appears as a rudimentary
> > menu option). The way this works is that it uses TM4C1294NCPDT to use
> > I2C commands to control the INA226/231 depending on the evm.
> > 
> > This firmware should be flashed by default on production boards (if
> > not, starting up CCS[1], autodetects older firmware and updates - at
> > least to my understanding) - by the way, this firmware also does test
> > automation, such as boot mode switch control, reset control etc.
> > 
> > This is the primary framework meant to be used by test automation and
> > indeed it is the default inside TI.
> > 
> > Challenge here is this: if we make this default in Linux, the test
> > automation system configures the INA226/231 in a different sampling
> > mode depending on usecase etc Vs what Linux does (even though the
> > shunt and the bus voltage for a given INA is the same). And just like
> > Linux, the firmware power measurement logic has changed over the
> > years.
> > 
> > Anyways, while I know that the SoC and TM4C can both handle
> > multi-master, the challenge is the same INA controlled and
> > mix-configured by two masters (and there is no synchronization between
> > the two).
> > 
> > To avoid this entire conflict and headache, I suggest adding it as
> > overlay that can be applied depending on the preference of measurement
> > desired.
> 
> Thanks for this explanation. I'll go for the overlay then.

Thanks. do check if the default defconfig needs to be updated as well -
i didn't get a chance to cross verify - will be good to ensure deferred
devices are 0. if something to be enabled, do enable them as modules,
i'd gladly pull it in.

just a headsup - i plan on closing the window today and pick last set of
patches and tag on monday. a bit tight given the window currently..

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
