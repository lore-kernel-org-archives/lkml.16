Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D298C28A419;
	Thu, 10 Apr 2025 14:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744294544; cv=none; b=XH5M54IBVONm3Qq609nx8DYIv7HAWyQmShPI4XJo9dN3LqtoxkeUG7bOZ/LYb3Y1YFAJ6hva65ewDWfWFHEOWGdXQGgE2x2nN9YzYfG7rxXfLW5wHx1ho8Hor3tG0R6y9T8VVukljnzFTRLo5RGDTq/XJ9+bHqhriSy5O9ddh/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744294544; c=relaxed/simple;
	bh=RaMoWGFk03c3puhNHuxcFPKr4IRfqQwGIHBNnz1Cvss=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MnT23s6qBbq7eykEmY0462YVuZWNEj8GgW6ClBI/U5uZBILpJbbbd1B/1XtsovLvNms9pwDBtCWHW4GCBoiH00ZhLd2wXpmDw3KSShhP2s0viuGfb2GYjOrzDtC5QGyJgY0lkyHnP5rL0SAFrGSmIL3pWA9pc9BvTtoCzAtYm/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Dtq89Gfc; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Dtq89Gfc"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=IPaxMyrvmBEc8ZCZfoCnd8HYt5HVEPzhD/euEmF0jJ4=; b=Dtq89Gfcp80KjjXZr1iSc3xpad
	TIyLcc7LtX0ppcZbxX0yzvqSpXooNUgsSvxlCvmpnPRpJAv/x1dbUl7rjMRNrGcucdRZlOz6HREBI
	9E3B4noHqNEBoiJJlZIWKfxJMnJk7ekexF0Pha14QJjUymjE7kfvTJB2MMDaUnkYMCDk24JWneyw6
	pXmrDvpV1XAqTAHiHismCVKgCeizAZtglRBmYmnAjFWZ5VGcwWUJaqE1Pv0nvNInGrz/ZXjs0yvM7
	y0kZiM/nSsyWIgcXI9B3qAZwQHQtyi4UVL9GMtl+7YaMlrtkhwNzuwA3I/DVpc4jLyaOkzFdxyEvr
	Lpo9DurQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2sgo-00000002zQx-2wVg;
	Thu, 10 Apr 2025 14:15:35 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id DF99B300717; Thu, 10 Apr 2025 16:15:34 +0200 (CEST)
Date: Thu, 10 Apr 2025 16:15:34 +0200
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
Message-ID: <20250410141534.GI9833@noisy.programming.kicks-ass.net>
References: <20250410123602.GZ9833@noisy.programming.kicks-ass.net>
 <20250410124526.GB9833@noisy.programming.kicks-ass.net>
 <20250410130944.GA9003@noisy.programming.kicks-ass.net>
 <CANiq72=k+tZ3ACEB5k9qwJ8ZYu-dXkA3=Lisg1b8ze-2D0STog@mail.gmail.com>
 <20250410132649.GE9833@noisy.programming.kicks-ass.net>
 <CANiq72=Q_Z8KfV+n4z9wWVJsZwVevag=Vh3URe71XkUuWuqEDg@mail.gmail.com>
 <20250410133446.GF9833@noisy.programming.kicks-ass.net>
 <CANiq72neZj+ESvkxwXAQFnznwYBiQAcpW4OqXg1ckhxZj3fd4Q@mail.gmail.com>
 <20250410135713.GG9833@noisy.programming.kicks-ass.net>
 <CANiq72=uj3G8ibnzpuYzhY=7T5xrBBPoeuAX7X-iBKdN+crQUg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72=uj3G8ibnzpuYzhY=7T5xrBBPoeuAX7X-iBKdN+crQUg@mail.gmail.com>

On Thu, Apr 10, 2025 at 04:05:54PM +0200, Miguel Ojeda wrote:
> On Thu, Apr 10, 2025 at 3:57 PM Peter Zijlstra <peterz@infradead.org> wrote:
> >
> > Remove the offending Rust code? Afaict from this github issue, it is
> > just some formatting nonsense. Surely code can be adjusted to not use
> > that?
> 
> If you mean not using the formatting machinery from our side, then
> that is a major change -- we should just fix it upstream, really.

That is what I mean, yeah. I've no idea what is or is not common in
this rust code. It still looks like line noise to me :/

But given that FineIBT isn't at all new, I was under the assumption that
this was some shiny new rust driver that did something that hadn't been
done before. And it could now not do that.

> If you mean fixing it upstream, definitely, but we should still
> prevent people from building an invalid kernel, i.e. when Alice's PR
> or similar lands upstream, then we can relax the `depends on` based on
> the Rust version (which is something we have done for other bits).

So why wasn't any of this a problem when Rust enabled kCFI? Surely the
testing back then included FineIBT. That has been in longer than rust's
kcfi support (integer type confusion etc.).
