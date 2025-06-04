Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 936403594B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 07:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749023529; cv=none; b=qQ6Ii3ep7GkbqvGHsaSmAGdVp3nw5/c+6vOy/Nq638C64TRHfhy7VSgNB1tzwj0DiqSxob8QBYWd9ZH2XI2EJb6zDbpbi1LzgcPUtrAMUYUMCm4Pnyvg0Y/tUxmrMY4fspz7TP8JacFUjElib8bfJfCidlWr44RS5Ca2CWEXCxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749023529; c=relaxed/simple;
	bh=qJ0wFIVX2OeX7gq8a3RPVL4Iey2nHPYZzcgONfx/JYA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nBZGv+byZfogISxm9ntXPOZtRZAPyCrL/1DmX5d8FOscNURh9S4wfuIDvsc2d/isfoJN8an980bNNIhB051nVK+7pWGYhFx3tU3arC7NPjDL0VmrV/zNNj3bWyE1CbufkjxJEsH2+PWE685HVRsBOyvYSdfkW8JBF4q69zlbuZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AEDE31758;
	Wed,  4 Jun 2025 00:51:49 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A64BF3F673;
	Wed,  4 Jun 2025 00:52:05 -0700 (PDT)
Date: Wed, 4 Jun 2025 08:52:02 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Luka <luka.2016.cs@gmail.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [Bug] task hung in ret_from_fork in Linux v6.12
Message-ID: <aD_7IrjJUMRUCoP8@J2N7QTR9R3>
References: <CALm_T+3nBU3CTxFp6NCO9mU74ZrMFeyyTqUYf-TuUajY8RtLwA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALm_T+3nBU3CTxFp6NCO9mU74ZrMFeyyTqUYf-TuUajY8RtLwA@mail.gmail.com>

On Wed, Jun 04, 2025 at 12:16:53PM +0800, Luka wrote:
> Dear Kernel Maintainers,
> 
> I am writing to report a potential vulnerability identified in the
> upstream Linux Kernel version v6.12, corresponding to the following
> commit in the mainline repository:
> 
> Git Commit:  adc218676eef25575469234709c2d87185ca223a (tag: v6.12)

In the bug report linked below, the kernel identifies itself as:

  6.12.18-android16-1-maybe-dirty-4k #1

... which strongly suggests that (in addition to uncommitted changes),
the kernel is based on the v6.12.18 table kernel, i.e. commit:

  105a31925e2d (tag v6.12.18)

... in the upstream stable tree.

Please note that between v6.12 and v6.12.18 there are 3929 commits, any
of which could be significant to this issue.

As with the other report I replied on:

  https://lore.kernel.org/linux-arm-kernel/aD_zu4GNfOKxXXQk@J2N7QTR9R3/T/#t

... I do not think you are providing accurate details.

> This issue was discovered during the testing of the Android 16 AOSP
> kernel, which is based on Linux kernel version 6.12, specifically from
> the AOSP kernel branch:
> 
> AOSP kernel branch: android16-6.12
> Manifest path: kernel/common.git
> Source URL:  https://android.googlesource.com/kernel/common/+/refs/heads/android16-6.12
> 
> Although this kernel branch is used in Android 16 development, its
> base is aligned with the upstream Linux v6.12 release. I observed this
> issue while conducting stability and fuzzing tests on the Android 16
> platform and identified that the root cause lies in the upstream
> codebase.

Based on the information provided so far, I don't think this is true.
You have not identified the root cause, and you have not demonstrated
that the issue exists in the upstream tag you mention above.

Why do you believe that the root cause lies in the upstream codebase?

It's not clear which kernel specifically you're running, but I'm fairly
confident that it's not built from a recent commit in the android16-6.12
branch.

If the "v6.12.18" prefix in the kernel tree is accurate, then your
kernel is no newer than commit:

  b3fb80bdc64b ("Merge 6.12.19 into android16-6.12")

... in the android16-6.12 branch, and there are 1000+ commits since
then.

[...]

> Bug Location: ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:860

This is misleading; ret_from_fork() has nothing to do with this hang.

Is this something you've guessed at yourself, or is this what syzkaller
reported to you?

In the linked bug, the kernel reports:

| INFO: task kworker/2:7:5593 blocked for more than 143 seconds.
|       Tainted: G            E      6.12.18-android16-1-maybe-dirty-4k #1
| "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
| task:kworker/2:7     state:D stack:0     pid:5593  tgid:5593  ppid:2      flags:0x00000008
| Call trace:
|  __switch_to+0x424/0x798 proc/self/cwd/common/arch/arm64/kernel/process.c:617
|  context_switch proc/self/cwd/common/kernel/sched/core.c:5911 [inline]
|  __schedule+0xa48/0x1018 proc/self/cwd/common/kernel/sched/core.c:7737
|  __schedule_loop proc/self/cwd/common/kernel/sched/core.c:7818 [inline]
|  schedule+0x54/0xdc proc/self/cwd/common/kernel/sched/core.c:7833
|  schedule_preempt_disabled+0x2c/0x4c proc/self/cwd/common/kernel/sched/core.c:7890
|  kthread+0x180/0x25c proc/self/cwd/common/kernel/kthread.c:382
|  ret_from_fork+0x10/0x20 proc/self/cwd/common/arch/arm64/kernel/entry.S:860

Note that ret_from_fork() is the assembly stub used to start any kernel
thread. Here it just means that a new kthread was started, and that has
blocked for some reaason in TASK_UNINTERRUPTIBLE state.

Whatever it's blocked on is due to code elsewhere.

Mark.

> 
> Bug Report: https://hastebin.com/share/xiyapaboxu.shell
> 
> Entire Log: https://hastebin.com/share/kibohuxobi.yaml
> 
> 
> Thank you very much for your time and attention. I sincerely apologize
> that I am currently unable to provide a reproducer for this issue.
> However, I am actively working on reproducing the problem, and I will
> make sure to share any findings or reproducing steps with you as soon
> as they are available.
> 
> I greatly appreciate your efforts in maintaining the Linux kernel and
> your attention to this matter.
> 
> Best regards,
> Luka
> 
