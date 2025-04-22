Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F66C202F7B
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 12:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745323727; cv=none; b=c6tLWIMv/7q0+UjnGRT4oKhjqPyEgrccVQn86HTwx+4c882sewQLsIRwoDxqqDC8icBMidADSNhUp8ZzWUV8j+xwwTiUJoTiaPo6ZMr3mm2xg0oHTeQTSwatn5FgbIw44i+Slw19H71jr9KZ6Wr4ZW7tlJ7byVSwsWI0FkddEjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745323727; c=relaxed/simple;
	bh=ZQ/MI0I1Krg53cFDir2f9YKMzbd76gkQhPWb54eC/LA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=cgVjMTzcGJvdLahcK/MgfOi1Ti9np+dGyOFlbOmWrGqjHIM6G4ga/OoC0zDq8tQiUKb0u7/bA7rILif7QiAFE5N9QJT8q7yy5DhyYcfIyJ8Ai3ElkEIaErJ+iAuEoKGrJUaU+Aqdy8+vcy/6Ug8Q9uVb/p3y3P8RkX7uWEkQm40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O5N3cjca; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O5N3cjca"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28B13C4CEE9;
	Tue, 22 Apr 2025 12:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745323726;
	bh=ZQ/MI0I1Krg53cFDir2f9YKMzbd76gkQhPWb54eC/LA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=O5N3cjca+5VxzVpxrqEoDRcwHgSnezEf4p0tFCxzdM1OHrz7DiSfD0ZgC3AzbHTmN
	 txiHrwYQq5iRVCBrimiPw4YpzLKo6qTofS9wjp3rgTqxE5uotMyLTOfhZC5IGJPf8g
	 Y61+xxSu73a+c4zgHEBaZ3NaHxt5Ipzbx9J4NGFMZnQBtFYG85X54gkg70fn51LocL
	 6h7owfgbhlC4txHiOepjIqljRlD1MJh9GHtgSUtkdUt+wEZurC+nh87VR22vf6cvlZ
	 E8+qk4ou/2l6e4Ut2JHIxQDutIc2B/aMSb7A4s4unOHqIgubsJT0zlOrO8wDrFqL8C
	 vz5bsb8pz6N5w==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "Ingo Molnar" <mingo@kernel.org>
Cc: <linux-kernel@vger.kernel.org>,  "Thomas Gleixner" <tglx@linutronix.de>,
  "Frederic Weisbecker" <frederic@kernel.org>,  "H . Peter Anvin"
 <hpa@zytor.com>,  "Linus Torvalds" <torvalds@linux-foundation.org>,
  "Peter Zijlstra" <peterz@infradead.org>,  "Alex Gaynor"
 <alex.gaynor@gmail.com>,  "Anna-Maria Behnsen" <anna-maria@linutronix.de>,
  "Boqun Feng" <boqun.feng@gmail.com>,  "Lyude Paul" <lyude@redhat.com>,
  "Miguel Ojeda" <ojeda@kernel.org>
Subject: Re: [PATCH 01/10] rust: Rename timer_container_of() to
 hrtimer_container_of()
In-Reply-To: <20250416090544.3311613-2-mingo@kernel.org> (Ingo Molnar's
	message of "Wed, 16 Apr 2025 11:05:35 +0200")
References: <20250416090544.3311613-1-mingo@kernel.org>
	<jh8z-TRpX-qLsnlfBNxKo8G_EmBFXRQY0pv6OBpYJdAC3CSmpNEFEURdeAlLMvjzBxmYruITt_eVF0nRNt8f2w==@protonmail.internalid>
	<20250416090544.3311613-2-mingo@kernel.org>
User-Agent: mu4e 1.12.7; emacs 30.1
Date: Tue, 22 Apr 2025 14:08:37 +0200
Message-ID: <877c3cbdq2.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Hi Ingo,

"Ingo Molnar" <mingo@kernel.org> writes:

> This primitive is dealing with 'struct hrtimer' objects, not
> 'struct timer_list' objects - so clarify the name.
>
> We want to introduce the timer_container_of() symbol in the kernel
> for timer_list, make sure there's no clash of namespaces, at least
> on the conceptual plane.

This associated trait function is defined on the trait `HasHrTimer`, so
I don't think there is any risk of confusing it with the C (or future
Rust) `timer_container_of` methods/functions.

As to symbol names, there is no risk of conflicts. The rust symbols are
mangled and get quite long.

If you really want this change it's OK with me, but I would prefer to
drop it.

Best regards,
Andreas Hindborg


