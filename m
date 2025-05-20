Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFC7B2580F7
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 17:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747762635; cv=none; b=mIWQrhm+c65EcFNd/9Xibvj8mrkS8q+InvcjEOpQ7WEXDFfDeTinPLTJHeU1VVukRad6+3T0mhvspSp4Tl3tTF21a8FXIytXFBLvfqKDrr6FD8LFkmlbzHBMWzhIFK/ip/aR7vKrAWpVb80+wCFlsdSY5hNDC6WV3W5QHhRd42Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747762635; c=relaxed/simple;
	bh=0b42x+ivEyP5l3OMfgQmSLjAq9HIV5l+NtIDagsDl20=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=bnwhhiYsdfF9cDzuoI+ThkHAJ8k/MAZgyGyS8nlP52Brs4u2+VDtpfmufBgMBy4X9vVE7VaDANG03QlFbr+pTMwS45kUMnq8Tl4IjQlP1gi23lVtBozbulWPlb21tD+Dr/NBrkBsFZ3eAljqmxUsqPaqvDb+FuV3WOlEYalNk48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AkojSDDk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AkojSDDk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9BB4C4CEE9;
	Tue, 20 May 2025 17:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747762635;
	bh=0b42x+ivEyP5l3OMfgQmSLjAq9HIV5l+NtIDagsDl20=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=AkojSDDkAIrmtRBD4USDtEmsYxmSm8dpmPU33ULoquAZvqEMe8zz5SFVjDJPs5aST
	 UuQQ9BKPpRJRfnZPMMqLjFvS0mZjwiK9Z6QSRu6M2dNUQ4BsLHlbvp8O/9gtqVz0NU
	 KpcJll/+OLCCbkgqPv8HZHS/4lvjga7kkK5Wpw688Jj9UTWI9/Rbww4ayzjszSXLyR
	 a+epo8/UEJ0UuDKOVAPLBGwBY3weSQdcc5nIVsg4E4B+sknxeC04gBdH9awZ7RGO6p
	 PKBo3QfqNS59dFCVeA6Z9USSFeVHo12jnLII6MgoHQBUDvt5DUKCOu8WiZyapgAXVe
	 fROaenPCO1gog==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: =?utf-8?Q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Cc: =?utf-8?Q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, Himanshu
 Chauhan
 <hchauhan@ventanamicro.com>, Anup Patel <apatel@ventanamicro.com>, Xu Lu
 <luxu.kernel@bytedance.com>, Atish Patra <atishp@atishpatra.org>
Subject: Re: [PATCH v4 0/4] riscv: add support for SBI Supervisor Software
 Events
In-Reply-To: <20250516152355.560448-1-cleger@rivosinc.com>
References: <20250516152355.560448-1-cleger@rivosinc.com>
Date: Tue, 20 May 2025 19:37:12 +0200
Message-ID: <87sekzi3p3.fsf@all.your.base.are.belong.to.us>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Cl=C3=A9ment!

Cl=C3=A9ment L=C3=A9ger <cleger@rivosinc.com> writes:

> The SBI Supervisor Software Events (SSE) extensions provides a mechanism
> to inject software events from an SBI implementation to supervisor
> software such that it preempts all other supervisor level traps and
> interrupts. This extension is introduced by the SBI v3.0 specification[1].
>
> Various events are defined and can be send asynchronously to supervisor
> software (RAS, PMU, DEBUG, Asynchronous page fault) from SBI as well
> as platform specific events. Events can be either local (per-hart) or
> global. Events can be nested on top of each other based on priority and
> can interrupt the kernel at any time.
>
> First patch adds the SSE definitions. Second one adds support for SSE
> at arch level (entry code and stack allocations) and third one at driver
> level. Finally, the last patch add support for SSE events in the SBI PMU
> driver. Additional testing for that part is highly welcomed since there
> are a lot of possible path that needs to be exercised.
>
> Amongst the specific points that needs to be handle is the interruption
> at any point of the kernel execution and more specifically at the
> beginning of exception handling. Due to the fact that the exception entry
> implementation uses the SCRATCH CSR as both the current task struct and
> as the temporary register to switch the stack and save register, it is
> difficult to reliably get the current task struct if we get interrupted
> at this specific moment (ie, it might contain 0, the task pointer or tp).
> A fixup-like mechanism is not possible due to the nested nature of SSE
> which makes it really hard to obtain the original interruption site. In
> order to retrieve the task in a reliable manner, add an additional
> __sse_entry_task per_cpu array which stores the current task. Ideally,
> we would need to modify the way we retrieve/store the current task in
> exception handling so that it does not depend on the place where it's
> interrupted.
>
> Contrary to pseudo NMI [2], SSE does not modifies the way interrupts are
> handled and does not adds any overhead to existing code. Moreover, it
> provides "true" NMI-like interrupts which can interrupt the kernel at
> any time (even in exception handling). This is particularly crucial for
> RAS errors which needs to be handled as fast as possible to avoid any
> fault propagation.
>
> While OpenSBI SSE support is already upstream, an additional patch is
> needed for the PMU perf driver to work as expected [2].
>
> Link: https://github.com/riscv-non-isa/riscv-sbi-doc/releases/download/v3=
.0-rc7/riscv-sbi.pdf [1]
> Link: https://github.com/rivosinc/opensbi/tree/dev/cleger/sse_pmu_irq [2]

Finally got around having a look/test!

Thanks for adding all the SSE tests to kvm-unit-tests [1]! What a hidden
gem -- at least to me!

It would be nice with similar tests in kselftest, so that we can
exercise the SSE paths on the CI worker!

...and a couple of general comments that apply to all patches.

  * There are a bunch of checkpatch warnings/errors -- not all make
    sense, but some do!
  * Minor spelling errors in the commit messages, that codespell
    catches.
  * There are some new unused variables warnings in the build.

Most of that (modulo the spellchecks) in PW [2].
=20=20
I'll have some minor things in the other patches.


Thanks for working on this, and looking forward to having it land!
Bj=C3=B6rn

[1] https://gitlab.com/kvm-unit-tests/kvm-unit-tests
[2] https://patchwork.kernel.org/project/linux-riscv/list/?series=3D963680
