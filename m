Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32C68261581
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 07:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744096508; cv=none; b=mOqIMSa7q/nttOorecH9qJPNSgCDGaxNKSDpU1JIVw40t1oyksfJYSmY82d/mWFYqRo4uJ+WG0OgxrL97p/HOsZMQsr4y0xMYsMyf3zDOUXDQo5oG4nrXWkxKRfOKtXcVl5CUhvx5CNEVRQgjGqiJ45bd1hAlu40+YPLMAnXsLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744096508; c=relaxed/simple;
	bh=f3PrHU1m75DtnHCFRtEUIY0AurcfaKtGOAr14HVLQKk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gqnTTn5FuSGlgvkvYhdcJ0CZrSw7iy1iAUlDDMzv79cpGAHubD7Yhe+vjPzv2WP8gS1cHKHZFt5ZWq1bALhFBmNBR+yeeADQpf9HoO/x34pOYiMms2h3o9uISFpy60ZvqxgRvxJrCgSevHt5l4fniD9bOF7jAD9tryvaNHUrx50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ho0sS3ch; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ho0sS3ch"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A3F5C4CEE5;
	Tue,  8 Apr 2025 07:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744096507;
	bh=f3PrHU1m75DtnHCFRtEUIY0AurcfaKtGOAr14HVLQKk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ho0sS3ch6nyufS9KVZwb+bTo8hse2jYU5ukbYvd1S+G6V3YRNGYsvXbJZByKe7wa5
	 jtcY968IJqStb5McK1BEMb3P+cfSfzTVkBnu+COLSbVkSNB1w98TNrZZbhSqMNSteP
	 phMkCAzxoUzp+1OCDNd1h8SlsHYTrztKg/7F3lwPsTXtZLbAA04JbKDOnD+QfXJQiY
	 2bJVtAdO4tLCZtzgA3qA3zqjTpPKVyfU1Xj9wBcTK749q6ks2qSzsUHJv4/cYDDpPd
	 GAgYRqzQSOOyxPuZxyp37WQoeBHplwJFHSLAuCV+pfJItgMHVoliGBAUdyYKBQ8KFe
	 n17PjBSbKAA9w==
Date: Tue, 8 Apr 2025 09:15:03 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org,
	Peter Zijlstra <peterz@infradead.org>,
	Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v4 0/4] objtool: Fix INSN_CONTEXT_SWITCH
Message-ID: <Z_TM9yXoMrsB0AEz@gmail.com>
References: <cover.1744095216.git.jpoimboe@kernel.org>
 <Z_TMNOHY4iEDMOB8@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_TMNOHY4iEDMOB8@gmail.com>


* Ingo Molnar <mingo@kernel.org> wrote:

> 
> * Josh Poimboeuf <jpoimboe@kernel.org> wrote:
> 
> > I decided to keep the "unsupported instruction in callable function"
> > warning, it's not hurting anything.  As a result we now have
> > INSN_SYSCALL and INSN_SYSRET.
> > 
> > v4:
> > - split up patches
> > - don't get rid of "unsupported instruction in callable function" warning
> > - split INSN_CONTEXT_SWITCH -> INSN_SYSCALL / INSN_SYSRET
> > 
> > v3: https://lore.kernel.org/9b23e4413873bee38961e628b0c73f6d3a26d494.1743799705.git.jpoimboe@kernel.org
> > 
> > Josh Poimboeuf (4):
> >   objtool: Fix INSN_CONTEXT_SWITCH handling in validate_unret()
> >   objtool: Split INSN_CONTEXT_SWITCH into INSN_SYSCALL and INSN_SYSRET
> >   objtool: Stop UNRET validation on UD2
> >   objtool, xen: Fix INSN_SYSCALL / INSN_SYSRET semantics
> > 
> >  arch/x86/xen/xen-asm.S               |  4 +---
> >  tools/objtool/arch/x86/decode.c      | 18 ++++++++++-------
> >  tools/objtool/check.c                | 29 +++++++++++++++++++++-------
> >  tools/objtool/include/objtool/arch.h |  3 ++-
> >  4 files changed, 36 insertions(+), 18 deletions(-)
> 
> I'm wondering about the timing: can this wait for v6.16, or does it 
> trigger on some popular config/build-tools combination?

On a second look, I think these fixes should go upstream now, so I've 
applied them to tip:objtool/urgent.

Thanks,

	Ingo
