Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 633F5267F7E
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 10:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744282297; cv=none; b=SgxAC9PZb4JctmA8NfJiJfZ/bFnAVstGsZC/1O9zcQHKASt/MLfx3VL57JhYIge58GqawVA5b3OFpSgkz/no/NF0RWu040u4lmzgjbvDJR3xrcZnVkr6P5f6IJHqZqTmMhuRMlokl3m8bJzms46KgZGuy+RRh54jSA2ByxG3VI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744282297; c=relaxed/simple;
	bh=cV/IuJuyobXK5kMrKi7lQuLAWisaQPLN5V2EQPAIr/U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MaRd+JY6V28u/0N8ThmKYc7wsf6Ym886zLI6xucFljcxlwU/xJHYU+gdqKQOVfi8wlPb4b6/65UsracPUM9Fsnj4mix2OPHiuZio2S7kaZfL5z+o2oJzX1y6YbF5Dnz5tc5ytaZMw3PA/Zl99mCtOwa5cq8Nkh9IPRWf7risGS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GALSyyg9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GALSyyg9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CF22C4CEE9;
	Thu, 10 Apr 2025 10:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744282296;
	bh=cV/IuJuyobXK5kMrKi7lQuLAWisaQPLN5V2EQPAIr/U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GALSyyg9rTQYC9iHKaNuaF6SDWR2TIgS1NHtqxlqL+xLfI5IhyLaH0mz6fDbxm3ri
	 6F2bUj7AXuUfBlKYw3OQ7Y2PY9Nw7FHc7Zt61qmsLYTfTP93RkXELgJ0E82ISvg5RY
	 dPFHhYDbGGxgDiyNXFgbJsVfds4CuoC+1Vn0cWYoYO3zq5WzSs8JnMKqVKZ7c05V+T
	 YNzw56fkodt/3AkvaFBwg/AEzGL5jIPWvm5/vfjyxJjc45IkSNsholrR66gdZC17HH
	 faOnJsMlIl80XK+Cw3A/3Z1ut+EQFdP2t2p9Rb0QJ9nlcOX/a7j17BdxuFvzUUjzZ5
	 0+6/eAmDVMy+Q==
Date: Thu, 10 Apr 2025 12:51:31 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: linux-kernel@vger.kernel.org, Andy Lutomirski <luto@amacapital.net>,
	Dave Hansen <dave@sr71.net>, Brian Gerst <brgerst@gmail.com>,
	Borislav Petkov <bp@alien8.de>, "H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	"Chang S . Bae" <chang.seok.bae@intel.com>,
	Andy Lutomirski <luto@kernel.org>,
	Fenghua Yu <fenghua.yu@intel.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Uros Bizjak <ubizjak@gmail.com>
Subject: Re: [PATCH 4/8] x86/fpu: Remove the thread::fpu pointer
Message-ID: <Z_eis4nbGK6-SPjP@gmail.com>
References: <20250409211127.3544993-1-mingo@kernel.org>
 <20250409211127.3544993-5-mingo@kernel.org>
 <20250410073948.GT9833@noisy.programming.kicks-ass.net>
 <Z_eZMN4PcOwFnskB@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_eZMN4PcOwFnskB@gmail.com>


* Ingo Molnar <mingo@kernel.org> wrote:

> BTW., Oleg suggested in a previous discussion for us to replace the 
> task->thread.fpu pointer with a build-time calculation - but I'm 
> still not sure it's a good idea.

Actually, I've implemented that already:

  arch/x86/include/asm/processor.h:# define x86_task_fpu(task)    ((struct fpu *)((void *)(task) + sizeof(*(task))))

... then promptly forgot about it. So never mind me. :-)

Thanks,

	Ingo
