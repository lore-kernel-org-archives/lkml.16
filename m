Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E2B92676CA
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 10:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744627577; cv=none; b=Ia2EDkOVoO25mC2KNC+U0jX3Y2DmNrcCCmVLvxkd9xtK3pUd8TOQFiMn4rEza1W8SkvBuuxEun8lOJNwzGRzfxRZ5fMwCY8xFh3Z3H+0GKhcZEsSRIxg+FuW2fmAPWRrmr7OGT38xPassFQkrzHQMqp9hSlp2L+4OT8ABbt1VNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744627577; c=relaxed/simple;
	bh=B7DTrBTXvAxbCk7xCnLUt+Ohx6sQFJivOn/iFkNcHxk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u5eVXKy0HEWxu212O89285YcXuLoFnAZWhBKOjuDiRHpLjrjZe/f77i/5lkVKx0CcJLQMfH0me84XXoKg8WsXbOc1NlMlw5BEC5KQ6ya+wzgP3ZYeaWF71u1kfeX4G3tXt8LK0oAFOwHgn858iRwLoVuVNKkWwWn8ndQKbbhXq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=3KVBQ6oW; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="3KVBQ6oW"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43cfe63c592so46278085e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 03:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744627573; x=1745232373; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eQeOb9Qy+K52HTOoxzaFzGj3ukur32nTu1ttrDF5hoQ=;
        b=3KVBQ6oWRY8woSAFEDskgtvRnzX+qN+VkrWxHN4LybdkhTkA5zlbfxLPtJG3+6+kZM
         7iyd9lHBG1wX0SNKZl08mtqFUPXNIVVW2kRSaSEzv9Pdce7MJ8AFWIEeBDBSNENlijOB
         FFmcmlxVfckG6m5cVRhUP5BRe6870nqoIbUDgtr6Jtd97MX1InuxEVSbdPCwxoRIkwUp
         RPWgHpFfGqUtQvT+hKft/sswCQO9Wrs7bqRUFVP6efKJvFmkl+4/OoBhfdv71VsMD6Kl
         qRCzxej1Ewbn7ZJwnMjAowJqkME2sfyQkQozjts0grgXiSLbGrg/+fPpYk4hAJzydi33
         HNWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744627573; x=1745232373;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eQeOb9Qy+K52HTOoxzaFzGj3ukur32nTu1ttrDF5hoQ=;
        b=VB2s0+XE0FCmT//VOj+Fhp1WXL/dzBYMUOJH++V3Xe88B/zMdhiAMPK9AqE9b8hKfo
         kxdaCxu6Kv0yPPrL44XcgRGUYzVl90m0dxXqAmS6kDTIlymiIBZuFgmbyeG+pgFDUJQP
         mUnZZe/vcvcl4yEv5NGEryN4VRJpMCbmas/7Jz83CoGABSpYHYzP1eoKosZ46yXBm7H0
         Hq9isJFyPrSXMYXVeJT2Q4hxsVwx1L4TNULYfNG5toCu/9ZqXqX4hiKTsyOCOAxHsvG0
         xrPg84wSBccgWh4w28bTCsHXKsCO4gZhrm8jpi9Y7XRwf82hoFrlYSJ4BuzRjTo1/jCB
         N5Qw==
X-Forwarded-Encrypted: i=1; AJvYcCVSUoZW6JtHvWF4A5T+fAZIWfr+rJ9GYkiWeizBc6M2q7X04kA5BlpD/NWVG0ewb0SZYpZTwU/2+UlwNWs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyckXNx2HYsMclyy+Ue9kKVgKqN8srx0jvmawHlwJT5wUUL8Oz/
	nhEEju6F+z9lztzQEsAFYq9xVEdzuDOz/j9OFtgkFJHFIoNilLTx/FoIgQ8jSRs=
X-Gm-Gg: ASbGncvAyKA7dQP1Bfwc8x0U1TqmJQgvPm1vME0rG/i0yvZJzKDBJpNskXBCaacggka
	3RWExv7QmuXPA4RFbeOeV7dGG3QXeFsFFrjcPIoUBm8znGQtv6UA9MtL90WHqJZe03Noh6ZHFDg
	5wcmQ2PHQ1QBj+wMBBpgnnkcqE7D4KFmjU3jU5jKJprktfXAMmRp4xQOAVJ5lcDSk8lMtXzZy14
	ydYdaiQ+w+yYXgg9rCfsmNmjwuT58qTn2O9TQ0MMpjJD3dmLXz+ESFu4YSspPcCA5ulBu18K5w2
	ERugefPgmO3F9RYVtA9Gy9Ijv+UUxbduxIXNX462rwbK7ZJqbqVekFRJvk1QH0YRQIPie+QmsNi
	aRUq3OvTxRnvu
X-Google-Smtp-Source: AGHT+IEmlVyIZCmc7s6u9Mvm5ekiBlQHJoP4+G1Yv7tVnhDgdM9pPkqdPRM+lbmSVeVP2abLwsQOOg==
X-Received: by 2002:a05:600c:a04:b0:43c:ef55:f1e8 with SMTP id 5b1f17b1804b1-43f3a93f7c6mr99598855e9.13.1744627572680;
        Mon, 14 Apr 2025 03:46:12 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:5ee:79d0:2dda:96f4:b94d:164c? ([2a01:e0a:5ee:79d0:2dda:96f4:b94d:164c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae964002sm10490898f8f.8.2025.04.14.03.46.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Apr 2025 03:46:12 -0700 (PDT)
Message-ID: <a36aa4a4-9e00-4b98-8b98-db182ee9bd80@baylibre.com>
Date: Mon, 14 Apr 2025 12:46:11 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5] rtc: Fix the RTC time comparison issues adding
 cast
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Eddie Huang <eddie.huang@mediatek.com>, Sean Wang
 <sean.wang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-rtc@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20250109-enable-rtc-v3-0-f003e8144419@baylibre.com>
 <20250109-enable-rtc-v3-3-f003e8144419@baylibre.com>
 <202504111338408af44d7b@mail.local>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <202504111338408af44d7b@mail.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/04/2025 15:38, Alexandre Belloni wrote:
> On 11/04/2025 14:35:56+0200, Alexandre Mergnat wrote:
>> The RTC subsystem was experiencing comparison issues between signed and
>> unsigned time values. When comparing time64_t variables (signed) with
>> potentially unsigned range values, incorrect results could occur leading
>> to runtime errors.
>>
>> Adds explicit type casts to time64_t for critical RTC time comparisons
>> in both class.c and interface.c files. The changes ensure proper
>> handling of negative time values during range validation and offset
>> calculations, particularly when dealing with timestamps before 1970.
>>
>> The previous implementation might incorrectly interpret negative values
>> as extremely large positive values, causing unexpected behavior in the
>> RTC hardware abstraction logic.
>>
> range_max is explicitly unsigned, casting it to a signed value will
> break drivers.

Ok, It should be fine for all drivers using range_max =
   U32_MAX
   RTC_TIMESTAMP_END_2099
   RTC_TIMESTAMP_END_9999
   (1 << 14) * 86400ULL - 1

Whereas drivers using range_max = U64_MAX going in trouble:
   rtc-goldfish.c
   rtc-ps3.c
   rtc-st-lpc.c
   rtc-sun4v.c

Is it ok for you if I fix the drivers to avoid issue with signed range_max ? Because, at the end, 
you can't keep comparison operations between signed and unsigned variable, it lead to future issues.

Otherwise, I've another working implementation which remove all comparison operation and drivers 
doesn't require to be modify.


-- 
Regards,
Alexandre
