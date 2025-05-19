Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57BAF289359
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 18:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747678001; cv=none; b=eDeyujAFm6Igp0RNivT5MuLawGQTADlVcFZBY54OadgForu8isUf1VYAoXveChjYjFcvGJ6pZDWIrTsBIXO1+6Vb5miyQtznwn03E7xkVv0M39hiHvIxJsnOYGBLMWvjXXLRxQLea6to1xX88rrO1s5lFEZ7GDFh5n0FOZRfzpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747678001; c=relaxed/simple;
	bh=IY15D9pR4DHYvFOi9/5G0jwNjhD4R7FSbodtnWlPEVI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=mARMlOW+cdCWqUd6tk2bQYa5OJibH11jMBco/NazLIq9lA0RZ4+265Zj509MJOwzryoSEEpccDXe+yM4vmNACi2QT13P99eG0tVE0qaY/p61jUttm105Qe+ab4Msu4Iy5jD/GEi14G8rHQpDR0BJXL2UrtS3teqCk+gIskitE9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NBFeNtRe; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NBFeNtRe"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-442cdf07ad9so27835445e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 11:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747677998; x=1748282798; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=eG14pmsh7axpdFDnVfISFsJmcBvEGUku9i7TlfI5WTs=;
        b=NBFeNtReYmNXObOqxd5OuVTuCkHax3SRbUU2ICN292KukXgd8hn3tuWm9+06UXl56f
         Vndwu4xp3+hHJ+lbAEq6PJzGy62oB/lQtjCKeOc9a1ra1w9qnxlz5I8XVefJ6I4IQOxc
         4OTYF2dBJbLlYl93E7QMZzfyDMJP9Y+aBbMv55Kk2eAkD85ZLe032bPBgsPG2f9VOb1d
         fL6x9J+w2yRN7Kh0DcgKgrCCN21LD3ihtj8ZidsC0AY6s+GX1UUJMbpw55ur8apU2+7Q
         NJLXyXlvwCDjXvJExWxeVK7Pb6j0k5lIObbfxfmYrfP62uQrbKk3JxI7X/rKBLGMT0ek
         kI2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747677998; x=1748282798;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eG14pmsh7axpdFDnVfISFsJmcBvEGUku9i7TlfI5WTs=;
        b=HR+ZkXdrB5FSUfw2DvOrHnWaKSUHfNqHNWDFk7i+wLaOjymB8XOFGa/1SzPkxdPDNV
         YHedvzuZl4/wt7AV/JFDO+PZDB66xdy2nons+3qjFkHtbYGJCuBjno8vtHj2utIoQZIj
         8cfZWrtG/el6L7n1jQbuk8qFfrtgGdQszTSPSMqCfVbc/sMoYxUYLbzWgzqaXWT/f4Wp
         uD5gHk0f5OxL8N/uH7tmGCqldzPn96RG0TgRNmGOwxKwPdmchb9WYNyQKIGwJxtTi55x
         Tgav7OLgIuHp6f5v88ZfRqhzY7iYAF+yijE4G59J64XyXnyh8d4kSg8VsWoh6AYuCJlo
         3Cqw==
X-Forwarded-Encrypted: i=1; AJvYcCVHQtf8N6DDZO2otywxWq+4SNjWz5JGSziSR+YEjbgiU5rbnnQNv+YoiG757nfR1s0a0dRm+i/Mmj4Eos4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8QyEgstjqO9CGT3gZie26C65XsWrKvncURh4uKqgEJ9QQlQ6b
	lyMj0UEnjWHkL1nyiPDkD/TpV53ZxP+SjrFBxmTubFlB5n1LUySxhY6UiO1MnsyFLqXPS++MCpS
	vaG051oFj+HQVT+RXfw==
X-Google-Smtp-Source: AGHT+IFKkROM8S2X6hVulNORyOvZuDhzod4S25WBIXPkUp5czDXn3G5vouDaPDJnP39FfaquJRTrfKsYSOa93Dc=
X-Received: from wmbdq8.prod.google.com ([2002:a05:600c:64c8:b0:43d:847a:8ccc])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1e1c:b0:43d:9d5:474d with SMTP id 5b1f17b1804b1-442fef3e822mr143806575e9.0.1747677997829;
 Mon, 19 May 2025 11:06:37 -0700 (PDT)
Date: Mon, 19 May 2025 18:06:35 +0000
In-Reply-To: <20250517-b4-rust_miscdevice_registrationdata-v3-0-cdb33e228d37@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250517-b4-rust_miscdevice_registrationdata-v3-0-cdb33e228d37@gmail.com>
Message-ID: <aCtzK-BQS-sVRC20@google.com>
Subject: Re: [PATCH v3 0/2] rust: miscdevice: add additional data to MiscDeviceRegistration
From: Alice Ryhl <aliceryhl@google.com>
To: Christian Schrefl <chrisi.schrefl@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lee Jones <lee@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Danilo Krummrich <dakr@kernel.org>, 
	"Gerald =?utf-8?Q?Wisb=C3=B6ck?=" <gerald.wisboeck@feather.ink>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Sat, May 17, 2025 at 01:33:48PM +0200, Christian Schrefl wrote:
> Currently there is no good way to pass arbitrary data from the driver to
> a `miscdevice` or to share data between individual handles to a 
> `miscdevice` in rust.
> 
> This series adds additional (generic) data to the MiscDeviceRegistration
> for this purpose.
> 
> The first patch implements the changes and fixes the build of the sample
> without changing any functionality (this is currently the only in tree 
> user).
> 
> The second patch changes the `rust_misc_device` sample to use this to 
> share the same data between multiple handles to the `miscdevice`.
> I have tested the sample with qemu and the C userspace example
> from the doc comments.
> 
> This series its based on my `UnsafePinned` series [0] and the 
> pin-init-next branch.
> 
> Some discussion on Zulip about the motivation and approach [1].
> Thanks a lot to everyone helping me out with this.
> 
> Link: https://lore.kernel.org/rust-for-linux/20250430-rust_unsafe_pinned-v2-0-fc8617a74024@gmail.com/ [0]
> Link: https://rust-for-linux.zulipchat.com/#narrow/channel/288089-General/topic/Passing.20a.20DevRes.20to.20a.20miscdev/near/494553814 [1]
> 
> Signed-off-by: Christian Schrefl <chrisi.schrefl@gmail.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

Danilo's comment on the design of miscdevice is fair - it does not match
other types of drivers. But this series is an improvement over what is
here today.

Alice
