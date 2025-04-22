Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8A8E6F06B;
	Tue, 22 Apr 2025 04:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745297080; cv=none; b=SnBhZCVFLpG+29xBOXiOaxMc7UU4gvy9V7YmMU7brOO1SA1+vlSddKtzNzl5SSUDaFSdKxwrD4raGjY2pxhxQTJ4cxJnDWOcLJjBNTeoqoHgggUduuiT3b2Yfgfcj9E18IcEZmsotlt9AQgER6UI1E/jFyleN0075N5PeYI0QSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745297080; c=relaxed/simple;
	bh=G1HbJec2CYa7qlCoYB6f3Z1EWDQ/9s6GGaVBY0ycjkU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i0EO0aHVOLDkXoU4eOr+fBlTPq9rzeD3Hb0fXHsQrSF5/yyzvrSICDug4cvlS9h+jvQh+8qNvKhz21/is9K/TeZc2lqsAWJzX5S+097LBhtK2HmLdyTyZLg5UE93kkcdhFIyrOg1ireB/APBRPaXtnQ06uacgqTkTrrg00RCKY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y+hEPHXc; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y+hEPHXc"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6f0c30a1ca3so53819286d6.1;
        Mon, 21 Apr 2025 21:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745297078; x=1745901878; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kr+o+QYSOyR/ZVBsOETpPeX1MOvdWlbkKEIA2O8eIpI=;
        b=Y+hEPHXcTz+uHqjD6DvOTToqK1ardTIn9eR1nVqfqlBloc4TXp9NatdcVUUXz5QkTu
         odPlXWR02uFwJnph3Ea0KNLPcSDYAY3xsfkoBglgywm/j5ux4Jrvv+RMAUVqBEPBjoIA
         2AjTr0KtNZ/Mwf54FzVRV7WJXC3RfRJbEJRBRK31Jm6wQZ1zZBT1CQw02Ph4QjnPFF+e
         /PXe1x3KciMwefpDNaWIUPHjDOpQmJewkw9s87Tzm8eABL5NSjidd7wkDQXk0jKYjSpP
         OHjJr2bMRU0udI0qYlrqhecRGgmevjJIG+NGXFp/Yzzg4aTsLVWu1jEuuR+cAzow3MFY
         lWgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745297078; x=1745901878;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kr+o+QYSOyR/ZVBsOETpPeX1MOvdWlbkKEIA2O8eIpI=;
        b=aPkdyv7n2+ArvbEVAdWtDbyNGFBe+haNjLfGeX/rPiuP2BbVICMRyxdOtaRhwjOT0E
         tbGIMvLUF94WxuZAyhjNGBiz9ljkSejjCof8KGpsCcIpsTooCCy1EvzxlIiElzHdtxw2
         /uxD8V9OFfU2V8NWvx8SN30jJbrTQlvI9YrtPp2bwPqRtK8ofz8FrDCrMCzpTFhmkcoC
         iPxXKzBvgalEaiWoyArH8p1BfHwTC4vEvSDq0O7AWQRFfgqptoQp2iyionqxhf4X2KEu
         OOMlI3Vq58KQ7VQlg4dn0yeG1xF6NdNKgYrO/q5/vrF6tI4uPfeG3zyziVIEPDcRFOMH
         jlqA==
X-Forwarded-Encrypted: i=1; AJvYcCUJ1HFXUsGe4RHeS7wF+6iOy3SlDY/HQtj0xiCI33Cp1E1nOeQDn5bj5b/4msjLQavxBJfA0LRxopYGqDmwjbc=@vger.kernel.org, AJvYcCXeh3V3SiLMn+k84ziQCYFmkw1JZLg8UMc3rR8vvTOKvx77xOVIcyV+2FN2+IWO1wkclHgE1qriQyOlPpQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyHjROR5kRI6VHNCOQmkoQBV53QTPjSeYfGwTv2rca1P+MVpWqS
	jy3EXzmwJbmnViyvLboTUbH9+Wa8DjcXJWJoMrpgt+8PXOqkysK+
X-Gm-Gg: ASbGncun+aq/pxeoqBYaYmqg58pneFGkGi1opdGtLX016CLUI/e1SI/EbgfoXsVaX8a
	vS1QzOv+reMQyJYwgvMpE8TXcKgPJe5lrVKFpQ53/73CFY0z1RVe3t9hSm+Pucwgv2E4WtCiq3y
	TdyYPC2/j0S6m6ZFZ5xVgg72D9FxEFsT7eT8BsTsrPdrEjeKO51vEA5JclqtIAdXPfIKV/XampC
	kyxrKUntneaV3UH0dx4wjxPs/whsmgn4ecK4DrER7VkiMRW5vfB2wEbO24YtiUOUmfmxrx/9gmO
	/pnzmnDtvyBbQ0drchLvoZnSe1q7ePSPbj+1m8lKrEAp+W1wBEQF9u3MIMxa+VNUl2R3H7k55ju
	C+iIqEehZf0LvxYx+hxM8x0NMYPQu3WI=
X-Google-Smtp-Source: AGHT+IF9qY/lLx5IowQSskBGyrr3rjia+aw71anTJYS/Z88CO/wbFJyNLdZDn/Y0m0AQ0epo9ZuKZQ==
X-Received: by 2002:a05:6214:4004:b0:6e8:f3af:ed59 with SMTP id 6a1803df08f44-6f2c4578776mr192447286d6.22.1745297077610;
        Mon, 21 Apr 2025 21:44:37 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f2c2af14easm52864166d6.3.2025.04.21.21.44.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 21:44:37 -0700 (PDT)
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfauth.phl.internal (Postfix) with ESMTP id 8C6D21200043;
	Tue, 22 Apr 2025 00:44:36 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Tue, 22 Apr 2025 00:44:36 -0400
X-ME-Sender: <xms:tB4HaJcOnRJZdgz33RtWtXvUoRbkJthT-l6vy9ekpGqhOaphaERoKw>
    <xme:tB4HaHP8JLUKIhJx_5-55-CUJc9Cx0XaJ5cPj-03ECczP8bIxnniBfZOZnpSoQZvL
    ZhUHarPDH5lQCiZ1w>
X-ME-Received: <xmr:tB4HaCgn88Y3vxYoftfeQebtzlu8rPhrAM8WeeUlrR6lqlQq8ABYOJj0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgedvkedtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddt
    vdenucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrih
    hlrdgtohhmqeenucggtffrrghtthgvrhhnpeeuueeiffefffeivdelieeigfeiieehieei
    geejleevhfefgefggfdvveeuudevtdenucffohhmrghinhepghhithhhuhgsrdgtohhmpd
    hruhhsthdqlhgrnhhgrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghm
    pehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlih
    hthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepghhm
    rghilhdrtghomhesfhhigihmvgdrnhgrmhgvpdhnsggprhgtphhtthhopedugedpmhhoug
    gvpehsmhhtphhouhhtpdhrtghpthhtohepsggvnhhnohdrlhhoshhsihhnsehprhhothho
    nhdrmhgvpdhrtghpthhtohepohhjvggurgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoh
    eprghlvgigrdhgrgihnhhorhesghhmrghilhdrtghomhdprhgtphhtthhopehgrghrhies
    ghgrrhihghhuohdrnhgvthdprhgtphhtthhopegsjhhorhhnfegpghhhsehprhhothhonh
    hmrghilhdrtghomhdprhgtphhtthhopegrrdhhihhnuggsohhrgheskhgvrhhnvghlrdho
    rhhgpdhrtghpthhtoheprghlihgtvghrhihhlhesghhoohhglhgvrdgtohhmpdhrtghpth
    htohepthhmghhrohhsshesuhhmihgthhdrvgguuhdprhgtphhtthhopegurghkrheskhgv
    rhhnvghlrdhorhhg
X-ME-Proxy: <xmx:tB4HaC8IeTivlCDA9UbiqkX3TmMrmmqfDoUda55fB_YjZadS_HKghA>
    <xmx:tB4HaFt6elKxFaNo8rgb5HLyVfBfEQukpCZf1eLI_hcJVyuZlE91Qw>
    <xmx:tB4HaBF33l7C8-d1eCvVxCSCq2lkVfQKDAfqr__QlSgZLAydaHEEWQ>
    <xmx:tB4HaMOJ-zdEADbAMB-r7yF1uDYk-ltZEVbNdn8VhwLEx0b5Yu6kSA>
    <xmx:tB4HaOOmU_ZGH9qIrtR9E5fVlE6lgWAe12-JznndahhRcjQuxvvc3QEw>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 22 Apr 2025 00:44:35 -0400 (EDT)
Date: Mon, 21 Apr 2025 21:44:34 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Benno Lossin <benno.lossin@proton.me>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, Fiona Behrens <me@kloenk.dev>,
	Christian Schrefl <chrisi.schrefl@gmail.com>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/8] rust: pin-init: Add the `Wrapper` trait.
Message-ID: <aAcesqWolkxw4V8D@Mac.home>
References: <20250421221728.528089-1-benno.lossin@proton.me>
 <20250421221728.528089-3-benno.lossin@proton.me>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250421221728.528089-3-benno.lossin@proton.me>

On Mon, Apr 21, 2025 at 10:17:59PM +0000, Benno Lossin wrote:
> From: Christian Schrefl <chrisi.schrefl@gmail.com>
> 
> This trait allows creating `PinInitializers` for wrapper or new-type
> structs with the inner value structurally pinned, when given the
> initializer for the inner value.
> 
> Implement this trait for `UnsafeCell` and `MaybeUninit`.
> 
> Signed-off-by: Christian Schrefl <chrisi.schrefl@gmail.com>
> Link: https://github.com/Rust-for-Linux/pin-init/pull/37/commits/3ab4db083bd7b41a1bc23d937224f975d7400e50
> [ Reworded commit message into imperative mode, fixed typo and fixed
>   commit authorship. - Benno ]
> Signed-off-by: Benno Lossin <benno.lossin@proton.me>
> ---
>  rust/pin-init/src/lib.rs | 44 ++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 44 insertions(+)
> 
> diff --git a/rust/pin-init/src/lib.rs b/rust/pin-init/src/lib.rs
> index a880c21d3f09..467ccc8bd616 100644
> --- a/rust/pin-init/src/lib.rs
> +++ b/rust/pin-init/src/lib.rs
> @@ -1513,3 +1513,47 @@ unsafe impl<$first: Zeroable, $($t: Zeroable),*> Zeroable for ($first, $($t),*)
>  }
>  
>  impl_tuple_zeroable!(A, B, C, D, E, F, G, H, I, J);
> +
> +/// This trait allows creating an instance of `Self` which contains exactly one
> +/// [structurally pinned value](https://doc.rust-lang.org/std/pin/index.html#projections-and-structural-pinning).
> +///
> +/// This is useful when using wrapper `struct`s like [`UnsafeCell`] or with new-type `struct`s.
> +///
> +/// # Examples
> +///
> +/// ```
> +/// # use core::cell::UnsafeCell;
> +/// # use pin_init::{pin_data, pin_init, Wrapper};
> +///
> +/// #[pin_data]
> +/// struct Foo {}
> +///
> +/// #[pin_data]
> +/// struct Bar {
> +///     #[pin]
> +///     content: UnsafeCell<Foo>
> +/// };
> +///
> +/// let foo_initializer = pin_init!(Foo{});
> +/// let initializer = pin_init!(Bar {
> +///     content <- UnsafeCell::pin_init(foo_initializer)
> +/// });
> +/// ```
> +pub trait Wrapper<T> {
> +    /// Create an pin-initializer for a [`Self`] containing `T` form the `value_init` initializer.

s/Create/Creates ?

and 

s/form/from ?

Regards,
Boqun

> +    fn pin_init<E>(value_init: impl PinInit<T, E>) -> impl PinInit<Self, E>;
> +}
> +
> +impl<T> Wrapper<T> for UnsafeCell<T> {
> +    fn pin_init<E>(value_init: impl PinInit<T, E>) -> impl PinInit<Self, E> {
> +        // SAFETY: `UnsafeCell<T>` has a compatible layout to `T`.
> +        unsafe { cast_pin_init(value_init) }
> +    }
> +}
> +
> +impl<T> Wrapper<T> for MaybeUninit<T> {
> +    fn pin_init<E>(value_init: impl PinInit<T, E>) -> impl PinInit<Self, E> {
> +        // SAFETY: `MaybeUninit<T>` has a compatible layout to `T`.
> +        unsafe { cast_pin_init(value_init) }
> +    }
> +}
> -- 
> 2.48.1
> 
> 
