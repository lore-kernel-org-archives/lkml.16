Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28F7C1F94C
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 08:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744790842; cv=none; b=fQON/Ter0o68GmnUGQcRs5AtjIN5OhuFGUuyEHEkxgNs8aP7iD46ruaB2L3PXL+6ytLPzR6kpm5SlukrO8aNEopPYEcByuDwj0SNCGFYf8bw8KtV8rnH9HiZTrfvyiGKe36jOi9iqDn4GVb3HDwaK335PKGJVCJUW6nlWULwIsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744790842; c=relaxed/simple;
	bh=CMBzEDZprgGkLI2ECJBCn9yABiQXpRjf2Rf+wPZznkU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LeRdgQTZaFoUMiN0RmR9ZIYtnFVhZmf0ltx5SI0kIw/rbD0IPTGOB6wBXKqF79ho8OeWhny6JguT0i/jXzmRWFW7tef4DrhBaJ2nedbtjyZqLa9/4Jzn7+aJCEh90h/wZmtXP7yNa9kGZ+bVXkumCGieYFJl9tz7YvQKZ2H7TL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Aex4n+Bi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Aex4n+Bi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C323BC4CEE2;
	Wed, 16 Apr 2025 08:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744790841;
	bh=CMBzEDZprgGkLI2ECJBCn9yABiQXpRjf2Rf+wPZznkU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Aex4n+Bimei/5U9f0trsuRSoW8b7lgjciSlpEdPN2DgsLn8q/Q9ErV3gzhvP9Kpd8
	 HaMV2eXYim7mdcOpdfig/fl9Z631GjCFfgMN2HPbxu4Bz6CON5BGcqqEmQiqDXFVKX
	 HtmLI5/ofHl9I6ciot380LbZmtDv23+tMsdKCIAZfTG+djB4VBSoQFIhXVf47MtbHD
	 5bZphReguirS+vtlpssrudbNHS5aoTHqnGvVrFnw6pnL/gx9gkdlMrT3y+XYg6J5p2
	 E6gZNEzLld4+g03Mb8A1K8HP0HLIpRQZDN3peFBz/+HffpiVV36sxqFqfpIZCgwuw8
	 fN/W/zaSM0nbQ==
Date: Wed, 16 Apr 2025 10:07:17 +0200
From: Ingo Molnar <mingo@kernel.org>
To: "Chang S. Bae" <chang.seok.bae@intel.com>
Cc: mingo@redhat.com, linux-kernel@vger.kernel.org, x86@kernel.org,
	tglx@linutronix.de, bp@alien8.de, dave.hansen@linux.intel.com
Subject: Re: [PATCH 00/10] x86/fpu: APX enablement and assorted FPU code
 improvements
Message-ID: <Z_9lNentUMOy5vZW@gmail.com>
References: <Z_onl1QbH9L1-8dq@gmail.com>
 <20250416021720.12305-1-chang.seok.bae@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250416021720.12305-1-chang.seok.bae@intel.com>


* Chang S. Bae <chang.seok.bae@intel.com> wrote:

> On 4/12/2025 1:43 AM, Ingo Molnar wrote:
> >
> > Chang, mind sending a series of the latest version of all the pending
> > APX patches you have at the moment (and any other pending FPU patches
> > you may have), with Reviewed-by tags rolled in, etc.
> 
> Hi Ingo,
> 
> Here’s the updated patch set following up on the previous APX series [1],
> along with a collection of additional FPU-related cleanups and
> improvements that were previously posted or discussed.
> 
> The series is organized into two parts:
> 
>   1. APX Enabling (PATCH 1–5)
> 
>      These patches complete the APX bring-up. After laying the groundwork,
>      this portion finalizes the enablement:
> 
>      *  Patches 1, 2, and 4 are typical xfeature plumbing.
> 
>      *  Patch 3 handles MPX conflict -- unexpected hardware issue
> 
>      *  Patch 5 adds a test case.
> 
>   2. Miscellaneous FPU Code Improvements (PATCH 6–10)
> 
>      This batch includes various standalone improvements:
> 
>      *  Patch 6: Centralizes the XSAVE disablement message
> 
>      *  Patches 7-8: Simplifies PKRU update in XSTATE_BV on sigframe
> 
>      *  Patch 9: Removes the unused mxcsr_feature_mask export
> 
>      *  Patch 10: Renames fpu_reset_fpregs() for clarity
> 
>      Each patch includes context and links to earlier discussions or
>      revisions.

>  14 files changed, 69 insertions(+), 26 deletions(-)

Applied to tip:x86/fpu, thanks!

Note that I've merged the currently pending tip:x86/cpu bits into 
tip:x86/fpu before applying these patches, to resolve a conflict with 
<asm/cpufeatures.h>, and re-formatted the new X86_FEATURE_APX line to 
have the canonical format.


	Ingo
