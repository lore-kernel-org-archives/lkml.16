Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E313122AE5D;
	Thu,  8 May 2025 13:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746709814; cv=none; b=b0XLyks+GCcxc7a4FLbz4f6v+sddByKbIoS7+Zgo7dHzGr9+zLEoa4PYnd/42AkSHXIAKJxpm2twCAnTl8xEq1ylbO6PJEKpTZdVawI1vS43yl3tU0FtisUp3gGfNIlU+r7vOvw0ISMkO8uyEvyvYv2q5BWxNpdMOjUbYKdStUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746709814; c=relaxed/simple;
	bh=1nCXsXmOyG+Pv6RWAre/pXlTAjQ5HdNmvbPbx7LtggI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ddgnrzo9uNguMFtPMqBfItJSGPcJXE6w1nw2utij/xBRDqCSlFCk0x3tzE5tCszQBomM63tqe8ueYQ1DkV5w1dUR/qZsZjSOo1bKr/56olcx43vnEizXEgXbsdOMnEjU0ksFMLCcrGIYNaPzzPL5TJqOega3Am/Xkgzm2xvUCPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GMTahloU; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GMTahloU"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ac2af2f15d1so125700966b.1;
        Thu, 08 May 2025 06:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746709811; x=1747314611; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qMvBG083xP6dxkstmeCUA71FGvdXWAHknvGo9znoWPE=;
        b=GMTahloURHxRXTzdYK2rRiwbLIh3LqPKhQ/mnupZwfr+6YMktQs/ZkwoVOTY0scPfb
         em00sCpYKTaccbcxhHBRHWyEo1ttMzUoGhy/1pR72v9DoAupTzRz3Pzpa9mjhilJhkVy
         7GE6h/0v3zP9Fe2LQxOiNBxLLkDIPQmPaCfBHE4Qq7CtlxBZMgeXw32/AODs0nkWJBgn
         vCbhEGRfTKUOHHYlJ4GpQhdDKIn6hMvOYDfgX6KQMXOwi/OdczhZlG+sQyHrhQ763zPs
         gbAV8VdiF/jmGULiFJx+6X34ezz+zemuy2PUTfyWjX091rD7zXWCPkAMfcJQT3OuItDw
         uJng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746709811; x=1747314611;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qMvBG083xP6dxkstmeCUA71FGvdXWAHknvGo9znoWPE=;
        b=JJTedNRjVFqNudnR65CU542nWP//Da7yU+xvsY/lOyl+kPYvGwbj3nTGO9blcMu4Z9
         4v8UpcrfuCA7DIQuweHArH4tusK7nKmPkL/kU8YGig8v8BkyBqsxtAw3A3KpU9hnAsik
         FZzpfeNB/A2k8HjBb4Eqo/xz1EUGnaXGIfkOCwQ1xFCZOlvDBPPgm97ERfCCVtBRlDiI
         L0Rk27ulGw9HWnYUWFqCkDMGect7qmOKml5q54xIBvUc48dlb9gRuaSh5tEvnsGB2KzT
         fcH9qHv2+T2xgbe2H+6ELdBkmIymDqpyTXJz/qT1o6kHngDSksOgx3OHPD7YJihOYqkn
         ZZ8w==
X-Forwarded-Encrypted: i=1; AJvYcCVwT0+4FyqwSEXogvHIXp7LRNiKXDIU6f+a2RtLyxgTsSsippyBTmRABDpWE/sbAGdHgTvNWH4PpUjcVmcD@vger.kernel.org, AJvYcCXqUQiFuod1B4DEHWvh2fE9MDDQAoCxL3ssh0VsuArAUD+geUkQm7NsuvcZA4VqwbFOh3rxuLsF9tQg@vger.kernel.org
X-Gm-Message-State: AOJu0YyK4yVS+wzZTHY2eHn7Oz4JLkena9o7mMZE2RSFcOetQz6dDxex
	EkezExKpMqtNwmKeoJXQp4xlVmmO5UT8yN3K2F777M4XSHdpGg1X
X-Gm-Gg: ASbGncup0BGax182fX0KBJEewScHQ5BMdUPQP3kT+gtBGEkViCpRZNZHsuh0ewtLvvW
	sBGVnmELbqR4VoEL80bTh4rJVhoP+s/TjrtZTf2XIi1u7OmK+JNbsBSXjyv42vSRMc4I05BMo41
	s24LTLjqT8EsudQ8axrPOAwKpYokh1EvnwDdAcghxS8O9OQ611MiWmikfhPB03eJYgkGCaqHJvu
	9P6BK1/NKaHl6G2zTmQRrfC91INjQyNXe3N1ILPuezCTMkIYa6SnK/fRX0OgLhYF+OkZCzd/ZAk
	m+H1arW+e3oyGkefh1U1AFKgPE+V8eSbJc1/HOV569QVtE2kfQ==
X-Google-Smtp-Source: AGHT+IEB6ljN3284yI5Xfi8yEjwnnAJXLsYkUNbO+pXteYAHjEfhnYbAgRfFH7dO7rz+OnQx0ARB+Q==
X-Received: by 2002:a17:907:9629:b0:aca:b72b:4576 with SMTP id a640c23a62f3a-ad1e8c4043bmr738658966b.33.1746709810784;
        Thu, 08 May 2025 06:10:10 -0700 (PDT)
Received: from [192.168.1.130] ([188.193.103.108])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1894c0371sm1074090066b.115.2025.05.08.06.10.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 06:10:10 -0700 (PDT)
Message-ID: <35c08d79-1473-4c1e-b605-627c4ff00a92@gmail.com>
Date: Thu, 8 May 2025 15:10:09 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/4] ARM: dts: stm32: add initial support for
 stm32mp157-ultra-fly-sbc board
To: Andrew Lunn <andrew@lunn.ch>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 =?UTF-8?B?QsO2cmdlIFN0csO8bXBmZWw=?= <boerge.struempfel@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
References: <20250505115827.29593-1-goran.radni@gmail.com>
 <20250505115827.29593-5-goran.radni@gmail.com>
 <2d0ff289-06f6-4bde-a238-097d22573d4e@lunn.ch>
 <63665c17-da37-4b5b-9c2d-28d5a669680f@gmail.com>
 <3a7ef1bd-2c0e-4637-b0b6-2c0b73388618@lunn.ch>
Content-Language: en-US
From: Goran Radenovic <goran.radni@gmail.com>
In-Reply-To: <3a7ef1bd-2c0e-4637-b0b6-2c0b73388618@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Andrew,

thank You once again for helpful hint.

Andrew Lunn wrote:
>>>> +	phy-handle = <&phy1>;
>>>> +
>>>> +	mdio {
>>>> +		#address-cells = <1>;
>>>> +		#size-cells = <0>;
>>>> +		compatible = "snps,dwmac-mdio";
>>>> +		phy1: ethernet-phy@1 {
>>>> +			reg = <1>;
>>>> +			interrupt-parent = <&gpiod>;
>>>> +			interrupts = <0 IRQ_TYPE_EDGE_FALLING>;
>>> PHY interrupts are 99% time level, not edge.
>> That is correct, but I am facing strange behavior, when I set
>> IRQ_TYPE_LEVEL_LOW.
>> My board stops booting at:
>>
>> [    2.343233] Waiting for root device /dev/mmcblk0p4...
>> [   12.638818] platform 5a006000.usbphyc: deferred probe pending
>> [   12.643192] platform 49000000.usb-otg: deferred probe pending
>> [   12.649029] platform 48003000.adc: deferred probe pending
>> [   12.654277] platform 5800d000.usb: deferred probe pending
>> [   12.659744] platform 5800c000.usb: deferred probe pending
>> [   12.665089] amba 58005000.mmc: deferred probe pending
>> [   12.670239] amba 58007000.mmc: deferred probe pending
>> [   12.675185] platform 50025000.vrefbuf: deferred probe pending
>>
>> I must investigate this. If You have any idea, You are welcome to share it.
> Could be an interrupt storm. The interrupt is not getting cleared
> because of something missing in the PHY driver, so it just fires again
> and again.

After a brief investigation, I tend to agree with your assessment that 
the issue lies in the driver—likely the stmmac driver — which is outside 
the scope of my changes.

Therefore, I would suggest keeping IRQ_TYPE_EDGE_FALLING for now, or 
alternatively not using a hardware IRQ at all and falling back to 
polling, as done in stm32mp15xx-dkx.dtsi.

Best regards,
Goran
