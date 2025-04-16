Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 958271F8676
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 13:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744811834; cv=none; b=rT8iMLHjc8lv1sHbD3LIi/uWNG5d9gHMJbJsD/f9Cwm2H4OQtjynrP6gyt506/dZFu1nx/c24Q4MO1Iwme1eHlWsGZ9nda9oYfe/CGhEu6AfmlKU7mLMFgKv4DImzBrCfYSaOGRJsNrPkGzzNeatVKp8pILGbnn1CzaMkxcU7/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744811834; c=relaxed/simple;
	bh=z0fUxpuNNm6oF8pAf16JqL6vk3aXO1+XuxyXapz/+1o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Aqlz1qIBLXEsZDZ0hS123DvSA3oQm2U8Ad7tKcnJnXxWtmtlTDOPvOUo5aohGX/FRqJWo7kkwwIwSJVFv1JShICQ+5DTy8YhNZ7RZnkcP0ZqXOCZO+bnAo3NMtXt97FEX9K5AhXT2j+5F0SmrFOkfmUsv5ezCU6MANkJYH6D+y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D428PLPa; arc=none smtp.client-ip=209.85.161.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D428PLPa"
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-60245c7309bso1721771eaf.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 06:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744811831; x=1745416631; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BqUwR/j4bGZrHGUzeU8HFrJ3dPz6gWbqr9WxRuB4G1Y=;
        b=D428PLPayp2n+X2KIWkoyDiIUSPY899dZloLwVzUNMqt1Lqc2MVAmFaaaKxONl9EkR
         Auhl09VtAjG5m8KUE9oa3gzscQ93daNiI/Xtc1c2z9tAmHD9tcy55npN/d0N/anIOHHF
         rulLNP66r+7bZOcQhMMmxdQCVlyjh8RoVmetXEB/4owxaCdeXZ/PlXmBoDFxIrJmftKZ
         fZhi77N7dNbL5r/t1I9m9dHzEK60fUrASPVdxzU9ynMXL51mLEzEEbrC4EOSw0OTxJGK
         0AUEY/ne/D2WgI83iuLOmAgpx0V6fwozNqEfhddGae/f554+0qMnhQKD91OQTWcm/uNH
         s4/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744811831; x=1745416631;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BqUwR/j4bGZrHGUzeU8HFrJ3dPz6gWbqr9WxRuB4G1Y=;
        b=D600qwVNWQqfiLyGlUT0hHTPKSc/qUEDD0K0WRffrRk4A4NEIQTCzpWTuInQDQ4gVi
         liPj2zkoFPxk5lsi2QxfgQNY1115nWhatFg8/xlARgIft9nYKBf4n9Dx7oJK3kZVmgKq
         3oqYwAQJoppab8hh3kl5VheIn3blnEQTVvDybdXwptvjtQogxbeJL4JGZ3t9sS8zBenT
         weJugSUNF2d8d4rAd2xrJBgIRKhKG0wjk9lCKtM+HiS8cjraF+qVPQQgQB7t8BcJbhdg
         Ry4kHcqCXJUmJ0YtISKozGJn3homlVQWR9rZAN6t61JkzC9+xWUMQ7/75FtJNLDJLTQw
         Y8hg==
X-Forwarded-Encrypted: i=1; AJvYcCWNmUx8im0v7htbod6KC7YFHMN/3DdSyVXZ9ncYvV5uIym54DC6dxFiYvvMlZXFmNWKEWB8dsbO8bnas2w=@vger.kernel.org
X-Gm-Message-State: AOJu0YyUVwTT2bOEBtnPGTLCAzsXFLPgzUqbF6oFyv39LwUD/4X+kdLk
	MJjFxlvzQFQ/rYFKQ1s8IpFe7Vp7sykIW/D8Nk60u1BxfzSQhH9o1W80np4ikFsLIQ==
X-Gm-Gg: ASbGnct+IB2OhtBhOdmRUv9gVWNSCKEiuUUJZzRs/bAm+Y07u3rmXpkWNgI2sabzJr7
	FMl/7Jl9TCvUC5pxC7CaDieMgkIs6KUw+KEd9kXb5Y8mZGSUDGO1qPng/kBPk0nh/fBaij4BFYS
	DPiwLm6Q3xM0ePG0W3bssFcmSU9FlYOXHheGUVKrFpndm/0K+HyQ2QFIZCjy2xHoTRQbG9fmX6M
	73uv+BkDirto85AMcceBtbzH8UBWg6ffNzn9X8PgTjvKpXBliuFKOfpFTJRLUxcTDsnTLqaYEN7
	psUrx/YMC1ioS4xe3Nnpjvqn76g4VaM0X7yo8ZmQmOKVTgtw6nLeIA==
X-Google-Smtp-Source: AGHT+IHsnTz6aRDqS91PsyklJ+2mGSMI2WceYpHCHhbZs6GUjWU0+dDU3rsBet/R6xgdANI/YTXZvw==
X-Received: by 2002:a05:6820:2901:b0:604:66b4:a8f2 with SMTP id 006d021491bc7-604a91e80famr1013000eaf.2.1744811831457;
        Wed, 16 Apr 2025 06:57:11 -0700 (PDT)
Received: from [10.30.57.29] ([204.77.163.55])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-604a5bbac4fsm358847eaf.17.2025.04.16.06.57.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Apr 2025 06:57:10 -0700 (PDT)
Message-ID: <c7db6fda-bf4e-4d6b-8cca-db82c40ce1b6@gmail.com>
Date: Wed, 16 Apr 2025 08:57:09 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm/memremap: fix arch_memremap_can_ram_remap()
To: Catalin Marinas <catalin.marinas@arm.com>,
 Ross Stutterheim <ross.stutterheim@garmin.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Russell King <linux@armlinux.org.uk>, Mike Rapoport <rppt@linux.ibm.com>,
 Linus Walleij <linus.walleij@linaro.org>
References: <20250414133219.107455-1-ross.stutterheim@garmin.com>
 <20250414142140.131756-1-ross.stutterheim@garmin.com>
 <Z_-B5fAhZzShX34I@arm.com>
Content-Language: en-US
From: Ross Stutterheim <ross.sweng@gmail.com>
In-Reply-To: <Z_-B5fAhZzShX34I@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/16/25 05:09, Catalin Marinas wrote:
>> Fixes: 260364d112bc ("arm[64]/memremap: don't abuse pfn_valid() to ensure presence of linear map")
>> Signed-off-by: Ross Stutterheim <ross.stutterheim@garmin.com>
> 
> I think you could also add:
> 
> Cc: <stable@vger.kernel.org>
Done. I also added some other Cc: entries on V3 along with Reviewed-by: 
lines . I'm new here, so I'm not sure I've used those 100% properly.

> Not sure how Russell picks patches up these days (I used to send them to
> the patch system -
> https://www.arm.linux.org.uk/developer/patches/info.php).
> 
> It might be simpler with git send-email (that's the alias I had):
> 
>    git send-email --add-header="KernelVersion: $(git describe --abbrev=0)" --no-thread --suppress-cc=all --to="patches@armlinux.org.uk"
> 
Thanks. I created an account there and submitted V3 through the web 
interface (to avoid my SMTP server appending more stuff on the end).

--
Ross
