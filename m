Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8035239E66
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 16:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749573349; cv=none; b=eXAbfxzMg9ykGrL4a6RLTtvMEdaW8JGtYzfzuTU+WJ4sEby3GgrSmvEZIUci5P/EHFMZiRpgGTUPDSMXm+aQ0NyMwJNO05yZF6VcPGhPHiCZRGtF2khKEcZH5f9VrO1vu8kqAp0TsVVhN7lwXMxMxgJxKDkYrhxk4uvCm6KCRCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749573349; c=relaxed/simple;
	bh=BoFxGoKvLCwi0r5nMSq/smpqIiW/LFaahTEZQWqCIsE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Nleo1xS0apzryTKS1PIQh6CSUaBJyZwJGAPt69y1pFjRjbhCEbK8UDVTduZMNM/pqqhztfjlG+RrkmfFa+jifd78ZaotZkc2VhG13yn9o4tjdBYpJTXXKXNntfvmxhm1WhzG5TZul+nuKpN4nQe9b9fw8l+cQvZwUaKPd6iqLks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=UJOzR9DV; arc=none smtp.client-ip=209.85.160.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="UJOzR9DV"
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-2cc57330163so4161976fac.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 09:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749573347; x=1750178147; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=337Fs/acVtHLrHpa6wOAa15lKx7cyXodEH1eYODanBI=;
        b=UJOzR9DVbFRsywiuXRhkMEMV+8yicgL+hiIQnlsrO4x8aoB2N69/V+oxVJX+ErFye+
         gYsMuLXm02AjmJGpppnSYcF9G5njjVo5PbWoXEbw9u3u8sJ7webEbi7uPcL34z8onkyy
         P4mAucYKRbpRi58AAFyJTE2zBzit/w/du1EkzCR50ZpUy/twToU1XJDwRgczrXk3pWhF
         6wiNbUzmJaulXdWNjSM9Ez5BwmhI7whtZrWwZpORO6iWMamLjgW5hdO25qycIskQbPO7
         616Aqk0+NI7CbRKhHVH88M1ArM3BN5gDcycylvnT9iaYZP77WWZ/QBJibvfMkEq7jQEH
         n/8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749573347; x=1750178147;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=337Fs/acVtHLrHpa6wOAa15lKx7cyXodEH1eYODanBI=;
        b=ZQH584O6dMSjSKkOXHrRWAwy9Rp0L5eAJMsW/ybiezo23I3ixQ1vKmAYBSVZa8xkyG
         RHNHxL+vSTWpyZP2EIiGyqCmdZH52CMRrQ2ZUco39HeyTH+5hoVW5jZvVZRz/KU/yAig
         ZpKAS2ONxkPOPunluQmN737jdjEI1fNHmp2koF7/ZOlRY647I/LZQ1XEnAczivdvIbIh
         BZiu+9IFu5lUs6RXzqZm+g7p17YjZd02ZzLsMXktY32Uqd9yozCIW89w0r+8wMnJXgUJ
         LchuGNu+n3CUQSi5HiLQNEk0YfGrTy2nuQKMHS3M6a1+sTDNN+vJtTl86qV1k6MWOKhY
         b4eQ==
X-Forwarded-Encrypted: i=1; AJvYcCWs55HqzfiQSkojm57IGpmvtQiFGHP8fb0zj1x77LaHaqRwSOh0YjKYEJaLhRsxnOGFxOvBz5sZMM4ZJtM=@vger.kernel.org
X-Gm-Message-State: AOJu0YztRmUXnNoMZ6rtt1VNbqVZz+eL7+hGi4lOlamMxWJTc8o6j412
	aUFL4YHM5ZIPy8j0IdT2W4FVKRSBHFSkD8qkMiphNRZGi45zSbp4TR01f6OHtBe/uHd2Ng8HyyH
	siQAG
X-Gm-Gg: ASbGncsr6VIrdS3inyrxmq4HzKU7ecUecsX7T/cHAzUxJ3vTUwkKMJJ5cADC8qgA2U5
	Bpgvfp+9+hGQ61lBRq8TmxRfTZo0CvRBxiFPXSLrJx7Vyj6xM0AB16rcXfXv1VWTwaeXSfcpv0r
	7BGgCimPzJRa7bq8THJ8MN2nIONycQu7wLfGznlixl/KFx431BUl3dzJAAJWK3i1kYk0SZ60o90
	6yWHeX54As0SzIz4l2fY6g+4Qw2iVPu3yXtuUhzHBmBQOvg8u0103YDsF2M24GLge4/2TsBZDK1
	S1dfnScAFqLB4BcJdWbPBIFZhwJ3bAk586GNdlKABI22eSy5ESA5oiQa5szk+g0z6IBivSsXS3k
	4xTHQnfGTVCaFCtJqRTLz5GrjoRh1SV/vSH8A
X-Google-Smtp-Source: AGHT+IFKN7q+KfnRdAYUgSFfIsNqsRvnCQQh5WKK0QN04pgRZrP7ovwBO6O0oZMuTYIpSjBWFhM7ig==
X-Received: by 2002:a05:6871:5211:b0:2c2:3eb4:e53 with SMTP id 586e51a60fabf-2ea92c312efmr418737fac.37.1749573335756;
        Tue, 10 Jun 2025 09:35:35 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:eb6c:30d1:632b:494? ([2600:8803:e7e4:1d00:eb6c:30d1:632b:494])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2ea073406c7sm2477362fac.36.2025.06.10.09.35.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 09:35:35 -0700 (PDT)
Message-ID: <9fdbcb45-ed9a-4449-9248-9bc1d5593fa9@baylibre.com>
Date: Tue, 10 Jun 2025 11:35:33 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: iio: adc: adding support for PAC194X
To: Marius.Cristea@microchip.com, jic23@kernel.org, nuno.sa@analog.com,
 andy@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 broonie@kernel.org, devicetree@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250606093929.100118-1-marius.cristea@microchip.com>
 <20250606093929.100118-2-marius.cristea@microchip.com>
 <92c36ad9-5f8e-4ba7-9af4-9cb640f0aa5c@baylibre.com>
 <d364524bad53f5c665071287f55a96e28dc9b231.camel@microchip.com>
 <db78ac20-9b58-49d1-ba38-cc269eaff254@baylibre.com>
 <a9902463d1f29993f13ce0bc87fcfb05472624d5.camel@microchip.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <a9902463d1f29993f13ce0bc87fcfb05472624d5.camel@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 6/10/25 11:04 AM, Marius.Cristea@microchip.com wrote:
> On Tue, 2025-06-10 at 10:22 -0500, David Lechner wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you
>> know the content is safe
>>
>> On 6/10/25 9:46 AM, Marius.Cristea@microchip.com wrote:
>>> Hi David,
>>>
>>>    Thank you for the feedback. Please see my comments below...
>>>

...

>>>>
>>>> Using Jonathan's suggestion from v2 to just have a single
>>>> property
>>>> with 3 different
>>>> ranges to chose from seems simpler that this. It would only
>>>> require
>>>> one property
>>>> and would be self-documenting. The description could be shortened
>>>> to
>>>> just a couple
>>>> of lines.
>>>
>>> I was thinking to add the range for this property, but it looks
>>> (for me
>>> at least) more complicated from the checking point of view. The
>>> driver
>>> is supporting two family of devices that has, each, 3 different
>>> voltage
>>> range as an input.
>>>
>>
>> Usually, having a consistent binding for the same thing among similar
>> devices is more important than how easy it is to implement in the
>> driver.
>>
>> Since this seems to be a common pattern, we could probably justify an
>> iio_property_match_ranges() helper function that would simplify the
>> implementation in drivers that would need to use such a property.
>> Then
>> in each driver it would just be a matter of making a static const
>> array
>> lookup table of ranges for each device and calling the helper
>> function.
> 
> Sorry for not explaining very well. I have implemented the range into
> the driver and I was working well, but I had issues defining the range
> into the device binding and the checker was failing. That was the
> reason that I've dropped the range from the binding. Also I had some
> issues enforcing a certain "available" ranges for a particular part
> into the binding.

What did you try?

The usual way is to define all possibilities and then limit it by compatible.
I think something like this should work:

patternProperties:
  "^channel@[1-4]$":
    properties:
      microchip,input-range-microvolt:
       items:
          - enum: [-32000000, -16000000, -9000000, -4500000, 0]
          - enum: [4500000, 9000000, 16000000, 32000000]


allOf:
  - if:
      properties:
        compatible:
          pattern: "^microchip,pac194"
     then:
       patternProperties:
        "^channel@[1-4]$":
          properties:
            microchip,input-range-microvolt:
              oneOf:
                - items:
                    - const: 0
                    - const: 9000000
                - items:
                    - const: -9000000
                    - const: 9000000
                - items:
                    - const: -4500000
                    - const: 4500000
              default:
                items:
                  - const: 0
                  - const: 9000000
  - if:
      properties:
        compatible:
          pattern: "^microchip,pac195"
     then:
       patternProperties:
        "^channel@[1-4]$":
          properties:
            microchip,input-range-microvolt:
              oneOf:
                - items:
                    - const: 0
                    - const: 32000000
                - items:
                    - const: -32000000
                    - const: 32000000
                - items:
                    - const: -16000000
                    - const: 16000000
              default:
                items:
                  - const: 0
                  - const: 32000000


