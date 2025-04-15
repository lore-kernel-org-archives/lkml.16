Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EDC22459DB;
	Tue, 15 Apr 2025 19:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744744552; cv=none; b=HHZ2UTTnq/i0EiFWVVVj9t63pIDmv3szsBl3kldmVXq8P6pr1/2jAtUNS4w16zB6d/LsU1k6+F/L8MRAlybMkepgIdFYzQHLeekY1d7p1qp+2RM3gA4pZo2LSlMSusIW4mTJ9TO0CN49vg5q+AbCWQaphCYoOyGbtnejXM89xAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744744552; c=relaxed/simple;
	bh=eKGcBCZiSyaXz8bCePdjpeSEK+/HAMbFNmEH2qJnTVM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ioQuJHAKzsz48TK7wwjgDR1eFEAfdX+9Fb4zzq80KtkX/mD6kccSI9Lb00kAMIMng+pL9NtiAS+XRWws1Vy1WQVWdmjIFm5BG0MNsCZYnVSKqGCWTFz/mFZ4pCcViERGwAKivw1/YZDg43rQG0ZnARvMJRdqRz2jAbzdKDB9r2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VSg1bQ21; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VSg1bQ21"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-30363975406so1027187a91.0;
        Tue, 15 Apr 2025 12:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744744549; x=1745349349; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qbJK2C5+AfFNDsgY9EAbhSa8Mq5Om76GpM7Ore7Vos4=;
        b=VSg1bQ21IgE2JaTBG+OKHLKdpKIMxenhoAM/elOBXCACEdf/9LP1erY7Au5oDO9fqA
         eBx9L1LEIZzfSyJaHna1FP0V7J2PALd1eiwAk1foiKA/rm+awDyZzKnn679hWMHauwJZ
         uiYGeBDiPA46M4p48ItJ22XyTfENW/fO3ORlKRgVC16uA2zG/SS66GttlN67gfwMMWVo
         CAGh/zlcSllF8aAQVqCWWPuI9AWNRtGmqiR78sAuiAlVqe+wKGGqs8TxwpsjOhW3lMNn
         ec4L0CmFzYwcky1RtKXyQuSPU6kUOvW+EoQsZv5jkYLhxylBPx45x+EmNBX/nzW7QkbU
         DKdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744744549; x=1745349349;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qbJK2C5+AfFNDsgY9EAbhSa8Mq5Om76GpM7Ore7Vos4=;
        b=InloddaJ/Y6h1zgZVCmlbftbUR0TIE7pNPOzAYCLNygyNul7BFalMGOciRrNdPdmmI
         ijMNMf+O69f0joiTHePs+IlJYXR6FDubv0mVLnnlzMLX83QSc1hYrnExEtU4SwN/0SnZ
         5CL/rHlxQCEsd8wKvMYwH2DnyRTc2l5dI4etSsqOVG3lgE6zxQH7kRON/LNdKTVVwWlO
         HqMVa+j9cnae0C6HEeVad2Wrae2MUnrsJcoumCWNbRcpiePWEJnItDY7jKkk4JrOVtbm
         iM4tGPoQqrHKaE/z1qHueBpZBBM1EwuOrDm/di0n9Osb3miRlK8NPwRDg8knj4JOQaUa
         Bk3g==
X-Forwarded-Encrypted: i=1; AJvYcCXVt02Hia/KXQAxE+zsOkmfRpS5PxnDkYLgHFUzgGjK4UscO8kM5jwEbzi/XXheJsNZakn9H+vOGqGw07M=@vger.kernel.org
X-Gm-Message-State: AOJu0YwD/tlyfwNQDTJCVRgkewq8+V7piJkZu2YL1silIrZAGJ6JSNbt
	0PRassLwUmfM0vASUZ+kaq4XSn8BSDW/gMJtAg1mUIaqVnuv5lQMkjFbAzsiLEX+e/VkzlBFaBX
	dEnbWb9Tuhq3umJbPROnf5VbQXnE=
X-Gm-Gg: ASbGncu7tFQIwyo8ifXxJXEY3zzVbfuS9A85w1CjgF7p/heytqQ9rkKahA2AUbA2WZS
	y484+UHQZGvCFZMkclzMZLyseAtPfUPtbbXV5QkYvC6x2IFMRJRsLtDJcHfUbmOLvbc+9ZuXkGU
	bO1BybhQstjn6HZFvnF4k2SA==
X-Google-Smtp-Source: AGHT+IFuwOJh9/oDtUc4GGzilO/1X0RdNfS9Hfj1k598+hCPzZMGqERhaQEGeKiTPXn5X9Fr47Ba2Bs3FFRRY0RVqcs=
X-Received: by 2002:a17:90b:4a0f:b0:2fe:b77a:2eba with SMTP id
 98e67ed59e1d1-3085ee961eemr198454a91.1.1744744549237; Tue, 15 Apr 2025
 12:15:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250412000507.157000-1-fujita.tomonori@gmail.com>
In-Reply-To: <20250412000507.157000-1-fujita.tomonori@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 15 Apr 2025 21:15:36 +0200
X-Gm-Features: ATxdqUF45hkp-TzsttWupntsmJdeGyiSdWuWLL_yI55mB-xIxxoR5i5ttB-lo4A
Message-ID: <CANiq72kKznot1wtHWknjeOBqbKyGvrBnDN5PRzxFh+bA4-qoJQ@mail.gmail.com>
Subject: Re: [PATCH v3] rust: helpers: Add dma_alloc_attrs() and dma_free_attrs()
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: rust-for-linux@vger.kernel.org, abdiel.janulgue@gmail.com, dakr@kernel.org, 
	daniel.almeida@collabora.com, robin.murphy@arm.com, a.hindborg@kernel.org, 
	ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me, 
	aliceryhl@google.com, tmgross@umich.edu, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 12, 2025 at 2:06=E2=80=AFAM FUJITA Tomonori
<fujita.tomonori@gmail.com> wrote:
>
> Add dma_alloc_attrs() and dma_free_attrs() helpers to fix a build
> error when CONFIG_HAS_DMA is not enabled.
>
> Note that when CONFIG_HAS_DMA is enabled, dma_alloc_attrs() and
> dma_free_attrs() are included in both bindings_generated.rs and
> bindings_helpers_generated.rs. The former takes precedence so behavior
> remains unchanged in that case.
>
> This fixes the following build error on UML:
>
> error[E0425]: cannot find function `dma_alloc_attrs` in crate `bindings`
>      --> rust/kernel/dma.rs:171:23
>       |
> 171   |               bindings::dma_alloc_attrs(
>       |                         ^^^^^^^^^^^^^^^ help: a function with a s=
imilar name exists: `dma_alloc_pages`
>       |
>      ::: /home/fujita/build/um/rust/bindings/bindings_generated.rs:44568:=
5
>       |
> 44568 | /     pub fn dma_alloc_pages(
> 44569 | |         dev: *mut device,
> 44570 | |         size: usize,
> 44571 | |         dma_handle: *mut dma_addr_t,
> 44572 | |         dir: dma_data_direction,
> 44573 | |         gfp: gfp_t,
> 44574 | |     ) -> *mut page;
>       | |___________________- similarly named function `dma_alloc_pages` =
defined here
>
> error[E0425]: cannot find function `dma_free_attrs` in crate `bindings`
>      --> rust/kernel/dma.rs:293:23
>       |
> 293   |               bindings::dma_free_attrs(
>       |                         ^^^^^^^^^^^^^^ help: a function with a si=
milar name exists: `dma_free_pages`
>       |
>      ::: /home/fujita/build/um/rust/bindings/bindings_generated.rs:44577:=
5
>       |
> 44577 | /     pub fn dma_free_pages(
> 44578 | |         dev: *mut device,
> 44579 | |         size: usize,
> 44580 | |         page: *mut page,
> 44581 | |         dma_handle: dma_addr_t,
> 44582 | |         dir: dma_data_direction,
> 44583 | |     );
>       | |______- similarly named function `dma_free_pages` defined here
>
> Fixes: ad2907b4e308 ("rust: add dma coherent allocator abstraction")
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>

Applied to `rust-fixes` -- thanks everyone!

    [ Reworded for relative paths. - Miguel ]

Cheers,
Miguel
