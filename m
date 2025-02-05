Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6D8E126C18;
	Wed,  5 Feb 2025 13:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738763414; cv=none; b=mEVSAGBTVtWOk6SIbcQt8tJfnDbVyZhQ4eknqyZci8kt08X+L9wPlUgc0TD4kZyVAz3I3406zrZBr2OVSF2iN8CPLGm+4UcH+7np8jBaBGwnQSiwRhjyTpnlKPxII/qQv7pC9/H4zqD0KPlANgQo3sNF7Sq6g9gcePHM35+fSfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738763414; c=relaxed/simple;
	bh=Yx7W7Nj2ghR3jhoBtXGIJ/dIFfjmGUS03cAA1Mv+MWs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kg/AWKNSpH7TjcOEdIXdwa00BuXfPtMzP2A3hxqAz7smBqYwnoE9n7hg+021NVrzXP+K+1c9yYKOQYUsgFdMkiZ62wlnzXJub1WLekpNS/xt7AqQdwRyKqjjbN5N/XlveTWays7O1dJcjRDjtu773Mx9/LXwn9gkYZVFyQwELMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lp3vPZ90; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lp3vPZ90"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63F73C4CED1;
	Wed,  5 Feb 2025 13:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738763414;
	bh=Yx7W7Nj2ghR3jhoBtXGIJ/dIFfjmGUS03cAA1Mv+MWs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Lp3vPZ90WbL4QimNhtgMHX7xNdrMy1Bg+dKn0oA76ZH2XOUwU0RjRob1pf6INE6GD
	 T+nLpaVDeKbdDpFaNp6xkP1Xb8/5AsZQUYrlDggwVp1P9uNAHlJcudU66I1qYbMPYE
	 n9C6Pe06dE+IPfB8E8HBM/zEznaPEgyEoodT7sILNamWn+Mc+w7qcpWC3PTPldTfsc
	 jQjg79TTWf8Qzz9OuRB7zbHftLQRaETxy8MEGOn8ATf8awgKkSrw7VkRny3KQSwsIE
	 e0ZRn/6qe079bJFKBxnzp8VZmm23J233yFmgmP9kQ7+RjUdEzjkJCA4l76YzOt+lUR
	 4MzSVOxM48bYw==
Message-ID: <80172550-a3d7-4d56-927c-ff63debc79f8@kernel.org>
Date: Wed, 5 Feb 2025 14:50:09 +0100
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
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <CAPTae5+j9N=RBpfHVE-As+dz7HzrxXAH1enWrmSdFzu6DuaTBA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 05/02/2025 10:07, Badhri Jagan Sridharan wrote:
> .
> 
> On Sun, Feb 2, 2025 at 6:11 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>
>> On Sun, Feb 02, 2025 at 03:50:59AM +0000, Badhri Jagan Sridharan wrote:
>>> This change adds `snps,device-mode-intrpt-mod-interval`
>>
>> Thank you for your patch. There is something to discuss/improve.
> 
> Hi Krzysztof,
> 
> Thanks for taking the time to review ! Happy to address them.
> 
>>
>>> which allows enabling interrupt moderation through
>>> snps,dwc3 node.
>>>
>>> `snps,device-mode-intrpt-mod-interval`specifies the
>>> minimum inter-interrupt interval in 250ns increments
>>> during device mode operation. A value of 0 disables
>>> the interrupt throttling logic and interrupts are
>>> generated immediately if event count becomes non-zero.
>>> Otherwise, the interrupt is signaled when all of the
>>> following conditons are met which are, EVNT_HANDLER_BUSY
>>> is 0, event count is non-zero and at least 250ns increments
>>> of this value has elapsed since the last time interrupt
>>> was de-asserted.
>>
>> Please wrap commit message according to Linux coding style / submission
>> process (neither too early nor over the limit):
>> https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/submitting-patches.rst#L597
> 
> Ack! will do in V2 of this patch.
> 
>>
>>>
>>> Cc: stable@kernel.org
>>> Fixes: cf40b86b6ef6 ("usb: dwc3: Implement interrupt moderation")
>>
>> I don't understand what are you fixing here.  Above commit does not
>> introduce that property.
> 
> Although the above commit does not add this property, it has
> implemented the entire feature except for the property so thought
> sending this with "Fixes:" while CCing  stable@ will allow the
> backport.  I am interested in having this patch in older kernel

Not implementing DT bindings is not a bug. Otherwise provide any sort of
proof that this was not intentional.

I can easily provide you proof why this was intentional: negative review
maintainers.


> versions as well where imod support has been added. Wondering what
> would be the right way to achieve this. Eager to know your thoughts !

So again, downstream and forks... NAK, you cannot push things to stable
just because you want them backported by Greg.

This is not acceptable.

> 
>>
>>
>>> Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
>>> ---
>>>  .../devicetree/bindings/usb/snps,dwc3-common.yaml   | 13 +++++++++++++
>>>  1 file changed, 13 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml b/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
>>> index c956053fd036..3957f1dac3c4 100644
>>> --- a/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
>>> +++ b/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
>>> @@ -375,6 +375,19 @@ properties:
>>>      items:
>>>        enum: [1, 4, 8, 16, 32, 64, 128, 256]
>>>
>>> +  snps,device-mode-intrpt-mod-interval:
>>> +    description:
>>> +      Specifies the minimum inter-interrupt interval in 250ns increments
>>
>> Then use proper property unit suffix.
> 
> Ack ! changing to snps,device-mode-intrpt-mod-interval-ns in V2.
> 
>>
>>> +      during device mode operation. A value of 0 disables the interrupt
>>> +      throttling logic and interrupts are generated immediately if event
>>> +      count becomes non-zero. Otherwise, the interrupt is signaled when
>>> +      all of the following conditons are met which are, EVNT_HANDLER_BUSY
>>> +      is 0, event count is non-zero and at least 250ns increments of this
>>> +      value has elapsed since the last time interrupt was de-asserted.
>>
>> Why is this property of a board? Why different boards would wait
>> different amount of time?
> 
> Interrupt moderation allows batch processing of events reported by the
> controller.
> A very low value of snps,device-mode-intrpt-mod-interval-ns implies
> that the controller will interrupt more often to make the host
> processor process a smaller set of events Vs a larger value will wake
> up the host processor at longer intervals to process events (likely
> more). So depending what the board is designed for this can be tuned
> to achieve the needed outcome.

I do not see dependency on the board. Host has the same CPU always, so
it processes with the same speed.


Best regards,
Krzysztof
