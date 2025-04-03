Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7487419F416
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 20:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743711343; cv=none; b=rl2eCOrE2QRZD6Jke/9pdOpYnKeFLoXwwWdgjvKpS/0Y15DHVEIT7xehUl76qLcmgot5TLCc0rP+/+GdhDKPN/hDBnRf2po+8/O4JsxBA65RRkdf09/0WJOnPLW0OEW0RxqIxVH6jAPOYUnMHUU9Nx41vLIgO0z562kgrdcuYIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743711343; c=relaxed/simple;
	bh=7wlIWTYBu6l85jVG/NNzbm3gZW4+E1mdp1ATovPRdlE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DJoTgPGhvDIp6czQNIS6Tx7vU2qFA+gPMIhNviNd+AWdhed0Cd1tiTg8mCfUACJVDnhiY/C0eeEsYK5keb24FcSBQ6C2Ol0WIgIcthGl9bxX+GIfkKp/buN+UA1IwDX0TI2+FxfCkF7/JE6doo0OombEJNATM7dxhoFK71fq/0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uiJebXTW; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uiJebXTW"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2264c9d0295so53435ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 13:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743711341; x=1744316141; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+9FiIG9VAdbY9vvhPrckluTadBWrK7mI9etYkWzR0uM=;
        b=uiJebXTWu8BsEKQ8WkTQXTcitTJlJzv38X2k2oHV9RVNPf5SkmRZAGmP3Agk5jJ05K
         UwmKgXdHDixEP8TGPoWlHZ9XCQGIRtbuGH3hoXqIJGQ4F+VBczHGnU7cGgnngQ/JpRYs
         9+FpmIY1TAWnAP18VRZpYoWZCGKOWZQdAR00aeb/Xb3AGUj1tZLx9PNDYtdlcrHh9tpk
         vAbbJ+7bQmaQHzLziiqCz353l4lc3/HDOEozgR0eaquobzSm0Gk63dT8wrm+nDLkb5Le
         AfXrMHoAl2+EeQqWmmFVd3IXQfACIGGL0o6nfN9jivQG7HEBq8fm9QaubsDXZe63YnHE
         4TFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743711341; x=1744316141;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+9FiIG9VAdbY9vvhPrckluTadBWrK7mI9etYkWzR0uM=;
        b=Ne5oWiaVnnAGLF2I5tmpYYV04Hl84GNOyHYjHUmmrsKcLxThVCkw6A63h7UhF6kLw6
         w2hYJEMa+04qRuX9zEC6aPaanI6kCy7rXT3xnn8QSFEXio1mww99hUWh1xC2soDLIjK1
         aRAM++rK92YNmpDfrayGsjfHx9uUmzB7ZzmYrUr4qwyo63Ggvk77nFkRQzxFwbyxtC/+
         REB82qq5GPMjHBfkoBFtZl9sVnOzKvr/fiPJNpyFHvegYZnfbNPsZPEbltb6F0251WdY
         shzPPLLAKhNAW6XNc8N4DHhexVmUkUuU6SPaOFzhgPYrGjNn+HUUQSxXkHJCHF6BEvit
         gOzw==
X-Forwarded-Encrypted: i=1; AJvYcCXPiIUBykEcnaKttFy86deTm/TV0sn0rKnvyiRFbZdVSx6haaGHm1+WdDxU85dO5mRsIDk/oqrJ0VyntWE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxpDCgi9mgy1MB/p/2NDxulbMCNXThLvtk41LlBjyl6CpiuvTJ+
	cpDF5wPh6VgSFRfohrvfRs/5V/wGmdMwj+t+5yQDSHado5E33Q7p8aVbWv5mQg==
X-Gm-Gg: ASbGncu+G9Mb8k8mq/J7/BkH3Uw9Qmvsdjigi/djxYTEcwMPvlkv1lvxuxNDelVN4J/
	gNERVMw5nY2/V22gKCa6lPGOJkmZDfRQvANk7s7gm4zidhnwM9SK4MNz/GZnXEHfLXCKsut0fm+
	dXzWqmlGGbC8++1Tcl7jUDZN6QKVAVutJQSVCgNhHJq7Y2K3DdjWNI/bXm8yrVCmQ7AVrsRcVcH
	qAG73TX47zRbs1/uYPZqd1QcqldTWZH9OTQ457i1hjvvf6sCPbUlyn0ibN/Iin64ZFhZWomugEL
	IZFdFJxsG77TvMH3Xi53zf36JuKLAwSZWL34g58S4YMcH5t42valK10MUJgxksOggu4oa5gF7P2
	6wkPMuS8=
X-Google-Smtp-Source: AGHT+IHjSj+UBbEWgXjBxDtxoLUefEdWlIf+aTvXEvObr0AnxhKwZTfr4leY27mrWcr7YIZG65soJw==
X-Received: by 2002:a17:902:d487:b0:216:7aaa:4c5f with SMTP id d9443c01a7336-22a8b6b2832mr11915ad.3.1743711340284;
        Thu, 03 Apr 2025 13:15:40 -0700 (PDT)
Received: from google.com (69.8.247.35.bc.googleusercontent.com. [35.247.8.69])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739da0b41f1sm1978828b3a.147.2025.04.03.13.15.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 13:15:39 -0700 (PDT)
Date: Thu, 3 Apr 2025 20:15:34 +0000
From: Sami Tolvanen <samitolvanen@google.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: Peter Zijlstra <peterz@infradead.org>, llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Fangrui Song <i@maskray.me>, Joao Moreira <joao@overdrivepizza.com>,
	Josh Poimboeuf <jpoimboe@redhat.com>,
	Kees Cook <keescook@chromium.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>
Subject: Re: kCFI && patchable-function-entry=M,N
Message-ID: <20250403201534.GA197065@google.com>
References: <Y1LBGZPMfCZ8A1bl@FVFF77S0Q05N>
 <Y1QEzk/A41PKLEPe@hirez.programming.kicks-ass.net>
 <Y1Z12xuY9fDaHuCm@FVFF77S0Q05N>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y1Z12xuY9fDaHuCm@FVFF77S0Q05N>

Hi folks,

On Mon, Oct 24, 2022 at 12:24:11PM +0100, Mark Rutland wrote:
> On Sat, Oct 22, 2022 at 04:57:18PM +0200, Peter Zijlstra wrote:
> > On Fri, Oct 21, 2022 at 04:56:20PM +0100, Mark Rutland wrote:
> > > Hi,
> > > 
> > > For arm64, I'd like to use -fatchable-function-entry=M,N (where N > 0), for our
> > > ftrace implementation, which instruments *some* but not all functions.
> > > Unfortuntately, this doesn't play nicely with -fsanitize=kcfi, as instrumented
> > > and non-instrumented functions don't agree on where the type hash should live
> > > relative to the function entry point, making them incompatible with one another.
> > > AFAICT, there's no mechanism today to get them to agree.
> > > 
> > > Today we use -fatchable-function-entry=2, which happens to avoid this.
> > 
> > > ... but I understand that for x86, folk want the pre-function NOPs to
> > > fall-through into the body of the function.
> > 
> > Yep.
> > 
> > > Is there any mechanism today that we could use to solve this, or could we
> > > extend clang to have some options to control this behaviour?
> > 
> > So the main pain-point for you is differentiating between function with
> > notrace and those without it, right?
> > 
> > That is; suppose you (like x86) globally do:
> > -fpatchable-function-entry=4,2 to get a consistent function signature,
> > you're up a creek because you use the __patchable_function_entries
> > section to drive ftrace and now every function will have it.
> > 
> > So perhaps something like:
> > 
> >  -fpatchable-function-entry=N,M,sectionname
> > 
> > would help, then you can have notrace be the same layout, except a
> > different section. Eg. something like:
> > 
> >  #define notrace __attribute__((patchable_function_entry(4,2,__notrace_function_entries)))
> 
> FWIW, I think that'd work for me, and that was roughly my original proposal on
> IRC. My only concern with this approach is code size, since all uninstrumented
> functions gain some point less prefix NOPs.

It took me a couple of years to find the time to look into this,
but here's a Clang patch I committed yesterday that adds support
for a section parameter:

https://github.com/llvm/llvm-project/commit/acc6bcdc504ad2e8c09a628dc18de0067f7344b8

Sami
