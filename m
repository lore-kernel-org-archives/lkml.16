Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93D392B9BF;
	Sat, 12 Apr 2025 12:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744461110; cv=none; b=VF0RHakPb2YuEObGLsXr8gvqosNd5UwsZLFPGTgwLmFV+3/v3+HNQA8SakgCf/J5El1F8Rk7O+nLLi0ckL2J7+ZF+8yvT6CNKaWj1LCbW54OuJIePtQaOYevX9N5NfVjfpzYJliHEyDqjV5gpVVhiphFg5DLwR5aqUssjGTpTRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744461110; c=relaxed/simple;
	bh=rZX4Zyea+eXzbeGCKFEyhYta6VERcVd68EFnZb63dtY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YxGmrBs62Whhk1STBpjNzItl4elyJ7Dvifl+hN8sELARqvf2Ngda5mKzGEPtIgQnWZTGprZMDf/paE2hYU08vX0v/pfVvvMow0uYZQth/vGmuxbm8IVlLtieqisLB5veEKdHAj6C9mcBxrgTx3dmAMi12XRZIRQkbeY2OTVDjTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Q1v1H7Bn; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Q1v1H7Bn"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=+FJkGd6MMxFZ51i06o0egOdee2ExwCA0tOOyUJfnegs=; b=Q1v1H7BnjFO20yUDi0ZVq0gvch
	9jsg5eXjMWIXp9JREWcY1qDdFE4KBH1nyK2m+OfKTDkg7hUn/Ppq+sc2IETT6d8YOVox5Ov9jqB0j
	xE8k0Rsh2mwQCfH1+AkjvI6NtWl//IC9ZGXcbUVGLbRb4LkRSBazAZ5XyRB+aJz/s1K6lJzzSZBZP
	H4/gKRn16ADp83e/H6ZAfHqfSlCOjslgqE1VHAfdybmhbUNMQzs9q9L801iFPI9R6pSV1YUIXk6QE
	fM7OsgiupoJlKUw8+AImpHftCg86ck8uTn5bEnjp1VfPJiweZlJLCdcnGJFU21LocTxROhIXzDA+a
	pV28mlxg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3a1G-00000005btr-3Zh6;
	Sat, 12 Apr 2025 12:31:35 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id A115730057A; Sat, 12 Apr 2025 14:31:34 +0200 (CEST)
Date: Sat, 12 Apr 2025 14:31:34 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: =?utf-8?B?UGF3ZcWC?= Anikiel <panikiel@google.com>,
	Kees Cook <kees@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Alice Ryhl <aliceryhl@google.com>,
	Nathan Chancellor <nathan@kernel.org>, x86@kernel.org,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	Josh Poimboeuf <jpoimboe@redhat.com>
Subject: Re: [PATCH] objtool: Detect __nocfi calls
Message-ID: <20250412123134.GA21670@noisy.programming.kicks-ass.net>
References: <20250410115420.366349-1-panikiel@google.com>
 <20250410123602.GZ9833@noisy.programming.kicks-ass.net>
 <20250410124526.GB9833@noisy.programming.kicks-ass.net>
 <CAM5zL5okN67bsTs6ZodcJd45zQ_BP+ruUwOkPMY97Snma0ugzQ@mail.gmail.com>
 <20250410132522.GD9833@noisy.programming.kicks-ass.net>
 <20250410154556.GB9003@noisy.programming.kicks-ass.net>
 <20250410194334.GA3248459@google.com>
 <20250411064449.GK9833@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250411064449.GK9833@noisy.programming.kicks-ass.net>

On Fri, Apr 11, 2025 at 08:44:49AM +0200, Peter Zijlstra wrote:
> On Thu, Apr 10, 2025 at 07:43:34PM +0000, Sami Tolvanen wrote:
> 
> > But an allmodconfig build reveals a few more warnings:
> 
> Sigh, let me go look at all that and address Josh's feedback.

Latest sits here:

git://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git x86/core

I'll have the robots chew on it over the weekend and then post on
Monday.
