Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 131D51482E7
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 23:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748906553; cv=none; b=YmyY/FuKPQhFTcF9BOhTfcSuBcdqooNVSgXXFLwtSaupsd08xjSdTSDL2LyUF1mruDYD89uvZH+hqTvVMV7X8qkoaWgQwOl3JOlmTp287CUlcm58/z3zAK7bR0Mvxg8jF0Y3O6ThxhPrb+7yT8NopJHJK0d7/B2tAT7tXftOetg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748906553; c=relaxed/simple;
	bh=CfnMNOCbjMEyJoz3Q1bK4Y14uGlSI1+jGpZw9hAUQRo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ubR6XiUHbQ+RVEiDPBSV4W2bHGMF7f4VrbGxZMXx631s7AQkHaOeLXN0p7i+BSpk61mHu/jLPgFX49ETrcW1ps5DUEMBIs9ohLI0tn1lgDWpRSaFnPosxMwEVAo9EOjRZVqFQpADwrLWR01RhZYX/YgvZVx1FWDPCVwfuOUo7gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=APh+fIgZ; arc=none smtp.client-ip=209.85.166.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="APh+fIgZ"
Received: by mail-il1-f182.google.com with SMTP id e9e14a558f8ab-3dc978d5265so15593385ab.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 16:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1748906550; x=1749511350; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qT3wVHWE1rM3dJa7hjPLW9JGzPh24mia4Xa7cI/6U6k=;
        b=APh+fIgZbRaTlMBg0L5hPvD/oK9hS7dThYSeRpST4VS9zDZhxrckC/9rMpjXM6QTGW
         6Ws4lzX+j3sGUxu7c/scW76ocN0qlicnMhFNXpb8knwTQiq8gfZXbfl6dlqmdt62u3B4
         Vz05n4coSIcATKp9hle8EHcOu1n652kuMfBDA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748906550; x=1749511350;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qT3wVHWE1rM3dJa7hjPLW9JGzPh24mia4Xa7cI/6U6k=;
        b=a43MG5LljdETm5TPvLBiPjrXJ1kHb7mOVL/SZnSyn5EtE6yq/aD7KrmK+q5b4kriGS
         Q+aXqYugrptqlQDa9i0dGfoeiPZzijFYJ+GgnqUdHToqhlY9Rs4BHDy5jMVOxo+daYOz
         sqLL/kqayr6REmhm6KyUoofws2n55wjNF/7AEkoWlGgcvWcHCDE08t+8YCQLgxjOyisl
         jLkIsTpX2dfCTZOFq1LG3Hquw5LvjGp/An1m/sbnZ3RjTRC8lUeTKAVsWqiXzXHUCaKt
         XPk1H2bOi87FeeNV//vIBEjRu1GNem3u3ZxqTSz7vAr6offDxeI5cGqR+zzVlI9p+CY8
         YJog==
X-Forwarded-Encrypted: i=1; AJvYcCUXUG6S5mWwM3ML78DjWhCUPgy7nhoOUJqJNxeMoHugPjvQumce8gVWh5grJkGhwgcCwoZZ4hAe9hUEzI4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGrB9q5I9/lFX2tEy6jFfLFHYBlqIbkG47So+cpl6yXP75xQYL
	x4HqSHZC8QclgJhBturd6WQ1Ask08AXh8fWQrEpjBeGrRTJXPjjBtmnXFWWIXw7PIj8=
X-Gm-Gg: ASbGncvjCYIP3/iuZXRurgaWQ743o0x2aphFmqN22tKmdmwD15EJTm/uoa7ffzYR5uB
	WJHIpB6E/n5rlU/dcDlV/BHXyAqZhLvPzMOz8dgZMQS7pF00rcbI4DVIfGow6A5l2wyaTfQ4RsC
	uZH0jHnWWUvfNU2XXw+QZnlxEJx5I9yF9D8dcOrFW0zDmrUx+wyN9I1EGnl5SulBVaJycPMOsiu
	65CrHmiKlEjiP1FMboSOgSAvqrr5fAeups7mBnkwaq62QNhtp74lgvBcLZpgCLqTLxzqMsDAx+v
	EzIfWw/LN5yWE7YagTQg78kpcse2vzBPSFvBEVc7RjaOa6GJQGC9jaLNf1Y3BQ==
X-Google-Smtp-Source: AGHT+IF7uLkYyb2UqK/tGnOiuFb0m76VobbyWvrOenXTHdPcdfk9UTH7o8q1NlmnaIuPiCjJgFHuQg==
X-Received: by 2002:a05:6e02:230a:b0:3dc:5be8:9695 with SMTP id e9e14a558f8ab-3dd9c989d83mr143426925ab.3.1748906550017;
        Mon, 02 Jun 2025 16:22:30 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3dd935a7ad0sm24412105ab.66.2025.06.02.16.22.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Jun 2025 16:22:29 -0700 (PDT)
Message-ID: <c7c071ed-6a4e-4a9c-ba9d-c745fd42c22f@linuxfoundation.org>
Date: Mon, 2 Jun 2025 17:22:28 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests: firmware: Add details in error logging
To: Harshal Wadhwa <embedkari167@gmail.com>
Cc: shuah@kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20250516153955.111815-1-embedkari167@gmail.com>
 <73a4b1c9-44b4-4f06-a766-ea7ed391c578@linuxfoundation.org>
 <CAPCCTVOXHUh7j6Vb=dmnY4wi37f4NMo+Pumuho-sA7jq1iH_fQ@mail.gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <CAPCCTVOXHUh7j6Vb=dmnY4wi37f4NMo+Pumuho-sA7jq1iH_fQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/25/25 12:26, Harshal Wadhwa wrote:
> On Fri, 23 May 2025 at 03:49, Shuah Khan <skhan@linuxfoundation.org> wrote:
>>
>> On 5/16/25 09:39, Harshal wrote:
>>> Specify details in logs of failed cases
>>>
>>> Use die() instead of exit() when write to
>>> sys_path fails
>>
>> Please explain why this change is needed?
>>
>>>
>>> Signed-off-by: Harshal <embedkari167@gmail.com>
>>> ---
>>>    tools/testing/selftests/firmware/fw_namespace.c | 17 +++++++++--------
>>>    1 file changed, 9 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/tools/testing/selftests/firmware/fw_namespace.c b/tools/testing/selftests/firmware/fw_namespace.c
>>> index 04757dc7e546..deff7f57b694 100644
>>> --- a/tools/testing/selftests/firmware/fw_namespace.c
>>> +++ b/tools/testing/selftests/firmware/fw_namespace.c
>>> @@ -38,10 +38,11 @@ static void trigger_fw(const char *fw_name, const char *sys_path)
>>>
>>>        fd = open(sys_path, O_WRONLY);
>>>        if (fd < 0)
>>> -             die("open failed: %s\n",
>>> +             die("open of sys_path failed: %s\n",
>>>                    strerror(errno));
>>>        if (write(fd, fw_name, strlen(fw_name)) != strlen(fw_name))
>>> -             exit(EXIT_FAILURE);
>>> +             die("write to sys_path failed: %s\n",
>>> +                 strerror(errno));
>>
>> Hmm. Wrapper scripts key off of the EXIT_FAILURE - how does
>> the output change with this change?
> 
> In the whole test file, all fail cases uses die() with the specified
> error log and error code, so just wanted to add a error log for this
> fault condition and maintain consistency.

You don't want to make changes to be consistent, especially when
the change alters the behavior - this change changes the results.

thanks,
-- Shuah
