Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2B1A1FE46D
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 08:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750666143; cv=none; b=ocvPqz3WHyEO8obcXN6hsaWUMpjYzTIzMDOzphBbfjb370/CjPwnOzIpkoP/j+aUQ6tR79FEbjR2d4TPkogEAjTmiNzrQNtrM3GDAwk0at2qV8QCWafIC/HLYydc19e/piVhJHX2n6AkKsboWlL4qh0b26Dodbb+X781/KVwVr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750666143; c=relaxed/simple;
	bh=g7bC6shOFqWUkJPQohJlp6xKTslLg7u7rypZKuZ35UY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o6ig1scsCC8p+cqp4DML6Hkj7S8oVlRj2jFfK/IZvZYj/QLNK6jrgVLwTZfuvWL5YdSGVBN/ME0KB7tWYQZJgT7ZZX5EwTPBgdUjpbPnMn/y1ff1Qd1Lnljl3SpeyjgH8mTAripHNGx0h4mCsF8RUSb7foKVUU6QPTduBwf36fA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UJRn3Qpj; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UJRn3Qpj"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a588da60dfso2309127f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 01:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750666138; x=1751270938; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RwIuDB9l6P1vly8lEea5LFQTAzgsABGn7EGIVKdG0ZU=;
        b=UJRn3QpjniAPCpItwsB7saoHpJ2HNAZzPt6H1CuqZQlREElRY/pSNdMxW8KRjgvQb2
         ZyqB6egN52/g7/PTO0+a68+CGw2NTfkxDbhXLzRTbcsvXCh3x4pAXolmS3lBLCfHegAE
         mSKUTQucrDrAHk6kqTj6lq2Q1dFPRpxVnXP8v8dCgtv5qpsqruNgZcNIyfEU4cFg74td
         gGXeOuQqqz+D6TGM100P8VwRB9f7IxEC2++jGbZb6t82Fcfpfc0pS+Nk+wlCFBZimuHl
         fsafQ+g4lqCUcEeSAOL1xunHsZGm5IjZtwlqSDv/2Dub8B1AREW4Le0RPdhrecVVqKCf
         FfZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750666138; x=1751270938;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RwIuDB9l6P1vly8lEea5LFQTAzgsABGn7EGIVKdG0ZU=;
        b=S6vL31wFjimsKoX24tDA03hDnZOa6ktRSgYycU+WnWT4SX+MQC458bB929HyfK6XGM
         QIbb+WHvJ5vbvMaHCm2yRrLXNdYNyzUmAtA7UOJfBEd9TPSE56eMF/kXR+kLgGSGb5fY
         KH5rhmRYcEDJlx0SFzBDwHdO3Hafi5ZTE/FqmdRJVnND9Nx9ZMsLPAA3tC6mz//OV9dd
         bqjlcw/1YmCD9SgJJy0kL9qHqvod53Ra5/5604a4nH4UJSY+s5weKHSqhmGVIgfKqRkZ
         HELPPCHP7vGk0HyaP1KY/VgMcqLUUlh6EWUWgksG7bJmg2suW1eaaxffb2pV+s4hxnuy
         yoBQ==
X-Forwarded-Encrypted: i=1; AJvYcCUFVkuu1LGvqIvI4SrGCXGS8YGCKxA/U8jx68zSaSOaNhuqMra4TLB7h01AacV+m/qmtbCJOE9oxttAXF8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/obXLgiGC8Uc5JQ1wb/gU1mFNLN68paFdB+CL5wf5mi7bMIkb
	NlN9p296LeOiDnwhamSeeq1L7QFRc1qJrUd5f56PnNdT6K1jTqNHmhC3qVPsamR3M3I=
X-Gm-Gg: ASbGnctQHf0IPv/WxsfET44axQHuslRa0z/L/gw/flll+LTA6BHAjAgWtSDXwr0gRx0
	2cewV0MfLr7G9ugXUXm3vYqU0FzOeh5VduEqSRYlfRG49DvTLiZ3TJZFBMQpRNJxZV6t4Z5ftao
	GREwtENHxdLunGD76kgilyMns3qQX7ha5XvMzFmQKGCWPDU0qnLlVcx2RWaGGp8mpTOIZRDKOqo
	GTxEiMyd5ebFbCE1e6CO/OuAJ4oGkBDqqvI0spZDzGIfMtllIZzNfNZnNGR4g+ur5aMkNFfHKbN
	27txqJUu4K+TOKsCp35qG5LMBJ42nKxoDGxMzBUpnB9mGOd3KecgOOd9qHtJNoGOB5c=
X-Google-Smtp-Source: AGHT+IHJo0IMTbVg3Z6+qf+LRb91spKikOGF2OIevASop9FQHg4V8AyHRHED02E1tc6rIuUJdkrS4Q==
X-Received: by 2002:adf:e187:0:b0:3a4:f723:3e73 with SMTP id ffacd0b85a97d-3a6d129ccdbmr7878848f8f.16.1750666138114;
        Mon, 23 Jun 2025 01:08:58 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d117c03asm8650522f8f.49.2025.06.23.01.08.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 01:08:57 -0700 (PDT)
Message-ID: <52e64bd1-dd5a-48b4-8acc-c7af5b811d30@linaro.org>
Date: Mon, 23 Jun 2025 09:08:55 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] perf build: Specify that spellcheck should use the bash
 dialect.
To: Namhyung Kim <namhyung@kernel.org>
Cc: Collin Funk <collin.funk1@gmail.com>, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 "Liang, Kan" <kan.liang@linux.intel.com>
References: <e3751a74be34bbf3781c4644f518702a7270220b.1749785642.git.collin.funk1@gmail.com>
 <20cce2b1-eaad-4565-817b-b094aecee0a5@linaro.org>
 <aFW7T9DH9WrjtgJ-@google.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <aFW7T9DH9WrjtgJ-@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 20/06/2025 8:49 pm, Namhyung Kim wrote:
> Hello,
> 
> On Thu, Jun 19, 2025 at 11:28:46AM +0100, James Clark wrote:
>>
>>
>> On 13/06/2025 4:36 am, Collin Funk wrote:
>>> When someone has a global shellcheckrc file, for example at
>>> ~/.config/shellcheckrc, with the directive 'shell=sh', building perf
>>> will fail with many shellcheck errors like:
>>>
>>>       In tests/shell/base_probe/test_adding_kernel.sh line 294:
>>>       (( TEST_RESULT += $? ))
>>>       ^---------------------^ SC3006 (warning): In POSIX sh, standalone ((..)) is undefined.
>>>
>>>       For more information:
>>>         https://www.shellcheck.net/wiki/SC3006 -- In POSIX sh, standalone ((..)) is...
>>>       make[5]: *** [tests/Build:91: tests/shell/base_probe/test_adding_kernel.sh.shellcheck_log] Error 1
>>>
>>> Passing the '-s bash' option ensures that it runs correctly regardless
>>> of a developers global configuration.
>>>
>>> Signed-off-by: Collin Funk <collin.funk1@gmail.com>
>>> ---
>>>    tools/perf/tests/Build | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/tools/perf/tests/Build b/tools/perf/tests/Build
>>> index 2181f5a92148..26efc5d20f6c 100644
>>> --- a/tools/perf/tests/Build
>>> +++ b/tools/perf/tests/Build
>>> @@ -89,7 +89,7 @@ endif
>>>    $(OUTPUT)%.shellcheck_log: %
>>>    	$(call rule_mkdir)
>>> -	$(Q)$(call echo-cmd,test)shellcheck -a -S warning "$<" > $@ || (cat $@ && rm $@ && false)
>>> +	$(Q)$(call echo-cmd,test)shellcheck -s bash -a -S warning "$<" > $@ || (cat $@ && rm $@ && false)
>>>    perf-test-y += $(SHELL_TEST_LOGS)
>>
>> If we're enforcing bash style with static analysis shouldn't we also change
>> all the hashbangs to bash? Recently there have been changes to change sh to
>> bash in some of the tests so presumably the hard rule for sh is no more?
>>
>> In the past I've had to replace bashisms that didn't work in sh but it would
>> be nice to have only one language to write tests in. I doubt anyone running
>> the tests today is running somewhere without bash, or that changing it will
>> break anything. If anything it will fix more bashisms that have already been
>> written.
>>
>> Just for reference there are 34 #!/bin/bash and 42 #!/bin/sh in
>> tools/perf/tests
> 
> Thanks for raising the concern.  I agree that having one standard is a
> way to go but I really don't have preference between those shells.
> 
> Thanks,
> Namhyung
> 

I would vote for bash then, just because it has a few extra builtins 
that are sometimes useful. I can send a patch that does the change to 
see if anyone objects.

Thanks
James


