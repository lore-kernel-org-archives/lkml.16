Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E7ED2857FA;
	Thu, 10 Apr 2025 13:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744290593; cv=none; b=DBxpQnTHr92DsEw/oeTFO1UdiugVTlZJ07QtFfBMS8X5c08IJbqrmTzgK7DnZbmhlI93kJLbQtyxul+sGMTGwi1ZUMHOkfsqKu2y+Le90HZ4XRZMEKUfRhA/OgQOxNCIFoha4+9hCNahrPXT4zDigGNFfUZ83Ua9S+xqNqzwIy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744290593; c=relaxed/simple;
	bh=XpF5AzT2dy0cpthIZ5eqxi3p0HxdB3suZzndg1za8XA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HriPIvpMIvU8aiEacPogAC2s9GED7ouUIDDInN/P360NqrNxI1SV7JiKUMmHyWR6amaY0tEmKSTbvn3vTYKfCcSpgToXTbZaNjwxyItDo/S5TBwS/YDVW+lkkjIzjweu953+O2nmkdt4mN/iabCVyA3MX5UMzkIUEwIunu+B31Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=GjxtBYEf; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="GjxtBYEf"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=safJ4H6fBnn2c0duhP0nKLcIeCGsFeCk0AWhMrWuTu0=; b=GjxtBYEffrCUYvHvl9e7zOIFSa
	MpNEbKpiHmqa4fRmkNvC2VR9229EFaXnX2ehw4OyIBXPpcescZI49zHgmr2lw/Q+zOmRX7mcQJaFb
	jLDE3VS2yUDr4egKNqm0hbsX0ygtI2qUkZfefbJKi85u0u34fF3zajnSShgxXoiWDroJvG58616V+
	g0IBj2ZZgU3AWngxtwHXfV2/Z4ZQ2qLXJZyIAFh/VVdzcPHwIRqpbYXsx6eSZ/VZgOBd0mF+SW3Xz
	Ej2FuCxnVZYWh6iL5Ha3kFootlMTj0lCsf0vgW2Kq3SyanwAmJxQ9hdvqzOdxzDTn5z4kgDqzINd/
	h0Z4pP2w==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u2rf7-00000008owm-2GiD;
	Thu, 10 Apr 2025 13:09:45 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id EA0C03003FA; Thu, 10 Apr 2025 15:09:44 +0200 (CEST)
Date: Thu, 10 Apr 2025 15:09:44 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: =?utf-8?B?UGF3ZcWC?= Anikiel <panikiel@google.com>
Cc: Sami Tolvanen <samitolvanen@google.com>, Kees Cook <kees@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Alice Ryhl <aliceryhl@google.com>,
	Nathan Chancellor <nathan@kernel.org>, x86@kernel.org,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH] x86/Kconfig: make CFI_AUTO_DEFAULT depend on !RUST
Message-ID: <20250410130944.GA9003@noisy.programming.kicks-ass.net>
References: <20250410115420.366349-1-panikiel@google.com>
 <20250410123602.GZ9833@noisy.programming.kicks-ass.net>
 <20250410124526.GB9833@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250410124526.GB9833@noisy.programming.kicks-ass.net>

On Thu, Apr 10, 2025 at 02:45:26PM +0200, Peter Zijlstra wrote:
> On Thu, Apr 10, 2025 at 02:36:02PM +0200, Peter Zijlstra wrote:
> > On Thu, Apr 10, 2025 at 11:54:20AM +0000, Paweł Anikiel wrote:
> > > Calling core::fmt::write() from rust code while FineIBT is enabled
> > > results in a kernel panic:

> > > This happens because core::fmt::write() calls
> > > core::fmt::rt::Argument::fmt(), which currently has CFI disabled:
> > > 
> > > library/core/src/fmt/rt.rs:
> > > 171     // FIXME: Transmuting formatter in new and indirectly branching to/calling
> > > 172     // it here is an explicit CFI violation.
> > > 173     #[allow(inline_no_sanitize)]
> > > 174     #[no_sanitize(cfi, kcfi)]
> > > 175     #[inline]
> > > 176     pub(super) unsafe fn fmt(&self, f: &mut Formatter<'_>) -> Result {
> > > 

Miguel, I cannot find this code in the kernel tree. Is this again
because Rust is not free-standing and relies on external code?

Can you please fix that. Building against external code that is not
under our control is a problem.

