Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48ABD1DB13A
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 10:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743418082; cv=none; b=RDshYI63T2j9XlrTryqhvGND9NeJNJv2RKPTC3YbjirD+vJe2cTm9eCeU9+bWC1b0zZCdS4H3cNsaR9ZHjxCtAgCR1tnpbMTCQ6v0bt9ckzYjUacOAnIuKACPYb2YMVHxKd9SkZowwoSx34doDIk9bApgTmEkBzRgAY67g3/snQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743418082; c=relaxed/simple;
	bh=+6X7Ikh/sAR+BfUMMDXVY4ZjD66rezZfqTv1dArKeXc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U9nCd/S8x9rhdqoVaTRMiNn4C+HEE6nveaUFMNKQD4/tFKAlhU1uXqhH4l2++tR7Vznm08jJ0OJFebm3WpWYu8mq5ZrE4Z/Y8NNPN8QvAutRoDsrt1B/nH0kfWOIob/gIm58aD/2+Oo+E6CR+DzvMi2BMJqkrqKO4zXkyAHgiK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KMWHCppo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KMWHCppo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A761DC4CEE3;
	Mon, 31 Mar 2025 10:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743418081;
	bh=+6X7Ikh/sAR+BfUMMDXVY4ZjD66rezZfqTv1dArKeXc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KMWHCppojfzAIkegeWTaRkMJtCNwSDsxzyKzM7fEy/+hTQBEqpypo3MbL8DDpP2du
	 +qntvPKxpHARMeHQwrGUZFQ5uHqt8B7MflPgH6YqA6GzLwvbvpwb/FntCk13H+dnyf
	 iKkKLlPRlHcIYe3bpS5QwsO1aSX9lSCBkgcRUOkZp+gjNdZBIq7F1F/b2M4mzD/sJA
	 Ko0QK54hbv3AHNBjM5d0Xw0dNQXGoL+RtxeK7pvQzrUs7vvewkQkivuS0NdOSkCK/P
	 /Z0w6sNJ8/VrxYRWYra51qsctSh7o3uoLiPwiUDxSpxI2Vq9OMxJUPTf+V9BE5mVtK
	 c4IsIdfmahHFw==
Date: Mon, 31 Mar 2025 12:47:55 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Sohil Mehta <sohil.mehta@intel.com>
Cc: x86@kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
	Kai Huang <kai.huang@intel.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Mike Rapoport <rppt@kernel.org>, Petr Mladek <pmladek@suse.com>,
	Jani Nikula <jani.nikula@intel.com>,
	Tony Luck <tony.luck@intel.com>, Xin Li <xin@zytor.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 7/9] x86/nmi: Improve NMI header documentation
Message-ID: <Z-py21rwghagQDEI@gmail.com>
References: <20250327234629.3953536-1-sohil.mehta@intel.com>
 <20250327234629.3953536-8-sohil.mehta@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250327234629.3953536-8-sohil.mehta@intel.com>


* Sohil Mehta <sohil.mehta@intel.com> wrote:

> diff --git a/arch/x86/include/asm/x86_init.h b/arch/x86/include/asm/x86_init.h
> index 213cf5379a5a..36698cc9fb44 100644
> --- a/arch/x86/include/asm/x86_init.h
> +++ b/arch/x86/include/asm/x86_init.h
> @@ -292,6 +292,7 @@ struct x86_hyper_runtime {
>   * @set_wallclock:		set time back to HW clock
>   * @is_untracked_pat_range	exclude from PAT logic
>   * @nmi_init			enable NMI on cpus
> + * @get_nmi_reason		get the reason an NMI was received
>   * @save_sched_clock_state:	save state for sched_clock() on suspend
>   * @restore_sched_clock_state:	restore state for sched_clock() on resume
>   * @apic_post_init:		adjust apic if needed

Note that I've split off this second half into a separate commit:

  x86/nmi: Add missing description x86_hyper_runtime::get_nmi_reason to <asm/x86_init.h>

as it's basically an independent KernelDoc bugfix AFAICS.

Thanks,

	Ingo
