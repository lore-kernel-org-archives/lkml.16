Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4DC71487F6
	for <linux-kernel@vger.kernel.org>; Sun,  6 Apr 2025 17:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743960100; cv=none; b=MLnsoAIEW+MGpcVEG2wowkIDnCNf8ifMbMhg1Cg66FPoj1IQKM9sAtGXfRN5q7DTqvKxATODe4m+yDXyw6/6N1whspn9g5C1XpIHWyUaaHTJJWF0Gs2xZghVFj0EsxFWcqV/BObzqnd6B0ADLxtl6r27qOHCttNCzYk7cY29U3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743960100; c=relaxed/simple;
	bh=TLDCz0ijceRvrDZBjTDRhs68DEmOTUvRPjZfCHwJkCA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NppqbnY/fyffM5cX8MuO7OcUcqN6k7mgd1C8VL5/QT6BhvXgiUNlR9Edt9gYxtD5bsOWTPoHQ7ew7sOPxnu6SC8wp4riJCxvd+rpSZl9ssy/TsYMN7voOFOHt5vzusXeh6FX2J7sF0qlcbtB0CHjqsxu+W0ep8XXjg5VToh7j+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t7VGGs2l; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t7VGGs2l"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F753C4CEE3;
	Sun,  6 Apr 2025 17:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743960100;
	bh=TLDCz0ijceRvrDZBjTDRhs68DEmOTUvRPjZfCHwJkCA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t7VGGs2lsugmRJa1bU+IT59OkXpCFEw/PjL0KmVWbedYwWHPw6UwMuPY2Y59KW7tx
	 W4qd9OyxB+hXvfTVbTE7rQThNkJqEH5YvNTdUwCYMxXUM0pcnoBG3FsLNT3rLv41mx
	 sE+/6aBipGHZJh+CoxruDBy69jReoe5Vr9k0uuq7fFKKRpbmPKqZemiv0qFvx2EcVt
	 6Ud6P93lDkzCn08/sMxNiwyAfGkyYg792avQba340dGV78WSNeTKrWyX/MJmAcQaj6
	 aI86YDZRLrfyytdm7qVKiMsVa/NDXjuINXOcyqolOV/mcywcIQmNTHHZyCFO6v9UyX
	 XYxC/ztLmAzFA==
Date: Sun, 6 Apr 2025 19:21:35 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Uros Bizjak <ubizjak@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	LKML <linux-kernel@vger.kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH v2] x86/idle: Remove MFENCEs for X86_BUG_CLFLUSH_MONITOR
Message-ID: <Z_K4HzutEoEQFSco@gmail.com>
References: <20250402172458.1378112-1-andrew.cooper3@citrix.com>
 <1640cf43-8125-a562-91f9-9b306b863dc7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1640cf43-8125-a562-91f9-9b306b863dc7@gmail.com>


* Uros Bizjak <ubizjak@gmail.com> wrote:

> There is another instance of the same sequence in arch/x86/kernel/smpboot.c:
> 
> 		/*
> 		 * The CLFLUSH is a workaround for erratum AAI65 for
> 		 * the Xeon 7400 series.  It's not clear it is actually
> 		 * needed, but it should be harmless in either case.
> 		 * The WBINVD is insufficient due to the spurious-wakeup
> 		 * case where we return around the loop.
> 		 */
> 		mb();
> 		clflush(md);
> 		mb();
> 		__monitor(md, 0, 0);
> 		mb();
> 		__mwait(eax_hint, 0);

True, but I wouldn't touch that - the shutdown path is not a 
performance critical code path in any fashion, and it's often
difficult to debug on real hardware, so the cost/benefit factor
is abnormally high.

Thanks,

	Ingo
