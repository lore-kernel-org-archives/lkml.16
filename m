Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D9E918C011
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 16:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746115590; cv=none; b=GOPdA3EnUYl/KlTolUnRV9U2T9O3HImM3iEJiFB9uxKAKVOi5RfF8rNq2I/iGgCzIzCzKUNIj7l3s9z8EMx+r8sELtlovoptTF5T0qsl9rjuDkfO9rwMXYnXTKxeYZETwZ2KG+PyFdDDDuDuJevwt2DVnojfk5uUrW+FMP2iZt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746115590; c=relaxed/simple;
	bh=SdlcDxWoda+PVjAKolaB7aMbWSr7n09DS0Uo7G+U5uQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p36UL2l0TU2eBf9ZaGwYctzwL6ogrGAsqUhIqKhUdVw/GtnG5+8hDpnIBkwKv0AT9OUAz39QIxksaTiOzdsVEVeWr4Zszt2r9E2Rw+BG/fyAKAh/RjkGhh7cb0lKBJDMD89INdOuot3xG4ort86xBXClTLN4sVq9h5HKrU5PVwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LuVSF3IP; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LuVSF3IP"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-39123ad8a9fso20017f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 01 May 2025 09:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746115587; x=1746720387; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qCbN9F9kitLF246sknPSsqSzcfQ8wKBdVHwUekrR84U=;
        b=LuVSF3IPZ6pgQA5uJY74NR6MjGLjIwAiiH/woF4Pvf7w1TCxpQFfviDqFgjD6VT8xT
         M9/6uezNbN8f75/zGYbfi0KllsJtAf2zTcFyYoSj/bQK6MpeAQGh3BAg2co7/gua9oYM
         JJYy+kKol8FB2so5HjonUs4op7HQD2cnaEAKrnTDBpspKkgbN9sAVCNoBHh1lwU57Hnm
         317NSwdCL7tAnHCj03xMTYRhwGi66tO9JiLB1NlNlan5UX2W1kfMyuEQh/Pm9B0nuKea
         Frr2SHMNFhOqbKV8CI/DoaJ7u4HwWKYcHZUKmOHlFqiw+H+GBqR/CGwDScc6yxv1ZBCI
         dotA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746115587; x=1746720387;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qCbN9F9kitLF246sknPSsqSzcfQ8wKBdVHwUekrR84U=;
        b=wjdhi2Mwfqro7M7eopB5k8pTV9DXRWH3SLtsppHt8gBZHjtZIbXBqTSXG/BBwVz/zW
         1gCVapd/zncxtgz3S4fPqCy30b3uMscvcwiKqAuebJLmwbC6oS6HaEAvSUS5T7lXyYLX
         4gGCMg93Aar4no6oMK5jq3nCNjOqCMWFQgCo4kP2VvF0YVJQt7Eb2uz70XPevbrw+9oZ
         nrNoKvlxve5YjZsJAf6fxjCn6cMMgx78je9/RBoxXtYvvzc6doSefbWKqdXgy6ma6QAK
         +/qrsGtFTAJc/wc+eRldzeKqex6Uv55pZLqvcHGRSqFRNX51kGcBObtwBCs5OOZx9ZXD
         9IDA==
X-Forwarded-Encrypted: i=1; AJvYcCV5Zcq7qfUdvkqNCvB2fgNASJencHtscyqk4O6/ligwKSYjoy7G0p+syheJgxU7M5GTu0KHx0D2DNyImCg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzxchtGQE6rvUx28V0YsPxg6mZI3twAOiyx1AHKbw+LSFVqKO0L
	GPCFc6Zuh+DNCeJoYvt5Ifu/zgMxc9r3eKTf83RNU4Xv5In3Zwvkl1bNp504r9k=
X-Gm-Gg: ASbGnct5ZBgfIuQWsnpu4iJ9cdScA39e7yJ8chAQ8eBWlV2zLuwLcsv3IcdgyyVLyKu
	ZEhy988b+wQ2EwOqIIIxU3SZGZrHUaeKvTPDhv1Cs0e1/qLVEXKKHxTwtKPf7qL9FSAt3cy2Xcn
	gwDf92MY7ABbucgXLsr5HDr2GbZrSlkfKCMMl7xD2gdpVU0zT5hVLVIfJ0D6V8eICseJo1TDKPS
	T6nDhbNceAhWJp/uhIYsOtiYbysl4rt9qw1ulyO8Z0+xXKOuyvyJnRFNyc5ffy2TjN/Ellawo4A
	P2QfsDS84zErffFPmQMRyP978jJvGGOlfIAhX+DppL9uSb8MOUjqr1AWC8I=
X-Google-Smtp-Source: AGHT+IH7naid93imVo4TMhJy+m/kkEvX50IbUNNNqKIAto8P9z+2eh1L6j7ceq4MrzEY3zMgtDk+lQ==
X-Received: by 2002:a5d:64a3:0:b0:3a0:7d47:8d7e with SMTP id ffacd0b85a97d-3a08ff7216dmr1980542f8f.8.1746115587124;
        Thu, 01 May 2025 09:06:27 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a095a45f9asm1167394f8f.25.2025.05.01.09.06.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 May 2025 09:06:26 -0700 (PDT)
Message-ID: <45859218-1bde-48e9-bdcf-4ec94fbd47a6@linaro.org>
Date: Thu, 1 May 2025 18:06:25 +0200
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
Cc: Nipun Gupta <nipun.gupta@amd.com>, Nikhil Agarwal
 <nikhil.agarwal@amd.com>, linux-kernel@vger.kernel.org
References: <20250430-cdx-clean-v2-0-7dbfda9364a9@linaro.org>
 <20250430-cdx-clean-v2-6-7dbfda9364a9@linaro.org>
 <2025050158-tingly-doubling-9795@gregkh>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <2025050158-tingly-doubling-9795@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01/05/2025 17:59, Greg Kroah-Hartman wrote:
> On Wed, Apr 30, 2025 at 08:41:34PM +0200, Krzysztof Kozlowski wrote:
>> Patches for CDX bus drivers are applied by Greg Kroah-Hartman, so list
>> him in the maintainers entry because otherwise contributors would be
>> surprised their patches got lost.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
>>  MAINTAINERS | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index b2c3be5f6131432647dd01f22bbf4bf1c8bde9e6..505d7d45ad7d1c007e89a555264ff8cbeaf6e1f4 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -1008,6 +1008,7 @@ F:	Documentation/devicetree/bindings/w1/amd,axi-1wire-host.yaml
>>  F:	drivers/w1/masters/amd_axi_w1.c
>>  
>>  AMD CDX BUS DRIVER
>> +M:	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> 
> Sorry, but no, I'm not the maintainer of this driver.  It's up to the
> maintainer(s) of it to send me the patches on to be merged, it is not up
> to me to maintain the code at all.
> 
Sure, I understand. I  will send a v3 without maintainers patch and I
assume the maintainers will pick them up (unless drivers are orphaned).

Best regards,
Krzysztof
