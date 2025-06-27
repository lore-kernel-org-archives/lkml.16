Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A999339A8
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 10:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751021547; cv=none; b=VxwvSe6zaDdPikj27toBu5GuD0dzk9nEPTRuOT0axZihVLbBU4knbci4MgR3oOx7laSzGGY2tfvVm71WjjgTJb4VPemLtBsaGwp0k4k7w20u/8XCwF6vO/d5//2PXyP2c1pK33cc0zErX6fqFGMDQ7dToLgI+pQL8UO/3IXWfWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751021547; c=relaxed/simple;
	bh=viQz2FoWAMoMRBrUB0vOI7MJY+U2udKXiQsPy3/43Lo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IH0bAmqKeYFhnoHDKOXdAb7vyhxevXmK5zPY+zqsr/SPXUmSQyWtfC18pJxazJ23BA7biuKu1f25iS0l4t2VyD8QOtUJlKkiiXdK3hKiJ23S8ks+sLkIhUPrsDuAwRBRQPZzqvlOgbf16Ht78ruE/6HgqdWi4KgTIuvLgOIP+fA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lPDIfD7t; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lPDIfD7t"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6fabb948e5aso22628166d6.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 03:52:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751021545; x=1751626345; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=viQz2FoWAMoMRBrUB0vOI7MJY+U2udKXiQsPy3/43Lo=;
        b=lPDIfD7t408ZxrVpNKvE+WAFBUXePajuD4rBJe3/hTCzUSSJXAOjrrN/0lvsBq+H77
         G2J5R6Q8ltzNPXtsgysIi/YqUVI9KaXIfYGdcITV0DalCmNfCSO/LYGvRmdCNkJYULQP
         XvHvHoOzrbY/98Z7yroLwILBnuk2NBl5j7yk57b+NaLEqcUSI08oX1tkeaqhq4sWIa9b
         4Uq95M8X39wKzOBjBG3TG47SHoq2m6nXriHRA5lyVKUEkz6dSJs8VKSVwz0WsKDyPZSY
         Pf89UE04FwPDDV45kV9YOLLEWSSatytKkkoW3Ep1AAFT6524qeuvFrDZZKyCfiNhiHkF
         +EJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751021545; x=1751626345;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=viQz2FoWAMoMRBrUB0vOI7MJY+U2udKXiQsPy3/43Lo=;
        b=hifCGyawW+9aPP4mjjG+d8Im4Frz7gXzjxo8zbMRTmLXxRBqFSzgl7LpFp6R6DzFmO
         dLY+JvRrB5Vw7C+AWi9jI70lQdRfoLX+zrBcDGSx9+Kx6MdhHYuKIJJ+WmUbgzjG8jOq
         ztKTHbMtCSaj+D/Cu0ybT2KW1UGghsg1x+cc9RtRt04wMddBaZ+MrLoibhr4HIrN4vnL
         x+wLLCFKmqyqrdF9Frx7hhJpxiyw9OedRE5ahjYk/fzpiHfA0z5lRCf8dC+aTRLnCU3U
         7t1l/Z7lL9XPDt8FO55sZlyOnJNnaTrNqmJQOj5HILmkcmp3A8Wj9a9gKtz8+QofSw6s
         nUIA==
X-Forwarded-Encrypted: i=1; AJvYcCU+p7hKQdzjIDkn+SL/UxYUKhNzYRwUre8RL12E9Z5c4oE5mpDKhuLTgbi8KR/lL/nl3P1XB7jvz3vZpfY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzvyqjzEzvJ6AqjOC3FShOnmFxDS1o5nj8eeZ41Trk7yNJR5UIA
	BFFLf/WW720dK62V+OgFGcXPVaKW0P1nFO3iRRaJANGaINzRWDxNAFuCMJbF1xOxppZvUEIYIWB
	2nlfq+D/gq3L0TsOvK3g8J+RKodq+hxq6+PkasN/z
X-Gm-Gg: ASbGncvU9DK0Iv/5NynqdKwjK3wRE43k+L3yuKhLbww7cInW4XowPpwflAn46+QOls2
	wryT6GoitjvpZPu2JDz0uo6olsX5nz5VfXwSRpY55m+KQOBcKdPH4y770L0dP3U8kDAFPgWAI2g
	nSoqVyaxmT4egRjjjJyijANqS70A+AFs/yqEzdmxRhGroOLFPzTf8MC4G7ZpoMWTJwyatN3IsXF
	MW5GQuiD/I3
X-Google-Smtp-Source: AGHT+IHiPYfanXyE076HAbBUTiSPySq5WIulTf1tneg+6DFz5W/NAseIh3zHh2ggPpwhiKNV49pZNoFv1V1Xqv1HXQM=
X-Received: by 2002:a05:6214:2aae:b0:6fa:c41e:cc6c with SMTP id
 6a1803df08f44-70002dec8ccmr47072906d6.15.1751021544651; Fri, 27 Jun 2025
 03:52:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250626134158.3385080-1-glider@google.com> <20250626134158.3385080-2-glider@google.com>
 <20250627075905.GP1613200@noisy.programming.kicks-ass.net>
In-Reply-To: <20250627075905.GP1613200@noisy.programming.kicks-ass.net>
From: Alexander Potapenko <glider@google.com>
Date: Fri, 27 Jun 2025 12:51:47 +0200
X-Gm-Features: Ac12FXz9ZmEhwn6682BBmZphT053hwX6JSzJtoiQLmtu_EeKs6Hkmz1YSAuN-mU
Message-ID: <CAG_fn=XvYNkRp00A_BwL4xRn5hTFcGmvJw=M0XU1rWPMWEZNjA@mail.gmail.com>
Subject: Re: [PATCH v2 01/11] x86: kcov: disable instrumentation of arch/x86/kernel/tsc.c
To: Peter Zijlstra <peterz@infradead.org>
Cc: quic_jiangenj@quicinc.com, linux-kernel@vger.kernel.org, 
	kasan-dev@googlegroups.com, Aleksandr Nogikh <nogikh@google.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Ingo Molnar <mingo@redhat.com>, Josh Poimboeuf <jpoimboe@kernel.org>, Marco Elver <elver@google.com>, 
	Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 27, 2025 at 9:59=E2=80=AFAM Peter Zijlstra <peterz@infradead.or=
g> wrote:
>
> On Thu, Jun 26, 2025 at 03:41:48PM +0200, Alexander Potapenko wrote:
> > sched_clock() appears to be called from interrupts, producing spurious
> > coverage, as reported by CONFIG_KCOV_SELFTEST:
>
> NMI context even. But I'm not sure how this leads to problems. What does
> spurious coverage even mean?

This leads to KCOV collecting slightly different coverage when
executing the same syscall multiple times.
For syzkaller that means higher chance to pick a less interesting
input incorrectly assuming it produced some new coverage.

There's a similar discussion at
https://lore.kernel.org/all/20240619111936.GK31592@noisy.programming.kicks-=
ass.net/T/#u
