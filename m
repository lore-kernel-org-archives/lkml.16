Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D48B41E1DF6;
	Thu,  5 Jun 2025 15:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749137766; cv=none; b=HWqJzSDF/UgRYXnjHubQS0ZKYdPBMNw8+w/UUr57sQLe7CdcqLf9guDCI8Tsjwh1vXlvYqlMH8RDR2Pghi03P5J9eURR4JqkCZbvFys0iWsiqeyZh6nYvJyxkR8QV0MgYADxjxesuENtO1Sx6wTUgndR7vg/+2giZfepMvM6Szk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749137766; c=relaxed/simple;
	bh=XTDVuWHZiwRdzVPPepxoTiBt9p9p090JYaunojvs75E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fdzUlLTLGxGNZ6se4cixV515aCptrJbhBlpj50/+JsusAzfOsE9ycf+4IMiyYvKL0bzoLgJr2IrD+FOTeOFSDdzM6hKXmfEp3iiC3wa5LxdWQ15osE3/ECRNcvHHAkOgs783G/BkpsiwlH4a8rLvPEOP7m6nDb1ly0BWbfTW72Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ghCui132; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ghCui132"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7d0a47f6692so120991485a.1;
        Thu, 05 Jun 2025 08:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749137764; x=1749742564; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/0q7FonkhKnZrhgheKOu3mqlvKG0pa4njRzoaCLwotc=;
        b=ghCui132aChXE4NVrOMzuzHOipbt0cheSuMrlKzZwYYRjFNuuk9CTtJwCz7Uk8HZEO
         mJwdmU3avTyiex2cNyZvC0UpW3Nr1ixXZ+1slNt4tR/f4051wCEj0F5L0HA93pTngQ/X
         H7CneOMJYMoExPJ2aDs6AUxvzTQJNGZ0w3VIpodG/9KOoKtTrqDsnjkdC4kZtJVadooK
         fHe4/L+15hPLXRDYR24qbuTHO7o+q0qPHJpm8YCAEiccYqddZQ/ZVY0xJAvioj3v1zqs
         tw2AEqFp6atxMDSuCu3p6kWlzLv4FQABMbl40SbcAdPIz127D2V2iPZqimpLCPvu/xGg
         vJOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749137764; x=1749742564;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/0q7FonkhKnZrhgheKOu3mqlvKG0pa4njRzoaCLwotc=;
        b=qLMvjAgOjxCVuDj4qp2MwqpYGFQk9uLd09UOAEzvaDbx7mAzGj0iHivUYJokxXtHbW
         KQyMDUpsoB4YR3K9uoh/Yq3OG9osfKbIlsTCDUCnqTz62tv0dBJTWBYwxGF07zMTN/83
         5pJeFsOIlbAG/qZrA+gJWiAVjw1+J5auQK4k57DVYpXNSaiXuY/oQRBY8PvnRLBMKo2y
         b/v/xZto3j/j+2WxPuq3Epz1AF7eOOW/TNsvearL5HPKXgngm3Iw/vRE3BCoi/qC3xj4
         OlmA70oWT5bCBF90RXPr3pJ6qTpV3pwfA45TSl3XOYNMAav5uxif5a3vim4VxUUYp3u8
         unYQ==
X-Forwarded-Encrypted: i=1; AJvYcCWLjRu1JpabrPJjvKrymRar59lw1aT4FoPBKaWMrF3C35bgfl/hlCzRCDfbKEHDm5EnuHwUydaGc/uFexo=@vger.kernel.org, AJvYcCXgLH+rkChEIXpjcTG2lSkzHhmgH8QsUfu4UKXWU7mMfoo2wJu1WFCVaoUlHkXmQm4DI9FjQEu64emDlsgTh5I=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKqmKE4jO8QqWea/6xiJM2yZsxFEUORx1w5U1+24kAhFAdzFno
	CaysoOm9NaYspME8Ge0eu+VjyaNMGhKuRx73P25z3gMPNw7O+kOfGF4G
X-Gm-Gg: ASbGncsSucTzkFOiRW/kXZaZp8CSd6PGJ17ZFUrxQa88gAt5gVCU+cSm1BHIcC3A5fq
	d/Ke477j/aodTqXwQt+HendOANsewsEIp6jVqoJgtQ4FclBD3Ai9jh6nOWeOwNzWOgvtz+HhTM3
	45p5ElCMj6bgZPgGLw8eb73FXoTgvsJd3lW0/7TjAu4ysmXkbroYeoWQ/ir5f+9FBfD22Zoi1YC
	ynKvk2OEn7hGZDe+4CQXd46Rq9ZL4aS5EWSdmxahjpPf+SGHgVIX0mZe/BQ4OperuSTtbuBcvi+
	SMtfVB9NZP9D4Ptfnm0jGw1GZjMuxBu5TmJGnt2xVg1DiLFtFHl+xgdfEJ53JNI7jeruzYGptiw
	N5IjXOo+I/0PjiLX51SIiyTbNHVA2aBI2js8ti8T+WrVoA/GBUM+U
X-Google-Smtp-Source: AGHT+IEKM15yMlZ3fIsFtxEWpOJO4JB5Ecxk9IxQdKCg8ODboARmI46Au4V0WWk2cv1n+LRn0pAZ8A==
X-Received: by 2002:a05:620a:440a:b0:7d2:23c7:e7af with SMTP id af79cd13be357-7d2298d6eb9mr1385385a.37.1749137763553;
        Thu, 05 Jun 2025 08:36:03 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d09a0e35absm1282148985a.3.2025.06.05.08.36.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 08:36:03 -0700 (PDT)
Received: from phl-compute-02.internal (phl-compute-02.phl.internal [10.202.2.42])
	by mailfauth.phl.internal (Postfix) with ESMTP id 286FA120006B;
	Thu,  5 Jun 2025 11:36:02 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Thu, 05 Jun 2025 11:36:02 -0400
X-ME-Sender: <xms:YrlBaHtu_hho5oScTaTfmhodnDyiOGmBGmFO_iHAp8fQ9cCCLIF3eA>
    <xme:YrlBaIeo8QZxu-i8-MbphRN8eeP_ZVsAAmXMO2s5e-ibWWih9MfoMklJXOPFUo8BC
    UVpl6non58CUEOoXg>
X-ME-Received: <xmr:YrlBaKxjIngVfVxFBqLQKE4NS8PqWYp59U9bGI2EQinKT5zQEEgh7UtknQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdefkedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvden
    ucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrd
    gtohhmqeenucggtffrrghtthgvrhhnpefhtedvgfdtueekvdekieetieetjeeihedvteeh
    uddujedvkedtkeefgedvvdehtdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuve
    hluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghoqhhunhdo
    mhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedtieegqddujeejke
    ehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfhhigihmvgdrnhgr
    mhgvpdhnsggprhgtphhtthhopedvjedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoh
    eprggtohhurhgsohhtsehnvhhiughirgdrtghomhdprhgtphhtthhopehjghhgseiiihgv
    phgvrdgtrgdprhgtphhtthhopegrsgguihgvlhdrjhgrnhhulhhguhgvsehgmhgrihhlrd
    gtohhmpdhrtghpthhtohepuggrkhhrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehl
    hihuuggvsehrvgguhhgrthdrtghomhdprhgtphhtthhopehojhgvuggrsehkvghrnhgvlh
    drohhrghdprhgtphhtthhopegrlhgvgidrghgrhihnohhrsehgmhgrihhlrdgtohhmpdhr
    tghpthhtohepghgrrhihsehgrghrhihguhhordhnvghtpdhrtghpthhtohepsghjohhrnh
    efpghghhesphhrohhtohhnmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:YrlBaGNkpFuGhk3Q4Y6oZIxqWjN91VHTbAd0_IQw1gc8mC9GW4E_kQ>
    <xmx:YrlBaH90t1hVaZIKzB32csfBVTD68dtkREKtPKxWeBTJe0ofAzbeqg>
    <xmx:YrlBaGVQwaAzmutsVh_ZO-R53DMp-m5sshSu8ZzhbTA5DD3NeoZIVA>
    <xmx:YrlBaIeKQ0YuSAdFg7A51CIjEDlJ-SKt7OZ1PP6kAuzObFkks4Itqg>
    <xmx:YrlBaFcSXGhXfJUEPy2vtT56VpehRRKXMsNDBH4VKy6waqkHCtR6qkht>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 5 Jun 2025 11:36:01 -0400 (EDT)
Date: Thu, 5 Jun 2025 08:35:59 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>,
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
Message-ID: <aEG5X7FduqFvgXxH@Mac.home>
References: <20250528221525.1705117-1-abdiel.janulgue@gmail.com>
 <20250528221525.1705117-2-abdiel.janulgue@gmail.com>
 <20250529004550.GB192517@ziepe.ca>
 <DA9JTYA0EQU8.26M0ZX80FOBWY@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DA9JTYA0EQU8.26M0ZX80FOBWY@nvidia.com>

On Fri, May 30, 2025 at 11:02:02PM +0900, Alexandre Courbot wrote:
> On Thu May 29, 2025 at 9:45 AM JST, Jason Gunthorpe wrote:
> > On Thu, May 29, 2025 at 01:14:05AM +0300, Abdiel Janulgue wrote:
> >> +impl SGEntry<Unmapped> {
> >> +    /// Set this entry to point at a given page.
> >> +    pub fn set_page(&mut self, page: &Page, length: u32, offset: u32) {
> >> +        let c: *mut bindings::scatterlist = self.0.get();
> >> +        // SAFETY: according to the `SGEntry` invariant, the scatterlist pointer is valid.
> >> +        // `Page` invariant also ensures the pointer is valid.
> >> +        unsafe { bindings::sg_set_page(c, page.as_ptr(), length, offset) };
> >> +    }
> >> +}
> >
> > Wrong safety statement. sg_set_page captures the page.as_ptr() inside
> > the C datastructure so the caller must ensure it holds a reference on
> > the page while it is contained within the scatterlist.
> >
> > Which this API doesn't force to happen.
> >
> > Most likely for this to work for rust you have to take a page
> > reference here and ensure the page reference is put back during sg
> > destruction. A typical normal pattern would 'move' the reference from
> > the caller into the scatterlist.
> 
> As Jason mentioned, we need to make sure that the backing pages don't get
> dropped while the `SGTable` is alive. The example provided unfortunately fails
> to do that:
> 
>     let sgt = SGTable::alloc_table(4, GFP_KERNEL)?;
>     let sgt = sgt.init(|iter| {
>         for sg in iter {
>             sg.set_page(&Page::alloc_page(GFP_KERNEL)?, PAGE_SIZE as u32, 0);
>         }
>         Ok(())
>     })?;
> 
> Here the allocated `Page`s are dropped immediately after their address is
> written by `set_page`, giving the device access to memory that may now be used
> for completely different purposes. As long as the `SGTable` exists, the memory
> it points to must not be released or reallocated in any way.
> 

Late to the party, but seems to me the main problem here is that we
cannot pass a reference to .set_page(), note that there is some work
that would change the Rust struct Page from a `*mut page` to a
`page`[0], and then we can impl Ownable[1] and AlwaysRefCounted for
`Page`, if that's done, then I believe the correct parameter for
set_page() would be an ARef<Page>.

The Rust `Page` right now is a owning pointer, which can be only used in
very simple cases. I think it's better that we improve that first.
Another idea is keeping `Page` a `Ownable` type, but wrapping `folio` as
refcounted (i.e. impl AlwaysRefCounted). 

Hmm... after reading more on the following discussion, seems the current
plan is to let SGTable own the pages? That looks reasonable for now, but
one day or another we will need to face this page/folio reference issue.

[0]: https://lore.kernel.org/rust-for-linux/20250202-rust-page-v1-0-e3170d7fe55e@asahilina.net/
[1]: https://lore.kernel.org/rust-for-linux/20250502-unique-ref-v10-0-25de64c0307f@pm.me/

Regards,
Boqun

> To that effect, we could simply store the `Page`s into the `SGTable`, but that
> would cover only one of the many ways they can be constructed. For instance we
> may want to share a `VVec` with a device and this just won't allow doing it.
> 
> So we need a way to keep the provider of the pages alive into the `SGTable`,
> while also having a convenient way to get its list of pages. Here is rough idea
> for doing this, it is very crude and probably not bulletproof but hopefully it
> can constitute a start.
> 
[..]
