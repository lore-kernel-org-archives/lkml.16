Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E474153BD9;
	Tue,  6 May 2025 17:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746552199; cv=none; b=NG1qvoEEnoRV/I617+TpBTS0zxXAYhPd+p5wHHF6C32R2NmcrpbLFXjsMD/Pd7TpfU4fSBICMFcBVUdtRH7cc4Sz+yjxOltQzDLDgIjFsAXD3yK1so++toVk/qWXSIcUfXTa52pks6h5WghMAV1sJiHTtLDDODoEy0ba9U469yY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746552199; c=relaxed/simple;
	bh=NU0flGUO8j7zNQ03xB2NXyllPVztnDkqVTIVt5qC490=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G+QpINsJMnQcFCka9f4Q8kASLNYke9WlIA0BeP3Rt3mhFkZDPhtdvrA4ZL80neRnHSdFB5WS30UKst21JE6f3e2KaHydpGZ2a8TBWz778UmLBwZF+8Y1tsslTSm8PQzkof+BYb+bMb0l1c3z4LPtKNY9f2cvQn6l36Uiu2EPgWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EfZWMRD4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EfZWMRD4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32FBBC4CEE4;
	Tue,  6 May 2025 17:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746552198;
	bh=NU0flGUO8j7zNQ03xB2NXyllPVztnDkqVTIVt5qC490=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EfZWMRD4gsaVNwcJa8EsvTIB6l/tsWlfcX8kXGBEZbxpAtplcDTT6TE7XNoLmG7iC
	 4qENpqwjb17hoOeL8MaMZJ3dZnzdUfSLDM+rxhNfQLfgQ0lu8bx3+EF4itQOZWwiCk
	 Drj+vMlheWQP4HdQBD0qZSWJB0OXPhsr1EvOSkmSkYPiIxpm7oYFT4unULjo4Lk5lT
	 ah9cLjo4QARaT1+iXOLtqy8nIYvWFPAbqwsxOuAHSBmP0ksI/dW7khwITE1Vtq73Ke
	 rQx5eMW07LX1bUabo7Sq6LzV/xBuIwMS/mH9e91828fd39UNho37CvX6ew5o2ipEX4
	 czIcPBGzE3cQg==
Date: Tue, 6 May 2025 19:23:13 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Boqun Feng <boqun.feng@gmail.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [GIT PULL] [PATCH 0/3] LOCKDEP changes for v6.16
Message-ID: <aBpFgSHfpp4-7V_5@gmail.com>
References: <20250506042049.50060-1-boqun.feng@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250506042049.50060-1-boqun.feng@gmail.com>


* Boqun Feng <boqun.feng@gmail.com> wrote:

> Hi Ingo & Peter,
> 
> Please pull the lockdep changes for v6.16 into tip. I'm sending the
> changes in patchset, but I also created a tag and the pull-request
> message in case you want to directly pull. Thanks!
> 
> Regards,
> Boqun
> 
> The following changes since commit 35e6b537af85d97e0aafd8f2829dfa884a22df20:
> 
>   lockdep: Remove disable_irq_lockdep() (2025-03-14 21:13:20 +0100)
> 
> are available in the Git repository at:
> 
>   git@gitolite.kernel.org:pub/scm/linux/kernel/git/boqun/linux tags/lockdep-for-tip.2025.05.05
> 
> for you to fetch changes up to b3eec4e26ada8a71c40147b45026d2345f3b6ae3:
> 
>   locking/lockdep: Add # of dynamic keys stat to /proc/lockdep_stats (2025-05-04 11:03:02 -0700)
> 
> ----------------------------------------------------------------
> Lockdep changes for v6.16:
> 
> - Move hlock_equal() only under CONFIG_LOCKDEP_SMALL=y
> - Prevent abuse of lockdep subclass in __lock_acquire()
> - Add # of dynamic keys stat to /proc/lockdep_stats
> 
> ----------------------------------------------------------------
> Andy Shevchenko (1):
>       lockdep: Move hlock_equal() to the respective ifdeffery
> 
> Waiman Long (2):
>       locking/lockdep: Prevent abuse of lockdep subclass
>       locking/lockdep: Add # of dynamic keys stat to /proc/lockdep_stats
> 
>  kernel/locking/lockdep.c           | 76 ++++++++++++++++++++------------------
>  kernel/locking/lockdep_internals.h |  1 +
>  kernel/locking/lockdep_proc.c      |  2 +
>  3 files changed, 44 insertions(+), 35 deletions(-)

Thanks, applied to the locking tree (tip:locking/core).

	Ingo
