Received: from freeshell.de (freeshell.de [116.202.128.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50E98231C93;
	Thu,  6 Feb 2025 11:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.202.128.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738840657; cv=none; b=s00lfilZwFPe4QD+jxJGfYHRZ4hzfhkGqaMkeG87qswniLr5eK58mNW04XOMq+3DiiZgs09/0k4ZJzG61iuFm4Pt1Jjyn20Kp3YKnWzsnaAkhrcfIpJIuo50RqMDyb7xYBKeMee6OkAG0YbGyvFIQkLqNpXAiUe/CsU7UGM+sPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738840657; c=relaxed/simple;
	bh=ezNjwgmmcFYrjAONuxq78XKF7D11NIr1ZyhppvYoqIA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X+TA5GiqDIft9xS4qLg6EmjIB4qsMa/QjSzl/60+Mb90mvi9djO8RXoX/+8350uIE4aJRhTXsP9Us2ijyLYFHqsNwfqEI3v8HrRTZtf31kOM1x5e/Y47RG0Hpje2/2VmzwIG6UVDnZb2ClEaoWzIsn0uSNbY6jespG5tiufE470=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=freeshell.de; spf=pass smtp.mailfrom=freeshell.de; arc=none smtp.client-ip=116.202.128.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=freeshell.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freeshell.de
Received: from [192.168.2.35] (unknown [98.97.25.24])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id 845CEB4C0145;
	Thu,  6 Feb 2025 12:17:28 +0100 (CET)
Message-ID: <cba21857-7eb2-4f10-a1bd-6743ce63dfa6@freeshell.de>
Date: Thu, 6 Feb 2025 03:17:26 -0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] riscv: dts: starfive: jh7110-common:
 bootph-pre-ram hinting needed by boot loader
To: Hal Feng <hal.feng@linux.starfivetech.com>,
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, Emil Renner Berthing <kernel@esmil.dk>,
 Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Hal Feng <hal.feng@starfivetech.com>
References: <20250203013730.269558-1-e@freeshell.de>
 <20250203013730.269558-6-e@freeshell.de>
 <25B3D8909DBCC21B+43663a76-4afa-44ae-95e2-3a8792de614c@linux.starfivetech.com>
 <206a6ada-1ef9-47f3-b1cf-fb1a1540e95c@canonical.com>
 <62D89163A60680E7+f0f5a4d4-42f1-454d-9dfe-cf53e2aca4ac@linux.starfivetech.com>
Content-Language: en-US
From: E Shattow <e@freeshell.de>
In-Reply-To: <62D89163A60680E7+f0f5a4d4-42f1-454d-9dfe-cf53e2aca4ac@linux.starfivetech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 2/5/25 18:59, Hal Feng wrote:
> On 2/5/2025 6:01 PM, Heinrich Schuchardt wrote:
>> On 2/5/25 08:57, Hal Feng wrote:
>>> On 2/3/2025 9:37 AM, E Shattow wrote:
>>>> Add bootph-pre-ram hinting to jh7110-common.dtsi:
>>>>    - i2c5_pins and i2c-pins subnode for connection to eeprom
>>>>    - eeprom node
>>>>    - qspi flash configuration subnode
>>>>    - memory node
>>>>    - uart0 for serial console
>>>>
>>>>    With this the U-Boot SPL secondary program loader may drop such
>>>>    overrides when using dt-rebasing with JH7110 OF_UPSTREAM board targets.
>>>>
>>>> Signed-off-by: E Shattow <e@freeshell.de>
>>>> ---
>>>>   arch/riscv/boot/dts/starfive/jh7110-common.dtsi | 6 ++++++
>>>>   1 file changed, 6 insertions(+)
>>>>
>>>> diff --git a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
>>>> index 30c5f3487c8b..c9e7ae59ee7c 100644
>>>> --- a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
>>>> +++ b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
>>>> @@ -28,6 +28,7 @@ chosen {
>>>>       memory@40000000 {
>>>>           device_type = "memory";
>>>>           reg = <0x0 0x40000000 0x1 0x0>;
>>>> +        bootph-pre-ram;
>>>>       };
>>>>         gpio-restart {
>>>> @@ -247,6 +248,7 @@ emmc_vdd: aldo4 {
>>>>       };
>>>>         eeprom@50 {
>>>> +        bootph-pre-ram;
>>>>           compatible = "atmel,24c04";
>>>>           reg = <0x50>;
>>>>           pagesize = <16>;
>>>> @@ -323,6 +325,7 @@ &qspi {
>>>>       nor_flash: flash@0 {
>>>>           compatible = "jedec,spi-nor";
>>>>           reg = <0>;
>>>> +        bootph-pre-ram;
>>>>           cdns,read-delay = <2>;
>>>>           spi-max-frequency = <100000000>;
>>>>           cdns,tshsl-ns = <1>;
>>>> @@ -405,6 +408,7 @@ GPOEN_SYS_I2C2_DATA,
>>>>       };
>>>>         i2c5_pins: i2c5-0 {
>>>> +        bootph-pre-ram;
>>>>           i2c-pins {
>>>>               pinmux = <GPIOMUX(19, GPOUT_LOW,
>>>>                             GPOEN_SYS_I2C5_CLK,
>>>> @@ -413,6 +417,7 @@ GPI_SYS_I2C5_CLK)>,
>>>>                             GPOEN_SYS_I2C5_DATA,
>>>>                             GPI_SYS_I2C5_DATA)>;
>>>>               bias-disable; /* external pull-up */
>>>> +            bootph-pre-ram;
>>>>               input-enable;
>>>>               input-schmitt-enable;
>>>>           };
>>>> @@ -641,6 +646,7 @@ GPOEN_DISABLE,
>>>>   };
>>>>     &uart0 {
>>>> +    bootph-pre-ram;
>>>>       clock-frequency = <24000000>;
>>>>       pinctrl-names = "default";
>>>>       pinctrl-0 = <&uart0_pins>;
>>>
>>> What about &mmc0, &mmc1, &qspi, &sysgpio, &mmc0_pins, &mmc1_pins, &i2c5?
>>> Why not add "bootph-pre-ram;" for them?
>>
>> Would they be needed before relocation of U-Boot to DRAM?
> 
> Yeah, they are needed by SPL and they are set in
> U-Boot arch/riscv/dts/jh7110-common-u-boot.dtsi.
> 
> Best regards,
> Hal
> 

When I tested on Star64 there was none of those needed to boot. We can
add more bootph-pre-ram as needed but I want to know how to test
(because I did not see any need for these).

How do you test that these are needed?

-E
