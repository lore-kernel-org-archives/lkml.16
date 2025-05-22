Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE7E5770FE
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 18:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747938658; cv=none; b=lVy8SVo3iUUNt+gdgZtC+fDb/JZTLWWobgYCX+VyvzEoTirMLSfj07s5RYRLNYjeXrKXtsnh5hkrMEVL09rQDU96zpIIMNWAsigDVL5WtRapmu6DLY1qZJLmPEvV57V3td/uRcX8Fypr6vOmrOu044O1SHqzYwrztaboL8BlMRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747938658; c=relaxed/simple;
	bh=wqUV9nRzA1232FDEPURilN1rVOb3n5UdnlfYdPzPtIs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fF4KSqOIGeEf2igt9KekuP4xkHTGpk9twXl+9GREO4IeNcePJkYP/MKt3aAc1gkhMOUcS/01Zu83RnImMRHeaBmNaM9M5qKabxfaYp52u8+gd1Ax1I5gNzaAMZa/fUgxQXoumGQqjk7KmwPWlOGCOnTAJ5/+hyPIeiubIWz2ACQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bx+oUthQ; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bx+oUthQ"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a361c8a830so1057377f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 11:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747938654; x=1748543454; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KTYGQrxKhWMUTsF5Gw0UW3F/dL/eiQO+aStihSPsKa0=;
        b=bx+oUthQoSs3L282g2VG6/2aG73MxAk30x7IJ8TPQQ68BFZfZ3UVeovsslznHSdRun
         RUd07cJODfYEnCi00uMXTX7JRsOI8jB8PmWR4XivP8PIBNblzhomMZXAZPjFUWUxNAZx
         3nvJY+BveCE6oAPiiVvRoi8+pKZmTT3LegOVc0bBuA9FwqXOUPhiErcTDuPfLYebsqOp
         a6ZgjuN4SvX+CCCQNU6jwp19EAetKz+7BJtffhq/Y+tUf50IAq8KoTjvIBKnjgWhA8Z5
         o9w0TVB/Oyv5vzWKNhxGssx53grHEPfNlkoOJYfqOFUTGOpIObNIUq+L1v/Ry8f3ae/i
         F1qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747938654; x=1748543454;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KTYGQrxKhWMUTsF5Gw0UW3F/dL/eiQO+aStihSPsKa0=;
        b=DkwwtlR2qjm8+edof+bWkywS7K6CdEXRM/tvU2VCArlCqsTEZwmQ5sGpr0oah/ocpZ
         LZgMb1pFQkIIzqwff3G+uhe/JKY9XiL5AG96tbP7oU6pZKFmuZuH+WsibakGl/NC7D5d
         mPbGzo1M7OV1Ur/hV7bqz4qeX+0zHkGFgvvGynsoeVi/gn4IZsUSlZRuUP0ruKpTC49k
         hHINhrgpDcVCjbPH3efz8GPNTLys7MPgVI7oXl8EzjjkGHyASdvXfdatE6vwfX0Ah7IP
         ntZXEe3N02dS5F0DestF27TLhGvwGUcqSDP2oLlXAnJ3CCPR3bKgKmBJJhfUcSIHAHoo
         YseQ==
X-Gm-Message-State: AOJu0YxXkB3rs0WjAiFsLWx5iu2etMqYz6e7IFLnRE8z9u9RR6j5z8HB
	JZxWLPs3YbRypFtMzQSYQpkfisZQaWDohmG92uIee9D8mfzWrqX39kNYjyQBpDFrmSQ=
X-Gm-Gg: ASbGnctMtfz9Dr+PAAlJ12Z8HQ9TvJ3IZAMsQQA3bm/pHHJsXGVXrNfLbmbtvJrUhoM
	D0ith/Gmws9xdoQDNq7BwL1EgbdmFYrt8JAJeDChj6F/DX3EgHhdw3s8LRTZz8ye4LiKFx0zE0b
	pQ0RySMUIOMwD0sXivvBzq8+SZmN/lAvLRJU7ZcL5Atg2DHBw2bv+V1CcjtGl0pdKvemHTnwNdS
	snnhGw4dE5m0l0RJll4ENNdnrc5noQ+6fSOWFuDl6Oqc8CpLgsZdcSKCdd8GMKrA7o81gkzFy4J
	BJqA0b1W57asWWoTxqX34rSJfM5piCYbSvtH/zXiGlVYQLv0ADLGIy60kQlLSlo9Q+NpM1o=
X-Google-Smtp-Source: AGHT+IHUs2Eu+mTEMKrL4TMiyindURl2/0CTkWWJut1Hw24NlGXm91RyEAtilIdvD3RQZ0gNVroCng==
X-Received: by 2002:a05:6000:2308:b0:3a3:4b8a:73ab with SMTP id ffacd0b85a97d-3a35c845000mr8309793f8f.12.1747938654107;
        Thu, 22 May 2025 11:30:54 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f7d975f4sm112778865e9.39.2025.05.22.11.30.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 11:30:53 -0700 (PDT)
Message-ID: <5c43b201-68ed-4d6f-8595-bd3df203e81f@linaro.org>
Date: Thu, 22 May 2025 20:30:51 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/5] cdx: Minor cleanups
To: "Agarwal, Nikhil" <nikhil.agarwal@amd.com>,
 "Gupta, Nipun" <Nipun.Gupta@amd.com>, Greg KH <gregkh@linuxfoundation.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20250502-cdx-clean-v3-0-6aaa5b369fc5@linaro.org>
 <BL1PR12MB53333E728D0A5837E453ED629D892@BL1PR12MB5333.namprd12.prod.outlook.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <BL1PR12MB53333E728D0A5837E453ED629D892@BL1PR12MB5333.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06/05/2025 12:59, Agarwal, Nikhil wrote:
>> Changes in v3:
>> - Drop maintainer's update, on Greg's request
>> - Link to v2: https://lore.kernel.org/r/20250430-cdx-clean-v2-0-
>> 7dbfda9364a9@linaro.org
>>
>> Changes in v2:
>> - Patch #1: Add HAS_DMA dependency
>> - Patch #5: New patch, split from previous
>> - Link to v1: https://lore.kernel.org/r/20250425-cdx-clean-v1-0-
>> ea2002dd400d@linaro.org
>>
>> Few simple cleanups for CDX drivers.
>>
>> Best regards,
>> Krzysztof
>>
>> ---
>> Krzysztof Kozlowski (5):
>>       cdx: Enable compile testing
>>       cdx: controller: Simplify with dev_err_probe()
>>       cdx: controller: Drop useless probe success message
>>       cdx: controller: Do not open-code module_platform_driver()
>>       cdx: controller: Drop unneeded driver.pm NULL assignment
>>
> 
> For series
> Acked-by: Nikhil Agarwal <nikhil.agarwal@amd.com>

This was sent 20 days ago, got acked and still did not reach linux-next.
Are there any more comments? What is happening here with cdx and this
patchset?

Best regards,
Krzysztof
