Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6156D256C8A;
	Thu, 10 Apr 2025 13:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744292093; cv=none; b=B+FEu9PALWWSdN5GETmqM2sXtv5Sy9UnxCDhP5xU4KcSoxIL4rZMmdozxXYN7KM/5qqdbuCFKpfxikM4OIZVfp0LKtZsGsHSxRVwVTIlwsVQP13CN7ZDpuELbwFtcMgjwV8roA/SQfKDiQAwK/JnRXsgOjmgt/ExL5MpHMGo95k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744292093; c=relaxed/simple;
	bh=oIVHQpZrU0GIVvUbXQf1TawW+ylvSwo8qs9CJLv3Ses=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qy6ZACYk8mJot3nIyEtlsKO5PEaVCNWIp1oF38QM2vG/3qjp5ZFr1kzu4BKQP0ZA4dfUX4ELucwKPcY2CZpzu74MzGYSDxIZ2IpjhE3N/8zLXTKWZ19z0zch9+F1FKW9mCSLcjC3Jdsw2j2sIiXYmUV8Je2QqNFefZgFKg/kJsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=UtRI9bPo; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="UtRI9bPo"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=bsa+Z97SuQmDFJVBQXtB/41eJGaLuAcBg3ekRY+IwSU=; b=UtRI9bPowXy8786YVylYk72F1O
	utJPkDLIujAvlPBi1qRIfX/w4uivsdAsqzhizvcYNxx9qtTIqpGwVHkiqyrem4udxPlOrYvo9VpZM
	xbhTKAvfhAgOmA0k3YX248nj8sdSBP3kY6GXdvs8NZNN5BOO9qoFaN9o8qfTE5txBOngwCIR6A5kO
	q6mQK9inuEzBKHNc+EbiH4aZQEHu5rKrdqRD6ROKAPnYbV9wQcJLFfdGCPtL74HFs1z9ckVWabVwa
	RE09JDCu4GnM/Td7riaa6Qhm/KUunOb4ZQsCFNKsePnwe6/8DVU0CNQ04FHf0D4jgImcWXoSqinMC
	7rCiC/Rg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2s3K-00000002wdL-1KH4;
	Thu, 10 Apr 2025 13:34:47 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 81C453003FA; Thu, 10 Apr 2025 15:34:46 +0200 (CEST)
Date: Thu, 10 Apr 2025 15:34:46 +0200
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
Message-ID: <20250410133446.GF9833@noisy.programming.kicks-ass.net>
References: <20250410115420.366349-1-panikiel@google.com>
 <20250410123602.GZ9833@noisy.programming.kicks-ass.net>
 <20250410124526.GB9833@noisy.programming.kicks-ass.net>
 <20250410130944.GA9003@noisy.programming.kicks-ass.net>
 <CANiq72=k+tZ3ACEB5k9qwJ8ZYu-dXkA3=Lisg1b8ze-2D0STog@mail.gmail.com>
 <20250410132649.GE9833@noisy.programming.kicks-ass.net>
 <CANiq72=Q_Z8KfV+n4z9wWVJsZwVevag=Vh3URe71XkUuWuqEDg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72=Q_Z8KfV+n4z9wWVJsZwVevag=Vh3URe71XkUuWuqEDg@mail.gmail.com>

On Thu, Apr 10, 2025 at 03:27:55PM +0200, Miguel Ojeda wrote:
> On Thu, Apr 10, 2025 at 3:26 PM Peter Zijlstra <peterz@infradead.org> wrote:
> >
> > New compiler can't build old core?
> 
> No, that is not intended to work -- `core` is tied to the compiler.

OMFG, you just gave me another reason to hate on this rust-bucket of a
language :-/ What language can't even build an old version of its own
runtime :-(

Anyway, given this core nonsense is now CFI unsound, it is no longer
suitable to build the kernel. So either refrain from using part of the
core that trips this, or get it fixed asap.
