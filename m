Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EDC92E173E;
	Fri, 13 Jun 2025 11:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749813159; cv=none; b=UllD7wnhT+WFy4EHwGQOWlwireUCOh8HdoSd8uuruYQ/Xt89imoaKAsfJDiz7IXjinTa7PAsEbCQCBuWfZQ9DNCFlRYvjQLVJ0nLZ/hew4C4fT+muasA+jW9iyQ7hrDCT1bXkZgeBD8IZwnvzddsb07lhe0vS2sD0bSYmJ4yn/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749813159; c=relaxed/simple;
	bh=lINW/JumqnU+vIYuBVbHCXjNyewMrI2zh8LHp2LA4wA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tjKSIXR+rLzBoUPY7XSR/bN+U2neJa3/GA5LG0i0QmSthni8garHyY0gp+usHMiPj/k9yd9ilA42i22P3XI9oi0f251cY5QlqlJo7ar/53kLJjPUbjhwmhISe65vlYAhHZr8ugg+m9K4ivU7W8Fg0LqUuVBIVSv4/Bwe3fBCVm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Th+Apk85; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Th+Apk85"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 780E6C4CEE3;
	Fri, 13 Jun 2025 11:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749813158;
	bh=lINW/JumqnU+vIYuBVbHCXjNyewMrI2zh8LHp2LA4wA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Th+Apk85+JFNyelftbyxolN/isZikcWwGf/D+BwCz5n+mQWFXDZ2kl+5Y/ftKyXbv
	 sFpCc+qSlPRNrhHfVdZKAdDmdU9JTvr6S3kLjEeO69uoAg6PiJovfWnW0+5warRxH2
	 /QyFi38r8ifFWuOUu06oeEnQvz1LG8lMR2Er19tbK7QlhEMN77w4QHBS3RliVF/VsU
	 NgncTuPBmWuXCZZL0ePPNfT7ecB/d7BFiXnaX6PkNMaKfpuKeqPCcdVwoWg18v82g1
	 qA/tGakgVRhbcEQWDJNGLK2qseHphnKJUY0AKx/mWpv5i3rkN50Y75sFS72HobAkfL
	 o92k/UzpJvvGw==
Message-ID: <896e09a1-6376-4516-901d-354993ac4afc@kernel.org>
Date: Fri, 13 Jun 2025 13:12:34 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: usb: microchip,usb5744: Add support for
 configurable board reset delays
To: Michal Simek <michal.simek@amd.com>,
 Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
 gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, git@amd.com
References: <1749148171-1729610-1-git-send-email-radhey.shyam.pandey@amd.com>
 <f1b83b96-7cac-4014-b791-e073d2299c01@kernel.org>
 <2e03b43e-5917-4581-9aed-780dec9e3ea9@amd.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <2e03b43e-5917-4581-9aed-780dec9e3ea9@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13/06/2025 11:13, Michal Simek wrote:
> 
> 
> On 6/13/25 10:47, Krzysztof Kozlowski wrote:
>> On 05/06/2025 20:29, Radhey Shyam Pandey wrote:
>>> Introduce 'reset-delay-us' and 'power-on-delay-us' properties. Default
>>> delays in datasheet are not good enough for Xilinx Kria KR260 Robotics
>>> Starter Kit (and others) so there is a need to program board specific
>>> reset and power on delay via DT.
>>>
>>> Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
>>> ---
>>> Taken reference from mdio.yaml[1]
>>> [1]: Documentation/devicetree/bindings/net/mdio.yaml
>>> ---
>>>   .../devicetree/bindings/usb/microchip,usb5744.yaml   | 12 ++++++++++++
>>>   1 file changed, 12 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/usb/microchip,usb5744.yaml b/Documentation/devicetree/bindings/usb/microchip,usb5744.yaml
>>> index c68c04da3399..94a2bebd32da 100644
>>> --- a/Documentation/devicetree/bindings/usb/microchip,usb5744.yaml
>>> +++ b/Documentation/devicetree/bindings/usb/microchip,usb5744.yaml
>>> @@ -52,6 +52,16 @@ properties:
>>>       description:
>>>         phandle of an usb hub connected via i2c bus.
>>>   
>>> +  reset-delay-us:
>>> +    description:
>>> +      RESET pulse width in microseconds.
>>
>> I don't understand - there is no user for this in USB. Why do we need an
>> ABI if no one ever uses it (and commit msg should clearly explain that)?

This still needs solving.

>>
>>> +
>>> +  power-on-delay-us:
>>
>> No user here, either. Plus I just wonder if you are mixing here RC
>> delays or regulator ramp delays, because datasheet does not mention any
>> delay.
>>
>> Can you point me to datasheet page explaining these delays?
> 
> Here is datasheet.
> 
> https://ww1.microchip.com/downloads/aemDocuments/documents/UNG/ProductDocuments/DataSheets/USB5744-Data-Sheet-DS00001855.pdf
> 
> 10.6.3 chapter
> 
> minimum assert time is 5us this corresponds to reset-delay-us and then there is 
> requirement for minimum 1ms for configuration strap.
> On Kria platforms 5us and 1ms is used in U-Boot usb onboard driver but that 
> times needs to be extended to be able to configure hub over i2c.


And why minimums don't work? Because of some RC circuitry? If so, we
have bindings for GPIO delays as well.

Or regulator-ramp-delay... but I already said about these two.



Best regards,
Krzysztof
