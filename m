Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1994224EF7E
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 15:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743694411; cv=none; b=Jmi1OgNGBbs7vOM/YNVn++QVeWXAIaKaIi5fZVJ8SyluccuI7x3BOcO81fng1i3bluKQQz4ZqeSmqQyjMYsaLQEtSZGvJR4sOVPAo94OhDq2hJnKphwls/A4B1s7A5E6qUh42ULGXdZsyAmv3SVQNx5x6qqrBUtNNkfmogaZgQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743694411; c=relaxed/simple;
	bh=xUsMfDdsHev4z8y+qrKBCt1T0mcUN+xIFgs5O6KHNTk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZVdmI8OBYnO8I4z+NCBkR4diPe5KJkXhOiqTh/AMYpq8qKE18vLNT1QcviebloZxjavCJNJ++OFk+5ANWyD47Pg1A6TE7FVKisLZguQBjIkUq6CfxKpouiaohfQWy7fOSyU6m/Om28hAE3azcL172T04AxBQqQwVW5PJUGn4mtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=euke6chF; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="euke6chF"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43cfe63c592so10470405e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 08:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743694407; x=1744299207; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IA3B3Q5eXFyYAQJEPZq6Pd0mFFgGQNKge9PTmDiKXyk=;
        b=euke6chFnB+IvJv/vmegiBgWqdof4AE416F1qKIz2LauJgz0ns/GlLNGOTY0N8B2vK
         NHBudNIk3DPPwbvJ3Vm6mWPiUt1VIxJmRj6UWjzdGBgawXfcX1D0D+5pqk54R4pG9Z2r
         DjeYz3l+cHwsvQwMWbDIJ4kcoez5jgWmoEd1JqSan4S8dYa8Erbfp5BKw2ElatvBqZ+q
         ctKom88/lebu+Y+ZDkD9rIaelBQGSIVV/9CSIHiz0wk1grqsrW/1SgLnb8sSjFTJYhPm
         js2dT3xX99g5FJQDKnJpVB3j9zHRAK938tmr5vkpMWGpXUMMoV1rMkZP/XidPiLBp5km
         n5iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743694407; x=1744299207;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IA3B3Q5eXFyYAQJEPZq6Pd0mFFgGQNKge9PTmDiKXyk=;
        b=lDirmmntXQfm0dwaQKxdn/D903RQX1Uy1OYKvtkh+i2hq4697QUACN7vDlLnjw9SBE
         rZHtnAsOrGreGdGRiLrLhUITqY9WI/GNJRw97AuhxsQJAXM22HJMyenXmvXLVcHHWoJ3
         XEnAS3qIcdO//4FhQ6j276TSRIFQL99alb1NDT3OpfkAsTYKOHvfNzUklWBu9cqKttRU
         TT9JOXeiaS/r6SCde/rLppkUU0AENwnnKnYdCFP+lBcsejUmzPIEPuORtf3xX6IfMzWb
         lY5KRcXLukRDppuFmLIY8s3ZIvxTPFjZSODJEei/K1EaOUI/VAf9qUgU1pa1CnnINwvm
         9KEg==
X-Forwarded-Encrypted: i=1; AJvYcCUr46/5jqJppEx4eAP1sfVjgIAW3qpg2opf8HoQhc4D9tU4PJYTUEuWwpiBNmLTDWaL+g9k40k5DdT1yuY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMbiZrCx74RpXurcoGO5EHjdamPPH6Y/Be7Nv9gYIhJMyR2HOP
	BpIdRpgtVtv+5d3McJKjJ8G78ejv9a+bxW33V/58NitloqIFOf7uS7C0/7SYS+4=
X-Gm-Gg: ASbGncseoBh6lXgrvDiOl60CXbrHo2oF063COWczGQHyMjT0d9ca+mO77UOBTFmJyjj
	f3VX2+fcZBO4t+U3ZVqFxZ33SKxCQhX+CYtCn59Zofn18s7ZzW2KugTrNaOLkpNc6uUFXSRcVNy
	LprMIf6WFmUqNJI9r7J+trzoA+Ij4na8bqKGGruWyXHtGniE6RGMwfpK4/rtHJhuS1Rb1x/K/V2
	I8V7uK2nyNIL51k+nPQi14NiXLnhpWnaMBXfbAw5gu+xmy0NTl6ow8aYAnfjuspEZ3TLKu7xKzK
	dC1EtSPlAqKhUPon1wd3Z9b3M1BkCaQnF0Xc+ntA5wHxzB62v2n5OJx02JarTdpH28gXULs8boq
	FMqV0tZw2HdMGN4Dvq2o=
X-Google-Smtp-Source: AGHT+IGl0RUQsSLIiDj6J53/hl8O4gfEXAtkKHjNB/Cx3JzQ6eah3TKX1+b1Fw2JSaFT996wTjvNNQ==
X-Received: by 2002:a05:6000:1869:b0:38b:d7d2:12f6 with SMTP id ffacd0b85a97d-39c120c8f07mr18988412f8f.2.1743694407337;
        Thu, 03 Apr 2025 08:33:27 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-39c301ba2dfsm2105782f8f.60.2025.04.03.08.33.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Apr 2025 08:33:26 -0700 (PDT)
Message-ID: <5c2def81-11c2-4e24-b633-aabdb50cab34@linaro.org>
Date: Thu, 3 Apr 2025 17:33:26 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: watchdog: Add NXP Software Watchdog
 Timer
To: Krzysztof Kozlowski <krzk@kernel.org>, wim@linux-watchdog.org
Cc: linux@roeck-us.net, linux-watchdog@vger.kernel.org,
 linux-kernel@vger.kernel.org, S32@nxp.com, ghennadi.procopciuc@nxp.com,
 thomas.fossati@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, devicetree@vger.kernel.org
References: <20250402154942.3645283-1-daniel.lezcano@linaro.org>
 <20250402154942.3645283-2-daniel.lezcano@linaro.org>
 <ffe49998-f809-458e-8eda-002d0c0fc32a@kernel.org>
 <c449fba0-476e-495b-abbd-65ba2d44d590@linaro.org>
 <9c47cd4d-41c7-42b9-8f00-a1ea9b9f6ed8@kernel.org>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <9c47cd4d-41c7-42b9-8f00-a1ea9b9f6ed8@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 03/04/2025 16:16, Krzysztof Kozlowski wrote:
> On 03/04/2025 01:01, Daniel Lezcano wrote:
>> On 02/04/2025 17:56, Krzysztof Kozlowski wrote:
>>> On 02/04/2025 17:49, Daniel Lezcano wrote:
>>>> Describe the Software Watchdog Timer available on the S32G platforms.
>>>>
>>>> Cc: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
>>>> Cc: Thomas Fossati <thomas.fossati@linaro.org>
>>>> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
>>>
>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>
>>> Best regards,
>>> Krzysztof
>>
>> I ran the make dt_binding_check but inadvertently removed the "oneOf:"
>> after :/
> Other errors were also not fixed even though you got report on them on
> 29th of March.

Which ones ?

All errors were coming from the oneOf removal, after re-adding it they 
are all gone


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
