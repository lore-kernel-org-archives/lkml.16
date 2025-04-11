Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AA081E89C
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 14:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744381217; cv=none; b=d5yadZz2/KiBwzANxcGSOuM5VZwhFVCnrHEu2GuP/NLYhCxvLmznuM7MrnM6yDETFply7t0ffcLAt8jhMaM3jbc3FCj2YRxpuaDXtpkwDEE9enSDrNEKsBv4KY/CeTWh8unBFMSE0n9KS4fCsOocZg/Zi/AQTnZrLTHijCfYUkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744381217; c=relaxed/simple;
	bh=JeBrqQZu0gZIi8Dm4fdfFBXgfOVcuCnDWuOPdGHdoVI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S6ibo0U6d8iLwwdzJBvILHqA0F2kdXeWxDsKfs6qpPCjUC6NlaNE5kUths1u7TFvmwEQYqS2J6KIKWni0i988A/NMJ6hrpvXmdKzdWtSmw5jFujcbkYDm4nvrwo+oMY/88Ug9BQgyghYYr1qFBKhZuQ/otVNx4cOndjhbUvOkHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=CpQndmyX; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="CpQndmyX"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-39bf44be22fso1210636f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 07:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744381212; x=1744986012; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rdBe+uF56KhkOuabVb/m7WvzCAHrcIAYgMQIeJhFnuo=;
        b=CpQndmyXHRELFTffeClv1wljG9qVOG0OvzgWGM6usKqnw9ubExB2lgPAbRprbhggoX
         0l84F7VRF/UGeuPpmQPwEiWuUM35kui4qRTuHVxKTQpGCFO7mcCiFYhG+GsGXmwkvncB
         Ctd4WWq/N8VC9r5gi1B1uew9QDC9IyeJE1ns/97+Qns9+D2eWGHEUBPGFpC6lC6JWH/D
         9njVYm35MwSt7Q0rx6lh0YDpaGcCr9YqWyJpdwtNZ9mXcIrlS7lwUNOXvjhwCu0gBa/H
         YND/0pDj15BoA8zqi+plyEWCmEV2Si4fVw/JprcTq0z9UQZL8LR+ZeiCJAvjBOEbSAD5
         Jc2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744381212; x=1744986012;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rdBe+uF56KhkOuabVb/m7WvzCAHrcIAYgMQIeJhFnuo=;
        b=fwmLXUeuqK5I/zBG6HP06hzZf0Jp0IPX6VomARk3ZzXcwZ9YhCz/btpLZnjFsF6pYa
         HCWmUJUB4YqO/nmXZMYPu1VJESmDmgetzj8PAptyxxrL9sBmQ54Z9mlmc1l7Og401S0N
         yzxTpXrwiZNpz6QqriCAkIGKTmWtAoPMkTu4D+zLsk6xCe1xg6wIjidku9x+n1WUG60F
         9txMyi/S9qkQFCuCCxLeT6NjgKv4l743SqmDxOCJ4nKXc/VKUcf6g9LApP7ySJsKcCKw
         5V7ww9zBHREN1Y7K3SWmgpoixm0A/EgWQlb9vVUO2+TolYyMyIAOuxkGmF3YoT/rilWq
         Tn5Q==
X-Forwarded-Encrypted: i=1; AJvYcCW4vDwy488DlZD4MS4xhmAH/m8uBRvX9s9uffUXcsMHnApsYFEwbz1WMS3ne/szUGFLEzi2wL9LMg3hGSs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0YjOjY8Q+QzS5QSk++5vMidDvxb5a3KwExSFRB9j3sE18CVFj
	FvyMdjo9y1VWlHtr03toIcSJbCiGkrwWtkV1mUWSMTG9nXTHQfXUFXBwIvmoj70=
X-Gm-Gg: ASbGncumiUJDnvalpRv0uOIT19IYWk3Js2C+oioMkx66Vid3py6inPwnX8lr8Sy+KD9
	pA+1RGne7q5XxilSCod5lzyOCkGCmtcQtPSjHslkWYXLfVMAfW2E9pr2tMEHRcMMmZCx9tYflFO
	lhcXey80SRvcGMbtk1oaPxJjD89z7bydU3AiZYtx9gegXdDnrfx/D/OfRo5wyCIXI/bm2eEDFUh
	/hi6oR1DbNSLIaaS4IHxBO2ZjgbAeXnGl1mBk6S6JGTs7BFWc2B9KTQ0uCWgAlBbeu+pOFF2apI
	k2x/DXNJTd/mfe7r5qMvwucfHUgcjmkc5fhIlJBOj58F4GqC66TFmdFUOofy4/s4hnOJJkHTxOU
	fHwFGM1eJug==
X-Google-Smtp-Source: AGHT+IFZ4lJFn1G3FTPM3/pefChplb5Ul1NZ2T59kDMMnV2Japyqu1iF66jX5ixamcxpq9HuXW+pSg==
X-Received: by 2002:a05:6000:1a8a:b0:391:1139:2653 with SMTP id ffacd0b85a97d-39eaaec9e98mr2481396f8f.52.1744381212408;
        Fri, 11 Apr 2025 07:20:12 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:5ee:79d0:cf9d:bb30:5951:692? ([2a01:e0a:5ee:79d0:cf9d:bb30:5951:692])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eaf43cb43sm2138998f8f.65.2025.04.11.07.20.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 07:20:12 -0700 (PDT)
Message-ID: <8ea16b0a-85aa-4ff7-8531-9eb253a9575a@baylibre.com>
Date: Fri, 11 Apr 2025 16:20:11 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] rtc: mt6397: Fix mt6357 RTC year offset handling
 for hwclock commands
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Eddie Huang <eddie.huang@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Macpaul Lin <macpaul.lin@mediatek.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250109-enable-rtc-v2-0-d7ddc3e73c57@baylibre.com>
 <20250109-enable-rtc-v2-2-d7ddc3e73c57@baylibre.com>
 <4d916221-d9ea-4e08-8d22-1be1982323ee@collabora.com>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <4d916221-d9ea-4e08-8d22-1be1982323ee@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 02/04/2025 15:03, AngeloGioacchino Del Regno wrote:
> Il 02/04/25 12:51, Alexandre Mergnat ha scritto:
>> The mt6357 RTC was failing when using the `hwclock -r --verbose` command,
>> despite reading correctly through sysfs. There is high chance for other
>> platform to be impacted by the year offset handling issue.
>>
>> The hardware RTC registers store years relative to 1968, but the driver
>> wasn't consistently applying the offset when converting between
>> hardware and Linux time representation.
>>
>> This inconsistency caused alarm rollover failures during device
>> registration, with the error "alarm rollover not handled -22" in the
>> logs, causing hwclock commands to fail.
>>
>> The ioctl interface used by the hwclock command requires proper time
>> range validation that wasn't happening with the inconsistent year
>> offsets.
>>
>> Fixes the issue by applying the year offset in all operations:
>>     - Adding (RTC_MIN_YEAR - RTC_BASE_YEAR) when reading from hardware
>>     - Subtracting the same offset when writing to hardware
>>     - Using the same logic for both regular time and alarm operations
>>
>> With these changes, the hwclock command works correctly and time
>> values are consistently handled across all interfaces.
>>
>> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
>> ---
>>   drivers/rtc/rtc-mt6397.c | 13 ++++++++-----
>>   1 file changed, 8 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/rtc/rtc-mt6397.c b/drivers/rtc/rtc-mt6397.c
>> index 692c00ff544b2..ba52e225dc8fa 100644
>> --- a/drivers/rtc/rtc-mt6397.c
>> +++ b/drivers/rtc/rtc-mt6397.c
>> @@ -77,7 +77,8 @@ static int __mtk_rtc_read_time(struct mt6397_rtc *rtc,
>>       tm->tm_mday = data[RTC_OFFSET_DOM];
>>       tm->tm_wday = data[RTC_OFFSET_DOW];
>>       tm->tm_mon = data[RTC_OFFSET_MTH] & RTC_TC_MTH_MASK;
>> -    tm->tm_year = data[RTC_OFFSET_YEAR];
>> +    /* The RTC registers store years since 1968 (hardware's base year) */
>> +    tm->tm_year = data[RTC_OFFSET_YEAR] + (RTC_MIN_YEAR - RTC_BASE_YEAR);
> 
> This patch received a NACK because of RTC_MIN_YEAR_OFFSET.
> 
> What you're doing here is avoiding to use the "RTC_MIN_YEAR_OFFSET" definition name
> but otherwise doing the very same thing that was NACKed before.

You're right sorry. In my mind, the rtc framework was working well, then I try-hard to
fix the issue in this driver... but I was wrong. :(
The RTC framework have issues so fixes should be in the framework directly. My next suggestion:
https://lore.kernel.org/r/20250109-enable-rtc-v3-0-f003e8144419@baylibre.com


-- 
Regards,
Alexandre
