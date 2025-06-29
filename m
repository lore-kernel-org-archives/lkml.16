Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09D1C4A0F
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 19:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751225148; cv=none; b=e4GmR/eJf4j3Bm3OPpbARn7t+FDhLUG9WovMV1pzYGBtDT//H5dB/S40gyhEB2JuDXFFZ746Bb31aoSdvu0cw8AYPNkq9dIJT/gPy6kXEtiXzUvV+OtpRrgEJ0ti3+YDDMqg2ohTeXELGcjC4XAhGrFgDp+YHx8W5bo+RLymzrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751225148; c=relaxed/simple;
	bh=y20xUJwqc+Vl97NT8HBTLKHOwEwVH/qR2d88daEIqMI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oYPqmOuT5vx6QpQaGaoRWppBLl1I1h+D3/7rYib2xxPy5GbX81lyFx8ACtzUISasauGJqhwIBmzNCYUkdpCh6UaxxK1MvBxf+TkuK5Oav4tnF0k/DHnGL3QfCahoEPKXM80HoYOVOeSX64raeJlnFfnKcstyxlYnGf1ZMrTaxEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TuITAcXL; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TuITAcXL"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-313067339e9so627333a91.2
        for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 12:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751225146; x=1751829946; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y20xUJwqc+Vl97NT8HBTLKHOwEwVH/qR2d88daEIqMI=;
        b=TuITAcXL+aWczJzkJsmCR7obGCwQcCnYmVHFzfihX1ydz+FI+FVoZBqTj9SGn/qCs7
         oOjP9xuEmirKg6tl9o/BBKE6AClKj5eLeprzctgF4Ou2nETBK6JJPivZmodrXvIROB+E
         MV+HO6znaPqJQFs0+KhbCMaLK3QsHde7435UgzmV1YOaEM0xSITuhBNisx/Z9Z04yBhu
         lS3P7ci7WAel+vXsvq2EIfN4JoMTfYMhy6cDscbdyk3EbwaAtLg+XJ07+ZYA787k4szp
         n3mRpUhCWKGpvpTEyakKOWWYJkewumD0Uxyz1PwbO5wFnFFCRsh/ZWcgxyUQmQLtiqzf
         64TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751225146; x=1751829946;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y20xUJwqc+Vl97NT8HBTLKHOwEwVH/qR2d88daEIqMI=;
        b=qwIvWTwlqq+Cnpj/pxHYpoXW1tdflQD53h+nim5gr+PJlue4uHH4jRe9qSVx83843E
         hbSFYoR2XjYZPPGmN4xJDjnsMJs3owQ11PhyZ06l51VDqbDopJKY6ykiOPdLZ+ICCz2L
         XHbUEvMKXofh0A7BWacZzjjA2VDquU6JRmrDf7o3fBA41ta71LMH4bgkv6pUR4IzTUIn
         WM3Pmt/OXSJe18v78Bv/rWtoZMcBrNWMPSVCrkVnr2g23v//4vCSiMPe9lBGMOaLdKot
         kO7RLXmB70koJ5vS1KASU66nT9XWkaocP47LAusLn+YIAuLudoGh/oRYkZ/zUHzpybQ7
         niZg==
X-Forwarded-Encrypted: i=1; AJvYcCVWZmmabkWMfu5agjNd4J1hKH26Wuva4Dl0qJN2O0ar4pWdx7gF1ALBtoHH5/Ub4xMZ4jCM9j2dzPvp7uQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxfWOqxq0MOHfIsXff1CUZVAvwbLJRlww1JYvB0LS7fhuXezve0
	ezXGrto92HtKWMdi+UjoJBWQ958jgoP0UfIzpNHjRwhE/dvyVBwBpAHbvhVmxkDuAEL5t+8gNDO
	I9KXaQg/Rb0uHEVOn8GeA4Mxbsf3mq1I=
X-Gm-Gg: ASbGncv23bEn1WERt0WbM8Zy+EiVp9vDjYpNDBgWAVnBy5scx1NFQla1mBibVuqCMnv
	HaNXcl0BBWHm13TDA3dQP4OdyoYcXrrNaxwGE3PciflD1Nw+jqL0FZsaIVLRJ4z8zjEtUTeeems
	6sNoqjWrKmMYv9AtnSy1x4VOUJUZsJnrQJZC3Sx35vgOQ=
X-Google-Smtp-Source: AGHT+IHOuL7C0BRSjZ/50FlQgZYxDPcSJ/ZsUttHVBXdD4rxwlPd0mVpZhBunwEupqCcrIYhAUtrR1yuhaIVD0cS/tY=
X-Received: by 2002:a17:90b:1d88:b0:313:2f9a:13c0 with SMTP id
 98e67ed59e1d1-318ec333f66mr3768349a91.1.1751225146187; Sun, 29 Jun 2025
 12:25:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250626134158.3385080-1-glider@google.com> <20250626134158.3385080-3-glider@google.com>
 <20250627080248.GQ1613200@noisy.programming.kicks-ass.net> <CAG_fn=XCEHppY3Fn+x_JagxTjHYyi6C=qt-xgGmHq7xENVy4Jw@mail.gmail.com>
In-Reply-To: <CAG_fn=XCEHppY3Fn+x_JagxTjHYyi6C=qt-xgGmHq7xENVy4Jw@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 29 Jun 2025 21:25:34 +0200
X-Gm-Features: Ac12FXxmpz3C8AlbbdlYHddP4CtTveSZCQxyhvgXre6C579OA7sLk_AQ2GhDFsY
Message-ID: <CANiq72mEMS+fmR+J2WkzhDeOMR3c88TRdEEhP12r-WD3dHW7=w@mail.gmail.com>
Subject: Re: [PATCH v2 02/11] kcov: apply clang-format to kcov code
To: Alexander Potapenko <glider@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Miguel Ojeda <ojeda@kernel.org>, quic_jiangenj@quicinc.com, 
	linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, 
	Aleksandr Nogikh <nogikh@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Ingo Molnar <mingo@redhat.com>, Josh Poimboeuf <jpoimboe@kernel.org>, Marco Elver <elver@google.com>, 
	Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 27, 2025 at 2:50=E2=80=AFPM Alexander Potapenko <glider@google.=
com> wrote:
>
> Random fact that I didn't know before: 1788 out of 35503 kernel .c
> files are already formatted according to the clang-format style.
> (I expected the number to be much lower)

Nice :)

> I think we can fix this by setting AllowShortFunctionsOnASingleLine:
> Empty, SplitEmptyFunction: false in .clang-format
>
> Miguel, do you think this is a reasonable change?

I have a few changes in the backlog for clang-format that I hope to
get to soon -- the usual constraints are that the options are
supported in all LLVMs we support (there are some options that I have
to take a look into that weren't available back when we added the
config), and to try to match the style of as much as the kernel as
possible (i.e. since different files in the kernel do different
things).

Cheers,
Miguel
