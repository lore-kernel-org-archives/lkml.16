Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07E5D226520
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 10:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747994731; cv=none; b=uYAxDkmKwDsJJgxVlHnyXULeMxIjds42eOSGfKUke1SoVFEUNRw3S4UgoIDi7ITqrGFs2ruzRXugcbD5YkiszIDoEht8lfmk+6JeH827PsCFLQXYZXCkMgEo97ka6Y1AhAZIwZooQqy6BsQuBd4BftyEq/AqYlSwcJfet8fDyJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747994731; c=relaxed/simple;
	bh=dOyjMvFwoRuTimOLGEGj8oCS6iO0a5YqNdfERf7c3bI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KXscIwAgJ6CVvRTgfsdbQupwMs7VjwVZ1Hx+nw05RLDbRnKLTZJYfYP3BQ6WLy37Jh1A4dMEN/ov0CNF6GCdm4C9RUs8knge/+yihPlNApmrrThOJ0bLeScZW4umZeCmC5KiV2Jd3bA17z6Eb29+Z9L43hOA7f+lQdf3R1prVlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RsVEwjIw; arc=none smtp.client-ip=209.85.221.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RsVEwjIw"
Received: by mail-wr1-f66.google.com with SMTP id ffacd0b85a97d-3a36f26584bso3278679f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 03:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747994728; x=1748599528; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3psPoU+Wqh0kzdo07Jm8TGZE3fxrcKe7AclQyPNUues=;
        b=RsVEwjIwGC84T05m7ElyzDbXWGcfvkl1syfAfQAPq+aJMpg4EFNkrxaIGEAeL0Jd12
         4DlAwKB7H2k67epglxGNtfaKsJhaDuNmPn+d4BIzXKX+YKGg3aCRn1HOwO0ypgfVWulk
         nmiMwuRWveeZ8EN/nwmjlTyV7p5EbOm4q4i5tviMr8HuBrqewy9hT+Clw3WepXqHK1PU
         NE//R4Q7O/l1nWP7At2ovlhkdLM3/xEJyCioOds5kzL/9Mc1CjKNfeTZxPsEzoZwJWYM
         caUv1FQy2ZlGvLE/CdGXHR8AF0yGSfs2f+/tygbnPeo67+B7gKAvbw5qhND47FA4onNz
         Ubow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747994728; x=1748599528;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3psPoU+Wqh0kzdo07Jm8TGZE3fxrcKe7AclQyPNUues=;
        b=nDiFmp+6KMOtB6xp9pdJDlEdZs3Y5qIbsv7ysItgq1BDDXFZtV4Xn1J3QGpM/LpmNM
         j9OTbtZh2oDpN+4oWzRgv6henJagHwoSMfhesJyxmRukkbHnidBM1VRDc1tblPWH0jUZ
         +/VkuD4y1hXfF5CxYj4l8fX3iY2rnHWFZRPBAymkVWeoLZlMc1QRmL47wNgz9csMFeL2
         z865afoNYp8VxT9SH/UkFR9paD8QRL3VUmYk18Oc7m+4/w9dIkQgqbm6w4jyLpcmBr+g
         OkoQhvXi5x6YmR52fIYRvscNhiyf6rAjHAoZ0YyN84JqP4FBDljFx/EUjo0lcnUG1qH/
         CIMA==
X-Forwarded-Encrypted: i=1; AJvYcCXOL+P/mJplXTwSFq/Iavde5GKntJuGgZ0N6T9Z2ornX1UC7m0dpaS+esFtFKadv+ri5Q5RGm3Y9TXCS7c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1Xp1Ic3nHsfF8xJYOPwLPAQRiBDrKiLsuBbzFmk3efwBj7JAz
	sv2HYjkweyJN61p1RJYDj23bas6Gv0bv1KuRgR060nGmNlQbtIwPaFjroc9cvXIIoXQ=
X-Gm-Gg: ASbGnctxNAfePOE+R0LRCVwHccWMWpkXohsJJz3uQRBbF8ubaauf0e3Hceniyo14eti
	J+lKL51hQTkGsWJmrX6B/W57P35GK6q9StTi173U6LDtUC/RTGd1wdEAwa2QAfWbaCP+CRe5MfD
	BjUfirYYRbCvCJDURFDo2BeFRZRGxsnjXJymLIuoO8E3uJOwgoI9a2VDs94SbahobMD7Ih0LS4g
	4j22edu1aJIZy/y0XajojCt/fI7JcYVAC/w2kfIvcLvKYc8PfQRiBb0zAfIY4V8AocKJkY056Z5
	tS46HuS2dnoSRxLB5EkQgThicv2oxzjVGrT2BJ/l7WfGLmtOIIorIb2U
X-Google-Smtp-Source: AGHT+IHDA8R6hkXhf6du7DwXr+8DpyjA1HwYQoZetnyHYBp/2wSa9xSirLC3i0i4YbG2TNXtzupuqw==
X-Received: by 2002:a05:6000:1a8d:b0:3a3:659b:23a8 with SMTP id ffacd0b85a97d-3a3659b2824mr19751699f8f.50.1747994728119;
        Fri, 23 May 2025 03:05:28 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f3dd94f1sm139282125e9.35.2025.05.23.03.05.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 May 2025 03:05:27 -0700 (PDT)
Message-ID: <6bd1d9d6-f7f1-4407-b0b0-46d1d38f81f0@linaro.org>
Date: Fri, 23 May 2025 11:05:26 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] perf test: Support arch-specific shell tests
To: Namhyung Kim <namhyung@kernel.org>
Cc: Jiri Olsa <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, linux-perf-users@vger.kernel.org,
 Arnaldo Carvalho de Melo <acme@kernel.org>, Ian Rogers <irogers@google.com>,
 Kan Liang <kan.liang@linux.intel.com>
References: <20250522171044.1075583-1-namhyung@kernel.org>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250522171044.1075583-1-namhyung@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 22/05/2025 6:10 pm, Namhyung Kim wrote:
> This is a preparation for shell tests belong to an arch.
> 
> Signed-off-by: Namhyung Kim <namhyung@kernel.org>
> ---
>   tools/perf/tests/builtin-test.c  |  3 ++
>   tools/perf/tests/tests-scripts.c | 73 ++++++++++++++++++++++++++++++++
>   tools/perf/tests/tests-scripts.h |  1 +
>   3 files changed, 77 insertions(+)
> 
> diff --git a/tools/perf/tests/builtin-test.c b/tools/perf/tests/builtin-test.c
> index 45d3d8b3317a7c0a..b9a86631b34cac90 100644
> --- a/tools/perf/tests/builtin-test.c
> +++ b/tools/perf/tests/builtin-test.c
> @@ -650,6 +650,7 @@ static struct test_suite **build_suites(void)
>   		generic_tests,
>   		arch_tests,
>   		NULL,
> +		NULL,
>   	};
>   	struct test_suite **result;
>   	struct test_suite *t;
> @@ -657,6 +658,8 @@ static struct test_suite **build_suites(void)
>   
>   	if (suites[2] == NULL)
>   		suites[2] = create_script_test_suites();
> +	if (suites[3] == NULL)
> +		suites[3] = create_script_test_suites_arch();
>   
>   #define for_each_suite(suite)						\
>   	for (size_t i = 0, j = 0; i < ARRAY_SIZE(suites); i++, j = 0)	\
> diff --git a/tools/perf/tests/tests-scripts.c b/tools/perf/tests/tests-scripts.c
> index 1d5759d08141749d..e6e6fab0c3c4bb8c 100644
> --- a/tools/perf/tests/tests-scripts.c
> +++ b/tools/perf/tests/tests-scripts.c
> @@ -24,6 +24,7 @@
>   #include "string2.h"
>   #include "symbol.h"
>   #include "tests.h"
> +#include "util/env.h"
>   #include "util/rlimit.h"
>   #include "util/util.h"
>   
> @@ -75,6 +76,52 @@ static int shell_tests__dir_fd(void)
>   	return open(path, O_PATH);
>   }
>   
> +static int shell_tests__arch_dir_fd(void)
> +{
> +	struct stat st;
> +	const char *arch;
> +	char path[PATH_MAX], path2[PATH_MAX], *exec_path;
> +	int fd;
> +	char *p;
> +
> +	arch = perf_env__arch(NULL);
> +	if (arch == NULL)
> +		return -1;
> +
> +	scnprintf(path, sizeof(path), "./arch/%s/tests/shell", arch);
> +	fd = open(path, O_PATH);
> +	if (fd >= 0)
> +		return fd;
> +
> +	/* Use directory of executable */
> +	if (readlink("/proc/self/exe", path2, sizeof path2) < 0)
> +		return -1;
> +	/* Follow another level of symlink if there */
> +	if (lstat(path2, &st) == 0 && (st.st_mode & S_IFMT) == S_IFLNK) {
> +		scnprintf(path, sizeof(path), path2);
> +		if (readlink(path, path2, sizeof path2) < 0)
> +			return -1;
> +	}
> +	/* Get directory */
> +	p = strrchr(path2, '/');
> +	if (p)
> +		*p = 0;
> +	scnprintf(path, sizeof(path), "%s/arch/%s/tests/shell", path2, arch);
> +	fd = open(path, O_PATH);
> +	if (fd >= 0)
> +		return fd;
> +	scnprintf(path, sizeof(path), "%s/source/arch/%s/tests/shell", path2, arch);
> +	fd = open(path, O_PATH);
> +	if (fd >= 0)
> +		return fd;
> +
> +	/* Then installed path. */
> +	exec_path = get_argv_exec_path();
> +	scnprintf(path, sizeof(path), "%s/arch/%s/tests/shell", exec_path, arch);
> +	free(exec_path);
> +	return open(path, O_PATH);
> +}
> +
>   static char *shell_test__description(int dir_fd, const char *name)
>   {
>   	struct io io;
> @@ -291,3 +338,29 @@ struct test_suite **create_script_test_suites(void)
>   		close(dir_fd);
>   	return result;
>   }
> +
> +struct test_suite **create_script_test_suites_arch(void)
> +{
> +	struct test_suite **result = NULL, **result_tmp;
> +	size_t result_sz = 0;
> +	int dir_fd = shell_tests__arch_dir_fd(); /* Walk dir */
> +
> +	/*
> +	 * Append scripts if fd is good, otherwise return a NULL terminated zero
> +	 * length array.
> +	 */
> +	if (dir_fd >= 0)
> +		append_scripts_in_dir(dir_fd, &result, &result_sz);
> +
> +	result_tmp = realloc(result, (result_sz + 1) * sizeof(*result_tmp));
> +	if (result_tmp == NULL) {
> +		pr_err("Out of memory while building script test suite list\n");
> +		abort();
> +	}
> +	/* NULL terminate the test suite array. */
> +	result = result_tmp;
> +	result[result_sz] = NULL;
> +	if (dir_fd >= 0)
> +		close(dir_fd);
> +	return result;
> +}
> diff --git a/tools/perf/tests/tests-scripts.h b/tools/perf/tests/tests-scripts.h
> index b553ad26ea17642a..b03ee4a1ee63a25a 100644
> --- a/tools/perf/tests/tests-scripts.h
> +++ b/tools/perf/tests/tests-scripts.h
> @@ -5,5 +5,6 @@
>   #include "tests.h"
>   
>   struct test_suite **create_script_test_suites(void);
> +struct test_suite **create_script_test_suites_arch(void);
>   
>   #endif /* TESTS_SCRIPTS_H */

Reviewed-by: James Clark <james.clark@linaro.org>

