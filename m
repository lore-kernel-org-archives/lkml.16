Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7ED6023CB
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 17:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743182669; cv=none; b=GjOrEkZ0riBgmJPzrtu1JTfX/bY5fXtP4/R0qzsuGNcdTK+EvQ0uy0rkOJQBSmSj+vbncNadO7O23fS6saAPMIqmc6NujHmP6sMwdDmWgmHAZ6EaQEVZFsLrRKA3pcYSO32kiJ9MWW7Ondd+dfPfqqTzyNqShUBvm+aWNtybqQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743182669; c=relaxed/simple;
	bh=QZxEW9LDKTakhl73Pjm6rjZwrSwT/kw0vBtXbHDY964=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BtKekaF5LpIgj6RnW4gajb5tBCUy2GGR+JFl0vo914ZCH1Kp9UoaEqm2ldTgDe1rjJsUyV3HP0GxmZXPkl5tI0781lcPdtwlKu0NWAUjy5cqTobzh9DUFlsj8z3X3Q1rHdyLWgqUKfZdLBB0NOGOQYWtEA7Qb0ufZ5MX9ieA50s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 873A11691;
	Fri, 28 Mar 2025 10:24:31 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5CD673F63F;
	Fri, 28 Mar 2025 10:24:26 -0700 (PDT)
Date: Fri, 28 Mar 2025 17:24:24 +0000
From: Leo Yan <leo.yan@arm.com>
To: Ian Rogers <irogers@google.com>
Cc: Nick Desaulniers <ndesaulniers@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	James Clark <james.clark@linaro.org>, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, Kees Cook <kees@kernel.org>
Subject: Re: [PATCH] tools build: Use -fzero-init-padding-bits=all
Message-ID: <20250328172424.GB195235@e132581.arm.com>
References: <20250328135221.10274-1-leo.yan@arm.com>
 <CAP-5=fU5y_xKaWnh8tumyjTfJZdr2i+tPUaECyPs_vdhKdYWLg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAP-5=fU5y_xKaWnh8tumyjTfJZdr2i+tPUaECyPs_vdhKdYWLg@mail.gmail.com>

Hi Ian,

On Fri, Mar 28, 2025 at 09:39:41AM -0700, Ian Rogers wrote:

[...]

> It'd be nice to bring in the comment for try-run that's in
> ./scripts/Makefile.compiler:
> ```
> # try-run
> # Usage: option = $(call try-run, $(CC)...-o "$$TMP",option-ok,otherwise)
> # Exit code chooses option. "$$TMP" serves as a temporary file and is
> # automatically cleaned up.
> ```

It is fine for me to reuse the comment from Makefile.compiler and add
a temporary folder for the try result.

> > +try-run = $(shell set -e;              \
> > +       if ($(1)) >/dev/null 2>&1;      \
> > +       then echo "$(2)";               \
> > +       else echo "$(3)";               \
> > +       fi)
> > +
> > +__cc-option = $(call try-run,\
> > +       $(1) -Werror $(2) -c -x c /dev/null -o /dev/null,$(2),)
> > +cc-option = $(call __cc-option, $(CC),$(1))
> > +
> 
> I see differences with the ./scripts/Makefile.compiler version of
> these functions:
> ```
> # __cc-option
> # Usage: MY_CFLAGS += $(call
> __cc-option,$(CC),$(MY_CFLAGS),-march=winchip-c6,-march=i586)
> __cc-option = $(call try-run,\
>        $(1) -Werror $(2) $(3) -c -x c /dev/null -o "$$TMP",$(3),$(4))
> 
> cc-option = $(call __cc-option, $(CC),\
>        $(KBUILD_CPPFLAGS) $(KBUILD_CFLAGS),$(1),$(2))
> ```
> I'm just wondering why as if we need to update these in the future
> it'd be easier if the two were identical.

Note, I do not see a requirement for passing two options for tools
building.  In the next spin, I will keep to support only one option.

Thanks for review!

Leo
