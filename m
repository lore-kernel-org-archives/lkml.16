Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDE59433A4
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 18:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751307292; cv=none; b=MdRBlWX6DS5oGQFK5G+chCQ+obHOTTXosA3YVTMQQRqV89s8714JPs8HWmbJckrjr1EV9MTuf5zpWbeC8E3G0pyzFXtwZS4Nb3q/DOG300OGoUYAjO+u6+7LCeMb+QSYvvy3/NnNB6ko9QnFfmNwwNwABSS2yQ/FUyPByZ2MB/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751307292; c=relaxed/simple;
	bh=uE/1CLhVseTq2X90BDfKnYPYQeZfMvQHHZ169uUdYbQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZId/oCB1yzsDFna3YVTY44L8H/r/POeZZL+8zsJeiv5bjKE77BzM4fY3YyMBoati8XQ/omyx4GYMuYP6EF43aMF8iXgI1CnM0KvgeGYvtaZsPzxux68ntbNQhx/WZh7137bQ93+04wqqQ65WEU7E0lKhcAgAgurdQqzUXoigtZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IN1aTVRD; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IN1aTVRD"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-313336f8438so1174029a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 11:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751307290; x=1751912090; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fjh4vA0/9tGFd6ND+oD1KaKIqLUUdClc6Lc/84XmOxg=;
        b=IN1aTVRDsaxO6u4tmcEEQU+mNjB7TSArWHSdN4xaNswT2IOshRvph1nQgXnkcQ8oza
         fBFiJO3KLvRO/ijTLPgqK/LHKp/Q2Y999W2ILDwAJ+RWstkAxjq0EgxM1mOKFugpZ8w/
         gycUZZSuN7Uka/hxiEA4jLdpiZLjizD1ZXYUlkpIsvKS2gRQYvPTMVW8hy3xb/Ko0vmt
         rZb9bp7CkfD8o7UBFmgDTqr2vSyX0FMA2e7jGQoJKCcPOyN8cDT2T+X0rv9V8+ABisUl
         X8350i+agfypKfzZV1nHRVRhh5DUWMhs5NTEvSRJ4bxS9XtBdHvkBszQRURkD5jkLSUs
         nxwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751307290; x=1751912090;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fjh4vA0/9tGFd6ND+oD1KaKIqLUUdClc6Lc/84XmOxg=;
        b=uDO7tZdwXznOvy+ld8aq6V61maK21jVpbcfkmgYpIMV93jZgHi6VwYwJK/RMBVT+CZ
         hNpHfCHa0/EwTqTJCfxJ8J1O0vmDwp0KL/vDCDjlPJP5hvDI9h0KJL693YTk2cIkRcJA
         C2YmVCS/SHPrxI17pgw1UfZ8d5PfLhj5LcY8BNFxOORH93VcIEY4X9Wdlmx48lER3Z44
         HD4dBMH8uZdlNjXQAs0J4BflWWOGiujIW5goi4ulfgp5W4fUdQUDMbY7mronnA/luSB7
         ac8Zq4fwld9oRYsZ5cxKurrPmQSFrLDG7dxhW8pU5QemDHpySJw0jsA61aaUwrV2IJ4B
         emWw==
X-Forwarded-Encrypted: i=1; AJvYcCWRaUsh12EdBMi8U5fT1aCM0RQZ/AyZ5q/BxSHmJkQXcXo68tVIzFEPbock0lekKliaHGfI3wG0VIN1s8E=@vger.kernel.org
X-Gm-Message-State: AOJu0YyN7Bb4jkps0pYvBsHeOUrpFLajT0d/8+C7+5U4YF3VAfu7mgj5
	0PRHLEb+Si7SS3kUEKJRayrUgcHYsXgqW43RYJBFgxhvu3Eia3Uqcs2HrC0O8/5PI0eWJsOq1By
	kltBGLUllWxcouiYEJl5EZmHqID0HX5I=
X-Gm-Gg: ASbGncu+Oh9BWQHoF10DsbYtfk8ebYYcuIdqQ+6ANT9hTksDc8HLzLofQkQo6qmR0LW
	W/XdMZn0FjYn7ET7XaN0x6o9Q9wFInjeiNXvDCLGW1lF6lLHQJG2FqQP1uI+IrMch+vCDvJU6Bu
	c+ctGKZhBnzGy46+6aUz/DnxXmTrqH0vpYeOJxtYz3LL8=
X-Google-Smtp-Source: AGHT+IG7fa86LtvjoLxpO8be3RjD2WwHZGWwVRap24uOdaJ2ojBoqB5ygwyY13C0f0w1v0h8n6niNd79tYHE7zV9nFU=
X-Received: by 2002:a17:90b:280a:b0:311:b0ec:135e with SMTP id
 98e67ed59e1d1-3195196fe9fmr128173a91.2.1751307290129; Mon, 30 Jun 2025
 11:14:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250626134158.3385080-1-glider@google.com> <20250626134158.3385080-3-glider@google.com>
 <20250627080248.GQ1613200@noisy.programming.kicks-ass.net>
 <CAG_fn=XCEHppY3Fn+x_JagxTjHYyi6C=qt-xgGmHq7xENVy4Jw@mail.gmail.com>
 <CANiq72mEMS+fmR+J2WkzhDeOMR3c88TRdEEhP12r-WD3dHW7=w@mail.gmail.com> <20250630080910.GK1613200@noisy.programming.kicks-ass.net>
In-Reply-To: <20250630080910.GK1613200@noisy.programming.kicks-ass.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 30 Jun 2025 20:14:37 +0200
X-Gm-Features: Ac12FXyb2DQrVYl-Dwvo78mZOTpBIY790W8DikLM5bA8rznRUGZ1aVN_EqjtnQw
Message-ID: <CANiq72nURu5usLAjj+C47iXPLRrJsNChWKGkVtw9MuDaHUzkfQ@mail.gmail.com>
Subject: Re: [PATCH v2 02/11] kcov: apply clang-format to kcov code
To: Peter Zijlstra <peterz@infradead.org>
Cc: Alexander Potapenko <glider@google.com>, Miguel Ojeda <ojeda@kernel.org>, quic_jiangenj@quicinc.com, 
	linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, 
	Aleksandr Nogikh <nogikh@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Ingo Molnar <mingo@redhat.com>, Josh Poimboeuf <jpoimboe@kernel.org>, Marco Elver <elver@google.com>, 
	Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 30, 2025 at 10:09=E2=80=AFAM Peter Zijlstra <peterz@infradead.o=
rg> wrote:
>
> Since clang format is an entirely optional thing, I don't think we
> should care about old versions when inconvenient. Perhaps stick to the
> very latest version.

I would love that, but I am not sure about others that use their
distribution toolchains (including for clang-format).

Hmm...

If it would now allow us to get very close to the average kernel
style, then we should definitely consider it -- years ago it wasn't
the case.

> You can have per directory .clang-format files to account for this. Eg.
> net/ can have its own file that allows their silly comment style etc.

Yeah, that is what I recommended in:

    https://docs.kernel.org/dev-tools/clang-format.html

But nobody actually added their own files so far. (Which I guess, in a
sense, is good... :)

> Still, in general I don't like linters, they're too rigid, its either
> all or nothing with those things.

There is `// clang-format off/on` to locally disable it, so that is an
escape hatch, but it is ugly, because we would still need to use it
too much with the current setup.

> And like I said, in my neovim-lsp adventures, I had to stomp hard on
> clang-format, it got in the way far more than it was helpful.

Yeah, clang-format for the kernel so far is most useful for getting
reasonable formatting on e.g. snippets of existing code in an IDE, and
possibly for new files where the maintainer is OK with the style (I
mention a bit of that in the docs above).

But we are not (or, at least, back then) at the point where we could
consider using it on existing files (e.g. just the alignment on
`#define`s makes it a mess in many cases).

I will take a look at the config later this cycle and see how we would
fare nowadays. It would be nice to get to the point where some
subsystems can just use it for new files and look good enough.

Thanks!

Cheers,
Miguel
