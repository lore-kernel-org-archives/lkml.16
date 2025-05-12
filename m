Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1EF724DFF3
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 20:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747082383; cv=none; b=VMutgiKHp5hmagyT2sEli1yULLh4o0IeEC2DI7DHhmmMfvkKn9NJEwNYkRxtcvGiWDioTU3mVnO+TYFUxJMMIzgp9L8GWILaPXpYsAefNxjNgfkTsj3CobFZiq6POn/r5HYB8B4sObXAEcz3FaOI0qvul0Rd+cvSClU0o6hulbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747082383; c=relaxed/simple;
	bh=OWkH0J1ZOWK9WBmRgjhK1xQLkFYeWQ0bVo0U5xAyXFY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EONsKqOvyAUkZA53+q4wspTBSayub+mdYnya9r6SB1ZygPsRg8iYt69xfjj51N5kp9NkgnvNIPzMJ4jmckJ7psdg+r/x5SXu2kOaWOek1rbX2ghSkZuN96cOZpohGuojS7IBtDmJuTcVnL9OhVf1F8vhR8Pokzmb3vl8MX6syRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=FhTUPtPk; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="FhTUPtPk"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-acae7e7587dso770724366b.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 13:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1747082379; x=1747687179; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VB82LSl3X7/sYwlaQo+70F0TQOP7V64K466YMaAygoY=;
        b=FhTUPtPk370VHzMMzeQ+84iiGfOujkzkOeozfOsquUaXi3CNuXkcTrm234pu3IN2nW
         AFzzOT57zNh26K9Lw81kC1uU/4q6IERUIbPUmWWLPcUc7HZGmqZ0+zZ0If+iqmwaQZ9k
         Ibc8GJOxsx9X7NKzO+l4ggtT5mFHbdG22YoqA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747082379; x=1747687179;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VB82LSl3X7/sYwlaQo+70F0TQOP7V64K466YMaAygoY=;
        b=rBmvIeLP6MU2NUDBu57VmNIl48W16uEWxuQ++d8pFRDhBpq0Pv8Dd0zdRI0PeOxE5s
         xFg1fwSVvEzfm0rsjursz/ajTHtwyIqRky/4tzKitYyJwMD0bqrPofvORbiXbfywcfPy
         jm2v+H4LBDEY9VMiHiUjD+zBlEiu5vH/D8PTG2NkZxRDQnsWOyz0EsmNy0RfCYpLCYdK
         QFMoYGbJBA3XTNRak2JsFio24Tx/gjjpKB4dM2FNxHVAJ4Qi7y45BrM1B3LDeOWbTiqN
         LcZBS0kuWXBm54TB8HktFjeCaZC7ND7USrrEhG5XaaRCKgBnPEMIR1uoEfZwozosPlnQ
         Hqrg==
X-Forwarded-Encrypted: i=1; AJvYcCVe0dj6cn4cC7M91brI63bspHwolqUwuTWAYxw90WVIhNfMhowu6x3OQNaVS8xyNKy9E/cFqRuL3ITj1BY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2Ow1UVSO8V7y6sNxYTQPsL3CmsMmPb8XEyfyBkJlkQ4hyXdV6
	oql6+AbkzVqlxR2ehAwRAGt8GCgGNB5b3bSPnMNlOLZnOA6awKnDMyRea0B4/b7gXqhP/1sy7IV
	P2MM=
X-Gm-Gg: ASbGnctwp6CY+bROzn33e+PO+SDAoKoXGx6UBWfiz6+5xbYcWicsnXg2jV4FMOkAJbZ
	3Bn5wG8EcKccDXjPg3RbMQUQjegXcxQ43SQ02qS7bmVed+ZKiVlWdyCNlOniaq4YUQWAiNKYKGT
	ks/PbyyglB/QxHcvW7gnmM3HYLgzVCKjq9coDwOufkk2IIE4ezIptwdwQ4D9mQR8T3LXrrd/nRB
	JVaR2/JI0oLXaJdW0e1xf9PThbNz9ja6PBWIycBfZ++UyV0Kn9ARJSFZQxlFr+xPZQQedQfET9Y
	C1BUsWHm0jvG/USuD/m5SmaiEKs7CLtH1kU8DDs2u5oeGmYr5273lE2R5gRr+RwQK8OfUGu3hZp
	I0iBL6NXeap39GCMa8c2rk3267w==
X-Google-Smtp-Source: AGHT+IHKnUAQGCpLDuGNv3Zf0zxllTS3zqlIHGDbNUQ/GtHqLELoUOiZqsfU7poOjy0CpT7v0z4lYA==
X-Received: by 2002:a17:907:dab:b0:ad2:e683:a77d with SMTP id a640c23a62f3a-ad2e683b1b1mr386735566b.55.1747082378719;
        Mon, 12 May 2025 13:39:38 -0700 (PDT)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com. [209.85.208.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad2197ca2b4sm657616266b.160.2025.05.12.13.39.36
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 May 2025 13:39:36 -0700 (PDT)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5fbc736f0c7so6934579a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 13:39:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWf+imgPT9pt8UUwcdSqXek7zUTCTFZCsFJXF8XjuN6547eo88dN2xXvccGLIofAkV78ac3E2whCQRLsMY=@vger.kernel.org
X-Received: by 2002:a05:6402:2114:b0:5fd:178d:f867 with SMTP id
 4fb4d7f45d1cf-5fd178dfc01mr7955993a12.25.1747082375924; Mon, 12 May 2025
 13:39:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250507072145.3614298-1-dan.j.williams@intel.com>
 <20250507072145.3614298-2-dan.j.williams@intel.com> <20250507093224.GD4439@noisy.programming.kicks-ass.net>
 <681bce2193f38_1229d6294c7@dwillia2-xfh.jf.intel.com.notmuch>
 <20250508110043.GG4439@noisy.programming.kicks-ass.net> <681d8ce06c869_1229d6294e@dwillia2-xfh.jf.intel.com.notmuch>
 <20250509104028.GL4439@noisy.programming.kicks-ass.net> <681ea7d5ea04b_2a2bb100cf@dwillia2-mobl4.notmuch>
 <20250512105026.GP4439@noisy.programming.kicks-ass.net> <20250512182559.GB25891@noisy.programming.kicks-ass.net>
 <20250512185817.GA1808@noisy.programming.kicks-ass.net>
In-Reply-To: <20250512185817.GA1808@noisy.programming.kicks-ass.net>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 12 May 2025 13:39:19 -0700
X-Gmail-Original-Message-ID: <CAHk-=whxPoFnZ4cLKh4X3m4qVcaak__G8+0iG-aOGO7YkS3LdA@mail.gmail.com>
X-Gm-Features: AX0GCFucCgAEV3-emriKKBbjXcTa9Ydw5XnavTKwpk2LJuNulre0nPwWMN_luBk
Message-ID: <CAHk-=whxPoFnZ4cLKh4X3m4qVcaak__G8+0iG-aOGO7YkS3LdA@mail.gmail.com>
Subject: Re: [PATCH 1/7] cleanup: Introduce DEFINE_ACQUIRE() a CLASS() for
 conditional locking
To: Peter Zijlstra <peterz@infradead.org>
Cc: dan.j.williams@intel.com, linux-cxl@vger.kernel.org, 
	linux-kernel@vger.kernel.org, David Lechner <dlechner@baylibre.com>, 
	Ingo Molnar <mingo@kernel.org>, 
	"Fabio M. De Francesco" <fabio.maria.de.francesco@linux.intel.com>, 
	Davidlohr Bueso <dave@stgolabs.net>, Jonathan Cameron <jonathan.cameron@huawei.com>, 
	Dave Jiang <dave.jiang@intel.com>, Alison Schofield <alison.schofield@intel.com>, 
	Vishal Verma <vishal.l.verma@intel.com>, Ira Weiny <ira.weiny@intel.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 12 May 2025 at 11:58, Peter Zijlstra <peterz@infradead.org> wrote:
>
> > GCC is 'stupid' and this generates atrocious code. I'll play with it.
>
> PRE:
>     bf9e:       48 85 db                test   %rbx,%rbx
>     bfa1:       74 1a                   je     bfbd <foo+0x5d>
>     bfa3:       48 81 fb 00 f0 ff ff    cmp    $0xfffffffffffff000,%rbx
>     bfaa:       77 11                   ja     bfbd <foo+0x5d>
>
> POST:
>     bf9e:       48 8d 43 ff             lea    -0x1(%rbx),%rax
>     bfa2:       48 3d ff ef ff ff       cmp    $0xffffffffffffefff,%rax
>     bfa8:       77 11                   ja     bfbb <foo+0x5b>

I'm not convinced that's actually an improvement.

Yes, it's one less instruction, and three bytes shorter. But it uses
an extra register, so now it might make surrounding code much worse by
making register allocation have a harder time.

If you *really* care about this, I think you should realize that the
non-error case is a valid kernel pointer.

And we could add some architecture-specific function to check for "is
this a valid non-NULL and non-error pointer" with a fallback to the
generic case.

Because then on a platform like x86, where kernel pointers are always
negative, but not *as* negative as the error pointers, you can check
for that with a single compare.

The logic is "add MAX_ERRNO, and if it's still negative, it wasn't
NULL and it wasn't ERR_PTR".

And while 'add' needs a destination register, 'sub' with the negated
value does not, and is called 'cmp'.

So I think you can do that with

        cmp $-MAX_ERRNO,...
        js ...

Sadly, I can't seem to get gcc to generate that code. But I didn't try
very hard.

              Linus
