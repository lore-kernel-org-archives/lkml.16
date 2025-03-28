Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DE1C1B5EA4
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 10:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743156628; cv=none; b=hDJ+D+lXCKLXzjBeuWeyAEeUp6PzsrmLTitbqcL/75H6c/myGemkAnud7TDGbys2Slu/1uD9nVu8p0ATrfJs8QXxvM+mH4cJ/vlZpRFz4KPVAky21flko4akTdyx4ihL7SNIbA7SFs4izvR8WONxPuzrI0GzdAD8iXvXikoQY0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743156628; c=relaxed/simple;
	bh=VX1ORSYEQzB8eQI1BUXPP1uUGxslf6RudiDhSEnuQEc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MTzs3HhGsn2B3kPGUDYIZ95F4QoFiB94zpaUZeCAGyly2khPTSPkYEv3gBcBpB924IFRnwCtheGhBZ/pV+/Nyz3Rmf2rNfgigAef3XKFPNOyFILnnCB7YGPU5tnCRVSIxXZcH11dsTzVtGEpabJFarXFVWj+tyKab3an5Uv6sww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mnh5VyNu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mnh5VyNu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4121EC4CEE8;
	Fri, 28 Mar 2025 10:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743156627;
	bh=VX1ORSYEQzB8eQI1BUXPP1uUGxslf6RudiDhSEnuQEc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mnh5VyNu3l0+CD9KPIy+fW8QhS5doxCXizFjWvJjhVcJYBXWF+BXyJZv3H9C0W/JH
	 0nIr9OsP5BrFpFCFK/TE913AWH+yPQAUHrDMrOXY9ZJTUQq1lxOyAo9ZiXl/tKvZPk
	 ypqUYEgSqSbN4SKHK310fyBAmjjXChLKciXpcSh8VLMwUGdZI070Hbk70vXlxCDcAF
	 A2l96HpgBK+QVp0uNasGUB5u49Y1KlDlQvEPMQD9vxe+DACGd7tNldWgGTi6oE47Mf
	 SbB3p+Y7EWp0+WxRLv225h/8wA9QkdwXvVKMaKDh9uJbW2ZeC7arxPV7YT6hyFGgoV
	 4wb28ZCaC+JLQ==
Date: Fri, 28 Mar 2025 11:10:23 +0100
From: Ingo Molnar <mingo@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH 00/41] Simplify, reorganize and clean up the x86 INT3
 based batch-patching code (alternative.c)
Message-ID: <Z-Z1jxIbcSOQuGtF@gmail.com>
References: <20250327205355.378659-1-mingo@kernel.org>
 <CAHk-=wjwuO8UVLP5N7972TmfVc+sYEekcnZMF4rQLr662j7oXQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wjwuO8UVLP5N7972TmfVc+sYEekcnZMF4rQLr662j7oXQ@mail.gmail.com>


* Linus Torvalds <torvalds@linux-foundation.org> wrote:

> On Thu, 27 Mar 2025 at 13:54, Ingo Molnar <mingo@kernel.org> wrote:
> >
> > The second part of the series simplifies and standardizes the SMP batch-patching
> > data & types namespace, around the new tp_array* namespace:
> >
> >         int3_patching_desc      => [removed]
> >         temp_mm_state_t         => [removed]
> >         try_get_desc()          => [removed]
> >         put_desc()              => [removed]
> >
> >         tp_vec,tp_vec_nr        => tp_array
> >         int3_refs               => tp_array_refs
> 
> Honestly, I think "int3" is better than "tp" as a part of the name.

Yeah, was thinking hard about those two as well, but skipped it for 
this series, because of the brevity issue: text_poke_int3_ is quite a 
mouthful for a commonly used global state variable.

> "tp" doesn't say _anything_ to me, even though I understand it is 
> short for "text poke". But if you want to say 'text_poke", please 
> just write it out.
> 
> At least "int3" has some meaning in x86 context, unlike "tp".
> 
> So please either write out "text_poke" and accept that the names are 
> a bit longer (but a lot more descriptive), or use "int3" if you want 
> to save some typing.

Yeah.

So the thing is, the whole _int3 naming itself is a bit artificial 
IMHO, what we *really* want to signal here is whether something is 
boot/UP functionality or SMP functionality under the text_mutex.

That the SMP functionality relies on INT3 traps is an implementational 
detail that isn't necessary to show up in the API namespace. It also 
relies on CR3 flushing, so we could as well have added _cr3. ;-)

So I was thinking about something like this for the boot/UP variants:

  text_poke_*()

and for the SMP variants:

  smp_text_poke_*()

and text_poke_* for the data/type space.

Plus I think with the adding of 'smp_' we can also add 'batch_' to a 
few APIs to make the family of APIs clearer, plus a few other things:

A quick summary of changes (mockup):

	# boot/UP APIs & single-thread helpers:

						text_poke()
						text_poke_kgdb()
	[ unchanged APIs: ]			text_poke_copy()
						text_poke_copy_locked()
						text_poke_set()

						text_poke_addr()

	# SMP API & helpers namespace:

	text_poke_bp()			=>	smp_text_poke_single()
	text_poke_loc_init()		=>	__smp_text_poke_batch_add()
	text_poke_queue()		=>	smp_text_poke_batch_add()
	text_poke_finish()		=>	smp_text_poke_batch_flush()
	text_poke_flush()		=>	smp_text_poke_batch_finish()

	text_poke_bp_batch()		=>	smp_text_poke_batch_process()
	poke_int3_handler()		=>	smp_text_poke_int3_trap_handler()
        text_poke_sync()		=>	smp_text_poke_sync_each_cpu()


	# data/type namespace:

	int3_patching_desc		=>	[removed]
	temp_mm_state_t			=>	[removed]
	try_get_desc()			=>	[removed]
	put_desc()			=>	[removed]

	tp_vec,tp_vec_nr		=>	text_poke_array
	int3_refs			=>	text_poke_array_refs

Some of the API names are now a bit long, but I think this is one of 
the cases where clarity is more important than brevity, plus these are 
usually used in a pretty compact, straightforward fashion to trigger 
text-patching processing, not part of complex compound expressions.

I'll propagate this nomenclature into the series and repost.

> PS. The casual meaning "tp" has in English everyday language is short 
> for "toilet paper".

LOL, this seals the deal, the tp_ prefix is *so* dead.

Thanks,

	Ingo
