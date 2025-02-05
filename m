Received: from smtpbguseast3.qq.com (smtpbguseast3.qq.com [54.243.244.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE65F228CAD
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 07:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.243.244.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738742268; cv=none; b=VDNi+mNY93gpxwXWXM3Wkr1cGrc4ORnWWEnCcyjfCwS8jgas0k27wIYk9myUl9JAK3eTvZeck5O/6fEKzMRXgGqVbj9panc+LSJktyHZ9WFJPICVQlJl7vAADT7RCfsvKgMCLWmuubLkQf/uLemsUIHf90tnDsL0bG9nwMAAcns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738742268; c=relaxed/simple;
	bh=kCYpgBMK7Rzj+V3RRv0t4HfrublkMmMqXKbRjCktDYA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eqy6nXHJOFrN7374dG5LMr2VlQ0dWDOuZ17f+vwirGxAImWuF8ToUHprqHDSr0Soapragx4ly8SCYUGpuK3duTCmS/ChQscU1xDkprmf0PEjcEVbBhVoy6MYyXcPzZD8qPFoRb1k23xVWffHvW81MgTSIahNK64fbe+8AkK13Tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.starfivetech.com; spf=none smtp.mailfrom=linux.starfivetech.com; arc=none smtp.client-ip=54.243.244.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.starfivetech.com
X-QQ-mid: bizesmtpsz8t1738742253t7hgm8u
X-QQ-Originating-IP: LhoYFQ+iWEQs6p+Ju1KUL8CfXjPMNyGFDkrdyseJg5Y=
Received: from [192.168.125.117] ( [113.72.145.41])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 05 Feb 2025 15:57:31 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 4618514360899873354
Message-ID: <25B3D8909DBCC21B+43663a76-4afa-44ae-95e2-3a8792de614c@linux.starfivetech.com>
Date: Wed, 5 Feb 2025 15:57:31 +0800
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
To: E Shattow <e@freeshell.de>, Emil Renner Berthing <kernel@esmil.dk>,
 Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <20250203013730.269558-1-e@freeshell.de>
 <20250203013730.269558-6-e@freeshell.de>
From: Hal Feng <hal.feng@linux.starfivetech.com>
In-Reply-To: <20250203013730.269558-6-e@freeshell.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpsz:linux.starfivetech.com:qybglogicsvrgz:qybglogicsvrgz5a-1
X-QQ-XMAILINFO: N7M/927DZCmZgl3HV73i7XckDbUeZgeeSvf4+hE0xL6MCxxoe0n3+7Xx
	04ggSSKrjWv0sQAoYO07nUH4OfyepHbEBFiOHD9qEYQ0QIVn70lnTki9Q6Qv9WxZ9xxGdRj
	oKHusWBRUtXsmXWtdCj8yEyDZUo1uPkH+GdO1KFWUTBI2zw/wCnyCF+HNT9b/ApLO8LwFkj
	YQiD+5OjnqQh5NxaOmgGryBo+0GNvFElTWwsB0dujHLRzd8BcMEB9nYaYMSnJPeNQrDSoVL
	vAl7BXVSPMaK9K7XlVdx+syCNlS20xqSg8wlShw0zrjM1rfKLWCBqfqtSUxMWWuH97Xkuap
	b9wdsj3LH15t78tTwOc76nhd1vdq2jzLsmOM31CVJ1/Iigy8ROnfJn4rVGt8wHq9n6cz2Kt
	bI5+MxmY1ll9moWZkONOhnaLw4tK8qqUVHwY2Q2oNF7Pb+l2Ra0AeuIo4iXIk6vs/6176hq
	l7bgooVl5xl/tX7m33HWWO6F27VsHB41OZ514w5GeexESH+ZHuYBqJS49tSFpIEG9bqm1hG
	ck5ZcQBBcMNFI6goANGY5SagZvr8+NbiQJnQraxA64tSZM03lC0Dy73fIy5DoC2j/y5ma0g
	yu0siJ+3BOy0cfH2i8j1c4w5TW5gyhDVCoOiO1ryVyOzBUQHZY4FxyBsjCnmaiGu4WoYyyD
	duy/9mA57CtF1lXS4XFmo24utrpzG3tRdMsCkmdYlNEzALV4mP6eBhMNHtFcrG3SP1HK2LK
	yWl/WPFm2MIMwwGHhhRvX8qLFujZhIBptJL2rONtOrteiPrgqGn7s26uB/YlTKeJljDqiVB
	5IBjXBrbkA12D5eXJNLkWkuenN8KlJtTwyvEXXiwzAGoHdB30p9GsYye+p+M6XVFUzYEMvl
	QjGDIvo5XkYgrLperely+0o/QwRk29uw37naBXPBQyzTij6yJ6E853f5P4o/XneZXRBGbv8
	MpIob/rrB8cDkILVp7uvLYZpr6D39kKQhQPMMrOYwz1tib0hXc+XeTiX3+czcB2sF7Ik=
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
X-QQ-RECHKSPAM: 0

On 2/3/2025 9:37 AM, E Shattow wrote:
> Add bootph-pre-ram hinting to jh7110-common.dtsi:
>   - i2c5_pins and i2c-pins subnode for connection to eeprom
>   - eeprom node
>   - qspi flash configuration subnode
>   - memory node
>   - uart0 for serial console
> 
>   With this the U-Boot SPL secondary program loader may drop such
>   overrides when using dt-rebasing with JH7110 OF_UPSTREAM board targets.
> 
> Signed-off-by: E Shattow <e@freeshell.de>
> ---
>  arch/riscv/boot/dts/starfive/jh7110-common.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> index 30c5f3487c8b..c9e7ae59ee7c 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> @@ -28,6 +28,7 @@ chosen {
>  	memory@40000000 {
>  		device_type = "memory";
>  		reg = <0x0 0x40000000 0x1 0x0>;
> +		bootph-pre-ram;
>  	};
>  
>  	gpio-restart {
> @@ -247,6 +248,7 @@ emmc_vdd: aldo4 {
>  	};
>  
>  	eeprom@50 {
> +		bootph-pre-ram;
>  		compatible = "atmel,24c04";
>  		reg = <0x50>;
>  		pagesize = <16>;
> @@ -323,6 +325,7 @@ &qspi {
>  	nor_flash: flash@0 {
>  		compatible = "jedec,spi-nor";
>  		reg = <0>;
> +		bootph-pre-ram;
>  		cdns,read-delay = <2>;
>  		spi-max-frequency = <100000000>;
>  		cdns,tshsl-ns = <1>;
> @@ -405,6 +408,7 @@ GPOEN_SYS_I2C2_DATA,
>  	};
>  
>  	i2c5_pins: i2c5-0 {
> +		bootph-pre-ram;
>  		i2c-pins {
>  			pinmux = <GPIOMUX(19, GPOUT_LOW,
>  					      GPOEN_SYS_I2C5_CLK,
> @@ -413,6 +417,7 @@ GPI_SYS_I2C5_CLK)>,
>  					      GPOEN_SYS_I2C5_DATA,
>  					      GPI_SYS_I2C5_DATA)>;
>  			bias-disable; /* external pull-up */
> +			bootph-pre-ram;
>  			input-enable;
>  			input-schmitt-enable;
>  		};
> @@ -641,6 +646,7 @@ GPOEN_DISABLE,
>  };
>  
>  &uart0 {
> +	bootph-pre-ram;
>  	clock-frequency = <24000000>;
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&uart0_pins>;

What about &mmc0, &mmc1, &qspi, &sysgpio, &mmc0_pins, &mmc1_pins, &i2c5?
Why not add "bootph-pre-ram;" for them?

Best regards,
Hal

