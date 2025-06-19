Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA51D25EFB6
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 21:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750369251; cv=none; b=qsnh9VbiBw02IYqJ8v+tyjU8karhkz/m7DxqTmRtsqpQXdDmh3Hij/I5o+JkNRpFGPBZ/v11CozW7k1oxs+9hYwQu9nvRBNZgx2cySB9ikB0iQJA79RdnOdQ5CE2eBmlKX+ZNWuZKTjesr7ghDEJRyZ6bVtznw8go3JiUkYb5FI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750369251; c=relaxed/simple;
	bh=RFA/yqyQSPUwwdKTZXol6d3OW7IQQFMuZJNDfgY1kfQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p2nxEPbtu03ST3vimX+aOaz60xkEik09+w5LOUwFk2tE0hwHACSVdMMR7hYedcMcxAt65P8p6Femiaed9M0Lhe8975q8S5RZ7r40i1TTIlq4M/uGslXpnru/0lbpDRPiPrReu7opB01xtK9dXOT7AxH2+e6uEF19DwvxEmMrfto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=AoDdS7dl; arc=none smtp.client-ip=209.85.166.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="AoDdS7dl"
Received: by mail-il1-f181.google.com with SMTP id e9e14a558f8ab-3dda399db09so11868795ab.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 14:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1750369249; x=1750974049; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2Y3x5oxeT4WtdtCLyQVGKYtv/Q4EkmPLsDdHFSt8usc=;
        b=AoDdS7dlAi3H+KHslgrptqS7gKW9PLNuEIaZoxi5uPR+r+Wxq3pIGaoD8QrdCJ8lhY
         ul8ebb7udWhnXCYx/oOvYXk56hdREeE84q7nv0J+J9ULx8ycbWeZ0T/9Vlt/t7g1MN3s
         OkIDMUKt80Op+5nQk5DgfK5Kt+3W0bPjIdEdU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750369249; x=1750974049;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2Y3x5oxeT4WtdtCLyQVGKYtv/Q4EkmPLsDdHFSt8usc=;
        b=M9BkBG3SumnTDoIytHpCLg4uSVBXM6GpDHeaa2sdpH3a++t5e0fLOtsnMfEc+eeMOQ
         I8uszaXbH8fXsTMXLAOUfvxmXtAGdZp+cafmZOazFJH1kmfJqPYMJvg8DWm+7lL3FMpq
         ZLODJPVRLsc9YtaKURUn8T4WNLVxxNxZIXI7DPKKjCbbNCS2xlivkUMnZtsXqEO1VFYU
         1twQCW7UF/xbeAB+HdbewRZMjtxHVk67wlRmy+ohdKGVHu8+rsOA6aVngX9DbWFGDRQd
         x3lpK9BiPfB3n+qyZcc8XnkuvoG7SlG0FzNORW+HnViKNEnlJjP7uwkVSWwTNXLqx7iw
         9lPA==
X-Forwarded-Encrypted: i=1; AJvYcCXWyELGUpUF8sqoOMXfekzo0MQx+Mgqm44DyfasL2j44a6ivtzwP/H4o7bx73QnmXQkRj9hcL956oS0SvI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxucJl6LfEZ1ehP0aCSA/BI57WzCdwxroG/R159FgvpqMbEzeHW
	FJ/FAGujKObT6Ow7NbvRS7G7scmks+WPUGorzYbIefcStlimLHo0o/9BEduYbCfHbRI=
X-Gm-Gg: ASbGnctfrBtSXIP2oUsAhjr9Et5GOzu7gFwSYwOdO0oiDfSFG4tUrhMoy5E3MblZCHT
	RPaRYP9gQDJmYlxBJCy1uEYSegmiZIWGJUFdGqr0NgNq4612FvOdj/Cvq+UnWqkjFzEA3gMOndK
	JoIgUf62oqOPVpb3Q+Q0hc1IoP5hJwpCrZyE4/ZLhJIDNWQMPZqQcnkNXEmpiRfeHjCkYCdgl7X
	VFL+eboDzgojBHqTAbZAO2Fn5GzW3SBJxmJrkfdW645EUyWi//a7nEpZ44H+QaP8cjovaCZeuL6
	0Z/xgCoXOTPNGw6IJ9jrJ4loEoSJwhuNGLdkk7nlFVfwirxHic3QAfm5K48KalX0Z0r/K8b4qQ=
	=
X-Google-Smtp-Source: AGHT+IGCXQ0P0NRFh7ydIGTlbS1aQeIfIQv8CbB2DliU8PwpYPDyu20ZGQPmw1y1tzyBgx1cTN0BZg==
X-Received: by 2002:a05:6e02:3f05:b0:3de:12ff:3604 with SMTP id e9e14a558f8ab-3de38cc9db5mr5134765ab.19.1750369248697;
        Thu, 19 Jun 2025 14:40:48 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5019e04e4bbsm141990173.70.2025.06.19.14.40.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jun 2025 14:40:48 -0700 (PDT)
Message-ID: <f73fa51e-87e5-4805-bbbc-a7af9b50a1d8@linuxfoundation.org>
Date: Thu, 19 Jun 2025 15:40:46 -0600
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
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <91817e12-54c4-4241-b895-2e452a00e0c4@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/19/25 13:00, John Hubbard wrote:
> On 6/19/25 10:00 AM, Shuah Khan wrote:
>> On 6/19/25 01:46, Chen Linxuan wrote:
>>> On Thu, Jun 19, 2025 at 5:23 AM Shuah Khan <skhan@linuxfoundation.org> wrote:
>>>> On 6/9/25 20:07, Chen Linxuan wrote:
> ...
>>>>> diff --git a/tools/testing/selftests/filesystems/mount-notify/mount- notify_test.c b/tools/testing/selftests/filesystems/mount-notify/ mount-notify_test.c
>>>>> index 63ce708d93ed0..34afe27b7978f 100644
>>>>> --- a/tools/testing/selftests/filesystems/mount-notify/mount- notify_test.c
>>>>> +++ b/tools/testing/selftests/filesystems/mount-notify/mount- notify_test.c
>>>>> @@ -465,7 +465,9 @@ TEST_F(fanotify, rmdir)
>>>>>        ASSERT_GE(ret, 0);
>>>>>
>>>>>        if (ret == 0) {
>>>>> -             chdir("/");
>>>>> +             // Suppress -Wunused-result
>>>>> +             // Ref: https://gcc.gnu.org/bugzilla/show_bug.cgi? id=66425#c34
>>>>> +             (void) !chdir("/");
> 
> This is quite ugly. :)
> 
>>>>>> Why not fix the problem the right way by checking the return value.
>>>> Suppressing the error isn't useful.
>>>
>>> The code is already handling cleanup in error cases,
>>> and I don't think checking the result of chdir would be useful here.
>>
> 
> Why not just fail with the appropriate test result, if chdir() fails
> here, instead of making a bit of a mess with odd void casts to a
> negated return value, and a reference to a compiler bug report?
> 
> Really, Shuah is putting you on the right path here.

Ha. I didn't ask to suppress the error with the cast. I asked
to check the return and fail.

> 
>> We check for chdir() in several tools in the kernel. Add a check for
>> it instead of suppressing the [-Wunused-result] - suppressing doesn't
>> do any good.

This is what I said.

thanks,
-- Shuah
