Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3245849C
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 07:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751269792; cv=none; b=s85VyubQSHNhPI0IAaG9IGcCdVqe4NT7KfwC7OD/3T5O67YGs/KsWqRvHFoKPtH5RSdF7dTf8ptfeBY7HZIbkPm66cnzLcGEgcoXu/XqAH1P8kXNE59YdCPtfjwHQOcfO79fcLthz7DpuHZ1xjNoPNVMily8rn4qExmBWwnP8HY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751269792; c=relaxed/simple;
	bh=jg211Mox4ogn3OGNwnvBYTugy0iLOS2ZtfUU2JwxfPY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tjek7xpYx7yW6i9TJwp77gXFbGXzSa6M5qWeHTp8VLuEyfw3YGJNlEeEVsneOoInDRkdtABhFb1qnc/FV15RCEkBZNHO2mKyYUzsMRVPo2mQzqcdhavWNWamPxpb68EI9h8FM2TgFUL3ZQBVnvpE637igZgKHPwktcldKeBjL40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=i/3qzLN5; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="i/3qzLN5"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=l3fYRR450ammdDlTOiwajM+tXSXrmrYjTa8TBG4lRN0=; b=i/3qzLN5vV3pv40SYcFnPmDz5U
	aTDvzmPcXciZCgSXlmQ/J5VpmC4ZgDoeoC314vbEMqesoDrWpSjq3XiL3CjSTRgt02qS3Ic5k888+
	KGRW5z1wNbasAQzokmZ6zqvJtSJwKuHCRXE1qD3yh4rlgzmlMFA0MCS+XsskK6CzVrfk9oWFBbSiW
	pJZC1UHPes7/tKgo2YuIxtXt/nVxu4kL1n73UvLYqDmYytoe++cgj3ixcXYdY1Qq3XQ8lCD6O33m3
	CpjSpGmZn/Ly5DWgJIAh/u0+AasU3HO5m8px+YhQ7GDO9tm02QcuzPkr/CV2dXgjfQHduFvz/Ov6+
	g8mAkAqQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uW9Gp-00000006k7R-0910;
	Mon, 30 Jun 2025 07:49:43 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 96703300125; Mon, 30 Jun 2025 09:49:42 +0200 (CEST)
Date: Mon, 30 Jun 2025 09:49:42 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Alexander Potapenko <glider@google.com>
Cc: quic_jiangenj@quicinc.com, linux-kernel@vger.kernel.org,
	kasan-dev@googlegroups.com, x86@kernel.org,
	Aleksandr Nogikh <nogikh@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Dmitry Vyukov <dvyukov@google.com>, Ingo Molnar <mingo@redhat.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Marco Elver <elver@google.com>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v2 06/11] kcov: x86: introduce CONFIG_KCOV_UNIQUE
Message-ID: <20250630074942.GH1613200@noisy.programming.kicks-ass.net>
References: <20250626134158.3385080-1-glider@google.com>
 <20250626134158.3385080-7-glider@google.com>
 <20250627081146.GR1613200@noisy.programming.kicks-ass.net>
 <CAG_fn=UrOBF=hQ5y6VN9VuA67GeVOyaaWtrnaSLz4TnC7u1fiw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAG_fn=UrOBF=hQ5y6VN9VuA67GeVOyaaWtrnaSLz4TnC7u1fiw@mail.gmail.com>

On Fri, Jun 27, 2025 at 04:24:36PM +0200, Alexander Potapenko wrote:
> On Fri, Jun 27, 2025 at 10:11 AM Peter Zijlstra <peterz@infradead.org> wrote:
> >
> > On Thu, Jun 26, 2025 at 03:41:53PM +0200, Alexander Potapenko wrote:
> > > The new config switches coverage instrumentation to using
> > >   __sanitizer_cov_trace_pc_guard(u32 *guard)
> > > instead of
> > >   __sanitizer_cov_trace_pc(void)
> > >
> > > This relies on Clang's -fsanitize-coverage=trace-pc-guard flag [1].
> > >
> > > Each callback receives a unique 32-bit guard variable residing in the
> > > __sancov_guards section. Those guards can be used by kcov to deduplicate
> > > the coverage on the fly.
> >
> > This sounds like a *LOT* of data; how big is this for a typical kernel
> > build?
> 
> I have a 1.6Gb sized vmlinux, which has a .text section of 176Mb.
> There are 1809419 calls to __sanitizer_cov_trace_pc_guard, and the
> __sancov_guards section has a size of 6Mb, which are only allocated at
> runtime.

OK, that's less than I feared. That's ~3.5% of .text, and should be
quite manageable.
