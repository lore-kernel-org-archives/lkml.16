Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B08F76034;
	Thu, 19 Jun 2025 20:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750366266; cv=none; b=eMPHeoKlYdW+6NjIztxCt+lsx9u3SOJheNF/uQisbOHPU7DI/9I5llOFMLXMDD5Ed5b7yo27OunhZjYVmLk1yVZz3vh64VrUoc2cccIt8XTFo5fxx7LBa8cmunr49L8W2riSM8ebFJRTeqBNlWb8Pbhg3jPfilmlKzVBHX8RNR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750366266; c=relaxed/simple;
	bh=cbm58TqtYsDX9lqvqwL+QafrlMaAUoCRvCL9RYDAqng=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HfgjkgpnNODwXAAji6IY1WqAZerLnJO2tRCUGeHdC62uSlP0GPUBWwAaaTPPrDOvb1dfDrPv5mfX6GpEZenul/wQUkSphHz7dSuqXwknLc941WhV2exRlLqi0lDzR0G5+t3Jo8cziEmjXSDysUn8VpBy0wwOOdNyAy1hq1PSewE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WI1H8PN6; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WI1H8PN6"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-4a5840ec53dso13684541cf.0;
        Thu, 19 Jun 2025 13:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750366263; x=1750971063; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9eKUBV92GVHOgHIjluUIsKurBz2GgvQDDr38ajbvjd8=;
        b=WI1H8PN6h3zoaCKVglqfMxi9lVmfb0iqZS4m6qM2CSdRsx4Qf9JI1Ey4ayECuNNl/Y
         35RPXMJmBOSVgQZjvcc/Gxc/JNWdIIn+ONgLE7fb06LSvTIQCC2QMCVmd5tZMIgkscdS
         hQafk1TkGKTXJdVeZfTv2WQZUym3qT1qw+0wZ8QS4Br2wWSptO+4qprN+GacWveh3owc
         FTyTNf+kl9bbANafcMFIDczxO4p9aXNi5GUiD+qS6KhPBUMBXP53elehOIOGQ9z7ggJs
         r+cyyJwDGTF8gWFlJAehR2feQpGg0WvcocQdwHrhjP4Q1bv/MvRpxxtp2cz4CKmsd1xR
         z/EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750366263; x=1750971063;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9eKUBV92GVHOgHIjluUIsKurBz2GgvQDDr38ajbvjd8=;
        b=KXHa9D3AnySePdMjjO5fUXh4l+waEuiNtUbe6NRoIyYegCBh5wgW3+eAt+cIg29PhF
         XFHJPBhKpmofP5S/7pyH/1qL4U1CtKE2tQp27buN3cDLVlKFNeHTRKFjJUwcZgtJi5pp
         Ra/E50LFiTswITBKuce8E/4tCGAtK0fL7P0fuiklHfZtLlvsbr/iBlNdd4TQkoPw1NEZ
         dn0Hg7PEiFaqCy85FKtUBij+vs8XPwfEK7epYtYPmjobBsOVkLO02ZE3sLVajiNQ83Da
         zBaX1hXHBGLqUDCgMRNNrouTyilR93vqEU1tP6auLxjogC0jk0m71Rw2wNbouTdbkt3i
         wigg==
X-Forwarded-Encrypted: i=1; AJvYcCXlyRTFyLRNi+GGqJqqgpi1zjOPWo4w7ASoC04NBVwwi2r1KRGZDj+uRvueIaEqay+1wsU6CrUCwecWTOqdrQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwV3Pr8qLFIopF3HhrfpkFBQK7z/GF2dPJTeqr7+wcObQ4l2Qao
	O2+sJ4LJDP0bj49sRVwhf8/CDTO4yeV0zB3YrWqyOfn0nlZNgNuZUr1w
X-Gm-Gg: ASbGnctb3jH3N73veMyKNv7qDB60+enPrUiaHi7PJwLcLmC1mE56GNtA+7pxIRr4HCZ
	anfXhM6BAPEaKoVnFb9U/E1Z0exBkuww8yLz5Dr3L2JmFc5+aqJNtAsQnC7St6SkvZUKrPCHLuO
	xsaJxLwr3UyRq7Juub1T2KnndIxCKEex8RQgULpxoxFOqGx/hVwBKCFGIF0Nfdr4VtS53g2SBSm
	HcuDhVDMQ1/7sgEDO2hsOq/m0/P3kUdQJCj3Zo0EJAyI+97sdmVgo4p8z5Pr97nlZ2R42rCedLt
	16v0TNwwKiB3VCR1CUUoDtJluG1YkOBji7AJ3Vxq8WaD2WSFJhcwbPrEwC7MbvPTfpmPJTDsP1+
	QcaXF/i/i4ywKPcRdXFKw/xnZgb32b1piwm5EJAkmGwfZ1DELFTgi
X-Google-Smtp-Source: AGHT+IHj+n7cODPhyEBTVo2DIgXtIOWR14iesQEAN/wzZotw2ATPGinLiwyWkdk94vl9J6lvLquFCw==
X-Received: by 2002:a05:622a:255:b0:4a7:634e:f6ef with SMTP id d75a77b69052e-4a77a292e95mr7970681cf.52.1750366263295;
        Thu, 19 Jun 2025 13:51:03 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a77a089e68sm1798191cf.79.2025.06.19.13.51.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 13:51:02 -0700 (PDT)
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 386F11200068;
	Thu, 19 Jun 2025 16:51:02 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Thu, 19 Jun 2025 16:51:02 -0400
X-ME-Sender: <xms:NnhUaIQnU07k6VBlNK_mDaq5p5cWx3R89PA8PgACcqr1T52LlaqSbw>
    <xme:NnhUaFyHjjxSLtmdwnis4oPhJjzFJgcPLabI_blD0KamiCTHo4ghQqyEfX6tRxoBY
    tK0PSwKxZHsS9gp2w>
X-ME-Received: <xmr:NnhUaF2ifF5pmT16rUuv-dR0Qf7kH2M-TV5dQT78w2WivFJt8zraLy27rxk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdeihedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucenucfjughrpeffhffvvefukfhfgggtugfgjgesthekredttd
    dtjeenucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgr
    ihhlrdgtohhmqeenucggtffrrghtthgvrhhnpeejhfeikeekffejgeegueevffdtgeefud
    etleegjeelvdffteeihfelfeehvdegkeenucffohhmrghinhepkhgvrhhnvghlrdhorhhg
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghoqh
    hunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedtieegqddu
    jeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfhhigihmvg
    drnhgrmhgvpdhnsggprhgtphhtthhopedviedpmhhouggvpehsmhhtphhouhhtpdhrtghp
    thhtohepmhhighhuvghlrdhojhgvuggrrdhsrghnughonhhishesghhmrghilhdrtghomh
    dprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhr
    ghdprhgtphhtthhopehruhhsthdqfhhorhdqlhhinhhugiesvhhgvghrrdhkvghrnhgvlh
    drohhrghdprhgtphhtthhopehojhgvuggrsehkvghrnhgvlhdrohhrghdprhgtphhtthho
    pegrlhgvgidrghgrhihnohhrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepghgrrhihse
    hgrghrhihguhhordhnvghtpdhrtghpthhtohepsghjohhrnhefpghghhesphhrohhtohhn
    mhgrihhlrdgtohhmpdhrtghpthhtohepsggvnhhnohdrlhhoshhsihhnsehprhhothhonh
    drmhgvpdhrtghpthhtoheprgdrhhhinhgusghorhhgsehsrghmshhunhhgrdgtohhm
X-ME-Proxy: <xmx:NnhUaMAbkM0c9Um92XAoZvsguM0CscQg2_RrxUFlOK5i51gDtU7GyQ>
    <xmx:NnhUaBgVjlCs6nIX-EGugjcWXn_QrgEgsJZwrEk43TtkZs-KKf7rtw>
    <xmx:NnhUaIonebbNBWLwthXZl8ahXHCTpNLwc0Qt8echaHNkZsaTamgs9Q>
    <xmx:NnhUaEhj8RxJA2Kxt84Ik5KuY2_jaQkyUKe5X7t2LYrRnABiQ7hVfQ>
    <xmx:NnhUaITCCjHv1d_G-LQ2ZSg9kVBoKkUI14KCIq2CG0BtVx0MfWOPR-zv>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 19 Jun 2025 16:51:01 -0400 (EDT)
Date: Thu, 19 Jun 2025 13:51:00 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	ojeda@kernel.org, alex.gaynor@gmail.com, gary@garyguo.net,
	bjorn3_gh@protonmail.com, benno.lossin@proton.me,
	a.hindborg@samsung.com, aliceryhl@google.com, tmgross@umich.edu,
	dakr@kernel.org, mingo@redhat.com, peterz@infradead.org,
	juri.lelli@redhat.com, vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
	mgorman@suse.de, vschneid@redhat.com, pmladek@suse.com,
	fujita.tomonori@gmail.com, mingo@kernel.org, tamird@gmail.com
Subject: Re: [PATCH v4 1/2] rust: Introduce file_from_location()
Message-ID: <aFR4NHiCvvFxvP1D@tardis.local>
References: <20250619151007.61767-1-boqun.feng@gmail.com>
 <20250619151007.61767-2-boqun.feng@gmail.com>
 <CANiq72n7d89aHiM2fcHnEUE+9=0zyEAFmBoURi4O02w-isSiKw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72n7d89aHiM2fcHnEUE+9=0zyEAFmBoURi4O02w-isSiKw@mail.gmail.com>

On Thu, Jun 19, 2025 at 10:42:44PM +0200, Miguel Ojeda wrote:
> On Thu, Jun 19, 2025 at 5:10 PM Boqun Feng <boqun.feng@gmail.com> wrote:
> >
> > +///     // - A path like "rust/kernel/example.rs" if file_with_nul() available.
> 
> "is available."
> 

Fixed.

> > +pub fn file_from_location<'a>(_loc: &'a core::panic::Location<'a>) -> &'a core::ffi::CStr {
> > +    #[cfg(CONFIG_RUSTC_HAS_FILE_WITH_NUL)]
> > +    { _loc.file_with_nul() }
> > +
> > +    #[cfg(not(CONFIG_RUSTC_HAS_FILE_WITH_NUL))]
> > +    { c"<Location::file_with_nul() not supported>" }
> > +}
> 
> If a `let _` works, then it may be better -- please see a similar case at:
> 
>     https://lore.kernel.org/rust-for-linux/CANiq72=ph_XG0TtkdsNJCUZMiAMYBo11eJaCTLCTpTAFXtcNMA@mail.gmail.com/
> 

Make sense, applied.

> The new version looks great, thanks!
> 

Thanks! I pushed the updated version at:

	https://git.kernel.org/pub/scm/linux/kernel/git/boqun/linux.git/log/?h=rust-sched-v2

"-v2" because it's going to be a v2 of the pull request.

Regards,
Boqun

> Cheers,
> Miguel
