Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1098528151F;
	Tue,  6 May 2025 14:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746540649; cv=none; b=BlC/gLugpiATh9e6KiCjmhDmFNfw5/ozfIrOsVIKYd5zpntaFeatTJG0GcOTlW2C1F179Xa/fc0cLzbK0ylGUPDpy/fSpy3mBfZT6Hvaa4jyRH3QfLZBzcraIVow5oRZ51rep9JjekyZlZjtT84Hxyt4gLozCFfRVhdTkLpK/c0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746540649; c=relaxed/simple;
	bh=D7/xd4Je9cWkjVbNle4K+xjwMhUJrZNFD4I3tR8qZkY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hTjlJiyw21ULGXDIX1rqoaYDpum5pxkR2F9axYfGKjFb3LbPkUBzi/2HS/A0KwVtg20wKh3DSxKmo+BC0+2WHHviBYZov6Hjk55JARz0v8uz+jsouYzTWxLpbMnXLzkYSnx9TcWbUrI0qdD+xOvJSGgRwi7SvxY4v2au1QtbWpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k7XGBKQ0; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k7XGBKQ0"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6e8efefec89so57043636d6.3;
        Tue, 06 May 2025 07:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746540647; x=1747145447; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D4qrstvTbJseLE5EzIpM9BG4xqiHf8SEz/1SNDvMUHk=;
        b=k7XGBKQ04oNjVCePeGq3KUPDi2lXF0IJ72RaJo8uHHgKTY0reBKwPvb6DP7DQGBJNA
         2OGU3+eWCDZWVR5biQ/jocwEzhzykAl/Zn7rdcZTv8a4PiRgkyEjUHbSE7iPX/FYEUnU
         Jj++7InopkSNAvhxQFT+Kjs/pzfk/SDmb/Fp0grOrEdDQKIqLatfSZIORVnzlXyTyfnT
         +4uIDbHkld1VKmOU2EwTy9xB+xN321uiK2wjMqa7oR2vgwk7Fk+V1mBomUsOnkjYlwd/
         jo6/RJtapMVGEWYAe9uuDGTYuxFztUHdYmiInDA26nnvUpvofV+0x/mWxQ2y/saWADk5
         2CCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746540647; x=1747145447;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D4qrstvTbJseLE5EzIpM9BG4xqiHf8SEz/1SNDvMUHk=;
        b=NMaJKWmYZ3ny7n3CtjraDbxk57pM3tDhIdjTHUZpcWKfUeduw2DK8peI2imoNaKfXv
         fR6DDhDxO5Tp60uucDQKCGRg50iizqWg7PybJIfWmW6PO4Ur6RiYonNlR6WiJ2Pir/gu
         hPJG/qiMuUYVFRbUl9CBZC4pKieR+veguenoGM5D8wfGdZPzdXyB1steqaME02SfODBC
         UfXPH22feqS9MGUQS+kQEM/b512RVrFv4EfqUX67f+hQgVO5ClKxsvv84taWRiETE2i0
         beDUZC4OvnZE4bKot89lXeosiTX/RB67JbH0+gnh7gxArCBP+GVM5iL50hwfxBzdIWdU
         9iBw==
X-Forwarded-Encrypted: i=1; AJvYcCVW3HzbrXr4WKB8TR/m/R+TuNy8KEQQSW+tmJCK/UViC0EgkwC1rXX5F96NQ9oK/HHdBV9gljl+BS9g09FmM5E=@vger.kernel.org, AJvYcCWFgk1NGB/PpHT1gCZ/L+PTppmYyleZzl29IoyeIlP4XV/VUfP2xfMaw/XlLRRMq08i1iLEMymLxI64uwQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4xNAZQXjSCF0ttqNuihQEcFYr1CzIxm/FYOooejFgQP7umr4c
	yzpvYngmQiSyWDHb2BA3B5nYhM6V4PIHtUX09cIgUw8h0YUGZqh3
X-Gm-Gg: ASbGncuHyIszqx70PmFPnK5g/zAKE302mU0XPjsl+wR6t3gpxpRNYm0sTGonSXsyoL8
	WWheb0wiCKNm98ExN07RK1gu0TheLAvb7eRMWk5KAJqPjI8GAGxA1RjR+zeoRVpJ5bgdRoCNMo9
	IGu7OJaVdqN3JXHmN6KqIfu35EXPPjM0TelpzHkCd4/XB+M3UMsQgXdZWG9krtolGmd2X4sSm7t
	WT3cxO7KnehPNAYM1nZnq829I9dZWavByQ7zW1x0nGHUWw8Lq5pfuhq1Gp43rt51y5OQKLN+C8o
	qiB24PUU6sDgY22HwwSl+BWZiQ4yLtjpWRI/PzCHWMMW7Dm8RvHEv1ji3CFFypvKM+fCHCpBz/e
	pL7uWqBmX7+W6yp3PrSHrqjfH3kp0+S4=
X-Google-Smtp-Source: AGHT+IHZYb5ph4i4NV85azRSOQqTJJByrjFnoIcEdZTo1jdUNPmQXfewyDKSO1JKVRbtftztEQ2rkw==
X-Received: by 2002:a05:6214:20ca:b0:6d8:b3a7:75a5 with SMTP id 6a1803df08f44-6f51580cce2mr293146556d6.42.1746540646605;
        Tue, 06 May 2025 07:10:46 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f50f3b05e4sm70296196d6.12.2025.05.06.07.10.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 07:10:46 -0700 (PDT)
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id 71AEB120006E;
	Tue,  6 May 2025 10:10:45 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Tue, 06 May 2025 10:10:45 -0400
X-ME-Sender: <xms:ZRgaaJTO2APsAQz8C5ms4Ee2wORDZFoighWC-QEquMts5dqgEyr95A>
    <xme:ZRgaaCwJT327yY960W3GJXCgVyBxdpWcUQ9VZXx-SpQ1n4nEANCrqzJTk-N19oWEz
    i55Q9JEGchLrhaX1w>
X-ME-Received: <xmr:ZRgaaO3H1PBBFZt0JNmI9MP_VEyV5CBPTkujTBDDWDzNgGdqYcwmD0y4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvkeegudekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddt
    vdenucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrih
    hlrdgtohhmqeenucggtffrrghtthgvrhhnpefhtedvgfdtueekvdekieetieetjeeihedv
    teehuddujedvkedtkeefgedvvdehtdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgne
    cuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghoqhhu
    nhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedtieegqdduje
    ejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfhhigihmvgdr
    nhgrmhgvpdhnsggprhgtphhtthhopedufedpmhhouggvpehsmhhtphhouhhtpdhrtghpth
    htoheprgdrhhhinhgusghorhhgsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehojhgv
    uggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrlhgvgidrghgrhihnohhrsehgmh
    grihhlrdgtohhmpdhrtghpthhtohepghgrrhihsehgrghrhihguhhordhnvghtpdhrtghp
    thhtohepsghjohhrnhefpghghhesphhrohhtohhnmhgrihhlrdgtohhmpdhrtghpthhtoh
    epsggvnhhnohdrlhhoshhsihhnsehprhhothhonhdrmhgvpdhrtghpthhtoheprghlihgt
    vghrhihhlhesghhoohhglhgvrdgtohhmpdhrtghpthhtohepthhmghhrohhsshesuhhmih
    gthhdrvgguuhdprhgtphhtthhopegurghkrheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:ZRgaaBB6l8_OeUqIJchmZ8p0Nt75mG3-TNypC_iaf-an-6cT9z9maA>
    <xmx:ZRgaaCgdLR74aQMGzECIstpkFiO8Blmm6zxj7C7QYfZBX36vGfY7wA>
    <xmx:ZRgaaFr2LXNzWwn-LVv2dIYGQfJbvWS3oz3VLT_xqASRxpLMla8UTQ>
    <xmx:ZRgaaNhRfO-OV9mcLe07brhTuA0O6P7t4uTY73NJBIdwltfDkaQdXA>
    <xmx:ZRgaaNS1R3Ui6NNLHTKsORRVSMu_Dx-BtHUKeisLaMVB6oFRyQ8hUUhR>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 6 May 2025 10:10:44 -0400 (EDT)
Date: Tue, 6 May 2025 07:10:43 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Oliver Mangold <oliver.mangold@pm.me>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] rust: elaborate safety requirements for
 `AlwaysReferenceCounted`
Message-ID: <aBoYYzj7sGEbsQzw@Mac.home>
References: <20250506-aref-from-raw-v2-1-5a35e47f4ec2@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250506-aref-from-raw-v2-1-5a35e47f4ec2@kernel.org>

On Tue, May 06, 2025 at 10:29:02AM +0200, Andreas Hindborg wrote:
> Clarify that implementers of `AlwaysReferenceCounted` must prevent the
> implementer from being directly initialized by users.
> 
> It is a violation of the safety requirements of `AlwaysReferenceCounted` if
> its implementers can be initialized on the stack by users. Although this
> follows from the safety requirements, it is not immediately obvious.
> 
> The following example demonstrates the issue. Note that the safety
> requirements for implementing `AlwaysRefCounted` and for calling
> `ARef::from_raw` are satisfied.
> 
>   struct Empty {}
> 
>   unsafe impl AlwaysRefCounted for Empty {
>       fn inc_ref(&self) {}
>       unsafe fn dec_ref(_obj: NonNull<Self>) {}
>   }
> 
>   fn unsound() -> ARef<Empty> {
>       use core::ptr::NonNull;
>       use kernel::types::{ARef, RefCounted};
> 
>       let mut data = Empty {};
>       let ptr = NonNull::<Empty>::new(&mut data).unwrap();
>       let aref: ARef<Empty> = unsafe { ARef::from_raw(ptr) };
> 

Hmm.. I would say in this case, what gets violated is the safe
requirement of ARef::from_raw(), because callers are supposed to
guarantee that an refcount increment was passed to `ARef` and in this
case, and unsound() cannot guarantee that here because it's going to
clean up `data` when the it returns.

Regards,
Boqun

>       aref
>   }
> 
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
> ---
> Changes in v2:
> - Express safety requirement in terms of ownership rather than
>   initialization.
> - Link to v1: https://lore.kernel.org/r/20250502-aref-from-raw-v1-1-eb0630626bba@kernel.org
> ---
>  rust/kernel/types.rs | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/rust/kernel/types.rs b/rust/kernel/types.rs
> index 9d0471afc964..52683d686c8a 100644
> --- a/rust/kernel/types.rs
> +++ b/rust/kernel/types.rs
> @@ -409,6 +409,10 @@ pub const fn raw_get(this: *const Self) -> *mut T {
>  /// Implementers must also ensure that all instances are reference-counted. (Otherwise they
>  /// won't be able to honour the requirement that [`AlwaysRefCounted::inc_ref`] keep the object
>  /// alive.)
> +///
> +/// Implementers of this trait must ensure that values of types implementing this trait can never be
> +/// owned by value. Instead, values must be owned and used through a pointer type. That is, a type
> +/// that implements [`Deref`].
>  pub unsafe trait AlwaysRefCounted {
>      /// Increments the reference count on the object.
>      fn inc_ref(&self);
> 
> ---
> base-commit: b4432656b36e5cc1d50a1f2dc15357543add530e
> change-id: 20250502-aref-from-raw-e110b3e6dbf5
> 
> Best regards,
> -- 
> Andreas Hindborg <a.hindborg@kernel.org>
> 
> 
