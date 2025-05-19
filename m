Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E922321D587
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 22:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747695107; cv=none; b=Y84bEb4Dzj3GX1PvHKAjL10O7KYPCh5W9YDc3wfBS7THkcJiygTgrOm6Dan0kU/rlBnx3pqP3hRj6yRfWEU9upsizj/hnGGduAqNKHeLXkNWCjsqNbJrjYfwKjWWuQNMMpPN2fm74DIgwgz+wEF/krC4ipfhs4YjRDsVwXvjiLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747695107; c=relaxed/simple;
	bh=TX92L14skqB1kPQJraoHSUPzEKjJBZaB7wkKKc5c4Ec=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XoGZuGEfW6quUd0TRHNeYituUw4sCDEwKrFo4LfAHnZhfK92HYozC5TotP2PcoJ0ACSPX1apdNu3QOwSJTeZ3ZzkK17LP/Lr0W4sGYIV5V+jgionaCdnFiGbznnusfGBUNOI9/wE1jc5oVfdTLQLlGRdfOlmwRT0fiW5+YBimR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uHNH5wGK; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uHNH5wGK"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-231f37e114eso548665ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 15:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747695104; x=1748299904; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TX92L14skqB1kPQJraoHSUPzEKjJBZaB7wkKKc5c4Ec=;
        b=uHNH5wGK5LDvf5t44NNlC2otf98lBvzOLJ7iB/l8mCUUoQBeYRV9EBldCZIE4Xa7Gm
         FmBHUBHK844RPcAFLoj+vQoF2hVQ6h/FjRkmwb6cbR42S9Fvx9AXfw+6ZAwHD8PKn4VD
         dE/fM1BLfINZSYSWznuldwqrxdltAYVg+4zb6qcXhOVG/atWtN2/HFHHuwnXqekuNW4l
         b2rsLLE15ycH4h1TdHFpe3zFJi2SUSc1TkYN2itWeVQzSXfA60Fk7j4PsoqI3jbwrwyC
         sFHL6nhkO8HLJ0sW4ro0QkvIad8lifN2R5NvMK23WHCphug/2PX/jM8yJMnorAAfNRKu
         3LCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747695104; x=1748299904;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TX92L14skqB1kPQJraoHSUPzEKjJBZaB7wkKKc5c4Ec=;
        b=YrejGKigFiQcYqGnNRopmS7LiYVjl+yoib2jkZ3j8a8xZDrJUtq5BuZetWqECFt8AT
         bt1DXGpMrC9ywBS12iSFoTjezFe+LjRB4uHAh2HhIGXn3rHijRTPfapima8dGbC6FB8m
         qS5R0RR5sM+sLwiOaMv2WUt5ENyF/IgUsfPzPI43UbRD+IHFQRNp9bi5iuUxjkKRy8rd
         m6MOubghP10c42/U3vj1QkF0mxm0gTDRaSPvguTY/9t1PSjEx/+EMSImLX30v+WgQEYZ
         uR/iIRJTximJtjHarXG74QL1WfXfEUES9MQL7zcyPyX+6am61Kbh9goZnfPVcZbZRDZk
         Kqvw==
X-Forwarded-Encrypted: i=1; AJvYcCXCUn5BAGt8EeU3ciLX+jUfwb52AwQZAkdcQtTXH5O1VDyeEMDbHSf8Uj7U9deS6RhiLy19K5y0jitGhrs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1ObrUMyhfHhfJk8xJiRbrQGXv4CbCWv74FFh/KyrutYK0tX2m
	LDRnaRv781s38U/BSgVk3rL3rVEo4nTDdBwlqz1Ec+6Tg0GlS62xTzZdqQkl77Dpw+l8rFim5SE
	LWVTwl2f6EMjHh2QpOrRuC5APnQIu0mEKjx/wzqaryOBNMDJnoEbWluJG
X-Gm-Gg: ASbGncugViHi3Jz1TXfP1Ie6bWaRNW1U2De71RSYVhR43I+7Mn24DODkQnKtQs/KWfz
	lwb2uGtriJz92QUjcxZCCf65Qu2X5a4bMJmSznDZQFGFNSEvu/8+nLnCOeboPOcxFp61V233hTC
	NrTIuWyhX8AVrLP52H0L7qBHQtMpdwjb/7ljUNd1cBxkJIDOvqo8HgY5zsYjc=
X-Google-Smtp-Source: AGHT+IEJQqFo9kIVzf6kdsXOZ8kfdk+FvN+GfA8OvhOQlKP7NDmk4J/CmMe0zHaknbskqf0z+53i0jZ1cPzsgbS54Vs=
X-Received: by 2002:a17:903:234b:b0:223:fd7e:84ab with SMTP id
 d9443c01a7336-231ffdd6fdamr6651765ad.24.1747695103905; Mon, 19 May 2025
 15:51:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250519161712.2609395-1-bqe@google.com> <20250519161712.2609395-6-bqe@google.com>
In-Reply-To: <20250519161712.2609395-6-bqe@google.com>
From: Jann Horn <jannh@google.com>
Date: Tue, 20 May 2025 00:51:07 +0200
X-Gm-Features: AX0GCFtDkuuBEpV0Svd3qg9gt4dLmklnwIzRGtMkX_KWKcpMz7P7ib5qifFtlwk
Message-ID: <CAG48ez2WdxXVCzVsAPeQWgso3ZBQS_Xm+9D1FLBx6UHFV1bGHQ@mail.gmail.com>
Subject: Re: [PATCH v8 5/5] rust: add dynamic ID pool abstraction for bitmap
To: Burak Emir <bqe@google.com>
Cc: Yury Norov <yury.norov@gmail.com>, Kees Cook <kees@kernel.org>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	"Gustavo A . R . Silva" <gustavoars@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 19, 2025 at 6:20=E2=80=AFPM Burak Emir <bqe@google.com> wrote:
> This is a port of the Binder data structure introduced in commit
> 15d9da3f818c ("binder: use bitmap for faster descriptor lookup") to
> Rust.

Stupid high-level side comment:

That commit looks like it changed a simple linear rbtree scan (which
is O(n) with slow steps) into a bitmap thing. A more elegant option
might have been to use an augmented rbtree, reducing the O(n) rbtree
scan to an O(log n) rbtree lookup, just like how finding a free area
used to work in MM code... That would let you drop that ID pool bitmap
entirely. But I guess actually wiring up an augmented rbtree into Rust
would be very annoying too.
