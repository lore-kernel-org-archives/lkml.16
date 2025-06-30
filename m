Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FA6B1E7C10
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 06:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751265671; cv=none; b=ISGfnIQZ3ivK+T41tUTpKw4Wov45S52xjosxOlWayrIX6J5aqDdFuiGQ5wGOE8VEANF6V1SpNcxworH/VuWvrjwd3cdIZgFBhGcyWrCBjz/+u9Z4IJIadtLzLx9f+px+y96U5nQKK1A3yFnzwKGkW4gRlw6QhgSgFG6tfkZsWE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751265671; c=relaxed/simple;
	bh=KE4BFQ7g5uCPPVBD+0L/Hx9uj+DiN/T64Ob2w4MxMrM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cbO2K1DGcPg7sZvQr034AT9YXLNQlkBIgyegIrxuxwx8q+SxmfarMvtn4lUvrS6DNpQV0MwvS4pp/h7ZswQRj8EHw7mdtAD3tb3lqJXkYqd2AHlDE7Bv7LbzkA2wUgO7nWDaDZBBEQ0U7AlSv8XJcB9eY3Uq48O5bH+YY0gkVr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oLJiOuqe; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oLJiOuqe"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6facf4d8e9eso17691456d6.1
        for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 23:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751265668; x=1751870468; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KE4BFQ7g5uCPPVBD+0L/Hx9uj+DiN/T64Ob2w4MxMrM=;
        b=oLJiOuqeJSqhelg2bEuJSx+6yO4JtqBDbScJP7OVFDJEl8J4/G0PHZzMlsrfkdYhfW
         c4YZKXWccXc0a9BD60fpnIGVUQFeRmgXIfToHW/MSknDV/Hb2K89FO39M8pYTRgfbfTW
         +LT734sy4X3ZPjcPuj4isSiSjSXUaE0vk/7WIFMCPm7qgtPpF2tkexJ/dihR787TXGmW
         /Pov1Oyp9IZvDD56kVVNxs4q1ejVpYpV4wNExhsvsoGBsASWRCW1INbNotRIj98/XrbC
         C6dN25L18mZK7HIoVy8h5inQVJFVOM+vSgLBHpSW8C9nxVswEgIcAupeqCA6Owba3Tft
         JUkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751265668; x=1751870468;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KE4BFQ7g5uCPPVBD+0L/Hx9uj+DiN/T64Ob2w4MxMrM=;
        b=FzQTkfTQtm7QTDryWdo6fkBnBhamBRJ26/xvb8hZ9co2wLgatexOdPOUfurPwWuEWN
         xI3GE1VC1c5taBJKLlI2lCDYDo2r+zR7bdtOAQIsNNIvADoORkQWbhG52bF69Qj5ZVUD
         +wMT3K/p8P9uD09ATluf0eaFZ3IJDLAV7oGroR6CZ4E8KrsVXOQcXr+Gu+RUWRFbAuWg
         AE/ieek7njLgrA3gEBax9CvIMxeA7EAvTy6VMQi6hFNaD7BVkurAoKFrEZUAClxoXGW/
         6NLBsev8i1qVtdYoCPEl1h5X3BD+dHWrTufbAlHNr1VUmyA2peTTUgyn1xeZeZ67ignk
         E+zA==
X-Forwarded-Encrypted: i=1; AJvYcCU0iRQUhK7Rgoj0Gk33l/GHLqNXvnni2XWQdn3mHzgs9ckY24p32eMps54U+VQG++3nD0S4XhcHwbrRv+s=@vger.kernel.org
X-Gm-Message-State: AOJu0YyElQz7fLhKYd5adQ9isnDEwOVDgSP6pRwIzgS4ENaNZBt9Tuwj
	p2+gCYgtnxP8uFiENpfC5gjR5sb86k+0L5Grx/9twHdG6OgDnbXRDlJ2y8UsyoPNR4cBrrK5PgD
	an81k/IOuIUeN+o+PqUp+n/FXxUA5W/fjvHtaBBa9gVGNeq8mEAoazYrh
X-Gm-Gg: ASbGncsBFP/kF7cZAgYtu8zbGM5U0nWZy4IM9uDUPK9zokVxVkcim8BrtVTuzCtqQk9
	oenctHekdiGKBE3mQ5AZn+9nWIpcpWvdVL0IgoNqgGXmIR3DqTcMaRLTKllXnK2HwM2VfbBGVAG
	pZGrRQnXTHyjF/5lnYmvujjmu0dDyPXscu4PEz7062mUfkSv/kYCedJ4Xmzlhw9ZqWP2PDHTdZT
	w==
X-Google-Smtp-Source: AGHT+IGcDFLU9HiT6y0HJwP6tbc1tVN4NHWmYEOZcXE7Ea9kosh2we/UmEozg53TXIYUPuadeXVMmRYez0QPDKDYMVw=
X-Received: by 2002:a05:6214:b66:b0:701:78e:333 with SMTP id
 6a1803df08f44-701078e0339mr5796426d6.34.1751265668277; Sun, 29 Jun 2025
 23:41:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250626134158.3385080-1-glider@google.com> <20250626134158.3385080-3-glider@google.com>
 <20250627080248.GQ1613200@noisy.programming.kicks-ass.net>
 <CAG_fn=XCEHppY3Fn+x_JagxTjHYyi6C=qt-xgGmHq7xENVy4Jw@mail.gmail.com> <CANiq72mEMS+fmR+J2WkzhDeOMR3c88TRdEEhP12r-WD3dHW7=w@mail.gmail.com>
In-Reply-To: <CANiq72mEMS+fmR+J2WkzhDeOMR3c88TRdEEhP12r-WD3dHW7=w@mail.gmail.com>
From: Alexander Potapenko <glider@google.com>
Date: Mon, 30 Jun 2025 08:40:30 +0200
X-Gm-Features: Ac12FXwQ3KyU9JI18-CURSuz4kh9KR0p0Ug2G1ubWlyoHQNeoc8rvy7TtHAb5Yc
Message-ID: <CAG_fn=X9++bk+NROCGZukxrDpL0_F6sSb5oJenEzC9Kwi+zk6A@mail.gmail.com>
Subject: Re: [PATCH v2 02/11] kcov: apply clang-format to kcov code
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Miguel Ojeda <ojeda@kernel.org>, quic_jiangenj@quicinc.com, 
	linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, 
	Aleksandr Nogikh <nogikh@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Ingo Molnar <mingo@redhat.com>, Josh Poimboeuf <jpoimboe@kernel.org>, Marco Elver <elver@google.com>, 
	Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 29, 2025 at 9:25=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Fri, Jun 27, 2025 at 2:50=E2=80=AFPM Alexander Potapenko <glider@googl=
e.com> wrote:
> >
> > Random fact that I didn't know before: 1788 out of 35503 kernel .c
> > files are already formatted according to the clang-format style.
> > (I expected the number to be much lower)
>
> Nice :)
>
> > I think we can fix this by setting AllowShortFunctionsOnASingleLine:
> > Empty, SplitEmptyFunction: false in .clang-format
> >
> > Miguel, do you think this is a reasonable change?
>
> I have a few changes in the backlog for clang-format that I hope to
> get to soon -- the usual constraints are that the options are
> supported in all LLVMs we support (there are some options that I have
> to take a look into that weren't available back when we added the
> config), and to try to match the style of as much as the kernel as
> possible (i.e. since different files in the kernel do different
> things).

Okay, then for the sake of velocity I can drop this change in v3 and
get back to formatting kcov.c once your changes land.
