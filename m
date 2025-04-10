Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDCF642AA3;
	Thu, 10 Apr 2025 13:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744291616; cv=none; b=rbGvWvi3GqjK5pwWDjZH/7DiDyfBQ6AauoSvJVwisPJZxPpaEilAc5qL32IC1acJ7ntYUY4Bn9Y4gjerwKRTFDwDeprPgcp9tio2iPgTPMFLB0sVKycZWbVEmIGxHV9whgfN7RtfjQs8yNUWPihfxog72vErEytEHu46+0Gf9xU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744291616; c=relaxed/simple;
	bh=vha9RvD+jrGpA+gT39LVe9KUu5+auwyt0Lqicb2Gvm8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CxGEos+6BP/ch71XHSJii/BjUhFm5y0URBLjJcz9BWx9Zeeky09SnL7QHwbdH8z0S/rxZc3+QnNG5hSyX9ZmyOYnBFpDWVll/bkZueQt6i8o+/rSBrmoqw6Sm16lhm6tjLAQNe0llS468GJoQEELkyXkjdYHHWi0i7JnuFIOuk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=JJm3lijM; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="JJm3lijM"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=6jSo/Kt0RTFpusF5l1at9mpmfBHUXehIWySf6HuLvMM=; b=JJm3lijMBG51H3og5ZZFxbiWNU
	taYgDfDpCWIyA/zARs/XURqT1ycQ3U3tLY1HHevWj9BSiTVMUuEkX081nDDVa6GTiLxXlBC9QPRcD
	Bd+JmAmkdvuAtEHBZ66JMxszizGV/ppaPQTOiIFrLDUop2efnvpgr4JE5MHgsMcr72Z18F0nqleRk
	Cn4bohIwxLxyPdCxmRVX5xGBSCWsqawrJmZ3PyQsBI/+ZZAWxU4qffmBRJMJZkzzpJp5hT5etUk01
	ytQ/y6WuwiHkQYKg4PLTTXy5GQfn1McvROv+hjjWRiUr/zzLUpLvJt6ZMQhG7Cg3R21yv/Ltbll7T
	cm+y2xAw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u2rvd-00000008p9x-2D0J;
	Thu, 10 Apr 2025 13:26:49 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 0CE773003FF; Thu, 10 Apr 2025 15:26:49 +0200 (CEST)
Date: Thu, 10 Apr 2025 15:26:49 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: =?utf-8?B?UGF3ZcWC?= Anikiel <panikiel@google.com>,
	Sami Tolvanen <samitolvanen@google.com>,
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
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH] x86/Kconfig: make CFI_AUTO_DEFAULT depend on !RUST
Message-ID: <20250410132649.GE9833@noisy.programming.kicks-ass.net>
References: <20250410115420.366349-1-panikiel@google.com>
 <20250410123602.GZ9833@noisy.programming.kicks-ass.net>
 <20250410124526.GB9833@noisy.programming.kicks-ass.net>
 <20250410130944.GA9003@noisy.programming.kicks-ass.net>
 <CANiq72=k+tZ3ACEB5k9qwJ8ZYu-dXkA3=Lisg1b8ze-2D0STog@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72=k+tZ3ACEB5k9qwJ8ZYu-dXkA3=Lisg1b8ze-2D0STog@mail.gmail.com>

On Thu, Apr 10, 2025 at 03:21:44PM +0200, Miguel Ojeda wrote:
> On Thu, Apr 10, 2025 at 3:09 PM Peter Zijlstra <peterz@infradead.org> wrote:
> >
> > Miguel, I cannot find this code in the kernel tree. Is this again
> > because Rust is not free-standing and relies on external code?
> 
> Yes, this comes from the `core` standard library. If it requires a
> change, then it needs to be fixed upstream.
> 
> > Can you please fix that. Building against external code that is not
> > under our control is a problem.
> 
> The only way to fix it would be to vendor the standard library, for
> each Rust compiler version -- and there is one new every 6 weeks.
> Thus, quite a few copies of it. Or keep patches (one per version) that
> we apply on the fly.

New compiler can't build old core?
