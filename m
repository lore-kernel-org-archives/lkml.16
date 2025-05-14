Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B494A70838
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 08:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747212037; cv=none; b=W4f+1TSQMF+/XdKUN/4M9gCxYhLbR8QYeaHg/R8Jl2H0ygOkSq/FQj30VMErMfMoXX9H4T6L56PpTowJBrjf4xG7/ithC8Vat9wHErwDFwfdXN3/c3S2InyPC2ePa3DNP8YEuJ/nKcRZvcRJwyqxbCnx9/rxmwF72n+DFAOU6TY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747212037; c=relaxed/simple;
	bh=x8/dZI24jwL/TPXh/+exv1bmf/+4VkSgV4hG/MmNt9I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BkNVuco5MtK0PjrSwpMzcid39c6SAi1QNaspOOU8W8PDkY5Qf307PVLxTZNzZVromH5fTUhwfXD55u2O9Jp+1Rom6Zi3mEwr237hLHs1+5OU1d3GjKoKtG3hV0Hp5p6F0x2z0iVyKr+3J9NRWPf6XOkYuxV+sxYnKKH/HvYeJBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bgo82FC9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bgo82FC9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32CA4C4CEF3
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 08:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747212037;
	bh=x8/dZI24jwL/TPXh/+exv1bmf/+4VkSgV4hG/MmNt9I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Bgo82FC9u4mbZ4+oUr+u9QxGPRgpy+M8e3ytiS/JTGkbwAu/lhpp9Rj47oULwLeIM
	 t9zz6jDY6VtJiV8PDh80ANUmU+23dOPRANqBPLG71UnrWwpD5miFEOxfKtnFQx/8Y6
	 eDOnyBMMGeuGFbm9RJABOiIbWRe8w18yj9woWb/6hYQrIib2ULDzf9Fdms1OPWqZUV
	 7mpjmXHXt8+6QksCDDM+feS/d7bILEUWJmEXmwOijLBsr3CfU/DJF4vvroG8qcB5V3
	 K9vt8w0vovFXkrZnK7ZbqBg7i/oxEVsTu6MrtLe+s7o98650+43rs+InC1N2sHwzzV
	 wj3jXLHihgO6A==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-54ea69e9352so9021741e87.2
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 01:40:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXCDHAj17t1+9AETXJHvFBnBgripFpRYhQpf+cnP580NCFpZBfqWCmGKaJF4IE0Hr9DZdUodGdVYttAj/0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxREhJ11D/smBuWuj8oYh3pA6tciB8lSJ/9GlCdlQZ/9iGuhEt3
	/49EYNfgT/aPimBpIr3jP0bQkttdAA05TizlST43dxKVICR4dqKKRBeIz5eWwLxZdJofp6/fEaH
	cbA+ESARcbmLMtPgiD0RYv/slmIA=
X-Google-Smtp-Source: AGHT+IFqpiEcYgujniBtwPzVTsjbnZ7XH43vPfwg9VTu1wHJZTWJ/iPNzvTuvVpr7XQhhYguUHknaiCeM02K90ClQ7w=
X-Received: by 2002:a05:6512:239a:b0:54e:819a:8327 with SMTP id
 2adb3069b0e04-550d5fbb916mr1055957e87.13.1747212035551; Wed, 14 May 2025
 01:40:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250513111157.717727-8-ardb+git@google.com> <20250513111157.717727-12-ardb+git@google.com>
 <aCRRJ_ahL2IRXxcj@gmail.com> <CAMj1kXF0Kc+--5rOqcVKoF-NhYfzA2rioaWsB09VK1hJ49nG+w@mail.gmail.com>
 <aCRWSpS8B-B26AB6@gmail.com>
In-Reply-To: <aCRWSpS8B-B26AB6@gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Wed, 14 May 2025 09:40:23 +0100
X-Gmail-Original-Message-ID: <CAMj1kXGypw0PY+ytYNV1sguAoWc-qTc0OL89PhPuEk938Qq0mw@mail.gmail.com>
X-Gm-Features: AX0GCFt-4eAaOy1DTX8A7KVhqSfovRSfNfoxNBqQ09oxMfEb3uZZhgbE7JAo_2Q
Message-ID: <CAMj1kXGypw0PY+ytYNV1sguAoWc-qTc0OL89PhPuEk938Qq0mw@mail.gmail.com>
Subject: Re: [RFC PATCH v2 4/6] x86/boot: Set 5-level paging CPU cap before
 entering C code
To: Ingo Molnar <mingo@kernel.org>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org, x86@kernel.org, 
	Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 14 May 2025 at 09:37, Ingo Molnar <mingo@kernel.org> wrote:
>
>
> * Ard Biesheuvel <ardb@kernel.org> wrote:
>
> > > > -     if (IS_ENABLED(CONFIG_X86_5LEVEL) && (native_read_cr4() & X86_CR4_LA57))
> > > > -             setup_force_cpu_cap(X86_FEATURE_5LEVEL_PAGING);
> >
> > Note that at this point, we'll likely still have to force clear the
> > original X86_FEATURE_LA57 bit, to address the issue that Kirill
> > raised that user space is now likely to conflate the "la57" cpuinfo
> > string with 5-level paging being in use.
>
> No, I think the general outcome of your series is fine and clean in
> terms of kernel-internal logic, and I wouldn't mess up that clarity
> with user ABI quirks: and we can solve the /proc/cpuinfo ABI
> compatibility requirement by exposing X86_FEATURE_5LEVEL_PAGING as
> 'la57', and renaming X86_FEATURE_LA57 to X86_FEATURE_LA57_HW and
> exposing it as a (new) la57_hw flag, or so.
>

Ok.
