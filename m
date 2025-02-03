Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE4012A1A4
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 11:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738581325; cv=none; b=ZRfLgKUjB7+vQEe0/GBCD9SvGImjgo5UkkTg34bLFbaFnb4kpG3iXtoyqDJDAclsgV2+NGzmJfODJts5BgKnyClsA386ibYOONqwcUNoPrsSUcqc5QjjvVRQrbKtAMmIIPNCK54tYvI2WPrNf/c58Mi2DKvvb6F73cyxDyIuN64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738581325; c=relaxed/simple;
	bh=T80w7BkG2m6vIvdm6mq3B3WVt4JOXOwX+Qh6CYQEdqg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QJNjmuqvj2hM4KCDn5z6BO9kUtfGh4Ge6RU8CVsMmJIQS2jtdiwW6GYvnOgrPfX2zGQZcK7MYLyQ54Phayd6nQX9WfqrTJSBw6W/MR9Y7j8RWEZ6gZehW1UTOhoZWjphyFxhn162y556UczpYNYppyM7EfbC3B6qVtjqp39drhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aJ3ovVOT; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aJ3ovVOT"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-38c5ba0be37so249002f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 03:15:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738581322; x=1739186122; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2I05FnXwePPK2x14MUovWBwSWvEf3brju7YBi1Uiv0M=;
        b=aJ3ovVOTY3UJlH8UbrnKwwm+jWATTC/JOCJ/LxEEKYyvk2geGDJThu4uWdRrFE0B2p
         TLHCPf28AZvYRUN23UR94l7aTeFNXUgh+UnlCkqAcMpl1+6NIKQUxKAKVTylw92APWm3
         vmfdaR9O8JOySWfchVz7jN7Rv66Knfhkjoy8w20/udN1rwxxPHMdlJoE0JoxzBsgNvcN
         GQAEmiDoOhNLhfzmWqLCuvY34anM5TA38/ikX/ONTCgfE9Mzn0AfJcZrBgfBjdXVjAfn
         rrWFSTFfo+VltjSJF9iooBExEDz6ljpzDENTQaku3JvlN0mvYuIJYAbErIFudyEYcMQf
         Sbhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738581322; x=1739186122;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2I05FnXwePPK2x14MUovWBwSWvEf3brju7YBi1Uiv0M=;
        b=I9xsDgE7faacXRo2mE34ZYog57se9R2oCBCflMyDd4EFfZ7Itp3h8O5r5BsSnt3ofH
         /P7JDdzt5XJeRJtRhErdPoSuZkWAUwmgaeDSjk0KZrCDKuXcc11yVqeK9HqYe2VcH8pe
         oksk8IooeOxyEq3+gaRzxqMMs6KKjDRr3yj0/nk672NC2xoOeOGX1U1aEq1+LKp1UjEJ
         DklTKWxaGbbR0wTrjkCkhYnio3ZOfNXzel6wLZ8+nqBc8B16VHWFuf0hLQiF6EPfsR+N
         W5qFt+Hlrmdw56Y+rCBSVyJopvS72Qgt3sNfvgBQoTxuPH5Phb6+bsDcCedir8eZSQH7
         qi/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVYhumL/VKbpbPXcorSWuHs0RNbUeRU/8MuGFD/SbY7qB44WIFjpmgI9ANab7QszjA86cvKMQxLb2L4oKU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8N3/pN+a/i84T8irdeKCAbBFqnEbTMywQQmauSEtvDtd5LQvA
	Br7MMp20L1856euPj+yCHxeVwWRMlM/phi4VNJlO4zTk2CTwYjbZdfTmhxMljiQ=
X-Gm-Gg: ASbGncvB/KoxQ7EqqCA3M3/CsQPqkj1NHB7OqCiZQLw1+g74sVWB9UpTkJ9wPwCG60q
	Oz8+PBB1MNWhKqO3ExlrqWSKG9lQWb+ckt4qPLWdTu8q9q7TG2bql2kdnvfOFGP6uya4BXb/mI2
	6Kef1NIUUgXHv4tred7kJNXI+ASsDTHBKiW65a/udVdO5lHFil4Zikd+IqUYup2eNKHnac1f37t
	py9vj/Ghf+C8N7vsrbNAPizRZp7VhDfBzUFsM7+wTk38o6YjNZ3c4deX2MlokiRmmXG46m0e3RN
	CtAmT2A08ifCWhlZtRk+Ko+6jtTy1rXe1aA=
X-Google-Smtp-Source: AGHT+IEqTdJ3vMl7WdQXK311XZpu1rz8QDwYH5G0N6B8sqD73wjRm+XqFyg9hzmD23ebvrJ1zla04Q==
X-Received: by 2002:a05:6000:4a0f:b0:38c:28d0:7517 with SMTP id ffacd0b85a97d-38c5195cd12mr6052541f8f.6.1738581322237;
        Mon, 03 Feb 2025 03:15:22 -0800 (PST)
Received: from [192.168.1.20] ([178.197.218.144])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438e23e6860sm151085645e9.20.2025.02.03.03.15.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Feb 2025 03:15:21 -0800 (PST)
Message-ID: <cdae10e0-5580-4152-84b3-8552ebf87b63@linaro.org>
Date: Mon, 3 Feb 2025 12:15:19 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] dt-bindings: firmware: stratix10: Convert to
 json-schema
To: Mahesh Rao <mahesh.rao@intel.com>, Rob Herring <robh@kernel.org>
Cc: Moritz Fischer <mdf@kernel.org>, Xu Yilun <yilun.xu@intel.com>,
 Tom Rix <trix@redhat.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>,
 Wu Hao <hao.wu@intel.com>, Ho Yin <adrian.ho.yin.ng@altera.com>,
 Niravkumar L Rabara <nirav.rabara@altera.com>, linux-fpga@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Mahesh Rao <mahesh.rao@altera.com>
References: <20250131-socfpga_sip_svc_misc-v2-0-eeed4ebc35f9@intel.com>
 <20250131-socfpga_sip_svc_misc-v2-2-eeed4ebc35f9@intel.com>
 <20250131152636.GA3454395-robh@kernel.org>
 <48c715c2-64ac-4e24-973c-515c8814ea07@intel.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <48c715c2-64ac-4e24-973c-515c8814ea07@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03/02/2025 11:42, Mahesh Rao wrote:
> OK, will add the change.
>>> +  memory-region:
>>> +    maxItems: 1
>>> +    description:
>>> +      phandle to a reserved memory region for the service layer driver to
>>> +      communicate with the secure device manager. For more details see
>>> +      Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt.
>> Please read what that file says.
> 
> reserved-memory is moved to dtschema, shall I change this to the following?
> 
> memory-region:
>      maxItems: 1
>      description:
>        Phandle to a reserved memory region for the service layer driver to
>        communicate with the secure device manager.
>        (See reserved-memory in dtschema project.)
> 
> Is this what is required?

Drop:
"Phandle to a"
"(See reserved-memory in dtschema project.)"

They are redundant, because this cannot be anything else than phandle
and there is no need to say where each property is. You don't add such
statement about clocks, interrupts, reg or compatible, so no need for
memory-region.

Removal makes the description actually nicely compact and accurate. Just
how efficient text and code should be.


Best regards,
Krzysztof
