Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B73620370C;
	Mon,  3 Feb 2025 11:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738583666; cv=none; b=iT4DbwLvaILZ2cUKeQlHNMV4BVp5sFUnxKs7FzVZ1SBcNFtpfSwoP5PrlJBX9eLWQREObe278ELLuVJjE/xkfC3Wd1i22j6tV2EEhwS8Nsm2vTmJoKY3dJQCld8cc7ynq5c50eFOfaTip2aSS9BCnzCyiYP2eF0c8472lY1OLdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738583666; c=relaxed/simple;
	bh=+0UPjRq2bNuHhSqfgSViURTGOaINhDBfG8MWqarjTOY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mUtengZcgUe3491q2FnZlEdob+poEJLZq8ejIVTzzY3mrONdtXOJA77Jpedbfrv1sDdfp1Vmq7y1HwAHpQGsAX03xBs6IRFPsS4OCuSG8tVjLcH616nPs02NebBDNokmUvSrsyHWxkD46v7/iDTemPAz+aQ4O/L+cU5BpvZHe8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=MsZm47M5; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="MsZm47M5"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=+0UPjRq2bNuHhSqfgSViURTGOaINhDBfG8MWqarjTOY=; b=MsZm47M5Wiuqo3VvscNUKTuSSl
	CdFV9bf7dXV3A9ahIo6AaE6F3yL2jlCzgqgtewx/A0E15MWqgugVC4BYSCzxPuoTyXH/tssX0GIto
	GZkRAl1lBcbGzfJWlfPAAJ+o6G3HWPzr9nJnH8AbQraAS8dSVDO2T+5bIsKd26wjhXhqlmju92IG4
	auFfGP90fu/Wq/hxj7sBACEgpJ1ZvCTcA0GugtBmJrMsOKugj4bK+dxvvUFfRMrr7/N6oFy9U3YaT
	6LtAu5Utq467DY4tu45FKhY22gQqF6zE6Pj5ZNTKdIT6/yF9MWblJBDfE2b8FelJZOZ4Jxnmdfqs+
	qzk9qi2g==;
Received: from 77-249-17-89.cable.dynamic.v4.ziggo.nl ([77.249.17.89] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tev1v-0000000G52Z-0f22;
	Mon, 03 Feb 2025 11:54:19 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id B36D330035F; Mon,  3 Feb 2025 12:54:18 +0100 (CET)
Date: Mon, 3 Feb 2025 12:54:18 +0100
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
Message-ID: <20250203115418.GB14028@noisy.programming.kicks-ass.net>
References: <20250130-condvar-freeze-v1-1-a91d5661d505@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250130-condvar-freeze-v1-1-a91d5661d505@google.com>

On Thu, Jan 30, 2025 at 11:30:44AM +0000, Alice Ryhl wrote:
> Binder allows you to freeze a process where some of its threads are
> blocked on the Binder driver. To make this work, we need to pass
> TASK_FREEZABLE when going to sleep in the appropriate places. Thus, add
> a new method wait_interruptible_freezable for the condition variable so
> that sleeps where this is supported can be marked as such.

The constraint on freezable is that you must not hold locks. There is a
lockdep check for this in the code, but it would probably make sense to
teach Rust about this constraint as well, hmm?
