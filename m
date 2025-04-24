Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3C2C22489A
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 10:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745492076; cv=none; b=EV2iC9s5LADTcbeeLMKKG98oX3Y4GVoWlWpnsRte8kzO49PhuHq1uyzDKu9l+tH/asoSutm0gtEAis9QTxLjyT9XdjRoHs2Znv0BDDCVFQ8eWzP37b1j7H8jOAOKB7f1moVylr/7ATuiDvhqnRvmFQmIf19/Yw97eaO+2djv8U8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745492076; c=relaxed/simple;
	bh=XHWdxHD3g7xGu12ZT2bmxsDXt+ng0m1HKnXp5QOsbas=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ppt7I6hxW/sRQMAUzyeef0i8KJV08bZ5S6rJR49NRTX6xhD+QtxRTOqwsQpr5rLAVGKawq5qxrn3cccexQQCbCAr1S0X80qrQtxECQmpyXbFvgXoRp9sqsk+qcm6/I9TKnWzwQSQ7lf3sTVV4RkiyMSiHkvarLRliUPnL7r62zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=rH9a1buO; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="rH9a1buO"
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id DA1F43F473
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 10:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1745492065;
	bh=eqhLDRtyKX6rzGIClke4n/FgG558kgab7Vgy/UBFI1M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=rH9a1buO6KFTi+khwGlBKw0zsvLuLV2Wl8oOjjjK2NxpjVYk0rvpYNdHXMSfZ5PeL
	 UOrQ1K3hcHXBzimJxCQ842EafV0rqv6jDQcK3tYnWAFeI52CGGNcMO8YV0cdNiYBn9
	 ndCiBivBs/CIuiw4jKEh9IenGPsQJUcUGzUyqlf8DfsEK9mpSl0w0/A77IAlpSLcg6
	 L4pmAfHfWdcCgnFB6/Hgv1Y/214o78H/72nVpc/1biQQEPOsaotz8Fu626H0S3orXj
	 zuMbHRpQEHsYqxd4mg+2W+wXL75OXVFuABdGq5Yo8UQik3ZbzLSXknrD2WRRchRTQU
	 wGo7rjAI9MQJg==
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43d5ca7c86aso4677735e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 03:54:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745492065; x=1746096865;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eqhLDRtyKX6rzGIClke4n/FgG558kgab7Vgy/UBFI1M=;
        b=ArWA24mGQYYu0ylXcexjXG4//nyNXy0xKjs2VNpJsrFN+Gcvihc5uaB/lZj5C+RybE
         6Gy5kqfVCjqR7NUoixNRFRsy7Axgc3GhZxBI9QWJYGHgQw2MS8phbWdj5XNXsMIpowiE
         kkYqJwOQv/LraghRr9fQrQnxdDSY2kL0NUdAIsPzV6JYHjq/7GF61DhW5lZIXCLlzd2p
         N/1CVC9WhDEbz/kEbK9G4Y2XSZpmnuXDWPRnlhecJowWePKEIw+5nyDVKz+9LNJRpJfp
         0DVdRkKZ31CkT4+Pu/EXBA6o1ca1GKX4FttfNM2N/Dkqy25D5g6lEm4j2YwrAGuSs1Mw
         rEJQ==
X-Gm-Message-State: AOJu0YymdZECPcUZXPxaPt73rdd3HdDfxGOAb9gi6Ti3VYM91QB7EJhf
	QRh5ACRz5xHdMSuVHwcFIT1ng/ib9JhfBM5TyFr4XuAxULZuQzR/pdTntGvXgMIgcuTmGWF55cd
	qHw/Fpx3UsEy1v0Fh9RQarhV+YhDbYURJEw+re46QofFy1s1fYC/s1uu1DlFv0XZpHt8Ct8264s
	1v9A==
X-Gm-Gg: ASbGncve3YH8842uY9+wtgtxUAmlmloCzaxppl/3wje67Dp/QG3o8AR3ehe8gfw1ukH
	sjNEECKpEhVcykZaulnf4Q0gm3pjHeY7sTq12eKIc22PjN7YU24ybfD5qfb3C404uFbwg/zMOPI
	G61JdWgXtMfhPDNyKFN6gIq3aYl7DzcG/ph3JpPXKjGbn0ViwhTT4hlZ1psVUSSndoUl+DfvspM
	4Xmy3cknWrS/eIU9rp/KzDNhvn3sFk0K8S1I7fseoZK1oLhwiqHqLLYX0RH1H78iDl8RzwWzb8W
	XmY7qfHZCOAu97kArAHtn4GICkbEs2wvFPOKnquld8YHR3ZIlMl10xpME2kCktQoWuDylPb4TFp
	FLte+5+UO
X-Received: by 2002:a05:600c:3496:b0:43b:cc42:c54f with SMTP id 5b1f17b1804b1-4409bd18487mr19911095e9.14.1745492065494;
        Thu, 24 Apr 2025 03:54:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHGhodf+3zok9UaV7dC/Fxdnv/pJDOhCCuu5J3ufSCE4NmAhnsJ7ezbZaDbEWPpw7N/az28sg==
X-Received: by 2002:a05:600c:3496:b0:43b:cc42:c54f with SMTP id 5b1f17b1804b1-4409bd18487mr19910865e9.14.1745492065099;
        Thu, 24 Apr 2025 03:54:25 -0700 (PDT)
Received: from [192.168.103.102] (ip-005-147-080-091.um06.pools.vodafone-ip.de. [5.147.80.91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2a152csm16418575e9.12.2025.04.24.03.54.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 03:54:24 -0700 (PDT)
Message-ID: <25ac53a3-3f3c-4509-ab28-46adbf4f15e6@canonical.com>
Date: Thu, 24 Apr 2025 12:54:23 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] riscv: dts: starfive: jh7110-common:
 bootph-pre-ram hinting needed by boot loader
To: E Shattow <e@freeshell.de>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Emil Renner Berthing <kernel@esmil.dk>, Conor Dooley <conor@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Maud Spierings <maud_spierings@hotmail.com>,
 Hal Feng <hal.feng@linux.starfivetech.com>,
 Hal Feng <hal.feng@starfivetech.com>
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
Content-Language: en-US
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
In-Reply-To: <92745e6b-7c10-4b16-836b-66a1e2ecf1c4@freeshell.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 24.04.25 07:15, E Shattow wrote:
> 
> 
> On 2/28/25 01:54, Maud Spierings wrote:
>>
>> On 2/28/25 8:53 AM, E Shattow wrote:
>>>
>>> On 2/6/25 19:01, Hal Feng wrote:
>>>>> On 06.02.25 19:17, E Shattow wrote:
>>>>> On 2/5/25 18:59, Hal Feng wrote:
>>>>>> On 2/5/2025 6:01 PM, Heinrich Schuchardt wrote:
>>>>>>> On 2/5/25 08:57, Hal Feng wrote:
>>>>>>>> On 2/3/2025 9:37 AM, E Shattow wrote:
>>>>>>>>> Add bootph-pre-ram hinting to jh7110-common.dtsi:
>>>>>>>>>      - i2c5_pins and i2c-pins subnode for connection to eeprom
>>>>>>>>>      - eeprom node
>>>>>>>>>      - qspi flash configuration subnode
>>>>>>>>>      - memory node
>>>>>>>>>      - uart0 for serial console
>>>>>>>>>
>>>>>>>>>      With this the U-Boot SPL secondary program loader may drop such
>>>>>>>>>      overrides when using dt-rebasing with JH7110 OF_UPSTREAM board
>>>>> targets.
>>>>>>>>> Signed-off-by: E Shattow <e@freeshell.de>
>>>>>>>>> ---
>>>>>>>>>     arch/riscv/boot/dts/starfive/jh7110-common.dtsi | 6 ++++++
>>>>>>>>>     1 file changed, 6 insertions(+)
>>>>>>>>>
>>>>>>>>> diff --git a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
>>>>>>>>> b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
>>>>>>>>> index 30c5f3487c8b..c9e7ae59ee7c 100644
>>>>>>>>> --- a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
>>>>>>>>> +++ b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
>>>>>>>>> @@ -28,6 +28,7 @@ chosen {
>>>>>>>>>         memory@40000000 {
>>>>>>>>>             device_type = "memory";
>>>>>>>>>             reg = <0x0 0x40000000 0x1 0x0>;
>>>>>>>>> +        bootph-pre-ram;
>>>>>>>>>         };
>>>>>>>>>           gpio-restart {
>>>>>>>>> @@ -247,6 +248,7 @@ emmc_vdd: aldo4 {
>>>>>>>>>         };
>>>>>>>>>           eeprom@50 {
>>>>>>>>> +        bootph-pre-ram;
>>>>>>>>>             compatible = "atmel,24c04";
>>>>>>>>>             reg = <0x50>;
>>>>>>>>>             pagesize = <16>;
>>>>>>>>> @@ -323,6 +325,7 @@ &qspi {
>>>>>>>>>         nor_flash: flash@0 {
>>>>>>>>>             compatible = "jedec,spi-nor";
>>>>>>>>>             reg = <0>;
>>>>>>>>> +        bootph-pre-ram;
>>>>>>>>>             cdns,read-delay = <2>;
>>>>>>>>>             spi-max-frequency = <100000000>;
>>>>>>>>>             cdns,tshsl-ns = <1>;
>>>>>>>>> @@ -405,6 +408,7 @@ GPOEN_SYS_I2C2_DATA,
>>>>>>>>>         };
>>>>>>>>>           i2c5_pins: i2c5-0 {
>>>>>>>>> +        bootph-pre-ram;
>>>>>>>>>             i2c-pins {
>>>>>>>>>                 pinmux = <GPIOMUX(19, GPOUT_LOW,
>>>>>>>>>                               GPOEN_SYS_I2C5_CLK, @@ -413,6
>>>>>>>>> +417,7 @@
>>>>>>>>> GPI_SYS_I2C5_CLK)>,
>>>>>>>>>                               GPOEN_SYS_I2C5_DATA,
>>>>>>>>>                               GPI_SYS_I2C5_DATA)>;
>>>>>>>>>                 bias-disable; /* external pull-up */
>>>>>>>>> +            bootph-pre-ram;
>>>>>>>>>                 input-enable;
>>>>>>>>>                 input-schmitt-enable;
>>>>>>>>>             };
>>>>>>>>> @@ -641,6 +646,7 @@ GPOEN_DISABLE,
>>>>>>>>>     };
>>>>>>>>>       &uart0 {
>>>>>>>>> +    bootph-pre-ram;
>>>>>>>>>         clock-frequency = <24000000>;
>>>>>>>>>         pinctrl-names = "default";
>>>>>>>>>         pinctrl-0 = <&uart0_pins>;
>>>>>>>> What about &mmc0, &mmc1, &qspi, &sysgpio, &mmc0_pins,
>>>>> &mmc1_pins, &i2c5?
>>>>>>>> Why not add "bootph-pre-ram;" for them?
>>>>>>> Would they be needed before relocation of U-Boot to DRAM?
>>>>>> Yeah, they are needed by SPL and they are set in U-Boot
>>>>>> arch/riscv/dts/jh7110-common-u-boot.dtsi.
>>>>>>
>>>>>> Best regards,
>>>>>> Hal
>>>>>>
>>>>> When I tested on Star64 there was none of those needed to boot. We
>>>>> can add
>>>>> more bootph-pre-ram as needed but I want to know how to test (because I
>>>>> did not see any need for these).
>>>>>
>>>>> How do you test that these are needed?
>>>> In my opinion, SPL need to read U-Boot from EMMC (mmc0) or SDcard
>>>> (mmc1) or
>>>> QSPI flash (qspi). Also it need to choose the correct DTB by reading
>>>> EEPROM
>>>> mounted on i2c5. To run mmc / i2c drivers, the pin configurations
>>>> (sysgpio, mmc0/1_pins)
>>>> are also needed.
>>>>
>>>> Best regards,
>>>> Hal
>>> EMMC or SDcard are not possible to boot (via JH7110 boot ROM, distinct
>>> from QSPI boot of U-Boot and later EMMC or SDcard capability) in this
>>> way on some of the boards where transistor logic pairs GPIO0 and GPIO1
>>> both-off or both-on. SDcard boot is officially recommended against as
>>> "not supported" by the StarFive reference documentation, and I suppose
>>> what remains is EMMC boot as valid though I have not heard of any users
>>> for this.
>>
>>
>> I tend to use SDcard boot on my deepcomputing fml13v01 board to test
>>
>> before I flash the firmware to spi flash. I've not encountered issues. I
>> have not tried eMMC but I assume it is the same.
>>
>>> What is the test procedure for EMMC boot, can you explain and I will try
>>> it on the Star64?
>>
>>
>> I believe this page contains enough info to use it:
>>
>> https://docs.u-boot.org/en/latest/board/starfive/visionfive2.html
>>
>>> -E
> 
> I followed that info to get JH7110 ZBL SD Card boot mode to load U-Boot
> by adding only bootph-pre-ram to the &mmc1 node. However, no success for
> U-Boot with JH7110 ZBL eMMC boot mode. I additionally tried the build of
> U-Boot as the Star64 arrives from factory, and U-Boot release 2025.01,
> both which are also working for JH7110 ZBL SD card boot mode and not
> JH7110 ZBL eMMC boot mode. Obvious to me is that page does not contain
> enough info to test for eMMC, and/or I am doing this wrong.
> 
> When no valid eMMC device is present:
> 
> dwmci_s: Response Timeout.
> BOOT fail,Error is 0xffffffff
> dwmci_s: Response Timeout.
> BOOT fail,Error is 0xffffffff
> 
> With the prepared eMMC storage connected there is not any output.
> 
> What is the preparation and test procedure for JH7110 ZBL eMMC boot mode?
> 
> -E

Hello E,

I have tested on the StarFive VisionFive 2.

You can write U-Boot SPL to sector 0 of the eMMC and it will be booted. 
But with our code it will not find main U-Boot. (There seems to be a bug 
in our SPL code as it does not fall back to Y-modem.)

To allow adding a GPT table the vendor image therefore uses the 
fall-back to the backup SPL as follows.

With u-boot-spl.bin.normal.out starting at sector 4096 (byte 0x200000) 
add the following bytes to the GPT table:

Position 0x0000: 40 02 00 00  00 00 20 00
Position 0x0290: 40 02 00 00  00 00 20 00

The value 0x00000240 is the offset to the SPL header.
The value 0x00200000 is the position of the backup SPL.

Likewise with u-boot-spl.bin.normal.out at sector 2048 (byte 0x100000) use:

Position 0x0000: 40 02 00 00  00 00 10 00
Position 0x0290: 40 02 00 00  00 00 10 00

Best regards

Heinrich
