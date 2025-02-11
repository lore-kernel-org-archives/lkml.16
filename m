Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DABC21E885A
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 08:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739261141; cv=none; b=qXcooYHerqHJvewDTzFMvlvmlns23UFk8d0VvM4rqhtNY4VHvyKT5wkp5tIqeUBcwzRrrpnS8Mm7zHC7rmIbhaz54vpRf8eTEQrG7BR0E1bbYEueSp6htLu0UpwNHQH9E0r++ZkJwWuX8hKHr4Eou1n4fIG7zs+SA88PAGz4k2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739261141; c=relaxed/simple;
	bh=IeqYOaXyL41LitLer0dZtBcS1jjNXgv26uGc68W2ZXA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uEEZzMuG1lpS2JG+yCI+ZBY96GYq1gSSxJ/t4++/Tx9Pn8EblfM3H30wUsynoyo05CkjzafVM0YqIkCiLGX+2eqYdHFBZXAqVrn2+vQVS25K2kitoqbhDfAWQ4k13HVZNlasUlBhLBzkRM27NAmx4LaF1btGlpB+wIOCB2hcmDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NqDWnDXC; arc=none smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NqDWnDXC"
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-726ed7a316cso69630a34.2
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 00:05:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739261139; x=1739865939; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IeqYOaXyL41LitLer0dZtBcS1jjNXgv26uGc68W2ZXA=;
        b=NqDWnDXC0rQifM9JHFI4vVM3CwlIz5VmBfEaLwi3yMYQUOdVSgb/AOZBKRmTOUBxYA
         cA+/x71SBF/Z9wdEYF497TTD3sF9KSBeeo2TDLC0YWrDxDKHX1u2pJvJgCYP8QzKroC5
         jeLb+kdTzOT46k0NpiYAMSAwFdUAo9UJAapqn9Gzk8cl+x18oOzfwW0By60kcR68Sm4S
         LZNVJcbzm6CCQaDr24TBmZX7OO3QKzLJG6Ym+rw1izTcMH/8x5pgw1YH7zE1yjMo21uQ
         u1u724+gUz0MA+zeInP/a2tIciZqtybTK515jongxAvrY3rtsfzq0G9qYTiVwR0zAoM+
         4uRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739261139; x=1739865939;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IeqYOaXyL41LitLer0dZtBcS1jjNXgv26uGc68W2ZXA=;
        b=le2S21Sysz25IkIsjf+D++T/IAzhpoScA8hCjK8/otwP5AeF84uPLOLdriCK8VY4rq
         UcfmphLodOO98FKzgPF/2nJgBa1rNoJCb7owGhNO/GxMjhqctBwSh8ujm8sQ1p4x23/S
         Qz12UP0avyqYmWEhk5Ob2USOI1ycvLedRNbTCg/Ndz8TBNngA8WQp95NuRy05HhT0rgj
         oaf1e0y2TeDDNamcv7Ayhyx6m3m7QMCI5LsE019Hiimhujs/yRv9myn6HhQ5gcbHPIe+
         Qpg3gyPl5IZSDSsvu30tySEXqbVBfUa9lj6/fQGLRKY2zDobYZAz49GbF3htORAz3LBE
         M24w==
X-Forwarded-Encrypted: i=1; AJvYcCU+gSYuwm3+ZYcu+o923FeCIaSlBZ3zosIe6CH1/HxESeC6+PuVCVwP1NQjJh4kuMKup7JAC/cYwpjWilg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLnE27cLfMfN5x1Leol4Ym+XFn0DQ1RST45p8WknyBr/IhA8uB
	yZXNsIYn5yg3yLIZSTIahQQf3w/SQsGVr/BXjoqPPyfWzb/qn4JUFnJHbzy2tJrH9n3ceuabWo5
	EhQnzZKKSygigWzAerT563JwuVMY=
X-Gm-Gg: ASbGncvcB+1JJbNbv8zG8fqdV8AZSY9k73v4k/dYdoseCGYVwfLLQXHbyfZY3Tgc9ZS
	I9tQjOls1guEWZZRFV13nZbR8A/zo9ig3zu5EA4zk0pzxYTZO5bdKqS6LgcO64AKdcOGXTiRw3n
	8wEeQtYYpfkS/NonEHSJiKN7JilBPK
X-Google-Smtp-Source: AGHT+IH1yYjBDq+fpIs2910Udi8BvvFKAuL4iL47+8Y/BbUeB+wz+UXTXrj23xSjcuh9pdg/bHLlXJsGj0VslDrI/G8=
X-Received: by 2002:a05:6830:3497:b0:71e:4fc:6ee1 with SMTP id
 46e09a7af769-726e79e202cmr1547852a34.9.1739261138277; Tue, 11 Feb 2025
 00:05:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241113095833.1805746-1-zhangchunyan@iscas.ac.cn>
 <20241113095833.1805746-2-zhangchunyan@iscas.ac.cn> <87frl0snf6.fsf@all.your.base.are.belong.to.us>
 <CAAfSe-tRFEXiXJ=tHVnXy4Kb6O7-E2Sr_xybLYxma=ypMhqz9w@mail.gmail.com> <Z6rLlkphtv99+bH3@debug.ba.rivosinc.com>
In-Reply-To: <Z6rLlkphtv99+bH3@debug.ba.rivosinc.com>
From: Chunyan Zhang <zhang.lyra@gmail.com>
Date: Tue, 11 Feb 2025 16:05:02 +0800
X-Gm-Features: AWEUYZmR3vcC-5RUc00Y8UvIfNPJCSy9ifpTouB9LReWy6id2n5cEvTpBNFA-9k
Message-ID: <CAAfSe-sf+4QY9eif_XaRGXEUn1JyPn_Jj+k2MOq9mfDR2Bd6yg@mail.gmail.com>
Subject: Re: [PATCH V5 1/3] riscv: mm: Prepare for reusing PTE RSW bit(9)
To: Deepak Gupta <debug@rivosinc.com>
Cc: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
	Chunyan Zhang <zhangchunyan@iscas.ac.cn>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Alexandre Ghiti <alex@ghiti.fr>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Alistair Popple <apopple@nvidia.com>, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 11 Feb 2025 at 12:01, Deepak Gupta <debug@rivosinc.com> wrote:
>
> On Tue, Feb 11, 2025 at 09:20:22AM +0800, Chunyan Zhang wrote:
> >On Thu, 30 Jan 2025 at 16:42, Bj=C3=B6rn T=C3=B6pel <bjorn@kernel.org> w=
rote:
> >>
> >> Chunyan Zhang <zhangchunyan@iscas.ac.cn> writes:
> >>
> >> > The PTE bit(9) on RISC-V is reserved for software, it is used by dev=
map
> >> > now which has to be disabled if we want to use bit(9) for other feat=
ures,
> >> > since there's no more free PTE bit on RISC-V now.
> >> >
> >> > So to make ARCH_HAS_PTE_DEVMAP selectable, this patch uses it as
> >> > the build condition of devmap definitions.
> >>
> >> Heads-up: It seems like Alistair's series [1] that removes the devmap
> >> PTE bit will most likely land in 6.15.
> >
> >Yes, I've been keeping an eye on Alistair's series, intended to update
> >this patchset after Alistair's patch that removes the devmap PTE bit
> >got merged.
>
> Please keep in mind that even after claiming back devmap PTE SW bit, a co=
mpile
> time decision to select between uffd-wp and soft-dirty is not desirable.

Yes, I agree. I've read your aother email. I also hope we can have
more RSW bits to use. So should we add uffd-wp and soft-dirty support
on RISC-V until we have two RSW bits for these two functions? Is an
undesirable solution better than no solution for now? I can optimize
the code when we have more free RSW bits, that's not hard.

Thanks,
Chunyan
