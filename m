Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1E4E1519BC
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 03:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750737242; cv=none; b=lcSVPKfWiJKwrPrZUjHJSQ9fDRSp+xOih6vNBHdUj4KzY5GFgV/Log8aa3i4SxLT3u1ui12k/AV35rxhHjs8LxUwefMbfZOtKAZx/ajcXlm3Z3BPsY52CzmHyc3al3+Ofp+0pq6d01uxmCBoJIyoNzFmNq5wN9j7x2suJBh57Qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750737242; c=relaxed/simple;
	bh=+zp+01SDfzTsXgLcc1IKh9CwhBfVEY8cbtVnvppw0BE=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=sX697TbPWTAEipmq9+yksarp/lb+dMAjO2Bp9Jwfg0i0FOroHIN44s4ij5HYEETbwm3MpTRfnZdqC8hyyGf1cINBXRAf/8sRql6NqFPrNaYiSAJV8vjBGELD6b/a7jT4W4hCrJcemAY60emO8fGOhGjXAwaK9txYAZyzP4K/P0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o4hSFtje; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o4hSFtje"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6CE2C4AF0B;
	Tue, 24 Jun 2025 03:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750737242;
	bh=+zp+01SDfzTsXgLcc1IKh9CwhBfVEY8cbtVnvppw0BE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=o4hSFtjebE32TZ7PHXVGW5MVeDn3VgfRnHTbQm2o+uKh6MMZQTTqSouiFiTbUEjx6
	 rxxlDFVHCCywbBYHY8I0YweNyDwPhsZ4kWfcDc9ObONW2k4+nb5Kgb+g7o2aOCZvYk
	 4xrCrhMhvMbQHcsfyHU1igvYGs0z++kCbmuFetRKMNnlOUCDYMEh00R6UGvyzJBD5v
	 ttl5U+ZaCxUOA5IAXtstlVj3wxAtj8HafK2EGAg7cSgSPUMzRQpFFxLbU/T0CF/PgW
	 cTCgfFVyjcL0M+bDx88qmw1LfSnmDYFXkB2ugmBtnTAilV6rxN4sjyuuJUzaevYRmO
	 FyaSXtwjPqEmA==
Date: Tue, 24 Jun 2025 12:53:58 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: Lance Yang <lance.yang@linux.dev>
Cc: akpm@linux-foundation.org, zi.li@linux.dev, anna.schumaker@oracle.com,
 boqun.feng@gmail.com, joel.granados@kernel.org, jstultz@google.com,
 kent.overstreet@linux.dev, leonylgao@tencent.com,
 linux-kernel@vger.kernel.org, longman@redhat.com, mingo@redhat.com,
 mingzhe.yang@ly.com, peterz@infradead.org, rostedt@goodmis.org,
 senozhatsky@chromium.org, tfiga@chromium.org, will@kernel.org, Lance Yang
 <ioworker0@gmail.com>
Subject: Re: [PATCH RFC 2/3] locking/rwsem: clear reader-owner on unlock to
 reduce false positives
Message-Id: <20250624125358.25a7d4cd5ea02ea0bbe373a6@kernel.org>
In-Reply-To: <21ef5892-afdf-491e-937f-7821cac63d16@linux.dev>
References: <20250612042005.99602-1-lance.yang@linux.dev>
	<20250612042005.99602-3-lance.yang@linux.dev>
	<20250624092620.3346ac39e882434aafb0b93d@kernel.org>
	<21ef5892-afdf-491e-937f-7821cac63d16@linux.dev>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Tue, 24 Jun 2025 09:44:55 +0800
Lance Yang <lance.yang@linux.dev> wrote:

> 
> 
> On 2025/6/24 08:26, Masami Hiramatsu (Google) wrote:
> > On Thu, 12 Jun 2025 12:19:25 +0800
> > Lance Yang <ioworker0@gmail.com> wrote:
> > 
> >> From: Lance Yang <lance.yang@linux.dev>
> >>
> >> When CONFIG_DETECT_HUNG_TASK_BLOCKER is enabled, a stale owner pointer in a
> >> reader-owned rwsem can lead to false positives in blocker tracking.
> >>
> >> To mitigate this, let’s try to clear the owner field on unlock, as a NULL
> >> owner is better than a stale one for diagnostics.
> > 
> > Can we merge this to [PATCH 1/3]? It seems that you removed #ifdef and
> > remove it. This means in anyway we need the feature enabled by DEBUG_RWSEMS.
> 
> Thanks for the feedback! I see your point about the dependency ;)
> 
> Personlly, I'd perfer to keep them separate. The reasoning is that
> they addreess two distinct things, and I think splitting them makes
> this series clearer and easier to review ;)
> 
> Patch #1 focuses on "ownership tracking": Its only job is to make
> the existing owner-related helpers (rwsem_owner(), is_rwsem_reader_owned())
> globally available when blocker tracking is enabled.
> 
> Patch #2, on the other hand, is about "reader-owner cleanup": It
> introduces a functional change to the unlock path, trying to clear
> the owner field for reader-owned rwsems.

But without clearing the owner, the owner information can be
broken, right? Since CONFIG_DEBUG_RWSEMS is working as it is,
I think those cannot be decoupled. For example, comparing the
result of both DETECT_HUNG_TASK_BLOCKER and DEBUG_RWSEMS are
enabled and only DETECT_HUNG_TASK_BLOCKER is enabled, the
result is different.

> 
> Does this reasoning make sense to you?

Sorry, no. I think "reader-owner cleanup" is a part of "ownership
tracking" as DEBUG_RWSEMS does (and that keeps consistency of
the ownership tracking behavior same as DEBUG_RWSEM).

Thank you,

> 
> Thanks,
> Lance
> 
> > 
> > Thanks,
> > 
> >>
> >> Signed-off-by: Lance Yang <lance.yang@linux.dev>
> >> ---
> >>   kernel/locking/rwsem.c | 10 ++++------
> >>   1 file changed, 4 insertions(+), 6 deletions(-)
> >>
> >> diff --git a/kernel/locking/rwsem.c b/kernel/locking/rwsem.c
> >> index 6cb29442d4fc..a310eb9896de 100644
> >> --- a/kernel/locking/rwsem.c
> >> +++ b/kernel/locking/rwsem.c
> >> @@ -205,14 +205,12 @@ bool is_rwsem_reader_owned(struct rw_semaphore *sem)
> >>   		return false;
> >>   	return rwsem_test_oflags(sem, RWSEM_READER_OWNED);
> >>   }
> >> -#endif
> >>   
> >> -#ifdef CONFIG_DEBUG_RWSEMS
> >>   /*
> >> - * With CONFIG_DEBUG_RWSEMS configured, it will make sure that if there
> >> - * is a task pointer in owner of a reader-owned rwsem, it will be the
> >> - * real owner or one of the real owners. The only exception is when the
> >> - * unlock is done by up_read_non_owner().
> >> + * With CONFIG_DEBUG_RWSEMS or CONFIG_DETECT_HUNG_TASK_BLOCKER configured,
> >> + * it will make sure that the owner field of a reader-owned rwsem either
> >> + * points to a real reader-owner(s) or gets cleared. The only exception is
> >> + * when the unlock is done by up_read_non_owner().
> >>    */
> >>   static inline void rwsem_clear_reader_owned(struct rw_semaphore *sem)
> >>   {
> >> -- 
> >> 2.49.0
> >>
> > 
> > 
> 


-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>
