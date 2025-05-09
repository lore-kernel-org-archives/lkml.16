Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A158292916
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 13:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746798388; cv=none; b=QBQExyoMq++PRWNAfoFkUWFWCDOwaGy9sfqi+iYpU3vFMt6TcChFNqfWGef5+eUfZ0Zy7y5qgCZtObOXGIbmAFzCiIVChkA1bCgmiU+Yo94ZRlVrAayxE07lFMcU5iSTA0igFG6RFI7RRyNtJP5y2ZowAdoumydIY4CthorIhRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746798388; c=relaxed/simple;
	bh=XO/wK7V6mXY9xU1mcWlD2Ct18mmjFn+FYLp11z65N7M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Alqti6hknvdVLdQvcgk8CfpnrTDBoc7RC2Vow/RZuhlEi3V0E1XtZlDk2Dn5XfGkWvnUOm6kkj1fhjEgc6dD+NPpZOT7p3+vaL8AoB2rTfFQwgxbe1DI/jstItq1At5HD3j83Iaw7S0of2bzwWCC4W4bRNKLOzbVVtbI1L0XRGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=q/2ONir3; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="q/2ONir3"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43edb40f357so14313535e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 06:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746798384; x=1747403184; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PZUF6Q4Qc9CPUkc04ir0Y5K/i90KczoIYGaKnAPCoYU=;
        b=q/2ONir32GkMPFC6dT/uDWYlpzm2wytlHIoVmvWpLmYwgZOs6JxM06D/RXz4jLvFNV
         Gm65lYDwf/zt7/ZRFp5/ew7R0dtj7mTooxybtt8hzKWf0ldHaLE9jhW41AqdJUm+Qlg0
         jI6NtJvztVK0aTY4uOJ4rxYv8j1fj3rsTs8nfiwLAVZEueU0GP3CEQtcO/VvDKQv71/L
         IeYYVjMlT82hiCJM1Y0HN3C1CGQtFa7HAFpCRhfNXFxwdJISGyERrgSpwGwGZVOpQDsx
         oOMH8jkCNGyzfPEhHrOs+2dhsmTuWMsVrlFWMpO6OCVOwiG4DjLyBnVYyvKERNr8Rply
         g3Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746798384; x=1747403184;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PZUF6Q4Qc9CPUkc04ir0Y5K/i90KczoIYGaKnAPCoYU=;
        b=oVIbEhgnXb5f5wp7bjugfOBkwoUcG0YHC/Cbt3sygBtlQ2LtIBhUqTX2K9NCv+R7uD
         b1ZiyrTc0bAV6gc81VeQbePkqaqGBz3JOrXJAeJcyO9vKpyVHan9gq813ZAfvBvoroKh
         bGmcZKcg2FENruPiJapCmGISgdUMNm8vPYtEsc5YFWV1wMTHKZ8ouVqAtj/s9zkfIWTT
         zA7EuuBEBe+/YkCvC+Y42nmww9Tb+dHbszYQ9n2GFNMsHXL0MT9NPVb7aj79gWblucCN
         IMlDrZmh503abzTSykgiZgMVfHKL4pB/j34RLkrA1wN5CE9PxkafHTSOeOERvBVj6mds
         b+pg==
X-Forwarded-Encrypted: i=1; AJvYcCUFFKRp7WyBr6nivg99UXRLzTH1RLU+fIaqXSdUDhJSXWWZjqJZt4pfKXfKve/mc0NohzQWAQ0aX7es7Tw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPWaujHJpfQYrgK5jaUCDxqd2GSCm5vgQh+pUkxgDcIV6KpTqQ
	+80mR67+ZnHd83esPl/s3FHZe2lwRSgHhnOLRc9zBXdIW6WGYb+RANCCvqaGAzg=
X-Gm-Gg: ASbGncs6Jhw1AW8jkSJ5GA7e0K1OgZyvIyuehqi21ehDjpOi7uPsuDxu0NAb/43wbSL
	ks4NICTCZxjmXOSLB6F7KQj9pEQC82eEGoaRVy6+pdeNj+YOa9PR54STYpLbrLDC7kot2BJbkqv
	OsaAVyFLzXpCIqPVJfHDi1kacZhb9cgWmy7JIbfx1s0ZGAh70ndscQS8CJQ++AUrgX9k6rDPYSp
	sz6TtRCa8UWUWCE74z2OFcSqYFzaIXx6HkxOLhzBdLNtGBSjGHmcZgrOXpLBma3EdnlI56moy7p
	F4PV0PgjseC/o/HL/2brB4aREu9l6bhnJL117+4Eg+R+sUt6saJy2Q==
X-Google-Smtp-Source: AGHT+IEo0jYrQRcALBtqnax8NWcKiAGj6scBJ0uiGs5jTKoY3ij/ij8y04Oz3H5GiqMjPbUsL8YJBQ==
X-Received: by 2002:a5d:5f95:0:b0:3a0:b84c:7c64 with SMTP id ffacd0b85a97d-3a1f6435b6fmr3000885f8f.13.1746798384562;
        Fri, 09 May 2025 06:46:24 -0700 (PDT)
Received: from [192.168.1.3] ([77.81.75.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f58ecaeasm3290573f8f.28.2025.05.09.06.46.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 May 2025 06:46:24 -0700 (PDT)
Message-ID: <bc871cb9-0b50-4132-8bdb-3a764bc98180@linaro.org>
Date: Fri, 9 May 2025 14:46:22 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/14] arm64: dts: Add DSPI entries for S32G platforms
To: Matti Vaittinen <mazziesaccount@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-spi@vger.kernel.org, imx@lists.linux.dev,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 "Radu Pirea (NXP OSS)" <radu-nicolae.pirea@oss.nxp.com>,
 Vladimir Oltean <olteanv@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>,
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
 NXP S32 Linux Team <s32@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, larisa.grigore@nxp.com, arnd@linaro.org,
 andrei.stefanescu@nxp.com, dan.carpenter@linaro.org
References: <20250509-james-nxp-spi-v1-0-32bfcd2fea11@linaro.org>
 <20250509-james-nxp-spi-v1-14-32bfcd2fea11@linaro.org>
 <3ddde799-76b5-43f9-971e-a52ec322e9b1@kernel.org>
 <16e91572-b132-4246-9fa9-8e8bc4c24f40@gmail.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <16e91572-b132-4246-9fa9-8e8bc4c24f40@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 09/05/2025 1:54 pm, Matti Vaittinen wrote:
> On 09/05/2025 14:26, Krzysztof Kozlowski wrote:
>> On 09/05/2025 13:06, James Clark wrote:
>>> +&spi1 {
>>> +    pinctrl-0 = <&dspi1_pins>;
>>> +    pinctrl-names = "default";
>>> +    #address-cells = <1>;
>>> +    #size-cells = <0>;
>>> +    status = "okay";
>>> +
>>> +    spidev0: spidev@0 {
>>
>>
>> Node names should be generic. See also an explanation and list of
>> examples (not exhaustive) in DT specification:
>> https://devicetree-specification.readthedocs.io/en/latest/chapter2- 
>> devicetree-basics.html#generic-names-recommendation
>>
>>
>>> +        compatible = "rohm,dh2228fv";
>>
>>
>> Nah, I really doubt. That's not the device you have there. It's
>> possible, though, so can you share schematics?
> 
> Actually, not even possible. There is no DH2228FV from ROHM. There is 
> BH2228FV though:
> https://www.rohm.com/products/data-converter/d-a-converters/8bit-d-a/ 
> bh2228fv-product
> 
> but as you know, it is unlikely this is the part populated on the board.
> 
> For the author:
> https://lore.kernel.org/linux-rockchip/20250213-calamity- 
> smuggler-5d606993be32@spud/T/
> 
> Yours,
>      -- Matti

Correct, I believe these go straight to a header and aren't connected, 
so this device is just an example placeholder for a 'generic' SPI device.

It might be more accurate to remove this, and then anyone using the 
board for development would have to fill in themselves whatever device 
is attached to it.

Thanks
James

