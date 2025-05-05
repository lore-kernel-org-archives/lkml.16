Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76C9A17A314
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 08:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746434227; cv=none; b=ekurBksEk1KmEc4mQyRUvsndy1ehaRwcZy9/mn7gjoRhQz5pg6PEnR3U2CBIG7GppZOTGxeG6y+85wwd+klgY4OJW004brmWsMwHtUZ1qC0c7SIeKhTVEi5AKyE9H9gpYqI+nsachgfzGH0k+K6aU7Tt3eJIud8wcd9zrR/eAAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746434227; c=relaxed/simple;
	bh=baMJAkG27VqkKqYHwlOmJyskaqcTMSM4nApt/kG2w+c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CDvR6PLLjsV9zski4XXoK6t3BN+syDT6+kSjtlRIDkn33UozIMBdU97gtFvAy3Jf/dKqzmmveAD5jd2um6NGcW1Ay5ZeKe4WwCNdyB5+75MQqsMZ8sD3qq/ABQ1X6eJSZBqbeIJGsUjncWkKQa+AmthpQYtQ8i8Y41LIGumr9XE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FWkvI79y; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FWkvI79y"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-39149bccb69so3156281f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 01:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746434224; x=1747039024; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sN+l0bbqOaNHyCMlUBuryfQsJX8dUCuFeTIyy+iGYGk=;
        b=FWkvI79yGA3IvrKzZbSAClqfgYy364yDHti6bPs40vVJPeNO6yp9E4Q8ExLLtSD7La
         pxNY+EJM0Xqr7jC2Vx1i2pP8Dquhwu+PyZThhMgEUv81i7CRzxXQcwoil1jtQBTHdSB4
         0OVdSkdSstHeZRbVyphBQXrarBHtdcS51f9iGjUTROm63K0hWhWZsKyfUPtTxo5NJMHg
         e5FncJdGGWkZSJI9cDzI2zrs2bYP1t1n+/F+9RZwhG8n8IIxDHrgi1evcogBKknz4ODq
         2xydI02Jlf0NvL5tyg/RAKj+YScCi2pwmZO2Q0kmCU6CHV3GIqWAvychO6pZAn1qaLTl
         7cYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746434224; x=1747039024;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sN+l0bbqOaNHyCMlUBuryfQsJX8dUCuFeTIyy+iGYGk=;
        b=GPczTqXY6rT86Laz0H4IxF+9zVQbXLH81Cg0fgw4xnt/RGeGC9ev9F4FhL8AlBCi45
         xZrKWqvA2DQMxfePRSOTfXfo1ERO3rUgGAGaoxHHmEFhLAhG1YMb0C/ZlpRwL0OT/5He
         EEA7vGAoUZpXWGePZRmVILl38aurHA2qPvznUGk9dyMv00eaJL7Qtka/B4DhVVGRSrex
         f9coP3Mh05mZVrA9An5UK+XVbMhDKFHqTshQ8DD1McVL6tFhl8tV1kAp+AFdB6f7oFwt
         nopVVwg0woAfs8Tnd2LRyB3V2QkJ7knJP/P1yqs+7fSUdhItk47quwx6/6LQUUs18Q+Z
         Z6BA==
X-Forwarded-Encrypted: i=1; AJvYcCWWfK0j9ivAlkpsbFk0j5W2xxCYGnkubx5uCclOcsXsIHZYxUwsGnKoghiNglbBnBElhRCqjk277WV3Czw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3ztq5RJoUidR8+8ty8wMDqYTG4bnk2vaSWdQqwm6tyAADy40p
	Nop0DogJ05y1/Unvp58CcKQ3k0VL4EPEaB8dG5Nw6d5I8eWqHOfCugYdZmM0708=
X-Gm-Gg: ASbGncv60107pXccYKY29hhDCdu98OCySVhqzhnVFRCg2GFD0SXiptcxn3aC8KQfxXj
	e784fl6qJtJA19r7+sFbuZrZqYFjRaiRIXllxOIznzHg4F/lVxrro18DweqmBwg0FRfqE0JLKHQ
	aJ2AuYgI27caf/ir6eL0ueH+fbnIi5XpRxQMqwARG3g13rpYwsYXFn/5ptMJjQQRbs5Z6bjtVe7
	YcyIb8GqvN2Ug4uoxtPanntySz2cii7owbQIyVCxdSdjS08nwLlwlpImlrfSFiKI4hZfXobRwjz
	h7970IWYZjNOcZP2Gfwjk8iOJ5zHECLs6VfV9n+4Qzu+gYcnhofPksJ0sicQf/qf0ppcWxO/fg2
	z4l1p
X-Google-Smtp-Source: AGHT+IHx5gQaW6NrJpXzB2ZmMAA8JB51I+tVwTpFwtk86FyblrmU5GquHCP1zT3M4G1bf+Egj+xPsA==
X-Received: by 2002:a05:6000:2910:b0:39f:175b:a68d with SMTP id ffacd0b85a97d-3a09cea687cmr5975453f8f.11.1746434223826;
        Mon, 05 May 2025 01:37:03 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a099ae3356sm9511430f8f.29.2025.05.05.01.37.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 May 2025 01:37:03 -0700 (PDT)
Message-ID: <12201db3-7c94-4430-964d-0fe349ad6390@linaro.org>
Date: Mon, 5 May 2025 10:37:02 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/3] clocksource/drivers/timer-tegra186: add
 WDIOC_GETTIMELEFT support
To: Robert Lin <robelin@nvidia.com>, Jon Hunter <jonathanh@nvidia.com>
Cc: "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 "tglx@linutronix.de" <tglx@linutronix.de>, Pohsun Su <pohsuns@nvidia.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 Sumit Gupta <sumitg@nvidia.com>
References: <20250502043727.396896-1-robelin@nvidia.com>
 <20250502043727.396896-2-robelin@nvidia.com>
 <aBSOJTlQUUnFIEVr@mai.linaro.org>
 <af0e0ab4-89d5-4f77-86c7-90d2bc3e13dd@nvidia.com>
 <aBSjyZJ0__ctBa-4@mai.linaro.org>
 <5824d505-0a42-40cc-84ec-814f0bbfb79f@nvidia.com>
 <93f063fa-0012-4018-8c37-a2bfa623d2bf@linaro.org>
 <a6a45384-18b4-4500-8b8e-8cdd8df5ac1f@nvidia.com>
 <DS0PR12MB6416E7BF479EF8C67BAC6147D98E2@DS0PR12MB6416.namprd12.prod.outlook.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <DS0PR12MB6416E7BF479EF8C67BAC6147D98E2@DS0PR12MB6416.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 05/05/2025 07:34, Robert Lin wrote:

[ ... ]

>>>> Yes so WARN sounds appropriate. It should never happen. I
>>>> don't see the issue.
>>> 
>>> The issue is if there is an userspace application reading the
>>> ioctl and or the sysfs, then the warning will be emitted each
>>> time if the never- happen condition exists. Preferably replace
>>> the WARN_ON by pr_warn_once() as suggested if the bug must be
>>> reported.
>> 
>> Sounds a bit funny 'if the never-happen condition exists' :-)
>> 
>> However, I will be fine with WARN_ON_ONCE(). I think that this
>> warrants more of a large WARN splat than pr_warn() because it
>> should never happen.
>> 
> 
> I believe the two WARN_ON I used here are the "this-should-never-
> happen" situations. In my opinion, we are good to keep. But I am
> also good with WARN_ON_ONCE for compromise. I wonder if Daniel is
> good with this then I can fix them.

I'm fine with this


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
