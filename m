Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 620DF1519B8
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 08:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743494918; cv=none; b=eYrtFTvLgAY0jeKaYKc51ut36RtLxe8RI9dL+XoXOPQkCyETBJAynFq2jvVZVBUFQOSg30UzljGEKs9Ndh3r44yKj6Oli+7cweqVxrV47MepHImR8G47i0BApuw3izCUHnuxhzRCHK6wXtMtJykQYSN5zJaEhwNXfP9LKdDu2kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743494918; c=relaxed/simple;
	bh=Famu88kt3NucueUdZvLxeygrt4Yg5henD9Ker9RvVpY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pg51hZ3ZtpDynhpVj2JMvK68/X79Hjt0oO+aHzoH8jw7vSJhSrXTgDW+MoYB3h3hEVsptOZArJdWEyTIqhuYvfs6ZHB5HqyswaDwFFevApj2Z//ScBSKicDZigUsv3E4shviVK8G088SelGokZTZFGjQ6LmZV0ycuCv0hvZj1Bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T5efF35J; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T5efF35J"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB9D6C4CEE5;
	Tue,  1 Apr 2025 08:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743494917;
	bh=Famu88kt3NucueUdZvLxeygrt4Yg5henD9Ker9RvVpY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T5efF35J+fKVP1GpCyT9oMTT1bywMdJORRw6niajBHGPF8XQ0UzJmNeC+x0dn/s/Y
	 M9wI+M0TwoE2Nl/QV45X4yfq24hrcv24qAfliDM8keQQplTdry8kk9bE9q/K7dpa/a
	 hL9MyVVnM5mbqD7m+Vncjm2tuK4YPWjUS4bs5rHkUIjWPMJKxixLrrgVXzirwDS2DV
	 //u1hJjySYfZ8vj2oNBaD0BinmCGCzmkuCS21wRITMrMPRxKOIMps+k8Hy+uGE4606
	 VLo6683PfgzbCGuft1hQRl30CQWI9vi6n/dpDl6oXm7I+IX/V4iUrU2/q3Pc1/u/Xf
	 58Ujo5iuWknrQ==
Date: Tue, 1 Apr 2025 10:08:30 +0200
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
Message-ID: <Z-ue_rSKOAHSnfNI@gmail.com>
References: <20250327234629.3953536-1-sohil.mehta@intel.com>
 <20250327234629.3953536-8-sohil.mehta@intel.com>
 <Z-py21rwghagQDEI@gmail.com>
 <4e9bc37b-34a2-4d5d-ab14-904ff2938292@intel.com>
 <bbd417f4-b165-435a-8bb8-f90e42f0eb16@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bbd417f4-b165-435a-8bb8-f90e42f0eb16@intel.com>


* Sohil Mehta <sohil.mehta@intel.com> wrote:

> On 3/31/2025 9:04 AM, Sohil Mehta wrote:
> > On 3/31/2025 3:47 AM, Ingo Molnar wrote:
> >>
> >> * Sohil Mehta <sohil.mehta@intel.com> wrote:
> >>
> >>> diff --git a/arch/x86/include/asm/x86_init.h b/arch/x86/include/asm/x86_init.h
> >>> index 213cf5379a5a..36698cc9fb44 100644
> >>> --- a/arch/x86/include/asm/x86_init.h
> >>> +++ b/arch/x86/include/asm/x86_init.h
> >>> @@ -292,6 +292,7 @@ struct x86_hyper_runtime {
> >>>   * @set_wallclock:		set time back to HW clock
> >>>   * @is_untracked_pat_range	exclude from PAT logic
> >>>   * @nmi_init			enable NMI on cpus
> >>> + * @get_nmi_reason		get the reason an NMI was received
> >>>   * @save_sched_clock_state:	save state for sched_clock() on suspend
> >>>   * @restore_sched_clock_state:	restore state for sched_clock() on resume
> >>>   * @apic_post_init:		adjust apic if needed
> >>
> >> Note that I've split off this second half into a separate commit:
> >>
> >>   x86/nmi: Add missing description x86_hyper_runtime::get_nmi_reason to <asm/x86_init.h>
> >>
> 
> Upon closer inspection, I realized that the commit title for the new
> patch is incorrect.
> s/x86_hyper_runtime/x86_platform_ops

Yeah, the git patch context threw me off: I fixed the title, have 
included the other review feedback, and added the Reviewed-by tags of 
Kai Huang as well.

Thanks!

	Ingo
