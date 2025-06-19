Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D9EC5661
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 17:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750352430; cv=none; b=ksimiaw9YsMMeYD+ec2ibQBnS6ZTRq1kMPdRL1ErPKXbJ/jaZrUor8giWtlXcFawJX2wR8WnFhQ16C5IZUisg9LdAscTlb2W3WXsAEvi29NQkXgDrdyIH2oqyvQB42j1SvnMwzBBh9ws7nQpNZf54NIfggm2E8vGzXdDFU5c658=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750352430; c=relaxed/simple;
	bh=uPybVpLsIsMyFgfJdsImZ2N7HnQRhF+PVpjFAbF0Dzk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WiqqjfBx3tIwSb2R+p343qGUWsJbhXNcXyeuhp8pqGvbeF/UNo3YVNgcZwHfGVjrxlXv9HYQ+ozdZZz4KT7VTMuSvo58Yn2HF4dTve5HW5I0A7R5fq20TxeHMDJtetzLBQfY/CKCeTt20ZYgr5HsaPTdA21YCPhycrXH3kzq4Sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=GV3hR97K; arc=none smtp.client-ip=209.85.166.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="GV3hR97K"
Received: by mail-io1-f41.google.com with SMTP id ca18e2360f4ac-86d029e2bdeso28808739f.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 10:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1750352428; x=1750957228; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BrGR3A/MzTERsKAHEw5tuDyqCBHYEq2BNnp9hGfCb0Y=;
        b=GV3hR97KJYz48LgCEknWrm+L+ioqmHzsT7sMetKitDm6jJ0ewbfisCF5HBftFpHHIk
         pTz432MJEqm9gboW0w085PsP0pR+Qy6aLoaZI44k8ElISfJjWXFDk+JfakNIJaQZxReU
         WNBgDO5oWMKb4/fJUY6zawbAlAW1I+hS4gCdA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750352428; x=1750957228;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BrGR3A/MzTERsKAHEw5tuDyqCBHYEq2BNnp9hGfCb0Y=;
        b=cSabY9lHCB7izT4rqlgmzh68OmFUVM8/GNp5j0KBc8lkxfkUv+DaFK/0kl7N00o2II
         +4qxl3NYGU/JZg72WvEwPPE2yqTxj36Y5BqZO1bbBjeACk8+L9+PBRm/SOBob5VHX6Yj
         0yUeka4CAeOm2g+EnczAA+Z+TF3FSa8mM1T1nohruObknYzq1mYLEuWQlIP5t+OEwnH6
         7svyTK9XCALafGwrcRu2rfrbSAsEFr+txaGl0Ncaw+iwnGqhtB9r/1uEjbS7Ba5qY4i/
         g5jeTR+qIe/XUb/XupHHKmt05OtdEs7fbXfZICl/In5umKyshaz8YpxG5uJYKBZX3k4b
         759A==
X-Forwarded-Encrypted: i=1; AJvYcCULJQsu7gpEs/T1leWiHR4M71bkIyHyGQqiAmYlZjiOctZgD4wzpA36Yjzdo7h/E5N3vQq+ESsSkvBPLH4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyOs4dvcpaA1m+uslKhTS4551zA6GdIIG84q9r2VnZeN8qBZ8KA
	dwdrymlDz4EZQ7cDj7nk6bQmZ2wXkALHmdoz4qb/hTzp2K4JlFATXMb5e3MSqS8y6e0=
X-Gm-Gg: ASbGncvM+D8S+/+NvK8TQUwO8WA8wqX8E2A4KPiZAATgtqOQFVjv/BYH42Bw7qq7raz
	4GAvqUbmLklbnruqeCdrrTCah0/mZZT9k+9QbOus4sl3yvQQHpu7NbZpLY5BR73U5MqApOgJE54
	Wbn6MISlIIweh6r9oo5DgwddwEf7zKsAczyztp5K0GGeV4WPS26N5gk/3FGHHlPfhDw6GNUiK7F
	4jSKhfSR54nAlwIoBb8wAyogLOIsXh6VrfCC3zNEPdRPUlF9JayBPnluJIyPlBJGjdsusIEpUYB
	YcgzWS6N2hlEK9hlT7mHk0bAZB9nV7Qv8lxbSJer3m9pnKYh5FExbsLvXkGE99tMb7dZPlT7KA=
	=
X-Google-Smtp-Source: AGHT+IFxdRrSy/zh8FxTysdpmdEMQQKEznUBpGiYumC8QbbatcxTKtl5mzopCeH8zCCCO6iYvZa4RA==
X-Received: by 2002:a05:6602:6426:b0:85e:73da:c56a with SMTP id ca18e2360f4ac-8761b782975mr392275039f.3.1750352427918;
        Thu, 19 Jun 2025 10:00:27 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5019deef1c6sm52140173.35.2025.06.19.10.00.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jun 2025 10:00:27 -0700 (PDT)
Message-ID: <265ebc1f-b0c0-4c57-92b2-41714469c7f5@linuxfoundation.org>
Date: Thu, 19 Jun 2025 11:00:25 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] selftests: Suppress unused variable warning
To: Chen Linxuan <chenlinxuan@uniontech.com>
Cc: Shuah Khan <shuah@kernel.org>, Christian Brauner <brauner@kernel.org>,
 Amir Goldstein <amir73il@gmail.com>, John Hubbard <jhubbard@nvidia.com>,
 Miklos Szeredi <mszeredi@redhat.com>, Jan Kara <jack@suse.cz>,
 zhanjun@uniontech.com, niecheng1@uniontech.com,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20250610020758.2798787-2-chenlinxuan@uniontech.com>
 <6972404e-0237-47b9-8e3e-15551bea3440@linuxfoundation.org>
 <CAC1kPDPg0AN9Ft3SNM6JDcZf=XD1oinqeAMzuRpZF3nzemZ=Kg@mail.gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <CAC1kPDPg0AN9Ft3SNM6JDcZf=XD1oinqeAMzuRpZF3nzemZ=Kg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/19/25 01:46, Chen Linxuan wrote:
> On Thu, Jun 19, 2025 at 5:23 AM Shuah Khan <skhan@linuxfoundation.org> wrote:
>>
>> On 6/9/25 20:07, Chen Linxuan wrote:
>>> When running `make kselftest`, the following compilation warning was encountered:
>>>
>>> mount-notify_test.c: In function ‘fanotify_rmdir’:
>>> mount-notify_test.c:490:17: warning: ignoring return value of ‘chdir’ declared with attribute ‘warn_unused_result’ [-Wunused-result]
>>>     490 |                 chdir("/");
>>>         |                 ^~~~~~~~~~
>>>
>>> This patch addresses the warning by
>>> explicitly suppressing the unused result of the `chdir` function.
>>>
>>> Signed-off-by: Chen Linxuan <chenlinxuan@uniontech.com>
>>> ---
>>>    .../selftests/filesystems/mount-notify/mount-notify_test.c    | 4 +++-
>>>    1 file changed, 3 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/tools/testing/selftests/filesystems/mount-notify/mount-notify_test.c b/tools/testing/selftests/filesystems/mount-notify/mount-notify_test.c
>>> index 63ce708d93ed0..34afe27b7978f 100644
>>> --- a/tools/testing/selftests/filesystems/mount-notify/mount-notify_test.c
>>> +++ b/tools/testing/selftests/filesystems/mount-notify/mount-notify_test.c
>>> @@ -465,7 +465,9 @@ TEST_F(fanotify, rmdir)
>>>        ASSERT_GE(ret, 0);
>>>
>>>        if (ret == 0) {
>>> -             chdir("/");
>>> +             // Suppress -Wunused-result
>>> +             // Ref: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=66425#c34
>>> +             (void) !chdir("/");
>>>> Why not fix the problem the right way by checking the return value.
>> Suppressing the error isn't useful.
> 
> The code is already handling cleanup in error cases,
> and I don't think checking the result of chdir would be useful here.

We check for chdir() in several tools in the kernel. Add a check for
it instead of suppressing the [-Wunused-result] - suppressing doesn't
do any good.

thanks,
-- Shuah


