Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F2C78BEC;
	Sat,  5 Apr 2025 15:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743866633; cv=none; b=KcjTB5My6aSWK+V2pOvesGY+AQIkEqB4d+MXTUu2NZYcvRCYrx7X4lBIcf2lQmUCU/ae/p+gE1L6qYRsq3sYj/9khSh6/GwFIL7dTIP0BkKPSHME9FtGIiMWUaMzlTUosnBpVfE5mDf0oFxTwmSMcLtzR97w+0H/7dWJjic2p4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743866633; c=relaxed/simple;
	bh=/T13pWomEDMKWJF7JfI0dfrp1qLsz7eRfBMyetTCEVs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tlC3Qi8k5ZPE8d/j2RMoIFpxOxqP1Hlh9SeNOxaIn7Vjfx6yKfVZeBPKbPNAx7/QsuiAutK+RYktrUiGY2HrtPn7UxJ/KM1L5SbA1Cjgnf0GDc4VEN7QVTZHjqMmK/e7E2q/GBgqhnxxUKudSYXIb4PilAbtkhxWbSXAKcXHBy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IAM0SdBG; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IAM0SdBG"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-223fd44daf8so5068735ad.2;
        Sat, 05 Apr 2025 08:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743866631; x=1744471431; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bRltu7iwQQEMx4zzV+XyJNaqulGjEr9JTBPg2eBuL3o=;
        b=IAM0SdBGGH2KlE/nU1LkxTSeru5IFZ+X8p51ZHtkDP1ekN6FN5RD4IaMe3ld7Qyyla
         HjS1AQGOuzFAsCdpfVPpL/btWLdPiCCl8rF4icYDwZbFBFG7Q4FZdyeXODjT0seZTdp7
         tIfbH1FN/qtH1IjdX7pVeH5r7Ap/lSDI9Mn2QEdsHKMZ0YnLUkbshSd+T3giiHEc210g
         JYdplWFhcISsF7EkQENvhMGmXjP/Tu+N/UfRoXydU5SdSQYblLYwEFqoSJmKD7vb6RL+
         9t43f3M/XpBmhnpUWn0UuKBaQlYKAVKyVozEK3aiIfCoBEg5ffZ9dIkXM5qNkrEEm05t
         RJsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743866631; x=1744471431;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bRltu7iwQQEMx4zzV+XyJNaqulGjEr9JTBPg2eBuL3o=;
        b=ZMbKjeRkHx1clsvfHq1awCrXXdZCAdCvqsWcM8/f3KDfXIqozzi0z5I3d/1nXKPbGO
         YrP0xihU/BVJfQ9dZW8nR6hsCgAscZtK8F9WvIvKZO3K7X2lhoJDMHX5Fp1x1wRtpe2l
         Yf0jaBTy53kBeqTLsmFYf8zcMWhNuFlPFLXFmJAMI62UtIiINubJoHCfhJL9ovdEgTuV
         Lp+QBEFb954RvtFu0IOT2szud8QG4rA2eoEOOXiIuLxVjo20FIMk99boYPfESA4sEAai
         oxbGpaeeysz8bvglBESXuX3CJpt1cXRPIxdXBRezzrzeSPYVs2a79zJcbQ/M8j1LwDt8
         PoYw==
X-Forwarded-Encrypted: i=1; AJvYcCW6Bgx0Efbzz0+46c69iy3jh6oA9WUwSkBu+5VWKbbpy2rfxUufy3r1oN9QZChZg6LlS7G70o+H8IWG8Sk6itY=@vger.kernel.org, AJvYcCXzGUMw/iivQwONvSc9xFFN6ggMM8E+6alb66Qxj58Agp5OVKE+T3Hah4BDsdlH5qZOpU06IJp8Fj3X1aA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1GIdXORZnt+pkKsrwPvuR4rSyrXvGiZhW9iwxOPfiLNINKYvv
	64f3mL6G/Kr+XPLjPCjsebE5I4MLof3waKKbQMrTWmDFqmmd05+d42Xgmc171TI5DJ7RcAkZTEC
	XQm8/4/dpEvZCjerGKzAolngAL+w=
X-Gm-Gg: ASbGncttbLjaUaypWTeBf8JB/6fYnb+2eDWlrrMAABMp4zTR3e5YlSCbft+kOF6s37x
	Dt9P6TlHaKVlFSEkq7p+1lqX36ctEpEzYu732HybTmVA6Fc96YTTp4qJmvK2RHv1FbrSR53WeXs
	ubmBfngduF/oqpPLsC8nZZP5l/og==
X-Google-Smtp-Source: AGHT+IG02F1EM+jBAh7+YGsjjgJ/ng6qTMmdY+6UCuGCifhdh8H/1SI0yMOAMSol1NtPmovBbTjwNezofBfaUFEGB6c=
X-Received: by 2002:a17:903:904:b0:224:18fd:6e09 with SMTP id
 d9443c01a7336-22a89ebc4aamr37537595ad.0.1743866631372; Sat, 05 Apr 2025
 08:23:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250405060154.1550858-1-andrewjballance@gmail.com> <20250405060154.1550858-3-andrewjballance@gmail.com>
In-Reply-To: <20250405060154.1550858-3-andrewjballance@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 5 Apr 2025 17:23:39 +0200
X-Gm-Features: ATxdqUHgh0DIJx3Sa3HDUPPTedxcX6iWeq7MdDPNHgUdrwBRYxBKgjXPFMNrLBw
Message-ID: <CANiq72=KqZ6pOj62ofmv0yRfqy3HjZkDHanyvFbDvb+ECcjgTQ@mail.gmail.com>
Subject: Re: [RFC PATCH 2/2] rust: add maple tree abstractions
To: Andrew Ballance <andrewjballance@gmail.com>
Cc: Liam.Howlett@oracle.com, ojeda@kernel.org, alex.gaynor@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	benno.lossin@proton.me, a.hindborg@kernel.org, aliceryhl@google.com, 
	tmgross@umich.edu, dakr@kernel.org, akpm@linux-foundation.org, 
	gregkh@linuxfoundation.org, wedsonaf@gmail.com, brauner@kernel.org, 
	dingxiangfei2009@gmail.com, linux-kernel@vger.kernel.org, 
	maple-tree@lists.infradead.org, linux-mm@kvack.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

Some doc-related notes for future submissions... I hope this helps.

On Sat, Apr 5, 2025 at 8:03=E2=80=AFAM Andrew Ballance
<andrewjballance@gmail.com> wrote:
>
> +#include <linux/maple_tree.h>
> +
> +

Nit: double newline.

> +//! # Examples
> +//! ```

There should be an empty doc line between these.

> +// TODO and missing features
> +// - the C version suports external locking this only supports the inter=
nal spinlock

(Multiple instances) Typo -- you may want to use e.g. `checkpatch.pl`
with `--codespell`.

> +// SAFETY:
> +// we cannot derefrence any pointers without holding the spinlock becaus=
e
> +// all returned pointers are guaranteed to have been inserted by the use=
r
> +// but the pointers are not guaranteed to be still be valid
> +// another thread may have already removed and dropped the pointers
> +// so to safely deref the returned pointers the user must
> +// have exclusive write access to the `MapleTree`
> +// or rcu_read_lock() is held and updater side uses a synchronize_rcu()

`SAFETY` comments are intended to go attached to an `unsafe` block or
implementation, explaining why they satisfy the requirements.

Clippy should be warning here, but it doesn't likely due to this
Clippy issue I just filed:

    https://github.com/rust-lang/rust-clippy/issues/14554

(plus other three I filed while looking into this one).

> +/// A `MapleTree` is a tree like data structure that is optimized for st=
oring

(Multiple instances) Please use intra-doc links wherever they work.

> +// # Invariants

(Multiple instances) Please make this section part of the docs. We may
change how we document private invariants in the future (or we may
expose private fields so that it is clearer) -- for the moment, please
add a note if you really want users to never rely on a particular
invariant.

> +    /// creates a new `MapleTree` with the specified `flags`

(Multiple instances) Please follow the usual style, e.g. Markdown and
intra-doc links where possible, start with uppercase, period at the
end of sentences, etc.

> +                // SAFETY:
> +                // - mt is valid because of ffi_init
> +                // - maple_tree contains a lock which should be pinned

(Multiple instances) Please format with Markdown in comments.

> +    /// helper for internal use.
> +    /// returns an iterator through the maple tree
> +    /// # Safety

(Multiple instances) Newlines are needed here -- `rustdoc` uses the
first paragraph as the "short description", too.

> +#[derive(Clone, Copy, PartialEq)]
> +/// flags to be used with [`MapleTree::new`].

We write attributes below the documentation.

> +        if ptr.is_null() {
> +            return None;
> +        }
> +        // SAFETY:

We typically leave a newline after a loop or a branch.

Thanks for the patch!

Cheers,
Miguel
