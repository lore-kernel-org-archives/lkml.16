Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC32C25A2BF;
	Fri, 20 Jun 2025 08:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750409638; cv=none; b=fRIL630On5cXKDOHYhz+IiAPg/6LZWobxp70/BwB30ujauItxlrxdGnB5aDnlbl0VnrfnFwAMe/lJRWHNyA8gH6BGFovOApEw/6npHofUiUelrSRZV9dyP0UaVeyHCB4DcCja0G338qcT8h2+OM7wcOk06phLM0f/v7wofiDmgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750409638; c=relaxed/simple;
	bh=ZEt28yDbA4jtYRWH6czwZyX0Dir/c+EuR469f9IcAXE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kFIcQmEUIhOf5eRFrIB5ES+5zXt7GKRQQj79Vke+sCs5WlqPSCclaBGqQmnQvUHiwJVDOgfOLGQLbtIKsAQu5DsCZlBTRLelvVH0jyAj1hrGDRJXABJwZ2HZ+NbqMHnO1I+OSewrATPdL3nYMqjQYbWd2oc2cddOg732TMwMnAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KUYsZUCn; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KUYsZUCn"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ad572ba1347so257348866b.1;
        Fri, 20 Jun 2025 01:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750409635; x=1751014435; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2oDHB+zxUhZlGRcm/DzvHNAM53q/XnxVlugvAZmBNkM=;
        b=KUYsZUCn3gtKI+wq7PdCRFx0Qaz/Q1lMjj3NDz1TNbDmz3EkipLIdc10GWKfWvUx05
         scdpGaxeyT3nvEau4Au9pzza6GSk/rGWmlwPbp2nPULsnL9xS2QK3SUD1rxHae8rvM7H
         YTUlQ5ibPpF9jYAvnfv5JLUFKZuAlHx1VBMZBxwGvnkk4NCSh6WxlP5cED4qs5tQshdw
         ZStQ+g5jE9JsCe9nPiD6w5tOdDe6iVJakrO3xSDV6cJfPs5XxSVcAa5xqrNPbjJC3ymm
         RN8p5yqB3DrBdAOqV12aJfFXPTQDZ/N/E95x/AvdnVvO5lOSlL5vqhKNMeSoAHaLXNuF
         CtpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750409635; x=1751014435;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2oDHB+zxUhZlGRcm/DzvHNAM53q/XnxVlugvAZmBNkM=;
        b=lZUHtl73BbpdNpovkMIVglnimyEEb5GzSfmzKhzEf671BRrudDag04G0qp81R+My4Y
         NctIMtAiuKu+0TuqcMgjxhIW6mYIwnoHJseZKOtRoUY62tjuiZwQ2ex9V1961FY9GVXA
         URGWL9Hkb9s2VCIinQl3W7KuDqEY+Wy+lCx7hXVYiWGC39ZTfUyMHegVhth7uMPwPmCO
         nNLURNxtN4hYB4kiupXRtf8V2eGEc4HajUXElDK30U5p+m+QC2ujVaUIlICOpORaQqbS
         TgbVHL06kkr6aeBS8hdAQ8JkAQlaaSNgjvXPO3b3g8SsCtUE/hf3Z+F+CLVkD0poDjzR
         un1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUPKCdBZ64H/7UrLPFYQmhdgoda5kR1JhuWDzlo5Jt380dONr1dm3PaTsCX2hw83VpCxUnEcc1J2E14@vger.kernel.org, AJvYcCWuYNYjSRW2P0JoYKPQa/ZwQ5dCRbNTQ62VGFHvrjOPFywNiidcl6BXu9kDguU1bwGxEj0VDejkfrUXehDP@vger.kernel.org
X-Gm-Message-State: AOJu0YxHUPQDoN0b1+qLT7Ito1QvPCgm7COV2umu/TAvkHy5OgQpXu/E
	arHNX/UjqiAS1KMa/EY1CGI89N8Q3ABV4wGdbY4qsC29mhG5bbeVS5zc
X-Gm-Gg: ASbGncueW7kOGgAhPa730OcA60iFJdhxVMqFWk8GkVmDaeB8HGn72x+zwSwfFxSleTo
	xmWE7WYtrNhps6Z91V7Q+WW7o9IgCwLD/y3rhqQ9KnUw8jJuPV2QO3rg2SgKDoUf+m+tBjfu6vi
	bJlMpNk3/+VlszBFowgvtnbn0D/HSKzrCJgu5XmScObDWCID5F9AVzAXvMqVUa6Q4LmhxljZLt3
	mu76e3pu4qKsa3QmS2hqedQqUPns8vNx65acA9/lz3uvwnh7iU3aDJ8fVh5zt8pHj19HQlexPKS
	Tb+VVn+DAE3IC6LetQF93CQV+/3KaDTBn6Qn6QyIVwtiR1iVB+/9ZhzbKfFXgzSoQAEEhlkYNQT
	K9nzAWh4lz/iR0E4A34KCYnEf5O6p
X-Google-Smtp-Source: AGHT+IG7t3T/8GGCzsIAufX7eYyvKOcvytMBZuwIkdFld6x0jpQAVkc/E1ovqXbmyvsDnmRHziZMFQ==
X-Received: by 2002:a17:907:3c82:b0:ad8:914b:7d0b with SMTP id a640c23a62f3a-ae0579cd940mr193333766b.11.1750409634864;
        Fri, 20 Jun 2025 01:53:54 -0700 (PDT)
Received: from [192.168.1.130] (11-127.static.abakusbp.net. [46.17.127.11])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0541b6f5csm125316566b.122.2025.06.20.01.53.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Jun 2025 01:53:54 -0700 (PDT)
Message-ID: <e2cd9f09-b984-4409-9b3b-7b6335dd23ea@gmail.com>
Date: Fri, 20 Jun 2025 10:53:52 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] dt-bindings: arm: imx8mp: Add Ultratronik
 Ultra-MACH SBC
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: boerge.struempfel@gmail.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250611113039.304742-1-goran.radni@gmail.com>
 <20250611113039.304742-3-goran.radni@gmail.com>
 <20250612-snobbish-outrageous-nyala-dca804@kuoka>
 <26194c8d-c16f-4293-8c0f-5c674e09a1ba@gmail.com>
 <578ea477-c68c-4427-8013-550bf4f9c05b@kernel.org>
Content-Language: en-US
From: Goran Radenovic <goran.radni@gmail.com>
In-Reply-To: <578ea477-c68c-4427-8013-550bf4f9c05b@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Krzysztof Kozlowski wrote:
> On 12/06/2025 12:09, Goran Radenovic wrote:
>> Hi Krzysztof,
>>
>> Thanks for the feedback, and you're absolutely right — I made a mistake
>> here.
>>
>> That said, I’m still a bit confused by your earlier comment:
>>
>>       "That's just part of the standard/first enum."
>>
>> I’m introducing a new board from a new manufacturer, so I expected to
>> add a new enum block — similar to how it's done for other vendor entries
> 
> No, you are expected to add to existing enum.

Very well, I'll add the entry to the existing `description: i.MX8MP 
based Boards` block.

> 
>> in the same file. I ran dt_binding_check, and it passed without errors
>> for this structure.
> 
> Not possible. The syntax is clearly wrong, so there is no way it passed
> any tests. And Rob's report is a proof of that.
> 

You are right for v2. I was referring to v1. Sorry for the confusion.

>>
>> Could you clarify which “standard/first enum” you were referring to?
>> Should all i.MX8MP-based boards share a single enum block, regardless of
>> vendor?
> 
> Don't they? Look around in this file.
> 

I did, and I've learned something.

>>
>> Thanks again for your guidance.
> 
> Don't top post but reply inline.
> 

Ok, thank you for the correction.

> Best regards,
> Krzysztof


Best regards
Goran
