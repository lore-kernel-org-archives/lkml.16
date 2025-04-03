Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62DCF2505A4
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 15:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743692721; cv=none; b=aB0qwDZ2DZirmE+7UXHjA63psFa+njR+LhTuJiuh8BBfrkd9H+chqeSMxWWn7Rk6yipGi7RX8mYphq5LViuSHCFTfHNF5BzaS60/U2BOJqY9GKUxAD7C5gXBaKpJBtyv72Qn1VjBfFtF5NDCas3bfPklCe+kxCgrqokru5Yc5Nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743692721; c=relaxed/simple;
	bh=OuJfAjQbrxmPm5MwHxPDQ4Gf5OR+D6lie7AS7lva66k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hQBhKRIky2ywqpShgMqoFrD/K0dP/Uk8m7zFEhtmED1S+yLDvHGcRsiXPhw9iTo4jnlYrXMCFvk3Nn+99XWcG2ADnHRb86Hm/SW1OnWD973dXorQph+DB5t5OH6yy6XwVpd3s3VhNEe2sZmBn+Qst9s2EQ9qWgJ7XxbsL8IJFiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PeEFk0Dy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PeEFk0Dy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1251EC4CEE5;
	Thu,  3 Apr 2025 15:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743692717;
	bh=OuJfAjQbrxmPm5MwHxPDQ4Gf5OR+D6lie7AS7lva66k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PeEFk0DyWB9YXvclgNkkFo9tbHIw4DiAxNNhG6EkWSrFZUv0gDFsEhM3Zu3tJnRsU
	 seysqDLztf6nT6P1wAP/nTQT/j3p04PDiccRLAkXZ1sJt+VLZfTs/4RLUV3clAz/tK
	 798Rd8CZnEMIVt1zSKs83o8EV+r+cI8xo7NLZX4km7zxjOhBT4fEKFdqX6Y+211cVE
	 AQKo5jJyaPOo71RYWF5mig+mTj3AgNXCSRUyrFH98DNMxpfxV7/CvDlxuX9MWYrI4d
	 /+rcH61wT4ii38TTA7LjYnMfV8UJ2+nUnQ2q7RBbkq91lGPq79Uua1Ta8i/GaKyOhh
	 ULLAlu/+0xAfA==
Date: Thu, 3 Apr 2025 17:05:13 +0200
From: Ingo Molnar <mingo@kernel.org>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-kernel@vger.kernel.org, Juergen Gross <jgross@suse.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH 40/41] x86/alternatives: Rename 'text_poke_sync()' to
 'text_poke_sync_each_cpu()'
Message-ID: <Z-6jqf6QqRkAnTz8@gmail.com>
References: <20250327205355.378659-1-mingo@kernel.org>
 <20250327205355.378659-41-mingo@kernel.org>
 <DA9DB9BF-2179-4C53-86A8-6205346AA76F@zytor.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DA9DB9BF-2179-4C53-86A8-6205346AA76F@zytor.com>


* H. Peter Anvin <hpa@zytor.com> wrote:

> Is that the only use case we have for syncing all CPUs?

So there's:

- kernel/sched/membarrier.c's ipi_sync_core() which does sync_core(), 
  but it's embedded into a larger array of IPI handlers, called via 
  smp_call_function_many()/on_each_cpu_mask(), so I don't think 
  functionality can be shared there.

- there's arch/x86/kernel/cpu/mce/core.c's machine_check_poll() handler 
  and the kill_me_maybe() function, but these are single thread.

- then there's arch/x86/kernel/static_call.c's 
  __static_call_update_early(), used indirectly by 
  arch/x86/xen/enlighten.c and arch/x86/xen/enlighten_pv.c, but these 
  are single-threaded too due to being early boot code.

So not much I think - at least what I've managed to find.

Thanks,

	Ingo
