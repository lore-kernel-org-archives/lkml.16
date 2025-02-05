Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 780491FF5F4;
	Wed,  5 Feb 2025 19:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738784115; cv=none; b=sru7cxYGiu1mKI13untadRXGtUGWv0iQQGEG9QxbHOJqFWavS73tQrdPXCNpKgav1FUmuErKAybffGL6gcN+LX4MZcbNgH9SwJCEQd/tdgFhADvtknYfdBxBF9+kCCo0BszQCHWfBYOZZOpiL5ORl2S9wLyVV4EJ1U67WR1MaIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738784115; c=relaxed/simple;
	bh=ShcZHGBdifSRfT1a3wdja/S42QVCg8pR07DE0bj9C2A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E7BK/HNBnPQ1Ww7GelOP/gd5srXdCPUMu6k39l+S95WN4fUrBICeO1eFcAQKcTM8pm1+sG/lvr1y5mrnhLxrCaXqvn1EdC22nbVm6RFY4WPjUYeKmujWtYiQY2DR6tpShmu05XtUyWJKYIJ/i82Fw3pk4v6MF8NpcsKQuQH3iVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kkAVgl1X; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kkAVgl1X"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B83FC4CED1;
	Wed,  5 Feb 2025 19:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738784114;
	bh=ShcZHGBdifSRfT1a3wdja/S42QVCg8pR07DE0bj9C2A=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kkAVgl1Xjzt1q8t/CAipXH+qrumDPqWOhCqysT2XJzi3Q4mjx7rhEr5vXrre6CZwu
	 UYBobVOwJGrYY9J0ZnXTjbgFC8CEzK141Cb6yitgYkWG61mAwSPZ5M39xC0ZcAm3Du
	 n97+odZ/wJpzq+jCACoBPJM2OueummlRWdb5KPKLNW3hQ0rmqbCPzoht2HTFKlCpza
	 AoxJOn1lPHCf5xHScmmz2J1Vo5x8WknrjEUVj/BPpDvyd9j9E2f//UPP1VYzPUyAjS
	 S6KkzuwSOPqt30Q5H7BVKna7OkfGcqMo2l5qGMQq7Xp1IDt0GBdM9OGjo/0nV0PryN
	 mlMk1g1q1BHKg==
Message-ID: <73d4153e-cc03-45ba-ae2e-3b9f4baf7346@kernel.org>
Date: Wed, 5 Feb 2025 20:35:09 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] dt-bindings: usb: snps,dwc3: Add property for imod
To: Badhri Jagan Sridharan <badhri@google.com>
Cc: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org,
 felipe.balbi@linux.intel.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, johnyoun@synopsys.com, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 jameswei@google.com, stable@kernel.org
References: <20250202035100.31235-1-badhri@google.com>
 <20250202-purring-ambitious-axolotl-4c6ff4@krzk-bin>
 <CAPTae5+j9N=RBpfHVE-As+dz7HzrxXAH1enWrmSdFzu6DuaTBA@mail.gmail.com>
 <80172550-a3d7-4d56-927c-ff63debc79f8@kernel.org>
 <CAPTae5+xF0B64AhT5fjMU9tcW8cT9smO5eUD=Wpsiw2CKAhDAQ@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <CAPTae5+xF0B64AhT5fjMU9tcW8cT9smO5eUD=Wpsiw2CKAhDAQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05/02/2025 19:19, Badhri Jagan Sridharan wrote:
>>>>
>>>>> +      during device mode operation. A value of 0 disables the interrupt
>>>>> +      throttling logic and interrupts are generated immediately if event
>>>>> +      count becomes non-zero. Otherwise, the interrupt is signaled when
>>>>> +      all of the following conditons are met which are, EVNT_HANDLER_BUSY
>>>>> +      is 0, event count is non-zero and at least 250ns increments of this
>>>>> +      value has elapsed since the last time interrupt was de-asserted.
>>>>
>>>> Why is this property of a board? Why different boards would wait
>>>> different amount of time?
>>>
>>> Interrupt moderation allows batch processing of events reported by the
>>> controller.
>>> A very low value of snps,device-mode-intrpt-mod-interval-ns implies
>>> that the controller will interrupt more often to make the host
>>> processor process a smaller set of events Vs a larger value will wake
>>> up the host processor at longer intervals to process events (likely
>>> more). So depending what the board is designed for this can be tuned
>>> to achieve the needed outcome.
>>
>> I do not see dependency on the board. Host has the same CPU always, so
>> it processes with the same speed.
> 
>  By "host processor", I am referring to the CPU which is scheduling
> the TRBs and responding to the events reported by the Synopsys DWC3
> controller. In a nutshell, the CPU which is driving the  Synopsys DWC3
> controller. The Synopsys DWC3 controller could be paired with any CPU
> configuration and therefore is "Host has the same CPU always" a fair
> assumption to be made ?

Not really, this is part of a SoC, so DWC3 controller is always here
fixed per given setup with given CPU. You claim that this is independent
of SoC, but so far arguments do not support that statement. This is
related to given SoC, so no need for this property and you can deduce
everything from SoC.

You push this as a property because you (or vendor) do not want to
upstream your SoC. That's common pattern, seen here many times. BTW,
good counter argument would be to show me patches for upstream DTS users
of this. Actually that would be very easy way to finish discussion...
but there are no patches, right? Why? Because it is not upstream and it
is done for downstream solution. Sorry, no. Develop code how upstream
develops, not downstream.

Best regards,
Krzysztof
