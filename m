Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE3DC1DF975
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 11:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743678493; cv=none; b=jsde4QpnG1WgPwSECpf18oAooT8OCOuiGnWjR7sjPfFa+okdWRMzQGV9csQDCTqhZhQNxK1XEbU2rtoR3zahMmzjQs4f2Tov2z+3DjDMmUrF9fm3IpY3/C9upPI6DA7JD8zBncloJ5f9QThLvyZJ72JZmnh6zH88B9/cVOGAiXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743678493; c=relaxed/simple;
	bh=UeIf3gDzNnrDJ+aG9WHGpvz1ocmpXTtX+myrbYbpoIo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Anpwp2BF0vRUWaMbdVfNUwP3WawZP8SKODvPoGWA8WKwh1G5mYJA4HFa78GT9nyDA3IogiN6X+FJRRuyw+YXMI5Sa0d8YC3LhFaj5fDj1WtRvbGVs42TawD5mYcY+jTQafrCwjXPpgoH4eploLhZaGfeVVy5iYqVrMdbRrtnSc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ElxV/OUV; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ElxV/OUV"
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-524038ba657so837976e0c.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 04:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743678490; x=1744283290; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xlyDq4gIl9Lr6ROGOTackUkIONaMAtJFwwX5SOMUsOs=;
        b=ElxV/OUVT5jp1AbAUd0ozHl4jZusXnEBFAAq3yJHUvgIFtgxJchwbRLtjtJJX0o3eD
         biBhqP82uoBr7GTt+2Xh1rwGXVvh/2AfGtpEoh2vkU15dbvb7fGB6pHRbgFEiZ8oZ+bT
         dLHCqic6EoqeWRNfRuWTx2I+srg3BTmn8XcPIqgJLIMU9qi9DOXo/AlJcuiLbmqCsiIm
         hJskp3Xu+xy9H9nJI9jXX54lAXObWzCdCgNnz3ghDNYiFnUdQx+BKKb/aF2hARtpkBJm
         3Hu1cEu8kGtzT1+SEIbDKQ13F8MMfDsZclXq4H8iWUps88j1ehfRwWz1kOKlI8l9tjM/
         47BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743678490; x=1744283290;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xlyDq4gIl9Lr6ROGOTackUkIONaMAtJFwwX5SOMUsOs=;
        b=qEbI2keWj25WL5asN62SZfdB3Y7xlf0i0Li0hAad8alEb+M32mri1pbD0YTpYfy4yq
         uzanK5fVdQjMDvPN5Uyjw8C8Gqo5SYsy/WyFGiyU9Qe8FwEbt51HsaP0ON0l5xjXlZsZ
         Ukiuxt5pq55xgqIP6QEgOOX3DmldnZnhMXHjyHwBNCrYZ/+e2MzVjs/OjC1g1/MVEIbf
         EyS2BFt2OyPQuap9muRVZcl5gN1bhyU86rVEOoFsnK2yaUAK0hhxm6XlP1YHdziVcjYb
         tiYQlXKIyJtnmHqsF0V5vZhk8jokv2Au9zQK6hkhY5Hk6N3SZkPIQA/WxTXm5t4S3Jtv
         RSHQ==
X-Gm-Message-State: AOJu0Yz/Mn05GsAfObbA9CIcxjdfvfvLZEmjagKt748AYIyyDLdc4tNO
	GunDi9WcXnzNpIU6KNnvz+bXcfulsP/N0bGhpAR5DTIPleORiLDs1ug5dS55E9nk9Py1AetPGNe
	6Jbf4ht1V2twTglTDSRBgrSFYxnX4612ht7YhG1gwdbf4ieN4PE0=
X-Gm-Gg: ASbGncunnA+VVnnHq3Es2PHLD8+autmp86R1DKcwPBGRTECtaKkEJAW93Y8WpBbjOza
	WDlQ9YPFHkr3RwCBaxozsqi3e1GH3bkXsDj3ZnXXCP7if532VT+Y+NcJqtuRsvWpZXkTLcJu8O1
	mgizkEq4SkK0SSU8UhQVd+U8C5rwFhwJA8m8TAxDxniqT4xSPDhDHwN5NzRw==
X-Google-Smtp-Source: AGHT+IFA6KPAr/9JvLRrdPpJRg6g6D0xJChBb1HAxmoAW7jS9u/YJ2IJribqwlFitpYlfu7S/vxo5M+KHizDfy/TVbA=
X-Received: by 2002:a05:6122:330d:b0:523:dbd5:4e7f with SMTP id
 71dfb90a1353d-52756b10bf3mr1945335e0c.3.1743678490066; Thu, 03 Apr 2025
 04:08:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CA+G9fYtzOxx1YWz2X4UYqvxB2vg7ptz6axmz-5HFLD9ieSjURw@mail.gmail.com>
In-Reply-To: <CA+G9fYtzOxx1YWz2X4UYqvxB2vg7ptz6axmz-5HFLD9ieSjURw@mail.gmail.com>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 3 Apr 2025 16:37:58 +0530
X-Gm-Features: ATxdqUH8OMQ6KdpRKZP5fv72MvdhOmm57r-0DZ0nSqzGCbCvwioKA-IrKMZ5GzY
Message-ID: <CA+G9fYuPHQf2buj7BQ3myGnSQ3yvrhpeiT7LH5rDVtVz1v_cQA@mail.gmail.com>
Subject: Re: next-20250403: x86_64 mwait.h:30:15: error: invalid operand for instruction
To: open list <linux-kernel@vger.kernel.org>, X86 ML <x86@kernel.org>, 
	lkft-triage@lists.linaro.org, Linux Regressions <regressions@lists.linux.dev>
Cc: Arnd Bergmann <arnd@arndb.de>, Anders Roxell <anders.roxell@linaro.org>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Borislav Petkov <bp@alien8.de>, Ingo Molnar <mingo@redhat.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Uros Bizjak <ubizjak@gmail.com>
Content-Type: text/plain; charset="UTF-8"

+ Uros Bizjak <ubizjak@gmail.com>

On Thu, 3 Apr 2025 at 15:50, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
>
> Regressions on x86_64 builds tinyconfig, allnoconfig failed with toolchains
> clang-20 and gcc-13 on the Linux next starting from next-20250403.
>
> First seen on the next-20250403
>  Good: next-20250402
>  Bad:  next-20250403
>
> Regressions found on x86_64:
>   - build/gcc-13-tinyconfig
>   - build/gcc-13-allnoconfig
>   - build/clang-20-tinyconfig
>   - build/clang-20-allnoconfig
>
> Regression Analysis:
>  - New regression? Yes
>  - Reproducibility? Yes
>
> Boot regression: x86_64 mwait.h:30:15: error: invalid operand for instruction
>
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
>
> ## Build log
> In file included from arch/x86/kernel/process.c:36:
> arch/x86/include/asm/mwait.h:30:15: error: invalid operand for instruction
>    30 |         asm volatile("monitor %0, %1, %2" :: "a" (eax), "c"
> (ecx), "d" (edx));
>       |                      ^
> <inline asm>:1:16: note: instantiated into assembly here
>     1 |         monitor %rax, %ecx, %edx
>       |                       ^~~~~
> In file included from arch/x86/kernel/process.c:36:
> arch/x86/include/asm/mwait.h:95:15: error: instruction requires: Not 64-bit mode
>    95 |         asm volatile("sti; mwait %0, %1" :: "a" (eax), "c" (ecx));
>       |                      ^
> <inline asm>:1:7: note: instantiated into assembly here
>     1 |         sti; mwait %eax, %ecx
>       |              ^
> 2 errors generated.

Anders bisected this to,

# first bad commit:
   [cd3b85b27542968198e3d588a2bc0591930ee2ee]
   x86/idle: Use MONITOR and MWAIT mnemonics in <asm/mwait.h>


>
> ## Source
> * Kernel version: 6.14.0
> * Git tree: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
> * Git sha: f0a16f5363325cc8d9382471cdc7b654c53254c9
> * Git describe: next-20250403
> * Project details:
> https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250403/
> * Architectures: x86_64
> * Toolchains: clang-20, gcc-13
> * Kconfigs: tinyconfig, allnoconfig, lkftconfig
>
> ## Build
> * Build log: https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250403/testrun/27871165/suite/build/test/clang-20-allnoconfig/log
> * Build history:
> https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250403/testrun/27871165/suite/build/test/clang-20-allnoconfig/history/
> * Build details:
> https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250403/testrun/27871165/suite/build/test/clang-20-allnoconfig/
> * Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/2vCvvmy6fhzm3aMcptKXHvRi4Bp/
> * Kernel config:
> https://storage.tuxsuite.com/public/linaro/lkft/builds/2vCvvmy6fhzm3aMcptKXHvRi4Bp/config
>
> --
> Linaro LKFT
> https://lkft.linaro.org

Links,
 - https://lore.kernel.org/all/CA+G9fYtzOxx1YWz2X4UYqvxB2vg7ptz6axmz-5HFLD9ieSjURw@mail.gmail.com/

- Naresh
