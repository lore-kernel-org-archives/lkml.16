Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3F2D1C5D77
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 21:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750282570; cv=none; b=GUQyb7m6xRH07KuRzx04qB+AK9Tj0I7XfCX5DT/5M1b7ubS8BV5gjedw+kuAbP8frydzbB4wgI6bY1mF9efKekioxSQdyEfzEe//yZ9g5swWbkOLw8sbNIBCasD631E/v30ZsfsTGQq6/qP4NeR5qM5qL+P1Ga1mZuOpYL969nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750282570; c=relaxed/simple;
	bh=3DryKTDgztVTgPb+gTQojh1hwDF9sdAwdlRg6knZxhQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q4fAx71O3rdkR+UHL0MyrDnQjVcZ1WVJNjKWw0oqbxvvl8dg1WZpghLFtjWOvh54UadqArIyDxBo1aNbT3VpotjBubvnccB0lRZGIdiERW5Vwa3ReUlCqqR3TlsMEVUIo3BoflqXSEUkMc+f0zKHrS2pagZwjK46/4NJJx/LUSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=KnTvB3/n; arc=none smtp.client-ip=209.85.166.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="KnTvB3/n"
Received: by mail-il1-f170.google.com with SMTP id e9e14a558f8ab-3de2b02c69eso572705ab.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 14:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1750282568; x=1750887368; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Jjh8awUqCCw4utSfZXOcxNoe/sGWEOM53BOqQHOzNR0=;
        b=KnTvB3/niB832sbVzBZ2yrW6/NUdizD8zoGGjILhOTaUeEUEcPPJMXbX3SdlFprUE3
         XF0iQM9RnatPpFQo4hFa42Os+vLPcFaHZ4vp+BlT77sIkiWac1yOm4hS1e1pN6I5w+98
         JJlqOHgY0Z+94UGP0cnfBXE2teleX6OyW/354=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750282568; x=1750887368;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Jjh8awUqCCw4utSfZXOcxNoe/sGWEOM53BOqQHOzNR0=;
        b=GhjD3VCrU1XvUOm2gXPdkHDlnyuuvLdLVsTpvexMaGPzmUQ7R+MgvsYozASzFKvXd2
         e+On8xtCyl13t9JYoeZEl7OJnHVh/Q8JKo1jW0hYE0HVKgZmSxmNOJjmDOPkZgP2UeAH
         fFgrhzp8NdudYFjIanJCYLt1y0/RuJ50WFNTEB7M6ccX0/h2vajF55sy4AWJkxBVXR+r
         9VTipaj/4zrAG16+0zA8Iroalyc/qPk1HjpS4gQyPVNV4fTA34rmoUUrjPcYbM5U5ioU
         BVsDonGt+obWofflFwc7db2ZMSgzwX4ZFeRB88Ln5JWp9M1i98H4PBWoLPwVK5tid+Lk
         MUoA==
X-Forwarded-Encrypted: i=1; AJvYcCU/u5N+0Y+3FTX9I31LMDaXUXeKQP6JyceovgjwIjC4b3czDQ5vR8cpFfES5omLr/P2t/5Sy6Zn8PCI+WQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxNXewmvmEa6VWsY1Np8a5miq0ADrBYGq3H5LDKZgY1fkynT9o6
	8/BKpUcOn/F9svEEavO5jer1nXzd8RHBmiqG23Wq/TIl0AMtCyZtR/YDVpyFkdT6fIMgX8FznhA
	n2icv
X-Gm-Gg: ASbGnctZ8GzkWbt2/HRuTky1z2+tqehV9fhfl+i1M0Ise47GiX6tgxbKoIrOqF3JEVh
	k+EWXGd340IIsQLGvIZA9Y1zCrDkGJD3vba5JbkNStlaUwZFctFWudravJ0hqZcUJzNhqLtNqnn
	eFfS7JNnoPEC4+Mx+rc4AxAKO0eIX2kB/ejRIZhqiDXCXMel/+7fLxbaBbey1gc1cIxlOGAJaLe
	4U1DYigkVpxMdHKBmvmfQYaBGXZaxMkMgKu7h4lZvnbdhzPgXo4YUUiTCUkFtQZB6nuOCiSYMYt
	N0du3w/Hfr9S5lGTvisGDYDy9PZwJxGy5dZ6j8gyz9oUsiwCQnJQPbOxid4NiN1DL6grSY8qcw=
	=
X-Google-Smtp-Source: AGHT+IHzVdYixqyHR8b6G5EFMSrmZhJVZpp2peDtXSyWByTozchYUrxZPpYV9SLXnX3gjdalIl1zLA==
X-Received: by 2002:a05:6e02:4414:10b0:3de:119f:5261 with SMTP id e9e14a558f8ab-3de119f54demr131814575ab.3.1750282567942;
        Wed, 18 Jun 2025 14:36:07 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3de019d1ba0sm32296805ab.31.2025.06.18.14.36.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 14:36:07 -0700 (PDT)
Message-ID: <ee095fdd-b3c1-4c41-9b06-a8e3695c1863@linuxfoundation.org>
Date: Wed, 18 Jun 2025 15:36:06 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH] selftests/pidfd: align stack to fix SP alignment
 exception
To: Shuai Xue <xueshuai@linux.alibaba.com>, brauner@kernel.org,
 shuah@kernel.org, will@kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: baolin.wang@linux.alibaba.com, tianruidong@linux.alibaba.com,
 catalin.marinas@arm.com, mark.rutland@arm.com,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20250616050648.58716-1-xueshuai@linux.alibaba.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250616050648.58716-1-xueshuai@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/15/25 23:06, Shuai Xue wrote:
> The pidfd_test fails on the ARM64 platform with the following error:
> 
>      Bail out! pidfd_poll check for premature notification on child thread exec test: Failed
> 
> When exception-trace is enabled, the kernel logs the details:
> 
>      #echo 1 > /proc/sys/debug/exception-trace
>      #dmesg | tail -n 20
>      [48628.713023] pidfd_test[1082142]: unhandled exception: SP Alignment, ESR 0x000000009a000000, SP/PC alignment exception in pidfd_test[400000+4000]
>      [48628.713049] CPU: 21 PID: 1082142 Comm: pidfd_test Kdump: loaded Tainted: G        W   E      6.6.71-3_rc1.al8.aarch64 #1
>      [48628.713051] Hardware name: AlibabaCloud AliServer-Xuanwu2.0AM-1UC1P-5B/AS1111MG1, BIOS 1.2.M1.AL.P.157.00 07/29/2023
>      [48628.713053] pstate: 60001800 (nZCv daif -PAN -UAO -TCO -DIT +SSBS BTYPE=-c)
>      [48628.713055] pc : 0000000000402100
>      [48628.713056] lr : 0000ffff98288f9c
>      [48628.713056] sp : 0000ffffde49daa8
>      [48628.713057] x29: 0000000000000000 x28: 0000000000000000 x27: 0000000000000000
>      [48628.713060] x26: 0000000000000000 x25: 0000000000000000 x24: 0000000000000000
>      [48628.713062] x23: 0000000000000000 x22: 0000000000000000 x21: 0000000000400e80
>      [48628.713065] x20: 0000000000000000 x19: 0000000000402650 x18: 0000000000000000
>      [48628.713067] x17: 00000000004200d8 x16: 0000ffff98288f40 x15: 0000ffffde49b92c
>      [48628.713070] x14: 0000000000000000 x13: 0000000000000000 x12: 0000000000000000
>      [48628.713072] x11: 0000000000001011 x10: 0000000000402100 x9 : 0000000000000010
>      [48628.713074] x8 : 00000000000000dc x7 : 3861616239346564 x6 : 000000000000000a
>      [48628.713077] x5 : 0000ffffde49daa8 x4 : 000000000000000a x3 : 0000ffffde49daa8
>      [48628.713079] x2 : 0000ffffde49dadc x1 : 0000ffffde49daa8 x0 : 0000000000000000
> 
> According to ARM ARM D1.3.10.2 SP alignment checking:
> 
>> When the SP is used as the base address of a calculation, regardless of
>> any offset applied by the instruction, if bits [3:0] of the SP are not
>> 0b0000, there is a misaligned SP.
> 
> To fix it, align the stack with 16 bytes.
> 
> Signed-off-by: Shuai Xue <xueshuai@linux.alibaba.com>
> ---

Assuming this is going through Christian's tree.

Acked-by: Shuah Khan <skhan@linuxfoundation.org>

Let me know if you would like me to pick it up.

thanks,
-- Shuah
