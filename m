Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 053472DC76A;
	Thu,  1 May 2025 13:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746105127; cv=none; b=kLfHXWrWZLTVBfvTFpBkcz4cNOn9+sILBhuVPmejKgaMn15oE2aTabI2vzA1GbNO20CVo05GgXzqksYhPMcJPAj96GvlaOqimneYEeYrD6QwG4AB8va7ewy9MAFdUee61BnMXqHrnlTEYdR2FDuftbVtnjxBlAfSLEmGkrOaATE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746105127; c=relaxed/simple;
	bh=lBgcSKuhuZcr/GK3qGzEBiCaQwtN84auX5qoJ944bE0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NoTwaocpej+Tb9etgGMTeggjsMNuN8AOgksBHGzVty5xpjOPfHf5PGa4qtbabBHFeGdcyIr4WtQJeO324JW3kcj2oVA6lD3ujgCU+oy7hw7xCwo+n7R/wsKcnB8yZnjOKUb3LzZdMUCbu6XxHDqEWMLwvJHGv+T5wBJrT1BLHMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fvVbrvZa; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fvVbrvZa"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-477282401b3so12870281cf.1;
        Thu, 01 May 2025 06:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746105125; x=1746709925; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8l/wU+ug1Zz6WtL2nme7APfS/+pOU/6411piaeOda7A=;
        b=fvVbrvZaSbK2e5z2VIPTLgDF5Fqcsg/gh6xeC4VyP6MEPuWazIptnDY8MdcfEn4EVE
         bClJWv6q22g0ihG9ntd+sIIVwCQYnOmULf538tb3WD0klpRSKK6Dg4qfV4RtYnVTGeZJ
         /jBWuSkUldRVBptNBQiy0nxg1khyOQXYeIMdvxgPATp4wpby1EUg0m3ialmmRiiDRY3i
         ODdQjzgpq7ztcXo4NPHYK44Mrrz3tjW3SimdJadX8fUudTpjLc6rzWPTjbbrLqLUYUVI
         AXfMMHfzm+hoga3/6KI7IxFoSzvBIl3gOWq08VPgN9ozjNGW9qjRw51gAAFTnU8hCPdu
         W2KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746105125; x=1746709925;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8l/wU+ug1Zz6WtL2nme7APfS/+pOU/6411piaeOda7A=;
        b=orgyP3bYwQaw3gE+atwa6Hbk7Y6uMG28yjui5+0Ip2r/L/x8mQSWhDOJQ97hyUdmcE
         XiQENINZ5K2CMjtsxkCkrSOW9/VH1QgqUbnfopJlMPI6s1DucDBcwi9NTlqXEKCDbBZ7
         F0HdVmRes/RRU+q4qlOZmI6GKQzL1dbnIhbkOZAW2YBDx8IEoEFPFXhWxjGC1c9Txr/z
         /iwzmGud/1PwnQwEcWveUPCbeDQ7FVFBHm/yv3HyGHLKbjDYVaxmtZr6UrC1XQX7DMx2
         f1Cx3nK7PiTub3r5g+SvrOpajLy0Kk0xcppxU2I6IFRbl+zh2IZFiyU14vGLniRZSumP
         vEkg==
X-Forwarded-Encrypted: i=1; AJvYcCUFUNW/+FEJl64XRK0e/miD8iJpq8lRGIw6TuwI87dXRUaXacfzT+mverYvN1+Q8gxQYxpXTGtCZCzs6mI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyf6iAFpy5EZ3BWKwkzGKvxsV+ueAsnJ3tp4VzI4z+C9aM7o11m
	yQZlQ6Gkzv8zYsdFFeYMcRK0EfhR5uL5yCtdgu+aRVjvJKqdOKtQ
X-Gm-Gg: ASbGnct3LH6F52gDhCGNbh1uOfLYU7naQNAzWKMMKJPbmbM9VXBPC55kPKoIhElpddM
	vLrVOdzbhta6ZqYMPyuhcr78yHExmaAKgAY8PMEUg265jUxGSAzRNejFAsrTsznFauXZRx0RtK7
	mm4TPGaMf4BXBE29H/p6u49hL2lugCsxoBiatNpbhbQcZTO1wLuRPrb7t/BAbXHH2cmLk1VfYtB
	nceud4frTS/hWhDOo9OUzMOgcytrl/pneOKxApHaGJn122mQzTtzy7e+5bFvN13MO1BC8W34Xsn
	z5FzsTLOvfvbz7TxP6unqcr0WBTmmfhSL4qgki6Cznc1/7HjW7+GPbwuGkHm55nLQ2ixxCPLJeL
	I2/fdh1LIKd17jiNxlAHuGnC0A4bPgk8=
X-Google-Smtp-Source: AGHT+IEzwyCrf0++RJq+rmJ7j8QJl3K1F676NcLdy9o7dByfkAZDsByszr0TCaqP+OmxzfILPYJrqg==
X-Received: by 2002:a05:622a:1cc8:b0:477:29f5:53eb with SMTP id d75a77b69052e-48ae714d13amr49189881cf.6.1746105124691;
        Thu, 01 May 2025 06:12:04 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-48b98d0fb2dsm3282541cf.77.2025.05.01.06.12.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 06:12:04 -0700 (PDT)
Received: from phl-compute-02.internal (phl-compute-02.phl.internal [10.202.2.42])
	by mailfauth.phl.internal (Postfix) with ESMTP id BED92120006E;
	Thu,  1 May 2025 09:12:03 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Thu, 01 May 2025 09:12:03 -0400
X-ME-Sender: <xms:I3MTaH0bRQwXYYr4VQ5549P1KF7gjJ2wxs-nURTpQ-MSD7cpTOl7tg>
    <xme:I3MTaGEeUVXCE0INuBTjzMU0pxssPwzSayrfVyRxxI8XbxnBesJp_8PTeK0RwHdFn
    A-GoSRz_dbtFfnyjQ>
X-ME-Received: <xmr:I3MTaH5toUu5NEVDtYrXy5q0fXGu1_fx7vkzgen-dmkoxHaH5vgRu_bV>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvieelieeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddt
    vdenucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrih
    hlrdgtohhmqeenucggtffrrghtthgvrhhnpeehudfgudffffetuedtvdehueevledvhfel
    leeivedtgeeuhfegueevieduffeivdenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
    grmhepmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgr
    lhhithihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsohhquhhnrdhfvghngheppe
    hgmhgrihhlrdgtohhmsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohepvddupdhm
    ohguvgepshhmthhpohhuthdprhgtphhtthhopehfuhhjihhtrgdrthhomhhonhhorhhise
    hgmhgrihhlrdgtohhmpdhrtghpthhtoheprhhushhtqdhfohhrqdhlihhnuhigsehvghgv
    rhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvgh
    gvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprgdrhhhinhgusghorhhgsehsrghm
    shhunhhgrdgtohhmpdhrtghpthhtohepfhhrvgguvghrihgtsehkvghrnhgvlhdrohhrgh
    dprhgtphhtthhopehlhihuuggvsehrvgguhhgrthdrtghomhdprhgtphhtthhopehtghhl
    gieslhhinhhuthhrohhnihigrdguvgdprhgtphhtthhopegrnhhnrgdqmhgrrhhirgeslh
    hinhhuthhrohhnihigrdguvgdprhgtphhtthhopehjshhtuhhlthiisehgohhoghhlvgdr
    tghomh
X-ME-Proxy: <xmx:I3MTaM0-JrWihiPPQyWhs5Y_gAYcTe9I_BsS4eRUhqNCDIkBJdxIiA>
    <xmx:I3MTaKGv9GQSIWU-3-tfy2Sxi6zCqaA1a8OxoRc21ZQ-sR6dfv3_mg>
    <xmx:I3MTaN8JTNnT7VeY2tebZsGBbfQWsEesFTcW_C2Z6RmemDn5AyI5bA>
    <xmx:I3MTaHkfcMQ6cRzBkuthD_0wgR49MOTbECxlBBMZfwHtoYnE0pPu9Q>
    <xmx:I3MTaGHpQFpobMm_08A3WnDeeJIm-EWIvcdLTQyA5Dfmanc1r9axKEe8>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 1 May 2025 09:12:02 -0400 (EDT)
Date: Thu, 1 May 2025 06:12:02 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	a.hindborg@samsung.com, frederic@kernel.org, lyude@redhat.com,
	tglx@linutronix.de, anna-maria@linutronix.de, jstultz@google.com,
	sboyd@kernel.org, ojeda@kernel.org, alex.gaynor@gmail.com,
	gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
	aliceryhl@google.com, tmgross@umich.edu, chrisi.schrefl@gmail.com,
	arnd@arndb.de, linux@armlinux.org.uk
Subject: Re: [PATCH v1] rust: time: Avoid 64-bit integer division
Message-ID: <aBNzIp9UF7GZVYLs@Mac.home>
References: <20250501015818.226376-1-fujita.tomonori@gmail.com>
 <aBNojspyH5dHsuOm@Mac.home>
 <20250501.220717.849589327730222635.fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250501.220717.849589327730222635.fujita.tomonori@gmail.com>

On Thu, May 01, 2025 at 10:07:17PM +0900, FUJITA Tomonori wrote:
> On Thu, 1 May 2025 05:26:54 -0700
> Boqun Feng <boqun.feng@gmail.com> wrote:
> 
> > On Thu, May 01, 2025 at 10:58:18AM +0900, FUJITA Tomonori wrote:
> >> Avoid 64-bit integer division that 32-bit architectures don't
> >> implement generally. This uses ktime_to_ms() and ktime_to_us()
> >> instead.
> >> 
> >> The timer abstraction needs i64 / u32 division so C's div_s64() can be
> >> used but ktime_to_ms() and ktime_to_us() provide a simpler solution
> >> for this timer abstraction problem. On some architectures, there is
> >> room to optimize the implementation of them, but such optimization can
> >> be done if and when it becomes necessary.
> >> 
> > 
> > Nacked-by: Boqun Feng <boqun.feng@gmail.com>
> > 
> > As I said a few times, we should rely on compiler's optimization when
> > available, i.e. it's a problem that ARM compiler doesn't have this
> > optimization, don't punish other architecture of no reason.
> 
> Did you mean that we should do something like the following?
> 

Yes, or

	#[cfg(CONFIG_ARM)]
	fn ns_to_ms(ns: i64) -> i64 {
	    // SAFETY: It is always safe to call `ktime_to_ms()` with any value.
	    unsafe { bindings::ktime_to_ms(self.nanos) }
	}

	#[cfg(not(CONFIG_ARM))]
	fn ns_to_ms(ns: i64) -> i64 {
	    self.as_nanos() / NSEC_PER_MSEC
	}

	pub fn as_millis(self) -> i64 {
	    ns_to_ms(self.as_nanos())
	}

Regards,
Boqun

> pub fn as_millis(self) -> i64 {
>     #[cfg(CONFIG_ARM)]
>     {
>         // SAFETY: It is always safe to call `ktime_to_ms()` with any value.
>         unsafe { bindings::ktime_to_ms(self.nanos) }
>     }
>     #[cfg(not(CONFIG_ARM))]
>     {
>         self.as_nanos() / NSEC_PER_MSEC
>     }
> }
> 
