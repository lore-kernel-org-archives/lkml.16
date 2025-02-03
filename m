Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DF432080FD;
	Mon,  3 Feb 2025 15:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738595047; cv=none; b=F/E6P3k//h5YnKFfGpvaXR/KqR/5iSbFujugCQjdBNZKQIIdYjuuSrHUY304Y7VvGW+KwpHfgOgc11eDgRyXRgo1o8mVYHQCCUXRQOu2Gu5XA5wZcfONzynSgokxcGWW7sne1C8+ShaflRIKOWzWeqJHSlO4h5mOESc9Uqb0pTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738595047; c=relaxed/simple;
	bh=I0hGYVr+iXwhCvfG2kaXgx9DaPhR3rGJTXJPlr0Jpwo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IRoVqyXExbM3PcQhjaaRQ+SsYO1I+82JwLEUE+cLENBYPA7uhr7PuB6M2EuRygbJt5TVhx3S26oQV+vmPJ0qTiGFVoTG4aqpzOkCeZg70+MUqq0Xx6MnJKWbUvcMmTakVwnn2904uDNbMfDywtNtxDJv2loeMh6nJcLFYW13YZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bp0VNtBk; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bp0VNtBk"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7b6f95d2eafso466018385a.3;
        Mon, 03 Feb 2025 07:04:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738595044; x=1739199844; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mfs45TBGa9cOMjq+1YHkVGnJDn3Ark/UOv4RQa6undA=;
        b=Bp0VNtBkS4gDeTBSQmg3l5k8u7lNots74W47be/0uSB6qcvfho4kRK1W3L3z4LmQif
         Z79ZB//H11EqOmLJOil9W62/pzaI0L3CMVwMIxVtfpvgDX+cTxxWkvu/A+UCRRMr6A51
         hCdKXUBk25VSmWFQk03jR3ryiqK7/UpF0S8hnv03CMEHhJTJ6pL6zriBHvqY37h5MtEo
         GUZ/czUdXJmUTnIhUOPNG/zaTMQARjZapXFmW0L/nAyBYCilnw+nTB9eTjVOO+rVKVVy
         ie2KtdYhIe0JDCtUI2nuQoG/m7nFO0M3KiKNIAlgWy7v+JMpJKHJ+hoJOt+F8KkGNqq7
         cKKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738595044; x=1739199844;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mfs45TBGa9cOMjq+1YHkVGnJDn3Ark/UOv4RQa6undA=;
        b=HyRH5b+9rk1SPJeKzcWqa3YocVxWlROy+c0KZOhtLyt/iG5dcnY6kjtTU/gLMknB2r
         yOPkPJvyunBaF09ubddth3O+WQO+e8QTWBFCM6VpnkNQsjINNVQXLeuJDG5i2fSgOXpj
         WTj3CAMz75t+PtmK+tPTch+Rl3qopju3sCiYuMPZceKKbgG5sjjUmUGT1z+kDpMgl4H0
         nNWDmhEAVN9Z+t7wCYG00a4/Q+W7bF+VnTPdhu66ebrXNdPHJEre9lNiabnCu8LSDyuA
         ReV/V/CS74YVqgrRG/EmCUJc5aVP/S8YNZB0aaP89Fnev10Z2KUm3Wc3028RGDrFWZoV
         lp8w==
X-Forwarded-Encrypted: i=1; AJvYcCWH/YVXMZ+JxQMcUVJNGn8NISEOuH9RiGE0L8RtzHwx6WsL7daq1VDTdNFtCbCOT1XLZwcR1Qd+M28oTf4=@vger.kernel.org, AJvYcCWgKWhQ5C7hHaQ/QabX22C1lnU0jSyLJtHVWZn4BOUzF/A7DS4e2sn/27bGjLpBVSsKGSK4jY0olgKnCTaDJgM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxOJoUpT6ZrmM4fmv85kXfhhWjW+N1+wwQ4bk11PJg8C9wmlv6a
	HlKKQy/rkWU/cqlMXg3teV/QASuXBA9d1SKQiyRFH5tDv3bKHNle
X-Gm-Gg: ASbGncsr/5Kc0jw5wZv86q7feHjUtQoapr3tEoQSa3GwUaTBx2qS+OWSEf3z6SuRjec
	EuTgTcPNVEXjHn77HFsh8oWTNy8x7E2RU8JSSrR3/zdOE34m3NnXcITkOjZH4R1Aw7LNAypgkLO
	vQTJllSQhb/de+1XQQ2aC+k9D3dcAjy+uhHMlUvdcDYtb3Yypv7oALub62cp0wqkjBIod4z6ltF
	kwdmY83nlutBviLSd8S6H+LA2U/LW0F9bMgbt8CcEwZmUjrSo28H9eLX9hc3lain6LMbJ1b875t
	invE/c1zqfC/iVs30avtTf5lvVJ+6n3iqlmTiRZ5nKxXeYqII5jfEbBRbCnbWOoB5NP00bUx9bt
	eiSPULg==
X-Google-Smtp-Source: AGHT+IEcSkEvwfTpeA1pv4/nxSgMr4TNNL/PIqYjwCQvL7oYKhCCodXASw4imJoTjH5+ZyEo67Tebw==
X-Received: by 2002:a05:620a:4486:b0:7b6:d241:d4ae with SMTP id af79cd13be357-7bffcda58e5mr3118721285a.42.1738595044348;
        Mon, 03 Feb 2025 07:04:04 -0800 (PST)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c00a8bba3csm537156985a.3.2025.02.03.07.04.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 07:04:03 -0800 (PST)
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id 347401200068;
	Mon,  3 Feb 2025 10:04:03 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Mon, 03 Feb 2025 10:04:03 -0500
X-ME-Sender: <xms:4tqgZw27RDo2DWSwkX8QQvipsS3jSSOO1nu_VR6kY02nNDGS1ixaNA>
    <xme:4tqgZ7FuQ41RqdFUlEdoPcjew5tC543mpJ_pOjIRdcdeRotGiJE0DqIa7cDs1gSJk
    5KF8_PiLzu4LAq2cA>
X-ME-Received: <xmr:4tqgZ45_tTvMXR1mis-JOzslWC_koh8jA2iIJYwrWjCBV8SBeN0LH06xFA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddujeelvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddv
    necuhfhrohhmpeeuohhquhhnucfhvghnghcuoegsohhquhhnrdhfvghnghesghhmrghilh
    drtghomheqnecuggftrfgrthhtvghrnhephedugfduffffteeutddvheeuveelvdfhleel
    ieevtdeguefhgeeuveeiudffiedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghl
    ihhthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepgh
    hmrghilhdrtghomhesfhhigihmvgdrnhgrmhgvpdhnsggprhgtphhtthhopedvfedpmhho
    uggvpehsmhhtphhouhhtpdhrtghpthhtoheplhhinhgrsegrshgrhhhilhhinhgrrdhnvg
    htpdhrtghpthhtohepohhjvggurgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghl
    vgigrdhgrgihnhhorhesghhmrghilhdrtghomhdprhgtphhtthhopehgrghrhiesghgrrh
    ihghhuohdrnhgvthdprhgtphhtthhopegsjhhorhhnfegpghhhsehprhhothhonhhmrghi
    lhdrtghomhdprhgtphhtthhopegsvghnnhhordhlohhsshhinhesphhrohhtohhnrdhmvg
    dprhgtphhtthhopegrrdhhihhnuggsohhrgheskhgvrhhnvghlrdhorhhgpdhrtghpthht
    oheprghlihgtvghrhihhlhesghhoohhglhgvrdgtohhmpdhrtghpthhtohepthhmghhroh
    hsshesuhhmihgthhdrvgguuh
X-ME-Proxy: <xmx:49qgZ51PrHy9Iz19D4BiOKGbl3PHy-_rPSVfFMTwTCB-ly4nd1TceA>
    <xmx:49qgZzG45Kvf0Jm23diF2rjaraoGHQEAob2V6acNif13MrHxIWU8Ow>
    <xmx:49qgZy8P8Xla66m6Gy-Nr0d-V45U0zx9T2jl-pVBzucvl1Qxb7wdnw>
    <xmx:49qgZ4lCObMElZPJmnfP6dQ0bCT6EMyF-PRZ6JcyaI8CkT6uAyf-Wg>
    <xmx:49qgZzE3Je794DxDTsNjZ7QPG62SFAyZD7ePuOfIVwajry1U_aSHXOvP>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 3 Feb 2025 10:04:02 -0500 (EST)
Date: Mon, 3 Feb 2025 07:04:01 -0800
From: Boqun Feng <boqun.feng@gmail.com>
To: Asahi Lina <lina@asahilina.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Jann Horn <jannh@google.com>, Matthew Wilcox <willy@infradead.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Valentin Obst <kernel@valentinobst.de>,
	Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
	airlied@redhat.com, Abdiel Janulgue <abdiel.janulgue@gmail.com>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev
Subject: Re: [PATCH 4/6] rust: addr: Add a module to declare core address
 types
Message-ID: <Z6Da4XV5hcTfBiNH@tardis.local>
References: <20250202-rust-page-v1-0-e3170d7fe55e@asahilina.net>
 <20250202-rust-page-v1-4-e3170d7fe55e@asahilina.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250202-rust-page-v1-4-e3170d7fe55e@asahilina.net>

On Sun, Feb 02, 2025 at 10:05:46PM +0900, Asahi Lina wrote:
> Encapsulates the core physical/DMA address types, so they can be used by
> Rust abstractions.
> 
> Signed-off-by: Asahi Lina <lina@asahilina.net>
> ---
>  rust/kernel/addr.rs | 15 +++++++++++++++
>  rust/kernel/lib.rs  |  1 +
>  2 files changed, 16 insertions(+)
> 
> diff --git a/rust/kernel/addr.rs b/rust/kernel/addr.rs
> new file mode 100644
> index 0000000000000000000000000000000000000000..06aff10a0332355597060c5518d7fd6e114cf630
> --- /dev/null
> +++ b/rust/kernel/addr.rs
> @@ -0,0 +1,15 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Kernel core address types.
> +
> +use bindings;
> +use core::ffi;

I think we should use crate::ffi here. See:

	d072acda4862 "rust: use custom FFI integer types"

> +
> +/// A physical memory address (which may be wider than the CPU pointer size)
> +pub type PhysicalAddr = bindings::phys_addr_t;
> +/// A DMA memory address (which may be narrower than `PhysicalAddr` on some systems)
> +pub type DmaAddr = bindings::dma_addr_t;
> +/// A physical resource size, typically the same width as `PhysicalAddr`
> +pub type ResourceSize = bindings::resource_size_t;
> +/// A raw page frame number, not to be confused with the C `pfn_t` which also encodes flags.
> +pub type Pfn = ffi::c_ulong;
> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> index e1065a7551a39e68d6379031d80d4be336e652a3..eb1a80ba8ff83ab2d1b3b1d11fed4fb704c7a4f5 100644
> --- a/rust/kernel/lib.rs
> +++ b/rust/kernel/lib.rs
> @@ -29,6 +29,7 @@
>  
>  pub use ffi;
>  
> +pub mod addr;

I want to share my worry on this `pub mod` list in kernel/lib.rs may get
too long ;-)

I was about to suggest putting `addr` and `page` into `mm` after Alice's
patchset merged, however, seems that `mm` mod only cover userspace
memory management (which is not my impression of what "mm" in kernel
development), thoughts? Alice, do you think we should extend `mm` mod to
contain all memory management mods?

Regards,
Boqun

>  pub mod alloc;
>  #[cfg(CONFIG_BLOCK)]
>  pub mod block;
> 
> -- 
> 2.47.1
> 
