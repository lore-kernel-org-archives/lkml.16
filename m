Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EA55289814
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 18:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750098884; cv=none; b=W5duIztAG0xIEKZtjDNJPuhNQeW8bvPjfIQraZjrHQjgWMHmrWG37mUk6dv9n7NxWP1jtXv7cDpY2EDA7dvFdL/lCwHp1UC5CCWHy8Oovu/3kk4RE3dSr9pi3VdpLMPsOQLsUtLdQT3RCmw7XPolLCxqnw6mW1VmFUOC6mA6uzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750098884; c=relaxed/simple;
	bh=+NLHBsPwERoPzBQUAwwqAk/157acmkgAwFB47XBdL78=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sndYVESx3CcrSHv9/TENT9wNop+3nStojdEPLPaAhFRhvlkS4g2xBiFUAfFd4VgITCnlm6OiDb9mPRIV7cyT2pAC8r7qfYcdnPSwlSdyKNqw3jCWeHM43DZ4MwbSP+93KaDr1djuN9OuoEoapXShVUMnDs+RSbMmNvNZhLqte2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jsl81Urj; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jsl81Urj"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6000791e832so1831a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 11:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750098881; x=1750703681; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HR1yCl2bxF4JqHppQGHIp2MoQ9YrzZ1LBmArarKp6bU=;
        b=jsl81UrjB+hA3c6lnfe+ypboFjHCKHLXLDd0dOfHVS6uFnrkdpp1KGqwUXjeo87Roz
         uQjh//JMJsPjo/ZZCedHlvczCZ2lcy/0+nLTro9v4sb6j7zJCZMzfXEHJQSL57KoJ3ST
         ARjlTynW1XtgfD7wftHSwGnW8hJ9+IqpbXzTCuC/TG0ARhRXHprb8X4CWSBtGgHtCNwu
         0QFyLvJ6f3etqrlfpjcFYgSS+LGd1wdLxTqMsvNVDRDliaAIueuSC1IcgZhASFq9zDYr
         KxH+iiufE95WYEbOftUbmeL1Nxht2UueYfjPIALB68Ku9E5GKzn2kpxBU8dz14visRVz
         JP0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750098881; x=1750703681;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HR1yCl2bxF4JqHppQGHIp2MoQ9YrzZ1LBmArarKp6bU=;
        b=VChZjdeLxaK7WDs1Y4MmNaU34oLtOHn7u2/7JAe+Z0r1rg167O7FWBrpnrpPfh5VgG
         6ooNJd5YQf7slnJNVurfW3QaXbtoQNfdsi6THgYgFXrp3JGwiBs7fOuR4bAIFbzU8KO4
         HA770YP78RzOZ8uhBYYE6esKDlP3XgNNELTEA3GsL4DufMAeaJQAR8eWa5Gl3vHoexlb
         HyS3LdIeWjwae2ob/R+E9sNUrGJ8Vf9sG94ddNp+FNKTlHo68OLstLbFkx7Mn0Ggn724
         RkxnAz76P6xlu9UXPQ3NQ6gJYMmfIPldEPmzX55BdtiClaLGYbYT8/EnRnBBfodDW4Fk
         k6Lw==
X-Forwarded-Encrypted: i=1; AJvYcCUDGp4NjszPl4MkHUalPo09kVmcOyXsVngzMye/0p3tCtebRLsCBZCq/ekCM6lf1NhGheaG4iXWecyaGO8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxR4b5pa151Mi/8SuaWdwUFnSCUjL0gObcpJx5iVOE40IXi0ez1
	hfvTDkxtpalXdNy79PYxfWcVmRmSIJY4IQWyDSIn3cJyUegSqxt00zlNlAOXxcCWVVz9CgdvZ/z
	2UcdEl/k8RJcVxgsB5sOyIafOjEhWTzvNpRc9UXat
X-Gm-Gg: ASbGnctt6IIlgLzOkQzAiF6YWoVBsqGnr+ne21hNBLox1/LErrEfzHddjxkIdHrRZb3
	GACj9yN49+UfTMS3twbXPTdh5nbgxQ8xLpkJm0Zt401tBFGOpqCsbS6ecFtx3Psu6/KBydQUHIn
	1KYVYyGD9NZxOAtmsTYC8TxEacFaRXMEG5BAsK3xkq1bYpez6mfcbRSlIev5zxluQofvhBCg==
X-Google-Smtp-Source: AGHT+IF+32JRHWdswwzAbDYijh1wc4I07bcj84BxTlQmfqE6qlGSHr9nKq8shBYBBqOFlQkxFnKJVbY2h0KM0F4f8N8=
X-Received: by 2002:aa7:dd04:0:b0:607:2070:3a4 with SMTP id
 4fb4d7f45d1cf-608d314d9b7mr154461a12.2.1750098880357; Mon, 16 Jun 2025
 11:34:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250515132719.31868-1-mingo@kernel.org> <20250515132719.31868-10-mingo@kernel.org>
 <20250614103915.GM2278213@noisy.programming.kicks-ass.net>
In-Reply-To: <20250614103915.GM2278213@noisy.programming.kicks-ass.net>
From: Jann Horn <jannh@google.com>
Date: Mon, 16 Jun 2025 20:34:04 +0200
X-Gm-Features: AX0GCFsusYmQS5x4XLip7pJyg7zFX34bowR6ZljPpKMR_AcbEhXv0GNX8i0a_uw
Message-ID: <CAG48ez1do372y_ow37tEdkyfUOHrwtLXBWH8PfnwwAN1ApT8Lg@mail.gmail.com>
Subject: Re: [PATCH 09/13] x86/kconfig/64: Enable popular MM options in the defconfig
To: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@kernel.org>, Kees Cook <keescook@chromium.org>, 
	linux-kernel@vger.kernel.org, "H . Peter Anvin" <hpa@zytor.com>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Borislav Petkov <bp@alien8.de>, 
	Thomas Gleixner <tglx@linutronix.de>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	=?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Ard Biesheuvel <ardb@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, David Woodhouse <dwmw@amazon.co.uk>, 
	Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, 
	Rik van Riel <riel@surriel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 14, 2025 at 12:39=E2=80=AFPM Peter Zijlstra <peterz@infradead.o=
rg> wrote:
> On Thu, May 15, 2025 at 03:27:15PM +0200, Ingo Molnar wrote:
> > Since the x86 defconfig aims to be a distro kernel work-alike with
> > fewer drivers and a shorter build time, enable the following
> > MM options that are typically enabled on major Linux distributions:
> >
> > - ACPI_HOTPLUG_MEMORY, ZSWAP, SLAB hardening, MEMORY_HOTPLUG,
> >   MEMORY_HOTREMOVE, PAGE_REPORTING, KSM, higher DEFAULT_MMAP_MIN_ADDR,
> >   MEMORY_FAILURE, HWPOISON_INJECT, TRANSPARENT_HUGEPAGE,
> >   TRANSPARENT_HUGEPAGE_MADVISE, IDLE_PAGE_TRACKING, ZONE_DEVICE
> >   DEVICE_PRIVATE, ANON_VMA_NAME, USERFAULTFD, multi-gen LRU.
> >
> > Signed-off-by: Ingo Molnar <mingo@kernel.org>
>
> > +CONFIG_KSM=3Dy
>
> Isn't this thing like a giant security fail?

Yeah. (Though to actually do anything interesting, it requires root to
opt-in by enabling it through sysfs, and also requires the application
to opt in.)
