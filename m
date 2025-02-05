Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA4681547D8
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738749728; cv=none; b=lBt7pYm8zYpgb/yFPqI7zikn2/zzUAPYEYqH3gQw7AaQLLuJ7zxAJytSVmBl5HsbwHZCwhuiejsLd2ptu0Tc7vrFKaEugzYnyqgTnbaTzAsm0zyChVYYW9aRVCBeAx4V9R9z3JltCx94LpdIPMdFQin0EF/o5u1FQYY0ZIeEBbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738749728; c=relaxed/simple;
	bh=E0PTNIwQS5JcJ66tT1ZxxvzSk70T0G2+/RcDJA8kSH4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FD4agubw0ozVmqr4h/6ZQEKDDaYv3dJXCzZ7zheVXqr/XKkcUIJRpQgsb/GvQRAXwO+FBe3NXE4y4n3dcueigxOYDtUsYCLa++zGJ/JyS4Syav1wla5xIesk7sV/czqzYfVB5fei7cmD2pJIfixtoYk7Dot9/PQ/DhEeB/pxDNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=NhHdZ4Ew; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="NhHdZ4Ew"
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 59E233F671
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1738749722;
	bh=lRkR+WYaons/jJVqBwYKIgchNhk8mrQWriNR5CVl3/0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=NhHdZ4Ew/XkUXa222qi6TdUYpJQmVXy92bSTutSshYFoHdia9ILRwslnkAS8KgINC
	 b27GkY6KpH5auJ3ytQAKU8JF9saQrnUipGCH378YDKykTXN3ve3b9NW5z5T4Q1t/hp
	 XoY56BN/AHwDDB09j/g9SvFNrMcOUTV8PXTcK2Tg31hUbVwySSvDx6SRRshiZh+YFW
	 edxlVILdbcZ7e8ipytC6ABSy2TVcavc31RovDsVVhDcvvNSw7PQ05CCVzN+GU/Zb2l
	 +Ro4q8xgi7zyBe8u3M3lzg7eIU/yWEGQEO778TCR9E1Hww5uLXfPnRzB4eyAuotOE9
	 4yj4ILZqw+dBg==
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43673af80a6so46333225e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 02:02:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738749722; x=1739354522;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lRkR+WYaons/jJVqBwYKIgchNhk8mrQWriNR5CVl3/0=;
        b=LciONcu/bBoARuC+O1zyc79WQtppK2Yu2Dwd7k+LABz9w7WZeyMHtFJPyFxqW38azd
         yklnSe0PMX/RUjVaBQ3/YPwFOsCYeYjZ5Dgo/A0b8iDWD2GB8lNw55znZmRj9xw/1QYk
         BN6HrFzRYK+GEFVq9N9Uj9UMbx1uFINXb1X+dj8ZbH5MVyIL4fOljCvwJi+lQgGliy7K
         iLK15C2mSaQnktaFHZR8XlXGwdomshuAsijE9vixt67XDfTsftkdKbC17i/L4g3alB+s
         W64pgVrMjQUbiwpXTjXuDfUlHIMpR+WWptaEae1NIKijRD7wgaYQnJ27mA2yTUfxf7RV
         DJ6w==
X-Gm-Message-State: AOJu0YwqxXBLVSFUEtyh1C/Sf/qjeR8u2792V5F6RFe9jdPTAbCMa23/
	BkX9e61AyOlOfc0Y2mu1Mu+07bdayVdMIgaTi2629+wlsrwEArSoRfZTPaFqx1pYlx8BmUxQhJn
	9m59Xi10V3I2G2LFSwLTSq+BQO+zgQeKuF1gr3l4tKbt9u0CAd4uFcgZEE/UtT67agKY2lPpypM
	qhvQ==
X-Gm-Gg: ASbGnctadnlOC+GlHIqtqzD/CZrx5GS6Gp7UrRqkdwTRpnzQv1qw+T8Jj7ssAgJhwW8
	PTasowsub6HiTK3Ru2USnAJmt8Av2zN0NJfL55vPXOSEoVAcf7EB/l+U9d35XJznVQuqQFEg18Q
	DDgYp2+VGhYuecnZ2PqV4WrCkXCl5S/7mIVFnIJGkw+hEtrPqL18zgay1Bgp+c1JBOsF2YfTlB7
	P0ftnGcBaS1hPdMNuM1O9gmC2gBEYGkbEJ/mj2kd/651GUKsOM3ND8x5SnXk4/z1vkUVy09PoNu
	TvSvB49bKkWCSuRF9ohPupSo9nBT5Yr0FkIefhs7mymeXVqI9liDi3oP0zAOwWPEa/uiWcE=
X-Received: by 2002:a05:600c:46d4:b0:42c:c28c:e477 with SMTP id 5b1f17b1804b1-4390d55fc82mr14932125e9.23.1738749721728;
        Wed, 05 Feb 2025 02:02:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGq8om1DDyQcOOxkaGbGiKq7JJDXixn8Voguht0gmaJQbiYzhmBxXZIPIdniNSl3ZJ3CUhAFQ==
X-Received: by 2002:a05:600c:46d4:b0:42c:c28c:e477 with SMTP id 5b1f17b1804b1-4390d55fc82mr14931765e9.23.1738749721365;
        Wed, 05 Feb 2025 02:02:01 -0800 (PST)
Received: from ?IPV6:2a02:3035:6e0:9052:36d8:1776:f263:97eb? ([2a02:3035:6e0:9052:36d8:1776:f263:97eb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390daf7dbcsm15922705e9.30.2025.02.05.02.01.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Feb 2025 02:02:00 -0800 (PST)
Message-ID: <206a6ada-1ef9-47f3-b1cf-fb1a1540e95c@canonical.com>
Date: Wed, 5 Feb 2025 11:01:58 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] riscv: dts: starfive: jh7110-common:
 bootph-pre-ram hinting needed by boot loader
To: Hal Feng <hal.feng@linux.starfivetech.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, E Shattow <e@freeshell.de>,
 Emil Renner Berthing <kernel@esmil.dk>, Conor Dooley <conor@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
References: <20250203013730.269558-1-e@freeshell.de>
 <20250203013730.269558-6-e@freeshell.de>
 <25B3D8909DBCC21B+43663a76-4afa-44ae-95e2-3a8792de614c@linux.starfivetech.com>
Content-Language: en-US
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
In-Reply-To: <25B3D8909DBCC21B+43663a76-4afa-44ae-95e2-3a8792de614c@linux.starfivetech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/5/25 08:57, Hal Feng wrote:
> On 2/3/2025 9:37 AM, E Shattow wrote:
>> Add bootph-pre-ram hinting to jh7110-common.dtsi:
>>    - i2c5_pins and i2c-pins subnode for connection to eeprom
>>    - eeprom node
>>    - qspi flash configuration subnode
>>    - memory node
>>    - uart0 for serial console
>>
>>    With this the U-Boot SPL secondary program loader may drop such
>>    overrides when using dt-rebasing with JH7110 OF_UPSTREAM board targets.
>>
>> Signed-off-by: E Shattow <e@freeshell.de>
>> ---
>>   arch/riscv/boot/dts/starfive/jh7110-common.dtsi | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
>> index 30c5f3487c8b..c9e7ae59ee7c 100644
>> --- a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
>> +++ b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
>> @@ -28,6 +28,7 @@ chosen {
>>   	memory@40000000 {
>>   		device_type = "memory";
>>   		reg = <0x0 0x40000000 0x1 0x0>;
>> +		bootph-pre-ram;
>>   	};
>>   
>>   	gpio-restart {
>> @@ -247,6 +248,7 @@ emmc_vdd: aldo4 {
>>   	};
>>   
>>   	eeprom@50 {
>> +		bootph-pre-ram;
>>   		compatible = "atmel,24c04";
>>   		reg = <0x50>;
>>   		pagesize = <16>;
>> @@ -323,6 +325,7 @@ &qspi {
>>   	nor_flash: flash@0 {
>>   		compatible = "jedec,spi-nor";
>>   		reg = <0>;
>> +		bootph-pre-ram;
>>   		cdns,read-delay = <2>;
>>   		spi-max-frequency = <100000000>;
>>   		cdns,tshsl-ns = <1>;
>> @@ -405,6 +408,7 @@ GPOEN_SYS_I2C2_DATA,
>>   	};
>>   
>>   	i2c5_pins: i2c5-0 {
>> +		bootph-pre-ram;
>>   		i2c-pins {
>>   			pinmux = <GPIOMUX(19, GPOUT_LOW,
>>   					      GPOEN_SYS_I2C5_CLK,
>> @@ -413,6 +417,7 @@ GPI_SYS_I2C5_CLK)>,
>>   					      GPOEN_SYS_I2C5_DATA,
>>   					      GPI_SYS_I2C5_DATA)>;
>>   			bias-disable; /* external pull-up */
>> +			bootph-pre-ram;
>>   			input-enable;
>>   			input-schmitt-enable;
>>   		};
>> @@ -641,6 +646,7 @@ GPOEN_DISABLE,
>>   };
>>   
>>   &uart0 {
>> +	bootph-pre-ram;
>>   	clock-frequency = <24000000>;
>>   	pinctrl-names = "default";
>>   	pinctrl-0 = <&uart0_pins>;
> 
> What about &mmc0, &mmc1, &qspi, &sysgpio, &mmc0_pins, &mmc1_pins, &i2c5?
> Why not add "bootph-pre-ram;" for them?

Would they be needed before relocation of U-Boot to DRAM?

Best regards

Heinrich

