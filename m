Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20EBC2054E6;
	Mon,  3 Feb 2025 13:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738589931; cv=none; b=SzWjB8PKdSZkLZcfpTQa8+2Gmqw1jZf7qasVdp7Z1XRp4WydTJWESpzNK/3JscNTVoq7QcotlW8gASTZz6mwBlkf3EK/hbMQ+57Rpo5sr4b9pIuLSN6PAjbwGlfXm8H92IRPRRdXcRbviHJeo3rjoVutvBoEDOeHSM7GIalgKyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738589931; c=relaxed/simple;
	bh=nB7M3/i3uUOz+Dn4g5qI8WaCMCJI69o+pRcsHjI4gFo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sk/zqSY4TKH+Ss+HcqohtK+5j6vuHGtvkTKhTh+/3626ArOC16oJhZqv+pG9uzTRhfj8oBn3wRR873LN00wIK5rPIHm07r/U7xEf1fh5qDNx3S3E9Xqa81GtrDqp22GLtVrVf0cuM6OAfEi656m8D9Rebsq3hlRadtYrlRamct4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=HuqeOxKY; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="HuqeOxKY"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=38cWeGMhCkcTt8tppBZmfD9kCHmChWXz5VYwsX+rts4=; b=HuqeOxKYsJgX8fr0EqmB1sk4dt
	E0Bv5dQwJCTin0NbXzLSICMiEAV6/+bEm+rw82Rfpq9ot2kRoSdj1mpD3OMYFaCb9BL64UY5HiYCp
	BxIum0ipGO1qPdiV3eetON/hP+0Zl2foZ633oLxoS66kYQqorX3DvHfd6mbKv3EPKvnGAmTWhdnjV
	tNb65caeoYVOBTYUfbiGTScZz8U5lwyROLNhIXs2UPpsbkCqKruGJMIkwfECBZIdMEwfVdJieRqTg
	WgnhA5D2ZYnDX4FXuh0v2iBLphtEVZQQJXsVnqBF04Z9CgNwCclq8rd0kpYNL1SE+F+lJh2tersR9
	D4EZCtuA==;
Received: from 77-249-17-89.cable.dynamic.v4.ziggo.nl ([77.249.17.89] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tewey-0000000G5uC-1aPI;
	Mon, 03 Feb 2025 13:38:44 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 02F53300310; Mon,  3 Feb 2025 14:38:44 +0100 (CET)
Date: Mon, 3 Feb 2025 14:38:43 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>, Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: sync: add wait_interruptible_freezable
Message-ID: <20250203133843.GG7145@noisy.programming.kicks-ass.net>
References: <20250130-condvar-freeze-v1-1-a91d5661d505@google.com>
 <20250203115418.GB14028@noisy.programming.kicks-ass.net>
 <CAH5fLggyyP1A=uNxr2iYNKOj0V5rxZRU83TRgs6Ah1uJ=Ee2uA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAH5fLggyyP1A=uNxr2iYNKOj0V5rxZRU83TRgs6Ah1uJ=Ee2uA@mail.gmail.com>

On Mon, Feb 03, 2025 at 12:56:05PM +0100, Alice Ryhl wrote:
> On Mon, Feb 3, 2025 at 12:54 PM Peter Zijlstra <peterz@infradead.org> wrote:
> >
> > On Thu, Jan 30, 2025 at 11:30:44AM +0000, Alice Ryhl wrote:
> > > Binder allows you to freeze a process where some of its threads are
> > > blocked on the Binder driver. To make this work, we need to pass
> > > TASK_FREEZABLE when going to sleep in the appropriate places. Thus, add
> > > a new method wait_interruptible_freezable for the condition variable so
> > > that sleeps where this is supported can be marked as such.
> >
> > The constraint on freezable is that you must not hold locks. There is a
> > lockdep check for this in the code, but it would probably make sense to
> > teach Rust about this constraint as well, hmm?
> 
> Unfortunately, I don't think there's any way to enforce this at
> compile time, but I'm definitely happy to add this in the
> documentation.

Ah, ISTR people talking about teaching Rust about the whole raw_spinlock
vs spinlock vs mutex nesting order and figured if it can do that, then
this should be doable too.

But perhaps that never quite happened.

Yes, documentation would be good. Just in case it isn't obviuos,
freezing a task that holds a lock can trivially deadlock vs another task
that needs that lock to complete before it too can hit freezable.
