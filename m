Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 764A6221DA0;
	Fri, 23 May 2025 16:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748016138; cv=none; b=PCNMRzKk3i4+BlBDgaMzKJd2lt0KDkjujEKn9ZN6sELZQ6I9H/TGzf4yB8iimturbyMJBPH693r0VaNPfsJCRc+Wl6fRH/JdwzmvXOtt6zKs1I8C+NjUKP7q7KcNlUyaiJWtKlZFoXTASrukRtgjquCLZ8nh4ib/uEJpp7FbS7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748016138; c=relaxed/simple;
	bh=ULx+MNjibrCmAVyg9aLR5Y84x3CqoG0b7VwA36zAdG8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WXfzRReXvLe9xYs19ON35qQ4iXvaxKeZy2QSEG96lqtyKn7PW7uiL0lCqlw4OVTIXnVmfwUZcg7a1EaDquNiUIQX/X/AcjNiWcCYmMnTwG68eQicMeSdXsvPTrt4a1y7fWBhbm+BRNW9E8rZq2snFQcOuf3Np1to1TIpWZoGKBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Linc5D3l; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Linc5D3l"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-310f082a5f8so108164a91.2;
        Fri, 23 May 2025 09:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748016135; x=1748620935; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=EgG2pX3ezAqX6Y8tW/0RzIqPZ6C4NQ0/ki8v2ugMunA=;
        b=Linc5D3lg04NLqKWiLCMVzX3i2aKyPAlBmEmi6Eajt7bGWjtcC/AQMxM12E2b1YSLp
         QITj765jN2P9/lsX948F7SdKuwcgTnGNmQwYg59X52AECzs/SgIgU0ZMVh66PqsOj6BD
         JzHJ8rahpPRIJNDWYE+miN5kabQRLGGTxWP9EhTsd3ydQLOl7OiLj5OTSf/C+KNsKywg
         /VGij0RKkxxRfpxGe2rE4g/TA7HAM7XWo9dvihfWVWmR5w0t9nh9SvMjH4IWZ4/BZbXm
         sSLibe6N6X/7nt2Okf8QaC13CbbSd8GzF/DNDoReBoRfgEZ6EoY9iKkgbncnDiYWuLoJ
         c0UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748016135; x=1748620935;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EgG2pX3ezAqX6Y8tW/0RzIqPZ6C4NQ0/ki8v2ugMunA=;
        b=mrkZ8aS1TluV60Y55uf90qGK25c56BbjtCFgfZDDnyoqmLLb3g+wjZS5fHwDg6thV8
         blBHc2Emwjmgsw/FJQ2v1uHPs6/CtxgX5QBCprZKmglu+V3afllsiO1sGPoZM/DDyn0Y
         LaqN2rdnr8/zpR80PzFRUOk0Y0beTZn7yUoT6jVI/XPnM+a8diZlkmj2WcBIRz3lcTdu
         K3Bqku0Sa9/6jfeckjCtSm0APfZ1/Zpgommmrz0AfaC6TI5QUlPvTLnQgYw1vSoetZlX
         NBxTRTFFrXnR5/24US9/TAblwPdVRHncl5mIaQz5b/6htnsaGEKfGbD24iUhrfnf2Jrh
         pfLQ==
X-Forwarded-Encrypted: i=1; AJvYcCWkMpeiCOtW7pGi/DwvBSvlrqaOtha2bSqzcQxVusaRM8yNWm5yAnBtA6EYHMr88m/CZhVQ82rjV37ymdlH@vger.kernel.org, AJvYcCXIOarwbG3m7GJ5C3nHVz3ps2fP46kWv7KFemEjaXaNWqcBUWcnhdqG0kqmeyV2DbnI0J/b7KxonnGo@vger.kernel.org
X-Gm-Message-State: AOJu0YxLcsaVcEu2z1g8sphbwxdEhpdzhGOnkYXfQ9VXljJjoTQRZH8+
	TzvBtnJvmSXX4vGmwmPM6liwao8nijm/Jq6GL8RKPSrI2cJvQcbh71fS
X-Gm-Gg: ASbGnctWgYJY+eJQKoDIYqLrYXEfQzpOc22EpAaQXuotADze8luSwerfTOJsQt0vx7H
	nfeP4Qn51HjnprA5ydOkuavI4jXwpnx+Y5StgxsfMCd7vNrCJedKRbIBpWvMDy/kK8rAZN1VpoE
	52AFlc17ZLpCfhKNqkIb53nF7jZC14xfW2fzF0Jf5UtrfNVXnC/a9fVl/KNR/zCL51ZtR8oXm1O
	79xLKBvUYBxK7eMx/rWXHC2RrnQW/V7Tw1gwkor+oJUO50qz7VQ14H5ltGaxRb2KekQFvS7cA+J
	y3Te+jLy3DckgyImzfStmzbJRk+EI5uhj1LIKpanvxVSrgSlWwZzlTK4j8/KNguSVM17/+qjjOT
	hXPTNULoJg/vmjmP0Xm+v2qiv
X-Google-Smtp-Source: AGHT+IFo+VP3pNMQn0GZxFiYSiIjmsMlFpQYtLb4nAS6aNmwszH5V9z/6JT/Uubv2tthxBg4GNH7Zg==
X-Received: by 2002:a17:90b:57e8:b0:30a:255c:9d10 with SMTP id 98e67ed59e1d1-30e830e87f6mr42819646a91.8.1748016134484;
        Fri, 23 May 2025 09:02:14 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30f365157d9sm7520384a91.47.2025.05.23.09.02.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 May 2025 09:02:13 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <e11aade8-f646-4d94-942c-6186f06fe783@roeck-us.net>
Date: Fri, 23 May 2025 09:02:12 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] dt-bindings: trivial-devices: Add compatible string
 adi,adt7411
To: Conor Dooley <conor@kernel.org>, Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Noah Wang <noahwang.wang@outlook.com>,
 Naresh Solanki <naresh.solanki@9elements.com>,
 Michal Simek <michal.simek@amd.com>, Fabio Estevam <festevam@gmail.com>,
 Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>,
 Grant Peltier <grantpeltier93@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>,
 imx@lists.linux.dev
References: <20250523151338.541529-1-Frank.Li@nxp.com>
 <20250523-fridge-scarecrow-982578c16bf0@spud>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20250523-fridge-scarecrow-982578c16bf0@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/23/25 08:30, Conor Dooley wrote:
> On Fri, May 23, 2025 at 11:13:37AM -0400, Frank Li wrote:
>> Add compatible string adi,adt7411, which is temperature sensor and
>> 8-Channel ADC.
> 
> Usually for iio devices supplies are meant to be documented, and this
> device has one.
> 

FWIW, the driver supporting this chip is some 15 years old. I don't think
anyone was talking about supplies at that time.

Also, this is currently implemented as hwmon driver. Is there an effort
to move the driver out of hwmon and into iio ? Fine with me if this is
where things are going (one less driver to maintain), but I would caution
that this will result in an ABI break for users of the hwmon driver.

Thanks,
Guenter

>>
>> Fix below CHECK_DTB warning:
>>
>> arch/arm/boot/dts/nxp/vf/vf610-zii-scu4-aib.dtb: /soc/bus@40080000/i2c@400e6000/adc@4a:
>>      failed to match any schema with compatible: ['adi,adt7411']
>>
>> Signed-off-by: Frank Li <Frank.Li@nxp.com>
>> ---
>>   Documentation/devicetree/bindings/trivial-devices.yaml | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
>> index 27930708ccd58..38bc1937ff3c9 100644
>> --- a/Documentation/devicetree/bindings/trivial-devices.yaml
>> +++ b/Documentation/devicetree/bindings/trivial-devices.yaml
>> @@ -41,6 +41,7 @@ properties:
>>             - adi,ad5110
>>               # Analog Devices ADP5589 Keypad Decoder and I/O Expansion
>>             - adi,adp5589
>> +          - adi,adt7411 # Temperature Sensor and 8-Channel ADC
>>               # Analog Devices LT7182S Dual Channel 6A, 20V PolyPhase Step-Down Silent Switcher
>>             - adi,lt7182s
>>               # AMS iAQ-Core VOC Sensor
>> -- 
>> 2.34.1
>>

