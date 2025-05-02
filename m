Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 242BF2BB13
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 07:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746172344; cv=none; b=VsKE5ag3xROn8tPPxjIqM7Tx9uLtw/eA0uazTG03p45wXHF/KEaJRuBr3hzEMH4W1BEXOjWc/RIxI8fFRWHeGwd48H+3///3HNvJy3uh5g0b+F198XK21FhQj+jio7fEJihLXzr/M0cbSg4M9c3ym/0MZHTAAASnSpzM4PaHWlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746172344; c=relaxed/simple;
	bh=lwjE0JjxMIdDyBqLBphIM1CQ+vxk1CzI5zjWvjBV5qU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DFevWoVb+lJ6qUV7asM3PKiRRGW8dSGJeiUwRF3ghHE50RtYH28j/Nh+JTezvFApih5AxRwEp5uQcyDQP7oASrnX/PwJIOlfVFm37uJf/au7seTZg0jAjL6ij19b2Rf0NqvO8KrdWFf1G9Rv5J0mxzwfuteRTBS27uU9f3LsjOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=asRLQujM; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="asRLQujM"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43cf861f936so3205935e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 00:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746172340; x=1746777140; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bF1uWgcXvGzZA2FPjG0wDQPiHOzuZ+3yhZCcZlu2RXY=;
        b=asRLQujMnnGdjse3JuDbDH0gBvBTlbn7KnyRL4bqC/dAiZD6LewnaYzrXHJDCpAYIX
         rPON1TGEdIBY32tfZpvw2QJXpuSXKfh8ApQQkB00Bp7w6Aa36iWYxQcg7o1CFuhFAkAj
         6D5UH+RG0tJZcx1oM9PA5l2jGX591CxlnGyX8WZcx9DWCteqBHyyyZ+4eniR63LLvshs
         fqlPPnYSibQQY4izaNeGWPQBbe8L5x0JJph9JMQvNpo8rnUBCQooJwEL/t7TlQvwEuEr
         /4MyuTrkUzxuXo8dE/Xh45T32zSxfp7SK2l3ppZtkiiy8aYL4/CuBuE6fJ+UA4Ej/DZQ
         ciNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746172340; x=1746777140;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bF1uWgcXvGzZA2FPjG0wDQPiHOzuZ+3yhZCcZlu2RXY=;
        b=WjKVL3day0o0kWERhMbvKUMgzB4Kxkl4+1X/ZZ7mg8d6p0c8E8bBSYdZiPsBpX60y8
         0DyQr1y/dQ7AGlKVtBKDfIWOqXezpoYVIKtCvgmpxwE4JmATr/9D/LLQcb/GjVJ+BVA4
         GRnvhu3EFwRKPJZ/pCdrDw7LVV2ZGWGTA08qiNKukqDtARqnNEqJXgJPsMDmxxEXvzGp
         V/Vt8Mv8lDUIoFuUjqn2637b08JPEaR1KBt5WIC13FM1ADnL3uh+wCMfpZ8Iqb++K6lv
         lgMwuGX+kIKffNDxgvxE3XCbyoy0gXcvvU+66STsFI+oiEq8IJCyi30d4o3uLUiVnMfw
         lo+w==
X-Forwarded-Encrypted: i=1; AJvYcCVatQB2WKQ8AaAoswdX5PqH8Golq+LD8cQLR9jXnlmuqrpu+212j7drjzR8tMWOWt27gJ5Ir5KRXUcdH3Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YxbYACXPoLf13aLhpnjPOEW4GX+68wTVasP/++cXaYTJishm5HC
	NZeyjT8b1ZhQyY6fMArti4nSfZ5vpJVTTFJXOtta4jm0+I5EL+oauGtPErV6J8fTIWPPQMfasiJ
	p
X-Gm-Gg: ASbGncta7oz3RZgwQaJrWKZiigOr+zfhc75SE/Vsr+tD5OYys4br+P4kgy8f7IXSuC7
	r3kLOM4ZGr7IdKqv4HcUhYvvfXfRlOEwCyIysl4AAoIZxWkNcooL+ytbrypoJMtnw+wQuUTJDov
	2jldcvqEljMxFXCn2ep8v2GFYthN4M15dHQJBWmx3pxW+mW4pA4sc0yKNFVRJMrmFa9Vc2K9Q5c
	tLn9eG8SfTH0sxwL9tIIkRTVXuI1pXGCfVz/9Mu3fyV+jzrCxojms0vSWNvrSpdvqM1Tsu1+hIo
	Ms1KaaW+ftEzKY1Ohqc8aK98CFQ5KN/Rc8zBRnG4Lki85UtOYBGoeYECPLQ=
X-Google-Smtp-Source: AGHT+IFRngIIA/1nJxQxuKRd3Q3UVgzncZMVtPsuxc4kKuL4tbIhzgr1Oc9T/MbvfiYtiRIDIWdJDQ==
X-Received: by 2002:a05:600c:1d8c:b0:439:8294:2115 with SMTP id 5b1f17b1804b1-441bbf4b11fmr5071245e9.8.1746172339942;
        Fri, 02 May 2025 00:52:19 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b391c42bsm75163705e9.39.2025.05.02.00.52.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 May 2025 00:52:19 -0700 (PDT)
Message-ID: <77143d25-e0ca-4dbd-9c36-ad8e4c71795e@linaro.org>
Date: Fri, 2 May 2025 09:52:18 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] cdx: MAINTAINERS: Explicitly mention Greg who
 handles patches
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Gupta, Nipun" <nipun.gupta@amd.com>,
 Nikhil Agarwal <nikhil.agarwal@amd.com>, linux-kernel@vger.kernel.org
References: <20250430-cdx-clean-v2-0-7dbfda9364a9@linaro.org>
 <20250430-cdx-clean-v2-6-7dbfda9364a9@linaro.org>
 <2025050158-tingly-doubling-9795@gregkh>
 <45859218-1bde-48e9-bdcf-4ec94fbd47a6@linaro.org>
 <86cd570d-416a-49ab-84e3-6bf54873f8eb@linaro.org>
 <c2644e83-89b5-baad-005a-ed578200d956@amd.com>
 <1039be19-bcb3-4fec-afe7-ce4c217a3753@linaro.org>
 <2025050249-cufflink-renegade-7eef@gregkh>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <2025050249-cufflink-renegade-7eef@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02/05/2025 09:17, Greg Kroah-Hartman wrote:
> On Fri, May 02, 2025 at 08:57:12AM +0200, Krzysztof Kozlowski wrote:
>> On 02/05/2025 08:52, Gupta, Nipun wrote:
>>>
>>>
>>> On 02-05-2025 11:57, Krzysztof Kozlowski wrote:
>>>> On 01/05/2025 18:06, Krzysztof Kozlowski wrote:
>>>>> On 01/05/2025 17:59, Greg Kroah-Hartman wrote:
>>>>>> On Wed, Apr 30, 2025 at 08:41:34PM +0200, Krzysztof Kozlowski wrote:
>>>>>>> Patches for CDX bus drivers are applied by Greg Kroah-Hartman, so list
>>>>>>> him in the maintainers entry because otherwise contributors would be
>>>>>>> surprised their patches got lost.
>>>>>>>
>>>>>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>>>>> ---
>>>>>>>   MAINTAINERS | 1 +
>>>>>>>   1 file changed, 1 insertion(+)
>>>>>>>
>>>>>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>>>>>> index b2c3be5f6131432647dd01f22bbf4bf1c8bde9e6..505d7d45ad7d1c007e89a555264ff8cbeaf6e1f4 100644
>>>>>>> --- a/MAINTAINERS
>>>>>>> +++ b/MAINTAINERS
>>>>>>> @@ -1008,6 +1008,7 @@ F:	Documentation/devicetree/bindings/w1/amd,axi-1wire-host.yaml
>>>>>>>   F:	drivers/w1/masters/amd_axi_w1.c
>>>>>>>   
>>>>>>>   AMD CDX BUS DRIVER
>>>>>>> +M:	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>>>>>>
>>>>>> Sorry, but no, I'm not the maintainer of this driver.  It's up to the
>>>>>> maintainer(s) of it to send me the patches on to be merged, it is not up
>>>>>> to me to maintain the code at all.
>>>>>>
>>>>> Sure, I understand. I  will send a v3 without maintainers patch and I
>>>>> assume the maintainers will pick them up (unless drivers are orphaned).
>>>>
>>>>
>>>> And now I found this:
>>>> https://lore.kernel.org/lkml/929198a2-6b3b-0f1b-3f36-cd8955ca6f19@amd.com/
>>>>
>>>> "We do not maintain a tree and  patches go via Greg's tree."
>>>>
>>>> which means that patches won't be picked up. Your email does not pop up
>>>> on b4/get_maintainers. Overall this means cdx driver might be abandoned,
>>>> from contributors point of view.
>>>
>>> We usually copy Greg once the patches are reviewed/acked from our side 
>>> if he is not already on the list. Do you suggest any alternate approach 
>>> in maintaining the drivers like cdx which do not have their own tree?
>>
>>
>> Either you have the tree or person having the tree appears on
>> maintainers output. There is no other option.
> 
> What?  No, we do this for many subsystems already.  Look at the entry
> for "USB TYPEC BUS FOR ALTERNATE MODES" as one simple example.  The
> patches go to the list, Heikki reviews them and if he says "ack" or
> "signed-off-by" then I pick them up and add them to my tree and away the
> patch goes.

You are CC-ed on these Typec alternate modes, as the subsystem
maintainer or patches-picking-up-maintainer:

*  1 Heikki Krogerus <heikki.krogerus@linux.intel.com>
     maintainer:USB TYPEC BUS FOR ALTERNATE MODES
*  2 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
     maintainer:USB SUBSYSTEM

Here, you are not Cced at all. That's why this is different.

> 
> That last bit is NOT explicitly documented in MAINTAINERS as it does not
> need to be (otherwise you will have too many lines in that file).  This
> is just one more subsystem that does it this way, not a big deal.

It is basically the only one subsystem doing that way.

Basically this looks like incomplete subsystem or a driver without
subsystem. With the different that we have many per-driver entries but
they are part of some subsystem maintainer's scope.

> 
>> If you refuse to take the patches and handle them, I claim this is
>> orphaned from the kernel point of view, even if occasionally Greg takes
>> these. I believe Greg was already pointing this issue more than once.
> 
> They are "handling" them in that they are reviewing them when they get
> the chance and then I need to then pick them up.  Again, totally normal.

I agree they are handling them. I disagree this is totally normal that
get_maintainers.pl does not point out the actual subsystem/maintainer
handling the patches.

If I remember correctly, it was Linus who said he uses
`get_maintainer.pl -f FILE/PATH`, so with his workflow he would not get
the maintainer's address (yours). One would have to go through git
history to look for SoB, but that's not normal process.

That's an exception.


Best regards,
Krzysztof
