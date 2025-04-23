Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3D911F4625
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 08:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745398723; cv=none; b=Yy+r5JBMdLpzsg9fsNwP+0qbzrT3XUxzQ9pNISvdgpQRqaQ1na74ATV+8HiFdnDQN+P8YNX2snV9jn6eWGZMu7kN+Yp2X2LhYnWjbHjD6RHf84VO1DPkxq76wl94vLIKYi9ZkhkhQ7PDythqvLPBM1vXs11L3kGR3rRg7l1E0MA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745398723; c=relaxed/simple;
	bh=y/r92ZoKSv7oC9AvAw2txCOSGIwZK0JD6u99kRaYQ/A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TRG5UE8G4MnCOImCwcnEvzYTEBCu7ln0C78uJpDMuGvHxogffvWjk4rMny+GvrOgmKxKvbsQpHVSKMUQ0dtrnpi/A7MQ4UxdSndMY6CsErSkv2lOK9oGoFKjc29KDcLD9dN4/dKrv6D7u8/Yjeern4eP/9NWvvMe7v4hTA+qU/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tx/gJgS5; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tx/gJgS5"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3914aba1ce4so4093337f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 01:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745398720; x=1746003520; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XPH17I4ByfRvhzK6JEBH2X9LLFdHrZvG5tQMgObXYcY=;
        b=tx/gJgS5+qfs7PY1wosv1aTHFkqsp/xJHW2D9DIMwTB8rdRWECHoteO3dcKr/zGnPW
         bDhQ7bZIHtS9ccsBg5rQyU7EiNto3mGXVN1jsbgguNMIKwC9EJQ+EqOqJ7jDecqjkelD
         azujUBHRXXhhjw6JCEaW/+nZG3MVEN1xqIpM14kvcd5N6FZGdYnsRhRNKsdAY5dmq+n6
         2vmrdIiJUaL603kVWzncPq+aTaG6ivzDfY8T9Ic+4/WDGp2xrNo07qHRUfs/Oed/Nvxi
         08dxN+/yStwu0Qc1Ys9f+PjS9lCGgc6jxSFy0pIOvlYWhqjQE53+eiWfr9dkKxILNxeZ
         Psrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745398720; x=1746003520;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XPH17I4ByfRvhzK6JEBH2X9LLFdHrZvG5tQMgObXYcY=;
        b=xAsPqPdDhNc8ICX7yeYNUyU6SMaTlx30StbNhGDROvFoAf64KQObz9kenaDEljApNQ
         eHYLhpYn/U/6P5e9KnNZik3y/tinYGwaUvPHGY3egg6d4MTdlBeCF2pET3QzAg6mUUtd
         JNwpcArGox0ZsyrIVcwFSrpyqZlbr7g+u01LVWXfGE8PgWcWi6ZzC51NjgneGtF7qt+N
         v4EMM5E7CokQlRdKj1I4/MIy+N+zqjsALXoO65rAxTmKTywwB+fPAiyU2zQxuNCHb+go
         Lt2RqHJbQECh6z75JiLN9ybzW1e/N7NKUfw/yemO9r2nxCz6SLxmSuqi1b/n7sUIvaDn
         O3tA==
X-Forwarded-Encrypted: i=1; AJvYcCUKnfg35TgKQ91B7ipnbSKAYSHLz3EPKTZfZfN05XIIjRAhDJSc3//ltgCmoYifSbm6rGZUFBoxIKq0kJA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXPfrFEGHiiJdqi2vdZ3bQ6oJjysLWCQv3153W5LqQfLr8mCxv
	Cw2fJpzxCfX5Z2p/6XKUo3Sgmzq80DQdi12FeiI8PMuU7TMtXudEgsKOicIDzFs=
X-Gm-Gg: ASbGncvbYlA7CVv9kqVBUoU1dNFEFLERtUDihXbhZ/CwS2cFGzTXuoPtLcnm+PuVq9f
	QQNCgBDutBjWypWJvuVtbPBKOTN2sO1mjjp00He9rxchuD0oxM0aasOKtvp2nCpj09pYUMamspP
	Jcuxoyb06hIoT/XUelQlmChgphn7q1vIDkVrOynKh7yF+iUjq+WHgGZWGgycjMGM+IkueNMkX/p
	wg6bSB1VFFDNHjek2kgnYxbv5EQY+wj82rsYBjooDxjcIL+pzWqWUn6dJiWTNuFe9jBziS7qHPR
	A6lpzAgVKcnbIB5toiYX0ZYmSDQqQemhA9woSLCR6d0=
X-Google-Smtp-Source: AGHT+IF4S09LrLbSM+FpPSpWVvWiOPyvGCGJjG8WXcNrRQavVfCzJ8UKSNqk5Khjopq6gx7t1dvnHQ==
X-Received: by 2002:a5d:47aa:0:b0:39c:cd5:4bc0 with SMTP id ffacd0b85a97d-39efbaf70bfmr14908891f8f.52.1745398720120;
        Wed, 23 Apr 2025 01:58:40 -0700 (PDT)
Received: from [192.168.1.3] ([77.81.75.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa4a49b5sm17987165f8f.86.2025.04.23.01.58.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Apr 2025 01:58:39 -0700 (PDT)
Message-ID: <b05aa0fc-05ab-4784-90ab-2d91b78d152b@linaro.org>
Date: Wed, 23 Apr 2025 09:58:38 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] perf tool_pmu: Fix aggregation on duration_time
To: Ian Rogers <irogers@google.com>
Cc: Stephane Eranian <eranian@google.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>,
 Kan Liang <kan.liang@linux.intel.com>, Thomas Richter
 <tmricht@linux.ibm.com>, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250423050358.94310-1-irogers@google.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250423050358.94310-1-irogers@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 23/04/2025 6:03 am, Ian Rogers wrote:
> evsel__count_has_error fails counters when the enabled or running time
> are 0. The duration_time event reads 0 when the cpu_map_idx != 0 to
> avoid aggregating time over CPUs. Change the enable and running time
> to always have a ratio of 100% so that evsel__count_has_error won't
> fail.
> 
> Before:
> ```
> $ sudo /tmp/perf/perf stat --per-core -a -M UNCORE_FREQ sleep 1
> 
>   Performance counter stats for 'system wide':
> 
> S0-D0-C0              1      2,615,819,485      UNC_CLOCK.SOCKET                 #     2.61 UNCORE_FREQ
> S0-D0-C0              2      <not counted>      duration_time
> 
>         1.002111784 seconds time elapsed
> ```
> 
> After:
> ```
> $ perf stat --per-core -a -M UNCORE_FREQ sleep 1
> 
>   Performance counter stats for 'system wide':
> 
> S0-D0-C0              1        758,160,296      UNC_CLOCK.SOCKET                 #     0.76 UNCORE_FREQ
> S0-D0-C0              2      1,003,438,246      duration_time
> 
>         1.002486017 seconds time elapsed
> ```
> 
> Note: the metric reads the value a different way and isn't impacted.
> 
> Reported-by: Stephane Eranian <eranian@google.com>
> Fixes: 240505b2d0ad ("perf tool_pmu: Factor tool events into their own PMU")
> Signed-off-by: Ian Rogers <irogers@google.com>
> ---
>   tools/perf/util/tool_pmu.c | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/perf/util/tool_pmu.c b/tools/perf/util/tool_pmu.c
> index 97b327d1ce4a..727a10e3f990 100644
> --- a/tools/perf/util/tool_pmu.c
> +++ b/tools/perf/util/tool_pmu.c
> @@ -486,8 +486,14 @@ int evsel__tool_pmu_read(struct evsel *evsel, int cpu_map_idx, int thread)
>   		delta_start *= 1000000000 / ticks_per_sec;
>   	}
>   	count->val    = delta_start;
> -	count->ena    = count->run = delta_start;
>   	count->lost   = 0;
> +	/*
> +	 * The values of enabled and running must make a ratio of 100%. The
> +	 * exact values don't matter as long as they are non-zero to avoid
> +	 * issues with evsel__count_has_error.
> +	 */
> +	count->ena++;
> +	count->run++;
>   	return 0;
>   }
>   

Reviewed-by: James Clark <james.clark@linaro.org>

