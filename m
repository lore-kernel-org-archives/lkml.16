Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F0D8267AF8
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 09:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747732610; cv=none; b=MzTaMPc39uZoGUCgjm9eKb6jhtkMXpobPxHKDY0aW/Fm+CI2cVOLNBRcnzWSkDor1UUn98foEocTJj4evKzWvxM6TKdN2pj+dayzf7ZbGWeYSy4OsXaHixDRixdTKqOklD60sh1tn+HsOSYWWqTx+Mmq1H2M41a1vmxjf4rVayA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747732610; c=relaxed/simple;
	bh=toqNg59UJrc8gt/RMPGezlYeL7jNA10iT5eAJRH1bFU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j6tvcKUFYWQAvFNkd98O1ccoiPG31sQvBkXpTW24BIMkchuslWQF8tlOLojiiFj0eldlN2XBSQ7MxpufPe2c8G+SibQ/fuJT4Pj7Ivglq3MmPanxenZwyDLPV557WIYYfJ2s8cOhlhChTGH/hjXpR1bf8Uy/OZkcPMcjEHj01+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qtXnQUg9; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qtXnQUg9"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a365bc0af8so350145f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 02:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747732607; x=1748337407; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=F+UlmK6vZqOhMbeIGsSzMO1lqo8dnORGNiewbO/ut+Q=;
        b=qtXnQUg9PTKTuihvdRhqgOQTqEDOZ/c13d0eIyXowdOXKAk7mlVF416dCD4LFRAjrx
         jkUQF8daTG0Nf6ZYLMNrlxEjxGHQTVjdRAF3jZt/By+/cQ4vnXvX66XaIxbVefT18+NJ
         dUZMWbTexRH5o3Uzcvv0j2JDe+o3AWsLZ7ZcA7qoQIMdQPAG2fv/E/b1KPeIvnuhO57U
         iXRJYeeIFlHoKzVUXfp1IgIWm6DaE0sA6d3JrcYsEckXSUKr5vwXjcv6uhAOKgyOO9f2
         oitqGfolXwQYK/n8sS5y1oAxdvnN8744FbGhavIrSv4jCkV4kYAEqU2SyG7NBFXJoceq
         n+dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747732607; x=1748337407;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F+UlmK6vZqOhMbeIGsSzMO1lqo8dnORGNiewbO/ut+Q=;
        b=IRERK4m0Ka+8uuQIQxxzwTc13k66BXWCPx5KyWq7T4ie6uhgBH5AdBZPt3PGgmEJo/
         H5T4aUpizMQIzJoZ+jRkrULhFB28FzsCpTJQXyyKHauj9zvy89Iuj2BW+jVttfhbEf3H
         jcr+gqWkT12UinllNxSJs8jUYb6gbPptSFF76hj/CG1maPnyjHfbRTBINHEZRkLi5Ihu
         ksZnRcCNzAzRu4pm310mo4PizgHlegdIBppkHBQrODWL5ER8T3gOvW4Lzhu+a5qXLYWj
         g1OHFvluY/OK7hDLSyk4YURX9/B1G/bp9XihNI7YCinlkPJVF74X0fU77Au2+3wZurkp
         M1AA==
X-Forwarded-Encrypted: i=1; AJvYcCUJDr4Mm0U50upESbNpAsxiZTUY+RXZAso8zXfbfx5/yCazw/L5BYQHfr0QjS9gm7VSqfufYhBUfgIrL0I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5azD+EryBX7xOlX36tvROhOes5XVw0IQm9qJrDlhljAp1oVeg
	3YWQZwiOUVY9z4wbKUW5PuktTZGwrq8ok9lgV7lUK9HBQG4hAqNJ7T70iIHYV0t+SZA=
X-Gm-Gg: ASbGncv4hgwx7ibuAoAxZ/mpbW4FDhmDdEsbkd7wI6tHaSwH3iFNxO7K3aI4AnHggkX
	QgA1YCsb5rNIlzzRRBOr7MeJ/0vZYcwzQAOPBuRaGRCMtZAouSZI0C5Sgtg63vMzOgD1xVxERvT
	5K941HVB4pR260baPx+2TGxWDnZg5ZZe5KVpP0V6PsrDgWBuKsbM5DYTeWodjfzZ6wFH3d5OD1I
	3Ew23SOU6/xWqajLElql/48neo2JpaTLOUyDOJkAbooVnsb7dWv1LMI544VvCNIkgaiv6uC7XyF
	sYNgaFzWqzasRqKu970u04d1u0/quMQM2LomsAlfM6mJ5jm+XEE6oXCLhGjiFp5MZGoHq431pLd
	+yU06dw==
X-Google-Smtp-Source: AGHT+IFBTX42M6MgT+YPEKzR+Cg/JR4IlFJUFy7hVnUwzKzNXPN8Tc4lBloR2D+zBVR5++kgz79fgg==
X-Received: by 2002:a5d:64eb:0:b0:3a3:6e85:a550 with SMTP id ffacd0b85a97d-3a36e85a992mr2309853f8f.5.1747732607341;
        Tue, 20 May 2025 02:16:47 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca5bd7fsm15894892f8f.38.2025.05.20.02.16.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 02:16:46 -0700 (PDT)
Message-ID: <5ee11453-bdf5-4345-a49d-2a79bf3e9063@linaro.org>
Date: Tue, 20 May 2025 11:16:45 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] media: qcom: camss: vfe: Stop spamming logs with
 version
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Johan Hovold <johan@kernel.org>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250429180828.950219-4-krzysztof.kozlowski@linaro.org>
 <aBHQejn_ksLyyUm1@hovoldconsulting.com>
 <3e34ce09-1207-4dba-bff8-38c01cad9b78@linaro.org>
 <4d942a6c-cbff-41ac-af8b-12a1ff5181aa@linaro.org>
 <883eb54a-fcaf-443c-a4d7-e1278fd43f5a@linaro.org>
 <ea9f570c-b135-4a98-91ea-ceeb2f48a0e5@linaro.org>
 <aCw09Vci12txhYj-@hovoldconsulting.com>
 <190100e7-8a59-4cf3-8434-bcb6292cacb2@linaro.org>
 <aCw78CRda6VS6ost@hovoldconsulting.com>
 <8a2f2269-d07f-42b2-ab6c-dcff30a1f431@linaro.org>
 <f4de3ab5-b40a-4d87-916b-8d1a1fb607b2@linaro.org>
 <d81de587-7452-4fa1-836e-9e30b6d63c57@linaro.org>
 <4495a6a7-7b43-4c22-a415-55b346528a7d@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <4495a6a7-7b43-4c22-a415-55b346528a7d@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20/05/2025 10:58, Bryan O'Donoghue wrote:
> On 20/05/2025 09:51, Krzysztof Kozlowski wrote:
>>           qcom-camss ac5a000.camss: VFE:0 HW Version = 1.2.2
>>           qcom-camss ac5a000.camss: VFE:1 HW Version = 1.2.2
>>           qcom-camss ac5a000.camss: VFE:2 HW Version = 1.2.2
>>           qcom-camss ac5a000.camss: VFE:3 HW Version = 1.2.2
>>           qcom-camss ac5a000.camss: VFE:4 HW Version = 1.3.0
>>           qcom-camss ac5a000.camss: VFE:5 HW Version = 1.3.0
>>           qcom-camss ac5a000.camss: VFE:6 HW Version = 1.3.0
>>           qcom-camss ac5a000.camss: VFE:7 HW Version = 1.3.0
> 
> This prints the hardware version of eight distinct hardware blocks VFE 
> index increases.
> 
> TBH I still find this useful when debugging hardware.

How? Can you respond to actual arguments repeated 5 times that this is
fixed and always known?

If this is always known, in what way this is useful?

> 
> My personal preference is to print it once on boot and skip subsequent. 
> Which I think is perfectly reasonable for DEBUG scenario.
What are you responding to? Before you said you find it useful for
knowing each block power up and down?



Best regards,
Krzysztof
