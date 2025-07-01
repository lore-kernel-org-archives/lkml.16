Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF47C27E071
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 17:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751390659; cv=none; b=OiVMXhAhNEZzGFNZpSl1wN8y3smGjON08oX/awSaBjrv6N4meOMxxgQFVMdgTo3o5WoUsxZRQ8f+Qc8/JuJJ6tUD+S3GYlouqmjVlO2xfPEhuTox/pHmWPTQ4nZ2vCZArL899LRQAkV6Kv4CioXsHhu9QglifF5g0sV2vSwTC1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751390659; c=relaxed/simple;
	bh=zXorP0aHXYEM7YGD8CdDJaNtPHdWDyvo5IePuvsVQ1I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AGPnId9JMWwCsa6NOnlPDFRlsIn+lOfqEaRUU2XBKe9W0VDYrZcZQNgL4hS01XnEs1INQXawLOBNEFN8IIoXQY4fr0GM7/WlIqWWr+MdN2QrwO5M3a61pt1i8jevZlozr2oe3bvlgnLBABC5OKcMDygn8J4gxZvy3IQ3t9B3FC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MjkQpnuI; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MjkQpnuI"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5f438523d6fso11815a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 10:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751390656; x=1751995456; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SQNkN/ZgyhuKuim3tffdar1QYfhVDSTf7v9swXpgSLs=;
        b=MjkQpnuIO/8UbDJWYXVRZhRclXw4rftbwonZq/zLBbAdVbk/PiTpgGHf/PFgpgBL2F
         R7pYG54P6tIb8S7uUF8Q1jkskTuCOPvsosf9a1esO0XanMAaOKpsLzCxtY5EdbyT3Aaf
         hsPncFJzJXjz+B16XxjSTnykx9x24eInLz5VmmiG0zPgkDTeASXy+UrDXLEP12pJ9ZMb
         6NIRYK+ObPJbwl53BG148MrmFWg0RGxpf9c3kYX4x2H3hslRXImvB6XG0kB6oy5jDeT3
         8xnb2BEi9b7GSSsFRy+DWT45iBCuru/KluXoIxd301QINm6KQE5KxXUE1+CF5i81cFni
         Hftw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751390656; x=1751995456;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SQNkN/ZgyhuKuim3tffdar1QYfhVDSTf7v9swXpgSLs=;
        b=OLH6bAVO+x7Sidf8EPaD27/SrpaJg+srUwyL1067W2zXZZqfIhAokjNGtT0I1tzTki
         YuInSBZiugnX3y3Nwh0G2o7NawILy5wzS+qyrgm/N2ieqJBS1jFMFGyYvbWXUYYtNLdr
         R+E7TFajyogVQUGUGwQ3jGqOZUhm0PE03zRQ89nPqrzX2K7dWnWavwmVBr9XFtvnAd/J
         AbLWGcvEexLn66+2+hsbUz3Hgm3W7YRRfjztm9BK4KXl/xKAePNS0mFcQuMLposxUQv9
         1WdDh8RTPQLL6IOIwfN7lvpo74ELlEG+lPY2YIqfatopGs6Rr2z/iEZ2IJyfWWiKgOQW
         2whQ==
X-Forwarded-Encrypted: i=1; AJvYcCVuqxw1l25ZI2JeBWPsF69q1I5b5HN/HP4CqGmmW/c3HZPTkcukBNC2Pp5CQEBiBOFHM1MfF14iSa0+4Yk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxxIbi9a02wOK3+J0+kDAwTvrOBYjwqiOhuetHZ2yiwZU3XpaGg
	OgPQICQmql77p8va1FqbY4IG/isBZvQlFub15hOTjKo/v3j2E8Q3MM+wez1J5EPvcSMGszTakgg
	mbd2q6szGjCQBZ/ULUVnLQRD9YXwpiKTwhMNTwY+b
X-Gm-Gg: ASbGnctkY/MwM8zWpQfpTJalnNvehsGSZw3Db1dJGc4AU/iqDJX9K3M0Od9CkhaZ/bq
	M3HFU+i+hIVsp9LyVVCi8HEISayVX53juny6E3AdXegAidRFafxLcFPz3oHRC9Rayln+1bgvFOt
	vXIECG7NvKcFvTnOi9s0tCn1BIRKrUCXfGGm0Y8JRON0nr//1tAkzNgTbWGxqUlkVJ9/hMT8tp
X-Google-Smtp-Source: AGHT+IGhH9LZcfaTk04JJmUrOjkTq7VQ1GKaFo5Pj4fM5cCZrHXRkP5priFsjf6di2GqQgivM7JMchuH4R3ybVvXIQg=
X-Received: by 2002:a05:6402:1d55:b0:607:d206:7657 with SMTP id
 4fb4d7f45d1cf-60e4ba76fddmr30992a12.2.1751390655895; Tue, 01 Jul 2025
 10:24:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250627-debugfs-rust-v8-0-c6526e413d40@google.com>
 <20250627-debugfs-rust-v8-6-c6526e413d40@google.com> <2025070148-primer-stillness-0409@gregkh>
In-Reply-To: <2025070148-primer-stillness-0409@gregkh>
From: Matthew Maurer <mmaurer@google.com>
Date: Tue, 1 Jul 2025 10:24:04 -0700
X-Gm-Features: Ac12FXy0gxiaMyTy9WQGgYK34RtWEzDFpqk47coJhyeL-x7WameSHxw2w-MkJYs
Message-ID: <CAGSQo00UiOUAgYODhXT9BWLW0bXoCxMzt9fV2F2aiTEOG1vwyA@mail.gmail.com>
Subject: Re: [PATCH v8 6/6] rust: samples: Add debugfs sample
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Timur Tabi <ttabi@nvidia.com>, Benno Lossin <lossin@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Dirk Behme <dirk.behme@de.bosch.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 1, 2025 at 7:03=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Fri, Jun 27, 2025 at 11:18:29PM +0000, Matthew Maurer wrote:
> > +        // An `Arc<Mutex<usize>>` doesn't implement display, so let's =
give explicit instructions on
> > +        // how to print it
> > +        let file_2 =3D sub.fmt_file(c_str!("arc_backed"), my_arc.clone=
(), &|val, f| {
> > +            writeln!(f, "locked value: {:#010x}", *val.lock())
> > +        });
>
> While cute, is this really going to be the way to describe all "custom"
> debugfs function callbacks?  No other way to point to a function itself
> instead?  Look at "fun" debugfs functions like qh_lines() in
> drivers/usb/host/ehci-dbg.c that is dumping tons of data out.  Putting
> that inline here is going to be a bit ackward :)

Good news, function pointers are legal to pass in here as well
already, I can add that usage to make it clear.

>
> So can you show an example of a "traditional" debugfs file output with
> multiple lines that is dealing with a dynamically allocated device that
> is associated with the module (not the static example you showed here),
> as that's going to be the real way this is used, not with static
> variables.

Sure, do we want to:
* Finish creating the driver struct early in `init`, then call dynamic
`.create(&str)` or `.destroy(&str)` `.modify(&str)` type things on it
in `init` to show how it would work
* Actually wire up an input source to drive create/destroy/modify
dynamically (e.g. I could implement a miscdevice) - if you want this
one, do you have a preference on where I get my input signal from?

>
> thanks,
>
> greg k-h
