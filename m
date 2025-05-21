Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 453FB2620FA;
	Wed, 21 May 2025 12:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747831410; cv=none; b=ES8r3p7Ka0Z84VIWXCk3jBecVIT+cCrpuJWbHfbTpORHiiizyX7yuAPlyA4WSD1mfy+kkuQfdFex1EYq7GyyTqgEr5/zsAZkKidS2cjhvq7qC87mvY+qpmA7+4AwITzXV/BJnQCfGlk04LCnchmobk8CUSKcUXuLJc6DvlpFOpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747831410; c=relaxed/simple;
	bh=YMoJAErzM5EZpwxgq0GrpjlYUWjIwa/Xx0qvGcd/9IA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fbdO7s2KScjUKMg12HcbuGiuWJjTNB0rnBlrcE5b4CQn+SlImpSShMQHlLTofCiHs24iNmULx3LYlDaQPJyUl1maPwUsqVVO8lTdeblG4D9dAlXLB+wIL4y4qE2SHlNFFekbJ3hiCsHCMazUBUtWlf6bQjTG2owzpWG0GYGMiUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wdmg1DXo; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wdmg1DXo"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-4767e969b94so120587301cf.2;
        Wed, 21 May 2025 05:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747831408; x=1748436208; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hgjwFdM2k5sCslQZdWwlZbIspHEoXzqe2FcVDJivI+o=;
        b=Wdmg1DXoibSNJuM4v0H/7yd4l73HmoypbOzxK02lt9bIQEbxpESSe23NmSSAbBPQLX
         +PGjgYS7KHY6GjYnfbrI5BxvQNQ5PrHeoMHJnU2KRu9leLFxL/YuiIivgmK7D0cZ1z/O
         eAg1t0Kb2kYrGSriKjbT04tJkuVwIeTEj+cIHPO+Ni/gmhf8VO9rQpYraBfIehIx/hS4
         G2j1RRZSoXFRmXXGlHWghFhVrffGre1e87uVK/5WGbNRs8+/7yLB4YfZen2N5YGd4VDR
         +diJK8aeBmMI/0QshTrS1H2OVO9RTX9jnQlZPymea4Yp0DCRrjfImVHdpPPu2CuRpmiX
         RlGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747831408; x=1748436208;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hgjwFdM2k5sCslQZdWwlZbIspHEoXzqe2FcVDJivI+o=;
        b=r5jmFCY0+RCvn8ovznjjSOkL6hLT7KfUHIZwpT9N8Rq0QeeuwnN0tII9B9r8mSurwL
         7apCToC1ZvQnXGdkPl5l2yyop9sgv/68uHW6s+Uql8RAU11zBy/12tHSfm38TzucIjgU
         BRwIChreBPC7ABJslyCEvSgIbqnCVRcMsjo8bQ0Rfv6ECKibaV7mQuSentisPaex+DXR
         T9IVa8o8wAOcjX+Af0hUtK3hCgGXP4R3hhL6Qb9CtEWtXYnapInSyAfgjZTHnUcEemON
         cXY/qnVVNjXoiyZu9bQd5G0t2hUgMAengcPJTq0Bpb3KTAL9QY993amBqXFXbXMK2LeE
         1W1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUP7XEwSAGqu3RwZmIGP8+bRCm5UOxuA1sifjifgNr0cnKS6l4uMO4OUNFPhDI2MF5HvOBH3QkHDd/Pnt4A+xQ=@vger.kernel.org, AJvYcCXuoIz9y2RFfHy4G0Kmgwc54CdQ/+kkRTXH7JzDES37whpaNrAdkSBRvyXC/UWEX9cqPP6OJEFuVuev2Ko=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyrlnze6mBE7KAmUsc82F/npVkGdy0wwlFHXEWhhcrp/EPzz3kF
	2Hj8jY7vQE5WGk5zpYN9uUhaOQUg5lZUck/icO2Puy272zu7BS7B0OhS
X-Gm-Gg: ASbGncvk/78zB9Jz+KctaWqdPpw7mXSVBBcOgxChvJnEFpZbZr6o0cZhCqt5bumsgTg
	DMRymqaWQBHA/5Dx7GpOHNyCkfwRX4me/5tbNDn24FIZprakqPp8ZFrITlagtu4Y79tOJvwy/Tm
	H6eBEZLuUQHAvc4wFj8t3UEnOxEFBC96ZtM8eTGCfJTqi+U0xFYXfJqMkFEzOzQ2dDP9Hy0CPtZ
	G6YoOOGRp+vznV7PSkpOIbmgsTf3H4JfhFfNUJz0HCx9/PkZ0f1xI9JDu1MSUfrz2Rh+qXdLpQk
	2XG1wtKxPtW0cFsDAl+qO+FTWcfyaqU58GiKIx4AZv2vAw4iKi83sucs5b/HSTkeEj+J21vFgS5
	8M9hKzNRnpF5ZexTN35nU975p+WNrQT6exhIPMFGYGaYQuWchotpd
X-Google-Smtp-Source: AGHT+IErCuCfRGil1ejhob4xg9yF6HudkK+JCsZ+ou6hegKIPEwSjezrXHPPDMBGZDMU5QdCutpJMw==
X-Received: by 2002:a05:622a:5a92:b0:474:fee1:7915 with SMTP id d75a77b69052e-494b0804fccmr351306121cf.31.1747831408000;
        Wed, 21 May 2025 05:43:28 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-494b2de7adesm78612461cf.17.2025.05.21.05.43.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 05:43:27 -0700 (PDT)
Received: from phl-compute-09.internal (phl-compute-09.phl.internal [10.202.2.49])
	by mailfauth.phl.internal (Postfix) with ESMTP id C0F0E120007A;
	Wed, 21 May 2025 08:43:26 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-09.internal (MEProxy); Wed, 21 May 2025 08:43:26 -0400
X-ME-Sender: <xms:bsotaDmo6rPZ2tXj80tjivOzXA9zUk6xy3r7BaxKDzBH9Tl7SYB8Jw>
    <xme:bsotaG3yjjhGuEA2SFUFzXmthWJxpZLhxozreZrqF_Mh0IiDABi6OW1yzmMv1Uc1B
    1yS-xMRrtdJYAqDgQ>
X-ME-Received: <xmr:bsotaJp-h3wu69T1xoojOOr2UB59J6teF9TmX8dDoOrOvdDnOJQiPFLq>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdefudduucdltddurdegfedvrddttd
    dmucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgf
    nhhsuhgsshgtrhhisggvpdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttd
    enucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhgg
    tggujgesthdtredttddtvdenucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunh
    drfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtthgvrhhnpeehudfgudffffet
    uedtvdehueevledvhfelleeivedtgeeuhfegueevieduffeivdenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgr
    uhhthhhpvghrshhonhgrlhhithihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsoh
    hquhhnrdhfvghngheppehgmhgrihhlrdgtohhmsehfihigmhgvrdhnrghmvgdpnhgspghr
    tghpthhtohepvdehpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegrtghouhhrsg
    hothesnhhvihguihgrrdgtohhmpdhrtghpthhtohepohhjvggurgeskhgvrhhnvghlrdho
    rhhgpdhrtghpthhtoheprghlvgigrdhgrgihnhhorhesghhmrghilhdrtghomhdprhgtph
    htthhopehgrghrhiesghgrrhihghhuohdrnhgvthdprhgtphhtthhopegsjhhorhhnfegp
    ghhhsehprhhothhonhhmrghilhdrtghomhdprhgtphhtthhopegsvghnnhhordhlohhssh
    hinhesphhrohhtohhnrdhmvgdprhgtphhtthhopegrrdhhihhnuggsohhrgheskhgvrhhn
    vghlrdhorhhgpdhrtghpthhtoheprghlihgtvghrhihhlhesghhoohhglhgvrdgtohhmpd
    hrtghpthhtohepthhmghhrohhsshesuhhmihgthhdrvgguuh
X-ME-Proxy: <xmx:bsotaLmvSkg2Q06ODnYxXBUDGpip6DQk3VTw7K4qMb2reqkkcSWrVA>
    <xmx:bsotaB3MfIrt8FFge-AucHIiw6NaEDMgIfwaMG4fS9t1kft0C04zuA>
    <xmx:bsotaKuSJ-iPW_ldhIxNCQ2UxEf5EaZ56wZOLmaLS1G0rcJmTJ2YgA>
    <xmx:bsotaFWm4FiQy945-CSPTPkSXQlvyTnVjbb8iPWajXkBDIE068QB1g>
    <xmx:bsotaA39I8JQdG94Oyw-Ah8xDMPX_twLC3gAiGlTsg415qakz7IrijV3>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 21 May 2025 08:43:25 -0400 (EDT)
Date: Wed, 21 May 2025 05:43:24 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Timur Tabi <ttabi@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v4 01/20] rust: dma: expose the count and size of
 CoherentAllocation
Message-ID: <aC3KbKeEVlHggi5l@Mac.home>
References: <20250521-nova-frts-v4-0-05dfd4f39479@nvidia.com>
 <20250521-nova-frts-v4-1-05dfd4f39479@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250521-nova-frts-v4-1-05dfd4f39479@nvidia.com>

On Wed, May 21, 2025 at 03:44:56PM +0900, Alexandre Courbot wrote:
> These properties are very useful to have and should be accessible.
> 
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
>  rust/kernel/dma.rs | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/rust/kernel/dma.rs b/rust/kernel/dma.rs
> index 605e01e35715667f93297fd9ec49d8e7032e0910..2a60eefa47dfc1f836c30ee342e26c6ff3e9b13a 100644
> --- a/rust/kernel/dma.rs
> +++ b/rust/kernel/dma.rs
> @@ -129,6 +129,10 @@ pub mod attrs {
>  //
>  // Hence, find a way to revoke the device resources of a `CoherentAllocation`, but not the
>  // entire `CoherentAllocation` including the allocated memory itself.
> +//
> +// # Invariants
> +//
> +// The size in bytes of the allocation is equal to `size_of::<T> * count()`.
>  pub struct CoherentAllocation<T: AsBytes + FromBytes> {
>      dev: ARef<Device>,
>      dma_handle: bindings::dma_addr_t,
> @@ -201,6 +205,20 @@ pub fn alloc_coherent(
>          CoherentAllocation::alloc_attrs(dev, count, gfp_flags, Attrs(0))
>      }
>  
> +    /// Returns the number of elements `T` in this allocation.
> +    ///
> +    /// Note that this is not the size of the allocation in bytes, which is provided by
> +    /// [`Self::size`].
> +    pub fn count(&self) -> usize {
> +        self.count
> +    }
> +
> +    /// Returns the size in bytes of this allocation.
> +    pub fn size(&self) -> usize {
> +        // As per the invariants of `CoherentAllocation`.
> +        self.count * core::mem::size_of::<T>()

I think we need a comment or even an invariant saying this multiply
cannot overflow.

Regards,
Boqun

> +    }
> +
>      /// Returns the base address to the allocated region in the CPU's virtual address space.
>      pub fn start_ptr(&self) -> *const T {
>          self.cpu_addr
> 
> -- 
> 2.49.0
> 
