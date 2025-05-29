Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29AE9360;
	Thu, 29 May 2025 19:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748545421; cv=none; b=MokYy+lfS/YiAx3zi+CgUfNFyadJztwOgS5kSwiSmd5tuB0F9YYOrZhCzh0AsPeof5FcQQHEh5t4NtX4qBu3neckkB02w1jlUDKlvsL2qBIU4QJZu+16vTq7e8dgwN+FvokHrbvdQ+wWA51mZkYRqMECUEoPlkVftXBLjDKgq0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748545421; c=relaxed/simple;
	bh=1CIFKM/AZWzA85TLZtuVxwPd9mdEJO23qr0h57oIEoo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fhs/dPLxRy0Tf0YY1QyrNlLpDJahzp77v3c7r3g1SG0KMdrzMFOAv1Cu7qJ+0Z1NoUDARl2TB2u1Z/7iX6JBGEetBj69mjCLWN0W0lJGJl+AGfEFJKzY/y0UbDo4W39Z1EqYSl8j/75UV73vMAgY6Vw8LGJx25cX1P68SQbqHJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X+WVT8kk; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X+WVT8kk"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-4a4312b4849so16009351cf.1;
        Thu, 29 May 2025 12:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748545419; x=1749150219; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5d+5OpRIyDj/IQhHEmxnLgJF1dWpjj59MDMEF/sbGB0=;
        b=X+WVT8kkbF6Q2nFAv71T+RLPfzCzYaMeIgj1aRJiSpn+dIfFA/JurA7eWU1YtlCYZ2
         7KzNkm2AA+W0vSOqrml1wKAmDjNCe5EHshFohdiMKEV09yAhc9uO4mlqLo/xLgOQxITs
         Brct3CqhLkhVCZJmZYPQweju6oYXMbo8HkioBC7dUNmvlmbeoDzeTpiyvd+j4LyA85iR
         OjNtA9RW3oHD4fD8KGDgqr+9Iz7ZXa0zrTlm5ROIMnCGYzZ+8K8qsrGT++PZEdQaTcaJ
         29Kw/esGJUQsHEkA9qAGHTB6oJPJ0dlDUHJh1KSLbgKQVwgT/gYnDwG07Ta7zqOsiriY
         lAiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748545419; x=1749150219;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5d+5OpRIyDj/IQhHEmxnLgJF1dWpjj59MDMEF/sbGB0=;
        b=mhBMlNt7zlisOXC2GDgdOxn/RVkKv3xPeVdVDTP2lTcl17IrkCX504GbIwGpH2lapG
         FP/cIttJhER86nTvwolJA6B32P5PdrB7GxUGojUgfdG4FcrMXiS5vVwQRfGsoXMzXW8T
         d5lpa4vy6TEmvabrQ7xtRfB33QwaYt1MnVlusEzsRL5Zdr31/X/ZV4SCgkpgYZN+Pdid
         jng9P5sZHVxRBkg5OKtAXPjHqFS0YQ/rJUfr89vSAwkKf+u9niOKidY4mG70ks01dKc/
         34xKqJlkPYarZ4+WzqrQI+N5SP1qa3EQW8C2RO3CG/QV2A163uE//nOIvyOKRqJvxKWN
         8xeQ==
X-Forwarded-Encrypted: i=1; AJvYcCVDD0tWEstAj9Qq7Wgg99wnGs//epLhBdxLfms+neGvDVJXiP/KiAV6hNwJHbfUW2NbuHLPqcW4+ViziKY=@vger.kernel.org, AJvYcCXEGHaZHJPfl/JtAJE2luDKRHV2bAr+RgxLrZKHCNorHQPzV7PC5Sr967SZ4oLASPNxZ9LUEtdfNtZ7a+tbqcU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJKcKPHc/ZBmF+F5zbZAStb16ZrUBrqff6le9vx0BNy8OiPNiL
	+0aEZThwjOpw+WoJ113BlS7ZTgkwh7K2Icu9LzhNzOVE88YLm7M5efH8
X-Gm-Gg: ASbGnctfUwxk2mJ9ON4KF+wWjzJRI9SMGXqOqx/o1qN74pxs9idy6vzIaxwW10yvyW4
	70eViGR3vmIcyPaaGnyTOwxcc9QymIqITZUbOw6oz0ARMAE5poxWtGJwlxVzCALGUCeSSgni6Tg
	dMuR+v5GCuhI5RlgtHjMghAT0TnEV7/3Jb7vhsC2CulTAywU4wwV1OofqnBYeWzCgRf1NFyViCk
	00hw8pq2xE8YVOS1B+guLfpCQYKWqtsV1wjSDQeDp+Xoh94U6HsJg+mxPJbic7ynWzw3vFkM2If
	sOrNGScbEnWSZTj6tQKrZyo5gkzLV/CVylqdQYBqhD3ZcL5u5YnxKiq5oJVotfR2uA6ttPywB+e
	a0xvoQPQ8XVfvtMsLrVP0pmBCBQYn1q1dtnzyVmM5Lg==
X-Google-Smtp-Source: AGHT+IGophCTPU/p6vpKJaSJjDxj8R5T+nbEor40eZoeZ7Tz4u+L2w2PTFjdMtGEefV4Pvd85QVtIA==
X-Received: by 2002:a05:622a:1b11:b0:476:8288:9558 with SMTP id d75a77b69052e-4a4400eedb6mr13410251cf.46.1748545418868;
        Thu, 29 May 2025 12:03:38 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a4358b4ff4sm11077741cf.26.2025.05.29.12.03.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 12:03:38 -0700 (PDT)
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfauth.phl.internal (Postfix) with ESMTP id 8F8D61200066;
	Thu, 29 May 2025 15:03:37 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Thu, 29 May 2025 15:03:37 -0400
X-ME-Sender: <xms:ia84aIeHRsziO4XIioqxFHhjZT0n0Cct5veGugTTR1hoKF5jN4GhFA>
    <xme:ia84aKMaNaJmpWP4tst8qDaGGdR71yn7EE-W_UpGcneL1Sv6J5ecGvFQgygDSbxfo
    BctN_hJfne6TQqBwg>
X-ME-Received: <xmr:ia84aJghL6Y1ey1AqVHIzCe8HUCBd7o3DF3QmmLwZ9H5Z5GUjcjV49wToowSnZdkhkI5OTjEl-mC>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddvieelvdculddtuddrgeefvddrtd
    dtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggft
    fghnshhusghstghrihgsvgdpuffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftd
    dtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhf
    gggtuggjsehttdertddttddvnecuhfhrohhmpeeuohhquhhnucfhvghnghcuoegsohhquh
    hnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrthhtvghrnhepffdtiefhieeg
    tddvueeuffeiteevtdegjeeuhffhgfdugfefgefgfedtieeghedvnecuffhomhgrihhnpe
    hgihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgr
    ihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqd
    eiledvgeehtdeigedqudejjeekheehhedvqdgsohhquhhnrdhfvghngheppehgmhgrihhl
    rdgtohhmsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohepudegpdhmohguvgepsh
    hmthhpohhuthdprhgtphhtthhopehlohhsshhinheskhgvrhhnvghlrdhorhhgpdhrtghp
    thhtohepohhjvggurgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghlvgigrdhgrg
    ihnhhorhesghhmrghilhdrtghomhdprhgtphhtthhopehgrghrhiesghgrrhihghhuohdr
    nhgvthdprhgtphhtthhopegsjhhorhhnfegpghhhsehprhhothhonhhmrghilhdrtghomh
    dprhgtphhtthhopegrrdhhihhnuggsohhrgheskhgvrhhnvghlrdhorhhgpdhrtghpthht
    oheprghlihgtvghrhihhlhesghhoohhglhgvrdgtohhmpdhrtghpthhtohepthhmghhroh
    hsshesuhhmihgthhdrvgguuhdprhgtphhtthhopegurghkrheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:ia84aN9JQyeFV5rFjrtFPu-JpNviFSpuwLHY_caWdONwIKWSpWUgfw>
    <xmx:ia84aEuS3OPq4WTm0k53f3rVGdzggiSyQgyuz99lks0hXPl2lxAVoA>
    <xmx:ia84aEFIZJjq3E1Woq5sr85zmGTiYd0SzrYr5sXIW2shzOIefK550w>
    <xmx:ia84aDO7JmjDkIqXssymfV3SmfM-Uxo_CxWR9R5NikiAaVftAsP8xA>
    <xmx:ia84aJNTYvpoV_Aq_j5MhjgVuj2AAqbK425awv6syvpHRwORUMZY0q1L>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 29 May 2025 15:03:36 -0400 (EDT)
Date: Thu, 29 May 2025 12:03:36 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Benno Lossin <lossin@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, Fiona Behrens <me@kloenk.dev>,
	Christian Schrefl <chrisi.schrefl@gmail.com>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] rust: pin-init: improve safety documentation for
 `impl<T> [Pin]Init<T> for T`
Message-ID: <aDiviL-n1FtNCtRT@winterfell.localdomain>
References: <20250529081027.297648-1-lossin@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250529081027.297648-1-lossin@kernel.org>

On Thu, May 29, 2025 at 10:10:23AM +0200, Benno Lossin wrote:
> The inner SAFETY comments were missing since commit 5cfe7bef6751 ("rust:
> enable `clippy::undocumented_unsafe_blocks` lint").
> 
> Also rework the implementation of `__pinned_init` to better justify the
> SAFETY comment.
> 
> Link: https://github.com/Rust-for-Linux/pin-init/pull/62/commits/df925b2e27d499b7144df7e62b01acb00d4b94b8
> Signed-off-by: Benno Lossin <lossin@kernel.org>

Reviewed-by: Boqun Feng <boqun.feng@gmail.com>

Regards,
Boqun

> ---
>  rust/pin-init/src/lib.rs | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/rust/pin-init/src/lib.rs b/rust/pin-init/src/lib.rs
> index 9ab34036e6bc..d1c3ca5cfff4 100644
> --- a/rust/pin-init/src/lib.rs
> +++ b/rust/pin-init/src/lib.rs
> @@ -1390,20 +1390,22 @@ pub fn pin_init_array_from_fn<I, const N: usize, T, E>(
>      unsafe { pin_init_from_closure(init) }
>  }
>  
> -// SAFETY: Every type can be initialized by-value.
> +// SAFETY: the `__init` function always returns `Ok(())` and initializes every field of `slot`.
>  unsafe impl<T, E> Init<T, E> for T {
>      unsafe fn __init(self, slot: *mut T) -> Result<(), E> {
> -        // SAFETY: TODO.
> +        // SAFETY: `slot` is valid for writes by the safety requirements of this function.
>          unsafe { slot.write(self) };
>          Ok(())
>      }
>  }
>  
> -// SAFETY: Every type can be initialized by-value. `__pinned_init` calls `__init`.
> +// SAFETY: the `__pinned_init` function always returns `Ok(())` and initializes every field of
> +// `slot`. Additionally, all pinning invariants of `T` are upheld.
>  unsafe impl<T, E> PinInit<T, E> for T {
>      unsafe fn __pinned_init(self, slot: *mut T) -> Result<(), E> {
> -        // SAFETY: TODO.
> -        unsafe { self.__init(slot) }
> +        // SAFETY: `slot` is valid for writes by the safety requirements of this function.
> +        unsafe { slot.write(self) };
> +        Ok(())
>      }
>  }
>  
> 
> base-commit: 1ce98bb2bb30713ec4374ef11ead0d7d3e856766
> -- 
> 2.49.0
> 
