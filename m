Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69572213232
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 10:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743159344; cv=none; b=l9wdxRQfC+tvfyxA6CbyFo/DJbqtUV8xD4HQY3F4Y7+ynQRdGmdWNYEdIwZaSfhWhWxEeBe6BykBuh0gIzbx4SNMVJQOJ2Wtb2+J3WeoZg8QVKeRrP0LZbeTB39eur2OgijUv2ZP5Xu+8WPfi4yG+caWkHXAiuTpIzevQH9pW6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743159344; c=relaxed/simple;
	bh=a1rly5gUjRmHoKNV/zsYKyvyzWBEx5uJp0WvPNmcVHs=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:Cc:From:
	 In-Reply-To:Content-Type; b=O1fXgiHg3lwsBF9f3g+mZEYhH6P0WEN/quRaE+7m0uV9yTkyc/hLVW9RcKLbMFFSwN58POHLDua57Cr7UwKJGFKIcvYst2rU/Xma0FPwXRnZ6diA06bTe/Ebos6h4XIVhWl6QdKr424NAkErKYOzWlOfYusT27/C3blX5Ur09A4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VKQmSvqE; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VKQmSvqE"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-399737f4fa4so878502f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 03:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743159340; x=1743764140; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jlWuwEyib7bXwZotu7bXNMhvHgZvJuZ47SfBzkqHSrM=;
        b=VKQmSvqEshjjasFJ/wkZyrnlqFdq0qNYEtXZjSZTok2xfb4VtJfv3jrRe11T+mZ7yM
         kQGM4MYnl1A5xuTs/O1nmbGGITRrtBlX62t/W8l3FLZjB0AjbYqRz7wyno5JdPm/tAoW
         bizcGx0Bv3QY5meKIRXINxMuFXbl8cW04xQhRdwjq12cFxrmI5uWzUpqE9t6+sPnNSCu
         HSGGjhXdHgueF9Dzod8JFHMvipPgZjSQo0h4dXFz7JjbgAdwns261u1WWTG5LQJzu8Yk
         b4raLWPFjgnHBy+Ey81FaQgjcELTo487MDVk5AOxf5pywTSlEoDolB0vX3ZU5qOBStAp
         zwng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743159340; x=1743764140;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jlWuwEyib7bXwZotu7bXNMhvHgZvJuZ47SfBzkqHSrM=;
        b=Fpc+iqaBJ3OV6wTcKGcvvSSui3qo24Xn0k63Z543Uz/gSatW34ryjye6SVcqXBdVQP
         WI5KhofWIFzqtFGSy/F7EGiJeRUNTpayRmtLyMxGVsFVk9owJz78wihx7H1ApV0J5ypE
         zDDRXf1ok+6Ek3LjMccEXPPyxh/ZJiHWPkcsgSZmLENUHxOsC2Xo6guiWoMsid/Dktww
         4TAlaRFRt7yyTeNilGpSXgCvc5kOBKg3BmfjDA9pXad/VClSFoZxs/wFDAZgTiXWw9uK
         E+ghml0sYiCvRcQcW+vFek9q7VqVJPF3AoA/NBhK1xplPgM6sIM0tvN+OoJz39KRnzA9
         eQBQ==
X-Forwarded-Encrypted: i=1; AJvYcCVSiG0y/xvj7OvDSfQ8PFIfFBeUbENcSa3deymblEu4vf4ppWcMzvQH9B4nEc3D98OlSys+BeRPi5CjNu4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwlsjF9JvhtY+RCmMO8Jk/EZ7MWkQe6dtdftRZGLjfjyD1K5cjH
	3EI5ketjUPCdRP0gzj7tdcPK1kMA3vUgwR/ZFlTVZedXbiITfDvjIUv0X6Q79Uo=
X-Gm-Gg: ASbGncuXg17WIyj2uNlPGLYeKGQRHEGlFJoHS3u7htY+XdwfplCHZ9f0tVBaU2y877X
	Dm0T9CwLAzoUvtgI1ECmUVPiZ9sqRHx86+kO0BYn+OG+O8S1TQzCW8frsEULJzkosug5EneXYC3
	bmcgPfLdRtgg6nr04eGcpNOxCV1h1/pbv7V1fTlOirofHQT0+yv4aiUrJddiQglyWAds4WdoZnJ
	Q6FvRiB/yAUA+TmdygX9U+FcbG2ncZn1dLJ/0zcI8qFx+PrzNZuLoL3Dla8a1nXttidTIMwXtMK
	ex+qBfY3MNimpmz0yIv3/Xk8acFq8fj3YHAYCzJvcGxf6VIv0g==
X-Google-Smtp-Source: AGHT+IGpJg4Oq+TQPYDqZ2gf0BvpT6xO0x4HFewwKq64hg9Uw0vquJBndWaTVIT8A6IIrPjIrbk7lg==
X-Received: by 2002:a05:6000:184c:b0:391:2d61:4561 with SMTP id ffacd0b85a97d-39ad17544cbmr6256409f8f.6.1743159340557;
        Fri, 28 Mar 2025 03:55:40 -0700 (PDT)
Received: from [192.168.1.247] ([77.81.75.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b79e0afsm2249168f8f.65.2025.03.28.03.55.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Mar 2025 03:55:40 -0700 (PDT)
Message-ID: <6ebf4627-913a-409c-98b2-7dbc120107fa@linaro.org>
Date: Fri, 28 Mar 2025 10:55:38 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] perf stat: Don't print uncounted hwmon events
To: Ian Rogers <irogers@google.com>
References: <20250328045337.229354-1-irogers@google.com>
Content-Language: en-US
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>,
 Kan Liang <kan.liang@linux.intel.com>, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250328045337.229354-1-irogers@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 28/03/2025 4:53 am, Ian Rogers wrote:
> Aggregation is different for core events compared to uncore. For
> uncore we don't want the counts for events not in the aggregation
> id. Switch the !counter->pmu->is_uncore test to a
> counter->pmu->is_core as the hwmon PMU doesn't set the uncore
> boolean. There are 2 booleans as some PMUs forget to set either
> cpumask or cpus that are used to determine whether a PMU is uncore or
> core. Also check config->aggr_get_id is present as the non-core
> 'software' PMU doesn't have it set.
> 
> Before:
> ```
> $ perf stat --per-core -e temp_cpu -a true
> 
>   Performance counter stats for 'system wide':
> 
> S0-D0-C0              1              63.00 'C   temp_cpu
> S0-D0-C1              0      <not counted> 'C   temp_cpu
> S0-D0-C2              0      <not counted> 'C   temp_cpu
> S0-D0-C3              0      <not counted> 'C   temp_cpu
> S0-D0-C4              0      <not counted> 'C   temp_cpu
> S0-D0-C5              0      <not counted> 'C   temp_cpu
> S0-D0-C6              0      <not counted> 'C   temp_cpu
> S0-D0-C7              0      <not counted> 'C   temp_cpu
> 
>         0.001375790 seconds time elapsed
> ```
> 
> After:
> ```
> $ perf stat --per-core -e temp_cpu -a true
> 
>   Performance counter stats for 'system wide':
> 
> S0-D0-C0              1              38.00 'C   temp_cpu
> 
>         0.001260575 seconds time elapsed
> ```
> 
> Signed-off-by: Ian Rogers <irogers@google.com>
> ---
>   tools/perf/util/stat-display.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/perf/util/stat-display.c b/tools/perf/util/stat-display.c
> index 91386429115d..ed3270ab2557 100644
> --- a/tools/perf/util/stat-display.c
> +++ b/tools/perf/util/stat-display.c
> @@ -981,7 +981,7 @@ static bool should_skip_zero_counter(struct perf_stat_config *config,
>   	 * Skip value 0 when it's an uncore event and the given aggr id
>   	 * does not belong to the PMU cpumask.
>   	 */
> -	if (!counter->pmu || !counter->pmu->is_uncore)
> +	if (!counter->pmu || counter->pmu->is_core || !config->aggr_get_id)
>   		return false;
>   
>   	perf_cpu_map__for_each_cpu(cpu, idx, counter->pmu->cpus) {

Reviewed-by: James Clark <james.clark@linaro.org>

