Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 811C618DF86;
	Mon, 21 Apr 2025 17:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745255024; cv=none; b=CU4ScghQVw+55UO5GIdGUngM+AQBrjh5aEp9KmkXbgv5GQWvhDsUeapUY5uj/eWciqrx5+nDI55dZk4mxESu2cULNKytv4EkW4yID/t9JFDsGx8QSyytR3NtXcRYPLswvDiiwgEKYt3Yer2NOkotiYzqzjKAcR8rS/Zk/WLnUos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745255024; c=relaxed/simple;
	bh=Vny4bWMFKnBdf3xSKwxxHgOaEckoWiuTsqW/E71R23Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=NtVUPGSEwUsc8DcKrQOZ3uBPyJ0FOQJASU9HVe+PD+IHsUy5pGCSO6sG1pUiOhVRiFt75kPZtxRa+kjj5DApRJGXGCYHpgL3pqVa17YMBo9v6Oyam/i52zagOTCAmScOoZ7ftTVFVTQ+/BqpLMw5A4WuxYfZs3rAK9h80fD8RDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=fEArDoiv; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="fEArDoiv"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53LH3WIK982210
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 21 Apr 2025 12:03:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745255012;
	bh=UHFfKBVtmQ9cLWyCnu/zSQRBEYxq2/KCU52MqnF0ShQ=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=fEArDoivfE9xqX15M7RDilroaj0Xz/va2NKV6oCsjcK/FtmbQoX1uHO6tr9s1Ssuk
	 uOopwbH7vnD/86CvjiHv/6TF1BJg/5Pn2rBk+uI9z6iTVtQj8wUF+6K2x2asx5yMyL
	 Mp9yVVqtsuqrqoQQwZrEGrgaTu8sX1w6sch/feTs=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53LH3WeG108292
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 21 Apr 2025 12:03:32 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 21
 Apr 2025 12:03:31 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 21 Apr 2025 12:03:31 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53LH3VXs121488;
	Mon, 21 Apr 2025 12:03:31 -0500
Message-ID: <6241ff00-27e6-45ab-808e-f04e39854753@ti.com>
Date: Mon, 21 Apr 2025 12:03:31 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] dt-bindings: mfd: syscon: Add ti,am62-ddr-pmctrl
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Markus
 Schneider-Pargmann <msp@baylibre.com>
CC: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Siddharth
 Vadapalli <s-vadapalli@ti.com>, Nishanth Menon <nm@ti.com>,
        Vignesh
 Raghavendra <vigneshr@ti.com>,
        Tero Kristo <kristo@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
References: <20250122-topic-am62-dt-syscon-v6-13-v1-0-515d56edc35e@baylibre.com>
 <20250122-topic-am62-dt-syscon-v6-13-v1-2-515d56edc35e@baylibre.com>
 <20250124-heavy-jaybird-of-vitality-4cbe24@krzk-bin>
 <20250124-able-beagle-of-prowess-f5eb7a@krzk-bin>
 <mocfnpebc67xegcis6tx3ekhsjcsqnvhwtipufycrtq2be4nbh@pmxhir5gmkos>
 <639b4e3a-3f68-4fba-aa33-c46dcb6fc88f@linaro.org>
 <d6252b73-0bcc-4724-8144-d6a98c8980f8@ti.com>
 <74ee6d9b-fd78-4d8a-a94f-b2c4dc794b60@linaro.org>
 <ebsbaaxyatrcikoem75t2blkhhceuidq3wnj3r2hbezfcmtc3u@ptffexrigbff>
 <f9a2247e-e0eb-4e22-8626-80e87afa9386@linaro.org>
 <qjwlppsq4eorzepvjsgjjyyaddouo5w2rjguu5c2mqesd6luwp@f426xeghy2ht>
 <2130b439-74d0-475d-8429-1a1b4d9738aa@linaro.org>
 <b7f6570f-3b80-4fc1-8201-d44f5692867f@ti.com>
 <07bf9f93-deb8-48a1-aae9-a8a053680cc9@linaro.org>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <07bf9f93-deb8-48a1-aae9-a8a053680cc9@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 4/15/25 12:17 AM, Krzysztof Kozlowski wrote:
> On 09/04/2025 19:39, Andrew Davis wrote:
>> On 2/12/25 1:35 PM, Krzysztof Kozlowski wrote:
>>> On 10/02/2025 11:35, Markus Schneider-Pargmann wrote:
>>>> On Sun, Feb 09, 2025 at 01:21:27PM +0100, Krzysztof Kozlowski wrote:
>>>>> On 07/02/2025 15:40, Markus Schneider-Pargmann wrote:
>>>>>> Hi Krzysztof,
>>>>>>
>>>>>> On Mon, Jan 27, 2025 at 01:09:49PM +0100, Krzysztof Kozlowski wrote:
>>>>>>> On 24/01/2025 23:35, Andrew Davis wrote:
>>>>>>>> On 1/24/25 10:48 AM, Krzysztof Kozlowski wrote:
>>>>>>>>> On 24/01/2025 17:05, Markus Schneider-Pargmann wrote:
>>>>>>>>>> Hi Krzysztof,
>>>>>>>>>>
>>>>>>>>>> On Fri, Jan 24, 2025 at 09:22:54AM +0100, Krzysztof Kozlowski wrote:
>>>>>>>>>>> On Fri, Jan 24, 2025 at 09:19:49AM +0100, Krzysztof Kozlowski wrote:
>>>>>>>>>>>> On Wed, Jan 22, 2025 at 11:24:33AM +0100, Markus Schneider-Pargmann wrote:
>>>>>>>>>>>>> Add compatible for ti,am62-ddr-pmctrl to the list. There is a DDR pmctrl
>>>>>>>>>>>>> register in the wkup-conf register space of am62a and am62p. This
>>>>>>>>>>>>> register controls DDR power management.
>>>>>>>>>>>>>
>>>>>>>>>>>>> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
>>>>>>>>>>>>> ---
>>>>>>>>>>>>>     Documentation/devicetree/bindings/mfd/syscon.yaml | 2 ++
>>>>>>>>>>>>>     1 file changed, 2 insertions(+)
>>>>>>>>>>>>
>>>>>>>>>>>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>>>>>>>>>
>>>>>>>>>>> Un-acked, I missed the point that you really speak in commit msg about
>>>>>>>>>>> register and you really treat one register is a device. I assumed you
>>>>>>>>>>> only need that register from this device, but no. That obviously is not
>>>>>>>>>>> what this device is. Device is not a single register among 10000 others.
>>>>>>>>>>> IOW, You do not have 10000 devices there.
>>>>>>>>>>
>>>>>>>>>> Do I understand you correctly that the whole register range of the
>>>>>>>>>> wkup_conf node as seen in arch/arm64/boot/dts/ti/k3-am62a-wakeup.dtsi
>>>>>>>>>> should be considered a single syscon device?
>>>>>>>>>
>>>>>>>>> I don't have the datasheets (and not my task to actually check this),
>>>>>>>>> but you should probably follow datasheet. I assume it describes what is
>>>>>>>>> the device, more or less.
>>>>>>>>>
>>>>>>>>> I assume entire wkup_conf is considered a device.
>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> Unfortunately wkup_conf is modeled as a simple-bus with currently 5
>>>>>>>>>> subnodes defined of which 4 of them consist of a single register. Most
>>>>>>>>>> of them are syscon as well. So I think I can't change the simple-bus
>>>>>>>>>> back to syscon.
>>>>>>>>>
>>>>>>>>> Huh... Maybe TI folks will help us understand why such design was chosen.
>>>>>>>>>
>>>>>>>>
>>>>>>>> Many of the devices inside the wkup_conf are already modeled as such.
>>>>>>>> Clocks and muxes for instance already have drivers and bindings, this
>>>>>>>> is nothing new to TI.
>>>>>>>>
>>>>>>>> If we just use a blank "syscon" over the entire region we would end up
>>>>>>>> with drivers that use phandles to the top level wkup_conf node and
>>>>>>>> poke directly the registers they need from that space.
>>>>>>>>
>>>>>>>> Would you rather have
>>>>>>>>
>>>>>>>> some-device {
>>>>>>>> 	ti,epwm_tbclk = <&wkup_conf>;
>>>>>>>> }
>>>>>>>>
>>>>>>>> or
>>>>>>>>
>>>>>>>> some-device {
>>>>>>>> 	clocks = <&epwm_tbclk 0>;
>>>>>>>> }
>>>>>>>
>>>>>>> How is this comparable? These are clocks. You would have clocks property
>>>>>>> in both cases.
>>>>>>>
>>>>>>>
>>>>>>>>
>>>>>>>> with that epwm_tbclk being a proper clock node inside wkup_conf?
>>>>>>>> I would much prefer the second, even though the clock node
>>>>>>>> only uses a single register. And in the first case, we would need
>>>>>>>> to have the offset into the wkup_conf space hard-coded in the
>>>>>>>> driver for each new SoC. Eventually all that data would need to be
>>>>>>>> put in tables and we end up back to machine board files..
>>>>>>>>
>>>>>>>> I'm not saying every magic number in all drivers should
>>>>>>>> be offloaded into DT, but there is a line somewhere between
>>>>>>>> that and having the DT simply contain the SoC's name compatible
>>>>>>>
>>>>>>> That's not the question here.
>>>>>>>
>>>>>>>> and all other data going into the kernel. That line might be a
>>>>>>>> personal preference, so my question back is: what is wrong
>>>>>>>> if we do want "1000 new syscons per each register" for our
>>>>>>>> SoCs DT?
>>>>>>>
>>>>>>> Because it is false representation of hardware. You do not have 1000
>>>>>>> devices. You have only one device.
>>>>>>>
>>>>>>>
>>>>>>>>
>>>>>>>> (and the number is not 1000, scanning the kernel I can see
>>>>>>>> the largest wkup_conf region node we have today has a grand
>>>>>>>> total number sub-nodes of 6)
>>>>>>>
>>>>>>> But what is being added here is device per each register, not per feature.
>>>>>>
>>>>>> The register layout is like this:
>>>>>
>>>>> The register layout of what? How is the device called? Is datasheet
>>>>> available anywhere?
>>>>
>>>> Yes, it is available here: https://www.ti.com/de/lit/pdf/spruj16
>>>>
>>>> 14 Registers
>>>> 14.2 Device Configuration Registers
>>>> 14.2.1 CTRL_MMR Registers
>>>> 14.2.1.1 General Purpose Control Registers
>>>> 14.2.1.1.3 WKUP_CTRL_MMR0 Registers
>>>>
>>>> Each domain has their own set of general purpose control registers,
>>>> CTRL_MMR for the main domain, MCU_CTRL_MMR0 for the MCU domain,
>>>> WKUP_CTRL_MMR0 for the wakeup domain.
>>>
>>>
>>> So according to the doc you have only one device - CTRL_MMR. All other
>>> splits are superficial.
>>>
>>
>> It is not one device, it is a collection of devices under one labeled
>> bus range. Some items here are full normal devices, already modeled by DT
>> as stand-alone devices, for instance our chipid, efuse, clock controller,
>> etc. even our pinmux is part of this bus range.
>>
>> They are grouped as we have one set for each domain (MAIN, WKUP, MCU).
>>
>> All other splits are not superficial, if we go down that path then
>> the whole SoC is one "device". We could simply have the whole address
>> bus be one node and have Linux hard-code offsets in the drivers, we
>> end up back at board files..
>>
>> DT should break things into logically distinct and reusable units
>> so we don't have to store that in the kernel. That is what we do
>> here, even if some units end up being very small.
>>
>>>>
>>>> So I understand this to just be a collection of general purpose control
>>>> registers. If you go by feature, then many of the registers can be
>>>> grouped into units with a specific purpose or controlling a specific
>>>> device which are also grouped by the offsets they represent. I assume
>>>
>>> It could work if you have distinctive groups, but here:
>>> 1. You do not have this grouped, you just judge by yourself "oh, that's
>>> group A, that's B".
>>> 2. Group per one register is not that.
>>>
>>> For me this is one big block and even CLKSEL is spread all over so
>>> cannot be really made distinctive.
>>>
>>>> this is why the other nodes in this wkup_conf node were created. Also in
>>>
>>> The other nodes represent some sort of fake or totally arbitrary
>>> grouping. That's abuse of the syscon.
>>>
>>
>> They are grouped by function.
> 
> Not really - other DTS sent just few days ago created each entry per one
> register.
> 
>>
>>>> my opinion this makes the relation between the original device and this
>>>> general purpose control registers better understandable.
>>>>
>>>> For this patch the ddr-pmctrl regsiter is just a single register, but it
>>>> has the purpose of controlling the DDR device power management.
>>>
>>> Sure, but that is NOT syscon. One register of entire block is not system
>>> controller. The entire block is system controller.
>>>
>>
>> The whole block cannot be a system controller as there are regular
>> devices inside this range. If we made the whole region a syscon and
> 
> That's still system controller. It's nothing special here.
> 
>> also left the device nodes inside, then we would have overlapping
>> register owners, one register would be controlled by two or more
> 
> No, owner is the parent device always.

Which parent device? That is my point, if the top level node for the
whole CTRL_MMR region is made into one big syscon, then a big regmap
is made that covers the whole region. All the child devices also make
regmaps covering their device range. Now these registers under the child
device belong to two different regmaps. No synchronization is done as
these are not the same regmap, regmap only handles this for multiple
access to registers within the same regmap.

Let's take a real example, here is part of AM62A CTRL_MMR node.

main_conf: bus@100000 {
	compatible = "simple-bus";
	#address-cells = <1>;
	#size-cells = <1>;
	ranges = <0x00 0x00 0x00100000 0x20000>;

	phy_gmii_sel: phy@4044 {
		compatible = "ti,am654-phy-gmii-sel";
		reg = <0x4044 0x8>;
		#phy-cells = <1>;
	};

	...
};

If we turn "main_conf" into a syscon, then who "owns" 0x4044?
Both the top level syscon and phy_gmii_sel nodes would build
a different regmap instance that contains those same registers.

Bit of back story, this is actually how I got involved in sorting
out this "syscon" stuff for our devices. I built a checker into
the regmap framework core that would detect when multiple regmaps
are created that contain overlapping registers.

I found several bugs this way and want to push the check upstream at
some point. But first I wanted to fix the biggest cause of warnings,
which was from syscon being used as described above.

> 
>> drivers. How would we synchronize mappings, access, updates, etc.
>> Any one register should belong to exactly one device.
> 
> regmap synchronizes everything. There is no problem here, at all.
> 
>>
>> Is your issue the name "system controller", as yes I agree some of
>> these regions are not "system controllers".
>>
>> Would it work better if we didn't call this "ti,am62-ddr-pmctrl"
>> node a "syscon"? That can be done, we just would add a normal
>> binding doc for it, instead of trying to reuse the generic
>> bindings/mfd/syscon.yaml file.
> 
> You still do not have multiple subnodes, one per each register or even
> few registers.

If this ddr-pmctrl device is not modeled as a syscon device, then who
says it has to be more than a few (3?) registers in size? This seems like
a rather arbitrary rule, and completely unfeasible for several whole
classes of devices that only have/need a few registers to work them.

Andrew

> 
> Best regards,
> Krzysztof
