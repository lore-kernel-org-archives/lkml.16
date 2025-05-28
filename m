Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 058B223CB
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 13:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748438263; cv=none; b=Uck40K7VD51YhEGBojJPbLvja9oYeKlgBxbF+PTChK4wggbO2LEvBdTml8t3eRESIJaXuiZIAN/pwYhYWdM6B+dlkW0HC+4pHehGSR8opv9AmHq2qkqK16zRweTkUQYUtKlOxQYmpbdtErqEVNXEhfAw6daypZ/zPf7gAFXWZBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748438263; c=relaxed/simple;
	bh=+8JeJ0WuWhzvAWlP/eWg/yGnQ5jEOIHa1Vy8lkmwQAI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jhJ8+TV5efEY5Z1LfTE7nafQZUcbfHqw/CkuUqPlTo+43ZgytXQcqFDiVN/uG9tkVBlBRUjm6l4Z2ilzhfR8RYs0Ko1qsJwhodNQGiewnGdb8AWUqdvc3SFyzxAxqz6gwOwIIgVBYGRVWJFbWg5TpSbUpvsjRBhTYEGVMOPoZ0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xDjHDgkj; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xDjHDgkj"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3a4c4e6a0ccso3367504f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 06:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748438260; x=1749043060; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=etuOIVUU4x5SySaTzeLNRaqDZ3hUnhSaZPYuWZNFHOo=;
        b=xDjHDgkjiAQIndoaIzHn1Uc+K0cJAoizjAHQicY87NOfQD5c0YoHvu2tbGQdjCruNx
         7juAQuxEPoyLd5uIIDL50t1opayQZ0DtZ66rjInnvEqIAIEQoGY0124sRqZVh/cwfdMv
         1mUS5lWPJrrfAiBIBaOKCjq3crMOSgV8Sl65fmW4jabg6Grk40B3m0cOvA7Ox8AL/8j1
         FRnuOdWsBfMooh1W2E5LlShZsquGXCuxCw4j+LWxBx1qtA+zsGzcKaeEfcezWW7Vzhpj
         FSvM8A5AiuVALahUlTILjAC1SEq+rwfKfQ12arGDcIqsNGlb/g4eQEb6U5nKraJQPQXE
         oQnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748438260; x=1749043060;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=etuOIVUU4x5SySaTzeLNRaqDZ3hUnhSaZPYuWZNFHOo=;
        b=Om3MpgdvZxtw6Z0svc8ez/mSz97KT9FGROMo/g9dyhPZIIDmI2TROSGR7pGOrreiGe
         yqCqExwXt+ycXl84DxVRRBF3q7BnU1l24yg3S9G0nmfK+r/oBRWb9x/biPaMmBZ+3wOT
         WC/fyjHo2rVcX9ALAteoiw+yAnLqFvgDVafvt20mFYJhV2xSTPnSgPoOE9RFvwerYaaD
         OL1jN5iSu7DZBfoUS4P9nwa7S9j4cqps0GbT7UsTK7mBdmWh+M9BLT7rg4nczpNSZGHC
         UUWm8y4Jc6FF+fVTQ0pVKNcOhtTULRwdjut/86NxwisAm0wQhYlrUBZtmSb/GHmZqcBj
         XN6A==
X-Forwarded-Encrypted: i=1; AJvYcCWXTz0K+7aCaW4by36yCnISiDUJGMcuW0CUvZfkEId6XO83lQg9yfY1tWXjaahoS0qMVT3XXOwCGka1+No=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHaP4Zm5ZNgnsJOquwUpez9Psmj7/dEqqBKNI3SJdNMxbvd+kV
	pDArCzq9m79xz73ePQnl5bhHCy1l90lCql+wROY5JDxn7rcrEN2HLcAQ8ipM4Gw9PVA=
X-Gm-Gg: ASbGncsP/PHv795AeNxnJ1Un9yn/wCJUchiedlJE9VaBbpR52ECx5n8mqq/8gntXex1
	s6ICurLqvQ0uD0ZZgGG8JoGd1e2Ee0dTi9X/lOou0TkcGDYHoa+GSkFXc80/uHX7GjsmR2+MTWj
	sMjLqzp/PNsnbJOfWA7VJCtrDWeEvo3oo5YwOiAsvT2lZsYDyS7m0rplo45zdnqK/KYzjVwzuja
	o17J7RVl9/MQvceeAxHGHZr00lrTJ+jN8T72smzRvs81GOhbHbqWo6q5yjvnxUwWIOCpyEvTuYN
	C0NsVQSDfSd/38hC24CYj3COOqEo9eebGT9KLr6aWMOGOZjt+3e+6kioFTfdDpfuGAOqVf4f1CX
	6zv9nX5ZlcSmkg5T0Eg0h9m5ZWA==
X-Google-Smtp-Source: AGHT+IF6k9N6RDrHL9CWqquYKN5znltPLRFbYrRqu24xJR1k0tX7fObXTd2EmsKCVpIINagQQXmgGQ==
X-Received: by 2002:a05:6000:4308:b0:3a4:ed1e:405b with SMTP id ffacd0b85a97d-3a4ed1e40c4mr749522f8f.46.1748438260235;
        Wed, 28 May 2025 06:17:40 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a4eac6ed4dsm1509868f8f.17.2025.05.28.06.17.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 May 2025 06:17:39 -0700 (PDT)
Message-ID: <a6d64948-e713-4a50-9d4e-6de02a550d06@linaro.org>
Date: Wed, 28 May 2025 15:17:38 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/2] Add the NXP S32 Watchdog
To: Guenter Roeck <linux@roeck-us.net>, wim@linux-watchdog.org
Cc: linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
 S32@nxp.com, ghennadi.procopciuc@nxp.com, thomas.fossati@linaro.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org, alexandru-catalin.ionita@nxp.com
References: <20250410082616.1855860-1-daniel.lezcano@linaro.org>
 <650c336b-a698-42f5-ad59-7dcdf24667f4@linaro.org>
 <2a8e1ae7-2a8a-4cd8-b699-c010019c766e@roeck-us.net>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <2a8e1ae7-2a8a-4cd8-b699-c010019c766e@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Guenter, Wim,

On 14/05/2025 20:09, Guenter Roeck wrote:

[ ... ]

> AFAICS the patches do have Reviewed-by: tags, so this is just waiting 
> for Wim
> to pick it up.

I fetched the watchdog tree and saw it was updated from May 23th but I 
don't see this watchdog series.

Is it possible to give a status about it ?

Thanks

   -- Daniel


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
