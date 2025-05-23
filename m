Received: from out-187.mta1.migadu.com (out-187.mta1.migadu.com [95.215.58.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27A821EE008
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 22:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748040443; cv=none; b=XyrknVTKJcBZqzMVK3kRqpiQi9e9i13h2nn7KvmzBJkrcyBy0kO9V4+yDR7P+I/x6TxhLuMo3+NH8sDZgaHpeaeATZ7CLHT/7wRQ3DdW7+g2aLESh2iiUtpkdylwPOHyuDl4MyHbt2Yna8DHRBAkVJfsmBg26/DzGY692XnUttU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748040443; c=relaxed/simple;
	bh=x98D+Yp00VdZ07liE4NWYJeoBOk1wSzRdLodEYKc9qs=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=d/YFXufes3cf/sv78mPF451j8z3Ij/ytC6aEjfDB4e5gnYQ2xXbdbrf76JaGiCQZAM9UASVOwslWTy6xR4CxACZz+ex1UmHm/vXfFZCjE8Xg2Ls6xQ9VYxeWiGSuGDGy/7ppFCVJyNQwfYiIs+8pFgyHP3QDz4SlKvKCer0YSkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Tz5kpDrc; arc=none smtp.client-ip=95.215.58.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Tz5kpDrc"
Message-ID: <7af85fa7-c6ec-473f-b5ac-38af12b5ad02@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1748040436;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6I7zYLgaZ1vf52aAPbhqqUukOteUKhHVaPkuzjN4gRo=;
	b=Tz5kpDrcNeBalk9UG3m2J1d6HBAkDNuVd2KLh/LnUFFrfJCDGVdZD10GSOsWy2xiW91vI2
	AKE1cBwGAzZFTcGIJwhnjc9Hy0zYFNmHqG26WDfHrPQxWFgp5VUrTFcfxJY8F9GaqPkL2z
	mVpscSfbBIHG+o07vLvggvYIBcAaQZA=
Date: Fri, 23 May 2025 18:47:01 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [net-next PATCH v5 05/10] net: pcs: lynx: Convert to an MDIO
 driver
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
To: Heiner Kallweit <hkallweit1@gmail.com>, netdev@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Russell King <linux@armlinux.org.uk>
Cc: Lei Wei <quic_leiwei@quicinc.com>,
 Christian Marangi <ansuelsmth@gmail.com>,
 Kory Maincent <kory.maincent@bootlin.com>, Simon Horman <horms@kernel.org>,
 Daniel Golle <daniel@makrotopia.org>,
 Vineeth Karumanchi <vineeth.karumanchi@amd.com>,
 linux-kernel@vger.kernel.org, Ioana Ciornei <ioana.ciornei@nxp.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>, imx@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com
References: <20250523203339.1993685-1-sean.anderson@linux.dev>
 <20250523203339.1993685-6-sean.anderson@linux.dev>
 <a937e728-d911-4fcc-9af1-9ae6130f96c1@gmail.com>
 <3a452864-9d02-4fa7-9d7c-a240b611ee74@linux.dev>
 <e0bd575b-a01b-418f-9d89-b59398e87a48@linux.dev>
Content-Language: en-US
In-Reply-To: <e0bd575b-a01b-418f-9d89-b59398e87a48@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 5/23/25 18:07, Sean Anderson wrote:
> On 5/23/25 17:39, Sean Anderson wrote:
>> On 5/23/25 17:33, Heiner Kallweit wrote:
>>> On 23.05.2025 22:33, Sean Anderson wrote:
>>>> This converts the lynx PCS driver to a proper MDIO driver.
>>>> This allows using a more conventional driver lifecycle (e.g. with a
>>>> probe and remove). It will also make it easier to add interrupt support.
>>>> 
>>>> The existing helpers are converted to bind the MDIO driver instead of
>>>> creating the PCS directly. As lynx_pcs_create_mdiodev creates the PCS
>>>> device, we can just set the modalias. For lynx_pcs_create_fwnode, we try
>>>> to get the PCS the usual way, and if that fails we edit the devicetree
>>>> to add a compatible and reprobe the device.
>>>> 
>>>> To ensure my contributions remain free software, remove the BSD option
>>>> from the license. This is permitted because the SPDX uses "OR".
>>>> 
>>>> Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
>>>> ---
>>>> 
>>>> Changes in v5:
>>>> - Use MDIO_BUS instead of MDIO_DEVICE
>>>> 
>>>> Changes in v4:
>>>> - Add a note about the license
>>>> - Convert to dev-less pcs_put
>>>> 
>>>> Changes in v3:
>>>> - Call devm_pcs_register instead of devm_pcs_register_provider
>>>> 
>>>> Changes in v2:
>>>> - Add support for #pcs-cells
>>>> - Remove unused variable lynx_properties
>>>> 
>>>>  drivers/net/dsa/ocelot/Kconfig                |   4 +
>>>>  drivers/net/dsa/ocelot/felix_vsc9959.c        |  11 +-
>>>>  drivers/net/dsa/ocelot/seville_vsc9953.c      |  11 +-
>>>>  drivers/net/ethernet/altera/Kconfig           |   2 +
>>>>  drivers/net/ethernet/altera/altera_tse_main.c |   7 +-
>>>>  drivers/net/ethernet/freescale/dpaa/Kconfig   |   2 +-
>>>>  drivers/net/ethernet/freescale/dpaa2/Kconfig  |   3 +
>>>>  .../net/ethernet/freescale/dpaa2/dpaa2-mac.c  |  11 +-
>>>>  drivers/net/ethernet/freescale/enetc/Kconfig  |   2 +
>>>>  .../net/ethernet/freescale/enetc/enetc_pf.c   |   8 +-
>>>>  .../net/ethernet/freescale/enetc/enetc_pf.h   |   1 -
>>>>  .../freescale/enetc/enetc_pf_common.c         |   4 +-
>>>>  drivers/net/ethernet/freescale/fman/Kconfig   |   4 +-
>>>>  .../net/ethernet/freescale/fman/fman_memac.c  |  25 ++--
>>>>  drivers/net/ethernet/stmicro/stmmac/Kconfig   |   3 +
>>>>  .../ethernet/stmicro/stmmac/dwmac-socfpga.c   |   6 +-
>>>>  drivers/net/pcs/Kconfig                       |  11 +-
>>>>  drivers/net/pcs/pcs-lynx.c                    | 110 ++++++++++--------
>>>>  include/linux/pcs-lynx.h                      |  13 ++-
>>>>  19 files changed, 128 insertions(+), 110 deletions(-)
>>>> 
>>>> diff --git a/drivers/net/dsa/ocelot/Kconfig b/drivers/net/dsa/ocelot/Kconfig
>>>> index 081e7a88ea02..907c29d61c14 100644
>>>> --- a/drivers/net/dsa/ocelot/Kconfig
>>>> +++ b/drivers/net/dsa/ocelot/Kconfig
>>>> @@ -42,7 +42,9 @@ config NET_DSA_MSCC_FELIX
>>>>  	select NET_DSA_TAG_OCELOT_8021Q
>>>>  	select NET_DSA_TAG_OCELOT
>>>>  	select FSL_ENETC_MDIO
>>>> +	select PCS
>>>>  	select PCS_LYNX
>>>> +	select MDIO_BUS
>>> 
>>> This shouldn't be needed. NET_DSA selects PHYLINK, which selects PHYLIB,
>>> which selects MDIO_BUS. There are more places in this series where the
>>> same comment applies.
>> 
>> select does not transitively enable dependencies. See the note in
>> Documentation/kbuild/kconfig-language.rst for details. Therefore we must
>> select the dependencies of things we select in order to ensure we do not
>> trip sym_warn_unmet_dep.
> 
> OK, I see what you mean here. But of course NET_DSA is missing selects for
> PHYLIB and MDIO_BUS. And PHYLINK is also missing a select for MDIO_BUS. Actually,
> this bug is really endemic. Maybe we should just get rid of PHYLIB as a config
> and just make everything depend on ETHERNET instead.

After some experimentation, I think what that note means is that select
is recursive for select but not for depends on. So I think I only have
to select the "forward" dependencies, which is certainly easier.

--Sean
