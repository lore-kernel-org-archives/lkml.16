Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 311CE231828
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 13:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748955901; cv=none; b=qCYn0yt/QqsqKvm+WhYQioAPychy5rBy/MTAFcuHqm3DHn/DrgTXW7+mIcjc/gIf4JTeHLxTRXGxfcPc5rPBpYXJmILy13O9WR5ThcVWCgCjObFk4m0kglv3+uc1dLp0au4GvyrJRgs8lH7kKgr3if6gPz3uyx7zlR/izxIRjX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748955901; c=relaxed/simple;
	bh=iQKF5hrDuJBQ4PkIXBZ6ljd7awLeBmhX72y2XF5yaiY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vob8zqMIJcglA9cj9DvjcHfJ2y41TNuYK0aYNBByZoLAtCdrqmme8axz6rur9/lYCj83R/SJyl/4Pkqa26VHhgfQCx5jdbLC5e2rv0jAOkp7RKyLC/Ar8Ur5OJNmk5DLB76y7fMGkBVHPkzlBTDFvEwytDYE2z0FYXJiKuhXXkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=JrEsGnIr; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="JrEsGnIr"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=d1j5QjLR2SqzARCF6ZZJISUDQKix3QT3kzdA/KQWUY0=; b=JrEsGnIrRKwGy1H2BQxTGzFeCb
	Ky+o3Ohe5NXInY/GCRTRyvcbuYxqRIlAZQ8IKKnSfqcipxQm2C3LgHobYP16Wok98n6wYRT0HObij
	/Wb7ICVDZYVtOibZFXUx2dp3LkvrFP1vGhRgLbBQNTwp59JFzHRkESaleOifff3VBHuP+i5nEUufh
	aj0N3ldpMpWgUmjzIJ0PFhTXcYntKeBIQcd7BGaCz7pu1qp5OdYyE5lRGVz+sM6nM3qP3vXi3i0ET
	P2T97cM70ev4glFOhdK0+sMyvmI4by9Uh41poSiYalQ1UWAjzMxlfo0GnpZZR9TRlH8KNCkrPQ/OZ
	PIxAsYQw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMRK4-00000000l5T-0HG9;
	Tue, 03 Jun 2025 13:04:56 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 82DDC3005AF; Tue,  3 Jun 2025 15:04:55 +0200 (CEST)
Date: Tue, 3 Jun 2025 15:04:55 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Linus Torvalds <torvalds@linuxfoundation.org>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, kees@kernel.org,
	acarmina@redhat.com, jpoimboe@kernel.org, mark.rutland@arm.com
Subject: Re: [RFC 6/8] x86_64/bug: Implement __WARN_printf()
Message-ID: <20250603130455.GL21197@noisy.programming.kicks-ass.net>
References: <20250602144201.301974933@infradead.org>
 <20250602144755.928750774@infradead.org>
 <CAHk-=whkD=pveK6X_5gtVbJ62+86oBOr9JokneYpSJyxjHFBpQ@mail.gmail.com>
 <20250602154943.GB30486@noisy.programming.kicks-ass.net>
 <CAHk-=wiYHv2duN1Aj3E5UD3zH=z6A9YpGJ1Mxj_CWL7_FRMKgw@mail.gmail.com>
 <20250602215725.GA39782@noisy.programming.kicks-ass.net>
 <CAHk-=whOEyTJb6MAcy2ojN98RrEzU5TW031sGpHMhMMFAg5bnw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=whOEyTJb6MAcy2ojN98RrEzU5TW031sGpHMhMMFAg5bnw@mail.gmail.com>

On Mon, Jun 02, 2025 at 04:10:16PM -0700, Linus Torvalds wrote:
> On Mon, 2 Jun 2025 at 14:57, Peter Zijlstra <peterz@infradead.org> wrote:
> >
> > So if I stuff the asm macro in a global asm() block then GCC ends up
> > looking like so:
> 
> Better, but as then the clang thing looks like a horrendous disaster.
> 
> How about we simply make this all *code* instead of playing games with
> register numbers?
> 
> Why not just push the arguments by hand on the stack, and make that be
> the interface? A 'push %reg' is like a byte or two. And you'd do it in
> the cold section, so nobody cares.
> 
> And the asm would look somewhat sane, instead of being crazy noise due
> to crazy macros.
> 
> Or so I imagine, because I didn't actually try it.

Yeah, I can make that work. 

I've been trying to make __WARN_printk() (or similar) do a tail-call to
a "UD2; RET;" stub. But doing printk() in a function makes GCC generate
wild code that refuses to actually tail-call :/

The next crazy idea was to make a variant of __WARN_printk() that takes
a struct bug_entry * as first argument such that it has access to the
bug entry and then take the trap on the way out (while keeping the
pointer in the first argument) and then have the trap handler complete
things.

That way it would all 'just work'. Except I can't seem to force GCC to
emit that tail-call :-(

I'll prod at it some more.
