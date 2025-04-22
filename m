Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39B7963D;
	Tue, 22 Apr 2025 04:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745297659; cv=none; b=YB15MG3zBtUET088DC11AhGTJRBe48jcHTkjM0ZWNcHkMUmIWakPa283/m39MZjC9QLaKsfFxxbj21+d9ufLL/iBM6XdZkxYbmcQpZi8YlnP8l+bBsGGnCViS5dDDNjcFZkqCPn8vm9hZyy1VK1iQhD24OHOqdgS2aTifgLz1Vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745297659; c=relaxed/simple;
	bh=OiOe63zZPBMZjqhiLlyFj1X0gvTXBrbbcwBzZKjDjKU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q+JMYd14KZa0m30t/aa15zJtwqt7H3YpgZbfclDDZ9pg41R+XhqEEaBHKq4xZUwfgPiEUg5ha0R7zUNowlrM2kngzYoXlAhDTkidLCxdVlnKSPznK2XOS8ZrNNWy+qfotce4DADVvf8K7158Kt5TiP31ras21DTXegrGsFO1hv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R3ESszTb; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R3ESszTb"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6e8f43c1fa0so61206636d6.3;
        Mon, 21 Apr 2025 21:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745297656; x=1745902456; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KGENQjWPuyq6692BWp2yYX8JM06Bmz89ApO7LsOOn7I=;
        b=R3ESszTb7jg6JRC8kiifcwGcaU0FJi0Py0OEZDzqPqXhA/fHMNY+0GglUZsrrGoP9A
         GeaFUzZfDAMZ2JwMStg6Op3/5sAOqBJca7LYnJ8jLC0fhVrs+gdhDL2LMtJuWVBzkgIJ
         4IIt6sNlprX/VzEWtnjanWkKgCxyUiwB0NIts9N0gR77LRZs//GERIVzCUjBqdufs/13
         dZiUNJiS/vZY/P+l/Y+Wm/KctndgWTOe4ellWXtdd8vyrUljAeSF/zXWshKCHoiRsh+7
         bI0fm67ujWlt1yLPMNPFlKQsIgPOlE4ki05gqusH57ULoafOfaSuPaznCh//KBTJftt4
         3sWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745297656; x=1745902456;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KGENQjWPuyq6692BWp2yYX8JM06Bmz89ApO7LsOOn7I=;
        b=ObEDDLdmbBNlHBa9h0Yr3W505txxfEvi2+ji29sU/1F997rPK4z9uyaQpC4SbfX88F
         eI5MWqxLUCurZz3QUUTDgHOqoqE+ransedROg+XPsKfFcjFCX58EBsbaynAu0GGjBCQY
         zVGnELIyTno2BJwzx1fWxEVvuw/SL3jagdP6lWp4gwB6BUdfMMwtTJjfu9xzXgOjoZG7
         9pEJOOaAfk5NWRU/lAAtDD7LckCHusuyexeiLUC6SE/AZUAVTqAgb84J27apCil2LSx7
         1wzLAjYNj/axkE25NYhsLqVuceHz7TtdlinPelfE5Ej+oC0bBSNBCHriKYKEgYZvqaYM
         yRww==
X-Forwarded-Encrypted: i=1; AJvYcCVyuYB52iWeNl/LKNRauVOIiAyT73m49KZlQOpsQOzjyKW+NR9G1iOCWzbE/RSEWhUWI+vNze7AKkejT3o=@vger.kernel.org, AJvYcCWTBcyvZ3h8dX78Ja+anIOKPio5FpTZhtGUXmejdX9hSOll792ODEskRQ0asDhEjPdJG0TBHJrFc4xQUml1xkQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMP9O1NqT/IcFt5d92y+WUvNFHU3hsJ0aIUdIof+qqkfEQjLVP
	d5m/sokJgPmAeDV2PCMYmCJi1zIosdMKuWGJiPXsR8lJ4WnHZul+
X-Gm-Gg: ASbGncvP132JOY22aF/okFnIlFRzMHYJAVoP3LdP5vQP1b27wcyvlJE9G2pWGxH+wXh
	4rUDxy2Dbx6lr+tfKibr2539I8GSKBPVwkPFUd8s1vtVJxChaPYz5PcT6KyXB2jSB2jpUzM5tek
	u//kbZToEOdK8YcUKXC5P03r+TatYnIS6/7Mzt1ca4cIM1jVvHMyvn97iABZ7XTBkzdjspxgLOQ
	GMA/B8c+waDfZdyr1/HfJ1y42yvmRPhfBX+v13v/OWTuhO7ate588WBuQnLehGc7oTLr+uSE2yp
	VR7hBsWwBKGHUzxki81PUpYqBIsqz/akna7Pj/s0NqTy5xc8h6g3Kfy2yfWy72yAnhi7OR1I9AP
	MAEmJOwhyVTLLmfsDsj92CWrxunrqyrw=
X-Google-Smtp-Source: AGHT+IFxYH29fwW/ZdTUs00QXQYbWjvi8bS6UgHAq9WvRMU9S6wlexXGAIakAFHYM91W2HAnx5Vc6g==
X-Received: by 2002:ad4:5ba7:0:b0:6e8:98a1:3694 with SMTP id 6a1803df08f44-6f2c44eb12fmr294143656d6.8.1745297655814;
        Mon, 21 Apr 2025 21:54:15 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f2c2bfd5f1sm52886606d6.70.2025.04.21.21.54.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 21:54:15 -0700 (PDT)
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfauth.phl.internal (Postfix) with ESMTP id EF8881200068;
	Tue, 22 Apr 2025 00:54:14 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Tue, 22 Apr 2025 00:54:14 -0400
X-ME-Sender: <xms:9iAHaJM443m0YtaI5hyf2HjP6Vyg44vceUodD4grU7BEvUT0GKNokQ>
    <xme:9iAHaL9EDfRJBr-EHdjYvcelBnTtcsANHYqgXPdt9kdwU5J-mELP1vDMhFtoI9Cri
    1OifjiXKPHvIAsPfA>
X-ME-Received: <xmr:9iAHaIQ33s7vPYat6lRD_oWF2gm7-YQZ7ELaNnPk25KI-WBqU86Nvk2e>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgedvkedvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddt
    vdenucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrih
    hlrdgtohhmqeenucggtffrrghtthgvrhhnpefftdeihfeigedtvdeuueffieetvedtgeej
    uefhhffgudfgfeeggfeftdeigeehvdenucffohhmrghinhepghhithhhuhgsrdgtohhmne
    cuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghoqhhu
    nhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedtieegqdduje
    ejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfhhigihmvgdr
    nhgrmhgvpdhnsggprhgtphhtthhopeduiedpmhhouggvpehsmhhtphhouhhtpdhrtghpth
    htohepsggvnhhnohdrlhhoshhsihhnsehprhhothhonhdrmhgvpdhrtghpthhtohepohhj
    vggurgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghlvgigrdhgrgihnhhorhesgh
    hmrghilhdrtghomhdprhgtphhtthhopehgrghrhiesghgrrhihghhuohdrnhgvthdprhgt
    phhtthhopegsjhhorhhnfegpghhhsehprhhothhonhhmrghilhdrtghomhdprhgtphhtth
    hopegrrdhhihhnuggsohhrgheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghlihgt
    vghrhihhlhesghhoohhglhgvrdgtohhmpdhrtghpthhtohepthhmghhrohhsshesuhhmih
    gthhdrvgguuhdprhgtphhtthhopegurghkrheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:9iAHaFunEaWyjWDWVNqH-vo-Fs-ZMkQ9FuNcYGirfFhnk0BnMIHygA>
    <xmx:9iAHaBfIB5NC_9TZ3M9_bR_QXG0k3S9jBOmz4VHSlF504AUUbNCnoQ>
    <xmx:9iAHaB14L4Bqt4_NjkwvGROYX2lK2wP8TsynB4bRXtx0z4oyTRjAsA>
    <xmx:9iAHaN_DeY1Oq0fuKGkLUdbPvMu8OxTgJYUiy1xvhLU8EfjNpdcWYg>
    <xmx:9iAHaM-MF58czEajaCzdDEVS2Jz-8bBjeRV8oP_HEU42G5bWoD3UlGNQ>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 22 Apr 2025 00:54:14 -0400 (EDT)
Date: Mon, 21 Apr 2025 21:54:11 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Benno Lossin <benno.lossin@proton.me>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, Fiona Behrens <me@kloenk.dev>,
	Christian Schrefl <chrisi.schrefl@gmail.com>,
	Alban Kurti <kurti@invicto.ai>, Michael Vetter <jubalh@iodoru.org>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 8/8] rust: pin-init: add `MaybeZeroable` derive macro
Message-ID: <aAcg86QfvlA0zAh4@Mac.home>
References: <20250421221728.528089-1-benno.lossin@proton.me>
 <20250421221728.528089-9-benno.lossin@proton.me>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250421221728.528089-9-benno.lossin@proton.me>

On Mon, Apr 21, 2025 at 10:18:52PM +0000, Benno Lossin wrote:
> This derive macro implements `Zeroable` for structs & unions precisely
> if all fields also implement `Zeroable` and does nothing otherwise. The
> plain `Zeroable` derive macro instead errors when it cannot derive
> `Zeroable` safely. The `MaybeZeroable` derive macro is useful in cases
> where manual checking is infeasible such as with the bindings crate.
> 

Hmm... seems we need a customized auto trait? How hard would that be?

Regards,
Boqun

> Move the zeroable generics parsing into a standalone function in order
> to avoid code duplication between the two derive macros.
> 
> Link: https://github.com/Rust-for-Linux/pin-init/pull/42/commits/1165cdad1a391b923efaf30cf76bc61e38da022e
> Signed-off-by: Benno Lossin <benno.lossin@proton.me>
> ---
>  rust/pin-init/internal/src/lib.rs      |  5 +++
>  rust/pin-init/internal/src/zeroable.rs | 27 +++++++++++-
>  rust/pin-init/src/lib.rs               | 30 +++++++++++++
>  rust/pin-init/src/macros.rs            | 59 ++++++++++++++++++++++++++
>  4 files changed, 120 insertions(+), 1 deletion(-)
> 
> diff --git a/rust/pin-init/internal/src/lib.rs b/rust/pin-init/internal/src/lib.rs
> index 56aa9ecc1e1a..297b0129a5bf 100644
> --- a/rust/pin-init/internal/src/lib.rs
> +++ b/rust/pin-init/internal/src/lib.rs
> @@ -47,3 +47,8 @@ pub fn pinned_drop(args: TokenStream, input: TokenStream) -> TokenStream {
>  pub fn derive_zeroable(input: TokenStream) -> TokenStream {
>      zeroable::derive(input.into()).into()
>  }
> +
> +#[proc_macro_derive(MaybeZeroable)]
> +pub fn maybe_derive_zeroable(input: TokenStream) -> TokenStream {
> +    zeroable::maybe_derive(input.into()).into()
> +}
> diff --git a/rust/pin-init/internal/src/zeroable.rs b/rust/pin-init/internal/src/zeroable.rs
> index acc94008c152..e0ed3998445c 100644
> --- a/rust/pin-init/internal/src/zeroable.rs
> +++ b/rust/pin-init/internal/src/zeroable.rs
> @@ -6,7 +6,14 @@
>  use crate::helpers::{parse_generics, Generics};
>  use proc_macro::{TokenStream, TokenTree};
>  
> -pub(crate) fn derive(input: TokenStream) -> TokenStream {
> +pub(crate) fn parse_zeroable_derive_input(
> +    input: TokenStream,
> +) -> (
> +    Vec<TokenTree>,
> +    Vec<TokenTree>,
> +    Vec<TokenTree>,
> +    Option<TokenTree>,
> +) {
>      let (
>          Generics {
>              impl_generics,
> @@ -64,6 +71,11 @@ pub(crate) fn derive(input: TokenStream) -> TokenStream {
>      if in_generic && !inserted {
>          new_impl_generics.extend(quote! { : ::pin_init::Zeroable });
>      }
> +    (rest, new_impl_generics, ty_generics, last)
> +}
> +
> +pub(crate) fn derive(input: TokenStream) -> TokenStream {
> +    let (rest, new_impl_generics, ty_generics, last) = parse_zeroable_derive_input(input);
>      quote! {
>          ::pin_init::__derive_zeroable!(
>              parse_input:
> @@ -74,3 +86,16 @@ pub(crate) fn derive(input: TokenStream) -> TokenStream {
>          );
>      }
>  }
> +
> +pub(crate) fn maybe_derive(input: TokenStream) -> TokenStream {
> +    let (rest, new_impl_generics, ty_generics, last) = parse_zeroable_derive_input(input);
> +    quote! {
> +        ::pin_init::__maybe_derive_zeroable!(
> +            parse_input:
> +                @sig(#(#rest)*),
> +                @impl_generics(#(#new_impl_generics)*),
> +                @ty_generics(#(#ty_generics)*),
> +                @body(#last),
> +        );
> +    }
> +}
> diff --git a/rust/pin-init/src/lib.rs b/rust/pin-init/src/lib.rs
> index 774f8ca033bc..05a0cd6ad8f4 100644
> --- a/rust/pin-init/src/lib.rs
> +++ b/rust/pin-init/src/lib.rs
> @@ -413,6 +413,36 @@
>  /// ```
>  pub use ::pin_init_internal::Zeroable;
>  
> +/// Derives the [`Zeroable`] trait for the given struct if all fields implement [`Zeroable`].
> +///
> +/// Contrary to the derive macro named [`macro@Zeroable`], this one silently fails when a field
> +/// doesn't implement [`Zeroable`].
> +///
> +/// # Examples
> +///
> +/// ```
> +/// use pin_init::MaybeZeroable;
> +///
> +/// // implmements `Zeroable`
> +/// #[derive(MaybeZeroable)]
> +/// pub struct DriverData {
> +///     id: i64,
> +///     buf_ptr: *mut u8,
> +///     len: usize,
> +/// }
> +///
> +/// // does not implmement `Zeroable`
> +/// #[derive(MaybeZeroable)]
> +/// pub struct DriverData2 {
> +///     id: i64,
> +///     buf_ptr: *mut u8,
> +///     len: usize,
> +///     // this field doesn't implement `Zeroable`
> +///     other_data: &'static i32,
> +/// }
> +/// ```
> +pub use ::pin_init_internal::MaybeZeroable;
> +
>  /// Initialize and pin a type directly on the stack.
>  ///
>  /// # Examples
> diff --git a/rust/pin-init/src/macros.rs b/rust/pin-init/src/macros.rs
> index 332d7e08925b..935d77745d1d 100644
> --- a/rust/pin-init/src/macros.rs
> +++ b/rust/pin-init/src/macros.rs
> @@ -1443,3 +1443,62 @@ fn ensure_zeroable<$($impl_generics)*>()
>          };
>      };
>  }
> +
> +#[doc(hidden)]
> +#[macro_export]
> +macro_rules! __maybe_derive_zeroable {
> +    (parse_input:
> +        @sig(
> +            $(#[$($struct_attr:tt)*])*
> +            $vis:vis struct $name:ident
> +            $(where $($whr:tt)*)?
> +        ),
> +        @impl_generics($($impl_generics:tt)*),
> +        @ty_generics($($ty_generics:tt)*),
> +        @body({
> +            $(
> +                $(#[$($field_attr:tt)*])*
> +                $field_vis:vis $field:ident : $field_ty:ty
> +            ),* $(,)?
> +        }),
> +    ) => {
> +        // SAFETY: Every field type implements `Zeroable` and padding bytes may be zero.
> +        #[automatically_derived]
> +        unsafe impl<$($impl_generics)*> $crate::Zeroable for $name<$($ty_generics)*>
> +        where
> +            $(
> +                // the `for<'__dummy>` HRTB makes this not error without the `trivial_bounds`
> +                // feature <https://github.com/rust-lang/rust/issues/48214#issuecomment-2557829956>.
> +                $field_ty: for<'__dummy> $crate::Zeroable,
> +            )*
> +            $($($whr)*)?
> +        {}
> +    };
> +    (parse_input:
> +        @sig(
> +            $(#[$($struct_attr:tt)*])*
> +            $vis:vis union $name:ident
> +            $(where $($whr:tt)*)?
> +        ),
> +        @impl_generics($($impl_generics:tt)*),
> +        @ty_generics($($ty_generics:tt)*),
> +        @body({
> +            $(
> +                $(#[$($field_attr:tt)*])*
> +                $field_vis:vis $field:ident : $field_ty:ty
> +            ),* $(,)?
> +        }),
> +    ) => {
> +        // SAFETY: Every field type implements `Zeroable` and padding bytes may be zero.
> +        #[automatically_derived]
> +        unsafe impl<$($impl_generics)*> $crate::Zeroable for $name<$($ty_generics)*>
> +        where
> +            $(
> +                // the `for<'__dummy>` HRTB makes this not error without the `trivial_bounds`
> +                // feature <https://github.com/rust-lang/rust/issues/48214#issuecomment-2557829956>.
> +                $field_ty: for<'__dummy> $crate::Zeroable,
> +            )*
> +            $($($whr)*)?
> +        {}
> +    };
> +}
> -- 
> 2.48.1
> 
> 
