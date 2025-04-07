Received: from out-178.mta0.migadu.com (out-178.mta0.migadu.com [91.218.175.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D45E5209F5B
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 16:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744043622; cv=none; b=Sf3Wg9xoAnHgAFYAvujksdcxJyn3WA/PkERghs1l9feXEJ6IVx4JRpMZxUfoYxfvO+r/4Uz9Mr1hym5J/TAzVUmc9MUVH561ElHegNvkc5lsuhXnS917oraCvvdZcu9sy7kQAcoHZ9wiqfU6uobNR0iJ6wHNnWqfG+eZ/LjBBPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744043622; c=relaxed/simple;
	bh=anBURer+NUbId9TRyOLh3MVO9AZan0YdjFquvwr88fY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hQWwmqLv7/lYyxx0+V5fLzWEVFCEyAKPGqvrmWUOJicUrPjq9n/kJZYgtzLUYuOxMewEq1Haen0u5xmVJsXPyx6Rs5Pixwvr6SykTCxtcymG5ZeQ7pM33GsXX8DFL31zFfF71hplHxEy4bDnrGYwGWLsBuiYVU1kFBLnS4YaR0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=UJWGbxFq; arc=none smtp.client-ip=91.218.175.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="UJWGbxFq"
Message-ID: <720b6db8-49c5-47e7-98da-f044fc38fc1a@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1744043618;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KFg4OMSXqyZAd4XoQGwUdaygVVdJ30SNWIcU9tJnxO4=;
	b=UJWGbxFqDDyMWF8b4G2fYOD53tA+BWAfWoGwac3pflGNx/7Q8PgHH198LIFtBZ+wsx8gh/
	XnnznK1WuR4pSzwX7dn9Bt8JcNWp1s5DrdqgsT/GTNhH4Vgnu+/qhtSKjA+JF6SZ4FceM1
	MRxTN0uezDbNPzPZHXbHspuUXvMOgC8=
Date: Mon, 7 Apr 2025 12:33:28 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [RFC net-next PATCH 00/13] Add PCS core support
To: Kory Maincent <kory.maincent@bootlin.com>
Cc: netdev@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Russell King <linux@armlinux.org.uk>,
 linux-kernel@vger.kernel.org, Christian Marangi <ansuelsmth@gmail.com>,
 upstream@airoha.com, Heiner Kallweit <hkallweit1@gmail.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Clark Wang <xiaoning.wang@nxp.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Claudiu Manoil <claudiu.manoil@nxp.com>, Conor Dooley <conor+dt@kernel.org>,
 Ioana Ciornei <ioana.ciornei@nxp.com>, Jonathan Corbet <corbet@lwn.net>,
 Joyce Ooi <joyce.ooi@intel.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Li Yang <leoyang.li@nxp.com>, Madalin Bucur <madalin.bucur@nxp.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Michal Simek <michal.simek@amd.com>,
 Naveen N Rao <naveen@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
 Rob Herring <robh+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 Robert Hancock <robert.hancock@calian.com>,
 Saravana Kannan <saravanak@google.com>, Shawn Guo <shawnguo@kernel.org>,
 UNGLinuxDriver@microchip.com, Vladimir Oltean <vladimir.oltean@nxp.com>,
 Wei Fang <wei.fang@nxp.com>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linuxppc-dev@lists.ozlabs.org
References: <20250403181907.1947517-1-sean.anderson@linux.dev>
 <20250407182738.498d96b0@kmaincent-XPS-13-7390>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <20250407182738.498d96b0@kmaincent-XPS-13-7390>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 4/7/25 12:27, Kory Maincent wrote:
> On Thu,  3 Apr 2025 14:18:54 -0400
> Sean Anderson <sean.anderson@linux.dev> wrote:
> 
>> This series adds support for creating PCSs as devices on a bus with a
>> driver (patch 3). As initial users,
>> 
>> - The Lynx PCS (and all of its users) is converted to this system (patch 5)
>> - The Xilinx PCS is broken out from the AXI Ethernet driver (patches 6-8)
>> - The Cadence MACB driver is converted to support external PCSs (namely
>>   the Xilinx PCS) (patches 9-10).
>> 
>> The last few patches add device links for pcs-handle to improve boot times,
>> and add compatibles for all Lynx PCSs.
>> 
>> Care has been taken to ensure backwards-compatibility. The main source
>> of this is that many PCS devices lack compatibles and get detected as
>> PHYs. To address this, pcs_get_by_fwnode_compat allows drivers to edit
>> the devicetree to add appropriate compatibles.
> 
> I don't dive into your patch series and I don't know if you have heard about it
> but Christian Marangi is currently working on fwnode for PCS:
> https://lore.kernel.org/netdev/20250406221423.9723-1-ansuelsmth@gmail.com
> 
> Maybe you should sync with him!

I saw that series and made some comments. He is CC'd on this one.

I think this approach has two advantages:

- It completely solves the problem of the PCS being unregistered while the netdev
  (or whatever) is up
- I have designed the interface to make it easy to convert existing
  drivers that may not be able to use the "standard" probing process
  (because they have to support other devicetree structures for
  backwards-compatibility).

--Sean
