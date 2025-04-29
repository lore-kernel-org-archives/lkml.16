Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC09513AC1
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 22:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745964779; cv=none; b=Cnd+3nTHTPvqP8dI9iFl665NrQOSMeHrYjx3ORY5U6fwN1ehYLIFgQAs5gwlRWySBSm9xG0jrx5ypCc8Y6DB1M++LLKuMMVvGm6gE/swmY8x946bsEeamzPtoKSc4m44IYozmiLbxCVNwNAmnqKE4/H2x6MU7ZmLrzT1uC36oJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745964779; c=relaxed/simple;
	bh=WmGL1xi+tUy0kJw95JK+hosE/rnJ17TXEhQqVXf70KM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eKbSUE3gSho5lIpWwrLsPmkXiXcH9UIa9GUfxGWcNLEKpBH691yMfF6itmZE0KdMGhlcYyR5jcwLxhwEhYtglQlJVBO3/rR924uVNIjV9L+VFv56dnlH6iymUL/0qtNn4wxKZn5QCiAsWhNhu4SkYEwx0SZXK6iGh9Lq+TT04lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=SLLxxylb; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="SLLxxylb"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5f861d16622so1645842a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 15:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1745964774; x=1746569574; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+FkXn5f7fGyaodgP6TJybZs8fgnt4L8M65LDm06LK3Y=;
        b=SLLxxylbrMak74p2kl7OSJlDOIw3DKMr3ZQ1g6rAIQPLOo1rqM5H24aUMgM7cJXs9p
         9hy6xP+JNGLuhNSD0maIj2a+eA2FaWu1HEQf5hp3jPeJzL/PEA9ardQWyDUz1uhwpCqD
         04Xz3VzDKYebxiSqpwxaO6ci5xmURQlMCWVyg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745964774; x=1746569574;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+FkXn5f7fGyaodgP6TJybZs8fgnt4L8M65LDm06LK3Y=;
        b=u5gG3siQl7hCGrDcJf4eCNIJ68zC37SFycO6Y3sCrMkJ8O0bS5BfRiFRbshA9a4/mb
         4jiV0CeIg71XMHsJAz6xgOX2jp+TZ79hkBv9WFmjBZDmS7vfM7RxSpWq2jrLeM8lGzes
         wUxWwfwYPqkeIAorJmcZiqgCg+erXuthMfVxzNKlIH8IDgTIH6W36BFZw8e6FdH9aY0/
         TM7sYzXB5vWd/xdk3imYOedydAL2TWusc/5JJjW3MA1VFwY9EZYOWPeKx95xXku1PUcl
         tEvRXOm2PGDeriM5wHgMH1zTczmyDt4DAuMD1ra2ETroqT/CM1u3r/7W/b46EFCJG0Pc
         S09w==
X-Forwarded-Encrypted: i=1; AJvYcCX4lPqOnGZxsqaNN9KE73DC4uoqUY/4CkRJXmN5AhB4HjcE1ieUtxci9yMYFkTXtRfbxrhftiCVJV57v6I=@vger.kernel.org
X-Gm-Message-State: AOJu0YwyG6R8poVFo7EWwqNNdaD6q2wt8f6IiUNqnMxq+QbcnI1z3cr0
	SxF8q1sJPblLUuKcVnA9f00O+pd+O5oOowzEP7lk5cqN/tQZijwrJ7O7k194addh5KC1oAkQbk1
	t7FnI6A==
X-Gm-Gg: ASbGncsfsgGQhUVNeGnK63VsSaqma7e0n+1O7EdGakPDcMfZSE7CEkPp9I4ME9Ux5Ns
	w+0Zd5Ib9cYtGAA/8+YJ5VGk96iik0k39KhqWTn//1VxI8IrDln3rHgK/K//qgVY8dLMNfg7AqU
	ndoLNw6DsEgSy9U5900sMz0u9P1St/g/YcJvCVqgTEVe0BNcSoU9DZB6xXUF6KyBgUiLzT+ESkP
	1SwUOQpZ21Pk9B7SOB2s1S61q4Tr1b29ZS7w0HTMoxa2AGKEOxiO1CS0eaoHlc17z6y677MV6jw
	mEmPtILyAHCZZ9wxYYESAP/l1G1fAR9I9YukVVvUe92P7nETvMk+r9/GgE8ZLYXwMFsLNeQ2M6f
	sRvlSP4DUbqZLK6g=
X-Google-Smtp-Source: AGHT+IGR6YNyMReFnaNUJLCixaqidIklp/tXj7Hg931eHWQwoEw9IxW01dMAs3yEf2rx8JrSmI2JkQ==
X-Received: by 2002:a05:6402:3486:b0:5e7:b011:6c09 with SMTP id 4fb4d7f45d1cf-5f89b34d26amr523412a12.18.1745964773828;
        Tue, 29 Apr 2025 15:12:53 -0700 (PDT)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com. [209.85.218.46])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f7013ff812sm8317029a12.25.2025.04.29.15.12.52
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 15:12:53 -0700 (PDT)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ac3b12e8518so1113643166b.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 15:12:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUYWjQhipbuz8D9MSoQTTA3jE8V8ncr2W7ygtdf8wtzwx/uPaBaWaVCHtkurOlZH3qkgYMnqyKYZyeSFqs=@vger.kernel.org
X-Received: by 2002:a17:906:4fc3:b0:ac2:a4ec:46c2 with SMTP id
 a640c23a62f3a-acee260f345mr11952766b.49.1745964287066; Tue, 29 Apr 2025
 15:04:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250425141740.734030-1-arnd@kernel.org> <CAHk-=wgfk69H-T-vMWR33xUpVsWJLrF34d0OwUXa2sHhtpSwZg@mail.gmail.com>
 <e54f1943-e0ff-4f59-b24f-9b5a7a38becf@citrix.com> <CAHk-=wj0S2vWui0Y+1hpYMEhCiXKexbQ01h+Ckvww8hB29az_A@mail.gmail.com>
 <aA8nF0moBYOIgC5J@gmail.com> <aA8oqKUaFU-0wb-D@gmail.com> <CAHk-=wgJfWfWa2NTiTmev+Xr=e8Uo=aFkrXujLAQBVAVN-VigQ@mail.gmail.com>
 <B364FF6D-DFCC-42A7-ACA1-6A74E27EE57E@zytor.com> <67be5eee-b67b-409a-8309-829f891b9944@citrix.com>
 <916BD58C-E6A7-495E-9A60-722E130AC7A7@zytor.com> <e5e97ff8-9670-40d1-a0fa-69504d34c4c4@citrix.com>
 <956DB0ED-F3DB-456D-8D06-6F40DBDB815A@zytor.com> <06d04c13-76e8-45fb-a563-e365e1f19362@citrix.com>
 <CAHk-=wig1E4B-e1_6=it1LfVQ64DJsVgO6f6Ytnbzm2qChbAdw@mail.gmail.com>
 <81ed8b53-1a40-4777-ab87-4f4abe032dbc@citrix.com> <CAHk-=wiAPQFf-RUr=8ra1sYdfGPGLb4QbV8THE9zY3n820L94g@mail.gmail.com>
 <72078B8D-F03E-4783-8AC2-A36464A4B6A1@zytor.com> <CAHk-=wi=nuDW6yCXSA-dEztZhXNuzLOaH--s_V7GOAE7n6RsRw@mail.gmail.com>
 <565ac06a-005f-4b77-930e-d63285c025b9@citrix.com>
In-Reply-To: <565ac06a-005f-4b77-930e-d63285c025b9@citrix.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 29 Apr 2025 15:04:30 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiMN7eMYE=SiA07f2aFFeuEV0YJ-ewoW4rJ3yQfbviuJA@mail.gmail.com>
X-Gm-Features: ATxdqUEynECRHmJIlVNEBwYKhXX-8mTK6BavCcTzrr-kqqOzz7SzQVGFOa2_KmI
Message-ID: <CAHk-=wiMN7eMYE=SiA07f2aFFeuEV0YJ-ewoW4rJ3yQfbviuJA@mail.gmail.com>
Subject: Re: [PATCH] bitops/32: Convert variable_ffs() and fls() zero-case
 handling to C
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Arnd Bergmann <arnd@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Juergen Gross <jgross@suse.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	Alexander Usyskin <alexander.usyskin@intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?Q?Mateusz_Jo=C5=84czyk?= <mat.jonczyk@o2.pl>, 
	Mike Rapoport <rppt@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 29 Apr 2025 at 14:59, Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>
> do_variable_ffs() doesn't quite work.
>
> REP BSF is LZCNT, and unconditionally writes it's output operand, and
> defeats the attempt to preload with -1.
>
> Drop the REP prefix, and it should work as intended.

Bah. That's what I get for just doing it blindly without actually
looking at the kernel source. I just copied the __ffs() thing - and
there the 'rep' is not for the zero case - which we don't care about -
but because lzcnt performs better on newer CPUs.

So you're obviously right.

            Linus
