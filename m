Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8936419F464
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 20:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745352578; cv=none; b=GyXmRkBvyeDVvesg4aMDWDhrWp14R8wpLGSoKTfJMCXhQBWARdJA+jPMzQ4tupkikVR2fVuZ6jV8noI7uxUft0J1C+zizKwqocWMSXv7yr5ArEtWS1HkjSQLqOeUF6z6PShAHyAw5C12vVfE8hByjNANjbKWI5xiKdFLLk+O5W4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745352578; c=relaxed/simple;
	bh=bb+IxGF36AzPiip0Ub/CXsFDPnQWM8GEs5CB4RwCwPc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DPOSJnf/EHvL1gGmVhB4DIG/Y+NHo0nijAqvGvx+GhULCfgZ7OCZgEhDoz6fPNBH8kjCoPSg47zj+laIVzbD6JlGd+38sh8KhelZy1xUM91SSd7AHYsTD5Hl4ccaSFa48d3jIIWYUEm0gvCQWJBBcK/AZ2rW/kqawuSNQdpiT3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZkJE9/xS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZkJE9/xS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DFF7C4CEE9;
	Tue, 22 Apr 2025 20:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745352578;
	bh=bb+IxGF36AzPiip0Ub/CXsFDPnQWM8GEs5CB4RwCwPc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZkJE9/xSA/ERUstpywuiWUiUhsRiZU5LTBOP/sPHCQsh50JGjpyxjjLUS875iHBWt
	 9LWM8HwPMqJnKCh6GXPl/T9+G5mYZ0v1S+qfDDme1H+ija4zLBpHDEMt+EL6rMTEDk
	 9DrYlVRD/+jJHawHk3Fttuxn+Su4WkRzcoPNucxt9UF2g8i6TjncnE6wErp4UFI/dv
	 DcQVnOrhhY+32l9hgwijpdjDmyU7E10EcW82rAAXZMaWfBPtV/wbKblo3uefryGxqt
	 nhm9iEIdtuoFFnGLNytbESMvQMldUp8PI9lw/xQll2BA1JCzCmy0EDu/VmvxSPL/5J
	 3J/hbHsLHhOWg==
Date: Tue, 22 Apr 2025 22:09:33 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Oleg Nesterov <oleg@redhat.com>
Cc: linux-kernel@vger.kernel.org, Andy Lutomirski <luto@amacapital.net>,
	Dave Hansen <dave@sr71.net>, Brian Gerst <brgerst@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>, "H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	"Chang S . Bae" <chang.seok.bae@intel.com>
Subject: Re: [PATCH -v5 0/8] sched: Make task_struct::thread constant size,
 x86/fpu: Remove thread::fpu
Message-ID: <aAf3fUmft1NTksFY@gmail.com>
References: <20250409211127.3544993-1-mingo@kernel.org>
 <20250422161108.GA1676@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250422161108.GA1676@redhat.com>


* Oleg Nesterov <oleg@redhat.com> wrote:

> Ingo, sorry for delay.
> 
> So just in case, the whole series looks good to me. I am going to send a
> couple of minor cleanups on top of it,

Great, please do!

> [...] but let me ask first if I missed something or not.

You probably didn't. :-)

> - x86_init_fpu is not really used after 4/8, it can be killed

Indeed!

> 
> - DEFINE_EVENT(x86_fpu, x86_fpu_copy_src) can be killed after 7/8

Agreed.

> - arch_dup_task_struct() still does
> 
> 	/* init_task is not dynamically sized (incomplete FPU state) */
> 	if (unlikely(src == &init_task))
> 		memcpy_and_pad(dst, arch_task_struct_size, src, sizeof(init_task), 0);
> 	else
> 		memcpy(dst, src, arch_task_struct_size);
> 
>   and I don't understand why do we need to check src == &init_task. It seems
>   that we can always do
> 
> 	memcpy_and_pad(dst, arch_task_struct_size, src, sizeof(struct task_struct), 0);
> 
>   or even just
> 
> 	memcpy(dst, src, sizeof(struct task_struct));
>
>   fpu_clone() will initialize the "dst_fpu" memory correctly.

Unecessary paranoia on my part, please send a patch to simplify this.

> - fpu__drop() does
> 
> 	/* PF_KTHREAD tasks do not use the FPU context area: */
> 	if (tsk->flags & (PF_KTHREAD | PF_USER_WORKER))
> 		return;
> 
>   and this is correct. But perhaps
> 
> 	if (test_tsk_thread_flag(tsk, TIF_NEED_FPU_LOAD))
> 		return;
> 
>   makes more sense? PF_KTHREAD's should never clear TIF_NEED_FPU_LOAD,
>   and this way we can avoid the unnecessary "fwait" if, say, the exiting
>   task does context_switch() at least once on its way to exit_thread().

I think you are right here as well.

> - Finally, with or without these changes, it seems that the
>   switch_fpu_prepare() + switch_fpu_finish() logic can be simplified,
>   I'll write another email.

Thank you!

	Ingo
