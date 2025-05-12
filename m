Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E43B22500CF;
	Mon, 12 May 2025 10:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747046011; cv=none; b=IyfsMVe0xOXn1ZbCET7I8Zbi1WLEmVCn5deHY6ATll+yeNLr59IDS+x4k7+BYJHjSL35Nb/EZvAzAVrVGea2H4oLgf/8KPLHqcTblefLIMGR1WQbi8hj7iRVT3QPM1v0rgPV+1pwHwtGchay24TPijH8nKDZX1IDQBJOlS2YqLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747046011; c=relaxed/simple;
	bh=G3Cxx0BHSe9RqF+Hv8aFljAC132Oze/gTGVIrLfY5HY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=mcr3mv0fb090UaRz9Hkb5W9BEBJWA89m9VkwnQy08ZJpu52SXchD0Dlor/kkFsmh8NOW8t5gcYP79zS3+9t55HofgZLchUFgAsLa66xLsOy94pQ8Xma1txKoNTnGv4B9zhBp2yoAVXhad8PO/mC64GoVg+XVfKE4XLO951u9UMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iVekFqWR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iVekFqWR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B783C4CEE7;
	Mon, 12 May 2025 10:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747046010;
	bh=G3Cxx0BHSe9RqF+Hv8aFljAC132Oze/gTGVIrLfY5HY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=iVekFqWRnOyc0Ak18pcmTgF0y0FaYGHT1DdYy9A/aFHOArBrsIcDfN9Ga2SMTSDyf
	 7Pt6uD6d+TpW5IKMVHGH3gh9Rh1alm752H3rM77hLepVMCHfLjw2Ca0vg+Ca3gNDPq
	 MUBvyV2WOLgLGTNqcYchqkKp9qsQnud6oRUvIMQwb8Gv+35i+4+DTLAnfLysIPrYpO
	 gmkTK1P1zLEex64g3edXY5enERGP7k9+MNS6F4VN71+7XA1MfZSlKYgHHY3/Jkvvg5
	 hQsutc0W1QXXWVYVSowvSeBTS6/VtczU3QctoD5Fd8CsOP0JUC9U63/t+b8EYwuxuj
	 NvaJ1/M+wcpCg==
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
In-Reply-To: <87jz6mnpnm.fsf@kernel.org> (Andreas Hindborg's message of "Mon,
	12 May 2025 11:29:01 +0200")
References: <20250507175338.672442-1-mingo@kernel.org>
	<qqz686a7_ob8uzbREL3X3P-MTdPUVJo9hi33Dsv-3kgJoB1_bE0ynnuXFVLIwbZ5dNkntegTdZhkBp04syneXA==@protonmail.internalid>
	<20250507175338.672442-2-mingo@kernel.org> <877c2spaag.fsf@kernel.org>
	<exZlQK8ioPft3NijtFzp4A_qkGlCunbqRbqwq8STs5kyK8khboJDM8LqVH7EZTImMbpeMOnxadeRvyEnyU69kA==@protonmail.internalid>
	<aBu2ocPIFOvq_EiA@gmail.com> <87jz6mnpnm.fsf@kernel.org>
User-Agent: mu4e 1.12.7; emacs 30.1
Date: Mon, 12 May 2025 12:33:17 +0200
Message-ID: <87ecwunmoi.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Andreas Hindborg <a.hindborg@kernel.org> writes:

> "Ingo Molnar" <mingo@kernel.org> writes:
>
>> * Andreas Hindborg <a.hindborg@kernel.org> wrote:
>>
>>> "Ingo Molnar" <mingo@kernel.org> writes:
>>>
>>> > This primitive is dealing with 'struct hrtimer' objects, not
>>> > 'struct timer_list' objects - so clarify the name.
>>> >
>>> > We want to introduce the timer_container_of() symbol in the kernel
>>> > for timer_list, make sure there's no clash of namespaces, at least
>>> > on the conceptual plane.
>>>
>>> Is this a resend?
>>
>> I noted the changes in the boilerplate:
>>
>>   Changes in -v3:
>>
>>     - Picked up review tags
>>     - Rebased to v6.15-rc5
>>
>> This particular patch didn't change.
>
> Thanks. I didn't get the cover letter, but I should have looked for it.
>
>>
>>> Again, I think this change is unnecessary. Please see my earlier reply [1].
>>>
>>> Best regards,
>>> Andreas Hindborg
>>>
>>>
>>> [1] https://lore.kernel.org/all/877c3cbdq2.fsf@kernel.org
>>
>> Yeah, saw that, but you said you are fine with it if I insist, and I'd
>> like to have this to free up the timer_* namespace.
>
> Yes. I did not hear any proper insisting till now though.
>
>> Since I think we'd
>> like to introduce the timer_container_of() in the future it would be
>> nice to do this rename, as:
>>
>> 	$ git grep -w timer_container_of
>>
>> will have hrtimer related false positive hits in rust/ code, even
>> though the namespaces are obviously independent.
>
> Ok, I see. I'm not used to grepping like that, but I see how that can be
> annoying.
>
>>
>> The Rust method is arguably a minor misnomer as well: you have
>> work_container_of around struct work, but timer_container_of is around
>> struct hrtimer?
>
> Yes, you are right.
>
> Feel free to take this through tip. Otherwise maybe Miguel can pick it
> up in the rust PR for 6.15.

Sorry, I meant 6.16 of course.


Best regards,
Andreas Hindborg


