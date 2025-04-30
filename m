Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A65F21C186
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 09:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746004566; cv=none; b=ZHYNc79Wh2sNC90Z7nQocPktnYF379CYLmcHWq92ih3wdlSBYRv83xoWofsVV+h01duyHECFt84Qvt9+EqkvqZ4T7/ivVOUqwqIhKFqv9t/4e4yN5Uzd15yGLUhpasy18NN3ZiZ+XVJ1l4b/ImymuC2aQWSXp1IAHeUgBqb2VtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746004566; c=relaxed/simple;
	bh=LtVhfWiqY+K0Ft9EIwL0Molm/ueKWbCMO2rcHu/Ejug=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Fi4ycbh6HLRfYXH3/IQOg+J/st0JDvmRyNetGDxeeASExE0tL93dKLluhioK/zesR/AbIrH3riJyDx6t0EU2WQsvc7jFld/Jlc6l57gJ9a//gYwyemj2nYaiV4qBfHF80cXtCiduj22fODiZQX1mucJDNWLrhBMKOQrUkj3g1pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wht/Sy0N; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wht/Sy0N"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43d0a037f97so36417465e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 02:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746004563; x=1746609363; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LtVhfWiqY+K0Ft9EIwL0Molm/ueKWbCMO2rcHu/Ejug=;
        b=wht/Sy0NO7eC7k8OuCLEzj/cVUKtk1rs142d3AjLnBGJ/srJD4Rxk+cclaB01y25TT
         c+vgakjArTWvPAO/Ot9rs3DZqbgZ/gpefrtd+feh4yhPuWIW4ZTEeAgt+TM8sZ/1bOEU
         t8k5gr76KkiKEkL+KzARWdoj240q3eWtIDgO9cdxW7PfC0BqBCNWwl+GYjxudjPZZPOL
         FrctyBTOZd/dAOsyhh37Ed/VVGcIwZaD77bUWJIaTx2cqKVcjHPsTtmJQM/k5RWHGjoz
         G3kwGGf3GsTtTZi1Bx2FHRLfbNI4XoyuegRm93IxjDn/FcJEEwIylFcCUD87EiPOurxm
         VR1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746004563; x=1746609363;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=LtVhfWiqY+K0Ft9EIwL0Molm/ueKWbCMO2rcHu/Ejug=;
        b=lxpJJ2aheN+VSG/q4BfYhb2KlhsPPikDcVN+YGGAGwZGi7xEyvE69Pp0QfKeAV2e1X
         cHoayWrUls3ZxZLoxJdfHEdGIqZ7KFeENuFFK1lCdxdaE3UM9Z4PvulRvPux0gqvOqht
         Rnqck32DOYEwedot3LE6w6cE30i9cxi58ouZTfr6PDqop6jKJ39ldvOwuWwCTwtDG1YU
         lgQC9aM6xV+UW65TFN9d+u0GkGJ2nCwl9h6iTGLa6e5Zij4BQMxRgmvDeerfG7JBAA9Y
         k8IqKCyIdjQafzDknbhEq4gcSpu05TK8MwSfsSNavMRDOjT4AzrjiLN3h0ZTwcLtwS5I
         JrBA==
X-Forwarded-Encrypted: i=1; AJvYcCVhgIp6016/EsfRwN/ahcr8wFXQSve3UlpTXtGX1toGcve7N+tKbYIDm/nY5x2S+JtHI5VeoLu5Og3/YE0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTnNe6jDxj/jC9b6mj0gJOFJHXq1OC6LSA7shR0TBdk3XX/WBo
	8fMYplajtZPZzKb3N3m5cUuBk7ocIg5etY+rX7Q2f1sMn/owxS8B0Cv6gQpNFiWD003jguagitE
	k048nxTF6/lQPGw==
X-Google-Smtp-Source: AGHT+IFxhcERQYWAcvbhYHN/OW5FD7v/TzNCgH8DCvMD/GLCXurr03llxmGp+GSubB+keZhqjqEoocx36qx5Vs4=
X-Received: from wmbeu8.prod.google.com ([2002:a05:600c:81c8:b0:440:59df:376a])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:34c1:b0:43d:db5:7b1a with SMTP id 5b1f17b1804b1-441b263a237mr15978995e9.12.1746004563615;
 Wed, 30 Apr 2025 02:16:03 -0700 (PDT)
Date: Wed, 30 Apr 2025 09:16:01 +0000
In-Reply-To: <20250430-rust_unsafe_pinned-v2-1-fc8617a74024@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250430-rust_unsafe_pinned-v2-0-fc8617a74024@gmail.com> <20250430-rust_unsafe_pinned-v2-1-fc8617a74024@gmail.com>
Message-ID: <aBHqUdtkP9uHMdKO@google.com>
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

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
