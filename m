Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E7301EBA14;
	Tue,  1 Apr 2025 12:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743510838; cv=none; b=OkenjR1xcqyvYRcHG/LWqBN8C0plheQE0BqnA9i//HLQ9qXowHtf4/hhUP6Ga3hemD+aGBsO2cBpQgVSbrWTQysJ2uUkg5ka9xfqJk9SXRVhCA2M67vK6zPxvFGC0ozhdahCV2G5CxEdfYR7pAdCJOkc20D7ByIcixzvXColq+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743510838; c=relaxed/simple;
	bh=QpyBoZim6ea3JTVrR+KAiVHpQx+7scxu8kJOWhnf2cE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kOxrf6MIm8IJrZ1GleGfDNxVEjdPoh8Mbx2P3cogMf+q06mr/01PnWckmD+lHEIYjh/a36wW6WYSmvM1i8cLMt5VHHji+mR7QVO5ePgPlPQW6oHHabeCOn13BgNAHAykAJcqebzfNawJPlVOZ/kObLVo5hA4dphRho+a/7iksC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OfoG8C6p; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OfoG8C6p"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-227914acd20so97185015ad.1;
        Tue, 01 Apr 2025 05:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743510836; x=1744115636; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=nXC8W6EMgX+hzuq+Bob+5ks8himBe+AzA+Vl/KKrWEs=;
        b=OfoG8C6pK4kYHBZXUIrBUL2m88Fcwj9vOpW6WEj5S2dmEAgVnXSPKvX4aWDU59982x
         5lJ8jnepm6yJkzuE9NOc2naejw3y/K5ZzsCQef1LEnadHXVJA9SDE1OsGNMfPHeRfeHu
         1Ab4A0p9VpQzcQpD2fC2R4GGdCMlKBe9pdlP6T+3AlmnPXjwj2TIUoElaVRYULPOVLTx
         f2Kl2LFb8qP8N9W+01t6BpQc2zLA2iw+wglLuBb6m8stA+S6oGZauIxo/CTxa3kDVRgy
         sMjJ6m/WQfVuo6VlE6GwNGySTBjoTBFB/RhHDzfhwRc+TybhTW1SCN33azyoeq2Hz2bX
         PHaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743510836; x=1744115636;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nXC8W6EMgX+hzuq+Bob+5ks8himBe+AzA+Vl/KKrWEs=;
        b=vzrcuBOG2bu5Z+TMGcEPBIN9sEzi9ANN7bl1i7ayw6Os9l6TIN6mBwwcnAdFTpyvZ7
         vpHjSnlse8t9a8p32o3yPsh2QZIOyDlyzjtBIRpu5Ci2QOvzC3sTqKghbESWUqrS9V9I
         M4TqTwWtkqJ6qVlM5ajwZ+ihHpw+D46TOlAD5R/57R8SXPAG1IFEtM7hLhftKUsj+5RA
         w+WdKcopJXIM8oUnh9g6orploHV3+0lxDqVPVSKFiHJ4KVF7mX3rHYgsWk12ktJP4tIx
         CEokF6YSM7NT2mtA7OKYYR20YCmHCz4dWPYKLdGFeVW4tihSD/iLngmlgs/lQwb2vLmG
         1nwA==
X-Forwarded-Encrypted: i=1; AJvYcCVRxNqCucRwDIy2vpz6GYK2O4svVnCBOIssESaLMDbtVmqXAnmfg5hgJWjbtktEZWNHLvZWdLo4SYMd45c=@vger.kernel.org, AJvYcCWLPxknErup5xAzn6xAJgXUBAnQID9cRQNd3Nz5pAgMWHhfEJYbMMWAbgM2IZ0q8oIU6nJlyKXWTQyziiKo@vger.kernel.org, AJvYcCX4/mjA9i/Ai3wS7pJVHLmm1mZp9k4avCXnHinEQl73ID6ha0rLnmnXdkdL/ut+IfxHGz3UO7rLsLcd@vger.kernel.org
X-Gm-Message-State: AOJu0Yyf288hdVJdEgSw+v5jyxaGNpA9sR51h+zBl0XV0zTgMDs6ItqU
	wWn8yjg1NFqYQTdueVYis86i5zF2CWyQBhAybLsgM8RpaLOa+O5H
X-Gm-Gg: ASbGncuwbjIuZkQHXxrjvlxk7WNOr1vyvmYcstD3P+9gvJ8m3t7T1X7u33ETDZLm2VE
	a4AlmsW7hNz8kKKu2aKJivvKa5WOMt03lpXUBcOU7swOr1MoRIBYNeLTue9M96VHjnTr3WH0xPC
	BGvcHE3XazBVY5oofFBN0vB4OwWwmFJI0yNL7XLmrV6AcpZGV11ptpC84eoGEJ/FJzdTPKcDYDN
	G34e5qUx+eq958EiZ3tVfUSX8JeKL3t/DMWyjoxbn1qfauL/+0rjfeuuKjarsRfAkoHp997eh67
	fgAIeA+OKCPl6Qg/rj+53kKvy2SDLSenQbudCCaxaOQsxmqk5pY0P0fxY+1MOm/4mEVMCgmufWZ
	na7bEWlUfnu8AElTZiA==
X-Google-Smtp-Source: AGHT+IGZkyOnRETE73ddzebUiYLotGQTF8LKW3XOzsZR95TLcrJssS5wVKRMDojxTfgzH9+euQa67A==
X-Received: by 2002:a05:6a00:1482:b0:734:ded8:77aa with SMTP id d2e1a72fcca58-7397f45e081mr18561824b3a.9.1743510836364;
        Tue, 01 Apr 2025 05:33:56 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73971091cadsm8735905b3a.126.2025.04.01.05.33.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Apr 2025 05:33:55 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <a1f5dbee-5f34-4a2b-b2b9-ce1cff1672b6@roeck-us.net>
Date: Tue, 1 Apr 2025 05:33:54 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: hwmon: amc6821: add fan and PWM
 output
To: Francesco Dolcini <francesco@dolcini.it>,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Farouk Bouabid <farouk.bouabid@cherry.de>,
 Quentin Schulz <quentin.schulz@cherry.de>,
 Francesco Dolcini <francesco.dolcini@toradex.com>,
 linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250331155229.147879-1-francesco@dolcini.it>
 <20250331155229.147879-2-francesco@dolcini.it>
 <20250401-boisterous-teal-bison-533b01@krzk-bin>
 <20250401074345.GA8188@francesco-nb>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20250401074345.GA8188@francesco-nb>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/1/25 00:43, Francesco Dolcini wrote:
> On Tue, Apr 01, 2025 at 08:13:14AM +0200, Krzysztof Kozlowski wrote:
>> On Mon, Mar 31, 2025 at 05:52:28PM +0200, Francesco Dolcini wrote:
>>> From: Francesco Dolcini <francesco.dolcini@toradex.com>
>>>
>>> Add properties to describe the fan and the PWM controller output.
>>>
>>> Link: https://www.ti.com/lit/gpn/amc6821
>>> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
>>> ---
>>> v3:
>>>   - explicitly describe the fan, use standard PWM and FAN bindings
>>>   - pwm.yaml cannot be referenced, because of the $nodename pattern that is
>>>     enforced there
>>> v2: https://lore.kernel.org/all/20250224180801.128685-2-francesco@dolcini.it/
>>>   - no changes
>>> v1: https://lore.kernel.org/all/20250218165633.106867-2-francesco@dolcini.it/
>>> ---
>>>   .../devicetree/bindings/hwmon/ti,amc6821.yaml      | 14 +++++++++++++-
>>>   1 file changed, 13 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/hwmon/ti,amc6821.yaml b/Documentation/devicetree/bindings/hwmon/ti,amc6821.yaml
>>> index 5d33f1a23d03..94aca9c378e6 100644
>>> --- a/Documentation/devicetree/bindings/hwmon/ti,amc6821.yaml
>>> +++ b/Documentation/devicetree/bindings/hwmon/ti,amc6821.yaml
>>> @@ -28,6 +28,13 @@ properties:
>>>     i2c-mux:
>>>       type: object
>>>   
>>> +  fan:
>>> +    $ref: fan-common.yaml#
>>> +    unevaluatedProperties: false
>>
>> Why do you need the child, instead of referencing fan-common in the top
>> level?
> 
> Two small reasons.
> 
> First is that the amc6821 is a fan controller, and the fan is just
> connected to it. So having the fan as a child seemed the right way to
> describe it, and this is done like that in other hwmon binding.
> 
> .. but now that you asked I tried to move the fan-common to the top
> level and it's not working.
> 
> I added
> 
>    allOf:
>      - $ref: fan-common.yaml#
> 
> at top level, removed the fan child, and moved the pwms up one level in
> the example
> 
>      i2c {
>          #address-cells = <1>;
>          #size-cells = <0>;
> 
>          fan_controller: fan@18 {
>              compatible = "ti,amc6821";
>              reg = <0x18>;
>              #pwm-cells = <2>;
>              pwms = <&fan_controller 40000 0>;

devicetree wants to see #pwm-cells one level above pwms. Obviously you can't
put it under the i2c node, so you need the sub-level. Maybe there is a way
around it, but if so I don't know what it might be.

Guenter

