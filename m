Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94FE230E852
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 21:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750369425; cv=none; b=oSSLNyT+LdLpFcv+ssYD29aJ7NmV+20ePeMf6eerCFIxvs0yAp4zBknBcxYb3WXhsQguRNSM424ECwxVlp5IkkFmPtiFA22IP5BEzKYUJ20Gz3K754sUvhOdBrzT24mRdbl8EB3VoZlCn1IvDBxDRTzn4oy5m2ZWh6gAEfR6IrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750369425; c=relaxed/simple;
	bh=a8LYviNq9YTYBcBCE7EKNDp6/+znT0swyLSfViL3a+M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qqoRZWV+P/dDRXfP4GSnyR1L6bXmjDJ4Hs9iFVitwm9rKjrbXz0jDddQFdpiJvGOi8fu0NGXmrLQugFo6MqSMp+c4blfno7BqR9ul/+eh8RK+QaBv/CVQcBJm2IjffITPf/Mom0vn0fq0zhyJj+vfEZnMjNZj9mSRDWQXDiWO9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Z5to+WTx; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Z5to+WTx"
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-72c09f8369cso353130a34.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 14:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1750369422; x=1750974222; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TtdWcZD9H9MU+GvH5qLxp8IIrliybyOXwnsM3fxu7b8=;
        b=Z5to+WTx7TU+LsGOSauXJtjocY7EQwJangRlopFX02fqKnFuQIFrBEdW01cMxHDchu
         /oHmhoHvLdpVZAfSyoNh+uDK7PWjsM5id6rRYo/IPRUr6X7bw1IK5sbLpWTM3eA4ZFWs
         qOMHCfzj3r1Ws1UkyUz3b3vD0tniep+uaYyDk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750369422; x=1750974222;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TtdWcZD9H9MU+GvH5qLxp8IIrliybyOXwnsM3fxu7b8=;
        b=Z4+Vt//xIHsIFdIyA2p3Izww9qWSJoGSqYkcG66qgsPufdO9KIntdjFNJlD7SP1InF
         WGbJX2QGtVL3FgCl06/LZd7JmADFMYeCzRxRagWiBrxSY/4zvAZ8VTkGkoVvQ92qm25Y
         vOxxRci66PD8PE9vm7YuEjmu/XqzUjwlRUwobBGxzjfW/xHKzSA5hg9qvv9Lf+JyTdDS
         vUOkYKL88Fy4DmzQjjn4J3qzUymPvlLM932VfSkBVtnAou8FV1/5MuJFJOldKKLk4CKi
         DpPg7q7ds/bXzwWXYq4r2k/lOujzG917d6wvxK3wMCI3UFHY8k2w7uSxpT5qrDWP7wim
         Ds6g==
X-Forwarded-Encrypted: i=1; AJvYcCXgroo7lmG+BlFN6s7Qk4LSg38pJlZ6wFNC5xR8Qxdk5ez6GYZQf0Lz5IamvsS01AQrVEjgfTVpPXLgCtI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyeaEaNwsM+Vhy2ISCXpPFNBrRuagypaur7pj3ycyrEZkRGXZZU
	pyJpewewv4yuEHHXI2nKicBHWfvy0h6D140kw3MKZX9gFRht6R6bgfdVwP2bCSmtM4o=
X-Gm-Gg: ASbGncsUoodcUKoZtOjHh4VxCW7Lev6tOcTraOddTREnu1IiwzTPHVdy/6OvPzLAlVQ
	2UNwI9wiS+Ug6fUu5eVhBi0oFrgETUxhdr1CtCY3pupqWsk++DuQFkMEITPXs256F5yET0W8/22
	mvSTxfpcLi+TftcDtKy2IJL8WJ+uXOzWYZW89ypHeheoTqPyZzUdoA1/0lYhe7aGWCF40a0lAVg
	eKOb/7+rgMLy1hhdWhUXw3ERc6ALSw75KiI4vgbjJj6gTth0yrL3h+N0h6Y9BUt7+2cdEmNxoKg
	wIU8Lk6ClR6OnWyN+6ZgI7v9si1gYpJ1gr3j6k3+g2mfZxKl3qhZllj4JUXyrVqH8RVtffnUSQ=
	=
X-Google-Smtp-Source: AGHT+IG3zun6seWH0e2DDXaQTs69ENPXpIXcFxWPe0R6l6nMcNZ0CpLymICDCoYf5D5y3PDwuid1/w==
X-Received: by 2002:a05:6830:3e95:b0:72b:7cc8:422 with SMTP id 46e09a7af769-73a91d4be8fmr149617a34.20.1750369422633;
        Thu, 19 Jun 2025 14:43:42 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73a90ca8712sm77065a34.45.2025.06.19.14.43.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jun 2025 14:43:42 -0700 (PDT)
Message-ID: <4d625aaf-5c8c-4097-897e-a6ebb469c183@linuxfoundation.org>
Date: Thu, 19 Jun 2025 15:43:40 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] selftests: Suppress unused variable warning
To: John Hubbard <jhubbard@nvidia.com>,
 Chen Linxuan <chenlinxuan@uniontech.com>
Cc: Shuah Khan <shuah@kernel.org>, Christian Brauner <brauner@kernel.org>,
 Amir Goldstein <amir73il@gmail.com>, Miklos Szeredi <mszeredi@redhat.com>,
 Jan Kara <jack@suse.cz>, zhanjun@uniontech.com, niecheng1@uniontech.com,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20250610020758.2798787-2-chenlinxuan@uniontech.com>
 <6972404e-0237-47b9-8e3e-15551bea3440@linuxfoundation.org>
 <CAC1kPDPg0AN9Ft3SNM6JDcZf=XD1oinqeAMzuRpZF3nzemZ=Kg@mail.gmail.com>
 <265ebc1f-b0c0-4c57-92b2-41714469c7f5@linuxfoundation.org>
 <91817e12-54c4-4241-b895-2e452a00e0c4@nvidia.com>
 <f73fa51e-87e5-4805-bbbc-a7af9b50a1d8@linuxfoundation.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <f73fa51e-87e5-4805-bbbc-a7af9b50a1d8@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/19/25 15:40, Shuah Khan wrote:
> On 6/19/25 13:00, John Hubbard wrote:
>> On 6/19/25 10:00 AM, Shuah Khan wrote:
>>> On 6/19/25 01:46, Chen Linxuan wrote:
>>>> On Thu, Jun 19, 2025 at 5:23 AM Shuah Khan <skhan@linuxfoundation.org> wrote:
>>>>> On 6/9/25 20:07, Chen Linxuan wrote:
>> ...
>>>>>> diff --git a/tools/testing/selftests/filesystems/mount-notify/mount- notify_test.c b/tools/testing/selftests/filesystems/mount-notify/ mount-notify_test.c
>>>>>> index 63ce708d93ed0..34afe27b7978f 100644
>>>>>> --- a/tools/testing/selftests/filesystems/mount-notify/mount- notify_test.c
>>>>>> +++ b/tools/testing/selftests/filesystems/mount-notify/mount- notify_test.c
>>>>>> @@ -465,7 +465,9 @@ TEST_F(fanotify, rmdir)
>>>>>>        ASSERT_GE(ret, 0);
>>>>>>
>>>>>>        if (ret == 0) {
>>>>>> -             chdir("/");
>>>>>> +             // Suppress -Wunused-result
>>>>>> +             // Ref: https://gcc.gnu.org/bugzilla/show_bug.cgi? id=66425#c34
>>>>>> +             (void) !chdir("/");
>>
>> This is quite ugly. :)
>>
>>>>>>> Why not fix the problem the right way by checking the return value.
>>>>> Suppressing the error isn't useful.
>>>>
>>>> The code is already handling cleanup in error cases,
>>>> and I don't think checking the result of chdir would be useful here.
>>>
>>
>> Why not just fail with the appropriate test result, if chdir() fails
>> here, instead of making a bit of a mess with odd void casts to a
>> negated return value, and a reference to a compiler bug report?
>>
>> Really, Shuah is putting you on the right path here.
> 
> Ha. I didn't ask to suppress the error with the cast. I asked
> to check the return and fail.
> 
>>

Sorry John. I didn't read it correctly the first time.
I probably go get more coffee. :)

thanks,
-- Shuah


