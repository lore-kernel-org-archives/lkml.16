Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BBEC228C92
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 10:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747996247; cv=none; b=VWohDMMeflcdwAqQPVXrGDuNeMXQlJJy3TIlqdepoH2V2uZM81jHoJ3g1Ge8jaAu7MKLrmR924XK2UhmnzoiP81E0GguGU7CAYp3PShG1602lomFzAL7WzGCV8PVyQtfzmjSC0qbPVhBasKtBotAzyo2l3+C38V7aMt8S6uAJzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747996247; c=relaxed/simple;
	bh=uQxd1eLHfjaOj5/ATW0gmniRkoigc06Od2hWFZtdlR4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BDDvPE1Hi09XGcODyndSa4AXJVYbAO4tcGyvQT6PxQ9zOF2ZARMm0UxISLJSLekIhNyp2NjpRaMrnFCtm93WD5SLKQjTfvtzhKp+ycBs+AwZuIys4LqQHOwqYvi9F1TQKJpHrOwE8NbjmhmMlxj/6XNfu507KfG+ZYhLhwMoelo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VpL8eX29; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VpL8eX29"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a3673e12c4so4099837f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 03:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747996243; x=1748601043; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xGc072gf7bPSnQp+Zk/9Ye6hdE1HV449ldZxHQ4WGd4=;
        b=VpL8eX29zBL3bEM5XCwfulyPN3Vx3/P3pSHtyoa1WTiwz4HYuG6T+rq9hECKpAWYWf
         PqermofcTJRQuzpbxytkfeiVO90VWdBDjMvMGLH1c64yLC9HKz+g+r5kBCqM82aKYu1v
         s1eZpysaIvGDomPPjney4eHsYKGUNVEJlwKvsWZ1NyLSOaalMXC+cviuVZJcZfiFLI8p
         uuobytPOqYWD58qp2/eNh9T6wYkWD+xc1ozH7M2cglPqQ+ntT95dE0X1DBXCu0JOoqpp
         BUYXwLcrd/mqVxKRUmUqF1WNzOfVypnG3xD2FQ9R9QZVOWTx2aRPa7SjuGdl/iqGJ2Yr
         CCbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747996243; x=1748601043;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xGc072gf7bPSnQp+Zk/9Ye6hdE1HV449ldZxHQ4WGd4=;
        b=DsHph6rIASfZnW4yy2ne3jgUbRiLyaNZUeIwm+q29QLbidkONvG7jt9mIjfaKwarq8
         a9CWjt5XmvSJb88HR+25q+75xG0IRVupQFha2N9b+jb8PY6aBTJbOt4C/LtfqLme/MLY
         Tb8x1MV0F1w4zPNKU88HquYhdoMROQX/b1HYlf/Sj9ceAcOxCGup0kcaAwmaK6D8FLsu
         TVdAG5TBEun8B38NdUmOd9PikW5NnU6DLZ0Wpm9aenQkQX7Pb7sTeM6AX1ZKGCAAUY00
         rgxCWemeX7NzXmvUv0YapHPdNyy8enDmdiyDq9iOsNPzVxyh1fWaGMQaYcseSFwXgGGT
         1InQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9ZCHzmnJP7K/ARU1O5drYKXWLMyQVV8wqWPVBRAdPZq0m7M+QMKjglovH22O9etnCqjAFYlulY1HlrPw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzh82QnCbC7EAiwREELnBDFS0KP+AyDOO2F6SrOYUafNNYS9IqM
	ss8tz1tLwo0oAOotyviP+C9kpgz9KE2WjbTnnJQX8KM+USjjpgSz7+83xW5+nUXEnK4=
X-Gm-Gg: ASbGncukOpBbbnUf1hocwOD6E81U7MDuarYVvOO4AOSXsI5EcQYa9T1cESWz/9C8k2m
	nWXpHcwQcvabNiitAViZ8hquQud5bZztjZfLXSrrTHZhPrge7YR4HnVtSTROayohcS3nmd/a0uM
	1V5fqsWfBtK43nWS+ceK7AA05BVmu5A3irwjF4tTfnrYqcvzU2C/NyxIhZWPm2MLUneAl5uvcG9
	kxWFHGi/yb1sV/7spqTGHplEWaFaWX2NbNJg9DDh1vLfykMHt7qucqX6ykRIVAreKvY4DuC3frb
	QKXwvqZ0hfl57Y+NWFhevJRPIov1NNGyNvV+sX1jqt5SAFGXz21iKrvg
X-Google-Smtp-Source: AGHT+IFFW4ht9GhSqBTvucu9XUBb928PNMBRUk/fhSs5hhgU9QRwrO+U6oC+bSVQuoohGmB6W/ygxw==
X-Received: by 2002:a05:6000:200f:b0:3a3:6e44:eb5f with SMTP id ffacd0b85a97d-3a36e44ecc7mr17073175f8f.46.1747996243422;
        Fri, 23 May 2025 03:30:43 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4bfdec3cfsm3862513f8f.45.2025.05.23.03.30.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 May 2025 03:30:43 -0700 (PDT)
Message-ID: <4bc8f1ae-5392-4b9a-a67a-391f3e93b22c@linaro.org>
Date: Fri, 23 May 2025 11:30:42 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] perf test: Move some ARM tests to
 arch/arm64/tests/shell
To: Namhyung Kim <namhyung@kernel.org>
Cc: Jiri Olsa <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, linux-perf-users@vger.kernel.org,
 Leo Yan <leo.yan@arm.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Ian Rogers <irogers@google.com>, Kan Liang <kan.liang@linux.intel.com>
References: <20250522171044.1075583-1-namhyung@kernel.org>
 <20250522171044.1075583-2-namhyung@kernel.org>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250522171044.1075583-2-namhyung@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 22/05/2025 6:10 pm, Namhyung Kim wrote:
> The test_arm_callgraph_fp.sh checks with aarch64 so it should belong to
> there.  And IIRC ARM SPE is supported on 64-bit platforms so move the
> tests too.  But I'm not sure about coresight so left them.

Coresight is also supported on arm32 which is why 
tools/perf/arch/arm/util/cs-etm.c is built for both platforms. Having 
said that, I'm not sure if the tests pass on arm32 because we're not 
running them, but they should pass and if someone is running them this 
change could break that.

We could symlink "arch/arm64/tests/shell" to "arch/arm/tests/shell" or 
have a condition in the code that forces one folder for both. Or just 
continue with only arm64. Considering I haven't seen a test failure 
report from there and we've only really been adding tests for arm64 
stuff it could be reasonable.

> 
> Also please test it with shellcheck as I couldn't run it actually.
> 

Shellcheck is working on these scripts for me.

Reviewed-by: James Clark <james.clark@linaro.org>

> Cc: Leo Yan <leo.yan@arm.com>
> Cc: James Clark <james.clark@linaro.org>
> Signed-off-by: Namhyung Kim <namhyung@kernel.org>
> ---
>   tools/perf/arch/arm64/tests/Build                  | 14 ++++++++++++++
>   .../arm64}/tests/shell/test_arm_callgraph_fp.sh    |  4 ++--
>   .../{ => arch/arm64}/tests/shell/test_arm_spe.sh   |  0
>   .../arm64}/tests/shell/test_arm_spe_fork.sh        |  0
>   4 files changed, 16 insertions(+), 2 deletions(-)
>   rename tools/perf/{ => arch/arm64}/tests/shell/test_arm_callgraph_fp.sh (89%)
>   rename tools/perf/{ => arch/arm64}/tests/shell/test_arm_spe.sh (100%)
>   rename tools/perf/{ => arch/arm64}/tests/shell/test_arm_spe_fork.sh (100%)
> 
> diff --git a/tools/perf/arch/arm64/tests/Build b/tools/perf/arch/arm64/tests/Build
> index d44c9de92d425c62..6c73720cb0ffa99d 100644
> --- a/tools/perf/arch/arm64/tests/Build
> +++ b/tools/perf/arch/arm64/tests/Build
> @@ -3,3 +3,17 @@ perf-test-$(CONFIG_DWARF_UNWIND) += dwarf-unwind.o
>   
>   perf-test-y += arch-tests.o
>   perf-test-y += cpuid-match.o
> +
> +ifdef SHELLCHECK
> +  SHELL_TESTS := $(shell find shell -executable -type f -name '*.sh')
> +  SHELL_TEST_LOGS := $(SHELL_TESTS:tests/shell/%=shell/%.shellcheck_log)
> +else
> +  SHELL_TESTS :=
> +  SHELL_TEST_LOGS :=
> +endif
> +
> +$(OUTPUT)%.shellcheck_log: %
> +	$(call rule_mkdir)
> +	$(Q)$(call echo-cmd,test)shellcheck -a -S warning "$<" > $@ || (cat $@ && rm $@ && false)
> +
> +perf-test-y += $(SHELL_TEST_LOGS)
> diff --git a/tools/perf/tests/shell/test_arm_callgraph_fp.sh b/tools/perf/arch/arm64/tests/shell/test_arm_callgraph_fp.sh
> similarity index 89%
> rename from tools/perf/tests/shell/test_arm_callgraph_fp.sh
> rename to tools/perf/arch/arm64/tests/shell/test_arm_callgraph_fp.sh
> index 9caa36130175964e..f59ab293d67b9f9c 100755
> --- a/tools/perf/tests/shell/test_arm_callgraph_fp.sh
> +++ b/tools/perf/arch/arm64/tests/shell/test_arm_callgraph_fp.sh
> @@ -3,8 +3,8 @@
>   # SPDX-License-Identifier: GPL-2.0
>   
>   shelldir=$(dirname "$0")
> -# shellcheck source=lib/perf_has_symbol.sh
> -. "${shelldir}"/lib/perf_has_symbol.sh
> +# shellcheck source=../../../../tests/shell/lib/perf_has_symbol.sh
> +. "${shelldir}"/../../../../tests/shell/lib/perf_has_symbol.sh
>   
>   if [ "$(uname -m)" != "aarch64" ]; then
>   	exit 2
> diff --git a/tools/perf/tests/shell/test_arm_spe.sh b/tools/perf/arch/arm64/tests/shell/test_arm_spe.sh
> similarity index 100%
> rename from tools/perf/tests/shell/test_arm_spe.sh
> rename to tools/perf/arch/arm64/tests/shell/test_arm_spe.sh
> diff --git a/tools/perf/tests/shell/test_arm_spe_fork.sh b/tools/perf/arch/arm64/tests/shell/test_arm_spe_fork.sh
> similarity index 100%
> rename from tools/perf/tests/shell/test_arm_spe_fork.sh
> rename to tools/perf/arch/arm64/tests/shell/test_arm_spe_fork.sh

