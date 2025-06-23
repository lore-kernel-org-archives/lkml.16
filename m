Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E98307DA7F
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 14:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750687925; cv=none; b=JJkwZwnwBoAVj4hm/X1STZErYSQuoYC9DnHHFFbLqCYxf4MJaSed9L4M4TdffcDZJdCgTh7HI63B7DjfRyEuCJHSpG4U3lmnw0NzcVQnWoci4l/SBECg7UQh22CBP2ocgnQj6FC8nR2vvETFv1aoMqhACX6mjo3ukEkZuXq01fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750687925; c=relaxed/simple;
	bh=sAJGL/AFF0QyWNLpODxJUNG0qnCygtD/QajB6OeKDTI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iuKAU3ieV1Eog2AtVIkrvWbRvAwdT7txCQwLFIgdLJR4oFyI4T+vi0FRUxlpOB0S98fYWzqsc4sQT3HvskSfKoTb3/Hf8iat3VV8BFWerIxflCe2RTybgf/5Y5WKbi65Yq9gUipbKcww0CPAuVtLp16sf1xEBCSWcXhOXGVl9/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kr0iazZv; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kr0iazZv"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a507e88b0aso3596533f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 07:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750687922; x=1751292722; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=04zirTBW4ONaae9PYnnFEhRuzM6dzMMflL0XU/SMCpw=;
        b=kr0iazZvcf2+sgH1Om2HhASA+yqPhpXC3yfK35BGSxpEfW8PpRfNuyUIUbG/0jWcBE
         5lik1eYJGmlNA4GczWbEiLmlSb0APKm7iVcquu0R0xBVF+rejTpnZTp5yOvMdnq3u/tj
         Bs2knCvSvrAsq65GHNCaICRV1EH2H8DH85m5EZSqirMVW8PvozFnO40yMF4SSUDiKh31
         6aGhZVjWCHcbdvGCcGTC2s1SOB8vT+rfmLuVdoUtZzaisVEVUdfZtbPByqYTNs/nWiuG
         S/7ec9nhA4CkdDULJ3vQ58oEXrfKAWrutD3UFnrdMgfQvtp6KGtzyoYGwGO1VXojo0td
         RHvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750687922; x=1751292722;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=04zirTBW4ONaae9PYnnFEhRuzM6dzMMflL0XU/SMCpw=;
        b=DI9TU49KMx1QPvmzIepTbOVtkqh78tDy39wj0AfA7mIl59uSSECioRi6lsEOzekqhL
         xjPaLvijVO7D2DrDygWgMVdvGJ0Robcrf/03tAvrLMzTsnkzoZeh6SMIrhuDP1rjn53n
         NlhXI+qa7plV8XN8QnzgTcNjqAI5PXh9L320nnjuMdWoesHQLl6PezA8vyHXIfCg/YKw
         YXr7SyZ8eThUc4ZofgcgEG3QjiPULBCgArh0iD62R+DlKWxlzmasEG3A8Z0nFnum7koU
         sPRfEEXGRrfBDxcBPc0QHZoicl0XLJpzoQp4fcgscC9EDFeVwqswMkMe5A3mBOkunWZr
         +o2w==
X-Forwarded-Encrypted: i=1; AJvYcCW04t4u4CJSUnOXcl432DYmhSOXwKxRKcdxKjGbzTl1DXChbblLUqcGqhCmHOazIcpreGwljO9gmR40Amg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwIv1x02hcDogCJcxOhlwJguEwefr1+WUKhNo6zZ6UIn1D0pD4i
	Xqbi7IFyTg+2OfaUiyF1dpbbBbfCemuZxXP737xY9gmNtAmfxNGhQqnGE5tck/sT55w=
X-Gm-Gg: ASbGncvKgbnCzPyXRx0rc4khoWwwiSW3zLFwpv9KRZR0t5DUR+TiHDb6s1uVsoPZESz
	ZKMbnY1M0pYWGoVOlErByvbW/AEp8cao3v3Qz6DIoj3hfRecGEZiFFA6/RNJAhqzI9tVZ8n3Zzw
	xPPZ+u7m/xXkbWd8c+4jPoAR2iX/2RGUHi3fW5JiPD/QEKsmaHpDqLzQ6niONP626ropv/45u9T
	6CJGoXnWaqHrvNd+KVNe4Tax6PlBbHw1vvlCmig30ETgJHD8yNmyP+OkvZMCx4nYVp8NEO3MFZD
	/1F07YzPIlXcI8Y/cA/sUXJlLFBz2JMPwU4lmy8zGsV/cE4gvQXxrM3yG2GX0yj6uog=
X-Google-Smtp-Source: AGHT+IEhFlx8KN+2GKnsD98crsVUfyaoX0mNgBuFWPQFhXzUxCR/Zb/phFY++YIze2FMTwcJnIQdhA==
X-Received: by 2002:a05:6000:4109:b0:3a4:f892:de7f with SMTP id ffacd0b85a97d-3a6d13071e8mr9361649f8f.36.1750687922230;
        Mon, 23 Jun 2025 07:12:02 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d1188804sm9526600f8f.79.2025.06.23.07.12.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 07:12:01 -0700 (PDT)
Message-ID: <e8c28a7e-bc08-4c50-96ca-afe62cfcf9fd@linaro.org>
Date: Mon, 23 Jun 2025 15:12:00 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] perf test: Replace grep perl regexp with awk
To: Chun-Tse Shao <ctshao@google.com>
Cc: wy.shih90@gmail.com, Ian Rogers <irogers@google.com>,
 peterz@infradead.org, mingo@redhat.com, acme@kernel.org,
 namhyung@kernel.org, mark.rutland@arm.com,
 alexander.shishkin@linux.intel.com, jolsa@kernel.org,
 adrian.hunter@intel.com, kan.liang@linux.intel.com, tmricht@linux.ibm.com,
 leo.yan@arm.com, atrajeev@linux.vnet.ibm.com,
 linux-perf-users@vger.kernel.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20250620174034.819894-1-ctshao@google.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250620174034.819894-1-ctshao@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 20/06/2025 6:40 pm, Chun-Tse Shao wrote:
> perl is not universal on all machines and should be replaced with awk,
> which is much more common.
> 
> Before:
>    $ perf test "probe libc's inet_pton & backtrace it with ping" -v
>    --- start ---
>    test child forked, pid 145431
>    grep: Perl matching not supported in a --disable-perl-regexp build
> 
>    FAIL: could not add event
>    ---- end(-1) ----
>    121: probe libc's inet_pton & backtrace it with ping                 : FAILED!
> After:
>    $ perf test "probe libc's inet_pton & backtrace it with ping" -v
>    121: probe libc's inet_pton & backtrace it with ping                 : Ok
> 
> Suggested-by: Ian Rogers <irogers@google.com>
> Signed-off-by: Chun-Tse Shao <ctshao@google.com>
> ---
>   tools/perf/tests/shell/record+probe_libc_inet_pton.sh | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/perf/tests/shell/record+probe_libc_inet_pton.sh b/tools/perf/tests/shell/record+probe_libc_inet_pton.sh
> index c4bab5b5cc59..aaa5ee06ae18 100755
> --- a/tools/perf/tests/shell/record+probe_libc_inet_pton.sh
> +++ b/tools/perf/tests/shell/record+probe_libc_inet_pton.sh
> @@ -23,7 +23,8 @@ event_pattern='probe_libc:inet_pton(\_[[:digit:]]+)?'
>   add_libc_inet_pton_event() {
> 
>   	event_name=$(perf probe -f -x $libc -a inet_pton 2>&1 | tail -n +2 | head -n -5 | \
> -			grep -P -o "$event_pattern(?=[[:space:]]\(on inet_pton in $libc\))")
> +			awk -v ep="$event_pattern" -v l="$libc" '$0 ~ ep && $0 ~ \
> +			("\\(on inet_pton in " l "\\)") {print $1}')
> 
>   	if [ $? -ne 0 ] || [ -z "$event_name" ] ; then
>   		printf "FAIL: could not add event\n"
> --
> 2.50.0.rc2.701.gf1e915cc24-goog
> 

Minor nit: the underscore in event_pattern (not shown in the diff) never 
needed to be escaped.

But now we're using awk it gives a warning so we should remove it in 
case anyone is searching through the output:

   awk: warning: escape sequence `\_' treated as plain `_'

Reviewed-by: James Clark <james.clark@linaro.org>

