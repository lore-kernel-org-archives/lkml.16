Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A6CB20E021
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 06:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748500979; cv=none; b=pUB7xhx1cgIEWb8zbRMIM8oLmIkMIfKdLtZxlZrV7XVbMEzDEDMxxbFGMiQYfG/POuKiwdUFEH5jKyX2VKzO4yn6YMMNnDModVtpB9JwX4UyrYGlNGTRomBXJu+gqv+FvrzbjwsDMkUOtV4TKUe+zeSEHrFOg04w4a3m0+qC3kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748500979; c=relaxed/simple;
	bh=s3EXiF0n8dWQEyH1TPquDsiRrG2XjMivVyYc3nUbiZc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K6ZqVge4XDwzaYZs1WfUizEVvg9b+5IOHdPTe0LsA9vAbb1EtECmH7ZE3qyY0rhQC3QSYviUA0fTTJJ7l+AresJSamTkTkdPr7h56sXydBAZgocr4pR3VVYtc5wzymRaGaiBGxvyjceC89Mxsyfm/7NxI/i/ITvh2fIFGLI0GfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nDwg5gzn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nDwg5gzn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 248B0C4CEE7;
	Thu, 29 May 2025 06:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748500978;
	bh=s3EXiF0n8dWQEyH1TPquDsiRrG2XjMivVyYc3nUbiZc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nDwg5gznwuyvloDeSjQGdzxnZB87XyaZ+6T1ixcxCSoLG1IavgBCRhJXIdXN/DJ65
	 LxH7Q7hhF+ri4Qig3F6Ixu3cb57Yc0tpKtugj3ZF68IjmCjs5P143nBnNzkiyVKdpD
	 YuwMJRoMCnvdi/gUt9bQBl0hWrWNIAPFORmm+cmDQn2WpnSM4+BVMCJA9jPDHEW0wN
	 OqhU2P5MVEAgpUgl/CaU/n6/ND7lNGLZdTjTb+9+7VutxnQVEX8MLUOH5DoAHiGIwz
	 BMR5Ky3K/qqQ1nf6m2IWP5QQmeKdbU6vFWWO3/dIgnbx9dixXdWb4Q37BWVQmN4oSf
	 X75PQ/YWo4UHQ==
Date: Thu, 29 May 2025 08:42:53 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: linux-kernel@vger.kernel.org,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Steven Rostedt <rostedt@goodmis.org>, Mel Gorman <mgorman@suse.de>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: Re: [PATCH 00/43] sched: Use the SMP scheduler on UP too
Message-ID: <aDgB7VoNbHoJqDDT@gmail.com>
References: <20250528080924.2273858-1-mingo@kernel.org>
 <20250528085813.GX39944@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250528085813.GX39944@noisy.programming.kicks-ass.net>


* Peter Zijlstra <peterz@infradead.org> wrote:

> You know about unifdef, right :-)
> 
> $ unifdef -m -DCONFIG_SMP=y kernel/sched/*.[ch] include/linux/sched.h include/linux/sched/*.h

Except we cannot really do that:

  starship:~/mingo.tip.git> git grep CONFIG_SMP kernel/sched/ | wc -l 
  36

There's a number of external facilities not present on UP we don't want 
to remove, plus where possible we want to do the conversion with 
smaller steps, as long as the interim scheduler still works.

> I'd just run that tool, have changelog include the command and patch 
> be the effect.

This tool might be a good double check for files where all CONFIG_SMP 
instances were removed though, although with the markers consistently 
in place it's pretty obvious at sight for even a human that matching
#ifdef blocks got removed.

The mechanical removal was maybe 5% of the work. The other 95% was to 
identify what to remove/convert, and the tool doesn't help much with 
that. ;-)

A tool to check/generate #ifdef block markers would be nice though, 
with a threshold for when to mark it at over ~3 lines or so when a CPP 
directive gets out of sight for standard patch context. Even after the 
CONFIG_SMP series there's still another ~500 CPP blocks in the 
scheduler:

  starship:~/mingo.tip.git> git grep -E '^#if|^#else' kernel/sched/ | wc -l
  561

:-)

Thanks,

	Ingo
