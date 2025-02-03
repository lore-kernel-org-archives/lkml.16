Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24E821D5AA7
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 09:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738574476; cv=none; b=a8/nilzHTLIzAj6eIlyaw9seooVUDD7pJKOt4FwcKBHWbQMIm4pHj641VXT91rgFiQpRxyLMGHO10G8VcgCsw54g2R+CmHsSwOe5zAHJu7ewmXjY4vPsRRZbISUC0yowctmDFhe5Q62qQnb+8QL5bBWjuP/1ZuCp4BBij9oGZ3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738574476; c=relaxed/simple;
	bh=9dXsntlU2lQEl5El7bSvBOo5zlsWJ1Z0oKkIsK55MWc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MMXs6p+/5yuSvItV1uesMYq68TKJ3CTdWHyfkBp+WKqOet2Vx+TcPqw0SEwCshJE9xnFaGsagqlXa7Y38JNO6dDoa6EpAn6lp1VPeNtjLPnNeawGnpIbciFUrc+mCzY4nVLeZlOaCEH3h9LuY+BP0UnF2QNYazTwPvcWHaIMj/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Imhh+lqt; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Imhh+lqt"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43624b2d453so47469915e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 01:21:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738574473; x=1739179273; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SMMCxg185GITpA9hzcrUPDBxsVeKq1gHer3vOLKPqDA=;
        b=Imhh+lqt59EYVgui61IbuDmNSyE1ixVDIU3y3pWoU5C6jOLwD4F9ZC/EqiJS6ZSM+X
         bxFE1KtBH3z+8hsQGc6BgHrOkTJm0bFTTY5MJhB1aH/4WhG0R/y8nkvi16yn3lIaLEPq
         FNGO/zpDWyEJpo5TytYbrWLTtEXye2z5HjwlKVurU2g2/YNikKPMEJQKRC+QwWrg87cl
         Vd1BCFQjuhZt7uHw/tAGfUXlX6AD5VgBz7P1FBXZpW7Wj000sWgYChuwyfWo3aWabXld
         2ol26TT8mn6bIztGL7faAx+0PJH5l+zskSjwQlJoprXVyeMCjvWgboVWo2ZNNzcxBK58
         cIPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738574473; x=1739179273;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SMMCxg185GITpA9hzcrUPDBxsVeKq1gHer3vOLKPqDA=;
        b=ptrZc1tMxa8mTX6el3q3CtOxZ7WfeuyvUCcVrR0/z03MEnsQYgmvj+E1AU4o+ZKD4h
         /IMf6MZqjBN93ktLAF/kA3IDRya9BKbHQIuYWbqiWda9hPC9n6RyE8WAL3+VZCSPmuIg
         jn5Neiu6ooyCJBQgNviCavZG1Su23QznE1/iS/fUYG/37SC/mu9TIaHjYShTvBb7S5i6
         nwXYCxfaukpi5SXt+EEuzMsXArFRqCENegCec942sjZfHm2wJaYLD2de0kcyUo7qgJGA
         9gfjqR2Pc9+bP2TXeMpYDnAJl1EP0s/SzwV/78iixjoGyt/h9W57ZFqKk3EreRM+9iWp
         /nVw==
X-Forwarded-Encrypted: i=1; AJvYcCWy0LeTFEnucqA2Kh1aiRkd9XNkcbRveSI2JVrhzWaoZBhMdQuvUBMCKLCdJ4OByqSm4xamgwzZhE02a5A=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywev3DYdDS954aBG8Vykq8I51VFYzOWelIfq7JETxHhJkKfBfj0
	+fmXgcrQ76b92KDeSQK+T0wqGYPhzOXhQnEkKaJSYUYxcgK50JLiFvbZPNSwNVcebSC33I/uIJR
	jjQGppXxVyyO56o4JHDW1ASMEf8sYayyc0BL9
X-Gm-Gg: ASbGncs/N42hgIoji8kCzDrI/EdWRXVdDW4HNxY139ZsCCFxtg9HmbAHErsvw0skZac
	vuCS2qaEithqYe3PQHfXFLI/54Vle8+ryGL2v64415btw5os/bQ6Kzu+d5+N/MBlhacg6ze4d3E
	olXnBcvk7xuyErEntDG87BGnWS
X-Google-Smtp-Source: AGHT+IH+CHo33K6/j1nUnT05029OOZabNhI3HUlzZ1F7cW26Ijpr0Ke714IhtHWaBMg7p5Cw6U7exleR6eafaXX7V50=
X-Received: by 2002:a5d:4e11:0:b0:38b:f4db:d56b with SMTP id
 ffacd0b85a97d-38c51969acemr16746600f8f.25.1738574473297; Mon, 03 Feb 2025
 01:21:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250131155940.305403-1-trintaeoitogc@gmail.com>
In-Reply-To: <20250131155940.305403-1-trintaeoitogc@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 3 Feb 2025 10:21:01 +0100
X-Gm-Features: AWEUYZlAs1VX3dtvs_Wp5KaHu4mipxzuFWYd_ZgECzqXhSd0Pi4wn26jhkleXIY
Message-ID: <CAH5fLggJnaTD3_uc--eZfXMHurPab_Y_XuJOPcSk5oTeiyjbqQ@mail.gmail.com>
Subject: Re: [PATCH] rust: sync: lock: Add Lock::get_mut()
To: Guilherme Giacomo Simoes <trintaeoitogc@gmail.com>
Cc: peterz@infradead.org, mingo@redhat.com, will@kernel.org, 
	boqun.feng@gmail.com, longman@redhat.com, ojeda@kernel.org, 
	alex.gaynor@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	benno.lossin@proton.me, a.hindborg@kernel.org, tmgross@umich.edu, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 31, 2025 at 4:59=E2=80=AFPM Guilherme Giacomo Simoes
<trintaeoitogc@gmail.com> wrote:
>
> At initialization where we can guarantee that we do not have multiple
> threads accessing the protected resource, blocking the resource in
> addition to being redundant, can cause unnecessary overhead.
> Add the Lock::get_mut() function for access the data without lock.
> Receive a mutable instance of Lock, and return a mutable reference to
> data because if the instance is mutable, the rust compiler guarantee the
> access control.
>
> Suggested-by: Bj=C3=B6rn Roy Baron <bjorn3_gh@protonmail.com>
> Signed-off-by: Guilherme Giacomo Simoes <trintaeoitogc@gmail.com>
> ---
>  rust/kernel/sync/lock.rs | 37 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
>
> diff --git a/rust/kernel/sync/lock.rs b/rust/kernel/sync/lock.rs
> index eb80048e0110..f1e29820ce99 100644
> --- a/rust/kernel/sync/lock.rs
> +++ b/rust/kernel/sync/lock.rs
> @@ -140,6 +140,43 @@ pub fn new(t: T, name: &'static CStr, key: &'static =
LockClassKey) -> impl PinIni
>              }),
>          })
>      }
> +
> +    /// Get a mutable reference to data
> +    ///
> +    /// ```
> +    /// use kernel::sync::{new_mutex, Mutex};
> +    ///
> +    /// struct Inner {
> +    ///     a: u32,
> +    /// }
> +    ///
> +    /// #[pin_data]
> +    /// struct Example {
> +    ///     #[pin]
> +    ///     d: Mutex<Inner>,
> +    /// }
> +    ///
> +    /// impl Example {
> +    ///     fn new() -> impl PinInit<Self> {
> +    ///         pin_init!(Self {
> +    ///             // This new_mutex! can be anothers locks like new_sp=
inlock!()
> +    ///             d <- new_mutex!(Inner { a: 20 })
> +    ///         })
> +    ///     }
> +    /// }
> +    ///
> +    /// let mut pin =3D KBox::pin_init(Example::new(), GFP_KERNEL)?;
> +    /// let mut_pin =3D pin.as_mut();
> +    ///
> +    /// let data =3D unsafe { Pin::get_unchecked_mut(mut_pin).d.get_mut(=
) };
> +    /// assert_eq!(data.a, 20);
> +    /// ```
> +    pub fn get_mut(&mut self) -> &mut T {

I maintain my objection that this function cannot be correctly called.
Yes, if you use dubious unsafe code, you can call it, but we shouldn't
do that.

At best, you could change this method to take `self: Pin<&mut Self>`.

Alice
