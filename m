Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06E4645038
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 17:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746810223; cv=none; b=GCnX6Yh7nNWVipaB8FKiqZoSXO7UIjlrMx2BBGN73BZBOhrPlyzFlnG/e4OJ5zhbB6Nop4cvhW2Y0OFRzHxH/7JN72x2GlkzrZp2UZHglqQq6OhBDjSYozou6W0OdSUzbZXcvGRXu3QoMXCU2kWfdr30S/RPzmYHt27hYX29q8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746810223; c=relaxed/simple;
	bh=xBy9z9qoIyBCdJ0TEb3T7p6Ufk8Td87Yc2gExoFB528=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n62Z7UrxsmuiKXnz5Rd1IkPfFeW5nYLQvCRoZiYXuxw3sd1rgsweowxoAbCN1rGDEYANhsj6pnEDC2Cn4bvDIaJNYZifsh8FdDGWybMBu3nybltwBHpCie9AKQalUE6HJM6BWctxo/LnTGcN7VBRCIsx+rj0BpTTam3gaOfgvA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=JA7GZt+R; arc=none smtp.client-ip=209.85.166.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="JA7GZt+R"
Received: by mail-io1-f51.google.com with SMTP id ca18e2360f4ac-85b3f92c8f8so221584339f.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 10:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1746810221; x=1747415021; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=86jg2jZVkyd1MUCPfhL5AkHN1Ejwp/KScOnUCxw+kzU=;
        b=JA7GZt+Rkb8DyjxxBIsb4OH8qzYwbcYTTIYbHULjJVw+uVFjJ3u1CTd4dcWw69PnxY
         Wpp5k4S5kLJOtF0kMIS9dLgNkOL3jDoJfYr2odIz1u2Gh8v+OFV9ijF/NSZy49YYxc98
         RUVfxqvGsoznppMttHqU9j3cmZq7N/Xxog5Lg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746810221; x=1747415021;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=86jg2jZVkyd1MUCPfhL5AkHN1Ejwp/KScOnUCxw+kzU=;
        b=xRXES/DhdUJfr5XTQZKqjTK0G+JAoG/eVc8LEqR2cHlJwD46QI4nvfB17FfolCWw9H
         RlxGQKNTdpBkG6K1MPZAPwrl8hNnrNImT0uw7InfQC/pfXgpm15YAItu6Izdlu9KakXx
         ta3KOVP4puZ0Q0tH4IxF1+kFiH3OLnZ5M6kEgUviCdB7wLB9tLrg1Q5BJ36MHChEkjbE
         CsM7m508neGR9VtGvsXG9vi3pm2k2oGH76olVymQePgODe5/ae+COYpMO2VZ/NmcbP4e
         7EHLM0XjfElYnHhbtaBEJg4YpDXESqXSa6iwPiRZ++nycD4BQIboAqfICZ/Zw3nG/ZXA
         Oi7A==
X-Forwarded-Encrypted: i=1; AJvYcCUzyE/4z7GvjkwMPMSR6sX1oH2+MP1L8x7EqaYBbc5X+to7X2A27gSgSP7RY9v/X+kufLwIekj6E6GV7qU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDApzE5ZejQMgujYis8hrLpMLi0XQF3C3a5CGCUSAqgU2NuaNY
	w9btiyWgun1XLARGGEr85QW3xtAgd35nvgPwgUHclUB0DSzBQ4Bx6STulQQjUlA=
X-Gm-Gg: ASbGnctHsFROa+dCCfQc4st6at3b5s04zbphL7rkFgkyqQeDqJvWxn57tGsZVDqD8cT
	bl9K1juOJcJSB/JQgiczCiziB+EW3rlzZSB8YU1ktw0V0aexe1vhNSz9g5VDmFHDtOEY7DFxShd
	SH0ka2iQf6KUJasyUS2Wog1HusLchHHQ46pVGr1KP2bhkra172HftbVYN4wn4d/9b9MD51FLJ9s
	OpFSWJWJkvUkhJbJb9Ti00B3veMLeUjy66EcAvQ3wIiYNs5oDUZfWCmerbIWyrRl4ojls2O3v4W
	73QARijdClbrrX7kDFAzLaIfAVdqV5UKH7fQY3FSnCx3ZsXcI/uZczRe8rExUw==
X-Google-Smtp-Source: AGHT+IGTWqfwSqopxk2jtrqUjuYm1w/WdHF2kTGMBDH5rszV8vB2geURSZzxlD0eJ+oY4RWQCxLEWg==
X-Received: by 2002:a05:6602:1402:b0:85b:43a3:66b2 with SMTP id ca18e2360f4ac-867635c3eccmr482377439f.7.1746810221015;
        Fri, 09 May 2025 10:03:41 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4fa226535f6sm473050173.105.2025.05.09.10.03.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 May 2025 10:03:40 -0700 (PDT)
Message-ID: <4f3eeda9-b9d0-41f6-8a05-b845cf020b76@linuxfoundation.org>
Date: Fri, 9 May 2025 11:03:39 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] selftests/ftrace: Convert poll to a gen_file
To: Steven Rostedt <rostedt@goodmis.org>, Ayush Jain <Ayush.jain3@amd.com>
Cc: mhiramat@kernel.org, mathieu.desnoyers@efficios.com,
 linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, Naveen.Rao@amd.com, Kalpana.Shetty@amd.com,
 Narasimhan.V@amd.com, Shuah Khan <skhan@linuxfoundation.org>
References: <20250409044632.363285-1-Ayush.jain3@amd.com>
 <20250409124855.4dc8fd58@gandalf.local.home>
 <20250507152653.4af2549a@gandalf.local.home>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250507152653.4af2549a@gandalf.local.home>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/7/25 13:26, Steven Rostedt wrote:
> 
> Shuah,
> 
> Can you take this through your tree?
> 
> -- Steve
> 
> 
> On Wed, 9 Apr 2025 12:48:55 -0400
> Steven Rostedt <rostedt@goodmis.org> wrote:
> 
>> On Wed, 9 Apr 2025 04:46:32 +0000
>> Ayush Jain <Ayush.jain3@amd.com> wrote:
>>
>>> Poll program is a helper to ftracetest, thus make it a
>>> generic file and remove it from being run as a test.
>>>
>>> Currently when executing tests using
>>>      $ make run_tests
>>>        CC       poll
>>>      TAP version 13
>>>      1..2
>>>      # timeout set to 0
>>>      # selftests: ftrace: poll
>>>      # Error: Polling file is not specified
>>>      not ok 1 selftests: ftrace: poll # exit=255
>>>
>>> Fix this by using TEST_GEN_FILES to build the 'poll' binary as a helper
>>> rather than as a test.
>>>
>>> Fixes: 80c3e28528ff ("selftests/tracing: Add hist poll() support test")
>>>
>>> Signed-off-by: Ayush Jain <Ayush.jain3@amd.com>
>>
>> Acked-by: Steven Rostedt (Google) <rostedt@goodmis.org>
>>
>> -- Steve

Yes - I will take this through my tree.

thanks,
-- Shuah
