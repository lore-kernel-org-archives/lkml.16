Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D78841B424A
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 18:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738954492; cv=none; b=G03jY5rbfPuluD1FD29REajSrUeEnEkBFws27n+8/HycUCKpFuH29XUcObShECk3fZxUtXYhEloq5tXHGb6nI43S+Utc5NXvFCIBlf0PIxWBQAwkSG/6I3e1F1ZUYsyBwxBp1o6DzIpgAYItlDuJ4JPDpDsE8NOaEbMCmbxcq2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738954492; c=relaxed/simple;
	bh=MnHRT7H1PcqAU+6uS4M7byeF+SBztGj7hBPPzl7MgNs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j2b1ddephJ0ciOuZFe4LtXLsxl0T2uwnZtFDbtB8LbztuzTLpjlNTv/QOcgB2XoHaP990t9g7yd6ExMKw0Pd5K//kv23g0Nesfa9Il4Je3D0CUiOY3HoOxzgn1SP2y16/uho86t+/MPI4FmkEanL1xISqEex0AwygUxjipTVkH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oHtxoKJ+; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oHtxoKJ+"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2f9b91dff71so3905200a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 10:54:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738954490; x=1739559290; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MnHRT7H1PcqAU+6uS4M7byeF+SBztGj7hBPPzl7MgNs=;
        b=oHtxoKJ+sue1dipSvuCcS4vJ7j3MhF2ZTgokvFrGqYo/r2lJ50xqzBCuEMM5xBV+Jv
         jNBOlhULuv79xpxXvJidaLs9vHZGkB672Dgn4ms8ZR0k87jOfYnd8uYPdR6dPoWjsjcg
         Prj8oIFdthCn7ECbQyyiUTAwohIuf1fYUjLk0MkgLWR4Oa2jHEFSVElVxNBkLNDXToq9
         y/L9wlBpIg/N3hixvfU04qqd628Q4IM4Y+XSjg669tTmdeHg6f9cfhbYriAAi6J2L6Ue
         17KVTyRNdJKIYXUrwT+btqWxrOCEru5m6YokElr/Pf0eribSVQbEtvAwd+aygqRz5gyg
         59MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738954490; x=1739559290;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MnHRT7H1PcqAU+6uS4M7byeF+SBztGj7hBPPzl7MgNs=;
        b=Xghld2/2i89UCTUZFgc9p1idWL2DakHEVZkCTlExx//Mtda4Tt7qdy4qH81NO0IPqW
         fWLJ0FvzjWGp9RHTjDWIkCnQJrwe/3s9ETrtZwcThxUKITLhE7dR1tvUhEn/kUmqwHdY
         6XOZt7RL3Das0lNj3EoYUltueqETcG07dU+ahnLOGru2DOXS2fJD/SpiImcSmigAwrJW
         cLXtrfiWCEDZdlM8BpzEaVAdVo8cFksX2y4MXt5y2N51y13L9H5db6yqj3+Vpcp7mbNq
         ZQ2hKfny208HBKELz7NThPcwn1XG27y3/pVu5St+GYxCWQ6jkWuKtYv9ZzLkJ1ITzbYX
         4s+Q==
X-Forwarded-Encrypted: i=1; AJvYcCU3pJTyyuvr+dgMpQOiFRQJhcC+OW9OrbOn0AcsCr2kx2IBl6ZchdnpCYdMsaXOQ5UHWri4QLBjtj5hwps=@vger.kernel.org
X-Gm-Message-State: AOJu0YyW2P09GD3frmXEd8eeph2I3Tz4c8O+hjzmIx1qgm+zf+3g8D6s
	R9oLu0/8e2rJtQh1uVyLpiPO64PXUwfVm2blten4xTZvFwCNf+0eZbn+uBlyxQSf99wFk/v17VM
	ThPSmzzolvzW8gpEdHnFe/da5TADFlJHYtW7T
X-Gm-Gg: ASbGnctTWGQ7x9YJsDOZfoeStBZokLAFp/gPz3kr52oerU/ZtGC8JVO1oBR7McV3iTY
	hXxtKeKeVFsiQAJc2LTv9zUAMWVhFxmeQ6YLVyfRgUvc0drlHaKAUNKgH4fh75eL4aN+rbvFrZg
	==
X-Google-Smtp-Source: AGHT+IFMvJA4cgN7hpWX/RJYNyou+xpCXmQ0vPeH1gn+6tHzaAur6XesjwE6f7O/GeuvHzAnXlt924KCLavI0zXs06c=
X-Received: by 2002:a17:90b:48ca:b0:2ee:3cc1:793a with SMTP id
 98e67ed59e1d1-2fa243ed769mr6059928a91.29.1738954489852; Fri, 07 Feb 2025
 10:54:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250206175114.1974171-1-bvanassche@acm.org> <CANpmjNOsf1RnYJuZ7pmWVYNqVYMYe+eTL0vhDKU5sLihR9fN-g@mail.gmail.com>
 <90c7a807-b0a0-4b42-866f-f74c5d1c62e5@acm.org> <20250207084223.GX7145@noisy.programming.kicks-ass.net>
 <Z6XM6zjK3mtqYfan@elver.google.com> <20250207090827.GZ7145@noisy.programming.kicks-ass.net>
 <94fa4f05-929f-4be8-b2d1-0277826984b1@acm.org> <CANpmjNNX072Uz+XCOuXwF6u8dHHkv+Wv=mN4mtV34AUS7E3Ozw@mail.gmail.com>
 <fa9245f4-c84f-40ea-8a5c-b1a31fee7525@acm.org>
In-Reply-To: <fa9245f4-c84f-40ea-8a5c-b1a31fee7525@acm.org>
From: Marco Elver <elver@google.com>
Date: Fri, 7 Feb 2025 19:54:13 +0100
X-Gm-Features: AWEUYZmO7kF1i5OS8xq9gtZ04dy87giLDSG1L6EJCwDaYh3USft8uU_cJlcoVoQ
Message-ID: <CANpmjNM3sWct9FXM42JeTk_VKqxQS5FSc7_zZH6Qzgv2tx44_w@mail.gmail.com>
Subject: Re: [PATCH RFC 00/33] Compile-time thread-safety checking
To: Bart Van Assche <bvanassche@acm.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Will Deacon <will@kernel.org>, 
	Christoph Hellwig <hch@lst.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Nathan Chancellor <nathan@kernel.org>, Kees Cook <kees@kernel.org>, 
	Jann Horn <jannh@google.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 7 Feb 2025 at 19:35, Bart Van Assche <bvanassche@acm.org> wrote:
>
> On 2/7/25 10:24 AM, Marco Elver wrote:
> > On Fri, 7 Feb 2025 at 18:46, Bart Van Assche <bvanassche@acm.org> wrote:
> >> As an
> >> example, the Clang try_acquire_capability function attribute does not
> >> support functions that return pointers although this is a common pattern
> >> in the Linux kernel. I think that introducing a new function attribute
> >> to support functions that return pointers is a better solution than
> >> trying to annotate such functions with any of the existing Clang
> >> thread-safety attributes.
> >
> > try_acquire_capability / __cond_acquires(cond, capability) is happy
> > with pointer-returning functions when using int-literals for "cond"
> > i.e. 0 or 1 (Clang's documentation says it only wants bool, but that's
> > wrong). I just tested this on a pointer-returning function, and it
> > works.
>
> The first argument of the try_acquire_capability function annotation
> must be the value that indicates that the capability has been acquired.
> I'm not aware of any function in the Linux kernel that returns a pointer
> and where returning a NULL pointer indicates success. Additionally,
> return ERR_PTR() is used widely. Neither pattern can be annotated with
> try_acquire_capability today. This is why I wrote that we need a new
> function attribute for functions that return a pointer.

The static analysis doesn't care about the precise value. If a
non-null pointer indicates successful acquisition, then using the
literal "1" works. ERR_PTR() is a problem given that non-null may
indicate error and success. Type-safety of ERR_PTR() is debatable, and
by that fact alone it's unclear to me how to teach that to the static
analysis, because it doesn't operate on concrete values, but an
abstract state. In this case, it just cares if the branch was taken or
not based on the value of a try_acquire_capability-annotated function,
and the hint on try_acquire_capability tells it which branch is the
one that will have the capability acquired. Code is around here:
https://github.com/llvm/llvm-project/blob/5a0075adbb623c8661862b9af1272b8f430d9e5c/clang/lib/Analysis/ThreadSafety.cpp#L1381
