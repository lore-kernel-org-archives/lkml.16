Received: from smtpbgjp3.qq.com (smtpbgjp3.qq.com [54.92.39.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6FC813AD18;
	Thu,  6 Feb 2025 02:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.92.39.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738810787; cv=none; b=Q9GGxS9LERmJ7vuEmQG5k9p/y7S/wfJud7X5uz+vK26VyPlhNsTFlLiHfqEKIRz6OWQE1LdWXo9ifBFpUHfk3khNMFTf0r5QgZMxJM/jHCv8neDpGwLdNwwnFbI7AaqDnYZwNCKcC2gc+pWE2O7Jz6MorN56suNIWZtlmk30ZrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738810787; c=relaxed/simple;
	bh=nlEO3mdHTKq4vKl9RYbzna9tghmDXXIpcsbLJLedm18=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UX/S75+5mCe+nK30orqXcrC6IajZ1BlUa9w9vl9Pcx/CV/yBHO+P3qBZFykAxxW4ZhhRtuoATNyZE68iaqDjrESqALDjkjdVofoY3XOO046BIpHfIj0QPORnFmNL5dlTaYCwcRAQsy9fx3G18jMf+MO/0+0enRW0aQ9P9/55v3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.starfivetech.com; spf=none smtp.mailfrom=linux.starfivetech.com; arc=none smtp.client-ip=54.92.39.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.starfivetech.com
X-QQ-mid: bizesmtpsz11t1738810770txlrd4
X-QQ-Originating-IP: YWIJS65zdp2o+m9dZjLObOYuHeSSwMrYNUq5iTbCLsg=
Received: from [192.168.125.117] ( [183.27.97.113])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 06 Feb 2025 10:59:29 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 246281262797526275
Message-ID: <62D89163A60680E7+f0f5a4d4-42f1-454d-9dfe-cf53e2aca4ac@linux.starfivetech.com>
Date: Thu, 6 Feb 2025 10:59:28 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] riscv: dts: starfive: jh7110-common:
 bootph-pre-ram hinting needed by boot loader
Content-Language: en-US
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, E Shattow <e@freeshell.de>,
 Emil Renner Berthing <kernel@esmil.dk>, Conor Dooley <conor@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Hal Feng <hal.feng@starfivetech.com>
References: <20250203013730.269558-1-e@freeshell.de>
 <20250203013730.269558-6-e@freeshell.de>
 <25B3D8909DBCC21B+43663a76-4afa-44ae-95e2-3a8792de614c@linux.starfivetech.com>
 <206a6ada-1ef9-47f3-b1cf-fb1a1540e95c@canonical.com>
From: Hal Feng <hal.feng@linux.starfivetech.com>
In-Reply-To: <206a6ada-1ef9-47f3-b1cf-fb1a1540e95c@canonical.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpsz:linux.starfivetech.com:qybglogicsvrgz:qybglogicsvrgz5a-1
X-QQ-XMAILINFO: MwQdfXoP8nuzSxr4LAoHEDLrKivNZYdOvnpsQoCgIq6AD8J21PrhxMHo
	LRvJgpOe+HBfYuc+vhsSCNOC3bKdEZ+KpxKANGbvgX6x/Cvu4ZqDzrqlAipW4BRsmyeadMx
	E8wmsWmzYR6/q/qskpP+akVgUjuse7FzJcsh3Zklv51uUmsP76BPc1AAztdF/XlIiP23jAS
	QSDRCOKLLza8lTrZuYzzUihf1xVDyYaOlyoecLhecLHs1cy4/tyvSk4b+btIX7WiKJoYNtC
	Qjt5soAgYYtSMl/UssrxOQfxrelqqbugP8axiHR5ibT9zSSYkLnQ+fq19emoahps4UqnpEd
	Xu5Jf9PEptblalEFMc4djuewwyCFqNu+3G04yUDM26FQxmsm55HHW4IHKeAZGFn8BRiuCT+
	T1N08QBL9bKDp/dx+xmtMhZYFWQEg4bV+YybeEGFBZarMVdCMYUyUOIeUmr4kO+vAYc/ANn
	0vvsLKjEcb/MHPmEevjTkGpgEAu20VED/Nfq0VC+Sk5qnIxDarOSLJsrQoljzd4T4SBFlaP
	rwzd4EGFKVaefiI72BME2iBYLzlmOZ9hevCqhQzJNFp0MWXUl3KLV13GnQBHsxvvs6ruriH
	jazX3scNjg3f94ShE588Kfu3eeFkyVqg9U4tZ9O93PVFvAL6f3+s3C9xPSm8yIG5jWZCL6R
	9U3CxvaFS3QBQP319/SfW6Rq6HFMXG75J48rv9N1T0fVHawKf+0pa6irfKrV7nnX5qfj6sL
	Ho5zEBFuaEZBf7HmSf+pyzvByUzywCezQ4HXUocuWEpdiZ91pZ4XWALQDvMdFgwvx7sgN9D
	qUpunm3kwbaisBcMNwJdHGVTEvHdD1dmrz+8BCR+wrYU+7eNw3kvkxNevqaG7n2f7I2PNPg
	QXQ2EdBeeM41oAhZeBr341ONnpPX1ZshKvowGk9bYx9s4eTTsxykMw3S4xAR6degWK0c+yQ
	h9/z67IzAawi1qw==
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
X-QQ-RECHKSPAM: 0

On 2/5/2025 6:01 PM, Heinrich Schuchardt wrote:
> On 2/5/25 08:57, Hal Feng wrote:
>> On 2/3/2025 9:37 AM, E Shattow wrote:
>>> Add bootph-pre-ram hinting to jh7110-common.dtsi:
>>>    - i2c5_pins and i2c-pins subnode for connection to eeprom
>>>    - eeprom node
>>>    - qspi flash configuration subnode
>>>    - memory node
>>>    - uart0 for serial console
>>>
>>>    With this the U-Boot SPL secondary program loader may drop such
>>>    overrides when using dt-rebasing with JH7110 OF_UPSTREAM board targets.
>>>
>>> Signed-off-by: E Shattow <e@freeshell.de>
>>> ---
>>>   arch/riscv/boot/dts/starfive/jh7110-common.dtsi | 6 ++++++
>>>   1 file changed, 6 insertions(+)
>>>
>>> diff --git a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
>>> index 30c5f3487c8b..c9e7ae59ee7c 100644
>>> --- a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
>>> +++ b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
>>> @@ -28,6 +28,7 @@ chosen {
>>>       memory@40000000 {
>>>           device_type = "memory";
>>>           reg = <0x0 0x40000000 0x1 0x0>;
>>> +        bootph-pre-ram;
>>>       };
>>>         gpio-restart {
>>> @@ -247,6 +248,7 @@ emmc_vdd: aldo4 {
>>>       };
>>>         eeprom@50 {
>>> +        bootph-pre-ram;
>>>           compatible = "atmel,24c04";
>>>           reg = <0x50>;
>>>           pagesize = <16>;
>>> @@ -323,6 +325,7 @@ &qspi {
>>>       nor_flash: flash@0 {
>>>           compatible = "jedec,spi-nor";
>>>           reg = <0>;
>>> +        bootph-pre-ram;
>>>           cdns,read-delay = <2>;
>>>           spi-max-frequency = <100000000>;
>>>           cdns,tshsl-ns = <1>;
>>> @@ -405,6 +408,7 @@ GPOEN_SYS_I2C2_DATA,
>>>       };
>>>         i2c5_pins: i2c5-0 {
>>> +        bootph-pre-ram;
>>>           i2c-pins {
>>>               pinmux = <GPIOMUX(19, GPOUT_LOW,
>>>                             GPOEN_SYS_I2C5_CLK,
>>> @@ -413,6 +417,7 @@ GPI_SYS_I2C5_CLK)>,
>>>                             GPOEN_SYS_I2C5_DATA,
>>>                             GPI_SYS_I2C5_DATA)>;
>>>               bias-disable; /* external pull-up */
>>> +            bootph-pre-ram;
>>>               input-enable;
>>>               input-schmitt-enable;
>>>           };
>>> @@ -641,6 +646,7 @@ GPOEN_DISABLE,
>>>   };
>>>     &uart0 {
>>> +    bootph-pre-ram;
>>>       clock-frequency = <24000000>;
>>>       pinctrl-names = "default";
>>>       pinctrl-0 = <&uart0_pins>;
>>
>> What about &mmc0, &mmc1, &qspi, &sysgpio, &mmc0_pins, &mmc1_pins, &i2c5?
>> Why not add "bootph-pre-ram;" for them?
> 
> Would they be needed before relocation of U-Boot to DRAM?

Yeah, they are needed by SPL and they are set in
U-Boot arch/riscv/dts/jh7110-common-u-boot.dtsi.

Best regards,
Hal

