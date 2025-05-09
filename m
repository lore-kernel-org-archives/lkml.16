Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 810582405E4
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 18:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746816808; cv=none; b=i46qiukOVtjblczAGuW88jtfgTF7r2zO/uydL4KiyzxovXXgArg0SiYvBSyOzlju5bnmw/TlLOAJKWGY/niNgQjObi/74N/X+9EZgl5mQHwBc/ahnc8/12hZs7RLaEt7we4di5SJcbv6AQSLuwCiTWElGuotYz6FwwhIIFtGrv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746816808; c=relaxed/simple;
	bh=pPb2yux8ncMb3CZqonAlRHIcg/L3bixa1GCZYae4d+g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FCJP07nv6opLImnP8JCySsTriMhA6mbYQK4aatJZGrlDrAKf8eactHPxJTec3aLljDyVtixi8XNyCF/3l6H8jkAkGVicT8OoM9gk4CSil/6+mpuIgLgWIuVryo+cOx/s7g6QjxgDLS/d/jhzY9N/SawI3VZNk5uOOvJnNDd6SWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=DAmP0kA7; arc=none smtp.client-ip=209.85.166.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="DAmP0kA7"
Received: by mail-io1-f48.google.com with SMTP id ca18e2360f4ac-86135ac9542so98384539f.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 11:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1746816805; x=1747421605; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=F9M5vO0rVZ27fsI0jmDeqg70dl9WZ31TiFo3VqdX2ds=;
        b=DAmP0kA7GIo329pdFtQvTnWtJHnwcJ9l/Tpt32EIt0yZs8Y4xTakUAGecRzG1PfesD
         hqS+ni8gMQ5MPI6nfMxywtnb/SYMNX5apMFMBWw0ACb5N/6x/bBaBM3lCtuOPXP1+mg3
         fcStlhQz/H4cwEoEzYsijQ4pTofrep/oTQEyY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746816805; x=1747421605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F9M5vO0rVZ27fsI0jmDeqg70dl9WZ31TiFo3VqdX2ds=;
        b=PnVJ5s4s5DMGcq4YSgOXOJuJTXHm74jGXycOLct+cNtHngUWhikC04+ERD6mrJv9kV
         3GspT2yJd6Ck4Cr8m55d5qSxXPLtoxyAiQteKB3jERG+DYjrQoCfGjd0iHAIGBST1hl2
         FD39NZql3BwfZyvbvfd0wyC4XFh6KbByfeOLNiY0ZaS8+AAmaqexzwDROL4HUAAr75PH
         VlbAS0eLd96gDdo5qrKziKH6qPko9IStitALgghA8Uey7ron2c0yoGvQAwU17m64AnNF
         jKPQW57qnIMdXgPA1+nBevEU6B4bywv2lgSdiUDmAvdxt9AjpKhIazULMYgFQLGSnsrh
         U8hQ==
X-Forwarded-Encrypted: i=1; AJvYcCXUXylsRCGNW/vcBlj3MYc51/w/jecQVsrSDuxDzt/IeVSPzAK28slhqEQCJYvt2vy8/tMmU2M1cGKPB/M=@vger.kernel.org
X-Gm-Message-State: AOJu0YzD2I5TZHPz5ii8Toklk0fM93H9yT+cR7v7gxvjbZs1YjY+NTyK
	vr7K1zQi2mTpXryzNALgcYa1rxX/QWNTWzwN5SDCxR7zuAfqb3QfPdRPcFPwrTk=
X-Gm-Gg: ASbGncsj89viBhTqVtmw5UAyNr961L6eZZB8PxRdFkdGOwYx2yjgn0r3jIfxzAWnmDl
	h1wlNliqVN5YE11U1WpqWHCvsnCNL1rFMQ7gfrXK2NVkVdYqS1vhiGW3DfHLlO7Q05lqP0Mi6De
	pzCvvaRWiPeqdI2f4RRfaZAWSnFQs8wmc15pQWhM22z3kkSGYmu8o6/R67/CqjJBAHkQHv0Ipwo
	jUKNgbaunrPQi2QisGlnwBjcMFCribvySkeJScG0rE1NUirfUm1cH2nOBusrhOqvfyJCmxcE17v
	9zqgPFiR80EY2OQip4XOIcMDOAECiqgeuYyXvulaZJfDvLXNFSffsmyQU0EWOw==
X-Google-Smtp-Source: AGHT+IHHhcCytqFUPDF35/kPT3/0/t4Ci198j+E83P+7wD1v00FjQaT1VCEeKAJMNE9MeCGbrOF93A==
X-Received: by 2002:a05:6602:2594:b0:85b:5c9a:a9ce with SMTP id ca18e2360f4ac-867550aa561mr972489639f.6.1746816805533;
        Fri, 09 May 2025 11:53:25 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4fa2268628dsm514749173.144.2025.05.09.11.53.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 May 2025 11:53:25 -0700 (PDT)
Message-ID: <a8bf3665-1c3c-4742-a435-a0ef6914dfd4@linuxfoundation.org>
Date: Fri, 9 May 2025 12:53:24 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] selftests/timens: Print TAP headers
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: Shuah Khan <shuah@kernel.org>, "Bird, Timothy" <Tim.Bird@sony.com>,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 Kees Cook <kees@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>
References: <20250502-selftests-timens-fixes-v1-0-fb517c76f04d@linutronix.de>
 <20250502-selftests-timens-fixes-v1-1-fb517c76f04d@linutronix.de>
 <5609c6de-e5cf-4f6d-8412-71149fae2580@linuxfoundation.org>
 <20250509172639-61bade20-67f9-4815-8316-1bb16749f8d9@linutronix.de>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250509172639-61bade20-67f9-4815-8316-1bb16749f8d9@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/9/25 09:41, Thomas Weißschuh wrote:
> +Cc Kees
> 
> On Wed, May 07, 2025 at 03:06:16PM -0600, Shuah Khan wrote:
>> On 5/2/25 06:03, Thomas Weißschuh wrote:
>>> The TAP specification requires that the output begins with a header line.
>>> These headers lines are missing in the timens tests.
>>>
>>> Print such a line.
>>
>> There is no cover letter for this - so I will respond to the first
>> patch.
> 
> Hm, I sent one and can also see it on lore.
> 
>> The TAP information is added by the kselftest wrapper if
>> you were to run the test using ksefltest.
>>
>> The following will add the TAP header or if you use make kselftest
>> command from the main Makefile.
>>
>> make -C timens run_tests
>>
>> cd timens; make run_tests (will also add TAP header)
>>
>> The only time you won't see the TAP headers is when you run the test
>> from the test directory just as a command. Is this what you need
>> to do? I would rather not see TAP headers added to invidual tests
>> unless there is a good reason for it.
> 
> Yes, I am running each test on its own, as part of kunit based on [0].
> I also looked at the vDSO selftests and those all print the TAP headers on
> their own. The same for all of the x86 selftests I looked at.

We have been a bit inconsistent with adding TAP headers to individual
tests. We added them to some and then when we found out the nesting
TAP headers issue, we stopped and never really cleaned up.

Since we have this kunit use-case, I am going to take this series
and see who complains. I don't think parsers are in the mix at least
for majority of ksefltest runs.

thanks,
-- Shuah
