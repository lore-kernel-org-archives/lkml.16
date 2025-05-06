Received: from out-171.mta1.migadu.com (out-171.mta1.migadu.com [95.215.58.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7926A4B1E60
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 22:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746570043; cv=none; b=Y1RzhB4/WQ2D5TGpgUp6JsL5OoXtv0X9nSjaEwrB/FPdBXWyhYmX7ynZYelTBzq/DfSySvhmZNwt8B9ZSu+/IbVID8rpo7z1ruGtfT5wp1JetuLIqlTzOOEaIDMLI9aIlXEIl8CUqCi2seh5md0mDCvfZ5ILzAz36wx0PwS0D+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746570043; c=relaxed/simple;
	bh=0PO8GZA/VK1cO3v9qAu67hAW6oAhrGbHQcodV3efN8M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Gsg48pygrwUuVk3jNUptCB2+TndaFZb6KXc6HtEPtJry4ETrSoWftidSQyaOIncqwAufHpb2oO/psGN9TOWikW10fn6cELvUqrSmMDvImkpDleNleMHLH5YblGGBNLzmPAsPmam46XhnlJ2Dd2c820a0CzBDwbVwuRwL28FuV1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=iC6ahTgn; arc=none smtp.client-ip=95.215.58.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="iC6ahTgn"
Message-ID: <d66ac48c-8fe3-4782-9b36-8506bb1da779@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1746570039;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K0qLWtRCotlgnWD+RmktCT42JGMuJBbGtZU0H3V1TGs=;
	b=iC6ahTgnsI8BQYQ0QontZXFG+FkCpuqrW1IMIyCKt6Wh3CZkOphNtbcGq0FQflBpCl4Ono
	nb6GlDLWeMs1ta8Y/zxnEhpE0YZ7TOhFxNrdsm6GuZsaB0P9zDphiy4ByPBgDUDylcPFnX
	8yJyAeR84IdeEqSWyNDZLk6ZhKHGcwc=
Date: Tue, 6 May 2025 18:20:32 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [net-next PATCH v3 05/11] net: pcs: lynx: Convert to an MDIO
 driver
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: netdev@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Russell King <linux@armlinux.org.uk>,
 upstream@airoha.com, Christian Marangi <ansuelsmth@gmail.com>,
 linux-kernel@vger.kernel.org, Kory Maincent <kory.maincent@bootlin.com>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Clark Wang <xiaoning.wang@nxp.com>, Claudiu Manoil <claudiu.manoil@nxp.com>,
 Ioana Ciornei <ioana.ciornei@nxp.com>, Joyce Ooi <joyce.ooi@intel.com>,
 Madalin Bucur <madalin.bucur@nxp.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, UNGLinuxDriver@microchip.com,
 Wei Fang <wei.fang@nxp.com>, imx@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com
References: <20250415193323.2794214-6-sean.anderson@linux.dev>
 <20250415193323.2794214-6-sean.anderson@linux.dev>
 <20250506215841.54rnxy3wqtlywxgb@skbuf>
 <20250415193323.2794214-1-sean.anderson@linux.dev>
 <20250415193323.2794214-1-sean.anderson@linux.dev>
 <20250415193323.2794214-6-sean.anderson@linux.dev>
 <20250415193323.2794214-6-sean.anderson@linux.dev>
 <20250506215841.54rnxy3wqtlywxgb@skbuf>
 <50e809ea-62a4-413d-af63-7900929c3247@linux.dev>
 <50e809ea-62a4-413d-af63-7900929c3247@linux.dev>
 <20250506221834.uw5ijjeyinehdm3x@skbuf>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <20250506221834.uw5ijjeyinehdm3x@skbuf>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 5/6/25 18:18, Vladimir Oltean wrote:
> On Tue, May 06, 2025 at 06:03:35PM -0400, Sean Anderson wrote:
>> On 5/6/25 17:58, Vladimir Oltean wrote:
>> > Hello Sean,
>> > 
>> > On Tue, Apr 15, 2025 at 03:33:17PM -0400, Sean Anderson wrote:
>> >> diff --git a/drivers/net/pcs/pcs-lynx.c b/drivers/net/pcs/pcs-lynx.c
>> >> index 23b40e9eacbb..bacba1dd52e2 100644
>> >> --- a/drivers/net/pcs/pcs-lynx.c
>> >> +++ b/drivers/net/pcs/pcs-lynx.c
>> >> @@ -1,11 +1,15 @@
>> >> -// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
>> >> -/* Copyright 2020 NXP
>> >> +// SPDX-License-Identifier: GPL-2.0+
>> >> +/* Copyright (C) 2022 Sean Anderson <seanga2@gmail.com>
>> >> + * Copyright 2020 NXP
>> >>   * Lynx PCS MDIO helpers
>> >>   */
>> >>  
>> >> -MODULE_DESCRIPTION("NXP Lynx PCS phylink library");
>> >> -MODULE_LICENSE("Dual BSD/GPL");
>> >> +MODULE_DESCRIPTION("NXP Lynx PCS phylink driver");
>> >> +MODULE_LICENSE("GPL");
>> > 
>> > What's the idea with the license change for this code?
>> 
>> I would like to license my contributions under the GPL in order to
>> ensure that they remain free software.
>> 
>> --Sean
> 
> But in the process, you are relicensing code which is not yours.
> Do you have agreement from the copyright owners of this file that the
> license can be changed?

I'm not relicensing anything. It's already (GPL OR BSD-3-Clause). I'm
just choosing not to license my contributions under BSD-3-Clause.

--Sean
