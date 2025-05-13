Received: from out-179.mta0.migadu.com (out-179.mta0.migadu.com [91.218.175.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7DF62BE0ED
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 15:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747151394; cv=none; b=lMbrpCcadMjBGbXICE8t1bXg6u08l+I+JhLVxDKKJQM4vJwJ/6gUfmn3RKhK76o4LUoWyJvDthCwQ2EJFSGeTl8YgfUT/cqokPdTHV/VXFVwv6RqZejm3pVaPla8RafAAe5HIP4bjT9rN+iNho1GlGVUFQs8evVevyrDKfGTqtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747151394; c=relaxed/simple;
	bh=UPRvfjCDbgTsZ86qu1ogt0H4x+rT6E70pK6QAigrfME=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NqSU1h5Q6TkXbaWiZAWGBbaChldfU5PdAgbJMgCSIhH6+VvJ0299DE1njzb/unj8BrTL+37jdC6ooKPkn+qzx/lCt30DSut2IZcveh/Ys+cEJl8/lmhSRBp+j34txWn4s1q4RAiEF+lEQSDuPSScRQQWznPVMyYjjqXGBfU2UaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=OL+eIHxf; arc=none smtp.client-ip=91.218.175.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="OL+eIHxf"
Message-ID: <e545e5c2-daeb-4cd1-b9f8-e5d28e6250c8@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1747151388;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sNdDOdS7VSWTN7I3rO8Mx3bkxkkBYYP/FPTqxCVSQ+I=;
	b=OL+eIHxf5n10DZEiT+75UW7KoUwm+8ZWsB+KdyUhm8ONDQIXiSCCzGNre4ndL7jWZrCILe
	06lnXjHWgG06g/fJuQEv/Mey9UY29CbxKli/B88a6Ao0lqpptBgdGZtHTcpgnTLbOgjOYo
	1q8CzehfhCRhZ3QCn8QJ+9UM0jJ+Gpo=
Date: Tue, 13 May 2025 11:49:43 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [net-next PATCH v4 09/11] net: macb: Move most of mac_config to
 mac_prepare
To: "Karumanchi, Vineeth" <vineeth.karumanchi@amd.com>,
 netdev@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Russell King <linux@armlinux.org.uk>
Cc: upstream@airoha.com, Simon Horman <horms@kernel.org>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Kory Maincent <kory.maincent@bootlin.com>, linux-kernel@vger.kernel.org,
 Christian Marangi <ansuelsmth@gmail.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>
References: <20250512161013.731955-1-sean.anderson@linux.dev>
 <20250512161416.732239-1-sean.anderson@linux.dev>
 <6a8f1a28-29c0-4a8b-b3c2-d746a3b57950@amd.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <6a8f1a28-29c0-4a8b-b3c2-d746a3b57950@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 5/13/25 11:29, Karumanchi, Vineeth wrote:
> Hi Sean,
> 
> Sorry for the delayed response.
> 
> We are working on MACB with two internal PCS's (10G-BASER, 1000-BASEX) supporting 1G, 2.5G, 5G, and 10G with AN disabled.
> 
> I have sent an initial RFC : https://lore.kernel.org/netdev/20241009053946.3198805-1-vineeth.karumanchi@amd.com/
> 
> Currently, we are working on integrating the MAC in fixed-link and phy-mode.
> 
> Please see my inline comments.
> 
> On 5/12/2025 9:44 PM, Sean Anderson wrote:
>> mac_prepare is called every time the interface is changed, so we can do
>> all of our configuration there, instead of in mac_config. This will be
>> useful for the next patch where we will set the PCS bit based on whether
>> we are using our internal PCS. No functional change intended.
>>
>> Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
>> ---
>>
> 
> <...>
> 
>> +static int macb_pcs_config(struct phylink_pcs *pcs, unsigned int mode,
>> +               phy_interface_t interface,
>> +               const unsigned long *advertising,
>> +               bool permit_pause_to_mac)
>> +{
>> +    struct macb *bp = container_of(pcs, struct macb, phylink_sgmii_pcs);
>> +    bool changed = false;
>> +    unsigned long flags;
>> +    u32 old, new;
>> +
>> +    spin_lock_irqsave(&bp->lock, flags);
>> +    old = new = gem_readl(bp, NCFGR);
>> +    new |= GEM_BIT(SGMIIEN);
> 
> This bit represents the AN feature, can we make it conditional to facilitate IP's with AN disabled.

To clarify, this bit enables SGMII timings for AN (as opposed to
1000Base-X). If you don't have AN enabled at 1G, then this bit affects
nothing.

1000Base-X is not currently supported by the built-in PCS. Therefore,
this bit should be set unconditionally at 1G speeds. This patch aims to
avoid functional changes so I have not made it conditional. Making this
bit conditional would be appropriate for a patch adding support for
1000Base-X using the internal PCS.

>> +    if (old != new) {
>> +        changed = true;
>> +        gem_writel(bp, NCFGR, new);
>> +    }
> 
> <..>
> 
>>     static void macb_usx_pcs_get_state(struct phylink_pcs *pcs,
>> @@ -589,45 +661,60 @@ static int macb_usx_pcs_config(struct phylink_pcs *pcs,
>>                      bool permit_pause_to_mac)
>>   {
>>       struct macb *bp = container_of(pcs, struct macb, phylink_usx_pcs);
>> +    unsigned long flags;
>> +    bool changed;
>> +    u16 old, new;
>>   -    gem_writel(bp, USX_CONTROL, gem_readl(bp, USX_CONTROL) |
>> -           GEM_BIT(SIGNAL_OK));
>> +    spin_lock_irqsave(&bp->lock, flags);
>> +    if (macb_pcs_config_an(bp, neg_mode, interface, advertising))
>> +        changed = true;
>>   -    return 0;
>> -}
>> +    old = new = gem_readl(bp, USX_CONTROL);
>> +    new |= GEM_BIT(SIGNAL_OK);
>> +    if (old != new) {
>> +        changed = true;
>> +        gem_writel(bp, USX_CONTROL, new);
>> +    }
>>   -static void macb_pcs_get_state(struct phylink_pcs *pcs, unsigned int neg_mode,
>> -                   struct phylink_link_state *state)
>> -{
>> -    state->link = 0;
>> -}
>> +    old = new = gem_readl(bp, USX_CONTROL);
>> +    new = GEM_BFINS(SERDES_RATE, MACB_SERDES_RATE_10G, new);
>> +    new = GEM_BFINS(USX_CTRL_SPEED, HS_SPEED_10000M, new);
>> +    new &= ~(GEM_BIT(TX_SCR_BYPASS) | GEM_BIT(RX_SCR_BYPASS));
>> +    new |= GEM_BIT(TX_EN);
>> +    if (old != new) {
>> +        changed = true;
>> +        gem_writel(bp, USX_CONTROL, new);
>> +    }
> 
> The above speed/rate configuration was moved from macb_usx_pcs_link_up() where speed is an argument, which can be leveraged to configure multiple speeds.
> 
> Can we achieve configuring for multiple speeds from macb_usx_pcs_config() in fixed-link and phy-mode ?

Form what I can tell, the USX PCS is only used for 10G interfaces. If
you want to add support for using it at other link speeds, then yes some
of these register writes should be moved to link_up. For the moment it
doesn't matter where they happen.

--Sean
