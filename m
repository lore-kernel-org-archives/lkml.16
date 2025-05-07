Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DAD11F8ACA
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 06:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746598779; cv=none; b=d4epLX4uj0vN/nbUr0aa/rXs32fm+UxYloPgM78DBQdmATBfH5johzHF6npMa8gJFPj21u3MRFU01bkarMkul+8GBUl8JaS9As3RYjOiIHl8s7usgQmerXQnqTYr7O4trAvO5p0DVtjZmLNzL9KXBR4Y9S6vFXxcJzJ6x5VzlVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746598779; c=relaxed/simple;
	bh=6tydWcRpZBzUQvyxODFlgjL3R3CohVies8vRsbCnPXI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ebK9ccFUEBT0Tl4+Ex7GDoC8JRuBz86Nq9GBh0w/f8yaLz4zcRW+8cwqKc/0nljMIF5uBBP5VEy8bjMPhMdxej6CFowI7175MGtUAKzEAKQPBlejZhAMz98pp6uF2Y1YNf9J1xIg3FyXMBSt5XCtHb2O69h/HTLjBsEIl2iO3gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VcZKKJ/K; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VcZKKJ/K"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-3a07a867a4dso3218093f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 23:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746598776; x=1747203576; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=mxyUNTvP34JoK6iEo8F8cf8Z5bCf9zDMz2zqlSL1qSk=;
        b=VcZKKJ/KywaQpCQu1zGLu7WoWGfMIwFlwN7c+oF3j0ZVn6wDbxM35jvKYJpJYkGrU+
         WgTzUi30NhiN+IqIKszfr941o413zXYguBmcpTOKCJLQSzlDcw/68la7+9GTSNCSBiRq
         AD7+pSSFJ0jEUU5tDB8E4EKK5Xrh/tU4YaXGr5zKEGdxrEBtQ4VnCf1nKhRELfWvJbRc
         EZTpsuneyE4YsasPvxms2C9OesrbCGiIL4K+nEC7+6E+6gQZHsZv1mVSfKVNm3uTseeD
         ntC3M630edgQVN9wBdAbCWnLyOSDsG0bJ6QxOB+UXcjzvVDDTtqN9Y6mQM4mv0K0w64C
         a4YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746598776; x=1747203576;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mxyUNTvP34JoK6iEo8F8cf8Z5bCf9zDMz2zqlSL1qSk=;
        b=rT94EAh5tZOl6lC6Qy80Zbl5CUbCskhK2/tavuCrTn5+7NCeC8kW9coGvPz20lKXFI
         ES5p5bjBHbRjnEUC8Yxq2AGDbQ4rEKOqZSElL0JIGEjJ9fY4n4v+B+QPIRLRjCDT1SHA
         YrLt9oOKRsl2ehOtxRMhFhriUYCcKQzg/b6cDL9cAPNsJpH0nkAN7FDsprGam0RZWGZr
         WJlTxVurGZDJ7h5F+kyTMSCLddBFho3EuMN/i7aNKz2ip1orjsavcI212JkuJ4rLRtim
         7N4QrUTdFq4bqLQj3psDwHR9zie6f8X1M23jKAkccG1PzITLUKQVSFs8DRM2CodISYkf
         0GKA==
X-Forwarded-Encrypted: i=1; AJvYcCVLOZuBp5nwaEfcNj4syC40HhuMlZbzsW4uQvBQ1XAi4bHfSJIxFyio9Ly1Xc6dyuzQ32A+LwnAZxQnA6U=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXj0YPN2qEFBU1hUPEqPjJqNORhH6IwPpce2k5wr5LUL83PFOT
	M6ZUb2C0x9/McuJYon/7vYS+kbw6oEbAjRV6DirAtJ5DvvKVRlVYhy6Zs7zUBh1ITu0hXg5MMzN
	RXkbAFHuigfmXcw==
X-Google-Smtp-Source: AGHT+IH/A+GW9/vNl8LxbYeXDaJTSi5tAp4zqD7UPsjEV+kj3rFAEWxJ+FSBbd8dF4ixIv0poZ4cjkpbq1Y2mGw=
X-Received: from wrbeq17.prod.google.com ([2002:a05:6000:4311:b0:3a0:b229:c407])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:1447:b0:39c:1f0e:95af with SMTP id ffacd0b85a97d-3a0b4997fd0mr1573685f8f.3.1746598776608;
 Tue, 06 May 2025 23:19:36 -0700 (PDT)
Date: Wed, 7 May 2025 06:19:34 +0000
In-Reply-To: <aBn1jJBRToyElrF3@mango>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250502-unique-ref-v10-0-25de64c0307f@pm.me> <20250502-unique-ref-v10-5-25de64c0307f@pm.me>
 <aBSv0w5x8qhBfOM8@google.com> <aBn1jJBRToyElrF3@mango>
Message-ID: <aBr7dm_L7JEQIVxC@google.com>
Subject: Re: [PATCH v10 5/5] rust: Add OwnableRefCounted and SimpleOwnableRefCounted
From: Alice Ryhl <aliceryhl@google.com>
To: Oliver Mangold <oliver.mangold@pm.me>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Asahi Lina <lina@asahilina.net>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Tue, May 06, 2025 at 11:42:08AM +0000, Oliver Mangold wrote:
> On 250502 1143, Alice Ryhl wrote:
> > On Fri, May 02, 2025 at 09:03:04AM +0000, Oliver Mangold wrote:
> > > +pub unsafe trait SimpleOwnableRefCounted: RefCounted {
> > > +    /// Checks if exactly one [`ARef`] to the object exists. In case the object is [`Sync`], the
> > > +    /// check needs to be race-free.
> > > +    fn is_unique(&self) -> bool;
> > > +}
> > > +
> > > +#[cfg_attr(RUSTC_HAS_DO_NOT_RECOMMEND, diagnostic::do_not_recommend)]
> > > +// SAFETY: Safe by the requirements on implementation of [`SimpleOwnableRefCounted`].
> > > +unsafe impl<T: SimpleOwnableRefCounted> OwnableRefCounted for T {
> > > +    fn try_from_shared(this: ARef<Self>) -> Result<Owned<Self>, ARef<Self>> {
> > > +        if T::is_unique(&*this) {
> > > +            // SAFETY: Safe by the requirements on implementation of [`SimpleOwnable`].
> > > +            Ok(unsafe { Owned::from_raw(ARef::into_raw(this)) })
> > > +        } else {
> > > +            Err(this)
> > > +        }
> > > +    }
> > > +}
> > > +
> > > +#[cfg_attr(RUSTC_HAS_DO_NOT_RECOMMEND, diagnostic::do_not_recommend)]
> > > +// SAFETY: Safe by the requirements on implementation of [`SimpleOwnableRefCounted`].
> > > +unsafe impl<T: SimpleOwnableRefCounted> Ownable for T {
> > > +    unsafe fn release(this: NonNull<Self>) {
> > > +        // SAFETY: Safe by the requirements on implementation of
> > > +        // [`SimpleOwnableRefCounted::dec_ref()`].
> > > +        unsafe { RefCounted::dec_ref(this) };
> > > +    }
> > > +}
> > 
> > I wonder if this is too limiting. It will limit our ability to write
> > other blanket impls for Ownable and OwnableRefCounted. Using e.g. a
> > derive macro might be better?
> > 
> > Alice
> 
> You might be right. I don't have a strong opinion on the matter.
> 
> I'm not really familiar with procmacros, though. So maybe I should just do
> away with SimpleOwnableRefCounted for now?
> 
> I mean Andreas doesn't need it for his current use case and this or a derive
> macro can always be added later if it makes sense.

That's okay for now.

Alice
