Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95AFE25EFBD
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 10:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750413714; cv=none; b=OhkJOs5djvJ5IQmbpydfpwDBN0NXaxm/DiV/gZSZ3fFqICQ6vQTnIfCPbyX+wTqICBxT5UhgqdrFEXsJirU6y/WAwO3UrPpTFA2i8AiSYX9o2lJKsCYnKakF49qFqjDgGO7fGh1/8zn3ij+ZWkeXGPtd8RksCLL27U2Bl40SjyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750413714; c=relaxed/simple;
	bh=/oIbt58tuRVwC/4Z7+QARdzA9077RKCqGqQQCvLgcSg=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:Cc:From:
	 In-Reply-To:Content-Type; b=Ayi8HDHmEGZ1Se0pMvIWbuw2SjYtw3nzpFHP7A+6iuknQt2J9dU+h6dUPR8jqYhBJmAVqCMYa6jv3BCBFY3nGWeFmRLZgYSkpHqv50/YmOMhihHhePLlQ4IOSFf4DRtacheCHx2fRcAuHoLT5TGk8/SYRaQTlAKXrrHxi0IoaEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pFFkoJaT; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pFFkoJaT"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a510432236so1285323f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 03:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750413711; x=1751018511; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1V33PwliDsadgSCJN5N+hOgt1qTEJhFyyYHDF4V+qVo=;
        b=pFFkoJaToCJ9PHZrHlYf8pQJxzrAI23blyDQcsL+o3k7xDk9bdeyojYRaH5je8TPK/
         OLWcvNqsnVoNJWC5CjbwoGhSbupW18azoufJkJkvuMQq3sTpw6cfScRtCfYpCEQ+/XRI
         QU6AAJwRXPsjisbEUhaBcgVA6aJunwRnPiprUxRzkkv2fO4w3NdWeCVBL3oanJWbCPbH
         pIRHJAOlKJMxgMb6N9VBgH1vPJ2ujFY7+O5Eb7MaZpwtmtUAWbpRIc3kE8LpbcPjrCUp
         HfTQs+lLdLViV8MFGXnIiCxzOftzicgtu7y41sXH7ZlAKgHSeAgQ5ik8TSWfQDSk8kUk
         kgEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750413711; x=1751018511;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1V33PwliDsadgSCJN5N+hOgt1qTEJhFyyYHDF4V+qVo=;
        b=bMkxQI5KN2lrxGTQGxXmDerMDy0nen+cmJ0+L1VeJzu04qkvmAy327EvdacPM2yxMD
         Q9+lSni67+yaM/nPpIY5gExy5+XbTjPbGGQlKqrPuElspYA/0B8EoCd7mfsvJuJCj2Sa
         f4DuB/jMfjpNdhThfd6XJ0HYH5GCrFBrDSSU00qfJHd+IR86fBKhhqjvDvNeE0e5WG15
         yagqST75zJ0p/mzBLLlamJ/vspOGjP9yKN/nl51YJsGITZkRtTrU88jMo1dQU1UyBZbK
         /27mSr5JURV6wnmjbwmPJZjwMKb+RQm/2/XWDQnf9j1ZInlh5Wj5AoUWY9VevbevePGc
         O0NQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7rCXaHZJZbEPH57wLiyBrZ0a4yLeHd7ZgK/LJKrIqCBrBHNVUqXg9CW+yDgSEfbxdy9lVIeeIqlJWlcE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxFXxws9aqp/wRXiivY44KtQK9h74PplLBmx9qwrEYtXOOHpT3h
	csJ9nifjqkWKMN8Czq4nJUKBQirgvLahDntoaoVLRw1Xcic+JOi6tExgtgxEwTOB96Y=
X-Gm-Gg: ASbGnctXT6ztDlYFYGIvezfRd1IfSQ8PJ4KRI1nG9y8d4DHXCdflOtAr/0aztOMnwwe
	cAsFWkelN90NTpsVRn2qn0KpkSH7hgOvZQYt1Dg0aEq6OhZfqkrBXWfKdwTmSgVEPVB7XSSCAyv
	FPBxe7jd7OR8QzmSHSdaDK998uuB1F3+dytSdCk3iqpkhH14YwEufZcbY02AOYdrlawUvf+64xE
	u06IPSo35hXrYMNlxVVYFH+lKaLUWtfc0tThnOsmgxTyD8bUP5xXRwi15HrcLMD+k7G8D0mwhnK
	1h33n0ktgEvJX9uh/pvJzWYGbvmGNCgaXEs9ABZXiugwKXhf7UpwYee25NuzInWV8pg=
X-Google-Smtp-Source: AGHT+IEOxlN14CZssrk21oXKOAAcd7bGl3s1RkhHEHJxhspuMIQNqubVwKdpBhp8yq4BcmgE9nzj5Q==
X-Received: by 2002:adf:e181:0:b0:3a4:edf6:566b with SMTP id ffacd0b85a97d-3a6d12dbd65mr1556907f8f.6.1750413710684;
        Fri, 20 Jun 2025 03:01:50 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453647070cesm19750175e9.33.2025.06.20.03.01.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Jun 2025 03:01:50 -0700 (PDT)
Message-ID: <069ef044-7e06-466f-a10f-66f7c8aacac1@linaro.org>
Date: Fri, 20 Jun 2025 11:01:49 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] perf test workload noploop: Name the noploop
 process
To: Ian Rogers <irogers@google.com>
References: <20250619002034.97007-1-irogers@google.com>
Content-Language: en-US
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>,
 Kan Liang <kan.liang@linux.intel.com>, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250619002034.97007-1-irogers@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 19/06/2025 1:20 am, Ian Rogers wrote:
> Name the noploop process "perf-noploop" so that tests can easily check
> for its existence.
> 
> Signed-off-by: Ian Rogers <irogers@google.com>
> ---
>   tools/perf/tests/workloads/noploop.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/tools/perf/tests/workloads/noploop.c b/tools/perf/tests/workloads/noploop.c
> index 940ea5910a84..8b954d466083 100644
> --- a/tools/perf/tests/workloads/noploop.c
> +++ b/tools/perf/tests/workloads/noploop.c
> @@ -2,6 +2,8 @@
>   #include <stdlib.h>
>   #include <signal.h>
>   #include <unistd.h>
> +#include <linux/prctl.h>
> +#include <sys/prctl.h>
>   #include <linux/compiler.h>
>   #include "../tests.h"
>   
> @@ -16,6 +18,7 @@ static int noploop(int argc, const char **argv)
>   {
>   	int sec = 1;
>   
> +	prctl(PR_SET_NAME, "perf-noploop");
>   	if (argc > 0)
>   		sec = atoi(argv[0]);
>   

Reviewed-by: James Clark <james.clark@linaro.org>

