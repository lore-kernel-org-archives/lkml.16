Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60D7A221FAF
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 15:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747843034; cv=none; b=Bc2o+bjniTiflskU2lXKYnBUIroyvgRgrwcbuMhYXv7MPe4ZkwYWbY3F6qYgHxoN53CoGkax3yDwbgOWTFibnz1b7QtSPihviJxiowouMk5rINkFoy8TrdCJhstuxQPYVwQZWluec6Vivf3sSMlil5K9DdMWeJd8/xGwqzP1HCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747843034; c=relaxed/simple;
	bh=Gi+3AysAFVE04l5WwXRekokP65YcIVrI6vfG5zRYtJw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ze53Ms4ZuVWfkEk36mLOuRokZjBTs2fgDiWtWm7TahwGuXexoLMe86Mxwl8ZNLaHi9snF+LK0DIrX9NoZZjXDeXNqAahkGEqMJbJMpFDQzh+3P7atTXnLifUOP/YZi2GhF4MBrzOx8RQZbNYCxGElYxjvKWox7ts7HHhkEVsdnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oS9+YVEx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oS9+YVEx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9D8FC4CEED;
	Wed, 21 May 2025 15:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747843033;
	bh=Gi+3AysAFVE04l5WwXRekokP65YcIVrI6vfG5zRYtJw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oS9+YVEx88/EzrjNxmvXRlfxPY5It6xbTNZnaDSVr42SfbpSKUCMSSslTS5YnGbiq
	 YSQrhFCtcQESdQw8/aBFXQel9eHivdO71X6tlsVQV6iTyfIrKmlB/OoZon+1XumM6T
	 jW71FnnAqKIeaiQDwkZnBL36B5z0TBxn4gOrhoJCqdxloKTvaDedoPk0SYXdq758W+
	 zXrtki3ZXtZuqMAMobz1G8TwyjoSDUQU+jr0M+QBNif4bzEVqhFLtcdGdNBh33qi6h
	 nDUwFXFsL+Pdco07f5DJuWf2dBlAL0NvUqiF5OJp1cEW9RxbB/Rj5vZ3BmsFngu40g
	 wXXdhjpyq6TpQ==
Date: Wed, 21 May 2025 08:57:11 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: John <john.cs.hey@gmail.com>
Cc: Peter Zijlstra <peterz@infradead.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
	linux-kernel@vger.kernel.org, Paul Moore <paul@paul-moore.com>, 
	Stephen Smalley <stephen.smalley.work@gmail.com>
Subject: Re: [Bug] "BUG: soft lockup in perf_event_open" in Linux kernel v6.14
Message-ID: <jnrnpz2sms365aleeowcwisbefiekvkhbd6s5x42z7wuqnfxcy@dr6tkjizp3v5>
References: <CAP=Rh=PtKsiXGLYeK5tr4LSw-AHJ6LM4kuTWR3Hs5sQQp02wCw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAP=Rh=PtKsiXGLYeK5tr4LSw-AHJ6LM4kuTWR3Hs5sQQp02wCw@mail.gmail.com>

On Wed, May 21, 2025 at 09:49:41PM +0800, John wrote:
> Dear Linux Kernel Maintainers,
> 
> I hope this message finds you well.
> 
> I am writing to report a potential vulnerability I encountered during
> testing of the Linux Kernel version v6.14.
> 
> Git Commit: 38fec10eb60d687e30c8c6b5420d86e8149f7557 (tag: v6.14)
> 
> Bug Location: 0010:orc_find arch/x86/kernel/unwind_orc.c:217
> 
> Bug report: https://pastebin.com/QzuTF9kT
> 
> Complete log: https://pastebin.com/XjZYbiCH
> 
> Entire kernel config: https://pastebin.com/MRWGr3nv
> 
> Root Cause Analysis:
> 
> A soft lockup occurred on CPU#0 in the unwind_next_frame() function
> during stack unwinding triggered by arch_stack_walk().
> This was called in the middle of __kasan_slab_free() as part of RCU
> reclamation path (rcu_do_batch()), likely triggered by a SLAB object
> free in SELinux's avc_reclaim_node().
> The system was under heavy AVC pressure due to continuous audit and
> avc_has_perm() calls (e.g., from selinux_perf_event_open), leading to
> repeated avc_node allocations and reclamations under spinlocks.

I'm out of the office but I couldn't help myself glancing at it.

It looks like a deadlock in the selinux code.  Two of the CPUs are
waiting for a spinlock in avc_reclaim_node().  A third CPU is running in
avc code (currently context_struct_compute_av).

Adding a few selinux folks.

-- 
Josh
