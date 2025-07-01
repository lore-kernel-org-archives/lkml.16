Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DEF6284B3F
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 19:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751399619; cv=none; b=BRPaSZYihZrAGJ0lq1R7uV6cUjDZpO+FoA5OD1JUaeIZFtvYKqkwAUBwgeVQUjp0b0zWQ2Sv5sLr1edfXubuFGuCgO27wW8D8EhSeVJh9QUf6ITjcB2PyUOq3rf05C1ZAnZ9Y0lKN/gpFV7SoBQ/5oPkVK673mdegX8+y7bMJvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751399619; c=relaxed/simple;
	bh=xv85BblxpwCPLhEN59S0LbhTMVwob3/UmnwNbwObM+A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SmL9+iOoFzOXUuvRT6Os2QhU0kmZCfqqeCiDY1+1Wj8A9zMzb8UMgt/nq2BN6VGLB3tGMBvJZ3dwf9RxHZbgaMtx6xwAWBwJVtP1M9dOdjf5/fxSKQ1PbTWwO6SB+voYrSIG8EG6uKFZ9HddhAqLvQMRhQMKP+tDgWtrcNhenWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=AtfbNXVW; arc=none smtp.client-ip=209.85.166.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="AtfbNXVW"
Received: by mail-io1-f50.google.com with SMTP id ca18e2360f4ac-876ae3f7768so209017339f.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 12:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1751399616; x=1752004416; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=05DvOPnYJvLbjXIZfvA3qU8pEVrHcgb4vIodN8pGWR8=;
        b=AtfbNXVW6F1eDK9HtZkg5mQORIEOipqrj25/hFWE6wt83NplrKDKzlp+beYz1TjtM6
         TYGgK4L/RDDGPVlyMStuRvYUqrIvLpKkhcBX77jE9W48sHmpK8ZNBek5tOqg8DjA7JAm
         3x4tlMK+hAZtH2leFp6F9So9SaGLs47FoiOYk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751399616; x=1752004416;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=05DvOPnYJvLbjXIZfvA3qU8pEVrHcgb4vIodN8pGWR8=;
        b=SD040Zx9JbeTUUFvE3gHawe8Ra2QTsY9fmMNg7ppekgTR7pdQCg/28s6GpX2YCpCTD
         aigpOQ2pTLMvXz3lhc+goT06hHYog6NKQ11MEyNF8sR5IBQ9uASc52HmhjRmFGw4BLKz
         aoef3gytRjXiNd4Wl/K7i0fYL0v8Z+i1HCaBqCT/g1w/GEECKtj2V+UA0IfnP86XeJ6N
         VYtNJHF7Eo9pcb9ljcbaFlyOovQyy3EV90pTcuwxV1IWKQDtTQgHHLfLTIeRFrDmnxHQ
         Km2HFZGKLfZ0TYQTj22zeNlUiiGxx+oFsE/NPpSgNs5xdnyawYNXVCB8houNqAb6pXdj
         cRmg==
X-Forwarded-Encrypted: i=1; AJvYcCVsYTLqgV/LOHf7GJsjUDthJCqhG9UevXV3ekmiU4GCa+7dPu0x3PUTmQlfZQP6SNrDQqeRfKzQx7kt6V8=@vger.kernel.org
X-Gm-Message-State: AOJu0YypEb2o9IYLbYaXvk4ONZ3jsu5sFMoPeap8yks9T5Uj9dwVUON8
	cbsso1Qk/yAIQn2ID1MTTYaNkcZ+z2lQG5jbqvrvNGfjSPULxQS44fmrKQjVlxIXEqk=
X-Gm-Gg: ASbGncuYQunKGPSNDWwnSDQLv2iEumoHTxrrQ0FGil+R5DhMnzvTqXoAZaaTsMs5/D/
	vwSkAo2wf5B+2W/P87ZBAB3+rUVTrpYnZzAays8RbTYztyqeurH5iXCPpOx795uRxcUkqilGsWT
	lmjDvrpBKW+SX4JmGmDswHLTjF3QHhiXufriqEecE9Qw9NMJqYx8+jmIWEgdBpPN8gsVVgRrg1m
	84XnV1qFrpBV1GIFf72WkW2r/ljmhtm+bM18ULZ0PeBflAuNH2ZRCAFTpEnJYd56GeiEkOueJ7N
	gOrqT5a3hLXU76an3JVzRCpfSZIKxuRCZX/Ip7FJbQL1aVPUtf14coPq4+V0862ShEDnXpOgyQ=
	=
X-Google-Smtp-Source: AGHT+IFvgVmTDNSS6N+w+PWK6OvUgtAsoQ5EvKqtlmkInV+s6ra/2LpzaFJdJKj+QGj0od2XQYkO0w==
X-Received: by 2002:a05:6e02:310b:b0:3dd:b808:be74 with SMTP id e9e14a558f8ab-3e0549e27a5mr3374255ab.13.1751399616134;
        Tue, 01 Jul 2025 12:53:36 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-502048636ccsm2592165173.13.2025.07.01.12.53.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 12:53:35 -0700 (PDT)
Message-ID: <744bd439-2613-45d7-8724-5959d25100aa@linuxfoundation.org>
Date: Tue, 1 Jul 2025 13:53:35 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests/kexec: fix test_kexec_jump build and ignore
 generated binary
To: Moon Hee Lee <moonhee.lee.ca@gmail.com>, kexec@lists.infradead.org
Cc: dwmw@amazon.co.uk, mingo@kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev,
 shuah@kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <20250624201438.89391-1-moonhee.lee.ca@gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250624201438.89391-1-moonhee.lee.ca@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/24/25 14:14, Moon Hee Lee wrote:
> The test_kexec_jump program builds correctly when invoked from the top-level
> selftests/Makefile, which explicitly sets the OUTPUT variable. However,
> building directly in tools/testing/selftests/kexec fails with:
> 
>    make: *** No rule to make target '/test_kexec_jump', needed by 'test_kexec_jump.sh'.  Stop.
> 
> This failure occurs because the Makefile rule relies on $(OUTPUT), which is
> undefined in direct builds.
> 
> Fix this by listing test_kexec_jump in TEST_GEN_PROGS, the standard way to
> declare generated test binaries in the kselftest framework. This ensures the
> binary is built regardless of invocation context and properly removed by
> make clean.

The change looks good to me.

Acked-by: Shuah Khan <skhan@linuxfoundation.org>

> 
> Also add the binary to .gitignore to avoid tracking it in version control.

There is another patch that adds the executable to .gitignore
https://lore.kernel.org/r/20250623232549.3263273-1-dyudaken@gmail.com

I think you are missing kexec@lists.infradead.org - added it
> 
> Signed-off-by: Moon Hee Lee <moonhee.lee.ca@gmail.com>
> ---
>   tools/testing/selftests/kexec/.gitignore | 2 ++
>   tools/testing/selftests/kexec/Makefile   | 2 +-
>   2 files changed, 3 insertions(+), 1 deletion(-)
>   create mode 100644 tools/testing/selftests/kexec/.gitignore
> 
> diff --git a/tools/testing/selftests/kexec/.gitignore b/tools/testing/selftests/kexec/.gitignore
> new file mode 100644
> index 000000000000..5f3d9e089ae8
> --- /dev/null
> +++ b/tools/testing/selftests/kexec/.gitignore
> @@ -0,0 +1,2 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +test_kexec_jump
> diff --git a/tools/testing/selftests/kexec/Makefile b/tools/testing/selftests/kexec/Makefile
> index e3000ccb9a5d..874cfdd3b75b 100644
> --- a/tools/testing/selftests/kexec/Makefile
> +++ b/tools/testing/selftests/kexec/Makefile
> @@ -12,7 +12,7 @@ include ../../../scripts/Makefile.arch
>   
>   ifeq ($(IS_64_BIT)$(ARCH_PROCESSED),1x86)
>   TEST_PROGS += test_kexec_jump.sh
> -test_kexec_jump.sh: $(OUTPUT)/test_kexec_jump
> +TEST_GEN_PROGS := test_kexec_jump
>   endif
>   
>   include ../lib.mk

thanks,
-- Shuah
