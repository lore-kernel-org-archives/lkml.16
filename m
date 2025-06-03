Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B2EB1B95B
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 22:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748989397; cv=none; b=EQYeBqsEH4ylpCX4ICD7/fAJ16qfWjq/8AMoLVkvZ8szgwtuRX04I7p5keV8r2HvMgvN8BRF7NZJqw+rlA+sOxG3wuYiI8qPBoetqz9XWa+LfoBeLlqYrecM58mRKVyU18LVek11qrsn+nn171xVFdy/+pm7oqno5asLvafxnpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748989397; c=relaxed/simple;
	bh=ujR7+YNFVwdyJod/Ln3HICzV48zkmFm+xlMOBh2rkXY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ri+TcgBx1yw8WI+6UkjPGgt0o/gJlklTbkBeN4Zb/LuqfRgA2ORkauSZt45VfjkX64KOwLd5x9cIK2UHBZPgkG9JbWOafw5emc68UGLztBr8NNcOWSkh+i8/NX8d+OSR85Zf2Zek39bhfMUtzwBQhecBjKGcEW0vGhZMl32OzGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TBve22C1; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TBve22C1"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3a4fd1ba177so255216f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 15:23:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748989393; x=1749594193; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cf7cdnxo/lNWyds1JKJmBHm432KIhVOdVcIeUTbnMfo=;
        b=TBve22C1QW6W5OJcfaASdvElTT8sNz/ML6S2tep1JnAAIavE5IO49PmHrto21cSBAF
         uZyZw3EnbA25k8iL5aQ1WCNjCvU2JWnZzyLCeP3R+gp4i+hWOzSrJGKyo3K0nBTuVF7H
         KvNSEjBDKBf0eIhDE3TAcZIHZmjsSftepsdhOdEfvwLuVON5fIoaDRrGBA3wdEr2Lf3C
         +k5PntvXCbY5sECwVwu6sKLpgk/99tf1AD/heQEdmKsrF5emEfMlVXrBSOIq4pmKsiWn
         yhzc5KEK1cNcAGJTD1DAqaDzlx3InfIVUdsQFB5IoOQ3VxbQGfFu+ZG2J+g3awG56IDz
         tZgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748989393; x=1749594193;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cf7cdnxo/lNWyds1JKJmBHm432KIhVOdVcIeUTbnMfo=;
        b=I9u7Nwr/v6qmJbAu70fnrlGmWchLlJwqr3VTLKq4oPDqOAJvgVhfDWScFc6+Ayk7Vc
         OWFRCoMJzNQGjRAsP7e0pjyEjbFOZ/++pj00/l2JjcL3yfUYolBJeSBL8maVEj8zN7YH
         EqqSBQlLpWVr2CFsv15FAAvruEQl0tMyCnCTMvkw41lQuIhA4IfEu4qqzYLWrLlr7g74
         NCke0FiEznuFr41gDsDUSwlo0t3eCGPn7KBxTw5Poq6IHN54sEuDPB2xPO4ID/jQehjb
         mIoorJRQN8wtuit6WW8Q16LSsUxjxWETie8UgMubx2UxLvolKAA+atmvN93EwAHpM/AE
         X30A==
X-Forwarded-Encrypted: i=1; AJvYcCVH1aTN/z6sLq5nMwt17Bp0+gSa2hZ/qzixYJeGB1WueCgehYbBTcA3/BABh/65l7U1Fx6lFtD74nTR5xk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHSjcsfkSNmiwRBtXqtQow1wnq131DVxhCAaDukzFBincgDVbS
	04IA7US0h9rzemUscVdUxM7Em73+4ZmrIOthj+IkLhVolOVsPHO5khho
X-Gm-Gg: ASbGnctMHk4A697LMpFuYXY9DTJC5WYjX0Q8RUGuMsuC2JJ88sFTzaI1HkXVMFac5i0
	n6ZrpgWcdGpvYXUA3jOnqD5findyQgw3fGKXur4NVCRlDjmszaX9ESLfx3o7JjX8MM/EFpZX8BT
	dOsdJdG7DibqnQtnLH+tI3wkS626wI92eSxjnKgWMDda9psUtoIPPB7cYwnG2FbsDUyAxHFBPLl
	hi5nLyb/7z6yTidNTwq/z0txxZfe9Rd5yanQkz0ASW/8jslraZUlcCV1Am01knkgmwfjcg3y5pl
	eA0+XUZuXoaHwXY/An3Gt+yREurYd9agQb0UuCHrLLITdcgeFOi5sqY5bV1b+lrC8tI7lM0qzpN
	wrYNNOFUUVT0lTIuhhYz9zhmM
X-Google-Smtp-Source: AGHT+IEGYsxfnq75yBV046eCf2C6bfv4GXEyK+rhrzPBHWrsHGEFRWDcZKf+jRLmD17a/VFJaVfeuQ==
X-Received: by 2002:a5d:5f54:0:b0:3a4:f7ae:77c9 with SMTP id ffacd0b85a97d-3a51d507bf6mr449428f8f.5.1748989393563;
        Tue, 03 Jun 2025 15:23:13 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4f00a00f5sm19745427f8f.95.2025.06.03.15.23.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 15:23:13 -0700 (PDT)
Date: Tue, 3 Jun 2025 23:23:12 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Linus Torvalds <torvalds@linuxfoundation.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org, kees@kernel.org, acarmina@redhat.com,
 jpoimboe@kernel.org, mark.rutland@arm.com
Subject: Re: [RFC 6/8] x86_64/bug: Implement __WARN_printf()
Message-ID: <20250603232312.73ab608c@pumpkin>
In-Reply-To: <20250603130455.GL21197@noisy.programming.kicks-ass.net>
References: <20250602144201.301974933@infradead.org>
	<20250602144755.928750774@infradead.org>
	<CAHk-=whkD=pveK6X_5gtVbJ62+86oBOr9JokneYpSJyxjHFBpQ@mail.gmail.com>
	<20250602154943.GB30486@noisy.programming.kicks-ass.net>
	<CAHk-=wiYHv2duN1Aj3E5UD3zH=z6A9YpGJ1Mxj_CWL7_FRMKgw@mail.gmail.com>
	<20250602215725.GA39782@noisy.programming.kicks-ass.net>
	<CAHk-=whOEyTJb6MAcy2ojN98RrEzU5TW031sGpHMhMMFAg5bnw@mail.gmail.com>
	<20250603130455.GL21197@noisy.programming.kicks-ass.net>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 3 Jun 2025 15:04:55 +0200
Peter Zijlstra <peterz@infradead.org> wrote:

> On Mon, Jun 02, 2025 at 04:10:16PM -0700, Linus Torvalds wrote:
> > On Mon, 2 Jun 2025 at 14:57, Peter Zijlstra <peterz@infradead.org> wrote:  
> > >
> > > So if I stuff the asm macro in a global asm() block then GCC ends up
> > > looking like so:  
> > 
> > Better, but as then the clang thing looks like a horrendous disaster.
> > 
> > How about we simply make this all *code* instead of playing games with
> > register numbers?
> > 
> > Why not just push the arguments by hand on the stack, and make that be
> > the interface? A 'push %reg' is like a byte or two. And you'd do it in
> > the cold section, so nobody cares.
> > 
> > And the asm would look somewhat sane, instead of being crazy noise due
> > to crazy macros.
> > 
> > Or so I imagine, because I didn't actually try it.  
> 
> Yeah, I can make that work. 
> 
> I've been trying to make __WARN_printk() (or similar) do a tail-call to
> a "UD2; RET;" stub. But doing printk() in a function makes GCC generate
> wild code that refuses to actually tail-call :/
> 
> The next crazy idea was to make a variant of __WARN_printk() that takes
> a struct bug_entry * as first argument such that it has access to the
> bug entry and then take the trap on the way out (while keeping the
> pointer in the first argument) and then have the trap handler complete
> things.
> 
> That way it would all 'just work'. Except I can't seem to force GCC to
> emit that tail-call :-(
> 
> I'll prod at it some more.

How about a slightly less generic macro, something that could be:
#define WARN_IF(a, op, b, msg) \
	if (unlikely((a) op (b)) { \
		printf("WARN: %s (%x " #op " %x)\n", \
			msg ? msg : "(" #a ") " #op " (" #b ")", (a), (b)); \
	}
but could just be:
	if (unlikely((a) op (b)) {
		asm(	" ud2; cmp %0, %1"
			" .asciz msg; .asciz #op"
			:: "r" (a), "r" (b));
	}
So a ud2 followed by a reg-reg compare (should be REX/D16 prefix followed
by '3[89ab] /r') and two strings (literals or addresses).
With a suitable exception table entry.

That saves the problem of a generic printf format while still giving the
values of the variables associated with the failing test (for simple tests).
It should also avoid destroying register assignment for the rest of the
function.

If gcc refuses to do a jump for the 'if (unlikely...))' try adding an 'else'
clause containing an asm comment.
I've done that in the past to convert a backwards conditional jump (predicted taken)
into a forwards jump (predicted not taken) to an unconditional jump to the
actual target.
(I had a very tight clock limit for the 'worst case' path.)

	David


