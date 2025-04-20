Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5BD31BC073;
	Sun, 20 Apr 2025 16:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745165212; cv=none; b=symlNWoJ9uLuGAGgIeHo+5f9wDi3apr1Y7l7N0Jjha7Er3Ap2rGcSXgHfG9yuVBC9lkur1NF0Gh2TyQ9uOqivvveH7hzPz/NcaUddrC7u2nUI3uotQH1CZ9p5JDHwbtGmrD2tkowqfxJMVNmypJQ4fjWhnlKmK/gem6nSH9caho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745165212; c=relaxed/simple;
	bh=f8o0YqoaCdkz5M4EDpBxsMii02vnCaO4nDunSrkU9HY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t9UHpR/qq0eA3YtAnAW2HIcKjxKvQzQpoBBO6Mfxi+eE5XdWzzAoxK0wYrUgVK2TQs97kq2tArSI6C03cxcHS81hv4FKP4OMwyyf1xI/+uDqAoWSZK4UHbSa7K7WHJgNqZtY1u68Rnn8jiDcT3O8fpxscpTJZTX54ecOvRH1cko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JASJIPlu; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JASJIPlu"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7399a2dc13fso4325746b3a.2;
        Sun, 20 Apr 2025 09:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745165210; x=1745770010; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=eaTel79kLv9h6H86adMPeXI6zNau/2ZZGbG/qqarm3w=;
        b=JASJIPlu0RI2SV0VxhmSYHFImxPjexwlOG7wCMDsaAE9V8lGoTuY0XQVnc82MRo+k0
         PDu5nBmjZdaEP/a32ToOWp6EAmv3ytSqfRvnhpi93i6lHML8vJYZka/AaIfpY7BIEAcG
         i4jU3j96Bxu+yeynA2mlEnCHfHBBv95sts9LRTsB+XhM6p1BDyaQGLMYiR3A/VRbhkef
         7RHXWxlx8ZBC5L0ZBS3F8Zw1C23FZ1v/w/RCZ1g8xkCSIVR5TzwpZhsTWSOss7c73bld
         MqVSLF7QQmpIx85v7NCUvYWqancVKfVu6jaXI5zjiHxFoaCowG4HS/j7cuNX6R2T7Q/f
         fecQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745165210; x=1745770010;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eaTel79kLv9h6H86adMPeXI6zNau/2ZZGbG/qqarm3w=;
        b=ei2ZUQLh9331v9GntcuhcB9k5LSDu/4pQue5fuOj7prkVhz7vPWo4DdwcFO9Fdt1sg
         Uu1sAX22LoFlKnM+u/1wd8qeZWGbZmv/UX/d9rApv6z1Bvh4vypqXl5hN2KlxydfLUSi
         7Zx0pXa25j3TYdhgMZQWh0o4rpqZkEmpQdISIP0D0DiPCMqdP8esMUeeOBhPUXrDI1po
         sBhNlupulwYpZSj0FBEsvQP3Bxh3uizA493iYLfOaaZY/ilen+4DjeJ5cr+qYi+GUz9o
         qoFKtHPVk220g/lzF5X9R6X+lj0uer8E2kGFajlTP44qIdcsGfZquczpU0ssizVIwMAj
         HoyA==
X-Forwarded-Encrypted: i=1; AJvYcCUrD+7gUlipb9Goutri0EWvsDCY3PkrGTRK4GFP6xrEKdygviOYVi7q5RZjdEi00KNX5D2uoivl7Kw=@vger.kernel.org, AJvYcCWYC/ZZnZ1Vyo65c7lLa0A/PGVKoPmAZHQOMRblmQnE6LCJhwTEBu4/TwPXcG07dM2jOE9DgZrbUVOIxCVG@vger.kernel.org
X-Gm-Message-State: AOJu0YxyLL9R2Fzt+u1X6ky2r6QLUdlUURAnNdxP2c+mcJwOeOxnfTtH
	waLS2ZZE4wSbMHU/ROynhhUPj9lOhd5bnsp04cENH/NiGw2RuGnI
X-Gm-Gg: ASbGnctCJvo1qRvo+jELNrl5plAUB4sSamEABIFXAs4qkWVqwIMTBePYxembQky6aoQ
	kFnmH1eloaqNhXcPQPNcKijdSwNaCtwq/Ilu203Oe3qvllFePGc1Sz+ohmQyMfSFYWNRaOhsdXY
	wlHHKkw/Bb/qen/6EeFcURlGF11gBKfpjeMeXkX8EM3zHahDmBIYcRZdHM2X2KDMU3wU2YOcqjA
	cijkvbp9pFK/5lXRvHfVyBOsPRiVl2V9sPFI6LJv6KO9Yrx/pMWaUwCpsTCG+usqjDBclNU9tcD
	uIlCnODopzmHOwGorQsAHkOXkaZ3xYpc6TD0ysNru6L7+UsVuZtSMkDbh+8hMA7y4TUPtjCgglC
	kRHAzUBflJaNsMg==
X-Google-Smtp-Source: AGHT+IEf3HEg9kXxIHuYovHMfUl3ZTyD6jYPPMZaFFv3CL1nHmlF0UMJl9Kb1oJfcbIXiec8F6eMwg==
X-Received: by 2002:a05:6a00:35ca:b0:730:8a0a:9f09 with SMTP id d2e1a72fcca58-73dc156f804mr13078124b3a.18.1745165209848;
        Sun, 20 Apr 2025 09:06:49 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbfa58333sm4892516b3a.118.2025.04.20.09.06.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Apr 2025 09:06:49 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <3bc76874-2942-4454-b785-896772bdad6d@roeck-us.net>
Date: Sun, 20 Apr 2025 09:06:48 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] hwmon: (max77705) add initial support
To: Dzmitry Sankouski <dsankouski@gmail.com>, Jean Delvare
 <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
 Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250419-initial-support-for-max77705-sensors-v5-1-4504a9b48ba1@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20250419-initial-support-for-max77705-sensors-v5-1-4504a9b48ba1@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/19/25 12:03, Dzmitry Sankouski wrote:
> Add support for max77705 hwmon. Includes charger input, system bus, and
> vbyp measurements.
> 
> Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
> ---
> Maxim MAX77705 is a Companion Power Management and Type-C interface IC.
> It includes charger and fuel gauge blocks, and is capable of measuring
> charger input current, system bus volatage and current, and bypass
> voltage.
> 
> Add support for mentioned measurements.
> ---
> Changes in v5:
> - fix compile warning
> - review fixes
> - Link to v4: https://lore.kernel.org/r/20250412-initial-support-for-max77705-sensors-v4-1-2e4cf268a3d0@gmail.com
> 
> Changes in v4:
> - Fix review comments.
> - Link to v3: https://lore.kernel.org/r/20250405-initial-support-for-max77705-sensors-v3-1-e5f64fccd005@gmail.com
> 
> Changes in v3:
> - Fix review comments.
> - Fix v2 changed message.
> - Link to v2: https://lore.kernel.org/r/20250304-initial-support-for-max77705-sensors-v2-1-58d2207c732b@gmail.com
> 
> Changes in v2:
> - Fix review comments.
> - Link to v1: https://lore.kernel.org/r/20250225-initial-support-for-max77705-sensors-v1-1-2be6467628b0@gmail.com
> ---
> Changes in v5:
> - remove now unneeded max77705_hwmon_readable_table
> - remove channel num check in max77705_is_visible, since there's only 2
>    channels
> - make is_signed bool
> - remove is_signed: pass is_signed as true/false
> 
...
> +static const struct regmap_range max77705_hwmon_readable_ranges[] = {

As 0-day (and builds with W=1) points out, this is now also unused.

Guenter



