Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3215917BA5;
	Thu, 26 Jun 2025 11:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750937629; cv=none; b=Z9qHkNDDo9mPukxlYulBRBfpaddU0lnISMFMD+ZW1+dh/g/3yyJd+H+WbzyEdQpL6XGTPeLpoGmHONgTHOM7B8UvnB39u72bpgHfacmXZiJWOS94KBpgIlTuv3JYVJ4p6cHNSAqLE3nEiC9Tl45Mv31ge/bKuvLzICGpwtVBBHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750937629; c=relaxed/simple;
	bh=15rPUvqiNAzMi56U9xwGLzB7c72QUtMMe+pEi8XBIIA=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AQLfPegxEFNk1kBJV5PiGWsHVX9K52PBDKAqWWFedhcQv0w8UvW6HVwQBobLNfZVDWdFqRUfNT7uoUQetcB3Y4qUHifcQHgBidGsLmOQSTzZhyHCBzTw61/O1Aajx043UHtt/GTWc9DjXfGkVCR6vfuL7S4wBNVIJXfi+TAEb3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Z5cbikEM; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Z5cbikEM"
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55QBXXfP1726243;
	Thu, 26 Jun 2025 06:33:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1750937613;
	bh=qKODjalj5kWtfmO+5KSaCR9DAAEHsE9UFI8k3zNPZfk=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=Z5cbikEMwGFBcMUDjwggH6FA0xT1LLslRV8AiVMoP4RfHy0HFANN/7C7AxIduqI5S
	 DTaHy0BeQLqXvX4E8d+yM3BWfpfhgAsRcXzWl2sgipAJ5vMOepG81zoHADrbgCYBKT
	 9QWC9SoE45BUNWtfrbOAXln8I+XAHJTzdL8fyoa4=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55QBXX5X3583205
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 26 Jun 2025 06:33:33 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 26
 Jun 2025 06:33:33 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 26 Jun 2025 06:33:32 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55QBXWOf1187721;
	Thu, 26 Jun 2025 06:33:32 -0500
Date: Thu, 26 Jun 2025 06:33:32 -0500
From: Bryan Brattlof <bb@ti.com>
To: Vignesh Raghavendra <vigneshr@ti.com>
CC: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: ti: k3-am62: copy bootph flags to Linux
Message-ID: <20250626113332.dlz7uje35wu7aiwj@bryanbrattlof.com>
X-PGP-Fingerprint: D3D1 77E4 0A38 DF4D 1853 FEEF 41B9 0D5D 71D5 6CE0
References: <20250624-62-uboot-cleanup-v1-1-c36230ab0375@ti.com>
 <02a85bf3-0c2e-48b6-9938-c4f8a50d662b@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <02a85bf3-0c2e-48b6-9938-c4f8a50d662b@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On June 26, 2025 thus sayeth Vignesh Raghavendra:
> 
> 
> On 24/06/25 20:20, Bryan Brattlof wrote:
> > To keep things as organized as possible, copy the bootph-all properties
> > from U-Boot for the packet DMA controller to indicate it should be
> > available during all phases of bootup.
> > 
> 
> Above isn't a valid reason to add bootph-all properties to a node. You
> would need to say why this DMA controller is needed during all phases of
> boot, does this enable a certain boot-mode? Fix $subject to reflect the
> same.

Ok will do

~Bryan
