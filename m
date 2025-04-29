Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 368AD27F75A
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 08:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745914826; cv=none; b=O8RvyLo12MjtHF0Ha3ZcsuVanSo/Bmu6INi/2oG46xgi28NQ3Wpi71CKBi/gX4HSSDYSkFbC01OlYfqjK1BwExAnBuZGINA/Z/jh/9JXG4JSOdM9wxNKVCIx10T2CZCZclUtZ8ofxtr41spaJoed8LbaFIQm70jlFhmUeNQB2kE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745914826; c=relaxed/simple;
	bh=nQ1gfZSZ41nlJ0M6vvLq9mHDYT2X2OnDFOpCrTsmA90=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=jE5CzUHtFS8rKQyxit9rH811suI1zBYZjcBoOhmqqnXyoMhAAFerTNIM4xSvosNdFmxinEWF3Zap1I994VvF7i35biFFC+/NhwHNRFujlpvE/h+/9FVJ3E4EmYh2UyCwsY8DmpJKKNNnXt6jEm7n//F0OsIKqdjDIpXxAcq4EA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DsMG7Oot; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DsMG7Oot"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43d0830c3f7so43884865e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 01:20:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745914823; x=1746519623; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=0BOccj3PCksp/Vwp89goJmYUfnm0Q5YL3z/5OuMVQD8=;
        b=DsMG7OoteubbO9ri0dMXzGszDhJG58EKrlkDTJMnGWapxrJK1yOqwaFuD5eIOX+sr4
         tIctPy+P66KCQQ9s13k812ayJwNmqQindiOjDEAR+SHp/UkUOcyD179LP02sNm99/kTX
         LUZaIgaYvJJ8xEpu5IOqfJqtCGkZkfVxeDJ8+oXtya40206u3viLCxpV/uho8pSOGTJE
         h1YpBplDBfV5E2s8N2KX4VmF6T1nH+ZTI82HC502icoFXDnaxSSRp5MRn4wGLoYe+15R
         FOhs4QoTSow+uK8ePhcMtZfp0wvat2U+fG3rGlnUEqWUKpiVyMlnrjIlMCn3JwSBt1ig
         MxJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745914823; x=1746519623;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0BOccj3PCksp/Vwp89goJmYUfnm0Q5YL3z/5OuMVQD8=;
        b=lOXzmMjCq+S9jvlLkfNEJAFn+6+0WDwFcgMAL1MmDCmBlKi+AgpN3YpPe4CsvxhZOm
         6oHA3nWq2RgsOAffHuNuH5AlL9q6E2MmLLiSrGTI0GS3DxX5N8Dh2yruXgrgmewOzwKl
         JSmDuCDNhmxm4OzGcBK6PCzY9McY0S0QIvTjtGyoJ+U1ZbJxEARH/lTKJEmtFE94Yd3/
         /mfmyBlAlUub3iXG20TNNGAumIvogiYvqLj/gkWbhY9kKq0nMpuRNMG7laz87XI0u0aF
         /Fwl5LA4aMBtaaN5dCgv1bVCyI0p1ibAup5UVJoLcHlchxj6+Q6l7k3pb78yeKGiPWRM
         skMA==
X-Forwarded-Encrypted: i=1; AJvYcCUlfWoTPKKgj2PuEbXhIe6Oi1oAIwCXq4feV8iMMKtjDDWEish8u5ILYVL71SLhnwuaZrcXWbA5m6suKLg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyUU8gVp78msq7nfJTqJ5tl3OVs4wqq4fwG4Qhp7jgbMUBYbzE+
	Wety2xA35wgjfiqpldoJYwhBhHCmsVnttNEWiLU+hzu8zn9PkIHuvBemNyiPaWe6K78QtJY6gNp
	XZsWJcjk3Ve+azg==
X-Google-Smtp-Source: AGHT+IEg3cbEUt12CbwOJGG4vlAHfjAoOc4ALfnfU1wCdf0iUwyAKU/n0FvnLq2iqgqEdTv2PV5be+ZluwRYT8E=
X-Received: from wmco6.prod.google.com ([2002:a05:600c:a306:b0:43c:f6b3:fa10])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4f0e:b0:441:ac58:eb31 with SMTP id 5b1f17b1804b1-441ac88a96bmr13618685e9.20.1745914823610;
 Tue, 29 Apr 2025 01:20:23 -0700 (PDT)
Date: Tue, 29 Apr 2025 08:20:21 +0000
In-Reply-To: <509c3fb5-310a-43ab-ab84-75207e0c577e@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250423-b4-container-of-type-check-v3-1-7994c56cf359@gmail.com>
 <34457c78-fdcd-4f1b-a349-4ca9bcc2febc@nvidia.com> <aA9M8_K0MQfWg52t@google.com>
 <509c3fb5-310a-43ab-ab84-75207e0c577e@nvidia.com>
Message-ID: <aBCLxR36AQ7oZYn4@google.com>
Subject: Re: [PATCH v3] rust: check type of `$ptr` in `container_of!`
From: Alice Ryhl <aliceryhl@google.com>
To: John Hubbard <jhubbard@nvidia.com>
Cc: Tamir Duberstein <tamird@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Mon, Apr 28, 2025 at 12:54:19PM -0700, John Hubbard wrote:
> On 4/28/25 2:40 AM, Alice Ryhl wrote:
> > On Sun, Apr 27, 2025 at 03:59:48PM -0700, John Hubbard wrote:
> >> On 4/23/25 10:40 AM, Tamir Duberstein wrote:
> >> ...
> >>> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> >>> index 1df11156302a..d14ed86efb68 100644
> >>> --- a/rust/kernel/lib.rs
> >>> +++ b/rust/kernel/lib.rs
> >>> @@ -198,9 +198,15 @@ fn panic(info: &core::panic::PanicInfo<'_>) -> ! {
> >>>   /// ```
> >>>   #[macro_export]
> >>>   macro_rules! container_of {
> >>> -    ($ptr:expr, $type:ty, $($f:tt)*) => {{
> >>> -        let offset: usize = ::core::mem::offset_of!($type, $($f)*);
> >>> -        $ptr.byte_sub(offset).cast::<$type>()
> >>> +    ($field_ptr:expr, $Container:ty, $($fields:tt)*) => {{
> >>> +        let offset: usize = ::core::mem::offset_of!($Container, $($fields)*);
> >>> +        let field_ptr = $field_ptr;
> >>> +        let container_ptr = field_ptr.byte_sub(offset).cast::<$Container>();
> >>> +        if false {
> >>
> >> This jumped out at me. It's something that I'd like to recommend NOT
> >> doing, here or anywhere else, because:
> >>
> >>     a) Anything of the form "if false" will get removed by any compiler
> >>        worthy of the name, especially in kernel builds.
> > 
> > The `if false` branch is used to trigger a compilation failure when the
> > macro is used incorrectly. The intent is that the compiler should
> > optimize it out. I don't think there's anything wrong with that pattern.
> 
> OK...probably best to either encapsulate that, or at least comment
> it. I'm accustomed to seeing that pattern in cases where people
> expected the code to *not* get optimized out, so it triggers me. :)

Okay ... why exactly would people do that? I can't imagine what purpose
that would serve.

Alice
