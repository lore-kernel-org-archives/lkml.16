Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0797C189F3B
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 15:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746026826; cv=none; b=trTu+SrqtBbwQhNmGXlOImcICKeJ48e0u010H4RTWyAoHo6ltDfaqB+a96yzBtaGWHRmBO9v2+l9KN4ZQx6RQMTsR8aEJc377Aeef57pd9RAdF9NspXoo/gdDUrgdhmx6H0h4jTIP42W+Z1CfypMfSX1dow0zrY8GaLzJGOSIw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746026826; c=relaxed/simple;
	bh=8OoHx2rVJ81A7H8FIoNr//pSSmbFFvxpqUfLt3fQt6M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f8vBqVVKETCqy+XWtZI3/4NXd17kCFYEtiXDKIDAguNiqG/bJIqOiytRjDJ5Zw3e8gI5DwVWNN4gw87W286HqCiA7S/iMouOZt9v7bw5Ua9+mPABDYwPPoMlSazPnns/3Mgj3GWd+QpDB34JOgdE5NRUPV9vR9yFk88IAYjxN1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bkNuh4Yg; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bkNuh4Yg"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5f632bada3bso16079a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 08:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746026823; x=1746631623; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ee+IIuLitQ42YCFf3ekA1a9+Sa+jp2dWXVk3zuZ1xAY=;
        b=bkNuh4YgFYe9MaaxylFGl1cNNcNhVq2jbTxMjzAHL9SuxXy7/doM5htDPx17b8aH6O
         LQxako3mv6+Dh7xAZKOYbuW12p+zDT0UACl7uZfrJP9fNH4VhoWYwYT5uxuaR6rcOCcC
         r6bYNfL08dmZAc7R2mTMN90xol7u2S2MybRTEUX8Etb7NMyuS26IOmc5rRQQdx2zQGPu
         blP0yFkDRO+BMkVo29lp0/3ocHrYIRZCLm5EvBqaUIUUwQZ6Ku6U4NvSPqit12zjF9MR
         +EPUnFChe/1LwO5qz32D0EJWe7R8WlfvddTKaaX5TkbEzwPGTmY8Kvc6tznBxXzu2Q70
         dgDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746026823; x=1746631623;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ee+IIuLitQ42YCFf3ekA1a9+Sa+jp2dWXVk3zuZ1xAY=;
        b=be1orsKktVJPiD36dslfXpricNpzCZE5iqm8nb1ryVnqY0zLwOH+75wRRvB+UoX2oV
         wENcp3H5RM8GhTItp7kxhUnIAcBEgxplgH++rzBjFQ7CGDmXqgzyLqIe3TZl6uezGYIh
         5jO8fbcM1XR25lfL70XC2HfRQ1wSDgNrdFjDCh8953dXmfry3Q2VxVBkxR3jYA81QBE1
         tcMJrtb4GLNoBSs2HnHwZLUoR+Z1HewvMI7ytmlt6pQq3G8deF4tANVJUkqS5Z1+cAYi
         qkhd7Tb/O22IP+FJH8OMH1hT7erfc88JZPrROS+NYMyNU1RkUFoS4hEkxtCDnbQVJf6f
         Uu2g==
X-Forwarded-Encrypted: i=1; AJvYcCXkGUI32XVbQ5RLFzKJmxICsz32sMgor5rTohYrTM94UNoXN1Fz+IoWpMUoVnziKvB3Fy/t0ojNXLxb8F4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNrS0nMzXl4zX1e1Cefrhj59TLn6CLGtqfTZ4Cmyg63xECxcik
	wmi2tFAWhy9IVslGNiUBZK+cM1Afc3+iK6i4zoG0cNQY1nSegcd0JOdRDzt3kjwTWkbWRS6C9SJ
	8dzuDeYDVIPhD3a+dnnlXhMN9BVUAPFZKDjVJ
X-Gm-Gg: ASbGncvvkJTCtRinmakZqNqUS7ZDDCNAJxqG/gL/7QpnKhCKekTdFoTh5qQxuJjxcEz
	yV9xlLRMn9iZflGv5Dl7mHP38eoM7AGjhEp/simw2BlQQVGL8RyJBN5jCMbc8N9NgSwxfvgRRAT
	WlukTgmgRTY87n8lpsiZ3ZXOGlsyCakgkH0xkYjrv59oa+S2LAi8Q=
X-Google-Smtp-Source: AGHT+IF+YcYmBiDHEPgjd93TCGtkgaXSp9BJkhLjrIvFXdlM6R/end2BmwQo6oGMZ69RCy2AtqX6Q6qNSpPnbNB8gAE=
X-Received: by 2002:a05:6402:10c9:b0:5e6:15d3:ffe7 with SMTP id
 4fb4d7f45d1cf-5f8aac01ed0mr103284a12.7.1746026823207; Wed, 30 Apr 2025
 08:27:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250429-debugfs-rust-v1-0-6b6e7cb7929f@google.com>
 <20250429-debugfs-rust-v1-2-6b6e7cb7929f@google.com> <CANiq72kbHnPR8_y_Q3a8b7H=4wDorbBS5VxWD1NfD3yarEW-Vg@mail.gmail.com>
In-Reply-To: <CANiq72kbHnPR8_y_Q3a8b7H=4wDorbBS5VxWD1NfD3yarEW-Vg@mail.gmail.com>
From: Matthew Maurer <mmaurer@google.com>
Date: Wed, 30 Apr 2025 08:26:50 -0700
X-Gm-Features: ATxdqUFx0Z5V99iwF8PaTkZeIQ1qc6UvxlBQ5N_gbSRpqe65ZhLa74YGf52KIC0
Message-ID: <CAGSQo03FN-8qaLdfTNcQT_xO7MXz8+wDVxCSoF5VP53pn81J+Q@mail.gmail.com>
Subject: Re: [PATCH 2/8] rust: debugfs: Bind file creation for long-lived Display
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 29, 2025 at 8:27=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> Hi Matthew,
>
> Since I was playing around with this series, I noticed Clippy
> complained about a few things (please see `make ..... CLIPPY=3D1`):
>
> On Wed, Apr 30, 2025 at 1:16=E2=80=AFAM Matthew Maurer <mmaurer@google.co=
m> wrote:
> >
> > +                0444,
>
> This is decimal rather than octal.

Oops, will-fix.

>
> > +// # Safety
> > +// * seq must point to a live seq_file whose private data is a live po=
inter to a T which is not
> > +//   being mutated.
>
> This should be `///` (also, since I am here, please use Markdown etc.).

I thought I used markdown everywhere, I'll do an extra pass before I
upload the next version.

>
> There are a couple other classes of lints that Clippy mentions that
> should be cleaned up or allowed elsewhere.

It looks like when I transitioned over from running on a physical
board to running on an emulator I typo'd my clippy-check script, sorry
about that. I've got the errors confirmed coming out now, so I'll be
clean there next time.

>
> Thanks!
>
> Cheers,
> Miguel
