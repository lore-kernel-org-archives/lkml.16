Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30E56433AC
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 06:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750054436; cv=none; b=Q6shwADAPBhlcLA8GNVEZuyuE52nNkc2OfoG5DUzJg+JQZckpyLNofXU10SCYG49KQPufpS+95X3iujQtiTU+OyyV8lXeeeDD/m/MvgJAH19nxVBcLkhKl2auSVMXEh/qVr8jv+p1FC8W9NwAKYMp8PwIdJRqcuPWGzcgpBKyFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750054436; c=relaxed/simple;
	bh=5fvtxVNSONMBRmP5kL6AbwuuVi5DlDIbpMj8AkaLUN0=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mS3a6LrDRFunN9G4y6seaYr3u//d5OUu33VgQOQeJ/vkWSx0PqfcK4eND3vLMNS5Y4PwwzaRqFSQ1ROoICE4GJRcsW7Us8V8nl2Kf3hE80AkURaoLmppyfbryx9BKFDR9tTArzTOY7VNEjjcGcnodAysM12LyBB7C5J6xlDwOiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=aqe8bAOV; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="aqe8bAOV"
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55G6DVqa3652018;
	Mon, 16 Jun 2025 01:13:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1750054411;
	bh=PbePVXAnMrFx3laArIYlOarAwsO6nrtRal5gw+k7HPw=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=aqe8bAOVWlwvCXQzofsHlrGhV70JZTeV80w+JGPr0deR/7RJ96lIcB1zrYGi/a7J1
	 dJZyLrFzYsLi5sQzNedX183nodE1DNJhaSMxchgQ4YKdk8IMpLtyYo9UYqhOTSs+m0
	 wxIJb1ihqXpG3vSnk66lFKTDAUsODOCLKJdfOxt0=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55G6DVe4548863
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 16 Jun 2025 01:13:31 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 16
 Jun 2025 01:13:30 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 16 Jun 2025 01:13:30 -0500
Received: from localhost (dhcp-172-24-227-169.dhcp.ti.com [172.24.227.169])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55G6DTwu3762941;
	Mon, 16 Jun 2025 01:13:30 -0500
Date: Mon, 16 Jun 2025 11:43:29 +0530
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: Vinod Koul <vkoul@kernel.org>
CC: Siddharth Vadapalli <s-vadapalli@ti.com>,
        Enric Balletbo i Serra
	<eballetb@redhat.com>,
        Roger Quadros <rogerq@kernel.org>, <kishon@kernel.org>,
        <sjakhade@cadence.com>, <thomas.richard@bootlin.com>,
        <christophe.jaillet@wanadoo.fr>, <u.kleine-koenig@baylibre.com>,
        <linux-phy@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>
Subject: Re: [PATCH v3 1/2] phy: cadence-torrent: Add PCIe multilink
 configuration for 100 MHz refclk
Message-ID: <8f576dd7-2954-4a0c-95b7-23b5e303f321@ti.com>
References: <20250109121614.754466-1-s-vadapalli@ti.com>
 <20250109121614.754466-2-s-vadapalli@ti.com>
 <fccedc26-0bb9-4078-8a94-4199f6b383c1@kernel.org>
 <CALE0LRsdsTU-NLN4fgh2c8qnS-pPP1BDJvjnvsSOnud8amk3=A@mail.gmail.com>
 <6b747de0-9d10-43e9-a2b1-23a129301538@ti.com>
 <aE7UbTT0UHgEliDM@vaman>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aE7UbTT0UHgEliDM@vaman>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On Sun, Jun 15, 2025 at 07:40:53PM +0530, Vinod Koul wrote:

Hello Vinod,

> On 12-06-25, 15:34, Siddharth Vadapalli wrote:
> > On Thu, Jun 12, 2025 at 10:48:20AM +0200, Enric Balletbo i Serra wrote:
> > 
> > Hello Enric,
> > 
> > > Hi all,
> > > 
> > > On Thu, Jan 9, 2025 at 5:35 PM Roger Quadros <rogerq@kernel.org> wrote:
> > > >
> > > >
> > > >
> > > > On 09/01/2025 14:16, Siddharth Vadapalli wrote:
> > > > > From: Swapnil Jakhade <sjakhade@cadence.com>
> > > > >
> > > > > Add register sequences to support PCIe multilink configuration for 100MHz
> > > > > reference clock. Maximum two PCIe links are supported.
> > > > >
> > > > > Signed-off-by: Swapnil Jakhade <sjakhade@cadence.com>
> > > > > Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
> > > >
> > > > Reviewed-by: Roger Quadros <rogerq@kernel.org>
> > > >
> > > 
> > > These patches seem good and have been reviewed but look stalled here.
> > > There is any chance to rebase it on top of the mainline?
> > 
> > The patches apply cleanly on the latest linux-next tagged next-20250612.
> 
> Can you repost

Sure, I will do so.

Regards,
Siddharth.
