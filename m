Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA41728DF08
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 12:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744718516; cv=none; b=YXE8S+y/0vdy9jKkK7WRSgo8A4aUIV7/qXlb4qdLxV9qRt/INGJFHBOOfEnq5CcmSH0fsXZLMRUFKJ0b1btAHz3W6xHMLS3hpk4mrbVKDbbXuvy2bgW6cbgDPn511YTNKnSv/MzCCDoE7pM3lMoWf3nZEFWbonDhotpR2s1DS/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744718516; c=relaxed/simple;
	bh=VjC0k27ho3MYgE1jSKQLnBF1fNTa+IvnpBnHM8yWMzQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HMcATN2/Kwa9BVb4yibYO2apPoD2l128sqq3NDWsCyJdDpBykkvqLGB+96F3hpirBGy2l0SfDnmwt+uT/WZPkpuxgpkzP8z2jhTh0iTeK5kHgI4O4xplebUbFXzQMsx4xGnJh87r+688OEqHkvCOWy1cniyDNN4wMGskkLjtPxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=HCxlzANL; arc=none smtp.client-ip=209.85.161.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="HCxlzANL"
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-601c469cce3so1536035eaf.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 05:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744718514; x=1745323314; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6Foy/daChVYf1n+Fzm8y6dMT9iJHRN7V1fgVt9+hTfw=;
        b=HCxlzANL7yPhAXYfCc4kUwW9X49SaPTE8Pg38laWuT9CFZyQj3S+gjtg1+o43qA6W7
         DezozXaTGSv8BTWPrfYuLPTJGx0YH3+4ZzZrHMKRmP0bKpqJmpq9J8ZqdgKpq88K2QBY
         71G6L3QI/3obhdR3B1es+t5mnWUBI/o8mRFuF2HOlRdIO7waIx7w8Cp0FFwT0BTfLuKg
         4zx7AH7V8BiiK3Sedjcv1yI+kVqRfC9IFL/xVVyvdYqgtXF551nNgvKPzMuJtZThAU59
         XPsU/E8lBBuZyvWR7gx6a1685sJHY9xB/50vQLa1onmCtzteiT5+1WSWdyKzHNg1G73y
         KhXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744718514; x=1745323314;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6Foy/daChVYf1n+Fzm8y6dMT9iJHRN7V1fgVt9+hTfw=;
        b=tlSKm3maUmWS/aWOfAx2Lr0lv5GAYKJoV4CJw6sxMubmYo3Dj6d4tH/n0IVT9LpBQk
         7nP2Tfv67NPHalbuKERpXMGzZ1p44VjGrSCf6BZIlEK7MiV/TZCro49eCxTOlTol2QNx
         /EXw/aUJGWsvFjxCqgTL7YOI1jmxgL4CiT+1IRJU7BJIfQHXina/gQ/K8iMsqsJM46IE
         grMoI+bDH8rLGj4VM6hdil8AZSpUk1fanaioRfmcgEurisM6Ln9D8A4eO5DlPip65wfB
         KwHwst+hFYbGuJjaTt4zIgmZ74Xr6C5FLGXpOIg72W7y5lV+gEl3ads5vzfMG4hDFeeJ
         k1GQ==
X-Forwarded-Encrypted: i=1; AJvYcCXof17c7DhKBahZxH95804Zu3G/A0ctafY0h86wVAAxerFlXnFwsAzdLbhxDuuvPDI6cpcBA8TWSAAo9Sw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxNYAFtANyfUZ35ZuB403nTis8QQcqM5HgQQwG+QUZqIwAwW59
	K9yEXf7MenVtIa3iLd2qhRnBUMeoluSqFb+S9If47g1a2MiplUWXtPkkuyad4ws=
X-Gm-Gg: ASbGncvHQJX/7g4yP4R3eshaKhzL9jQvdW7VraRKMDlytmOJS1uFq9/PpL1cCe+5gCQ
	IqP/FjAQFqnq/fYTdd7gsxXk9ib2SBzDwYxGIMm4bITTZG5Bdy0QjpzIij54QpRTgxdZt0l9wFS
	q2yD7zTRyzps9B6wHXp//pLRjfRaRCEAx7sHHqUM27pVxXqUgofEfe0E74GTFqZv/oY/UaFjP4z
	+BMnDVWwK2qreZxyY9iaUwMyTVLQUBDrGMXr4qLM0T5KcX6MvwYzNtAJ3EFc3Ej/ErqwG/Wijld
	/LC5lGcuw+yltJnRbeFBxOMK1a98J92UWMXSV8lHjhOQJ74bzzknP2RgLthrK1JseFXboYThII1
	dgrp2QcHQaCdg3QQ=
X-Google-Smtp-Source: AGHT+IG1ZefJtDz6AYlU+I6NKPPOmbM1gYq5/4K9M9+cYhFx0WPocorybtDxzIDHpDEm4xA8K20OCQ==
X-Received: by 2002:a05:6820:1392:b0:5fe:9edb:eafe with SMTP id 006d021491bc7-6046f59b8a9mr8979670eaf.5.1744718513333;
        Tue, 15 Apr 2025 05:01:53 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6045f522cfdsm2299991eaf.9.2025.04.15.05.01.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 05:01:52 -0700 (PDT)
Message-ID: <f856f692-03c6-4064-bc7c-ad565fed6d2f@riscstar.com>
Date: Tue, 15 Apr 2025 07:01:50 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/7] clk: spacemit: define new syscons with only resets
To: Philipp Zabel <p.zabel@pengutronix.de>, mturquette@baylibre.com,
 sboyd@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: dlan@gentoo.org, heylenay@4d2.org, guodong@riscstar.com,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 spacemit@lists.linux.dev, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250414191715.2264758-1-elder@riscstar.com>
 <20250414191715.2264758-7-elder@riscstar.com>
 <eee41968ecb0c16da214819b9a43e9dd881fcf13.camel@pengutronix.de>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <eee41968ecb0c16da214819b9a43e9dd881fcf13.camel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/15/25 3:22 AM, Philipp Zabel wrote:
>> +static const struct ccu_reset_data apbc2_reset_data[] = {
>> +	[RESET_APBC2_UART1]	= RESET_DATA(APBC2_UART1_CLK_RST, BIT(2), (0)),
>> +	[RESET_APBC2_SSP2]	= RESET_DATA(APBC2_SSP2_CLK_RST, BIT(2), (0)),
>> +	[RESET_APBC2_TWSI3]	= RESET_DATA(APBC2_TWSI3_CLK_RST, BIT(2), (0)),
>> +	[RESET_APBC2_RTC]	= RESET_DATA(APBC2_RTC_CLK_RST,	BIT(2), (0)),
>> +	[RESET_APBC2_TIMERS0]	= RESET_DATA(APBC2_TIMERS0_CLK_RST, BIT(2), (0)),
>> +	[RESET_APBC2_KPC]	= RESET_DATA(APBC2_KPC_CLK_RST,	BIT(2), (0)),
>> +	[RESET_APBC2_GPIO]	= RESET_DATA(APBC2_GPIO_CLK_RST, BIT(2), (0)),
> Superfluous parentheses.

Wow, this is something I don't normally do.  I had to check to see if
I managed to drop "BIT" or something (I did not).  Anyway, I'll fix
this in the next revision.  Thanks.

					-Alex
