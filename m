Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8AB617A2FC
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 09:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751274847; cv=none; b=K9c7c5C1ugooMvNeXwDTkceYwg4fLOwVSpkaKXdVJeg4tMqvAzmzOmz7JOvDoXiDAOOtyBmMeCM9IxEcWUzH/Cw6NfQYUQ6PN6HjIGusu8n2VLZzOZ+Oufi4kmLkJ7ZiLV50C+G+AeilCKHQpM43Opqk/iz4YCrmZLin5dh2EGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751274847; c=relaxed/simple;
	bh=pG69dsn1qT1G2CK2vAd+AMlEBsBzpdXBa3/6S8PX44c=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:Cc:From:
	 In-Reply-To:Content-Type; b=gwa1r4kzGGprIpMJx1UUvkKXVC5ELXBsxhah0DAXrFhdYRQ1xxg3IClLevO2qQpnsmG1dpvkd3M5VeoSgGUVyXN883Dyylmcz6Dbp0nah7jP97+e2uGd+JZDhvLv+d35dKzcxo0BDJvlpOiZwMjeTrwlP29kiC5MDYtzKhBrZZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oEhRNyBM; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oEhRNyBM"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4535fbe0299so10362385e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 02:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751274844; x=1751879644; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=k725XEyUWw1sdx9utxFrAUAXo1FfhnAIN7734FL4f6E=;
        b=oEhRNyBMdHJi1h2azFeIJNeoSwT88PP/nR0Q3d3iWSZcqw43j+riUZAsoCts8TVxJS
         WsCeI7FhZkQ6Uosd2LYq3P0C3U/8aL326+4cT8uoXwbLcakfQTsWCmV63U0mJQDWvlsw
         7C9CcTUaQ4ZBzcT4UIOZawbUHj4rtQ5AAuQPk4yI5gBVVvuyhGb6JkK6kf/WyWigz0Zo
         WA8ImFsGds7O2XUvzPZe71jWgwC8ALwD1vZ9Ut6mdYHf7TW7RgBWVCLS9Py2w4AAWHVl
         yrNFtdhYDHkGD3b1nvdfkoqTpg0MU6HS9J+FxDfvRz4b6aCGo09n46i9Ce3mKcxhjbmE
         RQ9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751274844; x=1751879644;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k725XEyUWw1sdx9utxFrAUAXo1FfhnAIN7734FL4f6E=;
        b=SNb6pUKmk39xSJnugA4tZiuHxfJc7L2OtZKvtEDXu/qpI2/VYgwvxlq2P7PZIorZR5
         kZ9IMCBAyBsAAjMmgyljjVfN4qHxsmSV/MDs6kyXlDVBJh83nUIJ7LFWAlP99036FUr6
         br2RoA85hfGetEa/Ur/lZt4Z8ZbIkTcGHkfpgaH8EGYaqPlhifOnR5KILe5ECTrqgHI1
         iJuln4JVPSv6dJ5fN+9fFaQa26SM8q/ID0rOFAWHct0DTrB9McI7pm2NXSFxvcb60Tve
         2/5xLgoJ0Kl+8m1WnTPqeJxMM7LB5jBiRP5UH793Qt8gbTgQkCVoFyl2rORwey6RGBM8
         8xBA==
X-Forwarded-Encrypted: i=1; AJvYcCWfIazY9oJoQLkKccqhpiTUy+WqvX+hxJnCLC022JOmfFXJlrdKRePSMVWvNlM46ZBQ0g1cAKXMLpaLE0M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1dZnCKghcLdv0q/ddoBHSHtHmD2uOdLiuCbCPtVthttg7mSv5
	StelsTGMhHvE2Vy7qOcftkKVRJNnfUp+zhdjBwBo0Mb6Cs+thZFZackUJfX90DYWm4o=
X-Gm-Gg: ASbGncsf8X0mAmFHeTornuZSazU3Jtc3otxzeYTuy5m4dB5AWK9+yIK4iJOBOtYFAFU
	tCeioeO0Prt1vx8WVkEzurl0KdIY4Cv2gW0urfRcCwYXxp110dZL4kqYVOIlDCOYkgz/95HFsQK
	xGi4DZLKKmgh1s/tuRb8j5Vzk0/ovvzGDp8jv2ATIKOZJuiwcv76RiR8nrS7E//hY7OQOe0WpGK
	5RsWaLPItSKmVNgInnlghw1PSumu15LKBmR8FIp82sf5DuN6ljx//lS292HRzBbhUxXkZd8t3K9
	HQTG7zn2HSPNUTflkn2SVkHgapjdt8tiOvaprVj7VpSaTlGvPFVlhjFqMHeZYsPRmDU=
X-Google-Smtp-Source: AGHT+IFYoFBPKKngs821UJ8n0tFqXZPviDTIJ6NnZlA9GTMUmKwKlnhVaLOZ3Yl40O1NkZSxJ8b8eg==
X-Received: by 2002:a05:600c:6295:b0:442:d9fb:d9f1 with SMTP id 5b1f17b1804b1-453a1708a45mr23146695e9.4.1751274844110;
        Mon, 30 Jun 2025 02:14:04 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e52a35sm9986321f8f.57.2025.06.30.02.14.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 02:14:03 -0700 (PDT)
Message-ID: <f3524574-03a4-491b-98d1-8a384132ec5b@linaro.org>
Date: Mon, 30 Jun 2025 10:14:02 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] perf test: Add basic callgraph test to record testing
To: Thomas Richter <tmricht@linux.ibm.com>, Ian Rogers <irogers@google.com>
References: <20250628015553.1270748-1-irogers@google.com>
 <898927c3-e85f-4a9a-9374-6fdb49236410@linux.ibm.com>
Content-Language: en-US
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>,
 Kan Liang <kan.liang@linux.intel.com>, Dapeng Mi
 <dapeng1.mi@linux.intel.com>, Chun-Tse Shao <ctshao@google.com>,
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
From: James Clark <james.clark@linaro.org>
In-Reply-To: <898927c3-e85f-4a9a-9374-6fdb49236410@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 30/06/2025 9:01 am, Thomas Richter wrote:
> On 6/28/25 03:55, Ian Rogers wrote:
>> Give some basic perf record callgraph coverage.
>>
>> Signed-off-by: Ian Rogers <irogers@google.com>
>> ---
>> v2: Pick up s390's needed "--call-graph dwarf" as spotted by James
>>      Clark <james.clark@linaro.org>.
>> ---
>>   tools/perf/tests/shell/record.sh | 30 ++++++++++++++++++++++++++++++
>>   1 file changed, 30 insertions(+)
>>
>> diff --git a/tools/perf/tests/shell/record.sh b/tools/perf/tests/shell/record.sh
>> index 2022a4f739be..b1ad24fb3b33 100755
>> --- a/tools/perf/tests/shell/record.sh
>> +++ b/tools/perf/tests/shell/record.sh
>> @@ -12,8 +12,10 @@ shelldir=$(dirname "$0")
>>   . "${shelldir}"/lib/perf_has_symbol.sh
>>   
>>   testsym="test_loop"
>> +testsym2="brstack"
>>   
>>   skip_test_missing_symbol ${testsym}
>> +skip_test_missing_symbol ${testsym2}
>>   
>>   err=0
>>   perfdata=$(mktemp /tmp/__perf_test.perf.data.XXXXX)
>> @@ -359,6 +361,33 @@ test_precise_max() {
>>     fi
>>   }
>>   
>> +test_callgraph() {
>> +  echo "Callgraph test"
>> +
>> +  case $(uname -m)
>> +  in s390x)
>> +       cmd_flags="--call-graph dwarf -e cpu-clock";;
>> +     *)
>> +       cmd_flags="-g";;
>> +  esac
>> +
>> +  if ! perf record -o "${perfdata}" $cmd_flags perf test -w brstack
>> +  then
>> +    echo "Callgraph test [Failed missing output]"
>> +    err=1
>> +    return
>> +  fi
>> +
>> +  if ! perf report -i "${perfdata}" 2>&1 | grep "${testsym2}"
>> +  then
>> +    echo "Callgraph test [Failed missing symbol]"
>> +    err=1
>> +    return
>> +  fi
>> +
>> +  echo "Callgraph test [Success]"
>> +}
>> +
>>   # raise the limit of file descriptors to minimum
>>   if [[ $default_fd_limit -lt $min_fd_limit ]]; then
>>          ulimit -Sn $min_fd_limit
>> @@ -374,6 +403,7 @@ test_uid
>>   test_leader_sampling
>>   test_topdown_leader_sampling
>>   test_precise_max
>> +test_callgraph
>>   
>>   # restore the default value
>>   ulimit -Sn $default_fd_limit
> 
> Works ok for s390
> 
> Tested-by: Thomas Richter <tmricht@linux.ibm.com>

Reviewed-by: James Clark <james.clark@linaro.org>

