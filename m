Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5260820B7E1
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 06:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746599346; cv=none; b=lW3EziikmaRUFYK3W4436U7+YN5S3k5dBTekaLsUpaahSiMWrLUVlPRHzlr0gZoRh/boTEX9GkBM5JVR7UsqFEdrpO0TcqmVPPPcRBlCIzLV64JUDAYD89Wi1QAXCoA7HJRjFFAbGc5BmVt3wXFxsefe7t2QF9u7n43Ap9tR8cM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746599346; c=relaxed/simple;
	bh=HHEU69R/esLe/xtz5QeWjsmHEwQGLstAP7tEJwTNAO0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ATIUWnzgUSNBpqVcN3UrPdJM7aJX17M6CVRzQ13MH1qWk3w0D2IDSI2K3x0e9/Is6n0MXfvJQOX9OIE9MsMgowZR2GRjgBK60Hd0h6xj7kRxmP6FxbmeQOGBShPo5ohzZr22Ht3LFPkdvaeirED5FCPbfPgR8qpBPWQwzcL1tuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eGxhz/SU; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eGxhz/SU"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-43ceb011ea5so36270465e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 23:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746599342; x=1747204142; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VtFkzNEPcHp8hksu6rI+HDSavzLjinA+UG+dWVvbQbI=;
        b=eGxhz/SUvrCBgy27NHZ1yMAL6nzxlkbFS1Bv7BS8XjwVeO0J13dcrCYtDAzyXA6C2T
         JJrxY9gnxY36tMyFWuhvbGN4y2NqlnsGykB9EVeu4yn1gVFtnY62deiU+snU1aQMqvxV
         jHDoAaMEw01mx+vhsnCy5pKnRf7fYFrNoZ9GXMQO6EWBS1mDxQAD/Ki/4XDs+lyttTbe
         tLPe0sszrGLSdE6Xs10am4x3KtPnVfK9R7Py/o9kRURNx/e5MCYj7YNNYh2FkyaJVCqO
         XF7ksJBDVNbMcH8J70rRmAAVdiRSBNKKoTnYwhyvEsZceCkIu6Q3X6COvFM+ljUS1JGW
         X8Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746599342; x=1747204142;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=VtFkzNEPcHp8hksu6rI+HDSavzLjinA+UG+dWVvbQbI=;
        b=dxlsP/84sI/YNWgCALsXIHBO7VMX5ozsDWxCd3d+ZC/zpByW4fonvyBm1UMuDiLrmf
         i05F5in7BMLKSAs3dbt3Ew98cX3+yeoosFMp2Ux3Led/CtKIaiq3m3OkSF/aTuWlKm0t
         K73iasdWBypdApiUJUDyq98/zJefBsdxsZoTevUnlKsVSHwNjtld+ye/eTvrPHVV1heg
         +TMPq9DEf+vu9b5/bXuVBylnUqnpEKj0EZELmBijxJJYAMyXWW4Wlj7aPuQJAORrWPLd
         zAEaPzzyS+9/BPXwtpl+WCUDBByvdwOU5/VEZmDPyrUHTMLyIds+A0aNsL4xywA7GJPj
         lSZg==
X-Forwarded-Encrypted: i=1; AJvYcCWyKRRLTjiH4iZyj7JS0ENKvzrulp9PzElWr/LZGqKX2WuTd1yQHqlPHZt+ztAsOfQZxq/SMbatYTOfEh8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+lVDWV9WCao41Btgo4K5CJKihPKxNd8kcsQvuNstS/icdZ5j9
	SROAFXxMUFeq9gUwunTxdPi0lAlcjy+kPq5lRs5CGF6xBRSrAcdmqxVhb4s7ogwMR2QxQ/JfBKG
	y+XCkHIxhkhMH9g==
X-Google-Smtp-Source: AGHT+IE2uljIkDO298yZduLzh13K4OEDT4YJSJN42cZ6z3mMwc4wpvGSukeIfDDLixpGMqN8CFXmZHpSCXFxv+A=
X-Received: from wmbdo8.prod.google.com ([2002:a05:600c:6808:b0:440:68cb:bd4])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:6749:b0:43d:ea:51d2 with SMTP id 5b1f17b1804b1-441d44c3a91mr15322665e9.14.1746599342754;
 Tue, 06 May 2025 23:29:02 -0700 (PDT)
Date: Wed, 7 May 2025 06:29:00 +0000
In-Reply-To: <CANiq72=n68DB+hZ77GT4d7odPSS=wxc+YLvaBhU8-H7PyK25Rw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250506-userptr-newtype-v1-1-a0f6f8ce9fc5@google.com> <CANiq72=n68DB+hZ77GT4d7odPSS=wxc+YLvaBhU8-H7PyK25Rw@mail.gmail.com>
Message-ID: <aBr9rI1OUAEJpQsL@google.com>
Subject: Re: [PATCH] uaccess: rust: use newtype for user pointers
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Andrew Morton <akpm@linux-foundation.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 06, 2025 at 03:59:20PM +0200, Miguel Ojeda wrote:
> On Tue, May 6, 2025 at 3:26=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> =
wrote:
> >
> > The UserPtr type is not marked with #[derive(Debug)], which means that
> > it's not possible to print values of this type. This avoids ASLR
> > breakage.
>=20
> By breakage you mean leaking the information by mistake?

Yeah, I'll reword to "ASLR leakage".

> Since it is `pub`, should we make it even harder to make a mistake
> here by making it private? You are already providing and using the
> `as_` methods anyway, so we would only need a `new` or conversion
> method or `Into` similar (not sure which one would be best -- perhaps
> a single one with a descriptive name is a good idea to grep for it
> easily).

If we change it to store a raw pointer, then that might be a good idea.

> > +    /// Increment this user pointer by `add` bytes.
> > +    ///
> > +    /// This is addition is wrapping, so wrapping around the address s=
pace does not result in a
>=20
> s/is//
>=20
> > +    /// panic even if `CONFIG_RUST_OVERFLOW_CHECKS` is enabled.
> > +    pub fn wrapping_add(self, add: usize) -> UserPtr {
> > +        UserPtr(self.0.wrapping_add(add))
> > +    }
> > +}
>=20
> I guess you are using `wrapping_add` since we have a `usize` internal
> type, but I wonder if we should use the pointer-related naming, i.e.
> `wrapping_byte_add`.

That makes sense.

> Also, perhaps it is best to use another name for the parameter -- I
> would pick `count` like the standard library.

Sure.

> In addition, should we get this directly into the `prelude`? `__user`
> is also global and fairly short. It may not be heavily used all the
> time like other things, but it is fairly fundamental, like the `c_*`
> ones.

Good idea.

Alice
