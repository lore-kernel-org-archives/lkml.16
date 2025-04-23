Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FE1EEAFA
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 08:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745398286; cv=none; b=oZZ5tTx5TnhBTAyFuIVVfA/Ij2r5U1Q8X0OM8yKcYtJaymnZhDh3JMXfjX2UzqJEwtXaKKHI5MLcLpUa1Q3ErU3/BL7MouDLWJH4ntjL762jqDBAh07V7DUe/OpLxI6/5iYrmb6ja7Y+BZIKKMSsG0pavNtLDi2ccZvWTfsULcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745398286; c=relaxed/simple;
	bh=CtT8v2MCiRX7gRBV9QcapypO93sJVqsOiDaKUDm39r8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=oP+JsNefhQGL/FNoczn31BuypaQJwFmM5HQv2maUSBRXzNDH56KbdiF3JZQW2hV76LdzWlhmXqA3Eq3f7MPF+swNIkkDjdi9mirDLDSKuvo0pB7exmmIOREA98nmzT0Qg7C2KekhTuEzFcsYjQYmYp1FnmItOY9/ucZf4Da5Eys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HmbJ4o/1; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HmbJ4o/1"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43cec217977so31826015e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 01:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745398283; x=1746003083; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=rhz5SyKyofpP0CiXoRasSItvHci8jlntDPliqMYHfdY=;
        b=HmbJ4o/12WpIrqe2f2v2/o4IdUWrTuKjhvsjMwKw/ZzmOCGpqdKJlrmG5Y/ymsw+I5
         RQPu05Aye8TBeLvrlvFKhJIqeT4DitbE8J5SAI8cdzrt+IR6TqMa7j+IiZrRstIqj1/+
         p39sPVI4vqrR6GdtBKzDqq0Ao2Vaq2GMaEa7G8Zn7tEzQ8R04+bjBcCwd+9Zu/qBeZQg
         J97U0EasfyrAMQXKhmfzfeJ6Yo03KqAZ82lYzdKhJXmQadcF/0Eg7D/EqltlpbYbeJbc
         Apci8Tui0NlxTDhGgdiX6rET8ig+bONrlYw9kKBTeOMe9VRwUGq6xawg/JvY6RtmdA+p
         5zHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745398283; x=1746003083;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rhz5SyKyofpP0CiXoRasSItvHci8jlntDPliqMYHfdY=;
        b=NoWUmqNW1ix3/pdtFabYs1edfhIKaXs55Jr0slvh92MbMNrvV2XqslhleWoYzhtZO/
         LDV5qnWR6fJt3iIGz9C+jbtGV4RXUU7/QubD7HED1Hbd2Eg50nXg6qDdtvN1HNBLIL2S
         eVHDgRaKHt5CfNlDYO0P6aHQcNkO2CVGN58U7gM6wxCftLBDEHkJd8B7yREVciNWRXmx
         9ynsrn8C1FSt9Gg5scAV0RdTtkLCXyPQTHaluz85nQIX4d9YHncAHufhJVyI1jamXL3r
         jQ1vXpmsc0slhgJGRk7Bfv56GjtrdxuoCAh24sGZmkOlXgybbu810/qjvHdhoTc4V4CN
         XNNQ==
X-Forwarded-Encrypted: i=1; AJvYcCUcu0BKjjwVoNGGGIXBKuVBT9C1RZTwNFLu6Au9pE1ZQshqSYQz40BKK5YlFV21oDprR0b6yiqHTO6taaQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVfBEyyC+eTUBvjgkq5MTV4d0jqljKSqq/DbLcgGWu+bJ3F1LD
	480TaBHV9UOzYQPoLjN9LhLW7Y3Jg2Vl9EXY9K7IbRN8P2QCDmPY041LuXlJjikZRXrlLNvoTyy
	Vg4nZxy5SRF/UtQ==
X-Google-Smtp-Source: AGHT+IHLWGDxm5kfoTW6nhDE7tQXPqggvtNweBYRe67ksxGdQ/RsembKAvwXxH4kRSHpcOnYsczAWFl5vntTJPg=
X-Received: from wmqa6.prod.google.com ([2002:a05:600c:3486:b0:43b:d6ca:6dd3])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4f49:b0:43d:8ea:8d80 with SMTP id 5b1f17b1804b1-4406ab81eb2mr160106685e9.5.1745398283005;
 Wed, 23 Apr 2025 01:51:23 -0700 (PDT)
Date: Wed, 23 Apr 2025 08:51:21 +0000
In-Reply-To: <D9DM3AR3FUAF.6JSNSB9WAJ4T@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250406-vec_extend-v3-1-ec5c5c0acf2a@nvidia.com>
 <Z_OwmEKHgsZlt2cs@pollux> <D91AOKOTDXWC.7R5K5DI87QU4@nvidia.com>
 <D9C61DDI99JX.31T59XPQGYBB1@nvidia.com> <aAfL-e6qA9oBce5t@cassiopeiae> <D9DM3AR3FUAF.6JSNSB9WAJ4T@nvidia.com>
Message-ID: <aAiqCXB9sJe_v6Yc@google.com>
Subject: Re: [PATCH v3] rust: alloc: implement `extend` for `Vec`
From: Alice Ryhl <aliceryhl@google.com>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Joel Fernandes <joelagnelf@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Wed, Apr 23, 2025 at 10:02:58AM +0900, Alexandre Courbot wrote:
> The problem I see is that if you try and do something like:
> 
>   vec.extend((0..10).into_iter().skip(2));
> 
> with the standard library, then the use of `skip` will remove the
> `TrustedLen` implementation from the resulting iterator and
> `extend_desugared` will be called instead of `extend_trusted`, which
> could add some unwanted (and unexpected) overhead.
> 
> If we want an implementation of `extend` as simple as "confidently
> increase the length of the vector and copy the new items into it, once",
> then we need a trait that can be implemented on both shrinking and
> extending adapters. Anything else and we might trick the caller into a
> code path less efficient than expected (i.e. my original version, which
> generates more core even for the obvious cases that are `extend_with`
> and `extend_from_slice`). Or if we rely on `TrustedLen` solely in the
> kernel, then `extend` could not be called at all with this particular
> iterator.
> 
> There is also the fact that `TrustedLen` is behind a nightly feature,
> which I guess is another obstacle for using it.

The stdlib alloc crate relies on specialization to speed up methods
related to iterators. We can't use specialization, so losing these
optimizations is simply a cost of not using the upstream alloc library
that we have to accept.

Alice
