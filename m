Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F88920C472
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 17:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738605364; cv=none; b=ARh0+pz83h5/MVHZF2OvqBMg9CsBKVcVDnXOVZVSa64aMxB29HELePCP+YpMn7OZM3X4Qx0Oq9oxWCBQIKf4WQLRp2Mts085K8zsj0ZzpA3C37MgU7QhexF0JYF91XqehtPGnrfWOIN9+qLIrkmqCRnbewrSSF8B97tR2El/9bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738605364; c=relaxed/simple;
	bh=SugYHD+uYQY79n6wJCLpwkBHfJKaSU6JUycME7SEG/Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cmW4VWFsTFWktXny7DWBNCzUoB20ilWe/Hzrd6wB/L/CotqWpFMjfTR3cr+CgWRz9DntiSAPWIjqbhpyb+T9kIvaQD9AVORlT1+HhdlQuNaIfvqE5j+5bnbHHnmX4Rl0vHw2UJ+gNs7FUO/StDve8smAnkLhhEFCFHZDBzNEyLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jaEreQk6; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jaEreQk6"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-21628b3fe7dso85651125ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 09:56:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738605362; x=1739210162; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kZpi3N7y/rWbfK2y4bLstAC2w9aIoMiTh4j1cLHc2JI=;
        b=jaEreQk6lQ6QkdlHHYTDnQm3Zi1BP2vWP5hfWeTlzEXqgJrOcN0DiTGc1eOYBBrO0s
         i7jy8vGHXUeO1+UOuzD3gRr7q/5x+xiZQiHqaXrt7cjvmGzBM/qVGXciTE5VYde+PsSF
         vmSrSzeLftA+qMMt49DVkReoKjLaf+2gg/uk7AQJQO33poXDCJeRRU24qts/JpaaFodl
         25kYkRhNGKj6r7HSN5Qo+iY2hpp2YxC1Ezi3Dj5p1+eZ81Pi4WOalzth/44IYrDSZhVG
         dT7LoD/HkMkBVIacZlGgFHA2d45ucUFbjTt1Co20wtU8+NoI//RNPjWi6CUFAJ3bHaUI
         lO+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738605362; x=1739210162;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kZpi3N7y/rWbfK2y4bLstAC2w9aIoMiTh4j1cLHc2JI=;
        b=f4ktcK7U5NsVy6AWrHSOv44CqsknwA8fI5B6AtZMRwPXETjXR4AwFbRzlCvmgnZ4Tj
         8S01bV8nihl3Xq9eiTWmkMtOeQDmK+rlleo8zO6Ra8Br8dqUGfPI2Ce2SvAjIZt1o4Zt
         lXJH2zPIsz0Ujm5r5P16cMcdVoIF8RQBHBmI3QRJLQLnR/xuWd/mlmlwllsydtjapnVT
         6zDqOK6TJdVvhSUOoY7zAvtMTs1fRWoIfwKzLIJ0AAh4gsyuhy781zA9LaJZmkfa6cPl
         1U9XliE4Poc9bgIAe94/WSgz87+vDWGraA7xv6eZ4hoKx2EMXyMMkbutLS7vysMt1tKE
         di1g==
X-Gm-Message-State: AOJu0Yyah7BDovaHyZSrP4wO7wZYdVvvzz+zz57x8ugCDZEnpGT/SUTY
	Selo8mtQD/AyzebciMM5brwF+C8grZdaMdBC1vrYTOX9n2ocoXXkNBRAB/BQgguVUymWbWGspX0
	EkgAsktsj2hZHKJ0uMkaDgJ5jnBs=
X-Gm-Gg: ASbGncv7cG18HqE0iFF/E6gVmABq5fQq0BncOdLiqdAvKp114WIkQJXuzG12rHuGdvd
	lOeh3jheE5p6stkWHMb9LH3ZZogf0thJa/OXdcbWQdBP1qUOO3QP5vY6UXBVZyMCEdK3HBQ0Lvb
	T0ETOkXJe32yijp2Zl+fUsCWmKBaivnw==
X-Google-Smtp-Source: AGHT+IFPf0H+yjKerqQ3pf0mjfxtUND+h0LTJMg28IyAxnO+N0IBnPGRZdM9f7sccjKWKaQfL23Lo6ewrd8UKM3T3c0=
X-Received: by 2002:a05:6a00:b8b:b0:72d:35ed:214b with SMTP id
 d2e1a72fcca58-72fd0c8bfb4mr35482879b3a.24.1738605361813; Mon, 03 Feb 2025
 09:56:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250203141632.440554-1-bigeasy@linutronix.de> <20250203141632.440554-9-bigeasy@linutronix.de>
In-Reply-To: <20250203141632.440554-9-bigeasy@linutronix.de>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Mon, 3 Feb 2025 09:55:49 -0800
X-Gm-Features: AWEUYZmUdIxLoq0ZTpUZ0ejeXSF2OzhJmPk5P1HKzYnJBUb5YKUMC8WoYkHOZcg
Message-ID: <CAMo8BfL8oVi3ED1rybkEbMru0Z_gs_Lh7435QnUKGxop0PEsmQ@mail.gmail.com>
Subject: Re: [PATCH v2 8/9] xtensa: Use preempt_model_str().
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
	Ben Segall <bsegall@google.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Ingo Molnar <mingo@redhat.com>, 
	Juri Lelli <juri.lelli@redhat.com>, Mel Gorman <mgorman@suse.de>, 
	Peter Zijlstra <peterz@infradead.org>, Shrikanth Hegde <sshegde@linux.ibm.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Valentin Schneider <vschneid@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Will Deacon <will@kernel.org>, Chris Zankel <chris@zankel.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 3, 2025 at 6:16=E2=80=AFAM Sebastian Andrzej Siewior
<bigeasy@linutronix.de> wrote:
>
> Use preempt_model_str() instead of manually conducting the preemption
> model.
>
> Cc: Chris Zankel <chris@zankel.net>
> Cc: Max Filippov <jcmvbkbc@gmail.com>
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> ---
>  arch/xtensa/kernel/traps.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)

Acked-by: Max Filippov <jcmvbkbc@gmail.com>

--=20
Thanks.
-- Max
