Received: from freeshell.de (freeshell.de [116.202.128.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AEEC223DDF;
	Thu, 24 Apr 2025 23:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.202.128.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745537866; cv=none; b=QSSX/sSZ4J5IBdyoDx7I79cWBKBNHiFanVhkLcodjnehZ66xfQVAyJHjpH+kVdid/g9KEV+5ajrHTjy2ZRMCwjVZwp4D7wRfD+wgC/y5TEmxFoOMnPRwuAUKe3DezhqpL99raei7j6PkG/mZRms+3Eh99iP7EzScujDxYnDgTCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745537866; c=relaxed/simple;
	bh=cmbQ6egROcju76fPniYQ/AkXerDn4vL64+F7rOarWQA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m4HmJVVhKDxFMooAIkrBz0+lYjMaALAv5CXQyZrzCuqlQNaMCm3d9RLORHIekMuaqGOG99ZAQtUHQpphdb46QbhESOo0i52GzdScgIcYGBpKsIXmR+pets98+DPNBPUnjfdCvgY6esquz0QbKY6/U+SuBJmSelB2YpM16LtKBuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=freeshell.de; spf=pass smtp.mailfrom=freeshell.de; arc=none smtp.client-ip=116.202.128.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=freeshell.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freeshell.de
Received: from [192.168.2.35] (unknown [98.97.25.173])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id B8D26B4C1A41;
	Fri, 25 Apr 2025 01:37:31 +0200 (CEST)
Message-ID: <521e5549-de83-49a1-a0e5-e47a2cb275ef@freeshell.de>
Date: Thu, 24 Apr 2025 16:37:29 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] riscv: dts: starfive: jh7110-common:
 bootph-pre-ram hinting needed by boot loader
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 Hal Feng <hal.feng@starfivetech.com>,
 Hal Feng <hal.feng@linux.starfivetech.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Emil Renner Berthing <kernel@esmil.dk>, Conor Dooley <conor@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Maud Spierings <maud_spierings@hotmail.com>
References: <20250203013730.269558-1-e@freeshell.de>
 <20250203013730.269558-6-e@freeshell.de>
 <25B3D8909DBCC21B+43663a76-4afa-44ae-95e2-3a8792de614c@linux.starfivetech.com>
 <206a6ada-1ef9-47f3-b1cf-fb1a1540e95c@canonical.com>
 <62D89163A60680E7+f0f5a4d4-42f1-454d-9dfe-cf53e2aca4ac@linux.starfivetech.com>
 <cba21857-7eb2-4f10-a1bd-6743ce63dfa6@freeshell.de>
 <ZQ2PR01MB1307ECDF175D20547AC69287E6F1A@ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn>
 <8b0f7b4f-e58a-45ae-931f-2b2853918ab4@freeshell.de>
 <AM7P189MB10099481BDC2CADF476EB755E3CC2@AM7P189MB1009.EURP189.PROD.OUTLOOK.COM>
 <92745e6b-7c10-4b16-836b-66a1e2ecf1c4@freeshell.de>
 <25ac53a3-3f3c-4509-ab28-46adbf4f15e6@canonical.com>
Content-Language: en-US
From: E Shattow <e@freeshell.de>
In-Reply-To: <25ac53a3-3f3c-4509-ab28-46adbf4f15e6@canonical.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On 4/24/25 03:54, Heinrich Schuchardt wrote:
> On 24.04.25 07:15, E Shattow wrote:
>>
>>
>> On 2/28/25 01:54, Maud Spierings wrote:
>>>
>>> On 2/28/25 8:53 AM, E Shattow wrote:
>>>>
>>>> On 2/6/25 19:01, Hal Feng wrote:
>>>>>> On 06.02.25 19:17, E Shattow wrote:
>>>>>> On 2/5/25 18:59, Hal Feng wrote:
>>>>>>> On 2/5/2025 6:01 PM, Heinrich Schuchardt wrote:
>>>>>>>> On 2/5/25 08:57, Hal Feng wrote:
>>>>>>>>> On 2/3/2025 9:37 AM, E Shattow wrote:
>>>>>>>>>> Add bootph-pre-ram hinting to jh7110-common.dtsi:
>>>>>>>>>>      - i2c5_pins and i2c-pins subnode for connection to eeprom
>>>>>>>>>>      - eeprom node
>>>>>>>>>>      - qspi flash configuration subnode
>>>>>>>>>>      - memory node
>>>>>>>>>>      - uart0 for serial console
>>>>>>>>>>
>>>>>>>>>>      With this the U-Boot SPL secondary program loader may
>>>>>>>>>> drop such
>>>>>>>>>>      overrides when using dt-rebasing with JH7110 OF_UPSTREAM
>>>>>>>>>> board
>>>>>> targets.
>>>>>>>>>> Signed-off-by: E Shattow <e@freeshell.de>
>>>>>>>>>> ---
>>>>>>>>>>     arch/riscv/boot/dts/starfive/jh7110-common.dtsi | 6 ++++++
>>>>>>>>>>     1 file changed, 6 insertions(+)
>>>>>>>>>>
>>>>>>>>>> diff --git a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
>>>>>>>>>> b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
>>>>>>>>>> index 30c5f3487c8b..c9e7ae59ee7c 100644
>>>>>>>>>> --- a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
>>>>>>>>>> +++ b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
>>>>>>>>>> @@ -28,6 +28,7 @@ chosen {
>>>>>>>>>>         memory@40000000 {
>>>>>>>>>>             device_type = "memory";
>>>>>>>>>>             reg = <0x0 0x40000000 0x1 0x0>;
>>>>>>>>>> +        bootph-pre-ram;
>>>>>>>>>>         };
>>>>>>>>>>           gpio-restart {
>>>>>>>>>> @@ -247,6 +248,7 @@ emmc_vdd: aldo4 {
>>>>>>>>>>         };
>>>>>>>>>>           eeprom@50 {
>>>>>>>>>> +        bootph-pre-ram;
>>>>>>>>>>             compatible = "atmel,24c04";
>>>>>>>>>>             reg = <0x50>;
>>>>>>>>>>             pagesize = <16>;
>>>>>>>>>> @@ -323,6 +325,7 @@ &qspi {
>>>>>>>>>>         nor_flash: flash@0 {
>>>>>>>>>>             compatible = "jedec,spi-nor";
>>>>>>>>>>             reg = <0>;
>>>>>>>>>> +        bootph-pre-ram;
>>>>>>>>>>             cdns,read-delay = <2>;
>>>>>>>>>>             spi-max-frequency = <100000000>;
>>>>>>>>>>             cdns,tshsl-ns = <1>;
>>>>>>>>>> @@ -405,6 +408,7 @@ GPOEN_SYS_I2C2_DATA,
>>>>>>>>>>         };
>>>>>>>>>>           i2c5_pins: i2c5-0 {
>>>>>>>>>> +        bootph-pre-ram;
>>>>>>>>>>             i2c-pins {
>>>>>>>>>>                 pinmux = <GPIOMUX(19, GPOUT_LOW,
>>>>>>>>>>                               GPOEN_SYS_I2C5_CLK, @@ -413,6
>>>>>>>>>> +417,7 @@
>>>>>>>>>> GPI_SYS_I2C5_CLK)>,
>>>>>>>>>>                               GPOEN_SYS_I2C5_DATA,
>>>>>>>>>>                               GPI_SYS_I2C5_DATA)>;
>>>>>>>>>>                 bias-disable; /* external pull-up */
>>>>>>>>>> +            bootph-pre-ram;
>>>>>>>>>>                 input-enable;
>>>>>>>>>>                 input-schmitt-enable;
>>>>>>>>>>             };
>>>>>>>>>> @@ -641,6 +646,7 @@ GPOEN_DISABLE,
>>>>>>>>>>     };
>>>>>>>>>>       &uart0 {
>>>>>>>>>> +    bootph-pre-ram;
>>>>>>>>>>         clock-frequency = <24000000>;
>>>>>>>>>>         pinctrl-names = "default";
>>>>>>>>>>         pinctrl-0 = <&uart0_pins>;
>>>>>>>>> What about &mmc0, &mmc1, &qspi, &sysgpio, &mmc0_pins,
>>>>>> &mmc1_pins, &i2c5?
>>>>>>>>> Why not add "bootph-pre-ram;" for them?
>>>>>>>> Would they be needed before relocation of U-Boot to DRAM?
>>>>>>> Yeah, they are needed by SPL and they are set in U-Boot
>>>>>>> arch/riscv/dts/jh7110-common-u-boot.dtsi.
>>>>>>>
>>>>>>> Best regards,
>>>>>>> Hal
>>>>>>>
>>>>>> When I tested on Star64 there was none of those needed to boot. We
>>>>>> can add
>>>>>> more bootph-pre-ram as needed but I want to know how to test
>>>>>> (because I
>>>>>> did not see any need for these).
>>>>>>
>>>>>> How do you test that these are needed?
>>>>> In my opinion, SPL need to read U-Boot from EMMC (mmc0) or SDcard
>>>>> (mmc1) or
>>>>> QSPI flash (qspi). Also it need to choose the correct DTB by reading
>>>>> EEPROM
>>>>> mounted on i2c5. To run mmc / i2c drivers, the pin configurations
>>>>> (sysgpio, mmc0/1_pins)
>>>>> are also needed.
>>>>>
>>>>> Best regards,
>>>>> Hal
>>>> EMMC or SDcard are not possible to boot (via JH7110 boot ROM, distinct
>>>> from QSPI boot of U-Boot and later EMMC or SDcard capability) in this
>>>> way on some of the boards where transistor logic pairs GPIO0 and GPIO1
>>>> both-off or both-on. SDcard boot is officially recommended against as
>>>> "not supported" by the StarFive reference documentation, and I suppose
>>>> what remains is EMMC boot as valid though I have not heard of any users
>>>> for this.
>>>
>>>
>>> I tend to use SDcard boot on my deepcomputing fml13v01 board to test
>>>
>>> before I flash the firmware to spi flash. I've not encountered issues. I
>>> have not tried eMMC but I assume it is the same.
>>>
>>>> What is the test procedure for EMMC boot, can you explain and I will
>>>> try
>>>> it on the Star64?
>>>
>>>
>>> I believe this page contains enough info to use it:
>>>
>>> https://docs.u-boot.org/en/latest/board/starfive/visionfive2.html
>>>
>>>> -E
>>
>> I followed that info to get JH7110 ZBL SD Card boot mode to load U-Boot
>> by adding only bootph-pre-ram to the &mmc1 node. However, no success for
>> U-Boot with JH7110 ZBL eMMC boot mode. I additionally tried the build of
>> U-Boot as the Star64 arrives from factory, and U-Boot release 2025.01,
>> both which are also working for JH7110 ZBL SD card boot mode and not
>> JH7110 ZBL eMMC boot mode. Obvious to me is that page does not contain
>> enough info to test for eMMC, and/or I am doing this wrong.
>>
>> When no valid eMMC device is present:
>>
>> dwmci_s: Response Timeout.
>> BOOT fail,Error is 0xffffffff
>> dwmci_s: Response Timeout.
>> BOOT fail,Error is 0xffffffff
>>
>> With the prepared eMMC storage connected there is not any output.
>>
>> What is the preparation and test procedure for JH7110 ZBL eMMC boot mode?
>>
>> -E
> 
> Hello E,
> 
> I have tested on the StarFive VisionFive 2.
> 
> You can write U-Boot SPL to sector 0 of the eMMC and it will be booted.
> But with our code it will not find main U-Boot. (There seems to be a bug
> in our SPL code as it does not fall back to Y-modem.)
> 
> To allow adding a GPT table the vendor image therefore uses the fall-
> back to the backup SPL as follows.
> 
> With u-boot-spl.bin.normal.out starting at sector 4096 (byte 0x200000)
> add the following bytes to the GPT table:
> 

> Position 0x0000: 40 02 00 00  00 00 20 00

Position 0x0000 is within the executable code area of standard (or
protective) MBR, and so GPT is not affected.

What about SD-card, does JH7110 loader code in MaskROM follow or ignore
this treatment?

> Position 0x0290: 40 02 00 00  00 00 20 00

Position 0x0290 is within the "must be zeroes for the rest of the block"
area of GPT header when sector size is 512 bytes. For eMMC we're working
with 512byte sectors? If eMMC was written with standard MBR then what is
this, just assumed to be somewhere inside the first partition? How does
StarFive create distro images i.e.
starfive-jh7110-202302-eMMC-minimal-desktop.img [1] for eMMC with these
prepared values, is this documented officially or in the StarFive git
repo history?

> 
> The value 0x00000240 is the offset to the SPL header.

> The value 0x00200000 is the position of the backup SPL.
> 
> Likewise with u-boot-spl.bin.normal.out at sector 2048 (byte 0x100000) use:
> 
> Position 0x0000: 40 02 00 00  00 00 10 00
> Position 0x0290: 40 02 00 00  00 00 10 00
> 
> Best regards
> 
> Heinrich

Thanks, Heinrich, helpful to know I was missing information. It does not
answer for me the question of what the logic is in the JH7110 boot code
for forming a correct test methodology. Anyway I learn a lot from this
analysis and it is much appreciated!

Hal - I would like (and/or from anyone representing StarFive) some code
listing of the JH7110 CPU MaskROM on what the SD-card and eMMC boot code
 is actually doing ... if you want this supported or you should describe
the logic flow and magic numbers, offset locations, etc. expected so I
can properly test for it. Aside, there is also a promise from 2023
January to release the supporting code for jh7110-recovery.bin SPL
utility for writing SPI NOR flash and eMMC contents [2] that should be
considered... where is the code and documentation to do what you want done?

-E

1: https://rvspace.org/en/project/VisionFive2_Debian_Wiki_202302_Release
2: https://github.com/starfive-tech/Tools/issues/2
