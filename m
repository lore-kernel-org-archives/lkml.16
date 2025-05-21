Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CCD7289805
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 17:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747848374; cv=none; b=KR4qT4BfljsxOTZ16W/E9cIgwPSbUwMNTPIUvy9BQmdK4/1BgnIrbGmB1CmbKYqPvnxrLCbU4uzKUWr8p4bCknYW2HbYRSpsukaxLzG67Z4xUSBKMiUYR8UENCE/r0uj1TAe7yXccmVqKwG+fMvibDlZGBEfK+DHxV1EqhUMYe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747848374; c=relaxed/simple;
	bh=SNcBWO0SDBGmN0f3E8PSCFb6T3XiKnY0he0E3YxPF6o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jbhyxPoo1m68vXoK4kWHW0zseluQ4KeO7d3uyd+XOGMyNObSURJhqDOSxq7AWTSxZeokGxpLi7FkwIIb8NAG/Nj30t48rd4WsIei1q7moMYTCXEu08gSjd04zaiq7UnL8jXR+uQNJdMFWWr6j5yEsYOuyt+tmJQjh8oSYWnNXOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=E9wiBOIc; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="E9wiBOIc"
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-e7b811be6dbso4610001276.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 10:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1747848372; x=1748453172; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rIhOgwbzMjGGaSpvlOSaI+SLc0zvNQWfJPIxvBRr8n4=;
        b=E9wiBOIcF75EJU/vm+ztCsrEK7IL+zs19FAfCari0zsv24TGh/dpX4o0uREaGXwhnj
         lH5mQQZERAgoFPcsk/7YkKsBeru/3oV8A+F8/2lv8OSSHYmMgA1h+zwwfSn/vVVeiKMg
         bUIMWNgF22Onqov4ZRzQE8x2UXtJ6i5NQ13oPW08UBv1bMmFqhwBlfBmQEFtxeTGcKB6
         i5rJrH7Q8TrK7BVOt9WD9nWIuRmkCJt6ebCeKUkucjY57qNkx2JEiukw5aaqZoMArSow
         2uyPEZ+mJmp3x08w+yXxsbwEETbABQMD/a512U318bttRpKT6HId7Yt9iJyoxbkRekGv
         mTdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747848372; x=1748453172;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rIhOgwbzMjGGaSpvlOSaI+SLc0zvNQWfJPIxvBRr8n4=;
        b=SrZH2GclSKQgdCe2QncGnxNFclTy4jOR/YeCpjL+vShLCxnWiASGacUS0LS/2rG62N
         Sp0TPWlO56aiu6WAhGG/+zjFTTgmlqDGd2Ic5QvV46DwbafKx1d1Bl5bGhQZ+6ETFDNt
         BjSSc++s7TB8hPoeygFpWjk3hYr1I7EgCDnIraeF3j5x3SePW2t1X5789Ftx2IkYqL/A
         iWfcY/XDPInTL4g/KMdoK/VLI64Cev8HQGLrzYPNmE14ffgGeq/t3DzidcrsWpDhzzCD
         kDPRfNDSoJ0bs8E/MLKGQ8TqdbkRIhG1InPPdQgKDMCnmUqDKqE78AKrJwaPGXiGk3b1
         4ALg==
X-Forwarded-Encrypted: i=1; AJvYcCWva6XX1Jnkqw7Ce8dK46rtpS1y5iBQhDDTn2S2B1Wxn8wXwabsi16fEZNRZvjNz6XEWwQFC9HwsbYzHY8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYEgj3WLbTkbVAkcw9N1sWWEz9ZRlf4mzL+bubM7tAlUbzPvWa
	RwD6VlfACUl4NBmsNbrU6Gc68S1yYjauvIZWYCTqjQgOV2wz9e/db/44rUVM4bmOo//LlCDORDx
	csuH56FwzYcq2RGCEUvZ+9ZtylZN5sun4I65I3ZDS
X-Gm-Gg: ASbGncv6/CDp5/QildAosZXGwU+bGXw59NYq+tMSSVhmYqmnh8ZnjsxzPEuylNSw0El
	Jvxxd6JEoQNUjGC3kaoDyKIPxJH7pLG0Q/ONUG5IEfZ9rjjPzPkqlYVvOA9FBh7XhVjGdyl1TdZ
	mI7Rwv/SSTPxwoGj78LRM2TdAyrXcqlka/
X-Google-Smtp-Source: AGHT+IHTQ/EBiXkUN4sB64DKIAPlbgYtLPZM1ajTbB7K2z2Cj9n/crDbb8nGoXujDSp6SO7D3b0zHIngSOv/l9GGb/g=
X-Received: by 2002:a05:6902:2182:b0:e7d:5cf4:8970 with SMTP id
 3f1490d57ef6-e7d5cf48cd2mr4233290276.21.1747848372174; Wed, 21 May 2025
 10:26:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAP=Rh=PtKsiXGLYeK5tr4LSw-AHJ6LM4kuTWR3Hs5sQQp02wCw@mail.gmail.com>
 <jnrnpz2sms365aleeowcwisbefiekvkhbd6s5x42z7wuqnfxcy@dr6tkjizp3v5>
In-Reply-To: <jnrnpz2sms365aleeowcwisbefiekvkhbd6s5x42z7wuqnfxcy@dr6tkjizp3v5>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 21 May 2025 13:26:01 -0400
X-Gm-Features: AX0GCFv82it1nOaxXGhyT_elnph9wrY3Gcpl2XupSquc7lg3y4heYygUNIgjeIs
Message-ID: <CAHC9VhSD0VHyNK59991PJFp8qkzM=sAsNE9nG7M42xhER13csw@mail.gmail.com>
Subject: Re: [Bug] "BUG: soft lockup in perf_event_open" in Linux kernel v6.14
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: John <john.cs.hey@gmail.com>, Peter Zijlstra <peterz@infradead.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org, 
	Stephen Smalley <stephen.smalley.work@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 21, 2025 at 11:57=E2=80=AFAM Josh Poimboeuf <jpoimboe@kernel.or=
g> wrote:
> On Wed, May 21, 2025 at 09:49:41PM +0800, John wrote:
> > Dear Linux Kernel Maintainers,
> >
> > I hope this message finds you well.
> >
> > I am writing to report a potential vulnerability I encountered during
> > testing of the Linux Kernel version v6.14.
> >
> > Git Commit: 38fec10eb60d687e30c8c6b5420d86e8149f7557 (tag: v6.14)
> >
> > Bug Location: 0010:orc_find arch/x86/kernel/unwind_orc.c:217
> >
> > Bug report: https://pastebin.com/QzuTF9kT
> >
> > Complete log: https://pastebin.com/XjZYbiCH
> >
> > Entire kernel config: https://pastebin.com/MRWGr3nv
> >
> > Root Cause Analysis:
> >
> > A soft lockup occurred on CPU#0 in the unwind_next_frame() function
> > during stack unwinding triggered by arch_stack_walk().
> > This was called in the middle of __kasan_slab_free() as part of RCU
> > reclamation path (rcu_do_batch()), likely triggered by a SLAB object
> > free in SELinux's avc_reclaim_node().
> > The system was under heavy AVC pressure due to continuous audit and
> > avc_has_perm() calls (e.g., from selinux_perf_event_open), leading to
> > repeated avc_node allocations and reclamations under spinlocks.
>
> I'm out of the office but I couldn't help myself glancing at it.
>
> It looks like a deadlock in the selinux code.  Two of the CPUs are
> waiting for a spinlock in avc_reclaim_node().  A third CPU is running in
> avc code (currently context_struct_compute_av).
>
> Adding a few selinux folks.

Thanks Josh, although I'm looking at the three CPU backtraces you
mentioned and I'm not sure it's a SELinux deadlock.  The two CPUs that
are in avc_reclaim_node() are in the process of dropping their
spinlocks (they are calling spin_unlock_irqrestore()) and the other
CPU which is doing the permission lookup, e.g. the
context_struct_compute_av() CPU, shouldn't be holding any of those
spinlocks, although it should be in a RCU critical section.

--=20
paul-moore.com
