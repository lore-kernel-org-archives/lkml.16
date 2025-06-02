Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51DCC22A4E1;
	Mon,  2 Jun 2025 18:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748887908; cv=none; b=ZHR7VVX7lQk4UF50P6EQkQV9xdxgMvQiXqFMa89J44BXs2RuL77AwWYpB05T/kz4MrRooCa0lTIPuwA8T1xOsWRdbJAaHAw7BDejadwHoF9dUb7+2JwVf5l56cWrm+8X9+bNm6G+Wj3HeEgxMFdkv29G/YE8nILWZmZmqymR81U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748887908; c=relaxed/simple;
	bh=pXl4R74fMG2fA0UTOYXzb6y7P9DnOVBOAnCvvCG2LcM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jClcaof3xVSWFdSSdc0y7nby5jmF1lyZxU6qDbbrqoj3Bg+Ju4mpOtyGUh+mGPeY1asfPcxni5U7ClyJhFPl9Gav4hw1qQL/HDY+TP0dNWuQegnRtF2kHiUQlt+lY5tq19vx0yON2Nh0GTW41hWf9eqM0SCyY1e5ppN+bFA7moc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cuk9BdOU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cuk9BdOU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EA73C4CEEE;
	Mon,  2 Jun 2025 18:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748887907;
	bh=pXl4R74fMG2fA0UTOYXzb6y7P9DnOVBOAnCvvCG2LcM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Cuk9BdOUl8BAsQv4thIYSe5zLk4TJ0i+eQAzSYtAzL9hOHrls2qqfDJRhaJH5uEt2
	 +U8xG/RUJRGi5IsABi78kO/H6xPtyta/iMPIt5W4IBYycZiL+ImVhB4MbKbNgSOZXW
	 GRT3AH6ftSZuHxIfbKiTF4yHh53uH+LcRUFdHpZ9b+arLrjE6a92pXq8b10gcttpDh
	 B9TpKCsoZDS08to6684ohxNC+mJGBjmYCzOjlQ4VK+84pNTOKlpxu+pf6jhc8T0Cjh
	 DBJOZKjfZaQKnoLL0PrNF/bbLgac/zhhj3Olc8QddEIgqr268PF+CSyN9gmSxcZGVk
	 AXXMxemOFtUtg==
Message-ID: <29b221e2-254c-4964-adfd-b99cda8b5011@kernel.org>
Date: Mon, 2 Jun 2025 20:11:43 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: Add Device Tree binding for ST M24LR
 control interface
To: Abd-Alrhman Masalkhi <abd.masalkhi@gmail.com>
Cc: arnd@arndb.de, conor+dt@kernel.org, devicetree@vger.kernel.org,
 gregkh@linuxfoundation.org, krzk+dt@kernel.org,
 linux-kernel@vger.kernel.org, robh@kernel.org
References: <3c49628c-00b0-488d-a660-4b904febca1e@kernel.org>
 <20250602172327.2029611-1-abd.masalkhi@gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20250602172327.2029611-1-abd.masalkhi@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02/06/2025 19:23, Abd-Alrhman Masalkhi wrote:
>>>
>>> Device Select Code Format:
>>> Bit:                b7  b6  b5  b4  b3  b2  b1  b0
>>> Value:              1   0   1   0   E2  1   1   R/W
>>>
>>> To access the EEPROM memory, E2 (b3) should be 0:
>>>
>>> Device Select Code Format:
>>> Bit:                b7  b6  b5  b4  b3  b2  b1  b0
>>> Value:              1   0   1   0   0  1   1   R/W
>>>
>>> To access the system control interface, E2 (b3) should be 1:
>>
>> So these are just two different addresses. I already commented on this.
>> This is not I2C mux but a device with two addresses.
> 
> I'd like to clarify one point before proceeding further, If I remove
> the i2c-mux usage from the binding file, as your recommendation, does
> this also imply that I should stop using the i2c-mux API in my driver
> implementation itself? and treat this as a multi-function device, or


Not using i2c-mux schema means only that you cannot use i2c-mux
properties. Maybe this implies that you cannot use i2c-mux API, feels
likely, but not really sure and I don't want to take responsibility for
that decision.

I am commenting here about bindings, not the drivers. Drivers can
implement binding in many different ways, thus discussion about bindings
is independent, except narrowing/restricting the ABI.


> Is it acceptable to keep the current driver logic as-is, while limiting
> the change to just fixing the binding and device tree representation?

Dunno, did not look at your driver. Again, I am here talking about
bindings. How you implement it in the driver is up to you. You have
however one device with two addresses, so you should most likely have
only one device node in DTS with two addresses. In certain cases, like
separate resources and re-usability, children are common, but that was
not really the case here.

Look at ti,pcm6240.yaml, ti,tas2781.yaml and few others (you can git
grep for them for reg with coma).

> 
> and if only the binding file, should i represent it as the following:
> 
>   eeprom-ctl@57 {
>   #address-cells = <1>;
>   #size-cells = <0>;

These two are obviously not used.

>   compatible = "st,m24lr04e-r";
>   reg = <0x57>;

That's only one address, you need two.


> 
>   }
> 
> Best regards,
> Abd-Alrhman Masalkhi


Best regards,
Krzysztof
