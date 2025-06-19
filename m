Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4EC011712
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 17:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750352526; cv=none; b=CvB/dlLKxAhy9e4Qd9mjRn4KJMnRI2tjOO5gUR7S8md0PlcnS9cxEUfunZ6MM7fr+G7Ci5mVGM+jkyVod12MwM3SlMdo6PVNs7ebBS2AC3sNVDFdee3GZyzPoSKv7ddodzKYJuRdfMaqRjwTGbhMARBye+gze5zOCNJviC6up6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750352526; c=relaxed/simple;
	bh=lRvnDFm5hhqbK/nTs3rCjRlhuB9VhLA+5W44GAQFf1U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NbFvrHSWZu73j01UI+9ZPG0HW4tstWBQn9tyoG8JJtZPRMKpZ+TVwWI4GGsTSS6fM5yjjIXGXrYwcl4xKLbT1VD1nfGqEYxmz3YrbU04SWrmNuBSvekLk12tSAHBEE6MARofluWoybrCz9Uizflmt70tUJpX+rSUbAyrwOUa++0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=U8HtbL4y; arc=none smtp.client-ip=209.85.166.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="U8HtbL4y"
Received: by mail-io1-f45.google.com with SMTP id ca18e2360f4ac-873501d2ca1so28317339f.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 10:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1750352524; x=1750957324; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2iOkzX76U6MJmCoJ7ODUrEq9zUgZxIapXr2NXSPRn4k=;
        b=U8HtbL4y0lHZhLZN6ADPn7JjUeTOkxagjBKdG9f9OtkxJd90llj5fnbLbp7qfOaXzn
         WN67I5yxvPJnV4w+lbMmCqBNOQXSJpCwSK0bmckBFbkpoHJdSbOXKfm4ZOZj5lZBWi98
         fEBmjnEorZwtDQXBchGdj26O1oH6krFvWOh50=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750352524; x=1750957324;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2iOkzX76U6MJmCoJ7ODUrEq9zUgZxIapXr2NXSPRn4k=;
        b=WZTNzvE8ib3a/PUB1mSjjnP6nvOKvfUBpBg8NMqo8brhhoUG08Em+NeQj68PrBP3iS
         EKTBrEgb9ABjBbioYv6wLgl3/c8l76gVXoj5o1YF7qq495AxoJzAILKlLrL0tX+rCNLc
         VMhNntEo8UF+8RQsY+3kXuxJAOMgRDc/ZhHjzAyYKy6jmWPB4cqel3uTtiWTfgtAu2MX
         mFEf+zHAoPGipSzm5ajQd2jDsCHpkaDimgvDGGubl63jlyUmHWC9ypAiZ4xkCQpZE6H3
         IeU9hLtcNF/EXj0vjLS1rDjlfS8cuLL0cE9r5WxYeT2cK3adQlfe+o9RVNcFb0ykyDu+
         5s/A==
X-Forwarded-Encrypted: i=1; AJvYcCXMQnCyCzxdUrDYb5EuLKcQY+Vt2BXxatYuPiql/s4Y5+8AJuXFIFr/PohSy7dJxo0nIOuEHseO3lnn7XY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJFuyHBms0c0IoZ8uimj3zkxgNDK3RJmcA+/aQ9dObQErQjxhx
	Yy5/HfgBEpNslGtGlzayes+1b72ncNsq8mzWAJQ3TSVOdnNmxjHFfCkE2ugaz40uDWc=
X-Gm-Gg: ASbGncsmAJEX2ansEjcIExswgiED8ChaXj5DJun1aQGTCtgemwSYl7FpIZre98XP4Fd
	swG/9sbERw64ncaLKMuyAW6C7jF91vpqxptLtAS2Gc2eBGkLDSocMOc5reG/LwBillgowx7qXG/
	rcUxXdMYXE3KNhGBsqPOcdqDlKn5LYWx/+SZabYoJ9wD+YSgtufQhJ5Y66ooayh1m4ECQhDHKr4
	MMWYLFz/XToVd8OhFIqvGR60Ibr7iaP5MpxNc0IxEErX7328fJ3lbuyxeG0zOaLdmrfjcZ7aQ2j
	wy20tb8zwbuNI809dzV9UMzfIl671Jm7tmmFey/fAynScOxhuVCAP2TlULWHdbPuTdSAGXfuOA=
	=
X-Google-Smtp-Source: AGHT+IHw07yRURB4f8spZKZh12POSjAOvV/GpBlqVlkGBvvAjwlaPpAD88x6eYQ+RytrNoIzcN3SPg==
X-Received: by 2002:a05:6602:6d12:b0:86d:9ec7:267e with SMTP id ca18e2360f4ac-875ded0e6b5mr3165124839f.4.1750352523818;
        Thu, 19 Jun 2025 10:02:03 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-8762b60fd86sm521739f.21.2025.06.19.10.02.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jun 2025 10:02:03 -0700 (PDT)
Message-ID: <72998015-c571-437b-a77a-1c49a2787fc7@linuxfoundation.org>
Date: Thu, 19 Jun 2025 11:02:01 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] selftests/memfd: clean Makefile
To: Chen Linxuan <chenlinxuan@uniontech.com>
Cc: Shuah Khan <shuah@kernel.org>, zhanjun@uniontech.com,
 niecheng1@uniontech.com, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <20250610020559.2797938-2-chenlinxuan@uniontech.com>
 <96c46d3d-0e0a-464a-b64c-15c2a544a974@linuxfoundation.org>
 <CAC1kPDM76fLgE-cbKvMO3=B1hKhjTNMYmJw5XpOPV5UAxXx=Yg@mail.gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <CAC1kPDM76fLgE-cbKvMO3=B1hKhjTNMYmJw5XpOPV5UAxXx=Yg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/19/25 01:43, Chen Linxuan wrote:
> On Thu, Jun 19, 2025 at 5:21 AM Shuah Khan <skhan@linuxfoundation.org> wrote:
>>
>> On 6/9/25 20:05, Chen Linxuan wrote:
>>> When writing a test for fusectl, I referred to this Makefile as a
>>> reference for creating a FUSE daemon in the selftests.
>>> While doing so, I noticed that there is a minor issue in the Makefile.
>>
>> What happens if this change isn't made?
> 
> Nothing will happen.
> When I was writing tests for the fusectl filesystem in the kernel repository,
> I came across this file as a reference.
> Then I found that the process of passing CFLAGS was not correct.
> So, for the reason of not wanting others to be misled again,
> I want to update the compilation process here.
> 

If there is no obvious reason then let's not make this change.

thanks,
-- Shuah
