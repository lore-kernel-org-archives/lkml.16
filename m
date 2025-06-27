Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40F3E2EBDE3;
	Fri, 27 Jun 2025 18:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751049562; cv=none; b=fcExPqVfYanV+LQX0Fw7ohfOt/ICyX9VaN7urCn5rzYADFu8X9eVql/mMiDHGg1hMjBFEy5od8cDDfF9P6YrPGmbicsWu48dMJYaSfF5lN7RyCMTgSIfjcbJJaKb7CpQQDvgfQgfGAWREgoNlAfKiWTpcBhzxxSLMr64+PQMGVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751049562; c=relaxed/simple;
	bh=kp9PjL3LKMGL9g360pD7nujdbMdW2nJiaqTDB5QV9Uk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VWsqSfrG6/N+eFEHSDJmz96OnaDKs/OsBd/hyukO7dxtEpL1MAdRTOYK2vCx0bhiVXP4cMf2uiAXXo4FRVb5j1RXb2Arm8ONdgllNK1qdw6vwS4fURUwzld7e8xhEacRWkET6MZanBEy2FgB/gSL+hWeeagjTm5Dzeskii1l2sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Prwmv6iK; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Prwmv6iK"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-6f8aa9e6ffdso26832376d6.3;
        Fri, 27 Jun 2025 11:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751049560; x=1751654360; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oM6ZlLkA8V2xRq6NqZMaoWitJ+r31gMnv4g5wXZZ+Bo=;
        b=Prwmv6iK4pYn8p+wnMcm/H+ImPu+7LRk09/9m0yujmDJhO2eXDe6jN7K6mHpx9sd8j
         PoOMC6qGhQrO4V5mUhUr2XusUDbtAgVBkk1lH4rpUT+DWD9FQOyorQp40v2/D4uyCH1t
         o2qiGCy07Jp89hAifBiHvwJ9cd8kLeqclHq4Ct6SL1vKNLR7Afmw+G+2EbtYeX3d4kc4
         gcPpSv8neNfDRfvxl/iNSn1pyQ//RjogxiJ9XmF+ArYDPiSaxApO29RAd/g5iIyPOroR
         ww+dvnhV8kYMg7n9IyB/lMbfkNDYk+yybJtwJBwmgOg8YVqDSoqk+IcicaCcle+W/PZw
         G/Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751049560; x=1751654360;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oM6ZlLkA8V2xRq6NqZMaoWitJ+r31gMnv4g5wXZZ+Bo=;
        b=IyjtEKfI+clHPCH3k8i7JeioUeXYgg2YBnp7tMwcvKL2KPn5L8Jw4vSA528grVq/V6
         uQMPpJT9uIHuWIvw5d90XV3PTRuCsmAnYpHpswUnUlL+hsYJT1oPr+SvXEmvE5pUP5OG
         ugKdKfVcToB/viZwU5uMtl/RUEQNywnHa1vhVegdEa5z4/kAxFZn6OYQytd0TXmeYq/t
         Zs/ds4iHYd+8/GdBjaz2V88UPE7/UVmCqULF1fw2jLpRQ7EjsM/N1fM9TsctUKB/ROzA
         4PE8lrYZcOUq8KKmVW9jiF6vZYehY0RNCdbJJ8eNrq6vYnmlkF5ZYNUAhH/IzzATItj6
         R/Mg==
X-Forwarded-Encrypted: i=1; AJvYcCV5sV80iUrWxPhPNK3yRRKq0IWQj/dGRdjCMfJV/HLmsUHlO/0djBJoff5SlxADms+sIPkxp0uH/Ze8lJ4=@vger.kernel.org, AJvYcCV8B9FYW4RjyRxyLeB1FHtL9r2fIrSy8/antSa0wrDbMpUlyLNKK8zfS+IOJfqh9wJLwrzYsDyDoOerb51xEk8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yypfk++/QjM75zd5yi0my10q+v/pApSu2TUtWzPp+mMtxYSamI2
	W9p96zph2d9qp2NeFDHDpuWQx6yKIt/APY7B+jN+lCLrpaWOirkyYIdJ
X-Gm-Gg: ASbGncthlzyO/D6+Hf/nXIfKyGnJqsYeF7HUO5oDrXsr3wbsUtkNm86af29HjRHtpcS
	SgwvBvVqBzl9zHiYo5X3VX5bD+E08K4hbLbrCAjAE4nR4Q/0qJuhLDKXJTS3UXa2GQNiqAngHto
	imrxlyv/RHpZCq8uHGiLsapypSph8lrTI07rHZnVzExVIx5uKS0afvj9TRgLanTSk3vBADUrwGH
	vt4wbq9goEmpOI+fk5fm6r8YjOvMPENAxYJZ6DHxbwJBw8NWdoGajAqtgPsL7YsRaceptoI/kwA
	PvL6shm0FjWQG1RDQVTnw7m3YjRsBkG4uzT2jrXpTMIC35P6RX4gdr4LwQw/TIdW4T26yRityZ3
	BNbl+/oEu+cYmLVq5NIQbx2I9SKlJOcqYVSkg0CGU6TXk7nn9PWAp
X-Google-Smtp-Source: AGHT+IF2WYuaGhvNjjpH48pnA/M56cZCufsyNtwIk/4pBAJO9HLCeIyLTH3Ags+JPYYAtsqE4nL3IQ==
X-Received: by 2002:a05:6214:1c47:b0:6e8:fe16:4d44 with SMTP id 6a1803df08f44-700134a81d5mr87297906d6.31.1751049559942;
        Fri, 27 Jun 2025 11:39:19 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d44313695dsm176318385a.1.2025.06.27.11.39.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 11:39:19 -0700 (PDT)
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfauth.phl.internal (Postfix) with ESMTP id A0ACBF40066;
	Fri, 27 Jun 2025 14:39:18 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Fri, 27 Jun 2025 14:39:18 -0400
X-ME-Sender: <xms:VuVeaHiEq2PLdenDqBdVpDQkTEwhoeVn4YSNfjyBu_lodRjleFdCXA>
    <xme:VuVeaEBTof8MjoaKSYa46MxXXVN8i7Glzj1o7wnjPbr0dampKhdB5F-l9CGncvWem
    XmB-s_IzqHnL5Xgnw>
X-ME-Received: <xmr:VuVeaHFK3P4tvD0-O0BuEYAEU0rPrUaMpnUJkbyaT67NrBSYvjZdLmYM4xA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdefkedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    epfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhunhcuhfgv
    nhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtthgvrh
    hnpeehudfgudffffetuedtvdehueevledvhfelleeivedtgeeuhfegueevieduffeivden
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsohhquh
    hnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdeiledvgeehtdeigedqudej
    jeekheehhedvqdgsohhquhhnrdhfvghngheppehgmhgrihhlrdgtohhmsehfihigmhgvrd
    hnrghmvgdpnhgspghrtghpthhtohepudeipdhmohguvgepshhmthhpohhuthdprhgtphht
    thhopegrlhhitggvrhihhhhlsehgohhoghhlvgdrtghomhdprhgtphhtthhopehtjheskh
    gvrhhnvghlrdhorhhgpdhrtghpthhtohepohhjvggurgeskhgvrhhnvghlrdhorhhgpdhr
    tghpthhtoheprghlvgigrdhgrgihnhhorhesghhmrghilhdrtghomhdprhgtphhtthhope
    hjihgrnhhgshhhrghnlhgrihesghhmrghilhdrtghomhdprhgtphhtthhopehgrghrhies
    ghgrrhihghhuohdrnhgvthdprhgtphhtthhopegsjhhorhhnfegpghhhsehprhhothhonh
    hmrghilhdrtghomhdprhgtphhtthhopegrrdhhihhnuggsohhrgheskhgvrhhnvghlrdho
    rhhgpdhrtghpthhtohepthhmghhrohhsshesuhhmihgthhdrvgguuh
X-ME-Proxy: <xmx:VuVeaESkvFESkXSCsvXg1MWojjFFS7Nvv10pBXUSbttIgV4JBiTrbg>
    <xmx:VuVeaEzN2uujjLvhwJZwD3a1kbYGa4Sh7jLgjYQTOiSHHw5Owd-Odw>
    <xmx:VuVeaK5NkqvkiiurUWcdagi5si0qdwOouLVng4hGMS5_0zPGuOKfFA>
    <xmx:VuVeaJz4GnInp8uaXMOoOY56ZXA1zXtwMBG_uJROy4s7d2CGGWSwFg>
    <xmx:VuVeaEjPWFEoOp97DP_PZUpQIPcAN--776P_kvghWO9hSpBSNoDfl8Hl>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 27 Jun 2025 14:39:18 -0400 (EDT)
Date: Fri, 27 Jun 2025 11:39:17 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Tejun Heo <tj@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Lai Jiangshan <jiangshanlai@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@gmail.com>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org, Benno Lossin <lossin@kernel.org>
Subject: Re: [PATCH v2] workqueue: rust: add delayed work items
Message-ID: <aF7lVYl7p33kByoK@tardis.local>
References: <20250627-workqueue-delay-v2-1-84b046fdb4fc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250627-workqueue-delay-v2-1-84b046fdb4fc@google.com>

On Fri, Jun 27, 2025 at 09:38:42AM +0000, Alice Ryhl wrote:
[...]
> diff --git a/rust/kernel/workqueue.rs b/rust/kernel/workqueue.rs
> index d092112d843f3225ea582e013581b39e36652a84..3a7ab7d078fc2091ad556bfde997b9f73f618773 100644
> --- a/rust/kernel/workqueue.rs
> +++ b/rust/kernel/workqueue.rs
> @@ -131,10 +131,69 @@
>  //! # print_2_later(MyStruct::new(41, 42).unwrap());
>  //! ```
>  //!
> +//! This example shows how you can schedule delayed work items:
> +//!
> +//! ```
> +//! use kernel::sync::Arc;
> +//! use kernel::workqueue::{self, impl_has_delayed_work, new_delayed_work, DelayedWork, WorkItem};
> +//!
> +//! #[pin_data]
> +//! struct MyStruct {
> +//!     value: i32,
> +//!     #[pin]
> +//!     work: DelayedWork<MyStruct>,
> +//! }
> +//!
> +//! impl_has_delayed_work! {
> +//!     impl HasDelayedWork<Self> for MyStruct { self.work }
> +//! }
> +//!
> +//! impl MyStruct {
> +//!     fn new(value: i32) -> Result<Arc<Self>> {
> +//!         Arc::pin_init(
> +//!             pin_init!(MyStruct {
> +//!                 value,
> +//!                 work <- new_delayed_work!("MyStruct::work"),
> +//!             }),
> +//!             GFP_KERNEL,
> +//!         )
> +//!     }
> +//! }
> +//!
> +//! impl WorkItem for MyStruct {
> +//!     type Pointer = Arc<MyStruct>;
> +//!
> +//!     fn run(this: Arc<MyStruct>) {
> +//!         pr_info!("The value is: {}\n", this.value);
> +//!     }
> +//! }
> +//!
> +//! /// This method will enqueue the struct for execution on the system workqueue, where its value
> +//! /// will be printed 42 jiffies later.
> +//! fn print_later(val: Arc<MyStruct>) {
> +//!     let _ = workqueue::system().enqueue_delayed(val, 42);

Nit: maybe use a different jiffies value? Because you call
MyStruct::new(42) later, and we want to demonstrate that the '42' in
enqueue_delayed() is the value for delay, not the '42' in
MyStruct::new() ;-)

Just use 10 jiffies, maybe?

> +//! }
> +//!
> +//! /// It is also possible to use the ordinary `enqueue` method together with `DelayedWork`. This
> +//! /// is equivalent to calling `enqueue_delayed` with a delay of zero.
> +//! fn print_now(val: Arc<MyStruct>) {
> +//!     let _ = workqueue::system().enqueue(val);
> +//! }
> +//! # print_later(MyStruct::new(42).unwrap());
> +//! # print_now(MyStruct::new(42).unwrap());
> +//! ```
> +//!
>  //! C header: [`include/linux/workqueue.h`](srctree/include/linux/workqueue.h)
>  
> -use crate::alloc::{AllocError, Flags};
> -use crate::{prelude::*, sync::Arc, sync::LockClassKey, types::Opaque};
> +use crate::{
> +    alloc::{AllocError, Flags},
> +    container_of,
> +    prelude::*,
> +    sync::Arc,
> +    sync::LockClassKey,
> +    time::Jiffies,
> +    types::Opaque,
> +};
>  use core::marker::PhantomData;
>  
>  /// Creates a [`Work`] initialiser with the given name and a newly-created lock class.
> @@ -146,6 +205,33 @@ macro_rules! new_work {
>  }
>  pub use new_work;
>  
> +/// Creates a [`DelayedWork`] initialiser with the given name and a newly-created lock class.
> +#[macro_export]
> +macro_rules! new_delayed_work {
> +    () => {
> +        $crate::workqueue::DelayedWork::new(
> +            $crate::c_str!(::core::concat!(::core::file!(), ":", ::core::line!())),

We can use `optional_name!()` for this.

> +            $crate::static_lock_class!(),
> +            $crate::c_str!(::core::concat!(
> +                ::core::file!(),
> +                ":",
> +                ::core::line!(),
> +                "_timer"
> +            )),

and maybe extend `optional_name!()` to support a suffix? Or we make a
concat!() for `CStr`? Anyway I don't think this blocks the patch, if you
don't have time, I will create an issue for this.

With the above fixed, feel free to add:

Reviewed-by: Boqun Feng <boqun.feng@gmail.com>

Regards,
Boqun

> +            $crate::static_lock_class!(),
> +        )
> +    };
> +    ($name:literal) => {
> +        $crate::workqueue::DelayedWork::new(
> +            $crate::c_str!($name),
> +            $crate::static_lock_class!(),
> +            $crate::c_str!(::core::concat!($name, "_timer")),
> +            $crate::static_lock_class!(),
> +        )
> +    };
> +}
[...]
