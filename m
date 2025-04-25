Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BDBD238D22
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 09:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745574662; cv=none; b=rMkuUf4ZTyg56zPkTAc2HhDTVhRC2MyOUVK0PduA7K1wsBSjQ4EJA54VoFV/cQzLQDUCcusdMPUeLBj/afdj8rLcXnT1JQtzIcBPdd6xVO7ERAHT09g8hGhW8ynfb4kMljB3+8illH1+usI/bygwzV+7L+B+zqEMi4gJyGEF6VY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745574662; c=relaxed/simple;
	bh=dX4ilGL5lPcL4snnZPUpnS7XhUi6/KdBiTSBOQ3seOM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=doIm5U1zvORlO9hSowdPsWQIXA1HBFeC9D8s99WY5m8BUYOUXJlhKM3S0PNDjZwS1E+VQ2WDhi+If1Bs8UpuXgBFe0/Av17pFQiSCjiEl1h538KZFA3ZLpf4Gb5t0xbgRXjhBasM6a1gC5voKCklunn9s9vZ0a+wCn3KuMW9W/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IIJMWswK; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IIJMWswK"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-43d00017e9dso12207465e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 02:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745574659; x=1746179459; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=IcRjbktp1JPPzz7gGGH3NqrmgpZ1dN6ZyEZ2iFHKq40=;
        b=IIJMWswKQCGd6lrwMZhtqxTRit9HLaSshCYwp3fyLir0a44fg7YXCxP0qzKX1N485P
         iR9skTEEEc19L0n9zriAp+AhVntrCmAsbKx71tcMZjmoQjFEVrqbljbvSBHTzi+Thljz
         GTJBCviQ41fztU/4iOM7w4/79IBZFuf9wjjkls1oGw5usYMxc8SkCs9317HbV93jqQee
         UNC8xdxHoXDBIiRyFaBUrG91nvSDWDP0WNGI1p6dLBJU+ortBHgDJIkF9SDy0tidht6X
         +4Y28bLwNKENS02mA2dkd09gW/is97Z9fsRiCtc7VRwh+dsqMM4V/t29MUUIKJTkiMs2
         zCpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745574659; x=1746179459;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IcRjbktp1JPPzz7gGGH3NqrmgpZ1dN6ZyEZ2iFHKq40=;
        b=RQ9bSTSYacYjOLJK1lfGe6Y+xAVk4cAGVrr8lQ7bZIU91djzX8bxOs3MyiSuBDc2vv
         NrtJwXGinf3LPgrg/LDwscDasAdseo9UCSa/9XzNgh4XjhTZvMiHGpQlpHyXdAt9EpU1
         4Bm/n+I0muzaWZmQ/6KR2AkkriGVRal8N52UQrR0chYJi0dOnuVBvZT3otlZAEW7cUEG
         9IJRDwijBF/oSCQWIrRmpzOFVCbYEBqTVSA25pYDRhbSAJBQLM+ZnYNuaQ9ZPTY/fuMt
         QSU/amcflcMBUyHpiSEcp35+nqqXIh1J3xU21HNEmmAWAWa3q6zk1JWD2E2ZbANcW0ja
         v5Ig==
X-Forwarded-Encrypted: i=1; AJvYcCUoGmvxrwPt5Y2hNqEN8bD50CGLAQw6BDpzEBjiwwnOr7AZzlL6WCfq8WnTMI7UPTKMcUvfWm1YhskkIoM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDXi5CDRy7zB8PSB0ChUCUE/yrr6r4Nf5Ekx4kmUdG54w4dPLq
	yhQwVNR/yXpSkM3xnqmBEI8h2osk7fm/DbM6u6z+TJFHd4MGEng8uN0mnUTS7JF2O+sY50/NJx0
	SBPc3k+Z3jPAzrA==
X-Google-Smtp-Source: AGHT+IHV1TqFFWv0eFkjdCKsXzJrhLoT8GrmqmoKAN92v+TTDPi/wCPqetmug9u8SJQjmrSGVgeGlZirtQJgWjE=
X-Received: from wmbfp9.prod.google.com ([2002:a05:600c:6989:b0:43c:f6c0:3375])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1d97:b0:440:67f8:7589 with SMTP id 5b1f17b1804b1-440a66143f0mr15961895e9.16.1745574659544;
 Fri, 25 Apr 2025 02:50:59 -0700 (PDT)
Date: Fri, 25 Apr 2025 09:50:57 +0000
In-Reply-To: <CAJ-ks9nMqjj85rK6LsSnTPqsTHmMUDJsQxqJ7n2+r4oSZqBibA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250423-b4-container-of-type-check-v3-1-7994c56cf359@gmail.com>
 <aAomRMzyu3EX5Xal@google.com> <CAJ-ks9nMqjj85rK6LsSnTPqsTHmMUDJsQxqJ7n2+r4oSZqBibA@mail.gmail.com>
Message-ID: <aAtbAVW8XXHTdDBe@google.com>
Subject: Re: [PATCH v3] rust: check type of `$ptr` in `container_of!`
From: Alice Ryhl <aliceryhl@google.com>
To: Tamir Duberstein <tamird@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Thu, Apr 24, 2025 at 09:47:52AM -0400, Tamir Duberstein wrote:
> > > diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> > > index 1df11156302a..d14ed86efb68 100644
> > > --- a/rust/kernel/lib.rs
> > > +++ b/rust/kernel/lib.rs
> > > @@ -198,9 +198,15 @@ fn panic(info: &core::panic::PanicInfo<'_>) -> ! {
> > >  /// ```
> > >  #[macro_export]
> > >  macro_rules! container_of {
> > > -    ($ptr:expr, $type:ty, $($f:tt)*) => {{
> > > -        let offset: usize = ::core::mem::offset_of!($type, $($f)*);
> > > -        $ptr.byte_sub(offset).cast::<$type>()
> > > +    ($field_ptr:expr, $Container:ty, $($fields:tt)*) => {{
> >
> > It's rather unusual to use an uppercase C in the name of this parameter.
> 
> I took the parameter name from `offset_of`:
> https://doc.rust-lang.org/stable/std/mem/macro.offset_of.html.

https://github.com/rust-lang/rust/pull/140285
