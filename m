Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E8BA1F1319
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 10:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749722683; cv=none; b=oKX4DR0gdKRVtgWNTtOoyd0FrbdeOcQDTH0Vyt3CH6iLBXdASveLNO/TwQbL2bm/4cxK9g6DyoSsc1xZd4pBy0WAjkm+80mYXx1FN9dkA3RGEta069Ed22K9ZgH1W5nuREwWTXHXbK+sUPed8tkyysVsv0a7KXkOuA4IUxuowOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749722683; c=relaxed/simple;
	bh=Y7fBJE3mF0MaeREF0IrNL8R2g2r8lHgzWIaluxm87VE=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nshSDDbv3P4aMGfwXWzKb2FSNm8AKo70bklGHm1E7JTSs+3IxwcZiC2ZvsZDyAKR22B3Uwh6FxB+WlvoVtR0vchN7LfzYVMREf7uIAnzd5sI0ljsSdTDdFewr5V1KtsHnhAl5XWTRbGVTpWngUiTprfuurP5KGugjJcRAg/eA78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=BoxAwgD2; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="BoxAwgD2"
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55CA4NFf2882638;
	Thu, 12 Jun 2025 05:04:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1749722663;
	bh=M0kvq/12rDbuJoW2tEUY3xZ2q0mV8QHq6VdoGLJBCVM=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=BoxAwgD2buHHc5xQReJkJk/XWxKlkhor4zR5KLFTmrpzvrwJ0RSC0RknNnYtdQy9s
	 VK584tKRpAyyAZo8czRUE19ivyZVGcX+bgWCKGZyFPH6cSseR/o3dBDFUrPSJ3dHuk
	 SGZhe2ni5JBz61w74do3uGu1TNiLfPoJUCGxHn3I=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55CA4N3m2496745
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 12 Jun 2025 05:04:23 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 12
 Jun 2025 05:04:22 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 12 Jun 2025 05:04:22 -0500
Received: from localhost (dhcp-172-24-227-169.dhcp.ti.com [172.24.227.169])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55CA4LvJ1998196;
	Thu, 12 Jun 2025 05:04:21 -0500
Date: Thu, 12 Jun 2025 15:34:20 +0530
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: Enric Balletbo i Serra <eballetb@redhat.com>
CC: Roger Quadros <rogerq@kernel.org>,
        Siddharth Vadapalli
	<s-vadapalli@ti.com>, <vkoul@kernel.org>,
        <kishon@kernel.org>, <sjakhade@cadence.com>,
        <thomas.richard@bootlin.com>, <christophe.jaillet@wanadoo.fr>,
        <u.kleine-koenig@baylibre.com>, <linux-phy@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <srk@ti.com>
Subject: Re: [PATCH v3 1/2] phy: cadence-torrent: Add PCIe multilink
 configuration for 100 MHz refclk
Message-ID: <6b747de0-9d10-43e9-a2b1-23a129301538@ti.com>
References: <20250109121614.754466-1-s-vadapalli@ti.com>
 <20250109121614.754466-2-s-vadapalli@ti.com>
 <fccedc26-0bb9-4078-8a94-4199f6b383c1@kernel.org>
 <CALE0LRsdsTU-NLN4fgh2c8qnS-pPP1BDJvjnvsSOnud8amk3=A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CALE0LRsdsTU-NLN4fgh2c8qnS-pPP1BDJvjnvsSOnud8amk3=A@mail.gmail.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On Thu, Jun 12, 2025 at 10:48:20AM +0200, Enric Balletbo i Serra wrote:

Hello Enric,

> Hi all,
> 
> On Thu, Jan 9, 2025 at 5:35 PM Roger Quadros <rogerq@kernel.org> wrote:
> >
> >
> >
> > On 09/01/2025 14:16, Siddharth Vadapalli wrote:
> > > From: Swapnil Jakhade <sjakhade@cadence.com>
> > >
> > > Add register sequences to support PCIe multilink configuration for 100MHz
> > > reference clock. Maximum two PCIe links are supported.
> > >
> > > Signed-off-by: Swapnil Jakhade <sjakhade@cadence.com>
> > > Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
> >
> > Reviewed-by: Roger Quadros <rogerq@kernel.org>
> >
> 
> These patches seem good and have been reviewed but look stalled here.
> There is any chance to rebase it on top of the mainline?

The patches apply cleanly on the latest linux-next tagged next-20250612.

Regards,
Siddharth.
