Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36A2822258C
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 06:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750745631; cv=none; b=pIMA6Zij7e1W6GyWJio4KkbbDPv1yzYxelK4R46UOdhBpOx2ApfkeJNZVi+d1tdhXDHmeE5iNAIGGz9kGJoT+gR0otPrcQEatB8dX3+G7dm7rGfjrT8lOIkeB8l8FvFfrMTuzF3UUlPlbKHqYpG1HAZa+iKa2ibeBN2GhcQoTfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750745631; c=relaxed/simple;
	bh=bE7t2Fp5Ygrvm7IHgrKXVkfFIse3NHmm5oSUcPfZUQM=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=u0sPhyNcHfNT2MdaDKkVp4agPJWBEKJji4E7MSCxMF0j8IfDa9XJ2XXcsxvbYJ75kWUlUNxojq4FWAQITAIpG/6S6Z8XqqwEvUzd/bSNfZ2K2AjWdFBiU2jH0zH8mTK4q58WWsdBWDY+ywPBybSNDJ6WJlwCnStMnSj2vGx23yQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DlZij9DK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DlZij9DK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62025C4CEE3;
	Tue, 24 Jun 2025 06:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750745630;
	bh=bE7t2Fp5Ygrvm7IHgrKXVkfFIse3NHmm5oSUcPfZUQM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=DlZij9DKLJ+EjgWjKRjXSJCj6k1wXN5EBotcybqDR2ljRNREuZVT1ixTudDFk0rbg
	 mOcEJxjbX2V23/QKJkGIDLYQQGsMZl2BEfKKwu5ZfI3ddGDlJ6RFfwuTYLmU52Cm2k
	 ayzATlV1pcr6HJlk7GKqcKDHYi96DRd1PhggaGA0o1A1JINBEanXa6VTrO6k+drTPl
	 zxMRm45xupwzIBUlEmsHPfe7IaaNBZ9aivse2IfVpGiUkm8vBk78a6e6b+ZyMhT3dE
	 TcJERCU5dFoBiGLVpJ+QdAA0k9JUsAlmqioNzyDXt3v7J6FpS7wgS24Oa7qi/RWEp3
	 1QOigi+6IFOeA==
Date: Tue, 24 Jun 2025 15:13:46 +0900
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
Message-Id: <20250624151346.819475ac122175afa8535aa0@kernel.org>
In-Reply-To: <a8e1f5b5-90a2-4738-821b-afce9ca59df8@linux.dev>
References: <20250612042005.99602-1-lance.yang@linux.dev>
	<20250612042005.99602-3-lance.yang@linux.dev>
	<20250624092620.3346ac39e882434aafb0b93d@kernel.org>
	<21ef5892-afdf-491e-937f-7821cac63d16@linux.dev>
	<20250624125358.25a7d4cd5ea02ea0bbe373a6@kernel.org>
	<a8e1f5b5-90a2-4738-821b-afce9ca59df8@linux.dev>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Tue, 24 Jun 2025 13:02:31 +0800
Lance Yang <lance.yang@linux.dev> wrote:

> 
> 
> On 2025/6/24 11:53, Masami Hiramatsu (Google) wrote:
> > On Tue, 24 Jun 2025 09:44:55 +0800
> > Lance Yang <lance.yang@linux.dev> wrote:
> > 
> >>
> >>
> >> On 2025/6/24 08:26, Masami Hiramatsu (Google) wrote:
> >>> On Thu, 12 Jun 2025 12:19:25 +0800
> >>> Lance Yang <ioworker0@gmail.com> wrote:
> >>>
> >>>> From: Lance Yang <lance.yang@linux.dev>
> >>>>
> >>>> When CONFIG_DETECT_HUNG_TASK_BLOCKER is enabled, a stale owner pointer in a
> >>>> reader-owned rwsem can lead to false positives in blocker tracking.
> >>>>
> >>>> To mitigate this, let’s try to clear the owner field on unlock, as a NULL
> >>>> owner is better than a stale one for diagnostics.
> >>>
> >>> Can we merge this to [PATCH 1/3]? It seems that you removed #ifdef and
> >>> remove it. This means in anyway we need the feature enabled by DEBUG_RWSEMS.
> >>
> >> Thanks for the feedback! I see your point about the dependency ;)
> >>
> >> Personlly, I'd perfer to keep them separate. The reasoning is that
> >> they addreess two distinct things, and I think splitting them makes
> >> this series clearer and easier to review ;)
> >>
> >> Patch #1 focuses on "ownership tracking": Its only job is to make
> >> the existing owner-related helpers (rwsem_owner(), is_rwsem_reader_owned())
> >> globally available when blocker tracking is enabled.
> >>
> >> Patch #2, on the other hand, is about "reader-owner cleanup": It
> >> introduces a functional change to the unlock path, trying to clear
> >> the owner field for reader-owned rwsems.
> > 
> > But without clearing the owner, the owner information can be
> > broken, right? Since CONFIG_DEBUG_RWSEMS is working as it is,
> 
> You're right, the owner info would be broken without the cleanup logic
> in patch #2. But ...
> 
> > I think those cannot be decoupled. For example, comparing the
> > result of both DETECT_HUNG_TASK_BLOCKER and DEBUG_RWSEMS are
> > enabled and only DETECT_HUNG_TASK_BLOCKER is enabled, the
> > result is different.
> 
> The actual blocker tracking for rwsems is only turned on in patch #3.
> So, there's no case where the feature is active without the cleanup
> logic already being in place.
> 
> > 
> >>
> >> Does this reasoning make sense to you?
> > 
> > Sorry, no. I think "reader-owner cleanup" is a part of "ownership
> > tracking" as DEBUG_RWSEMS does (and that keeps consistency of
> > the ownership tracking behavior same as DEBUG_RWSEM).
> 
> I thought this step-by-step approach was a bit cleaner, since there are
> currently only two users for these owner helpers (DEBUG_RWSEMS and
> DETECT_HUNG_TASK_BLOCKER).

I think the step-by-step approach fits better if the feature is evolving
(a working feature is already there.) I don't like the intermediate
state which does not work correctly, because if we have a unit test(
like kUnit) it should fail. If you can say "this finds the rwsem
owner as same as what the CONFIG_DEBUG_RWSEM is doing", it is simpler
to explain what you are doing, and easy to understand.

> 
> Anyway, if you still feel strongly that they should be merged, I'm happy
> to rework the series as you suggested ;p

Thanks,

> 
> Thanks,
> Lance
> 
> > 
> > Thank you,
> > 
> >>
> >> Thanks,
> >> Lance
> >>
> >>>
> >>> Thanks,
> >>>
> >>>>
> >>>> Signed-off-by: Lance Yang <lance.yang@linux.dev>
> >>>> ---
> >>>>    kernel/locking/rwsem.c | 10 ++++------
> >>>>    1 file changed, 4 insertions(+), 6 deletions(-)
> >>>>
> >>>> diff --git a/kernel/locking/rwsem.c b/kernel/locking/rwsem.c
> >>>> index 6cb29442d4fc..a310eb9896de 100644
> >>>> --- a/kernel/locking/rwsem.c
> >>>> +++ b/kernel/locking/rwsem.c
> >>>> @@ -205,14 +205,12 @@ bool is_rwsem_reader_owned(struct rw_semaphore *sem)
> >>>>    		return false;
> >>>>    	return rwsem_test_oflags(sem, RWSEM_READER_OWNED);
> >>>>    }
> >>>> -#endif
> >>>>    
> >>>> -#ifdef CONFIG_DEBUG_RWSEMS
> >>>>    /*
> >>>> - * With CONFIG_DEBUG_RWSEMS configured, it will make sure that if there
> >>>> - * is a task pointer in owner of a reader-owned rwsem, it will be the
> >>>> - * real owner or one of the real owners. The only exception is when the
> >>>> - * unlock is done by up_read_non_owner().
> >>>> + * With CONFIG_DEBUG_RWSEMS or CONFIG_DETECT_HUNG_TASK_BLOCKER configured,
> >>>> + * it will make sure that the owner field of a reader-owned rwsem either
> >>>> + * points to a real reader-owner(s) or gets cleared. The only exception is
> >>>> + * when the unlock is done by up_read_non_owner().
> >>>>     */
> >>>>    static inline void rwsem_clear_reader_owned(struct rw_semaphore *sem)
> >>>>    {
> >>>> -- 
> >>>> 2.49.0
> >>>>
> >>>
> >>>
> >>
> > 
> > 
> 
> 


-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>
