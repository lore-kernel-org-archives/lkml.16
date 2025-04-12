Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D44431632C8
	for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 08:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744447082; cv=none; b=axNwyeK2FGYSCGQxaWvl1YhwQSA/g6pjEqfS0iCOemn2ax7sAeH5LpFmLkXUWw5fs9yfz0LllGcbRYGp2AcWZBW3n9POFBBNxZ3QrN9YEAaFH1CwW89avKYP4Y+e5OW7IM2M70Ddb6ZRGwEaAO5zCv7fD3UJEkVjg9jMZHbqYug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744447082; c=relaxed/simple;
	bh=KaLNA67rc5W9sKvqd9G82bulN2l1K2n64YJQ5TuCFsE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iUzJFxT85v4/cOfxOxM5kbwdyQA7xkkDQJiO3F4ioXW84cSBlqKXp234WzAySR+DZZe0P9Ez1Gqm276glGnLXwReEFifp/3yk47KzaYF2SY37aBMKy8qyWVRCQdRzGOLsQaQFaLaHd1j6XFMpfOcpUHKsGRp2fW9l0RrAgxaQoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XQW58dG+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XQW58dG+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1BBDC4CEE3;
	Sat, 12 Apr 2025 08:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744447082;
	bh=KaLNA67rc5W9sKvqd9G82bulN2l1K2n64YJQ5TuCFsE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XQW58dG+TPswY3D1QtI1m+pyxjqbQB0Dj6zTzHLjXZfPenRpuIT4HTrhyPuqcsJUC
	 Zg0c6TGXcsdpozPhSglovWYyZ4nT1F78NG3tPt4uPVAuUzTHWalapzk5nIjiHNIOPP
	 90Gz0y2FErAnROITktTgOVL9uOlD+EreRR5qkss1Uq6Zuxz/b4VkLzazn8xte9Q/Q3
	 kNe99R7hWcGR+3B43EXlJzIWKQuQpttMhFXjTRqdxYC40t+vf/iRDANyzkUjVz6YvV
	 Og5D25lTTqgfSa/E39/FQcY/PUrZeX6BFM4p/QGKJ1yto/0/3IwiRr5dl/5tdbUSS/
	 MVtLMzvx3yt8A==
Date: Sat, 12 Apr 2025 10:37:56 +0200
From: Ingo Molnar <mingo@kernel.org>
To: "Chang S. Bae" <chang.seok.bae@intel.com>
Cc: linux-kernel@vger.kernel.org, Andy Lutomirski <luto@amacapital.net>,
	Dave Hansen <dave@sr71.net>, Brian Gerst <brgerst@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>, "H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH 6/8] x86/fpu: Make sure x86_task_fpu() doesn't get called
 for PF_KTHREAD|PF_USER_WORKER tasks during exit
Message-ID: <Z_omZOmmwpN-iOxn@gmail.com>
References: <20250409211127.3544993-1-mingo@kernel.org>
 <20250409211127.3544993-7-mingo@kernel.org>
 <bc06b0e7-8325-4044-93cd-a365ea745c0a@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bc06b0e7-8325-4044-93cd-a365ea745c0a@intel.com>


* Chang S. Bae <chang.seok.bae@intel.com> wrote:

> On 4/9/2025 2:11 PM, Ingo Molnar wrote:
> >   void arch_release_task_struct(struct task_struct *tsk)
> >   {
> > -	if (fpu_state_size_dynamic())
> > +	if (fpu_state_size_dynamic() && !(current->flags & (PF_KTHREAD | PF_USER_WORKER)))
> >   		fpstate_free(x86_task_fpu(tsk));
> >   }
> 
> Looks like the AMX system couldn't boot properly, and I found that
> referencing tsk->flags here resolves the issue.

Indeed, fixed!

I've also added your Fixed-by tag to the patch:

  Fixed-by: Chang S. Bae <chang.seok.bae@intel.com>

Thanks,

	Ingo

==========>

 arch/x86/kernel/process.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kernel/process.c b/arch/x86/kernel/process.c
index de9df37c5d67..7a1bfb61d86f 100644
--- a/arch/x86/kernel/process.c
+++ b/arch/x86/kernel/process.c
@@ -109,7 +109,7 @@ int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src)
 #ifdef CONFIG_X86_64
 void arch_release_task_struct(struct task_struct *tsk)
 {
-	if (fpu_state_size_dynamic() && !(current->flags & (PF_KTHREAD | PF_USER_WORKER)))
+	if (fpu_state_size_dynamic() && !(tsk->flags & (PF_KTHREAD | PF_USER_WORKER)))
 		fpstate_free(x86_task_fpu(tsk));
 }
 #endif
