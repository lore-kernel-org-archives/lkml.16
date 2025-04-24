Received: from freeshell.de (freeshell.de [116.202.128.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8561B4A23;
	Thu, 24 Apr 2025 05:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.202.128.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745471741; cv=none; b=uYLZbWkewsvOekgLd+bV8uKGexzWjp71miKLdSD7gYVEXy6sOcPb+H7BjkKtTzaPdwdTqwGLwOtPAi+SyqjVMTryVuu6VTj+91GaGrhj2KMlojflZJf4aWe5hvKh/67Pxm5nmjp9TYZcBmr7b9bbz/ZVIucrQlxy+7mOq1bEQ7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745471741; c=relaxed/simple;
	bh=3DIsV/gz+7FEJ6xoUv53CVIlpPvOjYMdQgPt0Jzsnbg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Yk5VJpl3diWldn9bU6PQFDIvxz6CZJ1IpCnlss+UzhnhAjP2YvOO/1A2qod4Fe/NeqJX6wShCKn3MGq2Y79fV0bZ8p9dvEp7RvQEg7BZV4KNIqyK9u+7tEsMYzPb6kGlve2VZFbKgl6HEz/nqhQvRGNel3EDM6YcGZ+NNmTj2Cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=freeshell.de; spf=pass smtp.mailfrom=freeshell.de; arc=none smtp.client-ip=116.202.128.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=freeshell.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freeshell.de
Received: from [192.168.2.35] (unknown [98.97.25.173])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id 2AB9AB2C171F;
	Thu, 24 Apr 2025 07:15:30 +0200 (CEST)
Message-ID: <92745e6b-7c10-4b16-836b-66a1e2ecf1c4@freeshell.de>
Date: Wed, 23 Apr 2025 22:15:29 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] riscv: dts: starfive: jh7110-common:
 bootph-pre-ram hinting needed by boot loader
To: Maud Spierings <maud_spierings@hotmail.com>,
 Hal Feng <hal.feng@starfivetech.com>,
 Hal Feng <hal.feng@linux.starfivetech.com>,
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Emil Renner Berthing <kernel@esmil.dk>, Conor Dooley <conor@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
References: <20250203013730.269558-1-e@freeshell.de>
 <20250203013730.269558-6-e@freeshell.de>
 <25B3D8909DBCC21B+43663a76-4afa-44ae-95e2-3a8792de614c@linux.starfivetech.com>
 <206a6ada-1ef9-47f3-b1cf-fb1a1540e95c@canonical.com>
 <62D89163A60680E7+f0f5a4d4-42f1-454d-9dfe-cf53e2aca4ac@linux.starfivetech.com>
 <cba21857-7eb2-4f10-a1bd-6743ce63dfa6@freeshell.de>
 <ZQ2PR01MB1307ECDF175D20547AC69287E6F1A@ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn>
 <8b0f7b4f-e58a-45ae-931f-2b2853918ab4@freeshell.de>
 <AM7P189MB10099481BDC2CADF476EB755E3CC2@AM7P189MB1009.EURP189.PROD.OUTLOOK.COM>
Content-Language: en-US
From: E Shattow <e@freeshell.de>
In-Reply-To: <AM7P189MB10099481BDC2CADF476EB755E3CC2@AM7P189MB1009.EURP189.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 2/28/25 01:54, Maud Spierings wrote:
> 
> On 2/28/25 8:53 AM, E Shattow wrote:
>>
>> On 2/6/25 19:01, Hal Feng wrote:
>>>> On 06.02.25 19:17, E Shattow wrote:
>>>> On 2/5/25 18:59, Hal Feng wrote:
>>>>> On 2/5/2025 6:01 PM, Heinrich Schuchardt wrote:
>>>>>> On 2/5/25 08:57, Hal Feng wrote:
>>>>>>> On 2/3/2025 9:37 AM, E Shattow wrote:
>>>>>>>> Add bootph-pre-ram hinting to jh7110-common.dtsi:
>>>>>>>>     - i2c5_pins and i2c-pins subnode for connection to eeprom
>>>>>>>>     - eeprom node
>>>>>>>>     - qspi flash configuration subnode
>>>>>>>>     - memory node
>>>>>>>>     - uart0 for serial console
>>>>>>>>
>>>>>>>>     With this the U-Boot SPL secondary program loader may drop such
>>>>>>>>     overrides when using dt-rebasing with JH7110 OF_UPSTREAM board
>>>> targets.
>>>>>>>> Signed-off-by: E Shattow <e@freeshell.de>
>>>>>>>> ---
>>>>>>>>    arch/riscv/boot/dts/starfive/jh7110-common.dtsi | 6 ++++++
>>>>>>>>    1 file changed, 6 insertions(+)
>>>>>>>>
>>>>>>>> diff --git a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
>>>>>>>> b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
>>>>>>>> index 30c5f3487c8b..c9e7ae59ee7c 100644
>>>>>>>> --- a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
>>>>>>>> +++ b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
>>>>>>>> @@ -28,6 +28,7 @@ chosen {
>>>>>>>>        memory@40000000 {
>>>>>>>>            device_type = "memory";
>>>>>>>>            reg = <0x0 0x40000000 0x1 0x0>;
>>>>>>>> +        bootph-pre-ram;
>>>>>>>>        };
>>>>>>>>          gpio-restart {
>>>>>>>> @@ -247,6 +248,7 @@ emmc_vdd: aldo4 {
>>>>>>>>        };
>>>>>>>>          eeprom@50 {
>>>>>>>> +        bootph-pre-ram;
>>>>>>>>            compatible = "atmel,24c04";
>>>>>>>>            reg = <0x50>;
>>>>>>>>            pagesize = <16>;
>>>>>>>> @@ -323,6 +325,7 @@ &qspi {
>>>>>>>>        nor_flash: flash@0 {
>>>>>>>>            compatible = "jedec,spi-nor";
>>>>>>>>            reg = <0>;
>>>>>>>> +        bootph-pre-ram;
>>>>>>>>            cdns,read-delay = <2>;
>>>>>>>>            spi-max-frequency = <100000000>;
>>>>>>>>            cdns,tshsl-ns = <1>;
>>>>>>>> @@ -405,6 +408,7 @@ GPOEN_SYS_I2C2_DATA,
>>>>>>>>        };
>>>>>>>>          i2c5_pins: i2c5-0 {
>>>>>>>> +        bootph-pre-ram;
>>>>>>>>            i2c-pins {
>>>>>>>>                pinmux = <GPIOMUX(19, GPOUT_LOW,
>>>>>>>>                              GPOEN_SYS_I2C5_CLK, @@ -413,6
>>>>>>>> +417,7 @@
>>>>>>>> GPI_SYS_I2C5_CLK)>,
>>>>>>>>                              GPOEN_SYS_I2C5_DATA,
>>>>>>>>                              GPI_SYS_I2C5_DATA)>;
>>>>>>>>                bias-disable; /* external pull-up */
>>>>>>>> +            bootph-pre-ram;
>>>>>>>>                input-enable;
>>>>>>>>                input-schmitt-enable;
>>>>>>>>            };
>>>>>>>> @@ -641,6 +646,7 @@ GPOEN_DISABLE,
>>>>>>>>    };
>>>>>>>>      &uart0 {
>>>>>>>> +    bootph-pre-ram;
>>>>>>>>        clock-frequency = <24000000>;
>>>>>>>>        pinctrl-names = "default";
>>>>>>>>        pinctrl-0 = <&uart0_pins>;
>>>>>>> What about &mmc0, &mmc1, &qspi, &sysgpio, &mmc0_pins,
>>>> &mmc1_pins, &i2c5?
>>>>>>> Why not add "bootph-pre-ram;" for them?
>>>>>> Would they be needed before relocation of U-Boot to DRAM?
>>>>> Yeah, they are needed by SPL and they are set in U-Boot
>>>>> arch/riscv/dts/jh7110-common-u-boot.dtsi.
>>>>>
>>>>> Best regards,
>>>>> Hal
>>>>>
>>>> When I tested on Star64 there was none of those needed to boot. We
>>>> can add
>>>> more bootph-pre-ram as needed but I want to know how to test (because I
>>>> did not see any need for these).
>>>>
>>>> How do you test that these are needed?
>>> In my opinion, SPL need to read U-Boot from EMMC (mmc0) or SDcard
>>> (mmc1) or
>>> QSPI flash (qspi). Also it need to choose the correct DTB by reading
>>> EEPROM
>>> mounted on i2c5. To run mmc / i2c drivers, the pin configurations
>>> (sysgpio, mmc0/1_pins)
>>> are also needed.
>>>
>>> Best regards,
>>> Hal
>> EMMC or SDcard are not possible to boot (via JH7110 boot ROM, distinct
>> from QSPI boot of U-Boot and later EMMC or SDcard capability) in this
>> way on some of the boards where transistor logic pairs GPIO0 and GPIO1
>> both-off or both-on. SDcard boot is officially recommended against as
>> "not supported" by the StarFive reference documentation, and I suppose
>> what remains is EMMC boot as valid though I have not heard of any users
>> for this.
> 
> 
> I tend to use SDcard boot on my deepcomputing fml13v01 board to test
> 
> before I flash the firmware to spi flash. I've not encountered issues. I
> have not tried eMMC but I assume it is the same.
> 
>> What is the test procedure for EMMC boot, can you explain and I will try
>> it on the Star64?
> 
> 
> I believe this page contains enough info to use it:
> 
> https://docs.u-boot.org/en/latest/board/starfive/visionfive2.html
> 
>> -E

I followed that info to get JH7110 ZBL SD Card boot mode to load U-Boot
by adding only bootph-pre-ram to the &mmc1 node. However, no success for
U-Boot with JH7110 ZBL eMMC boot mode. I additionally tried the build of
U-Boot as the Star64 arrives from factory, and U-Boot release 2025.01,
both which are also working for JH7110 ZBL SD card boot mode and not
JH7110 ZBL eMMC boot mode. Obvious to me is that page does not contain
enough info to test for eMMC, and/or I am doing this wrong.

When no valid eMMC device is present:

dwmci_s: Response Timeout.
BOOT fail,Error is 0xffffffff
dwmci_s: Response Timeout.
BOOT fail,Error is 0xffffffff

With the prepared eMMC storage connected there is not any output.

What is the preparation and test procedure for JH7110 ZBL eMMC boot mode?

-E
