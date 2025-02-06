Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1B711A0BCD
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 18:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738866072; cv=none; b=eV39tWGPhmYpYzc+OjVD8G3I7Jan5VEu4x0ZvPLTMZIv329+Lpu1nfivYTz8oiI3sDX1+LVSAfU5FrncoS/2kf45Ov/ZzGu59+zvoaOy23HUDpBgSbz4w/IwjTwZFOo7wQedkNmrvQFSIS0bTU1cavXe1EiFX7MomrHlijJDtoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738866072; c=relaxed/simple;
	bh=GBkKU/+bQURoxgp6Zoytw5z8AfNjuNQuknWdS5w+LXw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JvSuaxXwalEMcSEO9FR0iRuWGYntqJJMvFLNL1w4GxA66ToJRDrlN7hisJCdz7WDCexL6nUe8h4lav85Yx3M21btZU+sDaBCNZ1n2FtMLh3wRrqwjgbGfYTuskiGoGiXyUsKPmsVhVDZAv08Gutu8NbJlDDppheC+jTxvgrcow0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Mmt07/15; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Mmt07/15"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2fa21145217so365266a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 10:21:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738866070; x=1739470870; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lIC3rdmRT7jhxgJsccjK3RI6qko+VABF2RUjwwnolh8=;
        b=Mmt07/15Gl0EMQvFy8PMkEJAAcLFQVBwXAxbWXayjNlgau2V6M5V9zYxlwQUh4X0zN
         +qpz5/AWv4mkPgdMOUEqsLPtg/rn+/Gk5GsPz1XoXhc/Gk5Aps25e2c71XfFp9loeVub
         a7gtFx7CAU66UltKSDoeursJ0XTIp7D9B2lDcPNgUxHg43s6bip/I48kjaEvzb1VxkCm
         RaOsGcWxUs8wE4NG/nFVcwSIWxiyDGgqxyn2oysZ6VvtvkzzF/HWCLs839njQV6kzk5K
         QlBHUiPa0TKRnK0k+WDndBroFhp/Jc8Xe1t6GdO/owULO47m/M8Hrw8y2Fy/cd9naBb7
         tTpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738866070; x=1739470870;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lIC3rdmRT7jhxgJsccjK3RI6qko+VABF2RUjwwnolh8=;
        b=fbJYvDvGxg3SlSyPknMmNcuDXFDuynvUh4Ig22F+nj0V6+ENXibb3RFEPZXTPBl5ck
         cbRas6mpteIeAz2BBq6QhOOLvJ3WeysGZoN/JdX8QLbzL9b53avYtjQ+9YX3086tFZ+l
         cK7uvl+aOPsx+phI6XwU3ahUmestfIGyvy+r0Xm1TgdtOl6yeX6imYt+P5L3+R0rIzZ7
         qhrjv6976BD1QMq2Khh1ZWqdQO36Y80QoXldpI8rU3SC3SDN2pXd1w8+Qi7vvIzN0jaE
         V8d7pM0fgGg8Ex/FAQLL0JpKJQoyQxsOy/0+exgSodvbQFqjUKb6gRMeQZrxn+a9Y2E8
         4llg==
X-Forwarded-Encrypted: i=1; AJvYcCWm6eG7Ih7LJfqpNMC4jOEF04Tip2gOCVlYfEh0L2bZ9JeJIPTFcdcpKnseZJk3hILxVtRl7cHmAVO5ZgQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDxfSSwOMWKrHrqAPOrpAdLzj1JCHtHZdf4wE6Wo10sG05skYs
	t+Fg9LGSr+da0SAaZiylEkXnNBjfn4uJRjCKFN53MHyLlgYSnQzQq9f+7BVlToZDKJ7RT2wOwjx
	PrLpJBppU5JHetTkL6etvbp8lyyX9AyuTP5kqBUHPBwod6SJguMW2
X-Gm-Gg: ASbGncvRhQ+2mI4zR5bDk1rI0jZszLinuBmF22EHPsIQcuc0liLYoDIF9P72gAHSxZI
	fr+nnrCgDItk4aWGwP/6RJ88k61gp1ecR7vAelGmeBAznjnquI+uDm+1jBaMQcXdtQf0V+LQyD9
	uaqjnf4s6G40fdP2y500M0/WR46Iw=
X-Google-Smtp-Source: AGHT+IHpdLEs7lIDUITs8DK39SLCmtOnq06csMHKO9kOcXEELjxh4xi9W3tizSzYNkrxR01s/PoKx3FdHtS2wTj7PZI=
X-Received: by 2002:a17:90b:350b:b0:2ee:aed6:9ec2 with SMTP id
 98e67ed59e1d1-2fa24067e2bmr60987a91.14.1738866069912; Thu, 06 Feb 2025
 10:21:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250206175114.1974171-1-bvanassche@acm.org>
In-Reply-To: <20250206175114.1974171-1-bvanassche@acm.org>
From: Marco Elver <elver@google.com>
Date: Thu, 6 Feb 2025 19:20:33 +0100
X-Gm-Features: AWEUYZm6aJy0j90mgQEgZDVCP-7TWQy-d55-E93asjEkOkEjIydGfdFLzqg34Dw
Message-ID: <CANpmjNOsf1RnYJuZ7pmWVYNqVYMYe+eTL0vhDKU5sLihR9fN-g@mail.gmail.com>
Subject: Re: [PATCH RFC 00/33] Compile-time thread-safety checking
To: Bart Van Assche <bvanassche@acm.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Will Deacon <will@kernel.org>, 
	Christoph Hellwig <hch@lst.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Nathan Chancellor <nathan@kernel.org>, Kees Cook <kees@kernel.org>, 
	Jann Horn <jannh@google.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 6 Feb 2025 at 18:52, Bart Van Assche <bvanassche@acm.org> wrote:
>
> Hi Peter,
>
> As you may know the Clang compiler can perform certain thread-safety checks at
> compile time. This includes checking whether locking calls in a function match
> the function attributes and also whether annotated structure members are
> protected by the synchronization objects declared with GUARDED_BY(). As one can
> see this patch series includes a significant number of fixes for locking bugs.
> All these locking bugs have been discovered by the Clang thread-safety checker.
> I think this shows that it is useful to enable compile-time thread-safety
> checks.
>
> The Clang thread-safety infrastructure is not new. Some user space code in the
> kernel tree already uses it. See also the header file tools/perf/util/mutex.h.
> There are other projects that started using this infrastructure a while ago,
> e.g. Qemu. The header file include/qemu/clang-tsa.h was added more than two
> years ago to the Qemu project.
>
> This patch series has been posted as an RFC because at this stage my goal is to
> gather feedback about the following:
>  - Whether or not to enable compile-time thread-safety checking in the Linux
>    kernel.
>  - The names of the macros in header file include/linux/thread_safety.h. The
>    proposed names come from the Clang documentation (ACQUIRE(), RELEASE(),
>    REQUIRES(), ...). In the Qemu header file for thread-safety support these
>    macros have a prefix (TSA_ = Thread-Safety Analysis).
>  - The changes made in header file include/linux/cleanup.h that support
>    annotating constructor functions with function attributes.
>  - Whether or not to split the two treewide patches in this series into one
>    patch per kernel driver.
>  - How to merge this patch series. The second last patch in this series modifies
>    888 source files. If it is split into one patch per driver, this patch series
>    will become too large to be posted as a single patch series.
>
> Annotating struct mutex is a first step. Once struct mutex is annotated, driver
> contributors and/or maintainers can annotate structure members with GUARDED_BY()
> where this is considered useful.
>
> There are more synchronization objects that can be annotated with thread-safety
> attributes, e.g. spinlocks. This patch series only annotates struct mutex
> because annotating other synchronization objects too would have made this patch
> series too large.

Thanks Bart, for posting your approach.
I will also discuss my approach, as it will give everyone a clearer
picture of the design space here.

Bart and I have concurrently been working on this feature, and only in
recent days learned we both have been working on bringing
-Wthread-safety (aka. Clang's ThreadSafety Analysis [1], aka.
Capability analysis) to the Linux kernel. I have heard there have been
prior attempts, but only recently did Clang make -Wthread-safety
properly work with C code [2].

[1] https://clang.llvm.org/docs/ThreadSafetyAnalysis.html
[2] https://github.com/llvm/llvm-project/issues/20777

However, we also realized there are 2 ways to bring this feature to the kernel:

1. Tree-wide all-or-nothing approach (this RFC). Adding support for
more "capabilities" - initially primarily synchronization primitives -
becomes incredibly hard after the first capability (currently "mutex"
only). This approach comes with all the known caveats of adding a new
tree-wide static analysis to the kernel.

In fact, what it really is, is yet another dialect of C with a
"capability system", with its own constraints. I dislike Clang's
naming and the notion this is about "thread safety only" - it's not.
It's a simple capability system, that can do much more.

In that vein, because we can't change the programming language (even
if from one C dialect to another) of the kernel overnight, a different
approach might cause less friction.

2. A selective, incremental, and much less intrusive approach.
Maintainers of subsystems opt in their modules or directories into
"capability analysis" (via Makefile directive
"CAPABILITY_ANALYSIS_foo.o := y" or "CAPABILITY_ANALYSIS := y"). Most
(eventually all) synchronization primitives and more capabilities
(including ones that could track "irq disabled", "preemption"
disabled, etc.) could be supported.

A prototype of approach #2 can be found here:
https://git.kernel.org/pub/scm/linux/kernel/git/melver/linux.git/log/?h=cap-analysis
Here's the RFC:
https://lore.kernel.org/all/20250206181711.1902989-1-elver@google.com/T/#u

Combining approach #1 and #2 may somehow be possible, but it is
currently eluding me. Clearly, based on the bugs that Bart found, some
way to do tree-wide analysis is very useful!
One idea was to have "capability-selective tree-wide analysis" (such
as mutex only) be controllable via a Kconfig option - the
implementation of that (without excessive ifdefs sprinkled
everywhere), however, most likely requires compiler support.

Depending on the feedback that results from these RFCs, I think we
will be able to plan better which direction things should go.

Thanks,
-- Marco
