Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2637723D287
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 14:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744639790; cv=none; b=CJ+FUcXaJ+B3SOVd7hWi7l2Aqm5MzgdnCtLccr1pDc5djt4j4o74rxTahQBXbacCXCBHfaoQQfdJSkod2me4cvmtkctcjOxN2fD0SWVfkDU2QliPZd+PsTcwVPmhPW8hhBwNczKqOMAxDdMqQsjtDSB2iWHg1oP0Kd6zVMhwvBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744639790; c=relaxed/simple;
	bh=5dBTRx2JIjm9+LihM7UA5L0oIoK5vg/QFSo98pV/tvw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ZLbZ8detq2eSQ6AwTLRZCuC7fujT4CXn8A6jPK+HO9hbp+pPPUROv+TXAxG0jW7YZEtz3g7hIn14tISLUm/3ba0MmnuLWiPFJxrqxtBfXG/FKYwXwIetbiorUeIe/xcBtuONFL5BkcsmsKhsNKBfY1BgRuUYA1/saSxHLYvJB+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pAG1JJ8G; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pAG1JJ8G"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-43cfda30a3cso24532305e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 07:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744639787; x=1745244587; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=V1x1VwM+BJyXyNpGH07RBkzI8imHg185uo9CLrDLxwA=;
        b=pAG1JJ8GCrpjB1r4A15qa99PvA4hG8NYyhc7kJZUZ50He1brBtSfRewUYo0QsAKqUh
         3F6y+2L5jvyTfDZimCNbuR2AVDchzIQjZIwh2clARkbBjFX+WW2E0NuQ6yuH8frpBcL3
         XflQBXS+dY/NUuFIQKyIZVwAl6mnPi+715sMpljPlnUTCiB12+snfdMZJQWDT1oNDINf
         S+hvW75a0r1tdwpKX2dgO0UkJeAxGuBHyZS828y9mllljnu2XDxjkYRHGqwoKgdS6rP8
         3eRRIuTl3mR5Km71L6ignzI8OptnCz9GjCMFlTx9MuhXfAHzTUISpcQySQJOjMU/4gvA
         WZhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744639787; x=1745244587;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V1x1VwM+BJyXyNpGH07RBkzI8imHg185uo9CLrDLxwA=;
        b=mgSykkNZb0tXYNX4VgrrlKAutGvomUpvoeqd+hy4W2bhUqvoxY/5PQLWy6RZQ2Da67
         jUJmrLmFlGFJJxp9nO1QT06LKcfSN/DyqeXnk54b7xz35x4DYiaBIJev7HLGyxq7F8jf
         kXWjB7gAMvLmIMotZejwYoQ4+mN6PV1haELR6nuKldRwpRaXZvxKS/939MtsE1YbZd1s
         B3KTCdYersWzx8ug/GAm5JjvpgFb/trJNVfvHcg73ZVfD7H9FxY9o3T3PLzZ/cjW/Oa2
         Oh4ubGz8Zubi/rLOUxPzvVE+13rkuM8T64u+F6ibfrcg/BHcS95EI/xxnb2JLI7tXfLD
         mr6g==
X-Forwarded-Encrypted: i=1; AJvYcCXsS/59cHhbOyZteS8e7v+rc5L2lZnRQaJlpQpn0KMXVN1JS22+qvn7tHdR2QGcA4xLvfWsexCuKHA1JSw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVWCQPDnsvRLLHlYC2oxngxoUhPgnDwImS4EN3ZZ4F712horqK
	qWU50mbeDJgUM14S9O9rg+4QIyZYBKOY2cb1L89ueYLibmLl/as8ljXkkw4OvaLHblK87dbu7lr
	MuDf3c0jckIqiSw==
X-Google-Smtp-Source: AGHT+IEgLd19E5nBP06l0bJPxMy3VssHMtCjQBP0qyE6H94W9oIzvjooWRxUxI4LOc3bY/vqSQTc4RQzGe+DuOg=
X-Received: from wmbay32.prod.google.com ([2002:a05:600c:1e20:b0:43d:4038:9229])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3113:b0:43d:fa5d:9315 with SMTP id 5b1f17b1804b1-43f3a9b159emr92766275e9.33.1744639787648;
 Mon, 14 Apr 2025 07:09:47 -0700 (PDT)
Date: Mon, 14 Apr 2025 14:09:45 +0000
In-Reply-To: <20250403163805.67770-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250403163805.67770-1-ojeda@kernel.org>
Message-ID: <Z_0XKfAMnWElZDzU@google.com>
Subject: Re: [PATCH] rust: disable `clippy::needless_continue`
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Tamir Duberstein <tamird@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="utf-8"

On Thu, Apr 03, 2025 at 06:38:05PM +0200, Miguel Ojeda wrote:
> Starting with Rust 1.86.0, Clippy's `needless_continue` lint complains
> about the last statement of a loop [1], including cases like:
> 
>     while ... {
>         match ... {
>             ... if ... => {
>                 ...
>                 return ...;
>             }
>             _ => continue,
>         }
>     }
> 
> as well as nested `match`es in a loop.
> 
> One solution is changing `continue` for `()` [2], but arguably using
> `continue` shows the intent better when it is alone in an arm like that.
> 
> Moreover, I am not sure we want to force people to try to find other
> ways to write the code either, in cases when that applies.
> 
> In addition, the help text does not really apply in the new cases the
> lint has introduced, e.g. here one cannot simply "drop" the expression:
> 
>     warning: this `continue` expression is redundant
>       --> rust/macros/helpers.rs:85:18
>        |
>     85 |             _ => continue,
>        |                  ^^^^^^^^
>        |
>        = help: consider dropping the `continue` expression
>        = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#needless_continue
>        = note: requested on the command line with `-W clippy::needless-continue`
> 
> The examples in the documentation do not show a case like this, either,
> so the second "help" line does not help.
> 
> In addition, locally disabling the lint is not possible with `expect`,
> since the behavior differs across versions. Using `allow` would be
> possible, but, even then, an extra line just for this is a bit too much,
> especially if there are other ways to satisfy the lint.
> 
> Finally, the lint is still in the "pedantic" category and disabled by
> default by Clippy.
> 
> Thus disable the lint, at least for the time being.
> 
> Feedback was submitted to upstream Clippy, in case this can be improved
> or perhaps the lint split into several [3].
> 
> Link: https://github.com/rust-lang/rust-clippy/pull/13891 [1]
> Link: https://lore.kernel.org/rust-for-linux/20250401221205.52381-1-ojeda@kernel.org/ [2]
> Link: https://github.com/rust-lang/rust-clippy/issues/14536 [3]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
