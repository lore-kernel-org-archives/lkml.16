Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E11B2D600;
	Thu,  1 May 2025 13:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746105613; cv=none; b=jU5evzMaPawtWh4SeB3tMdB0Pexwlu2HNJSR56Ya6Ael06baPSX+8gC8xgLbsby1osHar3ABJgYu3xQbOG9UTMNxGGfMk1oK9zgMoV9sq+Ztvke3Ewpw3zZN4hUqVG5bU+i4Uro+eHjo+ilYRYflgtx0CE9XikNurdmmtksS2rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746105613; c=relaxed/simple;
	bh=VLUKLn7c1WpY4kNTLzknz6WGPeSID+cdkIodFa/KDh0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ooZqlIzVKF60/Z6o+Ydn4odfYuMTghk4aDGJBJkXHjXvoQc7VHGhODh9T6K/7gSYZnXxMz1GjlLYsImk1gp4X3peFYpdSJMdhTC8pnLX2JWM4w721MEMGIqXs9XisXEycqLk/E58Alk3pVNWtHJQBplAkT+HPbfvJNQe/874Szc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L9lteqYQ; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L9lteqYQ"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6ecfc7fb2aaso10424016d6.0;
        Thu, 01 May 2025 06:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746105610; x=1746710410; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=35/Aq+HW5pP42V9Osf09JuVeGNHfbBMIMpQ9Du4GABI=;
        b=L9lteqYQYpv1t6uBPnDGTKeWPJAlyV4jxk7NGiDeUC/0wmAxJv1teL+wP7euj431mI
         sjZIralD+Ge9Hl4sgw4x7tA1iqexJF7xiwUbrUkAlPMFnpOcV9YySjszxbti+OjFAV5k
         dQaNw4oEkLfzpJ24cbLJvE9VVcG5pWPETkNmLJN8qlY2ra5G9El1qXhIr/tea2r/WHl9
         WdsLDQvR6EkmgA3x57l1MCLfQjKhJ+li/dQkL3xwusfWZbqA4PJNGg2Uy/zFo9vJyfsS
         lzbyy0T+sii6aZJILlmViDti11irij4No3KMtaK6GkeYxHQn8y5wihTEYMSP5xKjJQUV
         ZmDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746105610; x=1746710410;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=35/Aq+HW5pP42V9Osf09JuVeGNHfbBMIMpQ9Du4GABI=;
        b=di9p3VYBc2LosGVip9AGNKJvp5GWJlpM2Hu9wThy69IC+C3pR6xd5qWvEqb9BkWoJA
         S52c761N2XgyzHS/J4xqNJ2Up7TRdsi0dPT33f30JAy63x05vgnrOmwCgHykXuEjbmjw
         ZPdH3ZiH6VOnmeRKBpYZopfVaPcG9kkBSA7abuMloK4GFNC+lAzBzsI1Ja4Y6BgGwXWQ
         BS1h1m/3lgm2vh9/gOfYz1/Y9WTOU8ecstypYww2PHFC582mzwua5TylXfKxFFZbOgic
         noWeAyCPVMvuDeH17dn/FEYAr7V0vO+Noa2d6L6teeK4Jm3pdzNpgCQdkkD4ZJVHRS6N
         VA9Q==
X-Forwarded-Encrypted: i=1; AJvYcCXu2Y/50AFnQ8ii74mmebJroumvCP7E+u4WoueSdVt1+Skmx4DI790dxzIvKT2+2+JB5fktcmIss7LX18E=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDmdQz1QXBwxzGKPNezd0/qzrRHRjog+h8jje848Ca5qRfqROO
	a+jkGgJ6hfN3GNwGxDObIgnR7YB3cqPhPCmoB3qrAdvC1etidrwm
X-Gm-Gg: ASbGncv5jP9b6uYLYrtY4m2pUFuxYMvztv1gU4cDfpzGF2dK1mV2DeZcPPYarQIjpcq
	LH+dhfw6qLpTaCDjDHI1OatmRPeDtxjLNl65QC86j1CmHgEtb6JfcfCdvOXtChr4r2YiM4kkhlZ
	cQHnacDhmAEiSsvs4hcb5dH/E8750iUWg98we4P2Sjqg2dugp6TqI1MEaeAIWpFrK7Icsbr+D6q
	helopvmh4bCMrfErna4N3seJbx62NVHVBgcOQhjgFhR2EPANULgIiCG0iBZwmR65Z47RlK+fbq4
	MTGn08PFh1R3E9YQ54BbzwkYYNKF9+gcXNxz0uOL6LH4naSNzNPSr2aqR5m1asb/pcYOQCA+1sM
	kloxeTIKf/qDVMDNjFaLlMRpkERYZ65E=
X-Google-Smtp-Source: AGHT+IEgg/gas8TeOe54nwXA8lA8IKWg+gP2/wqAq9ENtcZGe+3obuDAdo5t8k4LAMFGT0DSAcIumg==
X-Received: by 2002:a05:6214:2a4e:b0:6f4:cbcf:5d46 with SMTP id 6a1803df08f44-6f50a949431mr40493796d6.20.1746105610256;
        Thu, 01 May 2025 06:20:10 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f50f480e59sm4158956d6.98.2025.05.01.06.20.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 06:20:09 -0700 (PDT)
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 36A351200043;
	Thu,  1 May 2025 09:20:09 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Thu, 01 May 2025 09:20:09 -0400
X-ME-Sender: <xms:CXUTaOVp0ESVLi-MwxUdY8PFq56weHti2459rIiZwkCugI8XAOufTg>
    <xme:CXUTaKnw8ghU5PtaRWIR4XYZiRYzPToXbIUb4yJVmkgDD4kQ3mt59YSRuWtz-HdgJ
    dlSm_cZjrAjikeVdQ>
X-ME-Received: <xmr:CXUTaCam1HRJgpqjJqecoo1Pa8iJJWbZCIgaOco9mdLx-6PUNqmfMiso>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvieelieekucetufdoteggodetrf
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
X-ME-Proxy: <xmx:CXUTaFVOvC85z66NOKDoSd7C3Pre21n8k5dygbsN8W4lxZx2kE45DA>
    <xmx:CXUTaIl8Larsn9iSg5f_DEnue0_OftKMkAAj39LYYJG6KGM8ycDnww>
    <xmx:CXUTaKe4c3BWZP8fjQgkdr_0Qvkvy4exuXZS4jBeXY0oMmgHYvaSfg>
    <xmx:CXUTaKE6vVde1dO5EBgqBI7ja4zuEPY7OGayB61g73BIeQmigg_SqA>
    <xmx:CXUTaGlpWxF7j_rLoZ5WYY7lcigKin7I4amR9hAnRLaqfoRKuk2DvjjI>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 1 May 2025 09:20:08 -0400 (EDT)
Date: Thu, 1 May 2025 06:20:07 -0700
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
Message-ID: <aBN1BzCawU0a9Nx9@Mac.home>
References: <20250501015818.226376-1-fujita.tomonori@gmail.com>
 <aBNojspyH5dHsuOm@Mac.home>
 <20250501.220717.849589327730222635.fujita.tomonori@gmail.com>
 <aBNzIp9UF7GZVYLs@Mac.home>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBNzIp9UF7GZVYLs@Mac.home>

On Thu, May 01, 2025 at 06:12:02AM -0700, Boqun Feng wrote:
> On Thu, May 01, 2025 at 10:07:17PM +0900, FUJITA Tomonori wrote:
> > On Thu, 1 May 2025 05:26:54 -0700
> > Boqun Feng <boqun.feng@gmail.com> wrote:
> > 
> > > On Thu, May 01, 2025 at 10:58:18AM +0900, FUJITA Tomonori wrote:
> > >> Avoid 64-bit integer division that 32-bit architectures don't
> > >> implement generally. This uses ktime_to_ms() and ktime_to_us()
> > >> instead.
> > >> 
> > >> The timer abstraction needs i64 / u32 division so C's div_s64() can be
> > >> used but ktime_to_ms() and ktime_to_us() provide a simpler solution
> > >> for this timer abstraction problem. On some architectures, there is
> > >> room to optimize the implementation of them, but such optimization can
> > >> be done if and when it becomes necessary.
> > >> 
> > > 
> > > Nacked-by: Boqun Feng <boqun.feng@gmail.com>
> > > 
> > > As I said a few times, we should rely on compiler's optimization when
> > > available, i.e. it's a problem that ARM compiler doesn't have this
> > > optimization, don't punish other architecture of no reason.
> > 
> > Did you mean that we should do something like the following?
> > 
> 
> Yes, or
> 
> 	#[cfg(CONFIG_ARM)]
> 	fn ns_to_ms(ns: i64) -> i64 {
> 	    // SAFETY: It is always safe to call `ktime_to_ms()` with any value.
> 	    unsafe { bindings::ktime_to_ms(self.nanos) }

Copy-paste errors:

	    unsafe { bindings::ktime_to_ms(ns) }

> 	}
> 
> 	#[cfg(not(CONFIG_ARM))]
> 	fn ns_to_ms(ns: i64) -> i64 {
> 	    self.as_nanos() / NSEC_PER_MSEC

	    ns / NSEC_PER_MSEC

;-)

Regards,
Boqun

> 	}
> 
> 	pub fn as_millis(self) -> i64 {
> 	    ns_to_ms(self.as_nanos())
> 	}
> 
> Regards,
> Boqun
> 
> > pub fn as_millis(self) -> i64 {
> >     #[cfg(CONFIG_ARM)]
> >     {
> >         // SAFETY: It is always safe to call `ktime_to_ms()` with any value.
> >         unsafe { bindings::ktime_to_ms(self.nanos) }
> >     }
> >     #[cfg(not(CONFIG_ARM))]
> >     {
> >         self.as_nanos() / NSEC_PER_MSEC
> >     }
> > }
> > 
> 
