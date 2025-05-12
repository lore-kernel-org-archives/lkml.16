Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7925A25C80B;
	Mon, 12 May 2025 09:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747042157; cv=none; b=TL0DLhxebGysUS5qGGk0ulbmYM6G6vegN8lzjiz/YAg99/rO5qhUeFqJC40Zjx+rIPbSejj7xbKbECkHTpGnLWKeVOBGP3y+zVJQehFALbv1RSy3XBfFFsfi4sS0kJI1WVesfX7Pg/rZ1PSAT8+4c4Rjj0bJj/cpGpN3aKTeKGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747042157; c=relaxed/simple;
	bh=YoFP98jJRr0F64My2fRMIusw9vmWrrP/FVPPIlYjxR0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=TNY29hQdRk+GRgdfM0zuT4vtWPbFmLeQCtKKsSBLNXZdfX9WxZCLRlwU1ADwrpo2yhw1segbkQeJye0fn+R2Re/X++1sixbnUd81S0hJfqJSsjcl6/7CKvvjQ/rX+2Aw8SFdsQqwIqtSYQCTHx4CbHS9nmK73VnPdPdfvwHfvVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pR2oqz9W; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pR2oqz9W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6072C4CEE7;
	Mon, 12 May 2025 09:29:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747042155;
	bh=YoFP98jJRr0F64My2fRMIusw9vmWrrP/FVPPIlYjxR0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=pR2oqz9WRy6IHfP4dmMBu4l4ojFFud5bn7tYkwsdFCcXPrk9d3hvmCNTk3PtIVTx7
	 BfsDoP3MsaUhEld5BKPvzcQ6nyoWFYYabBTTNB1vouvENWI8f0Riv50fpd32279xqG
	 7Swq2gyP4m8O+uEixaE2VjGxc0m8zrwAZ2e0A3QkzlfVLCQ1YhqFkgQ86SxbsQv4OW
	 R16KMvXQtm9tkH5LtoJEHzWjNvgsyS4+wnC9nwCrOsQ/2nhsFWpHD9/trLG2rPE/QE
	 TON4gOP2OA5+kRDaElaq2zMKP6AA8t/bIRJqIEzZH9BGREymwoZ4aPqNKJ6wls5Jaq
	 S1j5EvLlQAcoA==
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
In-Reply-To: <aBu2ocPIFOvq_EiA@gmail.com> (Ingo Molnar's message of "Wed, 07
	May 2025 21:38:09 +0200")
References: <20250507175338.672442-1-mingo@kernel.org>
	<qqz686a7_ob8uzbREL3X3P-MTdPUVJo9hi33Dsv-3kgJoB1_bE0ynnuXFVLIwbZ5dNkntegTdZhkBp04syneXA==@protonmail.internalid>
	<20250507175338.672442-2-mingo@kernel.org> <877c2spaag.fsf@kernel.org>
	<exZlQK8ioPft3NijtFzp4A_qkGlCunbqRbqwq8STs5kyK8khboJDM8LqVH7EZTImMbpeMOnxadeRvyEnyU69kA==@protonmail.internalid>
	<aBu2ocPIFOvq_EiA@gmail.com>
User-Agent: mu4e 1.12.7; emacs 30.1
Date: Mon, 12 May 2025 11:29:01 +0200
Message-ID: <87jz6mnpnm.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Ingo Molnar" <mingo@kernel.org> writes:

> * Andreas Hindborg <a.hindborg@kernel.org> wrote:
>
>> "Ingo Molnar" <mingo@kernel.org> writes:
>>
>> > This primitive is dealing with 'struct hrtimer' objects, not
>> > 'struct timer_list' objects - so clarify the name.
>> >
>> > We want to introduce the timer_container_of() symbol in the kernel
>> > for timer_list, make sure there's no clash of namespaces, at least
>> > on the conceptual plane.
>>
>> Is this a resend?
>
> I noted the changes in the boilerplate:
>
>   Changes in -v3:
>
>     - Picked up review tags
>     - Rebased to v6.15-rc5
>
> This particular patch didn't change.

Thanks. I didn't get the cover letter, but I should have looked for it.

>
>> Again, I think this change is unnecessary. Please see my earlier reply [1].
>>
>> Best regards,
>> Andreas Hindborg
>>
>>
>> [1] https://lore.kernel.org/all/877c3cbdq2.fsf@kernel.org
>
> Yeah, saw that, but you said you are fine with it if I insist, and I'd
> like to have this to free up the timer_* namespace.

Yes. I did not hear any proper insisting till now though.

> Since I think we'd
> like to introduce the timer_container_of() in the future it would be
> nice to do this rename, as:
>
> 	$ git grep -w timer_container_of
>
> will have hrtimer related false positive hits in rust/ code, even
> though the namespaces are obviously independent.

Ok, I see. I'm not used to grepping like that, but I see how that can be
annoying.

>
> The Rust method is arguably a minor misnomer as well: you have
> work_container_of around struct work, but timer_container_of is around
> struct hrtimer?

Yes, you are right.

Feel free to take this through tip. Otherwise maybe Miguel can pick it
up in the rust PR for 6.15.


Acked-by: Andreas Hindborg <a.hindborg@kernel.org>


Best regards,
Andreas Hindborg


