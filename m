Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12F001B0F0A
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 13:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749733798; cv=none; b=uruu498m5BCih6550WjhTVKufvJ2Kb5Rt4DqRzvHLeCacjCPaHeRAeqCWlEWPjNUGT6XvHdcQLYFV28iQEqEbRrwgnUcPV6+p+uro/CnfjJvrmW/lzP+AbUzlC5FZtJG4dDjzComU+8hOBBVLASUgiSiD2f6y8hr7U4pSJArOk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749733798; c=relaxed/simple;
	bh=ds14tut9ukNgFvAYWrJRogxZC9YwxLXyToDhwHfpcLM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G/L+NjA9wKYrcND2oLYRCef8W5M9ZKio00Qr2kanSsTbX5uKaKxDfTihIP8fvcm+VpgzeaRErwkAjCBwsHqejQo4x1/aJeKnzXve3Bfq/0tJUgFLv2IwRB27DO64Mh/VJwcimSwGAArvdHMoQm5vHrpcobBVdVy/gjA2Vl7iijY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XlfPBaoi; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XlfPBaoi"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ad89333d603so193611966b.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 06:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749733794; x=1750338594; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=opG1J/uuXUhUkyywN9VdfAudOLd1wp6HGMdhIzhjVZI=;
        b=XlfPBaoinCuvLLnPCPi/0ncqHoB/gLVMB/gUaQhSnKdRNvvAxL63OXS/wpzP4TzbO2
         6OKXtIDxcQNLrwATAjMSzAzi7o0uHAqcXKMZJ6D3CIVBfvWyv7Bc2V910tcJH3mWInHJ
         4WxRpMEzHOI7S0U22Pg7knLT/hsvdt1afPryeOo/k+vmnhKG36wSS1dreyzjk1iyo5K9
         jXTSz+lt7raO++4Krg2AzAbytRcEJWZcltsj7EWZ4OK3AQoJy5ehJieevZiEFJ90wggJ
         D9CiW12t/N/P9KrowVf2O4yRRDekRBOEBHKzrOATrk2KJZnySSWcE+8opCLGaUM9fMKe
         2e5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749733794; x=1750338594;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=opG1J/uuXUhUkyywN9VdfAudOLd1wp6HGMdhIzhjVZI=;
        b=kLOcoTxidIGdlCuQqSBxFRHzUcMQFJZkl43nJ6kYk99TSObmDk2F/GuvOZ2mDdI8mL
         jzg/epFeSJB5yQ1F9fpWSuAz1HOPtyGYNlr0nQjgqjLvyOi3p2Dc8mcEm+JouRnDbX3u
         Ph1wP0vM75n7LdVduDK9cuY+0pzUg4ygH496eeR34dbr9LfkCyPRZvLyieOWCMdM2gll
         nHvOeIpbXPiXYldPrynCqsNGpx4lqH50iTtAErszdX+uHPf1i5F0FrB2UYgBiuPnzzRc
         4Fho93fD0nINY53UDde2B1+1V9c9ACVN+FJK2RSWl0yQg4k8T2I01KNFkQSHJDoqwT89
         CJJg==
X-Forwarded-Encrypted: i=1; AJvYcCUyXbxhUPKD0HvWo7a0TglhApA9gTIITCYDr2ApTpcrc7FpQpBmhLQMgTA76fPSSMRb7KVuVbTHv9uwHnM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4s96k0GOxF9QbEk7NFw9+nrVlgswAk10/80DxcfXg0n3BFdwI
	Xrf4wd8DGYOzNUkw8LaWWNxwS2boUDKo3nHe2fgQ8snY27OAkTZgTo+sMHTv62lJ7k2Ro7+1FTC
	Y6KxguPqRYAXzblSIxxOErk0zDFJCsnpKzBRXIzOaFg==
X-Gm-Gg: ASbGncsATAMLYxzsBquJmr8Xzk8Qjaopij9OHrbwFfaPYOBj3OkqCf8DgR/TIjTyMSX
	4DNdU2KTnV2nvvsZdfC0GwveuvKXW4pZRvW1ahaY3SAO7ef3nuV+WCyj/Uz033J5IH9iwxjDnu8
	UWpdX5vcwsVbJNy+ZeKYmTsQXBuLcpmE3052Nk6kcN6v0JV/K0T2frTsV2EWeeNPrXIArNQK/iC
	9oN
X-Google-Smtp-Source: AGHT+IGNOnr/szm3yBR9cV0j2z15yO7hP3u/Ee6kZpjjOIimYf4i36geqFsIBGpUgm01Mc+b/WDWQjJgSq96/eYeptQ=
X-Received: by 2002:a17:907:3f28:b0:ad5:b2aa:847c with SMTP id
 a640c23a62f3a-ade898378c1mr749998366b.54.1749733794178; Thu, 12 Jun 2025
 06:09:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CA+G9fYsLu0roY3DV=tKyqP7FEKbOEETRvTDhnpPxJGbA=Cg+4w@mail.gmail.com>
 <20250609220934.2c3ed98ba8c624fc7cb45172@kernel.org> <CA+G9fYsoCc3DnNGoavFiBdymVpdJiEfUSEq967GgThVQW7bTPA@mail.gmail.com>
 <20250610105337.68df01f4@gandalf.local.home>
In-Reply-To: <20250610105337.68df01f4@gandalf.local.home>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 12 Jun 2025 18:39:41 +0530
X-Gm-Features: AX0GCFvxFmwRBu8DgJ-HzbsdJ44lY7mfNY9MHLImOKOp-WOIdRz2u56nFMPkKoc
Message-ID: <CA+G9fYv+1FPMD8e1ZadA3nLcfSRDAWvPRW-A3bGrV0y1VP2zLQ@mail.gmail.com>
Subject: Re: next-20250605: Test regression: qemu-x86_64-compat mode ltp
 tracing Oops int3 kernel panic
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Masami Hiramatsu <mhiramat@kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	Linux trace kernel <linux-trace-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	Stephen Rothwell <sfr@canb.auug.org.au>, Arnd Bergmann <arnd@arndb.de>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Anders Roxell <anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 10 Jun 2025 at 20:22, Steven Rostedt <rostedt@goodmis.org> wrote:
>
> On Tue, 10 Jun 2025 18:50:05 +0530
> Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
>
> > > Is this bug reproducible easier recently?
> >
> > Yes. It is easy to reproduce.
>
> Can you test before and after this commit:
>
>   4334336e769b ("x86/alternatives: Improve code-patching scalability by
>   removing false sharing in poke_int3_handler()")
>
> I think that may be the culprit.
>
> Even if Masami's patches work, I want to know what exactly caused it.

Steven,

Since the reported regressions are intermittent, It is not easy to bisect.
However, The commit merged into Linux next-20250414 tag and then
started noticing from next-20250415 onwards this regression on both
x86_64 devices and qemu-x86_64 intermittently with and without
compat mode.

 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250606/testrun/28685600/suite/log-parser-test/test/oops-oops-int3-smp-pti/history/
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250606/testrun/28685600/suite/log-parser-test/test/oops-oops-int3-smp-pti/history/?page=2

And above commit landed into Linus master branch on 2025-05-13 and
then started noticing this regression intermittently on x86 with and without
compat mode.

  - https://qa-reports.linaro.org/lkft/linux-mainline-master/build/v6.16-rc1/testrun/28711641/suite/log-parser-test/test/oops-oops-oops-smp-pti/history/?page=1

Masami San,

case 1) compat mode x86_64 (64-bit kernel + 32-bit rootfs)
I have tested your patch on top of linux next-20250606 tag and tested
on real x86_64 (64-bit kernel + 32-bit rootfs) hardware for 7 test runs.

ftrace_regression01 - pass
ftrace_regression02 - pass
ftrace-stress-test - pass
dynamic_debug01 - Hangs (No crash log on serial console)

Case 1.1)
Above case noticed on qemu-x86_64 with compat mode ^ with
12 test runs.

- https://lkft.validation.linaro.org/scheduler/job/8312811#L1687

case 2) x86_64 (64-bit kernel + 64-bit rootfs)
I have tested your patch on top of linux next-20250606 tag and tested
on real x86_64 (64-bit kernel + 64-bit rootfs) hardware for 4 runs and out of
these 3 runs failed and found these kernel warnings, kernel BUG and
invalid opcode while running LTP tracing test cases.

Here I am sharing the crash log snippet and boot and test log links  and
build link.

Test logs:
[  112.596591] Ring buffer clock went backwards: 113864910133 -> 112596588266
[  115.829620] cat (5762) used greatest stack depth: 10936 bytes left
[  120.922517] ------------[ cut here ]------------
[  120.927198] WARNING: CPU: 2 PID: 6639 at
kernel/trace/trace_functions_graph.c:985 print_graph_entry+0x579/0x590
[  120.937364] Modules linked in: x86_pkg_temp_thermal
[  120.942405] CPU: 2 UID: 0 PID: 6639 Comm: cat Tainted: G S
        6.15.0-next-20250606 #1 PREEMPT(voluntary)
[  120.953380] Tainted: [S]=CPU_OUT_OF_SPEC
[  120.957477] Hardware name: Supermicro SYS-5019S-ML/X11SSH-F, BIOS
2.7 12/07/2021
[  120.965036] RIP: 0010:print_graph_entry+0x579/0x590

Run 1:
- https://lkft.validation.linaro.org/scheduler/job/8311136#L1700


ftrace-stress-test: [   58.963898] /usr/local/bin/kirk[340]: starting
test ftrace-stress-test (ftrace_stress_test.sh 90)
[   60.316588] ------------[ cut here ]------------
[   60.316588] ------------[ cut here ]------------
[   60.316590] ------------[ cut here ]------------
[   60.316593] ------------[ cut here ]------------
[   60.316593] ------------[ cut here ]------------
[   60.316594] ------------[ cut here ]------------
[   60.316594] kernel BUG at kernel/entry/common.c:328!
[   60.316594] kernel BUG at kernel/entry/common.c:328!
[   60.316595] kernel BUG at kernel/entry/common.c:328!
[   60.316600] Oops: invalid opcode: 0000 [#1] SMP PTI
[   60.316604] CPU: 2 UID: 0 PID: 1556 Comm: sh Tainted: G S
       6.15.0-next-20250606 #1 PREEMPT(voluntary)
[   60.316608] Tainted: [S]=CPU_OUT_OF_SPEC
[   60.316609] Hardware name: Supermicro SYS-5019S-ML/X11SSH-F, BIOS
2.7 12/07/2021
[   60.316614] ------------[ cut here ]------------
[   60.316615] kernel BUG at kernel/entry/common.c:328!
[   60.316617] Oops: invalid opcode: 0000 [#2] SMP PTI
[   60.316620] CPU: 2 UID: 0 PID: 1556 Comm: sh Tainted: G S
       6.15.0-next-20250606 #1 PREEMPT(voluntary)
[   60.316622] Tainted: [S]=CPU_OUT_OF_SPEC
[   60.316623] Hardware name: Supermicro SYS-5019S-ML/X11SSH-F, BIOS
2.7 12/07/2021
[   60.316625] RIP: 0010:irqentry_nmi_enter+0x6c/0x70

Run 2:
- https://lkft.validation.linaro.org/scheduler/job/8311138#L1703

ftrace-stress-test: [   78.877495] /usr/local/bin/kirk[343]: starting
test ftrace-stress-test (ftrace_stress_test.sh 90)
[   78.977303] Scheduler tracepoints stat_sleep, stat_iowait,
stat_blocked and stat_runtime require the kernel parameter
schedstats=enable or kernel.sched_schedstats=1
[   82.299799] cat (2322) used greatest stack depth: 11520 bytes left
[   82.327708] cat (2327) used greatest stack depth: 11256 bytes left
[   82.632183] cat (2375) used greatest stack depth: 10992 bytes left
[  137.335901] ------------[ cut here ]------------
[  137.335901] ------------[ cut here ]------------
[  137.335902] ------------[ cut here ]------------
[  137.335907] kernel BUG at kernel/entry/common.c:328!
[  137.335908] ------------[ cut here ]------------
[  137.335909] ------------[ cut here ]------------
[  137.335912] kernel BUG at kernel/entry/common.c:328!
[  137.335912] kernel BUG at kernel/entry/common.c:328!
[  137.335915] Oops: invalid opcode: 0000 [#1] SMP PTI
[  137.335921] CPU: 0 UID: 0 PID: 544 Comm: sh Tainted: G S
      6.15.0-next-20250606 #1 PREEMPT(voluntary)
[  137.335926] Tainted: [S]=CPU_OUT_OF_SPEC
[  137.335929] Hardware name: Supermicro SYS-5019S-ML/X11SSH-F, BIOS
2.7 12/07/2021
[  137.335937] ------------[ cut here ]------------
[  137.335939] kernel BUG at kernel/entry/common.c:328!
[  137.335945] Oops: invalid opcode: 0000 [#2] SMP PTI
[  137.335949] CPU: 0 UID: 0 PID: 544 Comm: sh Tainted: G S
      6.15.0-next-20250606 #1 PREEMPT(voluntary)
[  137.335953] Tainted: [S]=CPU_OUT_OF_SPEC
[  137.335956] Hardware name: Supermicro SYS-5019S-ML/X11SSH-F, BIOS
2.7 12/07/2021
[  137.335959] RIP: 0010:irqentry_nmi_enter+0x6c/0x70

Run 3:
- https://lkft.validation.linaro.org/scheduler/job/8311139#L1703

Build log:
 - https://storage.tuxsuite.com/public/linaro/naresh/builds/2yM9krm5KgE5a57QFvOqw9UrSgQ/

- Naresh

>
> -- Steve
