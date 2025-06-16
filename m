Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDEBF2877EF
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 13:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750080984; cv=none; b=gUjyM6Qa5P23n0zodAblOvbeS3WyjXV9SwhbZGD8i9+7vOyFq5tyVKPkl0PC28iKhoe4QY0+6btJmmaOTUjntpEz7Dkn2QTh4MBXU7hH/liPvlbLG91Crgp+somDr2YzhFpgVYMLz76gLBmNdTpjURtRWA92vGRlXunmytQBlbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750080984; c=relaxed/simple;
	bh=/+idoE/lxLeCl2JtJe6gPh2aQ6s2yMmO2sp39/Hq4LQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X6KHiwTEL+evxr4ZZUNILAaJTz0dKKWmbIv2RSH/XEFlGF730RvlurINdep4t20Y3TaEiOOuBfklHvkQ6RtQ7ZppCc2cphPnj4Dm8O3yBKvcvzcQduWOT0pbe6/wpQZSgrW9U9Ss3SAUcWT8KA9QsKsilAoDRph36U5YICxwMa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iVILKn9A; arc=none smtp.client-ip=209.85.222.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iVILKn9A"
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-86d5e3ddb66so983488241.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 06:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750080981; x=1750685781; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VAKYpzBXefjsewghnaRDPZDlVtldMHNII6S2fBTACcE=;
        b=iVILKn9AQ/dZUNFI063dd/soQHSha96vssLcOTd1XDwqmtholXpWXIY9bj97tfzNEk
         Q88niN1qwuRaZHvsj5jfPrwERihMQweZjXrHD+qXjKk8i/26fysDWpQxWqgsM79MBsZa
         RYf0unc03ksZXHHkKmxx8FBEQn1pyIRrMoVphFn+aQ/9OtImChKtV+A099zyrvDv6842
         Kv7uaoY94w1ihVh0UL+LVcUQ0MK9/hJ3QzN3p/8kt43NQ4VID2yzAbLO7e7tk2wJpi2u
         N2vukvFT/YFUTy4XmjYxlHLhW6Zi8HM432v2ymaNC44wyS1kxYBK9ekxStlNd+kVqZQQ
         DEpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750080981; x=1750685781;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VAKYpzBXefjsewghnaRDPZDlVtldMHNII6S2fBTACcE=;
        b=NGlnGeUaLMGqH5/cxBtiydVB63r3Mc13VEoCfIW9ih4lnfLS25Tglq3gy0FomxzkaP
         SBcnN3yrs39s1x9hqbn66M+m3AhTDIUWip6fLlLzL3Q4upkkUGHyM05ZjzbabQyXLOpH
         iK4kOTpr4sqgRiHaT1zJZCOYALhj2O5oo+WlJrArIOj4ZBI83ObTQe3dg3qViEJdCvFh
         ZigdfCU29wX1GziVIoYJou01hteTTNmG9wRPSCU5l3UKWZdn7diOwxcttnU4JD2vNorS
         z64KE/wcUMmPGIH5GrYxbpxS/yoRpKvC0VFqP93XBsyp+CgyOkgbGVuNHFeZlt3izURE
         f+2A==
X-Gm-Message-State: AOJu0YwB6/x3z3dkAiN2MKDZs0vsm0ygZ+rlmF9m06nC7JBii5Xf+g/e
	5lKI3+G79R4oQZgmxmhhfXgW7ZItYc5KUTfQf6rEvolIG1xvw0qRhfgcZqS65EZ4oSel/G6NP5H
	fQRaFbqlGxW4jrntzo1rokKdG5Rg3mUkzMqMmVnErt7a1PDcd2wFH+HXNEA==
X-Gm-Gg: ASbGncth/a4t0vKHI75rM+UQdVWBC1AwHNEuUew5wsHPg7slsZtQoniP1Rmwgelr0iN
	WdHhOH5BnuFKk0OoKmcyS+Rp14JRUmJLFuGnTXBDB13V4Xi41bG+ATdYw5qPRpmhYFJCd70h+CQ
	+n7Nc7is0mkeE7rnBeV8zfwhyE1hV2BQYfT2hKryBu/eQB2QXnX32g/5QL7epK8uwfTzXd0WjL+
	oto
X-Google-Smtp-Source: AGHT+IFjLddFL80fWZC8vtshfMJbUrfVgeQJ3XiDOZyHT7t6Zgm568hBaOqMVNU/MkIqnSqDCwMMu8ds8ugaE3rTBR8=
X-Received: by 2002:a05:6102:26c2:b0:4c5:1c2e:79f5 with SMTP id
 ada2fe7eead31-4e7f61c6ecfmr4938693137.16.1750080981324; Mon, 16 Jun 2025
 06:36:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CA+G9fYuDOnN6TrcVYcMZT5UPNc34mOHQZsfyFvpq+Ndhz8p48w@mail.gmail.com>
In-Reply-To: <CA+G9fYuDOnN6TrcVYcMZT5UPNc34mOHQZsfyFvpq+Ndhz8p48w@mail.gmail.com>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Mon, 16 Jun 2025 19:06:10 +0530
X-Gm-Features: AX0GCFv0xdxpPep8RlLL46Klw14koqqEINGKyWY-3_14LVoll_HdAqjvhj2iHm0
Message-ID: <CA+G9fYuu5r34=bndUYWNxe_yLgBaPGXmK9WP3WTtoXMs_2LX-Q@mail.gmail.com>
Subject: Re: next-20250616: S390 gcc-8 allnoconfig mm mempool.c In function remove_element
To: open list <linux-kernel@vger.kernel.org>, linux-s390@vger.kernel.org, 
	lkft-triage@lists.linaro.org, Linux Regressions <regressions@lists.linux.dev>
Cc: Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>, 
	Anders Roxell <anders.roxell@linaro.org>, Dan Carpenter <dan.carpenter@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 16 Jun 2025 at 17:36, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
>
> Regression while building S390 with the Linux next-20250616
> with gcc-8 the following kernel warnings found.
>
> Regressions found on S390
>  -  build/gcc-8-lkftconfig-allnoconfig
>  -  build/gcc-8-lkftconfig-hardening
>
> Regression Analysis:
>  - New regression? Yes
>  - Reproducibility? Yes
>
> First seen on the next-20250616
> Good: next-20250613
> Bad:  next-20250616
>
> Build regression: S390 gcc-8 allnoconfig mm mempool.c In function remove_element
>
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
>
> ## Build errors
> mm/mempool.c: In function 'remove_element':
> include/linux/compiler_types.h:497:20: warning: asm operand 0 probably
> doesn't match constraints
>  #define asm_inline asm __inline
>                     ^~~
> arch/s390/include/asm/bug.h:12:2: note: in expansion of macro 'asm_inline'
>   asm_inline volatile(     \
>   ^~~~~~~~~~
> arch/s390/include/asm/bug.h:43:2: note: in expansion of macro '__EMIT_BUG'
>   __EMIT_BUG("", 0);    \
>   ^~~~~~~~~~
> include/asm-generic/bug.h:77:57: note: in expansion of macro 'BUG'
>  #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
>                                                          ^~~
> mm/mempool.c:149:2: note: in expansion of macro 'BUG_ON'
>   BUG_ON(pool->curr_nr < 0);
>   ^~~~~~
> include/linux/compiler_types.h:497:20: error: impossible constraint in 'asm'
>  #define asm_inline asm __inline
>                     ^~~

Anders bisect this build regressions and found,

 # first bad commit:
    [45c79ca947c936085c94b716be92eaf9a1bdc8bb]
    bugs/s390: Use 'cond_str' in __EMIT_BUG()


> ## Source
> * Kernel version: 6.16.0-rc2
> * Git tree: https://kernel.googlesource.com/pub/scm/linux/kernel/git/next/linux-next.git
> * Git sha: 050f8ad7b58d9079455af171ac279c4b9b828c11
> * Git describe: next-20250616
> * Project details:
> https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250616/
> * Architectures: S390
> * Toolchains: gcc-8
> * Kconfigs: allnoconfig
>
> ## Build S390
> * Build log: https://qa-reports.linaro.org/api/testruns/28763376/log_file/
> * Build details:
> https://regressions.linaro.org/lkft/linux-next-master/next-20250616/build/gcc-8-allnoconfig/
> * Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/2ya0wQbvgatYAbcvC2OTZls5D91/
> * Kernel config:
> https://storage.tuxsuite.com/public/linaro/lkft/builds/2ya0wQbvgatYAbcvC2OTZls5D91/config
>
> ## Steps to reproduce on S390
>  - tuxmake --runtime podman --target-arch s390 --toolchain gcc-8
> --kconfig allnoconfig
>
> --
> Linaro LKFT
> https://lkft.linaro.org

- Naresh
