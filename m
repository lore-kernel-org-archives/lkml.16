Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 206BC14F117
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 13:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747835419; cv=none; b=iv/yqK2dgEY2vLkGwc30Qn1Rfuk+sVGcdpPHu1An16wpxTVsll6Lw6PWSl92wHEnXjEQPUbzCDNodpExxD27yi3u7LFF0OZYmHLKmm2FI3PoKzYSfRJQpuJfZQ80eTHsE3d8KaDKF2VN7r1Qklp54P6uo/DMcyT+76HSv4NJCQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747835419; c=relaxed/simple;
	bh=xxclzynvG9qMLSJo82MFRje7H/LgVEU3hKXBTA0+0Es=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gqerYr/KROxx75bxts4od8ucqh5KXTlW8ZVD+DRrbOv+IyUJJbX8XIVozD2RfYiGLV2VMLIpQCKCU/6Ae3ELjzOeIinrgIrOx0VrS1i1znGOVrde87IvTd4N4EoAfFIxs9nB+RJV94lBlivdLCVpz6q8TIWQ+hFuJZQw+GKOTKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=vnxx3Nzl; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="vnxx3Nzl"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-72c7332128eso3825810a34.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 06:50:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1747835415; x=1748440215; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2JgaHRKYUX+zfvNTXojTA2fHNWkJMHbiON31ak/TWz4=;
        b=vnxx3Nzl9Zs/QThNC7uSMbC+7jIZ/4ZlrZFyy1DREeRLzAr5DJ2aSJSDoVcJqnffyt
         52s6VCcy35PC115wGq3Z2mPtoOkRnq5aPaCWdCvV5xIoJnV1ZodseK290BYrHxty9BJJ
         7hTzvMUF4HVt5LFN++QYE+dfzadV/G0c3kmXkT/4qjVBTs0zAIv/YUMFSU98sx8KeKcM
         K0yZsdnmUzofu+L2pO8bKG576piP1QFZAgf3ue9bXkdMx8uRPs5ZwNzSr1KTLkHdbr9D
         Jd2slWIl1EQ5GCQlx28ZC2oWy6s2O8VdSnDys5O5skM5XT8DwQUiIVWookOfjRDMiXPn
         B0dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747835415; x=1748440215;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2JgaHRKYUX+zfvNTXojTA2fHNWkJMHbiON31ak/TWz4=;
        b=haSKTZEeGqkhiGMfnlq9kbEwLHxBtduWAD3+U668wMTMHe46I9iL4ulys1Yqh3lNjm
         nO4T1dg0sXTPgsRyfluMDN3z1+6i/W2zBaB6w8Gr+O+ybbJCdent2uRQHoGdCu+dD3F7
         AWC43NGYuXyCPjQdms1/dDSyt95CBeXhZQU7FWI2L9/rJyr2wotAF1z5nu1GDD19oIrV
         XnkBf07cU274k5IA4IFePtEevR/jjmCfBNw0q+dztD0sCQToBy0YbUcKd3CWkUfjqwS9
         Ls34MUtGUu1D1HZJS/f4Eg/7cTHUF45qHmPww8t/5+FOR0idAH4BQh+qzYqWGBo33nkr
         ycDg==
X-Forwarded-Encrypted: i=1; AJvYcCXZgiOLqaJueyQ3RGkSY3Zl14+Q9+NiHvkOLyi54ZvdfSa/UDedUp87H6wferBZfxvRtfkeDea0VH2FVm8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyOi6RlcUHnUbItglBFzJZBJc5hdHIx4CiDD0gfNcrdl7EM9DP/
	XSRfCmMG5lwnbJfW/FSyf/3frHiQB7stD5XT1DUzgFPl+KNdRrXr7KHJWMXgZL9q0C8=
X-Gm-Gg: ASbGncu77Cigfgldc2tDDaMB2+a2hIDg7+wLtTDXnODNqpk+wTtJwtpzPjYcnEdsd8K
	WdOpiSUbKfuCaMnm2T+aGNMlCFVlrR2dcbVWF5GD7xPGUtwLimXOh+gN1WrEfUp9LnjAa/VuEuu
	81tKWwyJtq5EWnsONi6fn3f4ZsA5ZBr7ontcIhIkcSHAws5Dt7Iv0wJea4E5+TkftesEK+l/Ph6
	0Vj+x9lioGW3SLJ9SP/2OieNyFAp3UTNiXRjGDsqbYcftc8hCih8B03odsgaBWy+wqOmj10Wr3j
	Dv70g70mBtVAL9YIIqkp08UAY6gKb0a35/Jc8Dlc/Q8n7djr6LSyEBPYzrTml53xrGU9gW4svxi
	3DOIANsxQ2G6/WOzFS3bY9lAdzQ==
X-Google-Smtp-Source: AGHT+IGNsrBJay16uQjz7d1c9S8nrIXHASYHEtAmfjAXqpv6/iE+yKrM1c1mCMLDvMzkQkx9FSohfQ==
X-Received: by 2002:a05:6830:6206:b0:727:3664:ca28 with SMTP id 46e09a7af769-734f69d3e89mr14202278a34.0.1747835414904;
        Wed, 21 May 2025 06:50:14 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:d77b:6acc:2ad1:8ff? ([2600:8803:e7e4:1d00:d77b:6acc:2ad1:8ff])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-734f6a9a7adsm2152904a34.30.2025.05.21.06.50.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 May 2025 06:50:13 -0700 (PDT)
Message-ID: <1424236a-eee7-4343-b73f-42cd416b594c@baylibre.com>
Date: Wed, 21 May 2025 08:50:12 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] dt-bindings: pwm: adi,axi-pwmgen: add external clock
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Michael Hennerich <michael.hennerich@analog.com>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Trevor Gamblin <tgamblin@baylibre.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-pwm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250520-pwm-axi-pwmgen-add-external-clock-v1-0-6cd63cc001c8@baylibre.com>
 <20250520-pwm-axi-pwmgen-add-external-clock-v1-2-6cd63cc001c8@baylibre.com>
 <20250521-tidy-heron-of-genius-4dc9a1@kuoka>
 <be02b9cd-803c-4aae-9420-ff3bf445efc1@baylibre.com>
 <499207c7-aa40-470c-801f-a8154a253276@kernel.org>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <499207c7-aa40-470c-801f-a8154a253276@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/21/25 8:28 AM, Krzysztof Kozlowski wrote:
> On 21/05/2025 15:14, David Lechner wrote:
>> On 5/21/25 5:09 AM, Krzysztof Kozlowski wrote:
>>> On Tue, May 20, 2025 at 04:00:45PM GMT, David Lechner wrote:
>>>> Add external clock to the schema.
>>>>
>>>> The AXI PWMGEN IP block has a compile option ASYNC_CLK_EN that allows
>>>> the use of an external clock for the PWM output separate from the AXI
>>>> clock that runs the peripheral.
>>>>
>>>> In these cases, we should specify both clocks in the device tree. The
>>>> intention here is that if you specify both clocks, then you include the
>>>> clock-names property and if you don't have an external clock, then you
>>>> omit the clock-names property.
>>>>
>>>> There can't be more than one allOf: in the top level of the schema, so
>>>> it is stolen from $ref since it isn't needed there and used for the
>>>> more typical case of the if statement (even though technically it isn't
>>>> needed there either at this time).
>>>>
>>>> Signed-off-by: David Lechner <dlechner@baylibre.com>
>>>> ---
>>>>  .../devicetree/bindings/pwm/adi,axi-pwmgen.yaml    | 26 ++++++++++++++++++----
>>>>  1 file changed, 22 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/pwm/adi,axi-pwmgen.yaml b/Documentation/devicetree/bindings/pwm/adi,axi-pwmgen.yaml
>>>> index bc44381692054f647a160a6573dae4cff2ee3f31..90f702a5cd80bd7d62e2436b2eed44314ab4fd53 100644
>>>> --- a/Documentation/devicetree/bindings/pwm/adi,axi-pwmgen.yaml
>>>> +++ b/Documentation/devicetree/bindings/pwm/adi,axi-pwmgen.yaml
>>>> @@ -16,8 +16,7 @@ description:
>>>>  
>>>>    https://analogdevicesinc.github.io/hdl/library/axi_pwm_gen/index.html
>>>>  
>>>> -allOf:
>>>> -  - $ref: pwm.yaml#
>>>> +$ref: pwm.yaml#
>>>>  
>>>>  properties:
>>>>    compatible:
>>>> @@ -30,7 +29,13 @@ properties:
>>>>      const: 3
>>>>  
>>>>    clocks:
>>>> -    maxItems: 1
>>>> +    minItems: 1
>>>> +    maxItems: 2
>>>> +
>>>> +  clock-names:
>>>> +    items:
>>>> +      - const: axi
>>>> +      - const: ext
>>>>  
>>>>  required:
>>>>    - reg
>>>> @@ -38,11 +43,24 @@ required:
>>>>  
>>>>  unevaluatedProperties: false
>>>>  
>>>> +allOf:
>>>> +  - if:
>>>> +      required: [clock-names]
>>>
>>>
>>> No, don't do that. If you want clock-names, just add them for both
>>> cases. Otherwise, just describe items in clocks and no need for
>>> clock-names.
>>
>> Would it be OK then to make clock-names required and just let the
>> driver still handle one clocks, no clock-names for backwards compatibility?
> 
> So just don't make it required.
> 
>>
>>>
>>>
>>>
>>>> +    then:
>>>> +      properties:
>>>> +        clocks:
>>>> +          minItems: 2
>>>> +    else:
>>>> +      properties:
>>>> +        clocks:
>>>> +          maxItems: 1
>>>> +
>>>>  examples:
>>>>    - |
>>>>      pwm@44b00000 {
>>>>          compatible = "adi,axi-pwmgen-2.00.a";
>>>>          reg = <0x44b00000 0x1000>;
>>>> -        clocks = <&spi_clk>;
>>>> +        clocks = <&fpga_clk>, <&spi_clk>;
>>>
>>> What was the clock[0] before? Axi, right, so SPI_CLK. Now FPGA is the
>>> AXI_CLK? This feels like clock order reversed.
>>
>> The problem being fixed here is that since there was only one clock in
>> the binding, existing .dts files have either have the spi_clock or
>> the FPGA/AXI clock. So the one clock could be either and there are
>> existing .dtbs out in the world with both cases.
> 
> No problem like that was explained in commit msg. Nevertheless driver

You are right. I explained it in the cover letter, but failed to repeat
that in this commit message.

> assumed the first clock is the SPI, didn't it? So that's your ABI, even
> if binding was not conclusive here.

Not quite. The driver (before this series) assumes that the clock
is the SPI clock ("ext") if the HDL was compiled with ASYNC_CLK_EN=1
or the AXI clock if the HDL was compiled with ASYNC_CLK_EN=0 (in this
case, there is no "ext"/SPI clock).

>>
>> But we could consider reversing this so that if someone uses the new
>> bindings with an old kernel, then it would still work.
> 
> You cannot use new bindings with old kernel. How would that work? Put
> YAML file there? Nothing would change.
> 
> Binding is supposed to be complete for exactly this reason. You cannot
> change it afterwards without breaking users.
> 
> Best regards,
> Krzysztof

