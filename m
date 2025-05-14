Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDAA41F5425
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 19:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747252442; cv=none; b=S7WM+WvwEFghsxTLaIGjREVm/AdFlUE2q7yDkznFGKmQfAHOVrR03R9eW7Gx5V7re4wdoH8MLULokHrGtP0u6huSZaG22yH1BVF1RxUW1iPK2VmHPpU9r3GJluKGfxRk8eGM9yN2DTBU8uWSJ+ccl4h4qFkNa6WG079az6lpmbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747252442; c=relaxed/simple;
	bh=TiuJIqeQPLPdM7MV5DHSFrrCGNzg1U0NfsIusO3DWzw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ceEkb8VQbK8K0S4Da7j6F0PlvnZSw6FCeWPrCdgdDaBCthFjRssr5fSurzjFYyk1btDFmxjcpbJ5o5YHWFmH24nNv2m6trmBxy/R3RZ+6Z9ZQUA/sKSbmZBNZgULxPdww3ajljeelZcC14wRjXjjIqG1NnbJ6wthJJ2kMhCdAXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=do+TrsiD; arc=none smtp.client-ip=209.85.166.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="do+TrsiD"
Received: by mail-io1-f52.google.com with SMTP id ca18e2360f4ac-864a071b44bso3679139f.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 12:53:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1747252438; x=1747857238; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rqFC7XclFM6HmznNg5RpQqMdlIL+E3U4uiILOAOVAFs=;
        b=do+TrsiDxIuLHSLCDwRo/JE8/ze5+EEReEonbbZbZz/uGvGHVHVyIWu53w9onN5QYv
         jbtkur+E+v+F0FFBKxK91FcHL9vellkRsQs4AspsZtKuLh+dyvOAIquM1TVhMNCE+9LJ
         SZ4XzDf4ftBnBNVxaQmEtTop4E2aytebx8JR0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747252438; x=1747857238;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rqFC7XclFM6HmznNg5RpQqMdlIL+E3U4uiILOAOVAFs=;
        b=DMNYQM/Wh1U63nVJvPkxnSls+MYVXH/Bbi88QgWQZd8dA8jBRSegWs/bJGUxliVyQb
         CSEUueLHFbDEg/g4zXYHTMpZgCF72gxBuyJGx97bfefF/+SWZVhL8Ku5MVg/JAO3U+nn
         yO+xfB4llm4iwc2PdK1AneUJ2Aqs87pWy3hyZxnAVPmc0rn9A9Idae3zxTUaxXudr37l
         c4Aw0+JHKyHY6bGer0MrvePBGPWxssQIVy+cWm5Weft6wuZtkkx1ZzwShAaOETvpgvx6
         qj2qm2KMMW3gkc/AiyM5cj5jWPSi/+LeMfKTjENUMj6vhDTrjF65AgITI4bjTEnAo4t4
         GZtw==
X-Forwarded-Encrypted: i=1; AJvYcCXt+KKEwAPAW6KBq/NGXf80utepjdnK0RB51mYDVrU3+OPNj1d2v+diRDgDkiCjzSsy3b5DAPrRy5p+eT4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwedIuQsKxoMUcGKPNCHOwC56N2EUJlNoWHAthCimLVqlEAQioA
	nVcO9yKZhj3k9YVJOyVpDtotd/4HN2UQPymTALDd8etlgORCOHN9bjU/R508YGI=
X-Gm-Gg: ASbGncuVWgiwmHTn/RA1R9zthb1+roh486jm7ugEKzt0EElptWV6mWMb5rb+migpM+h
	m9ZU6s4yTswKHf/ToFWYRo8ds2eIXykevaNXHpJ+J0cKdnLABr9DnvYgQGS6C9Xk2ZUxfKkX1aL
	KxZZuIZYcIWH7uCysejroqxE9Er4jCIbDx+w7bRmh4kLtbHCGeC4qYXMsBpPxgQA5D95h+TG/j4
	XREIEpNzA8R2NmSOzdQ3oZO6fAleNo/vt++dX3F9k/bAas5XBGp3+d21HnEjsSF5Q4Xzf+JL1qz
	4zTZcSVcdkmK1b+B3oOdA0mWp/nm2ik68GGpV8EIQmAvr0TXroqUTO/Dv/HSvw==
X-Google-Smtp-Source: AGHT+IFuhdhs1GZ17AJuuecrmu3II0fZTAN+vGnkqRWbS3S0XvQHj8BZNypViK3Lagb/zZFIppEymQ==
X-Received: by 2002:a05:6602:3a8a:b0:867:6631:d5cb with SMTP id ca18e2360f4ac-86a08dd377bmr647811939f.5.1747252437851;
        Wed, 14 May 2025 12:53:57 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-8676356c768sm291043439f.10.2025.05.14.12.53.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 May 2025 12:53:57 -0700 (PDT)
Message-ID: <53a4d88a-e84d-4cc6-a041-93476f9df75d@linuxfoundation.org>
Date: Wed, 14 May 2025 13:53:56 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tools/powercap: Implement powercap_set_enabled()
To: Suchit K <suchitkarunakaran@gmail.com>
Cc: trenn@suse.com, shuah@kernel.org, jwyatt@redhat.com, jkacur@redhat.com,
 linux-pm@vger.kernel.org, linux-kernel-mentees@lists.linux.dev,
 linux-kernel@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <20250510184709.44935-1-suchitkarunakaran@gmail.com>
 <09c7ad5e-4061-4c0b-b097-fa575c12a244@linuxfoundation.org>
 <CAO9wTFjyEngVR10ixYj=G8udRBeKaxAQquPCdi0V638t3WqQfA@mail.gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <CAO9wTFjyEngVR10ixYj=G8udRBeKaxAQquPCdi0V638t3WqQfA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/13/25 19:20, Suchit K wrote:
> Thanks for the suggestion, Shuah. And I did compile the kernel after
> making the changes.
> 
> 

Please don't top post in kernel patch responses.

> On Wed, 14 May 2025 at 03:33, Shuah Khan <skhan@linuxfoundation.org> wrote:
>>
>> On 5/10/25 12:47, Suchit Karunakaran wrote:
>>> The powercap_set_enabled() function previously returned a dummy value
>>> and was marked with a TODO comment. This patch implements the function
>>> by writing the desired mode (0 or 1) to /sys/class/powercap/intel-rapl/enabled
>>
>> The short summary should say cpupower: Implement powercap_set_enabled()

I am not clear on how this can be used. Can you elaborate on the use-case
for the set?

Send me v2 fixing the change log.

>>>
>>> Signed-off-by: Suchit Karunakaran <suchitkarunakaran@gmail.com>
>>> ---
>>>    tools/power/cpupower/lib/powercap.c | 22 ++++++++++++++++++----
>>>    1 file changed, 18 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/tools/power/cpupower/lib/powercap.c b/tools/power/cpupower/lib/powercap.c
>>> index 94a0c69e55ef..7947b9809239 100644
>>> --- a/tools/power/cpupower/lib/powercap.c
>>> +++ b/tools/power/cpupower/lib/powercap.c
>>> @@ -70,6 +70,22 @@ static int sysfs_get_enabled(char *path, int *mode)
>>>        return ret;
>>>    }
>>>
>>> +static int sysfs_set_enabled(const char *path, int mode)
>>> +{
>>> +     int fd;
>>> +     char buf[2] = { mode ? '1' : '0', '\n' };
>>> +     ssize_t ret;
>>> +
>>> +     fd = open(path, O_WRONLY);
>>> +     if (fd == -1)
>>> +             return -1;
>>> +
>>> +     ret = write(fd, buf, sizeof(buf));
>>> +     close(fd);
>>> +
>>> +     return ret == sizeof(buf) ? 0 : -1;
>>> +}
>>> +
>>>    int powercap_get_enabled(int *mode)
>>>    {
>>>        char path[SYSFS_PATH_MAX] = PATH_TO_POWERCAP "/intel-rapl/enabled";
>>> @@ -77,12 +93,10 @@ int powercap_get_enabled(int *mode)
>>>        return sysfs_get_enabled(path, mode);
>>>    }
>>>
>>> -/*
>>> - * TODO: implement function. Returns dummy 0 for now.
>>> - */
>>>    int powercap_set_enabled(int mode)
>>>    {
>>> -     return 0;
>>> +     char path[SYSFS_PATH_MAX] = PATH_TO_POWERCAP "/intel-rapl/enabled";
>>> +     return sysfs_set_enabled(path, mode);
>>
>> Did you compile this?
>>
>> thanks,
>> -- Shuah

