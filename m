Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DBF21F9F70
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 10:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738579248; cv=none; b=H/oERdhcXZWSwmDQYgAoUkxlttLvp5uF02WTuYftjE35DA7wUNOj8zxbLaBQRhbOimAIQdtGTvcJk3YD8hWpoacBnX89VHca5rbDDZMiazENtxoVOo1w+EQE8Su6dG7FxZr6peiS6G0R+23Asoa3KKUTtgfWcyGsFFLp8uBlKGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738579248; c=relaxed/simple;
	bh=png5agelIomCEjZc9R4rrRACrhCMfaGf/cOa626XFX4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cwbUoNp7N29mutmyWEwZnat6gGcy+HUhY0bAGHO/1c7Ls/jk+dMTiyYccjhzqSzF55Bfo3GXZsEAZYlQFfvhjEkyvTiFRiAStPiyYMdMNmSiCIOdLUMlUCwF404ssgi7nG+I/OdpmRS+3DdmxleItXfg/kN3Lunwmxn7K4mVBeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NWEEUBAy; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NWEEUBAy"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-38632b8ae71so3610423f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 02:40:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738579244; x=1739184044; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HqYW+hN2Y2KDZOoWXSdQn18bREqQvJTWRQyb/yrvcoE=;
        b=NWEEUBAyOJYNcd+HAv5ENs+9WEW6L/oEn0fEY7Cn8cJHj3NehDmr0MJtcACNkjoWaR
         RMAB6nqOQKEoPVlvTuxdbBDF9qKfXf5diPItwKJ4E1CqGRefMsc040saqqrswdOUNcyw
         Ok3qRaoM1bBm9tbIYEXej7+0osDuzsmIgb9fmEbRvzeMPrUtw218QD3y3aHqpvH3KAgo
         JNY5rFCi9wLw8QMKfuZcYxHqPKXcHt0RYI6BafLwwKytIJMrZFlIR7DqXKRiuVRz+FBa
         nWC6m3fu9mLUMygoNr835TTkN/eZizk4+skWSmN+BlfKlnpZj+e6rd8KF7/YiVKwFGkS
         gFNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738579244; x=1739184044;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HqYW+hN2Y2KDZOoWXSdQn18bREqQvJTWRQyb/yrvcoE=;
        b=nsr6qc7rtZasprEuwo2k2ZIm5mlkyxKIke+oN+lGvtXzJSPF0RqsoDGIm66AfSGDj2
         oOY0UZOF2EF++nqwt+JyCHXtkYh7+TdvOypi0w6Lsx/gMX7R2295iuUqSppStctAGlCA
         hYe3SrMG9stB95YibYBJi72een3Gx4mo6gfTs9C11v7jzUHpE9R5yZXsEXZ1+A4X8acA
         sP0cp3tBApgam7GxmWvQ9px2CmpT2d9gI64li8DJCEJFO7EywTYNvBzXJ/JDOb4wevtm
         z5YwmMTUdm3IiHsSyObsjG8DM7uCEgmA36vr2WR9NpdBjWlKZq3gCTrlxkd1S422lQzm
         c8Rw==
X-Forwarded-Encrypted: i=1; AJvYcCVsyGW+/oWcbeZ/ABfayNRjTeJ28Ra4rZfYdIaxhDpGkAusvEO8xJdFRA/VynEEaJXG8Im3bWl1tPpiWqI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyw/jRG3Tb9Zx9X+K01Zpdtn6Oqu/TFsO0X3yi8cLgW7D0ptCJG
	ft1tz/FQXikprcEPyhPo7G+T2O6WN5HJ2xYebx+kVahDj3rq1AifrvVRUy3rd3w=
X-Gm-Gg: ASbGncv6p7y1YkiFxNMzSl88bjvlrvL0AvfAByZwlvXbn4m2eNt4cC48Kz0bjjKztTj
	otPvpHzK4ltC4XTPZxTL5/3niOTlFKLb62wpvR5Dvnn0IOedJz0bYjEjCpGmZyS2k9yCow+X6WN
	JEmDehr0c8q83mq4U7lfj/fB9wbPk/oHsU9nQUXmmxOI4bPQ0ypQitK7EFdEbB9+F4Ucnip6CBd
	qzB93PSSKfTnrm6yrMbuE8KP+dDB0PZTN53NKQiab7zR4YBlKzVl6MymdRvtmUK7pUdaN+M86PZ
	3hMSYlYifCd/YpRtxu2a81d4Ig==
X-Google-Smtp-Source: AGHT+IGOMd7k6IiFZ/qRr89XaNMzuLGbCX4OtGntn53AQk5HgByLIRtP1twYFWrJFYieIbOY46NAuw==
X-Received: by 2002:a5d:5846:0:b0:38a:2658:bbc7 with SMTP id ffacd0b85a97d-38c51b5f3d9mr16615608f8f.29.1738579244326;
        Mon, 03 Feb 2025 02:40:44 -0800 (PST)
Received: from [192.168.68.163] ([145.224.90.107])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c1cf555sm12549296f8f.97.2025.02.03.02.40.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Feb 2025 02:40:43 -0800 (PST)
Message-ID: <8c96613d-9952-45aa-bff4-3a4570de976b@linaro.org>
Date: Mon, 3 Feb 2025 10:40:42 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] arm64/sysreg: Sort sysreg by encoding
To: linux-arm-kernel@lists.infradead.org, robh@kernel.org,
 broonie@kernel.org, maz@kernel.org
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Oliver Upton <oliver.upton@linux.dev>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 James Morse <james.morse@arm.com>, linux-kernel@vger.kernel.org
References: <20250115162600.2153226-1-james.clark@linaro.org>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250115162600.2153226-1-james.clark@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 15/01/2025 4:25 pm, James Clark wrote:
> A few small fixes and then sort and ensure sysreg remains sorted due to
> the discussion here [1].
> 
> Applies to next-20250115 for the review but I can repost after rc1.
> 
> Changes since v1:
> 
>    * Use same matching mechanism for both opening and closing tokens so
>      also collapse those commits to 1. This now allows trailing
>      whitespace on closing tokens which may have been hard to spot (Marc)
> 
> [1]: https://lore.kernel.org/all/996c7843-7f51-49a0-9122-e688e37f9902@sirena.org.uk/
> 
> James Clark (4):
>    arm64/sysreg: Fix unbalanced closing block
>    arm64/sysreg: Enforce whole word match for open/close tokens
>    arm64/sysreg: Sort sysreg by encoding
>    arm64/sysreg: Enforce sorting
> 
>   arch/arm64/tools/gen-sysreg.awk |   38 +-
>   arch/arm64/tools/sysreg         | 1010 +++++++++++++++----------------
>   2 files changed, 529 insertions(+), 519 deletions(-)
> 

Gentle ping just to say this still applies cleanly to v6.14-rc1

