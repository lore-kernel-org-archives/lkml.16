Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64E8B2E659;
	Thu,  5 Jun 2025 16:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749140305; cv=none; b=UK79k1rRx/06q1wm8w1Hiq8tdEla7vlgyyhs5MqWaJPb24Ch3BYSdUks1XpCZBHANhKE3gJH2fuZ9mx7rYGjU3EQMDSCpRDC+iI6Y8b5xIav/ihObp0WmOkX3Tmj4i16Lxuz5xrqjZXXTWbG5ghOUmXr96UJ1OxBwOmg4V/pLd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749140305; c=relaxed/simple;
	bh=ogJrCoaVvTIzKL2yYFVyuhLVOAltgJOAUH2d+aTx534=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HxlKg11ozLk1ig11KeuHDjTKZxXM2eHRyA2cozM0GBXh22tA4ZGFgOSDouM3i4jnVcDiFDSHgLlAIVql9q+P/lHwoFVdpO1Icx+AnLgBcfUe7vkTV2fHG6QraLPhxvzzOVD+sJsMmQYLIrfShBQ1sSoRpRUuB3a5HaEpzMSyKc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fFP/q+UE; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fFP/q+UE"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6faf66905baso19002196d6.2;
        Thu, 05 Jun 2025 09:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749140302; x=1749745102; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vbY5hbizTKJKsW/+qsNX0eM08Ews+JJzRarPvAx+lGg=;
        b=fFP/q+UEVb54JUHja16rJGVHdaxPd5D1ZWvdMprjqsxjugT097Uw/wgY+kBkRUzLrl
         lSArZYMfczzOuss63aCFQk4bBrqgTnqC1hSmvp0fqbTtzkWMLe9Zu3rlUKWkLotlzTIe
         SYLTASQ4jK22eHCWKLWSt8GEIKQv4gNV4/kXIw5Jm+P+3qqLmaXEV95BTgDAHVWazZTT
         yKmBgtZyT9uVP/A0Ro9w7Sby3SZakgqS2PE7pigtgunlibqRrn1bjN7rgSw0eVDHCVlS
         72PcodTHhnWVRtvpgSjcVWZideuvP6F2U5nq4mJvIFSQ0yxd3kSpDxHxh87QJMXnPQlD
         nmwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749140302; x=1749745102;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vbY5hbizTKJKsW/+qsNX0eM08Ews+JJzRarPvAx+lGg=;
        b=qJVTU+3nkhfD0OQ3ROOq0uClwLtUizMNU+zdcJzaJvHEvOvYnUX9QTAhOtqURM3T3Z
         yORkgCQQC8WdEQSUyx0QpaarlKVwG3VFp/ZC8ooL3oloaaystWunXxMnWyss7n54sAh2
         jh1+0SzlB+oW7/cElvbP+tx5PTnUx2P1pYntWzNYa2fCn0s4LsrLfT7jI0XVefNWvWxu
         XejVtS1BZh3scvzzaRAFcKj89yJB6QunEPnuEdWpr2VA6PVEx+xFagcu42quaiGokz87
         +b4IYoKaluW+MDklyMkAtYS3hxT3ZhBGxMzUgW+C055ZD2Ntz4OQBC1Nx7GQhStVqTM3
         lohA==
X-Forwarded-Encrypted: i=1; AJvYcCU8iaKiqvY6YLlkE4rx6vUiqnja435zi33JCY5XyRiBAxzFeXEZZAQkda3uq/n4wUANbZvWXsrLuSZJc2WV4i0=@vger.kernel.org, AJvYcCXw9opMDj4Yl791m8Gn2ZyZ+wjmvWefibc17MJw2Zt8UNpA6mDds67mjSh5owUo7uP1k8Wl6e1ipAOm1ZI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHGolPd5cj+ETCWXJFBgRfxhSP/9pqdF05e1tstPnCEIx6z2Pk
	60aukTERDtL9N1bsPrafT6OFVFEAAitrz2iVEGzRjCrue314LXLxz2yG
X-Gm-Gg: ASbGncvKqRry2MdS5Ch7kEqOaeDYa/9NSe+33WqmisCb80vMY9erFzkkmrW3XknE5BD
	4ePg0KHMeGoh2Nbi2p384bAAbEqYd/UQHlroeZYEirAJ08IFTjjFPVU7eARXhnatCwLwFHgBme0
	+7uFcRxXd0H+C0IDekHN20HSVXSs1+HNYBpM1pRW9PhdKrCBVVzTnlWbnY58Oh75P6DG3WPmKj2
	MaszyzPN2OMI6SuAe1r72+UnnhVw6UGEAxkhAQjViiMyTE69zzfp1K+gIAQw6dT90qpJbFx1qc1
	soBGPlKzNUks440f/9ajYO1+xf4zzlbz65l8OY1eP5F/PWgYE9NSGtMeWwNM9WX7FzY5UV6OSG1
	vyXlVvWNv7IbmOoQhT7Y2DVgEd9Np+a3w865+c601zz1cyQ8b9iBf
X-Google-Smtp-Source: AGHT+IF3xXyEOhomjTTmsFQhhFbW4GVFEZynW/c9+WcQa51NB6yyngSKbSP2WOCE39LfAtPOvQsvPg==
X-Received: by 2002:a05:6214:1bc8:b0:6fa:bd17:338 with SMTP id 6a1803df08f44-6faf703078cmr99881616d6.41.1749140302102;
        Thu, 05 Jun 2025 09:18:22 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fac6d5b3dcsm122932266d6.52.2025.06.05.09.18.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 09:18:21 -0700 (PDT)
Received: from phl-compute-11.internal (phl-compute-11.phl.internal [10.202.2.51])
	by mailfauth.phl.internal (Postfix) with ESMTP id EF2051200068;
	Thu,  5 Jun 2025 12:18:20 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-11.internal (MEProxy); Thu, 05 Jun 2025 12:18:21 -0400
X-ME-Sender: <xms:TMNBaI7v_Otl4sbqaGoHEsbHW6ImxnW-YV09QFGKGIAwJPgtWzrGbQ>
    <xme:TMNBaJ6vyfzlZC2W4rvAH8C6TpMwtwW293eUr9wvXYK1lQbM2008opkhCPamyLjsc
    QcdjyE7qrkPPs7mZw>
X-ME-Received: <xmr:TMNBaHcSsLYsfmnX-au8Z5xLB-HXtVeuZP3TSayrtnokUyUUHikOaWE0Ug>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdefkeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvden
    ucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrd
    gtohhmqeenucggtffrrghtthgvrhhnpeehudfgudffffetuedtvdehueevledvhfelleei
    vedtgeeuhfegueevieduffeivdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhi
    thihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsohhquhhnrdhfvghngheppehgmh
    grihhlrdgtohhmsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohepvdejpdhmohgu
    vgepshhmthhpohhuthdprhgtphhtthhopehjghhgseiiihgvphgvrdgtrgdprhgtphhtth
    hopegrtghouhhrsghothesnhhvihguihgrrdgtohhmpdhrtghpthhtoheprggsughivghl
    rdhjrghnuhhlghhuvgesghhmrghilhdrtghomhdprhgtphhtthhopegurghkrheskhgvrh
    hnvghlrdhorhhgpdhrtghpthhtoheplhihuhguvgesrhgvughhrghtrdgtohhmpdhrtghp
    thhtohepohhjvggurgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghlvgigrdhgrg
    ihnhhorhesghhmrghilhdrtghomhdprhgtphhtthhopehgrghrhiesghgrrhihghhuohdr
    nhgvthdprhgtphhtthhopegsjhhorhhnfegpghhhsehprhhothhonhhmrghilhdrtghomh
X-ME-Proxy: <xmx:TMNBaNIyJnZdJIo7S4w6fKCWQ7F2a0z7ohxA0hG5wFmGfnxl8Vsggw>
    <xmx:TMNBaMITyNGw87097O3SfTgdd7raNlzKJdWMDAaxJw2K5skhMKCkig>
    <xmx:TMNBaOxRrweMUIBmqaOKZghtDNuAMhihd_r0gzvFHv_JvU3qRGJ5Qg>
    <xmx:TMNBaAJ7bWlavrp6D2fn02tDLPAmUdabe56ET6GnNQpYedKcZ1Ovlw>
    <xmx:TMNBaLb4qWpIHS3nGfjptuPG5XOofezbGHMoSnJPtc6bkiW2RxnCex_t>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 5 Jun 2025 12:18:20 -0400 (EDT)
Date: Thu, 5 Jun 2025 09:18:19 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Alexandre Courbot <acourbot@nvidia.com>,
	Abdiel Janulgue <abdiel.janulgue@gmail.com>, dakr@kernel.org,
	lyude@redhat.com, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Valentin Obst <kernel@valentinobst.de>,
	open list <linux-kernel@vger.kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>, airlied@redhat.com,
	rust-for-linux@vger.kernel.org,
	"open list:DMA MAPPING HELPERS" <iommu@lists.linux.dev>,
	Petr Tesarik <petr@tesarici.cz>,
	Andrew Morton <akpm@linux-foundation.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Sui Jingfeng <sui.jingfeng@linux.dev>,
	Randy Dunlap <rdunlap@infradead.org>,
	Michael Kelley <mhklinux@outlook.com>
Subject: Re: [PATCH 1/2] rust: add initial scatterlist bindings
Message-ID: <aEHDS0YPmkB4Uto_@Mac.home>
References: <20250528221525.1705117-1-abdiel.janulgue@gmail.com>
 <20250528221525.1705117-2-abdiel.janulgue@gmail.com>
 <20250529004550.GB192517@ziepe.ca>
 <DA9JTYA0EQU8.26M0ZX80FOBWY@nvidia.com>
 <aEG5X7FduqFvgXxH@Mac.home>
 <20250605160204.GC44681@ziepe.ca>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250605160204.GC44681@ziepe.ca>

On Thu, Jun 05, 2025 at 01:02:04PM -0300, Jason Gunthorpe wrote:
> On Thu, Jun 05, 2025 at 08:35:59AM -0700, Boqun Feng wrote:
> > Late to the party, but seems to me the main problem here is that we
> > cannot pass a reference to .set_page(), note that there is some work
> > that would change the Rust struct Page from a `*mut page` to a
> > `page`[0], and then we can impl Ownable[1] and AlwaysRefCounted for
> > `Page`, if that's done, then I believe the correct parameter for
> > set_page() would be an ARef<Page>.
> 
> There are alot of things that want to go into scatterlists that don't
> have struct pages that are refcountable (eg frozen pages used by
> kmalloc).
> 

I see.

> So I don't think you want to go in the direction of forcing
> struct page refcounting in scatter table. That is not how the C API
> works for good reason.
> 

Ok, that's fair.

> I also don't think it is a good idea to push more struct page stuff
> into Rust as we are trying to eliminate struct page from the

Well, that's why I suggested Owned<Page> and ARef<Folio>, but let's not
get too deep into that direction unless necessary ;-)

> kernel. It is better for rust to stick to KVAs and convert to struct
> page in core code only where absolutely necessary for someon reason.
> 

Sounds reasonable to me for now.

Regards,
Boqun

> Which is another part of why I suggested set_page should not be part
> of the driver facing rust API for scatterlist.
> 
> Jason
