Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BADBC1F3B87
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 22:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744669729; cv=none; b=OZ7C4YQLUUFh8I18ShulkzZnT4zZBEywzo1aW6UyOZJivvIfUua66eQqkvMkr6M7L0WEXfzLHXMG6rkJburcSC4GCjKUiqLBMYgKAohmMhIr8IAoTSvIe27rb9GLA+gBKprt6SzvfY9LptW7Pw5Lt4XjhrvJzdpBhZLGO9tCaK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744669729; c=relaxed/simple;
	bh=FxY+9Wjj25SbW5KNiA1oQlgVIKp/S9qSBDP8PtBrQZ0=;
	h=Message-ID:Date:MIME-Version:From:To:Subject:Cc:Content-Type; b=SOdcGoSsA7AJXEisOFY+HkwrJTftr1J4sNvD0Q1h7j7YJlndplfxNJeC9E/pxoTeRvFTP4wcHPx6sKvnLDa64WbuSQFwcbYPfOFaTw2fb50ig1qIoNTRO9fFifULzvUpifkubHuTlXMERz49eKa7/+WUm+wWKEyWNGSakI5ZRMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Bu7S6WNV; arc=none smtp.client-ip=209.85.166.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Bu7S6WNV"
Received: by mail-io1-f41.google.com with SMTP id ca18e2360f4ac-85d9a87660fso419432239f.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 15:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1744669726; x=1745274526; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:subject:to:from:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pJTRXGpvz25R//bDW9klPbX2cG6ymqv4N2+3BelWwt0=;
        b=Bu7S6WNVFqt769aL9gWnHfgoFkHVnsS3GAHZAZ4Dkjk4BmAz/JzRgKUI0Sm71dDmJ3
         /6U1EeEpWVkpC14tizo8lnlgx9GLvw7jTvHK15NF1lnkZcjQ8ZQ2yAglHJUaMQXXVWfc
         gplXFNEC6SsHen0t12OAFOzU9LvkhKfXXVngU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744669726; x=1745274526;
        h=content-transfer-encoding:cc:subject:to:from:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pJTRXGpvz25R//bDW9klPbX2cG6ymqv4N2+3BelWwt0=;
        b=BoLRw2nHcQDuMygsE7i0HYX776S3Lro7m4JUK6YcO1oA88AH6TtEhbZBOzbyFDX+GR
         qKJQ04911DqtXOP+6X7NzFKNpHe55IeL0keN181fSrejTFTerOgBgH+DY5MZEVKNipwp
         bbRfpclEXlcbAK+2FzlMAtVfINqe0ApKxbNenBaimXz0Y1kFjW7EAQZ60AVeGTwZx5KG
         FCqGgJpMbUVklY17497DOfj5vx9O6MpDflOLxN+pHr/jc96XQltdpuvLSeUdDFu/CpBH
         jwLcW461wPFeICbqpL/xjDJ9yhJMrC7slP5YNu0aMT6GBR7NsxOVPO3+Cop/yE+PDnkY
         rSqw==
X-Forwarded-Encrypted: i=1; AJvYcCUI7hqvkss94joqHoryuFKIiZ6DodJ/CT/vXdboY2If/ZTXVcmykHOqJdyaz+Yglsu1WA2E/Q11yw34ATM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzsg+1LSdE/3DwU/yGIwc5LQIHdYyD4L7laJPgiaqtHVnqRYT91
	6jqu3xnaWLYZW9+lh3HR9Fe/2x199/jQQK0tX4/J8re0sUCkZ1T68tWSMb9C1JQ=
X-Gm-Gg: ASbGncsg6pQIx9yP4D0x+Lf3QY2FIommuFb7r2BvvEP0ZX5FLsejKQAcnJgxU2MjbE7
	Akt8yHc1XLxC6i5ugDj1NN9S6bqgHkndLGWnPNilTXZSLjBXFKHluZofBIGgp6Xn8M/P6Q/3RON
	mP2t5PMMy3ZPGiGKSIz2ZdEh3isD/x/rBns56eyfmeA+y6UdQdr5HmZ/JxOuaqb8BPVhYxTET96
	i6NY1xvGUNYEHvaQ3sjxsBdfAtZbVj7eirFOyz4GGgyqeOreUtw+5RxqiIGIlSzrqe6DDrgc0IW
	zGb3jSJCBP8zBSPsFgcGBXRAKZZtJ4OYK6niKZ/E55jwNq62wybq4rN2Qrsqug==
X-Google-Smtp-Source: AGHT+IHUFwQwLh0D8bO/5B3+gpyC0Evp9jaDV/dTZl3hqh8ZR9sn6WHDKd/VXH/nBILyNJMOolthYw==
X-Received: by 2002:a05:6602:408c:b0:85d:115b:bb3f with SMTP id ca18e2360f4ac-8617cb8d8cfmr1787274439f.6.1744669725774;
        Mon, 14 Apr 2025 15:28:45 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f505e7da54sm2777015173.140.2025.04.14.15.28.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Apr 2025 15:28:45 -0700 (PDT)
Message-ID: <7c5f9e2a-2e9d-46f2-89b2-83e0d68d3113@linuxfoundation.org>
Date: Mon, 14 Apr 2025 16:28:44 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
To: thomas.lendacky@amd.com
Subject: sev_es_trampoline_start undefined symbol referenced errors during
 kunit run
Cc: David Gow <davidgow@google.com>, Shuah Khan <skhan@linuxfoundation.org>,
 "x86@kernel.org" <x86@kernel.org>,
 Brendan Higgins <brendan.higgins@linux.dev>, linux-kernel@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Tom,

I have been seeing sev_es_trampoline_start undefined symbol referenced errors
during the following kunit test runs.

./tools/testing/kunit/kunit.py run --arch x86_64
./tools/testing/kunit/kunit.py run --alltests --arch x86_64

The error is here:

ERROR:root:ld:arch/x86/realmode/rm/realmode.lds:236: undefined symbol `sev_es_trampoline_start' referenced in expression
make[6]: *** [../arch/x86/realmode/rm/Makefile:49: arch/x86/realmode/rm/realmode.elf] Error 1
make[5]: *** [../arch/x86/realmode/Makefile:22: arch/x86/realmode/rm/realmode.bin] Error 2
make[4]: *** [../scripts/Makefile.build:461: arch/x86/realmode] Error 2

I made time to look into this error.

sev_es_trampoline_start is referenced in arch/x86/coco/sev/core.c twice:

- To override start_ip in  wakeup_cpu_via_vmgexit()
- In sev_es_setup_ap_jump_table() to compute startup_ip

sev_es_trampoline_start is defined if CONFIG_AMD_MEM_ENCRYPT is enabled
and all other references to it are under ifdef CONFIG_AMD_MEM_ENCRYPT
conditional except the two in arch/x86/coco/sev/core.c

git grep sev_es_trampoline_start
arch/x86/coco/sev/core.c:       start_ip = real_mode_header->sev_es_trampoline_start;
arch/x86/coco/sev/core.c:       startup_ip = (u16)(rmh->sev_es_trampoline_start -
arch/x86/include/asm/realmode.h:        u32     sev_es_trampoline_start;
arch/x86/realmode/rm/header.S:  .long   pa_sev_es_trampoline_start
arch/x86/realmode/rm/trampoline_64.S:SYM_CODE_START(sev_es_trampoline_start)
arch/x86/realmode/rm/trampoline_64.S:SYM_CODE_END(sev_es_trampoline_start)

Why are these references not under ifdef CONFIG_AMD_MEM_ENCRYPT conditional?

The following commits added the references to sev_es_trampoline_start
in arch/x86/coco/sev/core.c

0afb6b660a6b58cb336d1175ed687bf9525849a4
8940ac9ced8bc1c48c4e28b0784e3234c9d14469

thanks,
-- Shuah


