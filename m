Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 490C942A94
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 22:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743459566; cv=none; b=OpQ4oIsJ+jTZfOCpUBLqwla82w0mU9Wg/OCYdr/iIBiav5Sw3HHcWt5UVeVmyW6rQTVkQi9IN2LNOOYMo+xDNDAPg6kJMEmptDbE8Bgm5j0maALXMvM99XWTrsXia/l4fjA7OKhQ7QhVd/NbkLITV1YOjKNM1lctJflFNOzR1Yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743459566; c=relaxed/simple;
	bh=K4QqaVNG1/f/xcD7VGSY5IQm2tQB3BU7pm5gDcvlZwE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W7v+I2KEyUZBMqmK6eZUefJbL/XGe1DBb4JzvTsPLr/zVvKvulZTZN106YvSOlxUfZGT3RTei2jOLc7D4pzMgUS7gY1QCGeGvB2dLT6oBSYQxdoqKfZ/HjZtJQlbSxiPaTeSdshMXzS8BcCxpowupPY373w7IcOR1RcvzFnwqlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JYnXWGYi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JYnXWGYi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADFB1C4CEE3;
	Mon, 31 Mar 2025 22:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743459565;
	bh=K4QqaVNG1/f/xcD7VGSY5IQm2tQB3BU7pm5gDcvlZwE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JYnXWGYiVnyUTJXQJGjZAQVAuwF4TurNWKCQmvD/+TqIcYUs+N5wA/vB+WqJlEPjB
	 nR+/ffAfZp/udKB8B+8NNq1kuOIixs/0Mydq8ZLufwgA2DWhbx4dqPoQlbe8eQ9Rm9
	 76simU6tolhyIgsfnjjLV69u8OjF8tezlxVwu4GuFjZ8SKdDgK1IsKqbdoopwRU9TB
	 FsaMsehb9xpDtr2SGyNDkivLvnP53auYm5h5zFqYbvk1lXP+yknNbwYjjq6GvqA8Uq
	 GWxFTY3PQP944VvQP1UldR6LeuJaJ0u264HCdc97JcCzoeyCD+h9PdiqPtKaUii7Aj
	 VwwBO+KwpAs1g==
Date: Mon, 31 Mar 2025 15:19:23 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Borislav Petkov <bp@alien8.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, 
	Ingo Molnar <mingo@kernel.org>, linux-kernel@vger.kernel.org, 
	Peter Zijlstra <a.p.zijlstra@chello.nl>, Thomas Gleixner <tglx@linutronix.de>, 
	Andrew Morton <akpm@linux-foundation.org>, Tiezhu Yang <yangtiezhu@loongson.cn>
Subject: Re: [GIT PULL] objtool fixes and updates
Message-ID: <ttv3iy3i57mvmkdp2mwh4cjwk3qx5eoyr7zmgjl5beohfxvwar@4na7dgto7r6m>
References: <Z-cSQXJKMyBSfAAc@gmail.com>
 <20250329153242.GAZ-gSmu8qiXufR04k@fat_crate.local>
 <CAHk-=wjqLm+eTuyLR_84vWOZK+AkhV==r=PcuAt3+3nf68SjOw@mail.gmail.com>
 <20250330231355.GFZ-nQM6NPcC7nWl__@fat_crate.local>
 <sdjfftubzcheo3dpejml54t6axfjfrd7pk6mnbkpb2n7alpfzn@6l6bldqfturq>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <sdjfftubzcheo3dpejml54t6axfjfrd7pk6mnbkpb2n7alpfzn@6l6bldqfturq>

On Sun, Mar 30, 2025 at 06:39:51PM -0700, Josh Poimboeuf wrote:
> On Mon, Mar 31, 2025 at 01:13:55AM +0200, Borislav Petkov wrote:
> > On Sun, Mar 30, 2025 at 03:19:40PM -0700, Linus Torvalds wrote:
> > > On Sat, 29 Mar 2025 at 08:33, Borislav Petkov <bp@alien8.de> wrote:
> > > >
> > > > Btw, test bot complains:
> > > >
> > > > https://lore.kernel.org/r/202503292202.Sge7ZEUc-lkp@intel.com
> > > 
> > > That's not a very helpful error message
> > 
> > I found this:
> > 
> > https://lore.kernel.org/r/202503280703.OARM8SrY-lkp@intel.com
> > 
> > which looks like the original report.
> > 
> > Looks unsolved yet...
> 
> The "new" warning is just the "skipping duplicate warning", which was
> already merged with commit 0a7fb6f07e3a ("objtool: Increase per-function
> WARN_FUNC() rate limit").  So none of the warnings are specific to this
> pull request.
> 
> Tiezhu, can you please look at this warning?
>   
>    arch/loongarch/kernel/traps.o: warning: objtool: show_stack+0xe0: stack state mismatch: reg1[22]=-1+0 reg2[22]=-2-160
>    arch/loongarch/kernel/traps.o: warning: objtool: show_stack+0xe0: stack state mismatch: reg1[23]=-1+0 reg2[23]=-2-152

Here's a fix.  Will post a real fix soon, along with another pile of
fixes.

diff --git a/arch/loongarch/include/asm/stacktrace.h b/arch/loongarch/include/asm/stacktrace.h
index f23adb15f418..fc8b64773794 100644
--- a/arch/loongarch/include/asm/stacktrace.h
+++ b/arch/loongarch/include/asm/stacktrace.h
@@ -8,6 +8,7 @@
 #include <asm/asm.h>
 #include <asm/ptrace.h>
 #include <asm/loongarch.h>
+#include <asm/unwind_hints.h>
 #include <linux/stringify.h>
 
 enum stack_type {
@@ -43,6 +44,7 @@ int get_stack_info(unsigned long stack, struct task_struct *task, struct stack_i
 static __always_inline void prepare_frametrace(struct pt_regs *regs)
 {
 	__asm__ __volatile__(
+		UNWIND_HINT_SAVE
 		/* Save $ra */
 		STORE_ONE_REG(1)
 		/* Use $ra to save PC */
@@ -80,6 +82,7 @@ static __always_inline void prepare_frametrace(struct pt_regs *regs)
 		STORE_ONE_REG(29)
 		STORE_ONE_REG(30)
 		STORE_ONE_REG(31)
+		UNWIND_HINT_RESTORE
 		: "=m" (regs->csr_era)
 		: "r" (regs->regs)
 		: "memory");
diff --git a/arch/loongarch/include/asm/unwind_hints.h b/arch/loongarch/include/asm/unwind_hints.h
index a01086ad9dde..2c68bc72736c 100644
--- a/arch/loongarch/include/asm/unwind_hints.h
+++ b/arch/loongarch/include/asm/unwind_hints.h
@@ -23,6 +23,14 @@
 	UNWIND_HINT sp_reg=ORC_REG_SP type=UNWIND_HINT_TYPE_CALL
 .endm
 
-#endif /* __ASSEMBLY__ */
+#else /* !__ASSEMBLY__ */
+
+#define UNWIND_HINT_SAVE \
+	UNWIND_HINT(UNWIND_HINT_TYPE_SAVE, 0, 0, 0)
+
+#define UNWIND_HINT_RESTORE \
+	UNWIND_HINT(UNWIND_HINT_TYPE_RESTORE, 0, 0, 0)
+
+#endif /* !__ASSEMBLY__ */
 
 #endif /* _ASM_LOONGARCH_UNWIND_HINTS_H */
