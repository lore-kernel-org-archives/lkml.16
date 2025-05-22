Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C143A299AB9;
	Thu, 22 May 2025 16:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747933151; cv=none; b=aHuFwFankJpaTDVKip6z7O1Q6bcnpnlmBN8n8ZfAAo7DCj3BUwgTEqTT+hxYr+oEvTLdrLnV46GMlo7oavfwHLhziMKgfxl48eHAfWxpuzLEw2of1000gTuheP2NBtfEZ8vTsQma2DoFRjEVqWio+l85Igx1i3ly8VodLwFxXVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747933151; c=relaxed/simple;
	bh=Q+y/E6YgQGDwu7stIaPRw3W003Zu90OHopOUhl5Omfs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pKt3/ZteHZDmjLttzeFqhao8m714xRXnQfEghcg2bJy4VR9O839jRVWyqtYe/qgPVHGRryzvI6w4SmO76bFygsVqqHeMrzIvKSV3E5J5a1qx71eXnME5xNZ54LhzJxvE3EUZt10qKmotZEu/QmvPUIVNnSN/JdGBF4WIUj9JQUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=DBlih913; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="DBlih913"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=TaG62Y1MCE7ilMflSqxxCXFz3aYtcoI1Q8Lugoaj0b8=; b=DBlih913dJegDNXmkankRDbaFG
	E9QMg6z2ZoBhqOOLnBoq+wOLmCep+oVpoFseDTgTPhechqiaL0wmFgH5e1hC8WV1gLcX2JwuU8DVT
	80iDWoSwYUzOQx1qhZSmmWeUg9XpwSivM2EbSzEI1wH1+T6kdSrn2qfIrBTP582k+26g=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uI9G0-00DWGS-2k; Thu, 22 May 2025 18:59:00 +0200
Date: Thu, 22 May 2025 18:59:00 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: Quentin Schulz <foss+kernel@0leil.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Jakob Unterwurzacher <jakob.unterwurzacher@cherry.de>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	Kever Yang <kever.yang@rock-chips.com>
Subject: Re: [PATCH 2/2] arm64: dts: rockchip: support Ethernet Switch
 adapter for RK3588 Jaguar
Message-ID: <b322970d-8d56-46fc-b537-22f73a66dc8b@lunn.ch>
References: <20250521-jaguar-mezz-eth-switch-v1-0-9b5c48ebb867@cherry.de>
 <20250521-jaguar-mezz-eth-switch-v1-2-9b5c48ebb867@cherry.de>
 <657a085c-4214-4096-8a68-047d57a40d60@lunn.ch>
 <19574942-d06b-44b0-8b6c-d3ddd94db89f@cherry.de>
 <9c99aba9-87f5-41fe-8b11-7ef27525750c@lunn.ch>
 <9e8f659d-9116-46a6-b7e7-3d4705f57ac6@cherry.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9e8f659d-9116-46a6-b7e7-3d4705f57ac6@cherry.de>

> Would the suggested change in the previous answer be acceptable to you?
> 
> @Kever, is there any way to know what the register values for
> rx_delay/tx_delay actually mean in terms of picoseconds delay added by the
> MAC maybe?

The problem is, what exactly do these values mean? Is it documented
somewhere?

> > > > Since this has a switch on the other end, its a bit more complicated
> > > > with RGMII delays. Normally, the MAC does nothing and passed rgmii-id
> > > > to the PHY, and the PHY then does the delays. However, here you don't
> > > > have a PHY. So you have the MAC add the delays. This looks O.K. I
> > > 
> > > The switch actually supports adding delays on the port used for DSA conduit.
> > 
> > That actually looks to be the simplest and correct solution. Set the
> > MAC to 'rgmii-id', rx_delay and tx_delay to 0, even if they are
> > ignored. And in the switch, also 'rgmii-id' and let it insert the 2ns
> > delay. You can use rx-internal-delay-ps and tx-internal-delay-ps if
> > you want, but it seems to default to sensible values.
> > 
> 
> I don't have control on how much is inserted by the PHY as opposed to the
> MAC, so I'm wary of using a much less precise (on paper) delay.

Experience i've had with this is that you don't need to be too
accurate. Devices generally work with 2ns.

> I have no
> clue if doing this in the PHY is going to put us in the center of the eye or
> not. Thanks to Rockchip's kernel tool, we are expecting to be in the center
> of the eye right now.

What exactly does the tool do? Can you run it when the 'PHY' is adding
the delay and see how good the eye alignment is?

arch$ grep -hr "tx_delay =" | sort | uniq -c
      1 	tx_delay = <0x0>;
      4 	tx_delay = <0x10>;
      1 	tx_delay = <0x1a>;
      1 	tx_delay = <0x20>;
      3 	tx_delay = <0x21>;
      2 	tx_delay = <0x22>;
      5 	tx_delay = <0x24>;
      2 	tx_delay = <0x26>;
     15 	tx_delay = <0x28>;
      2 	tx_delay = <0x2a>;
     17 	tx_delay = <0x30>;
      1 	tx_delay = <0x3a>;
      3 	tx_delay = <0x3c>;
      3 	tx_delay = <0x42>;
      5 	tx_delay = <0x43>;
      2 	tx_delay = <0x44>;
      1 	tx_delay = <0x45>;
      1 	tx_delay = <0x46>;
      6 	tx_delay = <0x4f>;

So 0x30 is the most popular, and i expect it maps to 2ns. The 0x28
value is interesting, given that 0x2a is not used much. That makes me
think there might be a common PHY used with these boards which has a
small built in delay when it should not.
 
> > > I'm a bit confused by the following sentence:
> > > 
> > > """
> > > Normally, the MAC does nothing and passed rgmii-id
> > > """
> > > 
> > > is this something that the MAC driver is supposed to do or is the subsystem
> > > handling that somehow? How do I know how/when to rewrite the phy-mode passed
> > > to the PHY?
> > 
> > A small number of MACs have hard coded delays. You cannot turn the
> > delay off. So the MAC has no choice but to do the delay. 'rgmii' is
> > simply not possible, so -EINVAL. For 'rgmii-id', if you pass that to
> > the PHY, it will also add a delay, and 4ns in total does not work. So
> > when the MAC is adding delays, it needs to mask out the delays it is
> > adding before calling phy_attach() passing an rgmii mode.
> > 
> 
> If I understand correctly, if phy-mode is rgmii-id in DT and the MAC is
> adding the delay, I need to force PHY_INTERFACE_MODE_RGMII phy-mode when
> attaching the PHY in the MAC device.

Correct. DT phy-mode describes the PCB. Does the PCB add the 2ns
delay.

Once you get to the MAC/PHY pair, what the MAC passes to the PHY is
about what remaining delays need adding. It could be nothing, because
the PCB adds the delay. It could be all of it, because neither the PCB
nor the MAC add the delays. It can also be nothing because the MAC has
already added the delays.

For linux, we have the policy that the PHY adds the delay, in an
attempt to try to make all systems the same. And most boards follow
this. And then we have a few systems that totally mess up delays, have
odd configuration knobs nobody knows what the do exactly, and put the
delays in the MAC.

> Does this also mean you cannot have mixed addition of delay? E.g. having 1ns
> from MAC and 1ns from PHY? It has to be only on one of the IC?

It is not recommended, because of the policy that the PHY does the
delay... You can, if you make use of the rx-internal-delay-ps
properties, assuming both the MAC and PHY support them.

> In the comment at the bottom of the dt binding there's this following
> sentence:
> 
> # When the PCB does not implement the delays, the MAC or PHY must.  As
> # such, this is software configuration, and so not described in Device
> # Tree.
> 
> Why do we have two possible locations for rx-internal-delay-ps: PHY and MAC?

Sometimes both can add variable delays. Sometimes it is fixed 2ns.

I would actually prefer that these properties were not used, because
they indicate somebody messed up. If you read the RGMII standard, it
says a 2ns delay is required between the clock and the data. It is as
simple as that. If you need to fine tune it, it means one of:

The PCB is badly designed, care was not taken to ensure the PCB tracks
are the same length.

The MAC is badly designed, it does not add 0ns/2ns, but some other
delay.

The PHY is badly designed, it does not add 0ns/2ns, but some other
delay.

I don't have empirical data, but i get the feeling designs are getting
worse, there is more need to use fine tuning. So these
{rx|tx}-internal-delay-ps properties are needed. Maybe the board you
are using is as a whole badly designed and needs fine tuning. If it
does, you have to decide where to put the fine tuning. But i would
prefer the 'PHY' adds the basic 2ns delay, and if need be, the MAC can
add/remove some picoseconds.

	Andrew
