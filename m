Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FEB51D7E35
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 15:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744297466; cv=none; b=VLssUrTYhl68rkWeujF9M++IJ1ekPEJY8iC0pL/cPrmDS6GUjKNWzwSs0RbKq/a/Ktl9oLiTy5kzQYNonzHFkp5Dgqe/JU+8nS4iulI949F8ZAm4CxBqEvUE4XECfnALMdBeZhYz2is0FN10fIm/U1ov13OXlc4VEnWPTY81bPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744297466; c=relaxed/simple;
	bh=E8idAwS5ka05vFYRVoPPGjqaHrB01vGTJ0ZnmvLeqQk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n+MbU2bP+nU/uaU0FmLyIA+YFaWlP5fmdnuUVP8+f3KFwKu2LGTDlQ06KN5k6LeUv4X0dFS4geS4FXOiImYBbTLUHm+ZM1bkFW8sPK+BLK+VYTsGZsEyR26rX7+vbaw60FModYcHRLWVhS7gHcxwSynMmSvBXiRa/jQ878xm90g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ojDME/Kq; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ojDME/Kq"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-39727fe912cso436930f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 08:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744297463; x=1744902263; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E8idAwS5ka05vFYRVoPPGjqaHrB01vGTJ0ZnmvLeqQk=;
        b=ojDME/KqAXd8ILoH19b2TqSu9mKyJ3/cUKW+tTdEx0iXSAxfqumbOiVhJiTsaopTN5
         ddcPMoIpepKnv01uZe7dW/couDKwUMhQDI4wFjIwyL4oH82rAk4tIAgtrwWlr8gAS4aO
         ce7fbmipuL8/ZzZXlU3Ffr0DxCz5S8YqGFLTTsmFCq+jzK5hZeuWyTL3nEaTofkhIFrd
         k7GlPvG3fsE4Q7lsLkMNM+p9LGReRb99Bej4EkYcnc48CUVaPXhPEhdEG/mbPNHZQPyf
         /HhfRB7XBrckphWlTyWdzRcKlfpa5BnOS0S0AewR7wUTcQibX5cGpIBp+3vyVq48F2Rh
         Py2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744297463; x=1744902263;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E8idAwS5ka05vFYRVoPPGjqaHrB01vGTJ0ZnmvLeqQk=;
        b=cCFqqB3vxny/vdfnsOARPBELfVZMDo5VZdeGuZIis6V6S/v9tgGdeLpqMTdMivAoQR
         azvj0AiXVhJP00NP17oyqEYYTp+1lQak5TCbz74ytHVlbyAZm3RuL9GSgJ3OqwDeVNSU
         fMiwz98Rlmt//ayZv9M43RQXEUgd0B+y4aKzhFKy8ABFzCu/KNboJ3Xr+H6QPfT0+Kcc
         cp9eRsgkUPu7uJ5nCVU5ea8mgWGlWYyaidPF6ZuiDCCKrmfGOYqMakm9ToGsEYKNL6ep
         KQLHfi2okQanU8eQ8ossCc8gaUZKjbsA/jB5HtrSpX6yqM/4KeiPM5r6MpLs1Z3i8Z0k
         WMvA==
X-Forwarded-Encrypted: i=1; AJvYcCX7YWWi2cswjXXztgKz2ST7ZG2ub6GfkaT5+98pPqazkevEeLmDo3km/hnTadmLQ3ZyVR9+pvGq/OQr0cw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0NZ5tZrKEYZucoxgKnUAioOVhBXA8QU1Kng11vGans4clMzN/
	LbUrOBOyzuS0ZOltd61/ghlzkygOy6mPpIif0lyamnib/q9C+534PKSXEgfRqObdvWQgaK1HAUk
	skT2ll9y0Tt8LYjKiGDPNgNsZD5EozJgBf9JQ
X-Gm-Gg: ASbGnct5iS4bant1i5vTdiigEcS9DuVpF5dtxAuwgG/lIJ4VmeL4Cu916OWSgpxkrnB
	UTrHU2uHKpvgoLwpsinO35Kbw4iUJSEJbt4StWr46UhOmbrPOPhN81cUqmaSyn8iHijnbq1tODY
	7ZRCH+ebzJOm+ohSux9Frk+gJ9GKJ/7o2xzj5IH6TBqj9RDkl1zUWj
X-Google-Smtp-Source: AGHT+IHvGrA6pL9xJC71Rglk+R8UnCNP8/PG6RbzhnJl4qgAtYC6oJwdw7O77fLIUePEg2xGL7SeJfKv96Td6xiTjfY=
X-Received: by 2002:a05:6000:40c9:b0:39c:1258:2dc8 with SMTP id
 ffacd0b85a97d-39d8f4fac26mr2743346f8f.57.1744297463073; Thu, 10 Apr 2025
 08:04:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250410123602.GZ9833@noisy.programming.kicks-ass.net>
 <20250410124526.GB9833@noisy.programming.kicks-ass.net> <20250410130944.GA9003@noisy.programming.kicks-ass.net>
 <CANiq72=k+tZ3ACEB5k9qwJ8ZYu-dXkA3=Lisg1b8ze-2D0STog@mail.gmail.com>
 <20250410132649.GE9833@noisy.programming.kicks-ass.net> <CANiq72=Q_Z8KfV+n4z9wWVJsZwVevag=Vh3URe71XkUuWuqEDg@mail.gmail.com>
 <20250410133446.GF9833@noisy.programming.kicks-ass.net> <CANiq72neZj+ESvkxwXAQFnznwYBiQAcpW4OqXg1ckhxZj3fd4Q@mail.gmail.com>
 <20250410135713.GG9833@noisy.programming.kicks-ass.net> <CANiq72=uj3G8ibnzpuYzhY=7T5xrBBPoeuAX7X-iBKdN+crQUg@mail.gmail.com>
 <20250410141534.GI9833@noisy.programming.kicks-ass.net>
In-Reply-To: <20250410141534.GI9833@noisy.programming.kicks-ass.net>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 10 Apr 2025 17:04:07 +0200
X-Gm-Features: ATxdqUEvyW1qop9m9a6mIi5Di6pLCP0HihCzqQQdekJ9tTTteZk6cuZ_FEbf5WA
Message-ID: <CAH5fLggm0Q_EGMHXG6Vu2_7mUPdHd46HC=5dPALRAAOXE8yHSA@mail.gmail.com>
Subject: Re: [PATCH] x86/Kconfig: make CFI_AUTO_DEFAULT depend on !RUST
To: Peter Zijlstra <peterz@infradead.org>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, =?UTF-8?Q?Pawe=C5=82_Anikiel?= <panikiel@google.com>, 
	Sami Tolvanen <samitolvanen@google.com>, Kees Cook <kees@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Nathan Chancellor <nathan@kernel.org>, x86@kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 10, 2025 at 4:15=E2=80=AFPM Peter Zijlstra <peterz@infradead.or=
g> wrote:
>
> On Thu, Apr 10, 2025 at 04:05:54PM +0200, Miguel Ojeda wrote:
> > On Thu, Apr 10, 2025 at 3:57=E2=80=AFPM Peter Zijlstra <peterz@infradea=
d.org> wrote:
> > If you mean fixing it upstream, definitely, but we should still
> > prevent people from building an invalid kernel, i.e. when Alice's PR
> > or similar lands upstream, then we can relax the `depends on` based on
> > the Rust version (which is something we have done for other bits).
>
> So why wasn't any of this a problem when Rust enabled kCFI? Surely the
> testing back then included FineIBT. That has been in longer than rust's
> kcfi support (integer type confusion etc.).

I assume this has been a problem for a while. The testing we did with
FineIBT must not have triggered this codepath. But Rust drivers have
used the codepath for a long time.

Alice
