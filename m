Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B9A51D6DBC;
	Wed,  9 Apr 2025 10:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744194794; cv=none; b=Er3kc2trdgw97E1Yu5IXzlQsxUc82uIXAOM6nJkrblx7NMChuwaGPHHCIbyMR5fcAIZx8iOf+6Xka6oeevFLIlOOtNtyfNgWe/70Np1ZGh4Q7G5IxPmQDKNsnmoSY9tNtY2b9sN+cIhFhidBMSKgJKXf3WIRDwPGxWW1cXwI3ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744194794; c=relaxed/simple;
	bh=guJicpg/4k5uOCkjPe1EAqL0hgKOVRpZ8dBsfp2VknI=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rXpM6EJjYL831vaLGv1auGfxLf4GG0a2nXD4HyrJ25xKCd8u/lfOG23er3P9faDvZH5z0LyJL1eyK8NLBQwnfxg5NxKPGu368gtSS5wHVGNnciysa3VJ0SVAiKCtO7iyeeBNpADe7Oih1fpkQybJ7BFYPkI+OOOW5udg5QXAPUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=npCcLBSE; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="npCcLBSE"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 539AX57Y953872
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 9 Apr 2025 05:33:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744194785;
	bh=XfJBdscMAuy5EECJZSerJxBpkDTViYEqbsATQalfosg=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=npCcLBSEFWz4wtrE6nTraC7XfFfo6JTsKc9LjoUpIkuthwzoCXpb+MVSiMPU97sSr
	 bnBoi9STFfjYSD5W0s6pgr2cU1HStCmC9nIuIE0Bzd/7CX6BSG9tyw1lBBgzg18dIC
	 8Nih9YBBgJCY5nD776dTh+WbAgtmh3UMVbGVKm/A=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 539AX5ih094021
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 9 Apr 2025 05:33:05 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 9
 Apr 2025 05:33:04 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 9 Apr 2025 05:33:04 -0500
Received: from localhost (uda0497581-hp.dhcp.ti.com [172.24.227.253])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 539AX45A026841;
	Wed, 9 Apr 2025 05:33:04 -0500
Date: Wed, 9 Apr 2025 16:03:03 +0530
From: Manorit Chawdhry <m-chawdhry@ti.com>
To: Michael Walle <mwalle@kernel.org>
CC: "Kumar, Udit" <u-kumar1@ti.com>, Nishanth Menon <nm@ti.com>,
        Vignesh
 Raghavendra <vigneshr@ti.com>,
        Tero Kristo <kristo@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: ti: k3-am62p-j722s: add rng node
Message-ID: <20250409103303.dkrrvp7mdctx32pd@uda0497581-HP>
References: <20250313144155.2382316-1-mwalle@kernel.org>
 <837cba5f-f49e-4cbf-9cbe-2b25f7c9d4b8@ti.com>
 <D8UECOJ2NMCU.3ALYIKSODJ479@kernel.org>
 <1ad2d8c2-6a0d-419d-984d-4974adb0e1f0@ti.com>
 <D8V323NBB32P.3P8H103L83HZK@kernel.org>
 <e2a37e72-d9c8-4329-8a5a-f2c9865cdb5d@ti.com>
 <ea82dc29e93d53b659916f2fed10982b@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ea82dc29e93d53b659916f2fed10982b@kernel.org>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hi Michael,

On 13:09-20250401, Michael Walle wrote:
> Hi Udit,
> 
> > > > > > > --- a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
> > > > > > > [..]
> > > > > > For completeness , this is ok to add this node but
> > > > > > should be kept disabled
> > > > > Shouldn't it be "reserved" then, see [1].
> > > > yes, should be reserved.
> > > > 
> > > > With marking status as reserved.
> > > > 
> > > > Please use Reviewed-by: Udit Kumar <u-kumar1@ti.com>
> > > Thanks.
> > > 
> > > > > > similar to
> > > > > > 
> > > > > > https://github.com/torvalds/linux/blob/master/arch/arm64/boot/dts/ti/k3-j7200-mcu-wakeup.dtsi#L662
> > > > > j784s4, j721e and j721s2 have them enabled. What is the rule here?
> > > > J784s4, j721e and j721s2 SOCs has two TRNG blocks,
> > > > 
> > > > example for j721e, one is used by kernel [0] and another by
> > > > optee [1].
> > > > 
> > > > 
> > > > > You also disable the hwrng in optee in your evm according to [2]:
> > > > > CFG_WITH_SOFTWARE_PRNG=y
> > > > We are planning to use this hardware block by secure firmware.
> > > > 
> > > > Therefore request not to use by optee as well
> > > How will you be able to access the RNG from linux and u-boot? I'm
> > > asking because I'll need it in u-boot for the lwip stack and the
> > > HTTPS protocol.
> > 
> > For now,  If you need TRNG then I can suggest to use optee TRNG (ie
> > build
> > optee with HW TRNG).
> 
> I'll be using an uboot TRNG driver. But how will that work in
> the future if the RNG is used by the secure firmware?

Wondering if this would be of interest to you [0]. I think since this
device only has one TRNG, there has to be a master around and we can
mitigate that from OP-TEE as of now, incase anything changes in future
then the communication channel between OP-TEE and the secure firmware
can be established but currently it's still at work. I think the best
way to go forward is to get the numbers from OP-TEE atm IMHO.

[0]: https://github.com/u-boot/u-boot/blob/master/drivers/rng/optee_rng.c

Regards,
Manorit

> 
> -michael
