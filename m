Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C7A728A1D8
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 07:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751874412; cv=none; b=itADQ78rhgTK0rDWlyRQoL+/SGcK7bJGIT3f+1/qlmOnYddv0YTnZIDQ1A+xmhVpQAdITp1jA2cXQhLvs4tlScjkwPR7Az6ymJBnVc33JJ2MHI7Prw9HV+A83uSKJ5vO8jV8HXaYO+2oR8XDxxRAcpjcLSzienJHqWWNlOJp2dI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751874412; c=relaxed/simple;
	bh=Ox8F8kx9gL9CRav3hh4fjm7hYU6h8nlzlsxIyBzYyF0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=WmAbIuyQcEdPcL+A/DxJ24sv7JRgDvDeILTYPNtnaAVo6QHKwH6r87O81CSQNq246UUYDoeQE828SZ3GVcojpNwcF8qh5JP6rdgrSHm1ZGg+7LY9X/KABDUWM1KuMiJO7GZyxqsgqoRL6Y9/exYagSHZTnVHSJOq5OoYM7CnhSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=T3L52Qsz; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="T3L52Qsz"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-4536962204aso11183585e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Jul 2025 00:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751874409; x=1752479209; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=85Flp7b4ljo/UWljC390TJTCn2w0mqmX1hjOf0gOSUA=;
        b=T3L52QszILlpY4ETQ782l3y56+cxCLcws11sXDFeMji80y9QbUbmj9b2zslO2P0Dzm
         2uk/7bRhvkDxXT8k3aPt32fjx71VQ7DW2zlFwtG1CJegQ/sfClAB/qyo08HoJDEKWhPe
         Gx+m23Ld2QDb8yzem5mx6bO3AgZM0aepY7XIPKGPjgOTm4POxU8iZ2/L158RAot0r4+l
         9Iw6C82Xq5YuEJNMvfq4Q+D7aOobZLNWrgDWBFTcULDWulW1iA0tWbrfpqn5MvUWnAeT
         kTIs1U1uHnmOfSzLGG6puml62qWEKNAtdLKxgcKDbFI8VZNmyQZAGz58TxDyPM6dAOjg
         fRhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751874409; x=1752479209;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=85Flp7b4ljo/UWljC390TJTCn2w0mqmX1hjOf0gOSUA=;
        b=vEq/cASFsnlH+IKHa9Z+6gSH9jyH78RASujBZoSunjDWAse5IlJ1dQKdTRx5gqC5Om
         kcnYiUD1CIXB05huto7suTd/pgRjoP63S0ZydjQTEdD0p+DZPrHOcOXV021kt3jEeeyJ
         1JUEQ/Dqfg5pRh6GqZNjYa9E6mzlySQQ7FOHK13WfaRYSz+fGVLCm9mNxBBu6vSFgc2w
         yUtryOx1orrhFIYc7JHcQryAtGoVQ2OpzfkKx7lE55/XX8i8VgusmO4gY2UjeErMUyWr
         /2R/4VSkaPxu4shXMyRPzLYfjK4MuSM3yrqEThsxvkfzPTJYYP5U4H0E0WWxIz3kzDDd
         T5LQ==
X-Forwarded-Encrypted: i=1; AJvYcCVxwmao6mioozDFr7TC2vG1hhaoFBqwnS5020m7jifwQEHo2XFErCmnXOuLvjXU9zshRNPIUf1Ix08OZd8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyuzqJPcRFSdHOe2QVTvMekGFObz+gHYbWnYcy+tl5BcnXoGfX1
	afMnt1HPFgXc15LxLGZ4aSTrlC2j3z73RHC70fgBXdXFU1CSVut5FQ0bdcR2Zelx308vuDGcjZ6
	7AGwB05KF8O4jXKlSCA==
X-Google-Smtp-Source: AGHT+IF+X8nAaKNYaHvrOgUqLHjfkAfLscUr2qXaXIh/HgVu4ENFQdNOPCbYD+y33jPp+gAp7CgdOLLsDbEDjaY=
X-Received: from wmqe3.prod.google.com ([2002:a05:600c:4e43:b0:442:ea0c:c453])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3b8e:b0:439:86fb:7340 with SMTP id 5b1f17b1804b1-454c3326920mr35345165e9.30.1751874409526;
 Mon, 07 Jul 2025 00:46:49 -0700 (PDT)
Date: Mon, 7 Jul 2025 07:46:48 +0000
In-Reply-To: <20250704-topics-tyr-platform_iomem-v12-2-1d3d4bd8207d@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250704-topics-tyr-platform_iomem-v12-0-1d3d4bd8207d@collabora.com>
 <20250704-topics-tyr-platform_iomem-v12-2-1d3d4bd8207d@collabora.com>
Message-ID: <aGt7aItuSINDzj2O@google.com>
Subject: Re: [PATCH v12 2/3] rust: io: mem: add a generic iomem abstraction
From: Alice Ryhl <aliceryhl@google.com>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	"Ilpo =?utf-8?B?SsOkcnZpbmVu?=" <ilpo.jarvinen@linux.intel.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Ying Huang <huang.ying.caritas@gmail.com>, 
	Benno Lossin <lossin@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Fri, Jul 04, 2025 at 01:25:27PM -0300, Daniel Almeida wrote:
> Add a generic iomem abstraction to safely read and write ioremapped
> regions. This abstraction requires a previously acquired IoRequest
> instance. This makes it so that both the resource and the device match,
> or, in other words, that the resource is indeed a valid resource for a
> given bound device.
> 
> A subsequent patch will add the ability to retrieve IoRequest instances
> from platform devices.
> 
> The reads and writes are done through IoRaw, and are thus checked either
> at compile-time, if the size of the region is known at that point, or at
> runtime otherwise.
> 
> Non-exclusive access to the underlying memory region is made possible to
> cater to cases where overlapped regions are unavoidable.
> 
> Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>

> +    /// ```no_run
> +    /// # use kernel::{bindings, c_str, platform, of, device::Core};
> +    /// # struct SampleDriver;
> +    ///
> +    /// impl platform::Driver for SampleDriver {
> +    ///    # type IdInfo = ();
> +    ///    # const OF_ID_TABLE: Option<of::IdTable<Self::IdInfo>> = None;
> +    ///
> +    ///    fn probe(

When using # to hide lines from the example, it's useful to think about
what's left. The rendered docs will have a weird empty newline at the
beginning and before `fn probe`.

So I would either remove those newlines or just not hide those lines.

> +    /// Same as [`Self::iomap_sized`] but with exclusive access to the
> +    /// underlying region.
> +    ///
> +    /// This uses the
> +    /// [`ioremap()`](https://docs.kernel.org/driver-api/device-io.html#getting-access-to-the-device)
> +    /// C API.

I would probably format this like this:

/// This uses the [`ioremap()`] C API.
///
/// [`ioremap()`]: https://docs.kernel.org/driver-api/device-io.html#getting-access-to-the-device

> +/// An exclusive memory-mapped IO region.
> +///
> +/// # Invariants
> +///
> +/// - [`ExclusiveIoMem`] has exclusive access to the underlying [`IoMem`].
> +#[pin_data]
> +pub struct ExclusiveIoMem<const SIZE: usize> {

You don't need #[pin_data] if there aren't any pinned fields.

> +    /// The underlying `IoMem` instance.
> +    iomem: IoMem<SIZE>,
> +
> +    /// The region abstraction. This represents exclusive access to the
> +    /// range represented by the underlying `iomem`.
> +    ///
> +    /// This field is needed for ownership of the region.
> +    _region: Region,
> +}
> [..]
> +impl<const SIZE: usize> IoMem<SIZE> {
> +    fn ioremap(resource: &Resource) -> Result<Self> {
> +        let size = resource.size();
> +        if size == 0 {
> +            return Err(EINVAL);
> +        }
> +
> +        let res_start = resource.start();
> +
> +        let addr = if resource
> +            .flags()
> +            .contains(io::resource::flags::IORESOURCE_MEM_NONPOSTED)
> +        {
> +            // SAFETY:
> +            // - `res_start` and `size` are read from a presumably valid `struct resource`.
> +            // - `size` is known not to be zero at this point.
> +            unsafe { bindings::ioremap_np(res_start, size as usize) }

Here you cast from ResourceSize to usize. Are you sure that is correct?
I thought those types could be different.

> +impl<const SIZE: usize> Drop for IoMem<SIZE> {
> +    fn drop(&mut self) {
> +        // SAFETY: Safe as by the invariant of `Io`.
> +        unsafe { bindings::iounmap(self.io.addr() as *mut core::ffi::c_void) }

Just c_void.

Alice
