Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2D2241760
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 09:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743413959; cv=none; b=POKuQGl/jNne9ZTa9+ynkGd72Ez4rhT+8+S1ZrXXlF05/5Fw3ug4YUsxC0iAt9aJgATuU6cD31a8458MkfQIMFv8QBxbaJY7dW6iy4lSkWrDw3+AqZlwmyzi/ZiC74a8n3dMMlt5e5ibn35aX4y+D9IAlX12pxOA+LuK+F2C+pA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743413959; c=relaxed/simple;
	bh=kZaYLmlN7c8N/Ctja7CV0elUZ5dx9/sUPM5JPhGaNpM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XL04rqhylD0WTTSV6/sCIRjTXbkrY2Eid5/zMqz/dtN9DRX+D4R7iqZY61VsiEUNzTNoG/XF0B6CMMo7x8AHsNCSPh5cA8ssK1J24jKu5AR9ZYPySjfdjc/kMJlrWcEKe9XhOe+5t6tQH4jEQwKJ59hTp5/H4AM8cHy6qNWrfPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EZkCluNt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EZkCluNt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0A32C4CEE3;
	Mon, 31 Mar 2025 09:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743413956;
	bh=kZaYLmlN7c8N/Ctja7CV0elUZ5dx9/sUPM5JPhGaNpM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EZkCluNt5vKwZe+CXwbpF0Zo+XnJigW9/al/1oaeo7ryRYEDkl4xhVb9Ek0r9j5ZL
	 uFTWnoCCN35Mu6Y2o/m6M0yyJxHl3355WTP4TC9NnlfCec7NNXUHXii04ALfRRrZt+
	 oZ/n2bYkhUpNH/zonu1aahhnUEJlZJkIg2p9MOjzYit29ZprySmCt0DoosHeZKe8Eh
	 fCDeZdhwqlv17put2CkcX2gHoqPYyLcmtbgkBHA+9tMc3LbDICoN6xqCKznjHpEe52
	 +b6nCT0lthj+GX2wJYOGJW6rW2gZAbCZYiIzX+rWzaUoHC3wgVFQ0uyOtvxiP5Ihlk
	 vT1NHA7fxVN1w==
Date: Mon, 31 Mar 2025 11:39:13 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] objtool fixes and updates
Message-ID: <Z-piwUbLx-OitJrv@gmail.com>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <sdjfftubzcheo3dpejml54t6axfjfrd7pk6mnbkpb2n7alpfzn@6l6bldqfturq>


* Josh Poimboeuf <jpoimboe@kernel.org> wrote:

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

I'm wondering why LKP didn't pick up the primary warning, only the 
final warning that skips duplicate warnings, which is kinda totally 
useless in isolation:

    `-- arch-loongarch-kernel-traps.o:warning:objtool:show_stack:skipping-duplicate-warning(s)

Maybe we should just do what is below - output a single warning, a bit 
like lockdep.

Or delay the reporting to until the entire pass is finished, and 
output something like:

  warning: objtool: show_stack+0xe0: stack state mismatch: reg1[22]=-1+0 reg2[22]=-2-160 [2+ more warnings]

Note: we shouldn't output the real warning count - just that it's 
multiple warnings that might or might not be resolved by fixing the 
primary warning.

Or something like that.

Thanks,

	Ingo

============>
 tools/objtool/include/objtool/warn.h | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/tools/objtool/include/objtool/warn.h b/tools/objtool/include/objtool/warn.h
index b29ac144e4f5..69dd29a3c267 100644
--- a/tools/objtool/include/objtool/warn.h
+++ b/tools/objtool/include/objtool/warn.h
@@ -57,7 +57,7 @@ static inline char *offstr(struct section *sec, unsigned long offset)
 	free(_str);					\
 })
 
-#define WARN_LIMIT 2
+#define WARN_LIMIT 1
 
 #define WARN_INSN(insn, format, ...)					\
 ({									\
@@ -69,8 +69,6 @@ static inline char *offstr(struct section *sec, unsigned long offset)
 		if (_insn->sym)						\
 			_insn->sym->warnings++;				\
 	} else if (_insn->sym && _insn->sym->warnings == WARN_LIMIT) {	\
-		WARN_FUNC("skipping duplicate warning(s)",		\
-			  _insn->sec, _insn->offset);			\
 		_insn->sym->warnings++;					\
 	}								\
 })
