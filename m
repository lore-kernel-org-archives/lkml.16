Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C082228153A;
	Thu, 10 Apr 2025 13:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744293440; cv=none; b=Twb53dQBxse214GYjzJVHrC/2hxrHyKlquL+dZSR7ZusDuMPVkkVjES6KMbG7VkYbE648iqmMu6zjeNS/9kIfmCEBfaaLjb0XIqPZ5KCBRzdid76Z0pjmqhaiYx2ABddSK2vW6CJNKpKflvrlRL74tAPkeOS0H/vVAkJv0UXxRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744293440; c=relaxed/simple;
	bh=Xkf0g08TDTNDHdxrN01fmyVJSboPOW59mEl6Jc3wEKQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p5bxoL7hOtkkWGx0gsqu84aK+/lmYw+qXRnAFIIk0olN6qwHIlmwCd5ghxWI5zYikbjDNoXHvlPlhbr/xxabvAw6/f4qdCG23u0YLXFXpJw65RZDGQ8a9Ge0px2Zf8114ckdaHqsxVnjlY5aNep2w120hO16G0vHB6ldmaSwnGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=ORzpxAz1; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="ORzpxAz1"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=NVLNPGXk7BycuGL3nUuA/yX+WwBqSc35X9rx8yV+13Y=; b=ORzpxAz1UFDmLAIFACS1v0hVlt
	MpdcGqVMD64Wh5hLehEz1dzwVRfup1KFqFLJRTdYcIwDYRJUQVVj3XsoPrmKuyx1yu+qg0WKd6+dp
	wLLSORGK9RfkDj1H0jgFeXxIyRB1gk3XwZ+R+vLGBLgaJmoxrHVAxDE+dPneJupTqbyK5iZcuuKM6
	Q8x+ZrtE3TzAbUDrukRYadyuEDFRxpYDBLFdSb/2zkVR2mTA6EJN36NFZfLu7yZK9aMGwIR24VrFB
	difCZPVXn8lPCcYpJSepRrdeppJUL4eCr8GxFNO73iVxlKB2JnxYSqWkaLTnQhwaf0wW8N4MCzxH0
	/xXFDBhQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2sP2-00000002y6o-3OQO;
	Thu, 10 Apr 2025 13:57:13 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 0FAE53003FA; Thu, 10 Apr 2025 15:57:13 +0200 (CEST)
Date: Thu, 10 Apr 2025 15:57:13 +0200
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
Message-ID: <20250410135713.GG9833@noisy.programming.kicks-ass.net>
References: <20250410115420.366349-1-panikiel@google.com>
 <20250410123602.GZ9833@noisy.programming.kicks-ass.net>
 <20250410124526.GB9833@noisy.programming.kicks-ass.net>
 <20250410130944.GA9003@noisy.programming.kicks-ass.net>
 <CANiq72=k+tZ3ACEB5k9qwJ8ZYu-dXkA3=Lisg1b8ze-2D0STog@mail.gmail.com>
 <20250410132649.GE9833@noisy.programming.kicks-ass.net>
 <CANiq72=Q_Z8KfV+n4z9wWVJsZwVevag=Vh3URe71XkUuWuqEDg@mail.gmail.com>
 <20250410133446.GF9833@noisy.programming.kicks-ass.net>
 <CANiq72neZj+ESvkxwXAQFnznwYBiQAcpW4OqXg1ckhxZj3fd4Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72neZj+ESvkxwXAQFnznwYBiQAcpW4OqXg1ckhxZj3fd4Q@mail.gmail.com>

On Thu, Apr 10, 2025 at 03:54:32PM +0200, Miguel Ojeda wrote:
> On Thu, Apr 10, 2025 at 3:34 PM Peter Zijlstra <peterz@infradead.org> wrote:
> >
> > Anyway, given this core nonsense is now CFI unsound, it is no longer
> > suitable to build the kernel. So either refrain from using part of the
> > core that trips this, or get it fixed asap.
> 
> We discussed it a bit yesterday. Still, until it gets resolved one way
> or another, we should be avoiding people to build the kernel like
> that, no?

Remove the offending Rust code? Afaict from this github issue, it is
just some formatting nonsense. Surely code can be adjusted to not use
that?
