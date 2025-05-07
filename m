Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81FCB1EBFE3;
	Wed,  7 May 2025 18:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746641079; cv=none; b=ZJLwgKj1R+VvJfzUuDRVyNjiLlwrr/uKP+oZGBCLQUIvxRjkc9W5H02hAyyVResQA9K02gxd9zbcj1wubfjEBuDQ2cy4KkE1QErcMd0GaVcjk88MshiuSmiXBGgoiE+0z0G7NiBinG2VNFeBPqcMzv7cmjbAILsRiIn3ey3Bd8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746641079; c=relaxed/simple;
	bh=jUM/HI0JujTGfaxkNUSzcimDqWgqa+5yCds1nP1XrmQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=O2az4jaQJK0vh89E5QSs5KHRKVqzHpgE8XkFfOOXfBF+/GhxjSd9Y7uNQLfVaIwQsNTEUNhhloOuritdHTUfelxcdTyu2d3Rng43uy2sKMrQbuJAKsZXC77gyBuAuGt8ogDnYYQjOH+lGvlui8TW0zo9friQXwI0k0XHp5UHydU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hAg0hnAI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hAg0hnAI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8A23C4CEE9;
	Wed,  7 May 2025 18:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746641079;
	bh=jUM/HI0JujTGfaxkNUSzcimDqWgqa+5yCds1nP1XrmQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=hAg0hnAIkhGUhL0Z7d8mybAofEjqzZ6IXjksgIRmT+AWrwapb1zDV+WPNUeNd/7hQ
	 ZBKZTeEKp37J7N5T4drjN9Y5DO4gFpJEAUugFIEJmg6KUNb37jJ9OK2a+8uprLuBsZ
	 ebD+GPKU+MiXRBHC6E40zQkifSb0StDgv2hIFRPNJOWik0fYvP9f5HpWP4ibP6wsRZ
	 PxX/2PhyQS0M7+RYag5cjexzJ3AGRbW5r0Dlz2eN+1Fb7HZt50teMn7taodi+5BNAy
	 /Npy0vJdMf5zhVZC0W/7FlNrZh1jIbBS0fD86s4twSwgOseoz/BdLsRytBFPQYU0hh
	 /DEF8UcBHLU7A==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "Ingo Molnar" <mingo@kernel.org>
Cc: <linux-kernel@vger.kernel.org>,  "Thomas Gleixner" <tglx@linutronix.de>,
  "Frederic Weisbecker" <frederic@kernel.org>,  "H . Peter Anvin"
 <hpa@zytor.com>,  "Linus Torvalds" <torvalds@linux-foundation.org>,
  "Peter Zijlstra" <peterz@infradead.org>,  "Miguel Ojeda"
 <ojeda@kernel.org>,  "Alex Gaynor" <alex.gaynor@gmail.com>,  "Anna-Maria
 Behnsen" <anna-maria@linutronix.de>,  "Boqun Feng" <boqun.feng@gmail.com>,
  "Lyude Paul" <lyude@redhat.com>,  "Rust ML"
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH 01/10] rust: Rename timer_container_of() to
 hrtimer_container_of()
In-Reply-To: <20250507175338.672442-2-mingo@kernel.org> (Ingo Molnar's message
	of "Wed, 07 May 2025 19:53:29 +0200")
References: <20250507175338.672442-1-mingo@kernel.org>
	<qqz686a7_ob8uzbREL3X3P-MTdPUVJo9hi33Dsv-3kgJoB1_bE0ynnuXFVLIwbZ5dNkntegTdZhkBp04syneXA==@protonmail.internalid>
	<20250507175338.672442-2-mingo@kernel.org>
User-Agent: mu4e 1.12.7; emacs 30.1
Date: Wed, 07 May 2025 20:04:23 +0200
Message-ID: <877c2spaag.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Ingo Molnar" <mingo@kernel.org> writes:

> This primitive is dealing with 'struct hrtimer' objects, not
> 'struct timer_list' objects - so clarify the name.
>
> We want to introduce the timer_container_of() symbol in the kernel
> for timer_list, make sure there's no clash of namespaces, at least
> on the conceptual plane.

Is this a resend?

Again, I think this change is unnecessary. Please see my earlier reply [1].

Best regards,
Andreas Hindborg


[1] https://lore.kernel.org/all/877c3cbdq2.fsf@kernel.org

