Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4349B2D191D
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 13:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745932772; cv=none; b=LrDcM5SXHbzKjMWNNSY32rEB0OBgYdzJRsSVdn6Hk/2EnGAi7f3xH+2ht5TJ8L8p0gReXnAvAaMgalZiMqLJ4dMWW5Nx9U49cV4hHCIlrpTNYuNkHP1zI+BOxLC/CNmtxDCmzrgoyn8tsM08HtmLNWaZU5fWlnqeY8LvrTkYlyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745932772; c=relaxed/simple;
	bh=XePYFUZFOmGANaCFVWnQbmv+MH6vntg+h8qSytSplf8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ggP243C1V9uSIcUbc+U/uUdHloGCuvOkBEvPrSU2w//h1sPVqcyX/vKkuHzXX5E1RD1fhDnqjIhhVJAJcCNvo7KxbtKhIC5FK09907cOuOWYKjNRAHO6DmYZNF4oc6YjHwensUfXu/osvFRYUQlxGiCu6ssp+myHcGTzVTJsxNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MfLos37w; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MfLos37w"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43cfe574976so41658245e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 06:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745932768; x=1746537568; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qSBA2FVneKH15/yfDJmf3I99yTke3ZzCIPR7/+gqo2M=;
        b=MfLos37wyS3I5VBUmgD+VaBnXnH40VtAmbdJhaBIIdWhc+ox6RjTxT4fwk0xmxeNDL
         chdR52l/LX+Tikd12zB/oeMvtJFRSqgsjL2rnPLFe2ycgLao2rcElTPNWDp48roq/XaY
         NewmLaQ+Xx1BiWDYzgxK/pe2kzaBY+tKA2fEiYD/PMTajJ6xS/ZwXtrUc/R0W+s+SYGz
         jjA2LvB/SkcqpWvqY6QHCSi5Ulh87lRROAteFBAAd/s7fo3yuxIMp/p8MeqFfEYSmoZB
         58Bg7gZFOdMD8/Pv+RNxP+LvDE4QLM3p51DYw1HVESa2LmXbpEtYXms/ZYw46gn5/uvt
         bJIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745932768; x=1746537568;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qSBA2FVneKH15/yfDJmf3I99yTke3ZzCIPR7/+gqo2M=;
        b=HAZ9y6sZe5YuQzS6E8dsxh/9T15G0Uh4iiUeyt9hDMZ848kcADoCNHsy2uhHZJouxU
         y5oHyHoN+pWqkCUpBY/SBKdDFKHBOGD0twV3xS/7eAXIWFMxS845ztEYiuHHChqM0Mmv
         +kY9AGv/SmWW9dxOUa4UkkiaO60Ck69c16so5nVAzaLMkSZENQlEj4BJDt6iL3q941wk
         GW84jmVipNRRDty22Y8A0bGF2CGN8P3ym5Br3jnG4vlDtQQVmQkoTeLo5vMJjchQRo1W
         yE93vh2n3U2Rw6U41NUdCwz5MnrFAmlrhScOKpQmI4gRp7R0NY4BX2hOUZgakLcgI7SI
         N2vA==
X-Forwarded-Encrypted: i=1; AJvYcCVBXb4gzIno4v/kzN+lgj1XL0+7mBo8Q8I+k68Dp7Y8jAKNF5qG+pC7Ovfl3rYydWQX8Fk8c01cSIQntDQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/9qoBI2iOzceJTZfItBzKVcaDtMxB6mxezk+vhBpOp76UqyZ6
	/hZn6HEX2VAGahpyEPDAwk90bZFvFYef/kjX4fiP9TBaykE9OVp7woZEaqaSgE4=
X-Gm-Gg: ASbGncuHhY0u174l7oN9LFYUewm5tufowbF1maipstygvaBLH363lZ3BNcjx/pYc9l6
	5bWddqYJJFvcx8tgLNgU5A+mnwLNkyElcMOpPHFaBf4NqM621WMZyHF2q1n1BElqRSzqOWXZGFd
	AXwU/dRNw/rU9zrkk6QMkGRH1IbZXSknm6A2Bm8oJws9V2L7m+PZ+eFKE88e+QWEWEStpFB2f6o
	k82r1AtPqOn4wrKPRjdu5Ei3nGP3grMLlkoQN4xnndGBCsDkMBqr3Y9P+0V+UgFQpCtr091quTY
	wTZUVOzDvBakXUkhH0SlHW9B8W05Mnn+95Ogzamv8dbNKxX0oYGRwfbgpnSl3/dnMhANKJTpz8m
	kgm8w
X-Google-Smtp-Source: AGHT+IHAYw0/lwXakKmjaC+/n7Ew4ZuEbD1KGM7D3NN5C8KbtKmvLbCZ8/H5NgImD03ODoBSykVgJw==
X-Received: by 2002:a05:600c:4ece:b0:43d:fa58:81d4 with SMTP id 5b1f17b1804b1-441ac91d66dmr27017825e9.33.1745932768416;
        Tue, 29 Apr 2025 06:19:28 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-440a530324dsm154990655e9.10.2025.04.29.06.19.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 06:19:26 -0700 (PDT)
Message-ID: <0fc89d71-6510-4ca9-a789-290e1818798c@linaro.org>
Date: Tue, 29 Apr 2025 15:19:25 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] clocksource/drivers/timer-tegra186: add
 WDIOC_GETTIMELEFT support
To: Jon Hunter <jonathanh@nvidia.com>, Robert Lin <robelin@nvidia.com>
Cc: thierry.reding@gmail.com, tglx@linutronix.de, pohsuns@nvidia.com,
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, sumitg@nvidia.com
References: <20250421100821.2907217-1-robelin@nvidia.com>
 <20250421100821.2907217-2-robelin@nvidia.com>
 <aBCU5vec0XMX5VRz@mai.linaro.org>
 <fbb3a1b3-3949-402a-b51c-f5446a392e83@nvidia.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <fbb3a1b3-3949-402a-b51c-f5446a392e83@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 29/04/2025 11:15, Jon Hunter wrote:
> Hi Daniel,
> 
> On 29/04/2025 09:59, Daniel Lezcano wrote:
>> On Mon, Apr 21, 2025 at 06:08:19PM +0800, Robert Lin wrote:
>>> From: Pohsun Su <pohsuns@nvidia.com>
>>>
>>> This change adds support for WDIOC_GETTIMELEFT so userspace
>>> programs can get the number of seconds before system reset by
>>> the watchdog timer via ioctl.
>>>
>>> Signed-off-by: Pohsun Su <pohsuns@nvidia.com>
>>> Signed-off-by: Robert Lin <robelin@nvidia.com>
>>> ---
>>
>> Hi Robert,
>>
>> I realize that this driver should be split in two and the watchdog 
>> part go
>> under drivers/watchdog.
> 
> Are there any other examples you know of where the timer is split in 
> this way? It is not clear to me how you propose we do this?

Just keep the clocksource and move the watchdog code (everything related 
to the watchdog_ops) to a new driver under drivers/watchdog

BTW, there are three clocksources with the same rating, what is the 
point of having them supported ?

Is it not the architected clocksource enough ?

May be the clocksource can be removed and the driver remains a pure 
watchdog driver ?

> BTW, for this series, I just want to get these updates merged. Any other 
> re-factoring we can handle later.
> 
> Cheers!
> Jon
> 


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
