Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07BA828A3EA;
	Tue, 22 Apr 2025 14:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745332319; cv=none; b=WGq8REySCgpjaG9yAdu1wEEYbr7riRcqZ95C5C2vip4yBi94ZP5kKMxOo3rkH3hRW/7wDDXN9VdwMZeL7so5pBTKKcsK9mmjpi4NeQR/ZWP+67F0tHnj8PP+xeOc2sQvf44mJv7ncjMZHIBd499Vskpl5mmGNYPmm/LAQblkYUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745332319; c=relaxed/simple;
	bh=cp9iCaG6IjleZ8rnxrFEXQOpQGvM5fPYLk4VgnpoCss=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tM7VgD3LQJpOB+b3fEDbPs8hVvUpdT7YlR41YkrXQtpekTpZhaTYZKUPqpvTK6jhHJjcnsn+1XZ7ospTmfpkv3EXBaXjHfd8+jKB9U3/2axzlMTgyrUAEih90Xt772gp8zCJLlo54JIGgQofvV8oXZymWLUa7vduynME0NIMZbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=djk61YA3; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="djk61YA3"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=i4gjMlBtZTrVVK5rL4/69M/87+0lVpEAYA66vnBwBVA=; b=djk61YA3uNxsIPYl4YCBuNs6Ve
	dBTA48m1zawlQcz9ZZoQ4W4s9NkiUElMVURgvqobwIfD5A9uyLT69Fx7STvHps3JY3f3y90XmHnY5
	Xwqc5cs7ATMyIwNFCdEVe2JpO8IWCHpAW8bhs32PixZINu9E77+6JytB6+tK/xZNIvSd9ha91PbZf
	IPMxbo/6UMUxz6DRblcgoPhHDGMFcjphCFmZe5pgBgur0fD5YU0yN9W9HZcZQjhZz9VvQUwsNf3tS
	r1sh6T5wayWnEHVRK4ne+vfm1be+Ok3jhvW3CVu2vz3FEFbSplh2o5g0a2G5gISknEL11UE9MsM/A
	TSMbQUDg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u7Ef4-0000000BF5b-2N8w;
	Tue, 22 Apr 2025 14:31:46 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 243C53003C4; Tue, 22 Apr 2025 16:31:46 +0200 (CEST)
Date: Tue, 22 Apr 2025 16:31:45 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Boqun Feng <boqun.feng@gmail.com>
Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	ojeda@kernel.org, alex.gaynor@gmail.com, gary@garyguo.net,
	bjorn3_gh@protonmail.com, benno.lossin@proton.me,
	a.hindborg@samsung.com, aliceryhl@google.com, tmgross@umich.edu,
	dakr@kernel.org, mingo@redhat.com, juri.lelli@redhat.com,
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
	vschneid@redhat.com, pmladek@suse.com
Subject: Re: [PATCH v2 0/2] add Rust version of might_sleep()
Message-ID: <20250422143145.GC15651@noisy.programming.kicks-ass.net>
References: <20250410225623.152616-1-fujita.tomonori@gmail.com>
 <aAen7fQYciq2azi9@Mac.home>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aAen7fQYciq2azi9@Mac.home>

On Tue, Apr 22, 2025 at 07:30:05AM -0700, Boqun Feng wrote:
> On Fri, Apr 11, 2025 at 07:56:21AM +0900, FUJITA Tomonori wrote:
> > This patchset adds Rust version of might_sleep().
> > 
> > These patches were previously part of the IO polling patchset [1], but
> > they were split out to make upstreaming easier.
> > 
> > The first patch is for sched/core, which adds
> > __might_sleep_precision(), rust friendly version of __might_sleep(),
> > which takes a pointer to a string with the length instead of a
> > null-terminated string. Rust's core::panic::Location::file(), which
> > gives the file name of a caller, doesn't provide a null-terminated
> > string. __might_sleep_precision() uses a precision specifier in the
> > printk format, which specifies the length of a string; a string
> > doesn't need to be a null-terminated. Providing a null-terminated
> > string for better C interoperability is under discussion [2].
> > 
> > The second patch adds a Rust implementation of might_sleep(), on top
> > of the changes in the first patch.
> > 
> > [1]: https://lore.kernel.org/lkml/20250220070611.214262-1-fujita.tomonori@gmail.com/
> > [2]: https://github.com/rust-lang/libs-team/issues/466
> > 
> > v2:
> > - improve SAFETY comment
> > v1: https://lore.kernel.org/lkml/20250406110718.126146-1-fujita.tomonori@gmail.com/
> > 
> 
> @scheduler, if there is no objection, I'm going to take these two into a
> pull request to tip soon. Thanks!

Yeah, go ahead. I still think Rust should be fixed, but sure, we can
live with this until that time.
