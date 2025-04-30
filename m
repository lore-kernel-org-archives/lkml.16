Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 710482AE7F
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 09:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746004800; cv=none; b=Q7GR2RLMW7iYvnyuPr2sLHyGXOGJqgkfqVSaBd91QhAOnCAtwtVL2lsJ8DdN/b7SVv6a+ep2nqh9Qiv2HdM1azXVmcbAwCLBhCxXCGM569UrGFZteGEitrMusITfzSw7j0GisD96285EWVkmjR84WcnMCYtfTw6+WQDHO7Dkps4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746004800; c=relaxed/simple;
	bh=luVgX4/suuJQBAh5OlOHWiCeMLV7ARO+7+728ivvVOI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=LG0bZohqiyWGv6cPZEuRMRKW5CiMWLXK/ii7SKGGJWKMwBKqVp54J2nmEGY87CfVVDQZEp3TEIlC5fAzWyCH0u5ICToQTB2pU1v5CTtXuG0Yc2OkqMAevnEi02kwoBiMumIh66C6NUrl87DAHULWAVdp8U52hW+hXYYZF5cdTdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dpz8vgRB; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dpz8vgRB"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43f251dc364so38174665e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 02:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746004797; x=1746609597; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N7/pamL6WqtmMp82AIocbHVogpArxL5wm9RxH8d6lTs=;
        b=dpz8vgRB05ApxmZgqWCdS6tyakUF6mfr2pXYU5WdLz29MX2dRlcHEuSNUEc9K+OOAZ
         cRTsqBc2MTRY7IwwzEQzHuyymM+FZq9ngKwfKmlh9HLKbJmBlwmE/gwG5W9k/USE+mS+
         b8sax3NIDYGtNoNgiQ8dxNkmuak4a50fBpQE4WEFkY4Djdgc8BaCx1CTGl4DuHrmpuf0
         TH0rYDwMoSshlRCD/vbT8HEkR3uZ2fpwWqt98F7cnrhyqCA5Jdv3J5uQuSj/E5iKOpT7
         XKGC9aifXA3NLxtp75qI8VhJJvrV+g5P019m2hLQnqwnsKAW7jUb51zhv550kKmZyWDP
         DA4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746004797; x=1746609597;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=N7/pamL6WqtmMp82AIocbHVogpArxL5wm9RxH8d6lTs=;
        b=TirobkIdCLhN9+davtmv6aLlHGsyqfvXK2hhmQUn7eBqXQO1eEWAxnP5bJspvK3KYV
         RSMTblEcMfjFNte2vaEdxhyGl1t0McgGa0vOKKiwvJpW6NsbCqdJ0ZXVbQqu8EuWE290
         lfdvK/uTVhK3Ne9RGw8BSVqpwx9yfg/L7gv+Tl9REEz7XWnjgNT0Y3tRS4jBA6mW11/y
         HAYMuNC2oFF5K/kuhVK59q9zeKtvXC0lr/HdzuwvZDGyIhQfpGvL7Vtlnh30qy5DFX0R
         NBlhK2aLr4KcnZ6oAgUisT2qHj55z3x8tV60Esh9QymI7B3Ai/AHjh949UFuFIwmabYb
         2NkA==
X-Forwarded-Encrypted: i=1; AJvYcCVVm3AWfxJQL2gqFZ8s5NWz0AunzftWK4+7w35lKHlopxDdDO0AtAUOlQcZ5w3vhs0k4jQ4CI9hdWo1FCs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxDPOXriGMLOE718OmwFQu0aBR9uXu2eChJ2jM0HFVYUQxlTRk
	GuSRQmcG5fUO6rkBFcleNpXhr6vR3/L11jacAZaLjr9N76t7ikz+P6ai2TMuJ2C0FUcrTxLE9L/
	s0JRzruB6SV9XsA==
X-Google-Smtp-Source: AGHT+IHu66qXUj9EtiSB8hmpdtbQts3wHdvrZzC+DFJRZm6TgLlK3rsrTKHckH0CIkKSeV5LVQOPRDIesvUlBYc=
X-Received: from wmbhc26.prod.google.com ([2002:a05:600c:871a:b0:43d:8f:dd29])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4e94:b0:43c:f513:9585 with SMTP id 5b1f17b1804b1-441b1f35f11mr20269735e9.13.1746004797002;
 Wed, 30 Apr 2025 02:19:57 -0700 (PDT)
Date: Wed, 30 Apr 2025 09:19:55 +0000
In-Reply-To: <20250430-rust_unsafe_pinned-v2-1-fc8617a74024@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250430-rust_unsafe_pinned-v2-0-fc8617a74024@gmail.com> <20250430-rust_unsafe_pinned-v2-1-fc8617a74024@gmail.com>
Message-ID: <aBHrO_hE0CEb0Wfw@google.com>
Subject: Re: [PATCH v2 1/3] rust: add UnsafePinned type
From: Alice Ryhl <aliceryhl@google.com>
To: Christian Schrefl <chrisi.schrefl@gmail.com>
Cc: Sky <sky@sky9.dev>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, 
	"Gerald =?utf-8?Q?Wisb=C3=B6ck?=" <gerald.wisboeck@feather.ink>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 30, 2025 at 10:36:11AM +0200, Christian Schrefl wrote:
> `UnsafePinned<T>` is useful for cases where a value might be shared with
> C code but not directly used by it. In particular this is added for
> storing additional data in the `MiscDeviceRegistration` which will be
> shared between `fops->open` and the containing struct.
>=20
> Similar to `Opaque` but guarantees that the value is always initialized
> and that the inner value is dropped when `UnsafePinned` is dropped.
>=20
> This was originally proposed for the IRQ abstractions [0] and is also
> useful for other where the inner data may be aliased, but is always
> valid and automatic `Drop` is desired.
>=20
> Since then the `UnsafePinned` type was added to upstream Rust [1] by Sky
> as a unstable feature, therefore this patch implements the subset of the
> upstream API for the `UnsafePinned` type required for additional data in
> `MiscDeviceRegistration` and in the implementation of the `Opaque` type.
>=20
> Some differences to the upstream type definition are required in the
> kernel implementation, because upstream type uses some compiler changes
> to opt out of certain optimizations, this is documented in the
> documentation and a comment on the `UnsafePinned` type.
>=20
> The documentation on is based on the upstream rust documentation with
> minor modifications for the kernel implementation.
>=20
> Link: https://lore.kernel.org/rust-for-linux/CAH5fLgiOASgjoYKFz6kWwzLaH07=
DqP2ph+3YyCDh2+gYqGpABA@mail.gmail.com [0]
> Link: https://github.com/rust-lang/rust/pull/137043 [1]
> Suggested-by: Alice Ryhl <aliceryhl@google.com>
> Reviewed-by: Gerald Wisb=C3=B6ck <gerald.wisboeck@feather.ink>
> Co-developed-by: Sky <sky@sky9.dev>
> Signed-off-by: Sky <sky@sky9.dev>
> Signed-off-by: Christian Schrefl <chrisi.schrefl@gmail.com>

> +config RUSTC_HAS_UNSAFE_PINNED
> +	def_bool RUSTC_VERSION >=3D 108800

> +#![cfg_attr(CONFIG_RUSTC_HAS_UNSAFE_PINNED, feature(unsafe_pinned))]

Actually, I missed this on the first look. Where is this feature used?
You only have a re-implementation right now.

Alice
