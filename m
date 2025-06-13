Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 015F824169B
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 21:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749848436; cv=none; b=hcnsLGGV7583kfwQmm85cmZ5G+/wyBof+zWtDS4JIGzFaWtuFK63VkVx/gKeh8vk6I1Uho/bgMsb6I07Eo8cVFA09qxmgxPiErNUBJVrQR1ivyTSk6QSD44ZZqwe0CoXv/6VGl7xema21rtC8K2NQktuJ4nndMKraMSlhMHAUIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749848436; c=relaxed/simple;
	bh=sMwWiyacSDvV5Tp1lolpnmezCxwjuQeCgQRuB/ycI+I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Xw3HaRk9omJ58GE12mL73lE+09SGA+IpJjjwklJXqSg0zIPFeNd/fz+tjzf7FfjZh0WqbKQyhYHgCS30YDSf3VKSTGapl7x1SLSzv0zyn7EyfQWuoIWgPVyAWkrBdL7d2x/wVhtYgnf7RQ0ZZ4cw1Qdhzj6lYSX+PDdVOSxj7Ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=S10vQ4f0; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="S10vQ4f0"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-736f1953673so713197a34.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 14:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749848432; x=1750453232; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OC4lGjpRIsFQ3PxsIGKswS7a8Sk/ulLQg+3aOcjhhnA=;
        b=S10vQ4f0F0I+vkGGawiigC2cT25hZX4QMYgiBAp3bCGHN7cQz7+qW1i3eolTFauiJ9
         bXIXb0kLqNVzcq5E1jPbfzVshLQ82Z1zuMsoqx0mUn97wySGSO1bRp4S77uKEqr0rrKm
         Fd3mVMYwxaBiTq7PcweG1xoXtWoCW/OqsFGS9WbnxjbJztenqzw1KZa09OF8Cb1zBXfD
         bkISBPZbj/x0ovxvhstYW6gt4D/jMABFQBIeHx5wr82xi0SvlJdisaJ8QshHI7iE3VkW
         WKJH5YMBtBvDtxY9FzT6YlbUorM0u1uWhP1sOsWgY5BmRocNT3zL/EXsU6hLyAHxd7BE
         ws6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749848432; x=1750453232;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OC4lGjpRIsFQ3PxsIGKswS7a8Sk/ulLQg+3aOcjhhnA=;
        b=dpKTQBwyS2SFAyK/vOW+Q0KX1CswiQRXPjt0OTZrtA15qpC5DIJJn/nILnTwIfawZE
         jauQgSsr3IEKSYiAdt5Cm6DukL6UXgjogV091Mo2gQSkXgwSVQ52B+3JB93oeCOlLK52
         PSz4Gd31Mwsv3Ul9QIsIgCx+qO3g7zLQuPP/e3ZxdrMZ3dquOqe65orKJSE5rdG1kYZR
         XbPsy1ml6TxT+xGjCggzvde5wNl3YGPoAZ+gSuxigOyKobGv3TJ62S70gh9D2zNYoOip
         6CUflW3Ppc/bj1S+Xp9CbpajL6sexG0QaGSXz2ezFEhP/KySpLPI04kOFJ74dGEXiqlh
         kW/g==
X-Forwarded-Encrypted: i=1; AJvYcCUvJBS9oIwmTJGIAG1ukQVJOSVFS7HCaWdH1N1teMMpV6tvirNHwLUJGC3tJBsONL+Rpyz8bR+ILpBPYW4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzkMJGeW0OX8R2X4mrHxnvciiw02nzw+2E2EJZqN71e1NHJrlZ0
	Wj9bIHY8V03vvkZtfzv+3sqtPm6XSKbmkkd+5NiIF8mJPycg/8Zfx2nc5cg1Rimn/eiCzux8ozG
	+IflV
X-Gm-Gg: ASbGncssYX6h4cHJk6H/OO0qdYxIynpqT2eHnyLjV9Ciyq03aTYBJ0FdH9o/LQRj6yv
	h+o+R8JUGCYIkpBaGPD27baLGn+7fRLU+iSUf81x/4Ba5H3eoKC0eV0pE4BnsatVpRZDmPv2Y6C
	iCw1M95sSGITROHxut8WKtO/XBroeC3wQ6H88YyLjb1PZ6mRbDe3N9CjRmAEhOKfFdrrzIOAkdQ
	NTm7kpsrYUaIyY4aD3d3RyZJ/K/78kUXkrbIcaeSJORm6YcKaq9hfd584SHQ8/2dalFa+Lu0S/g
	8ZkGgNemtxEQiUygiiLH+Wcf8vpzS7vtBEEgX/kNyOma0U/S4LMNzSu+WwLH3w5l9FXGXDzMBHv
	vlIKR5AtPZxNoEh3WBylmB2giAKgCB7NvfPzz
X-Google-Smtp-Source: AGHT+IEtXeO28HYPr7tm/gNlkY2Yoh25MnNBR5GISA6s3KtN+9pVdziylV4ZXeGQBQkLiZ7HAFTGYQ==
X-Received: by 2002:a05:6808:2182:b0:404:766:3129 with SMTP id 5614622812f47-40a7c17a034mr646649b6e.1.1749848431590;
        Fri, 13 Jun 2025 14:00:31 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:4647:c57:a73c:39d8? ([2600:8803:e7e4:1d00:4647:c57:a73c:39d8])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40a74172ccbsm413546b6e.29.2025.06.13.14.00.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jun 2025 14:00:31 -0700 (PDT)
Message-ID: <439f78d1-aa1f-4929-99a0-8d6bb1958912@baylibre.com>
Date: Fri, 13 Jun 2025 16:00:30 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/3] bus: ts-nbus: use gpiod_multi_set_value_cansleep
To: Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 linux-kernel@vger.kernel.org, Andy Shevchenko <andy.shevchenko@gmail.com>,
 Sebastien Bourdelin <sebastien.bourdelin@savoirfairelinux.com>
References: <20250613-gpio-set-array-helper-v5-0-273fab50cc8e@baylibre.com>
 <b0859b25-0e95-4966-a433-5757d8bd9e6a@app.fastmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <b0859b25-0e95-4966-a433-5757d8bd9e6a@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/13/25 3:37 PM, Arnd Bergmann wrote:
> On Fri, Jun 13, 2025, at 20:55, David Lechner wrote:
>> This is what remains from "gpiolib: add gpiod_multi_set_value_cansleep"
>> that didn't get applied yet for the bus subsystem. So I have changed
>> the subject line accordingly.
>>
>> Arnd,
>>
>> There was no maintainer listed in MAINTAINERS for the ts-nbus driver
>> and it looks like you have picked up patches for it in the past. Could
>> you please pick up these as well?
> 
> Sure, no problem, just a few things:
> 
> - These are all cleanups that can wait until 6.17, right?

yes

> - I see the driver has no in-tree users, and apparently never
>   were. There is a imx28-ts4600.dts file that should reference
>   it but doesn't. Do we have any indication that the driver works?
>   Added Sebastien to Cc as well for clarification.

I dropped Sebastien in v5 because the emails bounced in v4, so I
don't expect we will get a response. I'm not familiar with this
driver or related hardware myself.

> - it would help me if you can send the patches to soc@kernel.org
>   for me to pick up, as that ensures I don't forget them.
> 
>      Arnd

