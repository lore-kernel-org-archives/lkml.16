Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55EF425FA18
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 07:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744096313; cv=none; b=eUy/B2dJm/StWwzKipibjJrtcIyG8b83MxGSnyqCAwOvkZ6d8dqJubf9vTG8vL5sOY4JG98ZKMWBMvEcwrG2P5C85vCR1U2HTFsCghxe/V+j+ZuY6SSjIpkjGBfpCagYgueLKrLFT7XZvI5Ly5rfuscXA4+PgOXqQ0d64omcxy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744096313; c=relaxed/simple;
	bh=R+AnY8n1hFCUT/IU1nGYweKFNmEKd2QGUczeNaF+u6w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c/iWM4hWDN9TKm8KuQB7wDsefVRSh00XiC+Fu8f+PfdFIVmP7zbjk0sxvS6cg4PeSFp/v76IXQMQnOEk/+QYiAPq+5MSV4RDM0b5JsdUEzxYFvv9Qcuzg5IDSUzhvK0Kr+BvKt2qnDgMpHowA4itc72CaCQHKdywaKBllAJ64rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ww3Begjh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ww3Begjh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62E01C4CEE5;
	Tue,  8 Apr 2025 07:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744096312;
	bh=R+AnY8n1hFCUT/IU1nGYweKFNmEKd2QGUczeNaF+u6w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ww3Begjh8eQX6WC1LpfoRdBWAWlnYJMy+N0cl1jFYSIgJGmpDLN1iVW5k/0cVZjPZ
	 +SlqPTMEsLg24ahncZInps4beRQ3/X6oZ7NDj5rETv3qDwLXJveakdaj2qDlaPdqha
	 jRlqfSbkNsxnN6lUGZt15pvuxatfWGSUFys9Bg1iwi2estjW7m6xsl8JwNSvP5lLda
	 AbZLhtCQyxUNWgYUD2Pi8837qAUpWRT5wCq7yris0xozQHV5mu2eRYiq7DxQ/r17Wc
	 6aj0F8kOC2tmTrr2HzkHk9bvW3zKU70Fe58MwXrLoO3DpGhQjJB3SDsa+BhatfkWmD
	 FVpvaQmiKSpuw==
Date: Tue, 8 Apr 2025 09:11:48 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org,
	Peter Zijlstra <peterz@infradead.org>,
	Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v4 0/4] objtool: Fix INSN_CONTEXT_SWITCH
Message-ID: <Z_TMNOHY4iEDMOB8@gmail.com>
References: <cover.1744095216.git.jpoimboe@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1744095216.git.jpoimboe@kernel.org>


* Josh Poimboeuf <jpoimboe@kernel.org> wrote:

> I decided to keep the "unsupported instruction in callable function"
> warning, it's not hurting anything.  As a result we now have
> INSN_SYSCALL and INSN_SYSRET.
> 
> v4:
> - split up patches
> - don't get rid of "unsupported instruction in callable function" warning
> - split INSN_CONTEXT_SWITCH -> INSN_SYSCALL / INSN_SYSRET
> 
> v3: https://lore.kernel.org/9b23e4413873bee38961e628b0c73f6d3a26d494.1743799705.git.jpoimboe@kernel.org
> 
> Josh Poimboeuf (4):
>   objtool: Fix INSN_CONTEXT_SWITCH handling in validate_unret()
>   objtool: Split INSN_CONTEXT_SWITCH into INSN_SYSCALL and INSN_SYSRET
>   objtool: Stop UNRET validation on UD2
>   objtool, xen: Fix INSN_SYSCALL / INSN_SYSRET semantics
> 
>  arch/x86/xen/xen-asm.S               |  4 +---
>  tools/objtool/arch/x86/decode.c      | 18 ++++++++++-------
>  tools/objtool/check.c                | 29 +++++++++++++++++++++-------
>  tools/objtool/include/objtool/arch.h |  3 ++-
>  4 files changed, 36 insertions(+), 18 deletions(-)

I'm wondering about the timing: can this wait for v6.16, or does it 
trigger on some popular config/build-tools combination?

Thanks,

	Ingo
