Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DDD41367;
	Mon, 19 May 2025 18:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747678609; cv=none; b=PxjERC1MhDKyftM+MqT3uy4CD/dzdFflX19Vq35mMycUfjo5zQudfW0ECa6/JQCF4jKzlIT5QsxqlVXZBMxpmM2cdy+84GbtnOFT7Mgd2GsikH87s41+uK4m//R7kXuCEoJDWMOeEJKyCGsIRP4jsvIZC/MWZ4ojOIz4fT8AJlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747678609; c=relaxed/simple;
	bh=1NvZ5J3M7kTrap2/qVlD6DZ23bnjkfUwmbWr32yKn2g=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BOPbMPi78MLU3h/Fdu5Q/Ub269tGUzbPxS8dxg/Y5YmvipYs29ytbpJ2ChDRVLfz/eJ0RUCg7RoDXrQ7rd5PJVM/kFvR9kS4mvbGpG80vEOmvQC+Aa6QVMAjOEJ91+bx12P16lGwI9xrT/7Y4FBgpiN0xoX/TnsvirBit8h4sh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pr7hBr9H; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pr7hBr9H"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7c55500d08cso531094085a.0;
        Mon, 19 May 2025 11:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747678607; x=1748283407; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:feedback-id:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VN03iQ54WD//h9dJq3MCTCW8AEn/99Yg+5ZPNGZQLJw=;
        b=Pr7hBr9HsTtukip36oDOLgynejqjspGUOL4wgJJDKTLfHy/7fHCabP7PTX4Q73PRVr
         jQJFXDy7sjUC9kcGNqK232/GnmDenYdvCsswL9bdCQPclb09X0juljiYdGyYYJ4ScWXP
         EWAS6x00C6ixRS/xMQnkfjxIQnQJn5fcoRt+WANvE8MdzZ5P5Jk4FxIM9Lzl+u1gRXOl
         Mc1zrLFXD3lrtiM4V8IwR0IsEZqU8eWoKIt8f8r4CWJTQyOgd+3LFLP2zANZnq7y3oyw
         93ZU7FTETn1spKkwzRj5t3tqJ1S/ELNURPH28wdE07GKjN5NkuxWVyDegX7IJkS7sBnu
         AUMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747678607; x=1748283407;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:feedback-id:message-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VN03iQ54WD//h9dJq3MCTCW8AEn/99Yg+5ZPNGZQLJw=;
        b=eA3r7Kd6hLfrCiapzSAcNne0V0r/6+GOnAMXnqocNi5GiMr4LUDPqxona4hsjzYJc6
         qbhCbCK06Yj6z6wbuoGFKljwnu9MGG0pGapbfRN+dlp9pt/cQd5VViO+Kb08gtTznCfn
         KAbqIMeCKDT9bpcTc+H0aDuT8DbSAHGMULKUwgeHcsXsxw2yRfc+j1wW+b7QsQFRmapv
         sWVnCbUioWRBEVkzei6HslfDqaEXVku0El+MX3qS4bOIdnlWbTJuBHo48Ga6oAs9fQL6
         GGwkr+RrSZ19UJ/w1tpG3RGYULOwgBL6jpnskkYlN064AeDHgLCA7AMgdpsCk88rfdl2
         TXLg==
X-Forwarded-Encrypted: i=1; AJvYcCXY1d4ZHXnxAh243gxrXs571qKU49x4vnFz8LJFYCvwShLQsOBjsDZob86JNKV7Td8C9CYMJg/hKTDbp5xd1lk=@vger.kernel.org, AJvYcCXoGEupd7m+LJ61d4PbkuCXLmAm9cAA1mifH3XWL8whccN/4C/VNghHKHGg4sbFgS9fTlpQpbHnzbH8vnk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzK6rFFiEqgaAqBwJB98dfHsfNhpcdmc6fYPgme5MiQrXSeEwZE
	XaJx+u2BL2o33Nrb6JQiZPK1L7+NYXpdMvV/zLAwYyQ78dAS+SiR9Mep
X-Gm-Gg: ASbGncsZjCL8kH8vuW0fxmUQA7Y98QXcpGB37j475cU6X4BGYzDTQpHkpeVTu77CuU0
	N+xTozcqEnzBEzkC/aiYsIknr9J1r/Cii1x4haZ/x98SFBciL7NEdGP2YAflYngWc/01J4vUz9m
	zJKur0YSaUlrhtAw+O/vJMOf+MsDKfg8TyKt8vbtW6TX7vD1rTkKRXRlbeXM7uZYAiON40sJM3a
	8pbzovgkHgUH1JufIxsYAiY3bx06SSJhHIipjaZP4cH/rJO3pkXGeNPjUnChsvP9PlqXvA14FR/
	KCITW/FMJfqeVDidj84eVEtJMJUhBcM3VIuhx6HBf9jcsqU+1rnpAmGjSo2wafZi/J90TeXV4+F
	Grsp30BqiQpexOxod29bevpgTABGCoYQ6qwkK0I2fVA==
X-Google-Smtp-Source: AGHT+IFurhWqgneo1yQcLjV1uekU11Mp7TcjxVPZyN/xEjJfTjYrEnWE0oQYtP5gm4BNqFD6Q3QWCw==
X-Received: by 2002:a05:620a:d8e:b0:7c7:a537:7ce2 with SMTP id af79cd13be357-7cd46731b24mr2219527985a.32.1747678606689;
        Mon, 19 May 2025 11:16:46 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cd467eedd7sm612689885a.56.2025.05.19.11.16.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 11:16:46 -0700 (PDT)
Message-ID: <682b758e.e90a0220.96106.9ada@mx.google.com>
X-Google-Original-Message-ID: <aCt1jIuqm4NDqXz1@winterfell.>
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfauth.phl.internal (Postfix) with ESMTP id BDF311200043;
	Mon, 19 May 2025 14:16:45 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Mon, 19 May 2025 14:16:45 -0400
X-ME-Sender: <xms:jXUraGpKioxtkzGL6PgGMebjBE8is_OxQn1zwae26bsUy7wIT0W8cQ>
    <xme:jXUraEoHa-NgwZlppsMfOZvx4UQLIn0feue7hVKrJgd9ZV0sYvY1za39rulc7PzC5
    WSasXSXAXozChxqzQ>
X-ME-Received: <xmr:jXUraLPutthTMWEy48J3CUsSscEoN6KUtLMR7dngFkJOp8PPF31zEtrs0bI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefvddvtdejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddt
    vdenucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrih
    hlrdgtohhmqeenucggtffrrghtthgvrhhnpeekledtheefhffffedtieelfeejtdffiedu
    gefgiefffffhheffueffieevudfgheenucffohhmrghinhepfhhrvggvuggvshhkthhoph
    drohhrghdpughrihhvvghrrdhrshenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgr
    mhepmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlh
    hithihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsohhquhhnrdhfvghngheppehg
    mhgrihhlrdgtohhmsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohepudekpdhmoh
    guvgepshhmthhpohhuthdprhgtphhtthhopegurghkrheskhgvrhhnvghlrdhorhhgpdhr
    tghpthhtoheptghhrhhishhirdhstghhrhgvfhhlsehgmhgrihhlrdgtohhmpdhrtghpth
    htohepohhjvggurgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghlvgigrdhgrgih
    nhhorhesghhmrghilhdrtghomhdprhgtphhtthhopehgrghrhiesghgrrhihghhuohdrnh
    gvthdprhgtphhtthhopegsjhhorhhnfegpghhhsehprhhothhonhhmrghilhdrtghomhdp
    rhgtphhtthhopegsvghnnhhordhlohhsshhinhesphhrohhtohhnrdhmvgdprhgtphhtth
    hopegrrdhhihhnuggsohhrgheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghlihgt
    vghrhihhlhesghhoohhglhgvrdgtohhm
X-ME-Proxy: <xmx:jXUraF7gPyzQqTBafkR-g6oV6mu1RsWNqddMudSSEJqlaEcnMF_Opg>
    <xmx:jXUraF7AstFidAOsxV4I5jBvxzKQlsFIX4tDOJdzX1W7GJUoq4dMSw>
    <xmx:jXUraFj4fj1LLrmPF2Ygu7GcAPw4_mg3tRbyh3e7zLkuKOr_Q4QJEQ>
    <xmx:jXUraP5e7PWay5LpgWMpYaU_L0-ZOghEPy652oAu9WmFeZSGNg1xzQ>
    <xmx:jXUraAJz1fGvqsynOb8Kw1uoqqCDAShADZjMlkFjBS6rSqDVPyxdyPOr>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 19 May 2025 14:16:45 -0400 (EDT)
Date: Mon, 19 May 2025 11:16:44 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Christian Schrefl <chrisi.schrefl@gmail.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lee Jones <lee@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Gerald =?iso-8859-1?Q?Wisb=F6ck?= <gerald.wisboeck@feather.ink>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] rust: miscdevice: add additional data to
 MiscDeviceRegistration
References: <20250517-b4-rust_miscdevice_registrationdata-v3-0-cdb33e228d37@gmail.com>
 <20250517-b4-rust_miscdevice_registrationdata-v3-1-cdb33e228d37@gmail.com>
 <aCiSRZjOETsD8MhX@pollux>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aCiSRZjOETsD8MhX@pollux>

On Sat, May 17, 2025 at 03:42:29PM +0200, Danilo Krummrich wrote:
> On Sat, May 17, 2025 at 01:33:49PM +0200, Christian Schrefl wrote:
> > +pub struct MiscDeviceRegistration<T: MiscDevice> {
> >      #[pin]
> >      inner: Opaque<bindings::miscdevice>,
> > +    #[pin]
> > +    data: UnsafePinned<T::RegistrationData>,
> >      _t: PhantomData<T>,
> >  }
> 
> I recommend not to store data within a Registration type itself.
> 
> I know that this is designed with the focus on using misc device directly from
> the module scope; and in this context it works great.
> 
> However, it becomes quite suboptimal when used from a driver scope. For
> instance, if the misc device is registered within a platform driver's probe()
> function.
> 
> I know this probably isn't supported yet. At least, I assume it isn't supported
> "officially", given that the abstraction does not provide an option to set a
> parent device. Yet I think we should consider it.
> 
> The reason this is suboptimal is that, from the callbacks of a misc device we
> may want to access device resources from the platform device.
> 
> Since device resources have to be protected with Devres, we'd need to access
> them with Revocable::try_access_with() for instance.
> 
> However, it would be much better if we had proof that the parent device of the
> misc device (i.e. the platform device) is bound (i.e. provide a &Device<Bound>)
> and hence are able to access device resources directly.
> 
> The only way to prove this, is to prove that the misc device registration is
> guaranteed to be removed when the parent device (i.e. the platform driver) is
> unbound.
> 
> And this we can only prove if we wrap MiscDeviceRegistration itself in a
> Devres; we don't want MiscDeviceRegistration to out-live the driver it was
> registered by anyways, so that's a free optimization.
> 
> If the data above is stored directly in the MiscDeviceRegistration however it
> means that we can only access it through a Devres<MiscDeviceRegistration>, which
> would be annoying.
> 
> To be fair, storing data in MiscDeviceRegistration is not the main issue of why
> this is suboptimal in driver, but it adds to the problem.
> 
> In general, the design of MiscDeviceRegistration is a bit suboptimal to be used
> within drivers. For drivers it works much better when the Registration type
> really *only* represents the state of a thing being registered, such that we can
> guard it with Devres *without* any downsides or additional complexity. One
> example for that would be the drm::driver::Registration [1].
> 
> If we want misc device to work optimally with drivers as well, we need to split
> things in two types: `misc::Device`:
> 
> 	struct Device<T: MiscDevice> {
> 	   #[pin]
> 	   misc: Opaque<bindings::miscdevice>,
> 	   #[pin]
> 	   data: UnsafePinned<T::RegistrationData>,
> 	   _t: PhantomData<T>,
> 	}
> 
> and `misc::Registration`:
> 
> 	struct Registration(ARef<misc::Device>);
> 
> 
> and make the `misc::Device` own the data, not the `misc::Registration`.
> 
> This way we can wrap misc::Registration into a Devres, with all guarantees it
> gives us and an no downsides.
> 
> I'm not saying that I want to block this patch, especially given that using the
> misc device abstraction doesn't seem to be supported to be used from drivers,
> but please understand that the design of the misc device abstraction, while it
> works fine for the module scope, really is sub-optimal for the use within
> drivers and hence should be re-worked.
> 
> Can we please either do the re-work right away or add a proper TODO?
> 

Well, I'd say we do the re-work right away, because I don't see any
other work depends on this right now. Let's do the right thing.

Regards,
Boqun

> [1] https://gitlab.freedesktop.org/drm/nova/-/blob/nova-next/rust/kernel/drm/driver.rs?ref_type=heads#L121
