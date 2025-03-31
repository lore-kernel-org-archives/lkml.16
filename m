Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0FB642A94;
	Mon, 31 Mar 2025 17:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743441848; cv=none; b=lC2dv/Bjkf3YCADIYrJosUjGUS81Uk9/jW222l3dIKmzuhoiieoxE0AbkcN+NzAmDX7ctoby46FOx0ywX/wl4mCzTGjYxNlMVKDiTRT/MlItPTUm5wP2tfvaSLdimgoZeRl38AgcH1KCkodKTfV/Sk8REbttgrCNxO6xz8WSlHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743441848; c=relaxed/simple;
	bh=j79R1MPh1L5sHuW70wQiqkONGcjFNH95LO5umympOEU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G0QN/FgkfdvUM0CwiiOlSWC13Utdv1/my9YhRH02IUqQOjuMgrfs8bgg53Dk7lihbxEu9RMb3d437hI9PHwwO3vzBx486I7DGvOgjmw2OUx96kIirqvmX1SR9vf1SXRV6VhnLzjHlx/30gHUOVOU7ewKwStDNvyT8/PLpxJN/ZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k1y9exqi; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k1y9exqi"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3014ae35534so6649016a91.0;
        Mon, 31 Mar 2025 10:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743441846; x=1744046646; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=aO9hWxZgmcR20oMMBCQQk52QBGrPlRCDOCISSjrXhZg=;
        b=k1y9exqiQ7AN+BwG+DL+X0hTefLCq4GpE9cjHvXDzQoLW8rsB5BS1TPTmolROjZKGl
         aKrD/eSuFqkZxbXxhlyXazb92NpHR/41ziCSP0eG0TfV102T3ku8Lz1TcRBzhIvIhzcI
         +No2ahYjg5J3+CGsFXJaYrvpLykeU6KceZ/fb1DXn7l9qXNHPEFX3V8jOpM7b66yTVyB
         CCuPwezvBREvUBWjYs9TDqKA0KMAy7LX4sj8o3bjOw1V/Ys3yA0yU/xHHjID4ATy4n8+
         fD5iYpna85l1JzVUXejw7klVRUN7gUwqf3XzhnB6zPrhxP0RVz3C01DsO0+Hu9R8Cdfn
         S6cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743441846; x=1744046646;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aO9hWxZgmcR20oMMBCQQk52QBGrPlRCDOCISSjrXhZg=;
        b=ULpoarHYLtjsJo2CAE6O7tVNoTg7sok82CL3EYOUmKd4DHH6CAFIEUri/baUMCO4QG
         6lzFgtwNfbcvH/7PAltBOiBAt0TxWBJxm7g5h1p63eLbsWFGATVBXb6yALb4Vi3wAC+S
         TfaYcfY44IA9ptORxWFh+cPiGUoIrWQn/tFPTDgRLh87UD2Rztw96yL+JfEeI2HApUvK
         sCqGMSopE3pAi+DQWcrW5DQFKaRmjGVQIC97KL4Tc9YIP9Q/s7+qbgH/al/aC8NPUCGM
         jDdUJHhQGGoZxhHDDFPEIF/jqlUggJ4omM653sRYlPY/eMVyHo0NgxVMhUHtzrTrMHN8
         mwcg==
X-Forwarded-Encrypted: i=1; AJvYcCWI1TQjI73YuUXl0XC9xv5IcsWMje9Q5tlCcC+PrFvExp4IoxE/aTPqbl9313WEqOwF0/vxOMvbBiD2@vger.kernel.org, AJvYcCWjd7Ts5ou2LLDd9shjeYn7vI5XafA4Zo05dHbaWrrjUcACmud+9ReTL/om7kG+6FFy3M/8O/bRnmNQCEDo@vger.kernel.org, AJvYcCWocT+NQ1iuVGAOq4fx3eyu6rTuugHPcj9akCdvV0ubx81a5sJEUnbqWK/QzbW0PcZAe+oSFgWsmrI97NU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4QuvffuvLG9JrL0c2QMpYNC3Zs2i0tj4ZcaOO9uVCuNunH5nF
	BBUtP4Vm3bBMH3IyYE8StTHtG7/y3Hc2lBUfUlMpw+NtZkHuAMk2
X-Gm-Gg: ASbGncsx7vjxk62K6EPBVxu1MboGHl6lwF2zVZdTDKGLuKk07b70+83gU6hLvM4ObKN
	krPOYa2wDmH21TJesyE1wS9okkiMtU3lAXJLTf8BMJ7yW69Lcc0A0ujQjE69ZGNTDL3mytL85tG
	A82pw/uLv0HuTUW9j5A1yxDb4gpI3dd05CxLeqzKnYW+PVMPztBZA8+BYfoGvRo1ctPQW28zkZq
	11UOX2oLzbRV5hLdd7gueCJPk0O/613/WnFSGN8PiasSjH+0RBQ+jsR7DmhdmgSuE8BUGk/sLzG
	NySTVeRAfbLg94pTlNuYlG8V3C8SGwQFB+qEc7xmdpDpgA3k85wNQRHaLkOjOMaOO5i2cRL472V
	KGRZEXdVOf8Yh49CEUQ==
X-Google-Smtp-Source: AGHT+IGnAPt62LGmhB5W7lIyl3TUVN34XCTyX6dQ9OWSKF6x66MR+8JG2LxGDl0PPfRMfaSTURCQEQ==
X-Received: by 2002:a17:90b:2b88:b0:2fe:9581:fbea with SMTP id 98e67ed59e1d1-3053216dd42mr15622056a91.29.1743441846104;
        Mon, 31 Mar 2025 10:24:06 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3039f1d4b6asm9812324a91.38.2025.03.31.10.24.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Mar 2025 10:24:05 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <cbe0e557-f75c-4a4b-b2fb-0ca33f0ec2d1@roeck-us.net>
Date: Mon, 31 Mar 2025 10:24:04 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: hwmon: amc6821: add fan and PWM
 output
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Jean Delvare <jdelvare@suse.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Farouk Bouabid <farouk.bouabid@cherry.de>,
 Quentin Schulz <quentin.schulz@cherry.de>,
 Francesco Dolcini <francesco.dolcini@toradex.com>,
 linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250331155229.147879-1-francesco@dolcini.it>
 <20250331155229.147879-2-francesco@dolcini.it>
 <8064282a-17aa-4b97-b5d9-1b4a8b0dc40b@roeck-us.net>
 <20250331161606.GA148019@francesco-nb>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20250331161606.GA148019@francesco-nb>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/31/25 09:16, Francesco Dolcini wrote:
> Hello Guenter,
> 
> 
> On Mon, Mar 31, 2025 at 09:01:08AM -0700, Guenter Roeck wrote:
>> On 3/31/25 08:52, Francesco Dolcini wrote:
>>> From: Francesco Dolcini <francesco.dolcini@toradex.com>
>>>
>>> Add properties to describe the fan and the PWM controller output.
>>>
>>> Link: https://www.ti.com/lit/gpn/amc6821
>>> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
>>> ---
>>> v3:
>>>    - explicitly describe the fan, use standard PWM and FAN bindings
>>>    - pwm.yaml cannot be referenced, because of the $nodename pattern that is
>>>      enforced there
>>> v2: https://lore.kernel.org/all/20250224180801.128685-2-francesco@dolcini.it/
>>>    - no changes
>>> v1: https://lore.kernel.org/all/20250218165633.106867-2-francesco@dolcini.it/
>>> ---
>>>    .../devicetree/bindings/hwmon/ti,amc6821.yaml      | 14 +++++++++++++-
>>>    1 file changed, 13 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/hwmon/ti,amc6821.yaml b/Documentation/devicetree/bindings/hwmon/ti,amc6821.yaml
>>> index 5d33f1a23d03..94aca9c378e6 100644
>>> --- a/Documentation/devicetree/bindings/hwmon/ti,amc6821.yaml
>>> +++ b/Documentation/devicetree/bindings/hwmon/ti,amc6821.yaml
>>> @@ -28,6 +28,13 @@ properties:
>>>      i2c-mux:
>>>        type: object
>>> +  fan:
>>> +    $ref: fan-common.yaml#
>>> +    unevaluatedProperties: false
>>> +
>>> +  "#pwm-cells":
>>> +    const: 3
>>> +
>>>    required:
>>>      - compatible
>>>      - reg
>>> @@ -50,9 +57,14 @@ examples:
>>>            #address-cells = <1>;
>>>            #size-cells = <0>;
>>> -        fan@18 {
>>> +        fan_controller: fan@18 {
>>>                compatible = "ti,amc6821";
>>>                reg = <0x18>;
>>> +            #pwm-cells = <3>;
>>> +
>>> +            fan {
>>> +                pwms = <&fan_controller 0 40000 0>;
>>
>> There is no explanation for the parameters. I guess that the first is the index and the
>> second is the frequency. The index is not used and can be dropped (there is just a single
>> channel), and the frequency only makes sense if it can actually be configured.
> 
> The PWM period can be configured, the HW supports it, so I think is a
> good idea to properly describe the HW now that I am modifying the
> binding and not have the situation in which we need it in 1 month.
> 
> The instance is just one, it's correct, but there is an assumption
> pretty much everywhere that these 3 #cells are
>   - PWM instance
>   - PWM period in ns
>   - PWM flags
> 
> I decided to keep the first cell there, with the PWM instance, for this
> reason, even as you correctly wrote it would not be required here.
> 
> With that said, looking at existing binding, the description is almost
> never present.
> 

That is not a valid argument.

> I would proceed this way for v4:
>   - keep the first cell as PWM instance
>   - add the description
> 

We just had another driver where we dropped the pwm instance number because
it is unnecessary. See commit a25633a00906. I very much prefer to keep it that
way if it is not needed. Everything else is just confusing. It is bad enough
that the sub-node is needed. We should not make it worse.

Thanks,
Guenter

