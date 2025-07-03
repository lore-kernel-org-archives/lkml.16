Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E699A239086
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 12:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751545884; cv=none; b=cQug36m/L/enl9LLbwRTiYGO8+qB2mVPEwC4aQr+7FZboKj+K9DKk5eKHvBLfR7Rjs1vKjc2qOUdRMaSWfpWQR3ZSoqpgXcX9+R0CjMNy4ORCiPjo5ll8q0Et5wOBoNQtYNPcDhspq6qijx2BNuee88wyn8YsEgfrRdBQOfep4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751545884; c=relaxed/simple;
	bh=wHZMwGeMu6Gz0/oJi7Mjhcaw0i0kH9KL/sFnw9COLd4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SJKzIZcQF6sMeVRrDpvAPS8Q3TKJVHpKc1sh9KTsXXEQdnRXiygOi6vy2XsBDOfGOlNYKV4lJswK0AMqQ0hSYC6KBDtoet9t46swSDYIE4xSEJLcdj5zMvmUbdxVlHIVU1eMOFyBBoJzbzJ41PRes3fGEIy7m/wg4/xyRmMqx6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=TbuuM7o8; arc=none smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="TbuuM7o8"
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-73afbe1494fso3159093a34.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 05:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751545882; x=1752150682; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ipYIW9G7F5Zd0SdovUCWb1HtdZX8BUKUwoIo3O9WcdI=;
        b=TbuuM7o8IjQqKXzzdjqcU1yCHyI0EC6AQ7/26SF5p6qOAqRp5v1irr86sMuRIxI84n
         L+m8+5Xd385r/Wqvxl20eO3uJSxcs8CMXaFVRM/W8GZwRU3XA4V5Hffrkje5Px4UT1Lk
         vcKJFyL4OSeVXbzGDOh5VB7Y1W/rqeLH/+wzRmCezijJ4NBGkBKT+eHjs9RPGkjgys75
         m8pYi0EqqMZWFPyhLCJE0Alb/rtPL1JikauwpRg7NFjsSfFWw2rqdudXH9kBMdj4c3+d
         lJtSq7IAuwQGkjHPSVqxDyXQs7K+1r+cUM3jW4RncIm/EEgBj/VDRph6EalawM9eEFoz
         mRdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751545882; x=1752150682;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ipYIW9G7F5Zd0SdovUCWb1HtdZX8BUKUwoIo3O9WcdI=;
        b=oYaCUOckszz9Hm0n7k8er8vA4EPXsvO9NLko8WrExfORgHGxW6BG8/zvgw2CljtMeW
         zX++AoE0aL4ZMclvdtBPGaegvhh9Ag6YFsunAaF6B2mgEwdJeqR+NRtYHv93Bt5zv/gq
         W+zuuweWdn2csuCNZDIicj1A+ZmczFkbTSUKXYBQ2MSeMUjSEGoib3TQpCxkvJ1rV8RQ
         MJevri2lssRqyhCiY1LwP37sY31zvsv/LYzaL293s2jvnebLeEosPDxYHi0F2mHYWoHH
         kPMQhmZoZy6PTdy1ObgELHfMKKlJzlVwswfRowOQMg1JT9v4AIghHPlNkGrGm9Drie7+
         a0WQ==
X-Forwarded-Encrypted: i=1; AJvYcCXys6sb4NLYPqStO0D5DXGB9uAFj+zP/46X4fBwGfLWrkfPxktBvBknF7vsSJSqh/QBYxuCJlRbVbNwF2w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyla/0tQuymHTsGdbjjvUXvog9TkCKnsTOsyp/iJqStwu5DQJmD
	ekA8qMJrOcm0AdqVUEA6fUMIqBYC3ifoVhEjdX9D/5TvF1oJXlKmyWYJc1hw/9eTh0s=
X-Gm-Gg: ASbGnctogSsZJPe5md60m8S8g9AQmArx2cdYR49wRsJmTRQznwC0PcyEDo5q34Bx2Rk
	m1ttf19BwHx0GaHFNMOmMLWXV9rV0weQCXudUC63I+ElENUyT0YH3kG2SXqTd9vP0YqBvbC7khc
	EYr5ZnLpAIP5A8UsnT6PXcFqThx8x6iMYazMHiPcplwmam6SXaDoF9wVG+gdY61ltSg2HUV45lZ
	Q6Io6j05XrMwrAu8byEg1at818hPvuiSq7eNnN0UdR1HPbOzMznxrmTpSde4Y8m4nbAfQYFeuTS
	p2KO7nEDO8caoNe4kc2YJVZpnilGc4Xo+dMEC/t6tARB8wHc553T0QIhn2mIuojeljUiWDq2FaR
	yho+nHSnBQ1EOZOqkOYP+cT7QMc6L8VgIh8dKH3ou8LUll7PhyA==
X-Google-Smtp-Source: AGHT+IGAV+iR0RWrusJP0JVuvfH1MLIdhFsUGmJ0+FB8CDbzG398OjLBHoNJniF6BAI2mKMnhGKgvA==
X-Received: by 2002:a05:6808:4893:b0:40b:91f9:7d03 with SMTP id 5614622812f47-40b91f9950dmr3962528b6e.31.1751545882015;
        Thu, 03 Jul 2025 05:31:22 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:5c00:24f0:997b:5458? ([2600:8803:e7e4:1d00:5c00:24f0:997b:5458])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40b32289870sm2947065b6e.8.2025.07.03.05.31.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Jul 2025 05:31:20 -0700 (PDT)
Message-ID: <5a8d944d-a6db-4513-a282-e574d228f9c3@baylibre.com>
Date: Thu, 3 Jul 2025 07:31:19 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iio: st_lsm6dsx: Replace scnprintf with sysfs_emit
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Andy Shevchenko <andriy.shevchenko@intel.com>,
 Akshay Bansod <akbansd@gmail.com>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250702135855.59955-1-akbansd@gmail.com>
 <f96b68a5-d750-45f0-8cdd-9761b5daca1d@baylibre.com>
 <aGVIcBLgXZj_YR7B@smile.fi.intel.com>
 <e474db53-1b52-48b0-9253-2f62a3861bb4@baylibre.com>
 <20250702163342.00003c66@huawei.com>
 <3361875b-712e-423f-88ed-baf41af5ad22@baylibre.com>
 <aGZHyr5zSRLp1m2p@surfacebook.localdomain>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <aGZHyr5zSRLp1m2p@surfacebook.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/3/25 4:05 AM, Andy Shevchenko wrote:
> Wed, Jul 02, 2025 at 10:53:31AM -0500, David Lechner kirjoitti:
>> On 7/2/25 10:33 AM, Jonathan Cameron wrote:
>>> On Wed, 2 Jul 2025 10:04:23 -0500
>>> David Lechner <dlechner@baylibre.com> wrote:
>>>> On 7/2/25 9:55 AM, Andy Shevchenko wrote:
>>>>> On Wed, Jul 02, 2025 at 09:16:51AM -0500, David Lechner wrote:  
>>>>>> On 7/2/25 8:58 AM, Akshay Bansod wrote:  
> 
> ...
> 
>>>>>>> +		len += sysfs_emit_at(buf, len, "%d.%03d ",
>>>>>>>  				 odr_table->odr_avl[i].milli_hz / 1000,
>>>>>>>  				 odr_table->odr_avl[i].milli_hz % 1000);  
>>>>>>
>>>>>> Let's keep checkpatch happy and change the indent of the wrapped lines to
>>>>>> line up with ( since the ( moved.  
>>>>>
>>>>> While I see the point, wouldn't be better to have 1000 replaced with MILLI
>>>>> at the same time?
>>>>
>>>> For anything with 3 zeros, I don't consider MILLI better (or worse).
>>>> Science shows that the average human can easily see 3 or 4 things
>>>> without having to count them [1]. So it is only when we start getting
>>>> more 0s than that is when I think we should be picky about using macros
>>>> instead.
>>>>
>>>> And in this particular case, we are converting milli to micro so `1000`
>>>> should be replaced by `(MICRO / MILLI)` if we are going to do that.
>>> No we aren't.
>>>
>>> This one is converting from milli_hz to hz + sticking to milli for the decimal
>>> part.
>>>
>>> Lots of other IIO cases where you would have been right, but I think not here.
>>
>> Oops. The %03d instead of %06d should have given it away!
> 
> I'm not sure I got your comment. The '3' vs. '6' will just define
> the minimum amount of printed digits, it does *not* limit the upper
> numbers anyhow (it's limited by the 'd', which is (INT_MIN .. INT_MAX).

It is after the decimal point in the printed string, so 3 digits
after a decimal point is going to be MILLI units. And the % 1000
ensures that we would never get more than 3 digits there.

> 
> 
>>>> [1]: https://www.scientificamerican.com/article/your-brain-finds-it-easy-to-size-up-four-objects-but-not-five-heres-why/
> 

