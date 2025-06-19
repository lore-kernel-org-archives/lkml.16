Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E48C5222577
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 10:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750328931; cv=none; b=n2hfbxD+9OXaYYm493J40AtNyrlq5lDQ5IJhvs+sZSgw62oj+DkgGZ7W1+fHIWjiTzSKFybzKDCW+R+j0U3xcBYAyf0XnfBB6KRtINvgem4ow/ureXZsuex7BrRSnYY11H1F0KB155Rx/V+16Zib14+u14bbRykAEdTATC2Q5B4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750328931; c=relaxed/simple;
	bh=5qvqfMcze7cLjGLEuTDIxztt8BOtmCXLYindzOT3lfw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Nq7wZRHSEKlezdYq+mtqQ3eDdMajrm6M9CtyHOMJ6wgP3hgpXAdbrh08Z7UmSiR4y4JeH7H0f+VItbbsy0rtO+QZIvtO7xhqiN+4IHSzgV4hYX2u4HOB9a7Hg5WQo4lL4FK5yvcLhHEw19/8eRCu2ltbI4wAudVT654q/hCAo1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AgzhajJv; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AgzhajJv"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3a531fcaa05so308919f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 03:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750328928; x=1750933728; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hVEUVdRtq9rZDfocx5InCdOyBFQKK/3wZPDu0Oee+YU=;
        b=AgzhajJvVKLa7/sdfKWGg8szDqto9dgWOKwBqSlvev1AvaXIPCBmaHKv6g9/dNQX0m
         jEJZb0RgVXhuYOQpAbOZg+sfqD56BYVo/FFChRhYHH+RPyT8BdhGKKe08u99SkDMO198
         ysSWVRraHse77CXNltyeMrI33EvYg4kj5wbiCQNDWre1vUeNVCHFtNEGoVNW7k/4AG4B
         VYy/HPaSz+edayn28jA+RV2cWkukghkHPrAiyLwMHtK8LhEgx7tHc+AVOebNDYnxsiG6
         HwB/R4qDuTNhODYWQUBxwo6BaLF48vGUfeTkrJCUOKWZ0cnj7reT1A4UXRTf38DzsiI8
         oWKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750328928; x=1750933728;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hVEUVdRtq9rZDfocx5InCdOyBFQKK/3wZPDu0Oee+YU=;
        b=fAaAQxvieMIwYwmlqCCwY4OomCBUYPZZ92dv1U1p9TWpkhK9JeBBmhWGpq4uN7H6Nv
         2fm1C0hVtkoYr71zCHy1P3lg9R63qM987ogxRQKl32B3e+HIHf9T7BWVdxoi5ERR5OCY
         1Aqd7KrtHc6vl8Y7YlhphaYktRFZcFUWXXCIcunJ03zrbKg01Ka/g/XkfpUbhBu43l8d
         T6jAMQpAJxpkVKMP2oacjUA11M56ELBbGEvadoHvkkwZwV3G9fzuEoMEm/A4FRLxsTXZ
         z/prHwmMuH9KKE0LV8Sl2iY1lM1oMeKBfnOcIxrsYo0Y9Zm6CVFxX51hFzQaOo6EKhf1
         7cEA==
X-Forwarded-Encrypted: i=1; AJvYcCWBRY8wbR4fK5xpBeU5yzrcPIniGFNyEIWVTmznubuxEd9IT7Ir0OhJB6Uh5x3l3OtIR9qeobtFoKZKDEY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYr7/r0qQEGX6lsYZPdnGNwhuKWYXM5QpuBIbvbA+USZYM7+2x
	GmV/N4kd00nZtjU22GIX8jpJ5UaJHQr3sfn3+tRo3zsplqfbeM/YdnlppoXTy4zZ3G17aU/4uV7
	HSaf3
X-Gm-Gg: ASbGncvUtnwKQmiV2Q/GnwhzB/lCTMB0m77t7dVFVH53PMOOoaDyK+kKFXmFInO0vGF
	yFbsgjsraP4QJ1Xww3BDojLQSiP48ParvuKm4IkNJ/P9ItYzV1YlkKhL4/qORT1ktECABHBXiA3
	YO6o3ZgCc2gbHflsK7W9ocf94n7/QbSok6JEQBkGKw3TiwA7V7yVBTqPJLbZ/WI/I3TemYNOixq
	PjpgUV+sQlGOaoTMHhu1LXc4Jz0+mBWHL7IROlPeTKTV5HJ8qRPU61Af63769tDbV4K/863D7xg
	9Icyqs2dGBxbXUw4XB2f1/hJx2UyptIIOnHcOzGsBrmCiAQrt3cGWdpxs3rv8jFI6lI=
X-Google-Smtp-Source: AGHT+IEx2YSSQWO7fP8kYOJC+ks89PKgG9aYLFMDHVAeBvxu2cwUIrTYReyJm/cQxYnC7wgFGS+BQg==
X-Received: by 2002:a5d:64ca:0:b0:3a3:6a9a:5ebf with SMTP id ffacd0b85a97d-3a5723a352dmr19570818f8f.20.1750328928203;
        Thu, 19 Jun 2025 03:28:48 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a54d1fsm18906368f8f.2.2025.06.19.03.28.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jun 2025 03:28:47 -0700 (PDT)
Message-ID: <20cce2b1-eaad-4565-817b-b094aecee0a5@linaro.org>
Date: Thu, 19 Jun 2025 11:28:46 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] perf build: Specify that spellcheck should use the bash
 dialect.
To: Collin Funk <collin.funk1@gmail.com>
Cc: linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 "Liang, Kan" <kan.liang@linux.intel.com>
References: <e3751a74be34bbf3781c4644f518702a7270220b.1749785642.git.collin.funk1@gmail.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <e3751a74be34bbf3781c4644f518702a7270220b.1749785642.git.collin.funk1@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 13/06/2025 4:36 am, Collin Funk wrote:
> When someone has a global shellcheckrc file, for example at
> ~/.config/shellcheckrc, with the directive 'shell=sh', building perf
> will fail with many shellcheck errors like:
> 
>      In tests/shell/base_probe/test_adding_kernel.sh line 294:
>      (( TEST_RESULT += $? ))
>      ^---------------------^ SC3006 (warning): In POSIX sh, standalone ((..)) is undefined.
> 
>      For more information:
>        https://www.shellcheck.net/wiki/SC3006 -- In POSIX sh, standalone ((..)) is...
>      make[5]: *** [tests/Build:91: tests/shell/base_probe/test_adding_kernel.sh.shellcheck_log] Error 1
> 
> Passing the '-s bash' option ensures that it runs correctly regardless
> of a developers global configuration.
> 
> Signed-off-by: Collin Funk <collin.funk1@gmail.com>
> ---
>   tools/perf/tests/Build | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/perf/tests/Build b/tools/perf/tests/Build
> index 2181f5a92148..26efc5d20f6c 100644
> --- a/tools/perf/tests/Build
> +++ b/tools/perf/tests/Build
> @@ -89,7 +89,7 @@ endif
>   
>   $(OUTPUT)%.shellcheck_log: %
>   	$(call rule_mkdir)
> -	$(Q)$(call echo-cmd,test)shellcheck -a -S warning "$<" > $@ || (cat $@ && rm $@ && false)
> +	$(Q)$(call echo-cmd,test)shellcheck -s bash -a -S warning "$<" > $@ || (cat $@ && rm $@ && false)
>   
>   perf-test-y += $(SHELL_TEST_LOGS)
>   

If we're enforcing bash style with static analysis shouldn't we also 
change all the hashbangs to bash? Recently there have been changes to 
change sh to bash in some of the tests so presumably the hard rule for 
sh is no more?

In the past I've had to replace bashisms that didn't work in sh but it 
would be nice to have only one language to write tests in. I doubt 
anyone running the tests today is running somewhere without bash, or 
that changing it will break anything. If anything it will fix more 
bashisms that have already been written.

Just for reference there are 34 #!/bin/bash and 42 #!/bin/sh in 
tools/perf/tests

Thanks
James

