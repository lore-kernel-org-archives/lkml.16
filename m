Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF2DB21B9F2
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 08:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750321449; cv=none; b=JdGbg4McquYyiqnKHPJ2FiYITvxLYLujPdHFH9HApYpNgqGmOv9hZg/b7z30BxGFuPYe9oaE3BpK3QH9Myg/qvHipE2xCiINrCKtJTxamBA4+tRXRb+xYXAhHIraavluBoyTqwE1jgzrnLF22Wz2g92KlD4ABy6or9NjlmZo5WE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750321449; c=relaxed/simple;
	bh=fjuJFMaIgczpX1qC8kqBKhEOVuSRrClkmArcMFGn2Kk=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:Cc:From:
	 In-Reply-To:Content-Type; b=CF6FbnIsBhTgvRahhAOm078bXPyFOBH75VAZNHbsZch4LJzvs+81viMlwtfejsQFBuYNVgTIhLyeFT2TdbKYnVUmQdFn4I3wKHR5SRmUoOdIM08pfbUcAbp1soKS52yPJpK6+XoJxR1QCxxaMd4pmcIPfuvxtpawKtdME6tqAyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ttOXseDz; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ttOXseDz"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3a365a6804eso317233f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 01:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750321446; x=1750926246; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Q22zQ9ihJ48zZasqPlIeu40rg877vsTtc5J9Nn4uWg0=;
        b=ttOXseDzvDx+0HSFdHpjUDGIisAWbsLyzZVw4uQrhg/UualYbcCcoYebzOXDTGu064
         vFaqY5iDYt3DZGojtIcJsyWGrNBauWnuIXaOGewcwpfr1JfybuWRHkgFlR5QnqVBVUSh
         9V6V9T0wk3nvJ0z35Yes8Wi1EIhKkgE6DjYbI6xZXEX45zb/TvcGDimYEXwJl/dG9PQc
         /7lYPZoti7ymBEeZZO6N6U84gLZkhNh1zFR3neQPhURiu2OJ4jaCGw2W7d4NU4btcOOM
         qOQvsTZEh4XQn+HgyqinidPaYv3n062nhihZfRohBVoe04SaVOzvD2TGvrsv2EkjuNyh
         +87g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750321446; x=1750926246;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q22zQ9ihJ48zZasqPlIeu40rg877vsTtc5J9Nn4uWg0=;
        b=cswELYSBiOsbGt5eZ9NSpeDIzVpYHuJRWc/jqg8Bpgfz6HvRVy9naF3QV1r+BwqB9q
         9hN34vrolVplAq45HBJDedablp0NU2uISzL9b8Rmy8Ns8qn6xBFO+K4WTqoKou2pF8f1
         2jZsDKj3kj9czS7Pic5l5r1umJZ4iuFM9UzHK8j3OIKfv2C/V1iDmcQxCkgtwp5FxnMP
         KkQ5YRnM6bye42wUcJ9dvom1ssFFXUKiMHwzoDlilsmlHZcGysmxKMAYTCqReXJ7rAk0
         0HFRvvqUChsQ02sNHXS/VGijv7U0jggIzbYXnp/rNTPPZWkQPOuOMlgBZo9I1TPqr2tB
         Kjsw==
X-Forwarded-Encrypted: i=1; AJvYcCWreAylCXNKomSmidwW8gDJkRiXCk1kEuywk9uhr1Z9yTTON/xGxkgwyk8f2SxWFN4Gyobkcgy9dW/iAuQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8OC5FUSl7LBD8XUhN21GV9aFRyooi2UJj48pbb3VKGYySA27V
	gF1rY8eyWi4LPehybRTQm0swvAyIbN9BYAB3snuTJyUD2keyMUj+MqeK8vfjCuKIPVM=
X-Gm-Gg: ASbGncvVg3Nur4acjbMau99bW2qEFmUJXfonhJiG6Fpy+d4x2S3vvnVdiFxnlcxBtt0
	rUDnqsRoi8u3oRSKxxblJ4HNW4bDEbZ8TOBAw09BKKdidfIUlxM5EjimbJ/vS/oPeMt0n39HPDE
	mFT+indPByc58mENJHwX/jC6TBfoPNStvCrYTrK3Ixnyg5m2uGizZF9EL/lpSvq8nNIoYxhwRt3
	YzrV2epNCtkXO1StutuoqD8nAR7G5quiCB7P7TVBnZhEJ2z5xMHAvWGOYMfHTTcaymQ0rPdRohB
	gHT+HYJCqj8glOdQ96uxe+m7OrvQGPecHbvVffaO1u4vtEYK0XJpbm7GjkvZfVLF2qs=
X-Google-Smtp-Source: AGHT+IG3prb0JZdG8yBrJXbPEyJddXNVxU6+WbkUTfokRjiQKzSLM7C0hI5dwVQ+QosuYnaTi5pF6w==
X-Received: by 2002:a05:6000:26c4:b0:3a3:652d:1638 with SMTP id ffacd0b85a97d-3a572e585a1mr16943912f8f.48.1750321446278;
        Thu, 19 Jun 2025 01:24:06 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b3c0d3sm18939648f8f.79.2025.06.19.01.24.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jun 2025 01:24:05 -0700 (PDT)
Message-ID: <393e7584-7ca1-407e-bd42-4079e5d8d4e2@linaro.org>
Date: Thu, 19 Jun 2025 09:24:04 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] perf test: Add basic callgraph test to record testing
To: Ian Rogers <irogers@google.com>, Thomas Richter <tmricht@linux.ibm.com>
References: <20250619002443.100301-1-irogers@google.com>
Content-Language: en-US
Cc: Dapeng Mi <dapeng1.mi@linux.intel.com>, Chun-Tse Shao
 <ctshao@google.com>, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>,
 Kan Liang <kan.liang@linux.intel.com>
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250619002443.100301-1-irogers@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 19/06/2025 1:24 am, Ian Rogers wrote:
> Give some basic perf record callgraph coverage.
> 
> Signed-off-by: Ian Rogers <irogers@google.com>
> ---
>   tools/perf/tests/shell/record.sh | 20 ++++++++++++++++++++
>   1 file changed, 20 insertions(+)
> 
> diff --git a/tools/perf/tests/shell/record.sh b/tools/perf/tests/shell/record.sh
> index 2022a4f739be..603fa6b79b5d 100755
> --- a/tools/perf/tests/shell/record.sh
> +++ b/tools/perf/tests/shell/record.sh
> @@ -12,8 +12,10 @@ shelldir=$(dirname "$0")
>   . "${shelldir}"/lib/perf_has_symbol.sh
>   
>   testsym="test_loop"
> +testsym2="brstack"
>   
>   skip_test_missing_symbol ${testsym}
> +skip_test_missing_symbol ${testsym2}
>   
>   err=0
>   perfdata=$(mktemp /tmp/__perf_test.perf.data.XXXXX)
> @@ -359,6 +361,23 @@ test_precise_max() {
>     fi
>   }
>   
> +test_callgraph() {
> +  echo "Callgraph test"
> +  if ! perf record -o "${perfdata}" -g perf test -w brstack

Looking at 2dac1f089 ("perf test: Fix 'perf script' tests on s390"), it 
looks like this won't work there. Although I'm not sure why the fix 
wasn't to change the default -g mode to dwarf on s390 if fp doesn't work 
at all. That wouldn't fix -e cpu-clock being required though.

Thanks
James

