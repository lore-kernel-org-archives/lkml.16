Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C006F29DB7F
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 23:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744758230; cv=none; b=XXKtWpl5/IzFhYikA9J2S6BvCo9Nid49HjmVvVKxU0cGagnZ+gJX3ClUlsovfMqcR75dcjeZmFB1SkCWesi5+ihFiX30IbnbCIxr5K1ZTSOShcNOSqOAJQBUWpVCxNIrLHvzmq+sfHvBsbGzNvG66Ozpg6i3kjoSPu/rha+1zjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744758230; c=relaxed/simple;
	bh=RkQLs8plGTuvUlQpD4z6Bt6uSx+18zdXjv8PJk5Ra00=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ad9jViXwq5TA4RhRsoErQcwICMnzBB+xkISf5fyA/uwWOXivsuvfPlrnRjqcpBLj+hTrT6UJaLg5Jp1luYBJ3+pV1f0zxTYDt6t/f/0VgKuTDAk2HBmkG1cvDhxclBsQu0JlrwCdphnftRgjQGe9JseFaZhuW97HLOvFczu7BMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=cRKAMnZB; arc=none smtp.client-ip=209.85.166.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="cRKAMnZB"
Received: by mail-io1-f44.google.com with SMTP id ca18e2360f4ac-85b41281b50so176121739f.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 16:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1744758226; x=1745363026; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HLtzUoinmCTRg/YY7Wr14vwtUY7ngISrrQXhsgabO6k=;
        b=cRKAMnZBVb8qewGk7FE1Js2xVVRJ3Joi4ubRFyqavZXh2NdxfVGBsCK4K3pKPRd5mC
         +5xUutzyKw/EREwftsY8NMy0JhVruOmUbnb5oWRt7paKa2qzJy616amh7jVODxzUDSzH
         UWcUFkwJsAevFs2UTunHHtQG785als8tmtDoc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744758226; x=1745363026;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HLtzUoinmCTRg/YY7Wr14vwtUY7ngISrrQXhsgabO6k=;
        b=vTiKFJrWZAbluY8J9lcCeddgOseSZIowlr677PMVO0mWRykL3ZR0yXecoHXxaDpscj
         blyt58MFd+d4UJW2t5z0rTRoLcc6AsX3UCwuYekTPC94fvSFPajqhyc56OKJP5iTDNSt
         UULeYGs7WTOFgxvhDWVHUhdOZvJjxtcWiF6yYahq/krmEtmIDmUwDnCjje72F3LMXNhI
         VUFrily4OnBGyQ1919klQBkXIz9NJJP5IfUyTBZ3q6auZlfh/rDqTPLqFu8Z48/l+q+P
         s3LQRJwjo1/Z21AxRSI9+JeMYSIhZBDaWVkNL3I3vJiz8bYOXz4ac6cHX8LITuJkLHiy
         0JnQ==
X-Gm-Message-State: AOJu0YzOCpXkOHqt635Isz6tbaXgfqYTZX4vP+o/TE0S9O0wZs2/CAbR
	Xv6gv886XDEQyxXmUIJ05VPYdjdBb0TgXbvzfFfSSNfJ5ki9FltK9GySgulZuXw=
X-Gm-Gg: ASbGncuT46gcyN8+UdvYg/3aEdOSYGm1AeAsmcvLQ/XGNTA9Od4CMP6U2bS+smp3J3m
	1phuLIiIWK+r9r6vGhM3IqmfqyF5JO6kUWdat/hxTufS4hwtAeljAbelHPKk89PpbjZZnaolxim
	SptVTVvZRA9X3lfC6R7ZUtymem1RVV6m2D7aMRe5QIbRLcAUeh5qwfWHKfwFGJInA2X+TrpA/N6
	IwGk3FKwnZObn6PIeu4inWU1QvFdrHPkEzsEVE9oVwUiYoS3UgOfXjdPNvZ2M5zX45dl5pfF49I
	n3sCn6c4bkuBuHtBIng8jWKqWMMKlhsICclwhbpe6hJCPEAnzPk=
X-Google-Smtp-Source: AGHT+IEaQK9ACTBp4v/WNl75tUwR4darm0GTMobrZuIgjTZw8Z0T7gU4A8rMAO1vHodWxi9Nxm1a/w==
X-Received: by 2002:a05:6602:3789:b0:85b:41cc:f709 with SMTP id ca18e2360f4ac-861bfcfa944mr162858439f.14.1744758225819;
        Tue, 15 Apr 2025 16:03:45 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-8616522c958sm271806039f.6.2025.04.15.16.03.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 16:03:45 -0700 (PDT)
Message-ID: <658670d0-086b-49e9-85ac-3e002fa8322b@linuxfoundation.org>
Date: Tue, 15 Apr 2025 17:03:44 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests/ftrace: Differentiate bash and dash in
 dynevent_limitations.tc
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Linux Trace Kernel <linux-trace-kernel@vger.kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Mark Rutland <mark.rutland@arm.com>, Mark Brown <broonie@kernel.org>,
 linux-kselftest@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <20250414210900.4de5e8b9@gandalf.local.home>
 <20250416075832.cd27bcb52b7e31d0f5717273@kernel.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250416075832.cd27bcb52b7e31d0f5717273@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/15/25 16:58, Masami Hiramatsu (Google) wrote:
> On Mon, 14 Apr 2025 21:09:00 -0400
> Steven Rostedt <rostedt@goodmis.org> wrote:
> 
>> From: Steven Rostedt <rostedt@goodmis.org>
>>
>> bash and dash evaluate variables differently.
>> dash will evaluate '\\' every time it is read whereas bash does not.
>>
>>    TEST_STRING="$TEST_STRING \\$i"
>>    echo $TEST_STRING
>>
>> With i=123
>> On bash, that will print "\123"
>> but on dash, that will print the escape sequence of \123 as the \ will be
>> interpreted again in the echo.
>>
>> The dynevent_limitations.tc test created a very large list of arguments to
>> test the maximum number of arguments to pass to the dynamic events file.
>> It had a loop of:
>>
>>     TEST_STRING=$1
>>     # Acceptable
>>     for i in `seq 1 $MAX_ARGS`; do
>>       TEST_STRING="$TEST_STRING \\$i"
>>     done
>>     echo "$TEST_STRING" >> dynamic_events
>>
>> This worked fine on bash, but when run on dash it failed.
>>
>> This was due to dash interpreting the "\\$i" twice. Once when it was
>> assigned to TEST_STRING and a second time with the echo $TEST_STRING.
>>
>> bash does not process the backslash more than the first time.
>>
>> To solve this, assign a double backslash to a variable "bs" and then echo
>> it to "ts". If "ts" changes, it is dash, if not, it is bash. Then update
>> "bs" accordingly, and use that to assign TEST_STRING.
>>
>> Now this could possibly just check if "$BASH" is defined or not, but this
>> is testing if the issue exists and not just which shell is being used.
>>
> 
> Thanks for fixing this issue!
> 
> Acked-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
> 

Steve, do you want me to pick this up for rc3?

thanks,
-- Shuah
