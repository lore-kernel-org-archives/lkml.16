Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37308524F
	for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 19:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747595393; cv=none; b=OhVg8FwTe3135tSUFkuxMVnlJh24ZFP4CFG6LPW4vPjr3pUIlh7bGguDwNnI0XiG/BsImImdho/PRFB/Dc1NV33o95uZIp5OsYgQfeJW0Nop/nS/3wB/WzUohJBCwRdbgk4SjubivywIX7ow0HbYfCVop4KJAm2tdKbM1lSPbcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747595393; c=relaxed/simple;
	bh=Y0Gz4JP/Ghm66Q9z4iTxufaTJ8gB2t4BOk1a7f6fv1c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QlSuBpbhIqMlVOLb2x148j81dv5exp167TCfenPa7AtwzEGUhLO5MjOgG8ImOfrRN6I04zyx8o2wqa7KoZ1H/WdwsYk/7I8zRMk9ZCUsR/wAC31X+85qAqP826PoinV6ZGbVEdVERIdttc85jbjWo5GbUFN+eHCgWd4/eyW2Zi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L8i8QhjR; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L8i8QhjR"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2320d06b728so6890635ad.1
        for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 12:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747595391; x=1748200191; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=PTEgaa8AfTn9SY7IS6TOk5GiogYDzLZmF/+yhRD61cE=;
        b=L8i8QhjR7wnZht35XnokoRS1duDdPi+e7R57zl4GGsRRa9WLWQKW0PTUuqdsFaEmi6
         VAVLhdR/PUIjVVGiQiJIONVIu4MfC3e4dTkB8BL4QuC07oSQb+tSaMQ5CDRTWWDptr40
         YHIiiLxCfX6pnUl+v/jIEJd3Am6d2Ec57THkwEl2UOuG3xNjwGnNO8BjyxyB5/ObERWz
         iUA3mTTriWXOlR0nH9AEm3vRuGrqiUYhXfSZrvTilpCWrp4ddFma1lZIWgwYYkJQRAKM
         enVVmP+8UK6ZvzNfCtOB8gWJUGoECC+pxJnXkFfA02d5yfhsZPQOBnjL7SvwaQ/wxFFL
         Im4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747595391; x=1748200191;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PTEgaa8AfTn9SY7IS6TOk5GiogYDzLZmF/+yhRD61cE=;
        b=r4fpzQX7aeKrhog/YbjOndtCkTHchTyKwWKSUS9WcFXmU9mCwwX9FjD0QZd/W0IdaI
         ZEyTel2D3083FLxdpCrlB+7pfpec3s9n1h23+rkZog1AOt3nKFNenPQ9hy4G6ZKQxPA2
         Lt8+Cboq2zsDpKigajogkc58BobmpYFAcAtI1HHjhL9Re6txdeSfOnks4EtU9xeMbKNK
         Nawv/Oog2/C1Uv/qG8+3BYlnXXgJTMXeUM2Fu8UYz8ZLTXk3Bka0ikeVxuLe16NAU82i
         EkloawWKnomiMvFWFBNrm9JGZpbKSZMkE1BlhmYHHKNXG9tzRejlQXADsO5FIgBxL5pC
         N7Hg==
X-Forwarded-Encrypted: i=1; AJvYcCUWrz1scU98ze9EGf80uT4CWWNpzAqVNAthRPEXxloWnulYfzjf5ID85TyUUvFkdNPsB00Iflxs/eNx6/I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw13ZPhQGyaEyXqmkVr+iJmDGJ2JhU5Gf5BoKnPgnzTnviFZDLr
	9fi6RND3rXv9wSzws7cdqBXU1KwHvBqUf/tY4eNm6abwV29KAjeuPr5A
X-Gm-Gg: ASbGncupB1iUiZGzqlijHHfDpmgqNyoaIZOjJfz+sUTvu7ehD3dAXmndw3NBAQKzOKu
	tu5JiGiHx9/ZON7QfYwpUKo9+Dhc7fZ0OIL1JABm7SWiYnK6FomHjK9rincAem/51zeUFG/5LCP
	g66m+TLfk9cBrYblYBnyblYwI5wluIC+6phs8Mbdzw/i+v+T/GTuz1+TsbzheIdddvmsTpQw+DG
	R0bHo1AM6nRJ5O6Zxc+fAUUcfsfshXlVXAColP6+wFkzuo1Z29C4PbYIliMiw/0WQevH2IATd0j
	n386BG+meHqnw9lL4ylgbazQunlYE9O6pBH9QyoPRy1JZK96OqM4M3K3pRiZPXLBFBpoxdO+cSQ
	4/yHYV5JUOd2jHsnyzeea5PE7
X-Google-Smtp-Source: AGHT+IGPDNiWNYkiywfn60pLWkX0RPMqp1e5yQwNH4E/XZwRWgli0Zx4HgV/6FPN9PVG3zH7WYQiQQ==
X-Received: by 2002:a17:903:1ca:b0:221:78a1:27fb with SMTP id d9443c01a7336-231d438a223mr152220045ad.11.1747595391367;
        Sun, 18 May 2025 12:09:51 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4ebbab6sm46367225ad.205.2025.05.18.12.09.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 May 2025 12:09:50 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <479ff23a-38eb-4861-823a-35ebbd748cd0@roeck-us.net>
Date: Sun, 18 May 2025 12:09:49 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: integrator: Fix early initialization
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250518164118.3859567-1-linux@roeck-us.net>
 <aCodQZoA5KI9WyLB@shell.armlinux.org.uk>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <aCodQZoA5KI9WyLB@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/18/25 10:47, Russell King (Oracle) wrote:
> On Sun, May 18, 2025 at 09:41:18AM -0700, Guenter Roeck wrote:
>> Starting with commit bdb249fce9ad4 ("ARM: integrator: read counter using
>> syscon/regmap"), intcp_init_early calls syscon_regmap_lookup_by_compatible
>> which in turn calls of_syscon_register. This function allocates memory.
>> Since the memory management code has not been initialized at that time,
>> the call always fails. It either returns -ENOMEM or crashes as follows.
> 
> Yet I see no thought whether having the scheduler see sched_clock()
> suddenly change is a good idea or not. The point of the initialisation
> being early is to avoid a jump in the scheduler clock.
> 
> So, was the commit you're trying to fix a good idea after all?
> 
> That question at least needs to be considered, rather than just moving
> stuff like this later.
>

Absolutely. Just consider this to be a bug report with a proposed fix.

Thanks,
Guenter

