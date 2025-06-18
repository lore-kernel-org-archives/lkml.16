Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3E14295510
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 15:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750258869; cv=none; b=gMLHfPwVIYh0xSNi1K69ceoyM3J9Rv2rYJGqYoaT1j70aO+dOTHLA9s8g9A1/OYh8euG0wAkn7rVdr8C6i133Is2CdsshHO9CQEqFHeaCCsEV5BcqFiYo4aS1/Q7VQdDKJQ9Tfmt3NXoTvQkPI6csc1s2NHQfqeZeKje6LaBXJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750258869; c=relaxed/simple;
	bh=In9SpzZLvVCFKT0ns4hBMmiaQCbATnsS0vtsR+xsVqQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QUtaeOuEYkPvzXD0bOxC61baOj0GN2aDOdz08WKRJD+IMP61YZp4bdi0SZfqRHHQCq0F9UAA6LAs5z3iT4X6Gr28pmEVuA1ht+MqPgSv18wk8RRxWx9n+D6rPFxzpY7Fz/W4g8T0v2B2JrpoSWobMndbJG1TsQfwJX/jGU4rZXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=J8zBYzXp; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="J8zBYzXp"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5f438523d6fso9381a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 08:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750258865; x=1750863665; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=K+TWg80sQlK9VKZi48Hr3ND154+UsDClJZ6mA6GdvrE=;
        b=J8zBYzXpoKberVmnGbZZPGFYtIYmg1MisrVWnlur/sQ4l5OprKXLSMQX81jswp5VXA
         enNuPLknJHvsU+OVLBvpfFGvY0AdS2ZPRaAM9ydW3//XgCFyF6uMinZZ/YxNurOUCWzP
         up3G4Z/RWO2UZY/xzmfJttrovQCV1SWARNnobJSJsyDRznYzqSq4bpSh8hPUvi+KFrte
         4ymrKwX3KWaLbr5Dig6+oNvS88BCHeZYijyiQsDH3SqJlUEHiL/VgwtcvXnq+bYmY6Q0
         6n2IvWE3xB6USpIzMEEpVlwue56oi8ZQI44xX84k71dj5wRKaDytCy68mPuCn6UT9APq
         nI1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750258865; x=1750863665;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K+TWg80sQlK9VKZi48Hr3ND154+UsDClJZ6mA6GdvrE=;
        b=KHpNsFf/hkxgfCun+6PXWekgLPtXarzTP0uXtMpkRH9Ed/Fsiv7wd8eN3Dq/IulGKf
         LZK8f4ZuvzvYLt2aaTnZThhVPirAgbIOlPqHCCFGv4D10Ok1bv/AjX7d25joJ9BIS/A8
         nietzOdK7UQ4IAOYks1HZtSs0KclRLmVY3Gp0M85mNZMUe1ywvPvlEckAsY1cb7d6ymN
         4i6A2fLOLC7+AufW9e8PwQIfESrSeK96weWNeQAjt+D1hF60WiPdd1dafbPPORIeH/k4
         r10+ByMN+MZQI8IYcze2UY8GWuBK1QsEuIYdkWDXNuCKkfJPw9AfaXij7+XIMkT+Jmzk
         OAyw==
X-Forwarded-Encrypted: i=1; AJvYcCXP86gBLeP441IiEdHvujF3xkipM6DgzlB5D13gI1wVmtpt62zvVqETkg3QqgTWugs5DBWulOHB5dSxti4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwO2880n/cJpvinew7seOY+2lUJM7sBx4pmbO+T1/vI9V/WPojH
	7U/B/5GGRgrynR2bk7jwszZlcO7ILZurxBDTemxd/luOPxo356rjaP1mUu/YVCApasOvINS+wHI
	LVnsPhbkxFGvqEaVVbTkPMTxGb3i8Q5MNGzwo8Vpv
X-Gm-Gg: ASbGncuyCgaTPWQcML9hO/54gfilLdS7CmuQze/KhNokGpcWf+qoVlSCEGjHZQ9Zuw4
	Mq8++6enEqN+Z8eisb1NsrcrGG3bHCk1zjZDE5i33SPgEeRdTjJ9lRK6vmzV2C7pUCOjlg33GuN
	ODjgzwUgTLtrnc9mZc4LttwhiYH1AxM4DE7bIYrVRDhZ9cm634yxQduyvlhXJ1TwzNs3lUu0kz/
	3AU599dKUe+gco=
X-Google-Smtp-Source: AGHT+IFAgEi2YZlblsUl4v6UMeK05nP5o7l+saBCTqWQv2WXDiTvH7dfg3lu9TfWBrUWL3UD2/KG3DHDZUTYNdxFICg=
X-Received: by 2002:a05:6402:1d22:b0:607:1323:9c2c with SMTP id
 4fb4d7f45d1cf-608da34eabbmr379396a12.7.1750258863342; Wed, 18 Jun 2025
 08:01:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250618-debugfs-rust-v6-0-72cae211b133@google.com>
 <20250618-debugfs-rust-v6-3-72cae211b133@google.com> <aFJ2fJ_pX8mWCQo6@google.com>
In-Reply-To: <aFJ2fJ_pX8mWCQo6@google.com>
From: Matthew Maurer <mmaurer@google.com>
Date: Wed, 18 Jun 2025 08:00:51 -0700
X-Gm-Features: AX0GCFsfqIEzORIqVfIvRL7BBfVutr64EJTViTS26O53ORqcZg3zwyF6cJssv9A
Message-ID: <CAGSQo00fwu-UEi9D+Q4F5WpfUUuz562odhaDhp=F99cJyd9WyQ@mail.gmail.com>
Subject: Re: [PATCH v6 3/5] rust: debugfs: Support arbitrary owned backing for File
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Timur Tabi <ttabi@nvidia.com>, Benno Lossin <lossin@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> We may want to consider using the ForeignOwnable trait here instead. The

I was considering trying to switch over to `StableDeref`-like trait
[1] in a follow-up patchset. The core property I need is that moving
the `D` cannot result in the pointer it would `deref` to changing.

The problem with `ForeignOwnable` is that it forbids the user from
passing in a `Box<dyn Foo>`, because that doesn't fit in a `void*` A
`StableDeref` version would not have this issue. I agree that
`ForeignOwnable` would be a strict upgrade to what I have now, since a
user can still pass in a `Box<Box<dyn Foo>>` and have it work with
`ForeignOwnable`, and if we ever added `StableDeref`, then
`ForeignOwnable` would have a blanket impl for it.

I'll send a new version using `ForeignOwnable`, and we can consider
the `StableDeref` version in the future.

[1]: https://docs.rs/gimli/latest/gimli/trait.StableDeref.html


> trait is implemented by anything that can be converted to/from a void
> pointer, so you can:
>
> * When creating the file, convert it to a void pointer that you store in
>   File and pass to debugfs_create_file_full.
> * When displaying the file, create a borrowed version of the void
>   pointer and display that.
> * When freeing the File, convert the void pointer back into an owned
>   value and drop it.
>
> For cases where a box really is necessary, the user can create a box and
> pass it themselves. But if the user already has a pointer type (e.g. and
> Arc<T> or &'static T) then they can pass that pointer directly and the
> pointer is stored as a void pointer without the Box indirection.
>
> Alice
