Received: from out-180.mta0.migadu.com (out-180.mta0.migadu.com [91.218.175.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37CF3170A26
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 20:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749760858; cv=none; b=GCMQkkGhxZp7H22R08CqSA/0yLR+h1gAGYMzUy1jY5vVN4t+Z4JOPD356qGk4Sn2UuPwaVEoh7M6QwVTLhME7d+s/4ifv5L++1VfkCcYx6Zt/PFkQdpV3FK1KBdHO7IKHonTbWLPP+n3eb+aRjcSo29FSDyLBGpr2TcM7E8bx0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749760858; c=relaxed/simple;
	bh=G5DyLuJHt4bZaLRqp0tmFt/JNkYOa83DJCmI+5DPo/s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AMdrunkj3s/Hl85CSQAdMohdclr10kwwm9Hjx/OToTMoswdAavwbvLCmTDe4m61j/lGn/nZoqfSfZbT5yOEuEJYSUXaz7o8Z5Rso5h911L2HyMYdcS6xHbgloJ+JoinavrcUTLzA4s9x2Qm3WPn0wjSzIfK69tjjzs7C6u9uTHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Wxt1EWOx; arc=none smtp.client-ip=91.218.175.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Wxt1EWOx"
Message-ID: <70958a2e-abc8-4894-b99a-f2981db9981f@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1749760852;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uBNMGO8nDA1ADslhYbI04Kw2PsQlf/n6XnJYKfeh030=;
	b=Wxt1EWOxEli7WNKhbYzvPVqy30Q8Pisn064aOtltY06Ca07eB0QAQbqM+BVOe9Q+RtKpXt
	++3mP5Ao5t0Jxttnf2a56SnNvZwVYDInTsb7KWimn/g5q0+JMnvWlyq6GMQP43bsfY1XvN
	b4mNZfkYjf+3/E7zCIXeF5sI4n6XIw4=
Date: Thu, 12 Jun 2025 16:40:48 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] driver core: Prevent deferred probe loops
To: Saravana Kannan <saravanak@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Danilo Krummrich
 <dakr@kernel.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, Rob Herring <robh+dt@kernel.org>,
 Grant Likely <grant.likely@linaro.org>
References: <cb354fd2-bece-42ef-9213-de7512e80912@linux.dev>
 <20250610183459.3395328-1-sean.anderson@linux.dev>
 <CAGETcx-koKBvSXTHChYYF-qSU-r1cBUbLghJZcqtJOGQZjn3BA@mail.gmail.com>
 <a52c513c-ff93-4767-a370-3f7c562df7bd@linux.dev>
 <2025061147-squishier-oversleep-80cd@gregkh>
 <7d6d8789-e10b-4b06-aa99-5c1a1bdd3b4c@linux.dev>
 <CAGETcx9E5DB4UtdjjAO2=XfTNXdXocj7uk0JkVZ8hf9YadwNcA@mail.gmail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <CAGETcx9E5DB4UtdjjAO2=XfTNXdXocj7uk0JkVZ8hf9YadwNcA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

On 6/12/25 13:56, Saravana Kannan wrote:
> On Thu, Jun 12, 2025 at 8:53 AM Sean Anderson <sean.anderson@linux.dev> wrote:
>>
>> On 6/11/25 08:23, Greg Kroah-Hartman wrote:
>> > On Tue, Jun 10, 2025 at 07:44:27PM -0400, Sean Anderson wrote:
>> >> On 6/10/25 19:32, Saravana Kannan wrote:
>> >> > On Tue, Jun 10, 2025 at 11:35 AM Sean Anderson <sean.anderson@linux.dev> wrote:
>> >> >>
>> >> >> A deferred probe loop can occur when a device returns EPROBE_DEFER after
>> >> >> registering a bus with children:
>> >> >
>> >> > This is a broken driver. A parent device shouldn't register child
>> >> > devices unless it is fully read itself. It's not logical to say the
>> >> > child devices are available, if the parent itself isn't fully ready.
>> >> > So, adding child devices/the bus should be the last thing done in the
>> >> > parent's probe function.
>> >> >
>> >> > I know there are odd exceptions where the parent depends on the child,
>> >> > so they might add the child a bit earlier in the probe
>> >>
>> >> This is exactly the case here. So the bus probing cannot happen any
>> >> later than it already does.
>> >
>> > Please fix the driver not to do this.
>>
>> How? The driver needs the PCS to work. And the PCS can live on the MDIO
>> bus.
> 
> Obviously I don't know the full details, but you could implement it as
> MFD. So the bus part would not get removed even if the PCS fails to
> probe. Then the PCS can probe when whatever it needs ends up probing.

I was thinking about making the MDIO bus a separate device. But I think
it will be tricky to get suspend/resume working correctly. And this
makes conversions more difficult because you cannot just add some
pcs_get/pcs_put calls, you have to split out the MDIO bus too (which is
invariably created as a child of the MAC).

And what happens if a developer doesn't realize they have to split off
the MDIO bus before converting? Everything works fine, except if there
is some problem loading the PCS driver, which they may not test. Is this
prohibition against failing after creating a bus documented anywhere? I
don't recall seeing it...

>>
>> >> > but in those cases, the parent's probe should still do all the checks
>> >> > ahead of time.
>> >>
>> >> Such as what? How is the parent going to know the resource is missing
>> >> without checking for it?
>> >>
>> >> > Can you be more specific about the actual failure you are seeing?
>> >>
>> >> MAC is looking for a PCS that's on its internal MDIO bus, but that PCS's
>> >> driver isn't loaded. The PCS has to be loaded at probe time because
>> >> phylink_create needs it, and phylink is necessary to register the
>> >> netdev. The latter situation is not ideal, but it would be quite a bit
>> >> of work to untangle.
> 
> I meant, point to a specific device in a DT and the driver. Provide
> logs of the failure if possible, etc. Tell me which device is failing
> and why, etc. That way, I can take a closer look or give you other
> suggestions.

See [1]. Devicetree is not upstream yet (working on it...) but it looks
like

&gem0 {
	pcs-handle = <&pcs0>;
	post-init-providers = <&pcs0>;
	sfp = <&sfp0>;
	managed = "in-band-status";
	phy-mode = "1000base-x";
	nvmem-cells = <&eth_address 0>;
	nvmem-cell-names = "mac-address";
	/delete-property/ phy-handle;

	mdio {
		pcs0: ethernet-pcs@0 {
			#clock-cells = <0>;
			compatible = "xlnx,pcs-16.2", "xlnx,pcs";
			reg = <0>;
			clocks = <&si570>;
			clock-names = "refclk";
			interrupts-extended = <&gic GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>;
			interrupt-names = "an";
			reset-gpios = <&axi_gpio_2 0 GPIO_ACTIVE_HIGH>;
			done-gpios = <&axi_gpio_3 0 GPIO_ACTIVE_HIGH>;
			xlnx,pcs-modes = "sgmii", "1000base-x";
		};
	};
};

or in another instance

&eth_0_eth_buf {
	clocks = <&zynqmp_clk PL0_REF>;
	clock-names = "s_axi_lite_clk";
	pcs-handle = <&pcs4>;
	managed = "in-band-status";
	phy-handle = <&phy5>;
	phy-mode = "sgmii";
	post-init-providers = <&pcs4>, <&phy5>;
	nvmem-cells = <&eth_address 4>;
	nvmem-cell-names = "mac-address";
	iommus = <&smmu 0x200>, <&smmu 0x240>, <&smmu 0x248>;
	/delete-property/ local-mac-address;
	/delete-property/ xlnx,phy-type;

	mdio {
		reset-gpios = <&gpio 38 GPIO_ACTIVE_LOW>;
		reset-delay-us = <10000>;
		reset-post-delay-us = <50000>;

		pcs4: ethernet-pcs@1 {
			#reset-cells = <1>;
			compatible = "xlnx,pcs-16.2", "xlnx,pcs";
			reg = <1>;
			clocks = <&vc5 4>;
			clock-names = "refclk";
			assigned-clocks = <&vc5 4>;
			assigned-clock-rates = <125000000>;
			reset-gpios = <&axi_gpio_2 4 GPIO_ACTIVE_HIGH>;
			xlnx,pcs-modes = "sgmii";
		};

		phy2: ethernet-phy@2 {
			compatible = "ethernet-phy-ieee802.3-c22";
			reg = <2>;
			interrupts-extended = <&gpio 118 IRQ_TYPE_LEVEL_LOW>;
		};

		phy4: ethernet-phy@4 {
			compatible = "ethernet-phy-ieee802.3-c22";
			reg = <4>;
			interrupts-extended = <&gpio 119 IRQ_TYPE_LEVEL_LOW>;
		};

		phy5: ethernet-phy@5 {
			compatible = "ethernet-phy-ieee802.3-c22";
			reg = <5>;
			interrupts-extended = <&gpio 117 IRQ_TYPE_LEVEL_LOW>;
		};

		phy6: ethernet-phy@6 {
			compatible = "ethernet-phy-ieee802.3-c22";
			reg = <6>;
			interrupts-extended = <&gpio 120 IRQ_TYPE_LEVEL_LOW>;
		};
	};
};

In the second case, the phy also has the same relationship, but it is
not an issue since the phy is looked up in ndo_open instead of
phylink_create.

The ZCU102/106 supports this, but the in-tree devicetree only has hard
IP as opposed to things done in the FPGA. However, the "default"
configuration for xilinx_axienet assumes that the PCS is on the MAC's
MDIO bus [2].

--Sean

[1] https://lore.kernel.org/netdev/20250610233134.3588011-1-sean.anderson@linux.dev/
[2] https://github.com/Xilinx/device-tree-xlnx/blob/ac65e0142e52331244ea5799880650fb1e726ab7/axi_ethernet/data/axi_ethernet.tcl#L280
