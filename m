Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BD5F27E1AE
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 07:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744358008; cv=none; b=XEX2crDGRpsbwStMCGDNz2XrnrztmoKJAmG9LDccu5Vu1WnGzf2G4ib9SibS+KcLgtBvrx4LfH/WvOhBjhp4o+zbdO7pLoAD1q4FgyteJTeTdwBfpwL/8rpJfLSa9CcU6qPl6J3VB8MiM4YOIDTnWOu0BC/wXF8ZvhrG7c5ZPTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744358008; c=relaxed/simple;
	bh=wrMIIyoNkg0GvWLVsFxO4DWjVl+zeWy2K3A2/oJhLyo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YN7f0DbCcc2z/e/JtZ0m13+kRf8ltLHmMxjWR2uUzi0VnA/zCmR621TVbeEFgqMnFrR+RcJnzhSpfwhaAGFhvX3WzydH8Dm3E6dPjL0RzxfdaDWiDps60cWjYCvjoyHNwqgCEFtwJMYpVkc69Ot9p7uSyKsBzPsdgMgsXE7vHN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pqe77l09; arc=none smtp.client-ip=209.85.161.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pqe77l09"
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-601a891ab8fso1020367eaf.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 00:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744358006; x=1744962806; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gBcUPPWMo0x9QRBDKxX86bCRLz+TjlTr0rHbbRjUHX0=;
        b=pqe77l09aNbhVbR0X1m6U9OcLJ3dHND3iI/Wo8B0I83UkVVHXABP3O0fQM/B6jbIOa
         ZvCjMG/A4GNS1+kFxOzulUCq+72py7l8auYmTm4571ceGVSdaPK4PpguPUwEjw3oxR3s
         YIWJBTTDS/kBq63jCJHQjh94RI/0qVWKssJhwoVLLl28DpajG6eiqSOcwfzkY/a5D5gz
         MHfouekzgna5kaqFHLbUSwAmcu0TY2wrjEuV42r/LwWLoLyr0Aw810UXim2cEAbVNP1D
         CBo25jjWiZPpcyPwgB7iD6vwZujay/W8KrBytHJgoKs75MSvI1b9XggDAiBVyzpjB642
         jlDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744358006; x=1744962806;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gBcUPPWMo0x9QRBDKxX86bCRLz+TjlTr0rHbbRjUHX0=;
        b=O3SaLva8c08ay5a7WTtak75NOOpNQAw3rqBkfD1h7nguaciNy3l6RE2fWsI5801fsb
         Mw9bZPiXDtS6F9/1hT0P67JW6x3/4DqCuNA2ynlmWLvo10DlfMkaGapNSYg8RqnVX46A
         kGcVuteALFkok/lYB7y+8m734owVyP1aAaq0ZlV6PX8/Fn8xfHGavp8r9ykPsz2nnYTW
         eNgKfqDUTP/lYRiuDUqycYK0DIahVURbn9McxSpaM130OSLoa9u1kzKCJvIjq7uuFyRh
         eFnOpNNSv5c1RLT7oL+W36cgbYUla96dIcT0BBMzesp7EEx95ejMGt+5EZTbFmC08t9C
         FPDw==
X-Forwarded-Encrypted: i=1; AJvYcCXysJsL/YmXlGcuQevStlCXaXGRKXwwBylO+chBOunINqwFTW9G4iBy5Hw3iDkoOSnLrjoWKjW6mkKqqn4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDtBNh+OM843Mt3f4YgCwQf/g4NxBPn4Ju3H9rLYdJLkWgYUyN
	iWNyqDItLty9C673TWJqRK2jc/M47rrBkERskO+ut8jxfeFtMPwGyU5FbRPhDygGs49gpcjUtwx
	cMOv6m0D55+lBK7bFS4g45XLG5vYhh/9NJS08
X-Gm-Gg: ASbGncvPNAexx7cH7L2goPH6vBqGXBSGowBHseElYwQdPucBfoahPTUdVQZs7j5SwCk
	gf6Y8vhsWWz4DDy3wjuY3Cz2T9w0A20kkw9uLAw6Nl+1kK+R7zH+QpPIH51a8iomT6pOg0YAIcj
	AbFJ/wlTyaIImW8iZEZ+P5YN2rzgGq0l5NPMvOle5DG/C9Hj9Lz9DUSSkINR/LP00=
X-Google-Smtp-Source: AGHT+IEH6DSKeIBYYPYId0RQDbPKVQO5OtuscgU/Q/XSMiWHlIBnLJLkY+aJDN2xt2jxZyk39bRLfXuVbV6FVIzl/7s=
X-Received: by 2002:a05:6820:4b95:b0:603:f809:ce19 with SMTP id
 006d021491bc7-6046efe70c4mr1060061eaf.3.1744358005750; Fri, 11 Apr 2025
 00:53:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1743572195.git.viresh.kumar@linaro.org> <35f4223be4a51139348fed82420481b370d7b1db.1743572195.git.viresh.kumar@linaro.org>
 <Z-1b_FkYUJEIj-YW@thinkpad> <CACQBu=WMu_CmzERJAHmjiuQ-NZe6DK2kAkvP0cnFN-Y+QhRwvg@mail.gmail.com>
 <20250411070941.6xbz4lrwkejr3aqf@vireshk-i7>
In-Reply-To: <20250411070941.6xbz4lrwkejr3aqf@vireshk-i7>
From: Burak Emir <bqe@google.com>
Date: Fri, 11 Apr 2025 09:53:14 +0200
X-Gm-Features: ATxdqUEwLh2_74YKkrLKK7zDnyccoB-LkD8mJ3kuQwNJnV5zwsNXnIYA6mqlKX0
Message-ID: <CACQBu=XxT9x3w4=zd4+cRuePWi-8tqcfaPtNqioS7oENNiff_A@mail.gmail.com>
Subject: Re: [PATCH V4 1/2] rust: Add initial cpumask abstractions
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Yury Norov <yury.norov@gmail.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, 
	Danilo Krummrich <dakr@redhat.com>, rust-for-linux@vger.kernel.org, 
	Vincent Guittot <vincent.guittot@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 11, 2025 at 9:09=E2=80=AFAM Viresh Kumar <viresh.kumar@linaro.o=
rg> wrote:
>
> On 02-04-25, 18:00, Burak Emir wrote:
> > On Wed, Apr 2, 2025 at 5:47=E2=80=AFPM Yury Norov <yury.norov@gmail.com=
> wrote:
> > > On Wed, Apr 02, 2025 at 11:08:42AM +0530, Viresh Kumar wrote:
> > > > +    pub fn set(&mut self, cpu: u32) {
> > > > +        // SAFETY: By the type invariant, `self.as_raw` is a valid=
 argument to `cpumask_set_cpus`.
> > > > +        unsafe { bindings::cpumask_set_cpu(cpu, self.as_raw()) };
> > > > +    }
> > >
> > > Alright, this is an atomic operation. For bitmaps in rust, Burak and
> > > Alice decided to switch naming, so 'set()' in C becomes 'set_atomic()=
'
> > > in rust, and correspondingly, '__set()' becomes 'set()'.
> > >
> > > I think it's maybe OK to switch naming for a different language. But
> > > guys, can you please be consistent once you made a decision?
> > >
> > > Burak, Alice, please comment.
> >
> > I really like the explicit naming convention that includes "atomic" if
> > an operation is atomic.
> > It seems also consistent with std library.
> >
> > > Regardless, without looking at the end code I can't judge if you need
> > > atomic or non-atomic ops. Can you link the project that actually uses
> > > this API? Better if you just prepend that series with this 2 patches
> > > and move them together.
> >
> > The type &mut self gives it away: the Rust type system enforces
> > exclusive access here due to aliasing rules.
> > So a non-atomic operation is sufficient here.
>
> I should leave it as is then, right ? Don't rename to set_atomic() ?
>

The issue is that your code calls `bindings::cpumask_set_cpu` calls C
`cpumask_set_cpu` which calls `set_bit` which is atomic.
So if it was only about naming, you should call it `set_atomic`.

More important than the name is the meaning: you don't actually *need*
or want to call to call (atomic) `set_bit` underneath, since you have
`&mut self`.
So you should rather introduce and call `bindings::__cpumask_set_cpu`
which would call the C `__cpumask_set_cpu` which calls the
(non-atomic) `__set_bit`.

Example where we need bindings helpers for both atomic and non-atomic
versions: https://lore.kernel.org/rust-for-linux/20250327161617.117748-3-bq=
e@google.com/

cheers,
Burak
