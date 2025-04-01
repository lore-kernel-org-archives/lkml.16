Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D3221E5B88
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 08:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743495060; cv=none; b=hjCXuYYY51phB1AoobEk+Dz/zDNNOKPUueuKyr3khEmkaBFd3VF3l9VPbXEzy4EkPmIcxz+g+ebIcnORfT1dD+q+0WCYXIi07LlF8J8XgBdOTtPI5wZQ6AuFCfjTstHjd8AmzAQW60Fo8XJPFM8ewZiSuLfMmuydmVatJSV+zIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743495060; c=relaxed/simple;
	bh=4QLP2iKRZxI/ONaeX1kR9vrNKb8yEDCxd/NQXakruhA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hiNR9QcHitVnw9jwZ0r+HYNBIc0jIRyzCwwDyhPU8tjJh4vMzqqZLI15AGc6AdHhAuQBnGHCWeHbHdxvB7n2wyWzwcy0I4w6GcHfcKwl3tiCM/Cdgr5RyuzTBp37d/HvBeSwPp9NBBD4eIy7tuX5GEwjTFD1/neGJBD7vGD7OzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ECtBp3TQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ECtBp3TQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58F27C4CEE4;
	Tue,  1 Apr 2025 08:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743495060;
	bh=4QLP2iKRZxI/ONaeX1kR9vrNKb8yEDCxd/NQXakruhA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ECtBp3TQqyooslkWP5Ybn1EFQMcipB8Kb4ILAMUi15FPdGhsyctpwX+bdJXWZi7gS
	 6n9EEBQHyhL90aJ2FLLth59qaI1fNDsgzfaSO/3hGQxhZy8UNkV2okiIyvh80a8ADv
	 Sypr45H9YerF2NcEhngMGMe6PDE0va8Q6nx4z6/6J/NXhZaafTdkLt6wmS2ptFvryW
	 zFFw1lM81qbcj+DpztsjTJF6ft8tIPJB82FmV/54YIu9tT6E9YhVXJyoef4R0DYvD1
	 f+FbYFB/NL0/48/TvUbTDiZQSXrGdKB/UHsRKONReviNhPzDc4+ITfruhFbY9wfMN6
	 T+S1jhB9H/w0g==
Date: Tue, 1 Apr 2025 10:10:56 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, x86@kernel.org,
	linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
	kernel test robot <lkp@intel.com>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH 08/11] objtool/loongarch: Add unwind hints in
 prepare_frametrace()
Message-ID: <Z-ufkGy0hPbwMUYI@gmail.com>
References: <cover.1743481539.git.jpoimboe@kernel.org>
 <270cadd8040dda74db2307f23497bb68e65db98d.1743481539.git.jpoimboe@kernel.org>
 <Z-uQ7NqMzqAShWcH@gmail.com>
 <2e25fe84-f772-5d87-c7a7-bf40055fb4bc@loongson.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2e25fe84-f772-5d87-c7a7-bf40055fb4bc@loongson.cn>


* Tiezhu Yang <yangtiezhu@loongson.cn> wrote:

> On 04/01/2025 03:08 PM, Ingo Molnar wrote:
> > 
> > * Josh Poimboeuf <jpoimboe@kernel.org> wrote:
> > 
> > > If 'regs' points to a local stack variable, prepare_frametrace() stores
> > > all registers to the stack.  This confuses objtool as it expects them to
> > > be restored from the stack later.
> > > 
> > > The stores don't affect stack tracing, so use unwind hints to hide them
> > > from objtool.
> > > 
> > > Fixes the following warnings:
> > > 
> > >   arch/loongarch/kernel/traps.o: warning: objtool: show_stack+0xe0: stack state mismatch: reg1[22]=-1+0 reg2[22]=-2-160
> > >   arch/loongarch/kernel/traps.o: warning: objtool: show_stack+0xe0: stack state mismatch: reg1[23]=-1+0 reg2[23]=-2-152
> > > 
> > > Cc: Tiezhu Yang <yangtiezhu@loongson.cn>
> > > Fixes: cb8a2ef0848c ("LoongArch: Add ORC stack unwinder support")
> > > Reported-by: kernel test robot <lkp@intel.com>
> > > Closes: https://lore.kernel.org/oe-kbuild-all/202503280703.OARM8SrY-lkp@intel.com/
> > > Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
> > 
> > Note, I skipped this fix from tip:objtool/urgent for the time being,
> > because Tiezhu Yang indicated that he'd be reviewing and testing this
> > patch.
> 
> Tested-by: Tiezhu Yang <yangtiezhu@loongson.cn>

Thank you! Is it fine with you if I send this fix with tonight's 
objtool/urgent pull request to Linus?

Thanks,

	Ingo
