Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53219242928
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 10:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743675661; cv=none; b=Syj8tCozyxEwYfjnMHhOaWDCaX1TZxBaSUFWXH4jNmjFYm3XxgFHKH2AEGRMvRObbK8NuVXmNKm3PBApwVqr+mQvda+N6Gcc8qOFp4nv1kBQP/tQz7B2d7a8gnHwg4GLqIXAegAqY6rIP6X8GtGBc9b1T5Sb8t+eazSfEF2a5h4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743675661; c=relaxed/simple;
	bh=GezOMWTmbvUlmddSRUJtzgQ2URqpf4G0KrSTl9O1bbM=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=Loknie9T+nOkoqrl5hWD7Pwbk0wdjLpQ/bMu45MAiLblgd3BPK4oDpPhx6Byqu3/+EYt57NM66ewY9EUTGYcLrT0mYowQfKiwvZNkDG44ak09vzTPWYk2FEk2F+maS2RZk566fjFH0ehkuOD/JBx4hNtCI9J5VJj41HIQQ29pog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IbJMr3mH; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IbJMr3mH"
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5242f137a1eso350821e0c.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 03:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743675657; x=1744280457; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=EFfDTMKsLOvbQi0ro5INzOuYGDYKTLhDyjOF8V3RES8=;
        b=IbJMr3mHNGHRsZnXKyqK1XzwitXcokMIGsAdpCrCzPMHOr51mYl5bV7SvS/ID0Tgi9
         AceADMEW+BtFemZOlfDSSdEffhSa4Cs/zBmPISj8IXWnr2xuRNOorOC7z5doLpvcxFnA
         Kcdl6J/2LxhY424R3nh3V9zpKY32XrDiypTvdevRaBLPF8WInZHcXglRH89iSw88Aiwd
         18yIEkz7RWR3FskBkFxqACefcDToggQUGo+uHIkFv8PiRkmZNagjWT6aVRS72oIppDrA
         JkWWpN6OXtJvHr03LbGkoY6sj0HFJXwNrhiHmkFb83By1AJSdG49emkEsOg1dNmy1oxa
         x1ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743675657; x=1744280457;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EFfDTMKsLOvbQi0ro5INzOuYGDYKTLhDyjOF8V3RES8=;
        b=hiytJ5kJa6YPeRnp6xAEOokOb8/B+91wCGSo3Z/gI8CCXEfaeLGeOGQqhjoUweCG89
         Oc3LmOzyyp98q4m7wucS+BERBxJoUMikvfgJL/DVJ0RNWmOUAO5/rGbJgxRUqxAIgxAU
         DEyyaU1o79jhtaKfRTpYcIOX8W4e3mYREFIdmGapMV52KaXXk43+KgSMw7E5JLJQlnuC
         G8IUE5RZid9JiwTI8IboWBr8WSQTkvKtKE26p5ET0WK28EXigBg1tBKGq/a89Kc8qnl0
         vpJQW8KOn7zIpaHo3sRFhOOloPWgdU6S3IFd7VS+HOVmP+4K7fabDq6UpOGawP/mJQBX
         ibow==
X-Gm-Message-State: AOJu0YzXjFTIMdXc1uYEGyP+aNYZJ4vJU43prlhDrrZhNlK6afzkWO+W
	fmRmUuocG3ApQZmsCNUNoorQ+jfiuehmaNSJJVR/cUJAjlTc9NZw//29+cNp8aA9aj0P0u9ACQv
	LN3HjUC9OlxlGOX+8Ptl0An4+rMunOlzGLtr55AmB5wzP3B7+krc=
X-Gm-Gg: ASbGncsKArtQWXJqL1612Wd+D5Zv+W94+WZjIHIy+gr11jMaTnZmKtqlR6zpvgS7EYt
	hlwqAesiLfE8Y+RjP698h3cPpl8TwbXgmpEBo/UdXg4gTIViLTDm71PXEl6J76LNfGqftMfBLau
	JIQpqsQCbRF8xGhRYrBGPG+QluKLn+FQ28cqiPUdyE96EnPRtkObcJB8u+Tg==
X-Google-Smtp-Source: AGHT+IHjKBz8LLfkDN1C5xR8N2aNArNqGWfvvXVddkpcmhmRSktPMSHP6GCF1+dehAbnJ6v37EnE6gWHZbLivdA/PoU=
X-Received: by 2002:a05:6122:1785:b0:520:3987:ce0b with SMTP id
 71dfb90a1353d-52758c9eb35mr1160475e0c.2.1743675657436; Thu, 03 Apr 2025
 03:20:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 3 Apr 2025 15:50:46 +0530
X-Gm-Features: ATxdqUFcLm8EJq5bKx8BVwRxzBv71uPhfhvOEYclA0j-Xltycxe1onkZpRNwYYM
Message-ID: <CA+G9fYtzOxx1YWz2X4UYqvxB2vg7ptz6axmz-5HFLD9ieSjURw@mail.gmail.com>
Subject: next-20250403: x86_64 mwait.h:30:15: error: invalid operand for instruction
To: open list <linux-kernel@vger.kernel.org>, X86 ML <x86@kernel.org>, 
	lkft-triage@lists.linaro.org, Linux Regressions <regressions@lists.linux.dev>
Cc: Arnd Bergmann <arnd@arndb.de>, Anders Roxell <anders.roxell@linaro.org>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Borislav Petkov <bp@alien8.de>, Ingo Molnar <mingo@redhat.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"

Regressions on x86_64 builds tinyconfig, allnoconfig failed with toolchains
clang-20 and gcc-13 on the Linux next starting from next-20250403.

First seen on the next-20250403
 Good: next-20250402
 Bad:  next-20250403

Regressions found on x86_64:
  - build/gcc-13-tinyconfig
  - build/gcc-13-allnoconfig
  - build/clang-20-tinyconfig
  - build/clang-20-allnoconfig

Regression Analysis:
 - New regression? Yes
 - Reproducibility? Yes

Boot regression: x86_64 mwait.h:30:15: error: invalid operand for instruction

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

## Build log
In file included from arch/x86/kernel/process.c:36:
arch/x86/include/asm/mwait.h:30:15: error: invalid operand for instruction
   30 |         asm volatile("monitor %0, %1, %2" :: "a" (eax), "c"
(ecx), "d" (edx));
      |                      ^
<inline asm>:1:16: note: instantiated into assembly here
    1 |         monitor %rax, %ecx, %edx
      |                       ^~~~~
In file included from arch/x86/kernel/process.c:36:
arch/x86/include/asm/mwait.h:95:15: error: instruction requires: Not 64-bit mode
   95 |         asm volatile("sti; mwait %0, %1" :: "a" (eax), "c" (ecx));
      |                      ^
<inline asm>:1:7: note: instantiated into assembly here
    1 |         sti; mwait %eax, %ecx
      |              ^
2 errors generated.


## Source
* Kernel version: 6.14.0
* Git tree: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
* Git sha: f0a16f5363325cc8d9382471cdc7b654c53254c9
* Git describe: next-20250403
* Project details:
https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250403/
* Architectures: x86_64
* Toolchains: clang-20, gcc-13
* Kconfigs: tinyconfig, allnoconfig, lkftconfig

## Build
* Build log: https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250403/testrun/27871165/suite/build/test/clang-20-allnoconfig/log
* Build history:
https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250403/testrun/27871165/suite/build/test/clang-20-allnoconfig/history/
* Build details:
https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250403/testrun/27871165/suite/build/test/clang-20-allnoconfig/
* Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/2vCvvmy6fhzm3aMcptKXHvRi4Bp/
* Kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/2vCvvmy6fhzm3aMcptKXHvRi4Bp/config

--
Linaro LKFT
https://lkft.linaro.org
