Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A38917BD3;
	Sat, 21 Jun 2025 16:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750522530; cv=none; b=cPEa7DiSRE4C/kRw7OX+zLVd+lw2ShugDd5DDnEsGisItCdx3h1SEfhGwNp3aNRSDUH04S8DeD13sOHF+kdpZwcA2JnvhH8RLBshV+Ma5C89FT4WggP8JPGLcKUF02ahHDh25I3a69IIR8ch3Viv9e0XlQHRhD5FZAeeYwyLLMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750522530; c=relaxed/simple;
	bh=qevLr9ZSYFJHw6aDBo4jErxE+t1JmLp7MzC4B/E+PK8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bOM9g2doNHqkFWcgOue0hJ5U5GyoNy3iA2k5+HgwoBZsK2b8HsVMDIpBr+MlFK00niViSE9dRxwxX9woG0JL3lh4YQ3rml5NVbvwJ2fiYZs4MnzH+Wo92+Dj0Cc9CWFy1uYGJSSSThgL06UZbNvm6Wlzpy2QZPXY6w1q9Ciy6II=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=miU7wr+6; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="miU7wr+6"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-234ae2bf851so4614545ad.1;
        Sat, 21 Jun 2025 09:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750522528; x=1751127328; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Myn92VBW7kfeyp03lVrVe0paNOHV5SuRywd7zrehoAo=;
        b=miU7wr+6bbgMGO23SLgv67j7tm9ZW8Ljo+rBBhxNmEHKQXrk1QUSzXMZSXipTcex8T
         DJQcy7lC26YaH8zaxNrzPehoSv0KwfztWsYC64qS+MOL5TDLeAUMLv19T9V6SOFOPGmg
         iK9lbdIWNhxN+mIHi6iEPbJBS4H27o/TNajQ9hQHHiBRGoLtCYICTAJVfUYZkH8BOPOl
         lYMkFbh6LvOIcVYIM5LFQSqczVphCp14tGRUH2/6js2Tl2lWrYOTzvo9kKECmHOZPLaR
         Ngy8AH6TomrEM0wURnFNix5XBLLZfGff9Fp9hWLsIfJEsU2SNzVPurZUTBYxdtDPe7GI
         lG2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750522528; x=1751127328;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Myn92VBW7kfeyp03lVrVe0paNOHV5SuRywd7zrehoAo=;
        b=vQzzMVnHCRZSNIemocVvrTzhwS48lHNYD7soD2n5lS9geSBwdKkmix7OXllUpPQGNQ
         w/4eTRNPIu8sdiaX49GCXmtAjIn1MC8ngcK7osgAVwVzv59OAATuLa+hp18Aofj3WFnk
         0HMS+Vy2VeTaJ1ZTm8eBIdNsnj1bQ7/4uJShPXhK722ZZzWBTymlez5uVnXVYP77RMAl
         BqUHFf9Nw8qn0P79JUzaY6V2gGxLmxosKQhhsGD+bKR75O231l6pPb7fET2287Vl1373
         c83U2X0AV2PmCYIogBwqMPexoJbFq5nnj1GYQoEi+HpYZescUibzKbDDLemzqnSqqRNu
         5iog==
X-Forwarded-Encrypted: i=1; AJvYcCU26mk1IzNAcywWyBiRzIeJCAMR606oHnyOs0wJ3NqDNqH37CXanE7YmBoEZimpDdITtCIvDvx83U5jsdcBgA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwvDWd7xbcWs3lQHPT+EOKVAINd5DCvuYx4kYVTGPAxrSKPvVYD
	LifoMzs8nrAm4u2dxw4HIU6fX3qXRMlhjln0OyHl0et1LbBkAkB+MT0s2dyTGp8I8U5txPd5sui
	2/D2bc2ri95W8aji2D6cOOj9jKouTv1g=
X-Gm-Gg: ASbGncv66htHrt6gMM4C8Y/+wcVIT3JgTxdKy9uiN/1HKZraNkBQP88XHlebaMjimBT
	4MlZpZLKo4QQgavGn5I4mP5aE0MnwX0o9rk7ZmCHXCeFaabB7C4uHafBwtUrYDJWHoCz9T9rBoL
	m5VfEyXQhzfqA8X3E7E8ZyfspPYhnG8nYBv80vg1d+RSE=
X-Google-Smtp-Source: AGHT+IHSbJKRuHAxrxbdHOWYsKCLNdbjb9gfKKnd0t9mQuMtndfb3xW4O9A85hrvQwa3gH5XB9iA48xT+v8VnMQePdA=
X-Received: by 2002:a17:90a:c88b:b0:311:b0d3:851 with SMTP id
 98e67ed59e1d1-3159d8d1ab9mr4014904a91.4.1750522527784; Sat, 21 Jun 2025
 09:15:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250621152142.25167-1-work@onurozkan.dev> <20250621152142.25167-2-work@onurozkan.dev>
In-Reply-To: <20250621152142.25167-2-work@onurozkan.dev>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 21 Jun 2025 18:15:15 +0200
X-Gm-Features: Ac12FXw49WODaYF3lqZkNRYeMz9Fu1o-g2jfGAxPF-tQ7YxMWBsh7k76BnVCMcA
Message-ID: <CANiq72=ER=1QqW8tbqjuPWcqR2oM2bEEm=O382x68G-whGc3MA@mail.gmail.com>
Subject: Re: [PATCH 2/3 v4] implement ww_mutex abstraction for the Rust tree
To: =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com, 
	gary@garyguo.net, lossin@kernel.org, a.hindborg@kernel.org, 
	aliceryhl@google.com, tmgross@umich.edu, dakr@kernel.org, 
	peterz@infradead.org, mingo@redhat.com, will@kernel.org, longman@redhat.com, 
	felipe_life@live.com, daniel@sedlak.dev, bjorn3_gh@protonmail.com, 
	thatslyude@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Onur,

A few docs-related nits, for these and future patches (some apply
several times).

On Sat, Jun 21, 2025 at 5:22=E2=80=AFPM Onur =C3=96zkan <work@onurozkan.dev=
> wrote:
>
> Suggested-by: thatslyude@gmail.com

Please use the usual format for names/emails, like in the other tags.
(Link also typically goes after Suggested-by to link to the
suggestion).

> +    declare_err!(EDEADLK, "Resource deadlock avoided.");

This should go after `ERANGE`.

> +//! This module provides Rust abstractions for the Linux kernel's `ww_mu=
tex` implementation,
> +//! which provides deadlock avoidance through a wait-wound or wait-die a=
lgorithm.

Please link the C header like other modules do (with the `srctree/` syntax)=
.

In addition, if there are good C docs, you can link those, e.g.

    https://docs.kernel.org/locking/ww-mutex-design.html

> +use crate::prelude::EBUSY;

Please import the entire prelude, rather than a subset -- that is its
goal after all.

In turn, that means you can drop other imports.

> +/// Represents a group of mutexes that can participate in deadlock avoid=
ance together.
> +/// All mutexes that might be acquired together should use the same clas=
s.

The first paragraph is a title ("short description"), which is used in
lists of Rust items, so it is best to keep it short. So I would
recommend moving the second sentence to a new paragraph.

I would also probably suggest dropping the "Represents", i.e. you can
just start with "A group ...", since it is an item.

> +            // Ref: https://github.com/torvalds/linux/blob/master/includ=
e/linux/ww_mutex.h#L85-L89

These line numbers will likely go stale, and we typically don't link like t=
his.

If you feel like you should link to particular lines, then I can
suggest git.kernel.org/linus/ instead and a tag to keep it stable,
e.g.:

    https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/include/linux/ww_mutex.h?h=3Dv6.16-rc2#n85

Also, please use <> to wrap links.

> +    /// Creates a `WwClass`.
> +    ///
> +    /// It's `pub` only so it can be used by the `define_ww_class!` macr=
o.
> +    ///
> +    /// You should not use this function directly. Use the `define_ww_cl=
ass!`
> +    /// macro or call `WwClass::new_wait_die` or `WwClass::new_wound_wai=
t` instead.

Please use intra-doc links wherever they may work, e.g. [`WwClass`].

> +/// // Create mutexes

Period at the end.

> +/// let mut ctx =3D KBox::pin_init(WwAcquireCtx::new(&class), GFP_KERNEL=
).unwrap();

Please avoid `unwrap()` and other panics in examples (and in KUnit
tests too -- I will mention it there). `assert*!` is fine, though, if
you want to show that something is a particular value (that is
relevant for the example) etc.

More generally, the idea is to try to write code in examples like we
would in normal kernel code.

> /// use kernel::error::code::EDEADLK;

Some of these should be already available from the prelude, which gets
imported automatically, i.e. please check if you can reduce the number
of imports in the examples.

Thanks!

Cheers,
Miguel
