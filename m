Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B322A63B9
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 10:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750413688; cv=none; b=mOz3bN3QuUtFP3kqDcGNPuUVgfJVpyxgNLMPBH/GyglyZ+/Q1c6oBiVaXDr8YnX9E9t/TdKMdxnedxKtJcGu4joUITTGLO+HX1a85n3CT/HYy7RrDLiPBz9hEDTVdnXB/ZF5Kh76w+j7pjZr+QBwXOj+kKh/EOnAnmKIU568cTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750413688; c=relaxed/simple;
	bh=XX3jpB7mpBpXk+bdtyKB6OPlgo/vZPvUa9NFJ93m3uk=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:Cc:From:
	 In-Reply-To:Content-Type; b=CF6N61MJBt5AAdkMTajDOPanYsbD2E2afw98qBoweTVmaPt65a2TvwSv63PAfCI3peCfh67f1s5+kM5M7XHmHxrVqnFG1FDXIhdQ4MTn3+Zcly9sEjVqlH2i101tExYWy+CQcXRu442FeEYA+48Oqgi/X5B8g5/my33WqB2Jx7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BdfBSmxs; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BdfBSmxs"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-450cfb790f7so12445105e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 03:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750413685; x=1751018485; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mMrWYnnZWM4Y5pjy/CFIMa2zim/OPrqscxMGLqeMAX8=;
        b=BdfBSmxs9mApCLTrbBtCJJtsq8iTQ1AzPs1UZ58y/PLugPP978hL84d+VrewTiNydF
         PExq99JMK2Q01O68L5tAXO7mcZVIAvNdvn4n/6RG37A56yTE4+TTW2VvoaXcr5rQlC6Z
         7tl6HbrpiMX5pJqrX5Y6Up1K/dkFsPbT3rKPShM4lpH6wKE/7yEQ0IT540DYF1aErbG5
         p9L1rFrugAZaGVLwh3Wc80DieWX4zQGA6If8rcJKj7GioRjZ+vbEriHISOhWtgMHZELU
         Ppduam5W9UeUpoD0ow+K+TH4pWLbXtA/bkv+6PZH0VecilwaVmt7webr9aArFuMRBnAC
         PyNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750413685; x=1751018485;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mMrWYnnZWM4Y5pjy/CFIMa2zim/OPrqscxMGLqeMAX8=;
        b=WzejL+dgpJDSmOwD9LSAGiOoXGfXsO/NImi27VxLDQy/JyRiDsAw8N/vJxMcmA7WTJ
         5qSR9i83gAheinjghz+Z8Y8UNU8+plHJYlER7txPp2topHEtwdd9zDoapjAgu2h9Ho2t
         ENo3cxRdxmsbICVe4pabxP0ZKjJ0FI4LGEFb1OZeJEXaj1bkT2S/jTjj0pTaNAbs+rnh
         jEz9xVgy+gQLwSHYd0/sVzY5kipXap791Rn+OFGoyql3+DBLe/JmJaxTtTQxIQ5t2ZGJ
         DkiSwE26esBHu4pz0rC/6fS7ACEdCwTbYnW5oXubU6KMGaV1KHyNDvLQNOqbeE/TOK5V
         vOEg==
X-Forwarded-Encrypted: i=1; AJvYcCVn4pFT2s4ceQYpdSkqPsu1YPx5cR9IXO4N0oImifZbDvvPucQ7tz78tTswtd3ZQnzfaGV2E74kgfe9TkM=@vger.kernel.org
X-Gm-Message-State: AOJu0YydB0Ez+9+9aJoOSpGXGyYeVTByqBlDZOjJFt2t8X4hRirByq0H
	wRP0DEN/pY8RVaUR7gb4RdcsvVaijYCR8ckBSZUHgB+R+6kE+l1SwZlof5V+M8I9vAo=
X-Gm-Gg: ASbGnct7C/4G3nr1/JCUj4cTxxCu8gdij9AJkHZfVSPBdSxyeqFvqisQD7SeFhec67e
	8bq+A3zlJHldmnU/QhVYatX/gbYb5R2o+QC1+JYlIcqzBOZ/N40yPT0tV7tw6dX5f3qPE4jWRdj
	2QuxAu8s2K5Ds0r1gZ03cYYbBM+kuYWUczVZ1PwNzNFji3zyCUhg0DkkfIykz1DIhSuark10elB
	umXS5fqlsElgncxRj1ZigmVFqUgOn1PggPpY5Fmk7thdWToixgxbLdBxz6N18IF89Mzk2oP3RHo
	bd+ZuU+QCbR/RsVC/onFUyoT2XZ7cgvueL4S9BeM0KW4X8Hw3iz77HQj+VxUSLIY824=
X-Google-Smtp-Source: AGHT+IHe618MZafhnAT+zQw765nD0vsugMDIuLNgSEIgsjw+wJ9N00rnaNZABT0XgCzi2ieKxGyKvw==
X-Received: by 2002:a05:600c:8b07:b0:43c:ec0a:ddfd with SMTP id 5b1f17b1804b1-453653cc952mr18036295e9.6.1750413684863;
        Fri, 20 Jun 2025 03:01:24 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535ebd02basm53176285e9.39.2025.06.20.03.01.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Jun 2025 03:01:24 -0700 (PDT)
Message-ID: <4a8dbb2f-9058-416b-8055-46a3afcae0d1@linaro.org>
Date: Fri, 20 Jun 2025 11:01:23 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] perf test: Add sched latency and script shell
 tests
To: Ian Rogers <irogers@google.com>
References: <20250619002034.97007-1-irogers@google.com>
 <20250619002034.97007-2-irogers@google.com>
Content-Language: en-US
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>,
 Kan Liang <kan.liang@linux.intel.com>, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250619002034.97007-2-irogers@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 19/06/2025 1:20 am, Ian Rogers wrote:
> Add shell tests covering the `perf sched latency` and `perf sched
> script` commands. The test creates 2 noploop processes on the same
> forced CPU, it then checks that the process appears in the `perf
> sched` output.
> 
> Signed-off-by: Ian Rogers <irogers@google.com>
> ---
> v2: Skip the test if not root due to permissions.
> ---
>   tools/perf/tests/shell/sched.sh | 91 +++++++++++++++++++++++++++++++++
>   1 file changed, 91 insertions(+)
>   create mode 100755 tools/perf/tests/shell/sched.sh
> 
> diff --git a/tools/perf/tests/shell/sched.sh b/tools/perf/tests/shell/sched.sh
> new file mode 100755
> index 000000000000..0a4fe3f414e1
> --- /dev/null
> +++ b/tools/perf/tests/shell/sched.sh
> @@ -0,0 +1,91 @@
> +#!/bin/bash
> +# perf sched tests
> +# SPDX-License-Identifier: GPL-2.0
> +
> +set -e
> +
> +if [ "$(id -u)" != 0 ]; then
> +  echo "[Skip] No root permission"
> +  exit 2
> +fi
> +
> +err=0
> +perfdata=$(mktemp /tmp/__perf_test_sched.perf.data.XXXXX)
> +PID1=0
> +PID2=0
> +
> +cleanup() {
> +  rm -f "${perfdata}"
> +  rm -f "${perfdata}".old
> +
> +  trap - EXIT TERM INT
> +}
> +
> +trap_cleanup() {
> +  echo "Unexpected signal in ${FUNCNAME[1]}"
> +  cleanup
> +  exit 1
> +}
> +trap trap_cleanup EXIT TERM INT
> +
> +start_noploops() {
> +  # Start two noploop workloads on CPU0 to trigger scheduling.
> +  taskset -c 0 perf test -w noploop 10 &
> +  PID1=$!
> +  taskset -c 0 perf test -w noploop 10 &
> +  PID2=$!
> +
> +  if ! grep -q 'Cpus_allowed_list:\s*0$' "/proc/$PID1/status"

Hi Ian,

Because taskset is also run in the background it's possible to grep the 
proc file before it's managed to re-pin itself. I saw some intermittent 
failures of the test because of this.

I think you'd need to run noploop in the background but taskset in the 
foreground and give it the pid of noploop to make sure it finishes 
before grepping.

Other than that the test seems ok:

Reviewed-by: James Clark <james.clark@linaro.org>

Thanks
James

> +  then
> +    echo "Sched [Error taskset did not work for the 1st noploop ($PID1)]"
> +    grep Cpus_allowed /proc/$PID1/status
> +    err=1
> +  fi
> +
> +  if ! grep -q 'Cpus_allowed_list:\s*0$' "/proc/$PID2/status"
> +  then
> +    echo "Sched [Error taskset did not work for the 2nd noploop ($PID2)]"
> +    grep Cpus_allowed /proc/$PID2/status
> +    err=1
> +  fi
> +}
> +
> +cleanup_noploops() {
> +  kill "$PID1" "$PID2"
> +}
> +
> +test_sched_latency() {
> +  echo "Sched latency"
> +
> +  start_noploops
> +
> +  perf sched record --no-inherit -o "${perfdata}" sleep 1
> +  if ! perf sched latency -i "${perfdata}" | grep -q perf-noploop
> +  then
> +    echo "Sched latency [Failed missing output]"
> +    err=1
> +  fi
> +
> +  cleanup_noploops
> +}
> +
> +test_sched_script() {
> +  echo "Sched script"
> +
> +  start_noploops
> +
> +  perf sched record --no-inherit -o "${perfdata}" sleep 1
> +  if ! perf sched script -i "${perfdata}" | grep -q perf-noploop
> +  then
> +    echo "Sched script [Failed missing output]"
> +    err=1
> +  fi
> +
> +  cleanup_noploops
> +}
> +
> +test_sched_latency
> +test_sched_script
> +
> +cleanup
> +exit $err

