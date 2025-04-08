Received: from mail-io1-f53.google.com (mail-io1-f53.google.com [209.85.166.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 957102063FA
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 23:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744156484; cv=none; b=M/jjkuWaBKZF6xMNgtPcQHw1IYWfRuvfCK/1ysXku0sJhbvpjZiSz211+0qPVoVBEjzSzTARyM/lVTZBKK3yWytCvgCMGkfolOy+p71JmM5NBC20b75do1gjVtxftBM2xrXkiaXQ0iT8n/xwzzJhbSf5q2BegiAwwxp8nI28GcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744156484; c=relaxed/simple;
	bh=Jnx6PKKzCvL4p4g+uO/ftLP/ihvxn+++kI74c7ySLPY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CJHdM9IS0hCnh0dCBiNlX9GvBvTCgf8wQkYAnN531fPcFkPRMRE09Qzp4nuZTsO/21GUYqOvnS2F9O0nOHHp4x69Fk6sHI+7flC2m9CHMK7qhrOf96LjKdnpfKjaWdcaR8OerZnAvkrpSIzmf5wPHdMIiHeitb5w3u75b482GgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=EWnaf/Pb; arc=none smtp.client-ip=209.85.166.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="EWnaf/Pb"
Received: by mail-io1-f53.google.com with SMTP id ca18e2360f4ac-85e15dc801aso477769339f.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 16:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1744156482; x=1744761282; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zdRyBtliQ5cx07mISx4wCHyn5iramOMcxVolUqi92Io=;
        b=EWnaf/Pb3MSptvFZEI8UxFFuRxYNH5CGkmxyuX7pE5cOl3n0/7rCAKI33/eeZXVAdU
         7PQzwRj820+cJkV5KWuu/UgAOcppx3X4dUArRntVSPW+c5gyQTlFSyj7Ywg0TCVkGZOl
         2AjTKSAmNTmPhiQXqpsYQbnrDaEdgCE9lRigk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744156482; x=1744761282;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zdRyBtliQ5cx07mISx4wCHyn5iramOMcxVolUqi92Io=;
        b=i4I/NZzioh3hHfuKODKHAfDioxE6dXvl26R8NqXsGOhJKpzyGj/Pjk03/4bhwRLJkB
         qIrP5hIqU2zijySy8BRCCtw4+k+U0CKddxc29+BXEyw5kGHbb7OyRdo5NQXqZMzG9g2w
         GpyIUKVC7hFcbxrMMvZZbg0sDAL6lNVdTrkj576/2O7G+aFYpDxgDTSHtay7tpzZM3fJ
         s2EholGDF1NNidctmOxsj+Gnj+e0Z9H3jq7wm8aGKmXdwuZ5KaGg3hnhh/8l3stNubmg
         bvT/DjYRgpOwSr0Chp8CRRG+uz2PZItfma8jap4Lfa7FAmTbdKm0mDeZUfIHFL9OyXqN
         QIUA==
X-Forwarded-Encrypted: i=1; AJvYcCXBuCqgczNpJ7ymbzsyD+m95oeUD8QrMafaxWn3XjIwMEXJcjyQYQakvJUzA5S6iJ11fxZtJa1uTcHEvYA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYQjBUtldvhQqPbSjnPhPw3smtYFV2WSWEvTUJlb08XDqy7rQm
	FtTOq6PgntrV1FydMuTVo+0QileBgfAnG5aV1yu/x96/mj2kLe2nNIIa+P+hgvQ=
X-Gm-Gg: ASbGncuhNK80/7eDHDAZDA/zEGT8qI1VAkhYG628J8sfnoYyxNTxaKQJKfHTz+eowwh
	JW23bvR2Wo+95mRoD0QjeO2SC8k7i4xEf4QWdiVXMAPnJQ2xFkx/EtMHRjsFqp8hpbrC+uTZnXG
	PBDLsUtMSwtiWWKt+9xH+zntkkjgDuuZLmH5oJhLFfORt+YhKAeEUmXuNUh4TbXPKuuHUcEbh4O
	4kpqzzyG/k1eEW0Ey2zhxzlBXgDHYggr6DHvmrSz9Wb4u7tWXmkFecq1JJuShbTwScRZ7aVGiio
	iyn+O5tmnxjlv4y/1NPHiUmSVRwjXrDbIh1Bos2K8VArxS1IYQRC1jk=
X-Google-Smtp-Source: AGHT+IHrbk9mfKXAQeL9/yafdcqMUAyL8vOKCLUsGKcMZRbOPlFSarz6cufkOxtG6i0ALC59RzlGtw==
X-Received: by 2002:a05:6602:720e:b0:85b:3dcd:d8c0 with SMTP id ca18e2360f4ac-8616128f2f0mr132204539f.12.1744156481759;
        Tue, 08 Apr 2025 16:54:41 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f4f43bda91sm746758173.27.2025.04.08.16.54.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Apr 2025 16:54:41 -0700 (PDT)
Message-ID: <dae94ac2-63d7-419c-9bec-bea0840ea534@linuxfoundation.org>
Date: Tue, 8 Apr 2025 17:54:40 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] selftests/ptrace/get_syscall_info: fix for MIPS n32
To: "Maciej W. Rozycki" <macro@orcam.me.uk>, "Dmitry V. Levin" <ldv@strace.io>
Cc: Shuah Khan <shuah@kernel.org>, Oleg Nesterov <oleg@redhat.com>,
 strace-devel@lists.strace.io, linux-kselftest@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20250115233747.GA28541@strace.io>
 <0262acf1-4d3f-471b-bd56-4ddf8a2bc1a3@linuxfoundation.org>
 <20250329124856.GA1356@strace.io>
 <alpine.DEB.2.21.2503291345580.47733@angie.orcam.me.uk>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <alpine.DEB.2.21.2503291345580.47733@angie.orcam.me.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/29/25 08:02, Maciej W. Rozycki wrote:
> On Sat, 29 Mar 2025, Dmitry V. Levin wrote:
> 
>>>> +#if defined(_MIPS_SIM) && _MIPS_SIM == _MIPS_SIM_NABI32
>>>> +/*
>>>> + * MIPS N32 is the only architecture where __kernel_ulong_t
>>>> + * does not match the bitness of syscall arguments.
>>>> + */
>>>> +typedef unsigned long long kernel_ulong_t;
>>>> +#else
>>>> +typedef __kernel_ulong_t kernel_ulong_t;
>>>> +#endif
>>>> +
>>>
>>> What's the reason for adding these typedefs? checkpatch should
>>> have warned you about adding new typedefs.
>>>
>>> Also this introduces kernel_ulong_t in user-space test code.
>>> Something to avoid.
>>
>> There has to be a new type for this test, and the natural way to do this
>> is to use typedef.  The alternative would be to #define kernel_ulong_t
>> which is ugly.  By the way, there are quite a few typedefs in selftests,
>> and there seems to be given no rationale why adding new types in selftests
>> is a bad idea.
> 

It causes problems down the road for maintenance. I would rather not
see these types of kernel typedefs added to user-space.

>   FWIW I agree, and I fail to see a reason why this would be a problem in a
> standalone test program where the typedef does not propagate anywhere.
> 
>   The only potential issue I can identify would be a namespace clash, so
> perhaps the new type could have a name prefix specific to the test, but it
> doesn't appear to me a widespread practice across our selftests and then
> `kernel_' ought to be pretty safe against ISO C or POSIX, so perhaps let's
> leave the things alone?
> 

Can't this be solved with ifdef?

thanks,
-- Shuah
