Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E044262FE4;
	Thu,  1 May 2025 23:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746140624; cv=none; b=OOrmzivOMOKPJCr5phiEc5C8cOl0ZoZGC4cxuRzGqYv9RpS6fBQG1flupE0xpk+qh2mN8sunapVd8IxJbkbSiSKG0p904n+dh+VcaOhuub164VHnaOl2gUlZIIlkzdqSStY1aTTHIG6OTY5P2UjKrFPR0f81v6t7w9v7y52D6ZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746140624; c=relaxed/simple;
	bh=3MmCwbr9hZMwZDnncoyMzN/RG0XMgEYiKW+C4A3wL3c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oDjI7e+8xQisqL2M3SM1yxH17GPqG1NTs3WTMNvIrujxtmDzm9KKQJo8HAKo+Lj6TGI4AFnzMxbQOXvuuZ4bTQJ0Ey9SdpkT5Oe/2V52YFr4fC8M+yBgRUY2LZQHXgj/CYs/Yx+h9k8ZWXr/8tN8y79jeANVMwTY6zWnHFliN+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a1eTcK8e; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a1eTcK8e"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-47664364628so17659101cf.1;
        Thu, 01 May 2025 16:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746140622; x=1746745422; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HRYQm8KkeXJnAoHO3Ql9+7NuEh+cViypLCBplpx9IJg=;
        b=a1eTcK8eb+PWPg+kgeWNRZTdnaX9CUREFLaxoRhhHnIg/c0RVlCdq91OJfdyIEn4t6
         vJ0ryv4EfId+87pY4TEHsxlnMKNrZHiFy/mDc5ifvYyaYBlsxBGaErM7HKWae8dnsuck
         3L+viSr/w5QBghJ6iKSXD+IyzOWNcIaHjN7fDLhTxr6qYrw+XYhRgFLwzGIeLdoRvvEB
         lhlpj6Euk2LjTbYPkr4x4KuqEHxHRKheXiJU78vI9Z8fUR2qVG0Ix7SDFGwoyUvYbMC7
         phNqvRPYjoIzkCEjNifo/JP5oBsP2keFkauA9a/aNh0DzJFmCFZVc+r2V+rwKHKMms1V
         b4Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746140622; x=1746745422;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HRYQm8KkeXJnAoHO3Ql9+7NuEh+cViypLCBplpx9IJg=;
        b=VtQwaJDTdEY6+VgUFQ9PVTROdTqfysDxRGTw1c0IUE8lSicifQ6s5g/UGQAwKta2B+
         JgQxixK6o+Ag4FIqnJRn2R9O0BUXWMy2Y8Pd5It2vAuWNWWZ/SBOo4TpXId7pSEuMo6f
         20uILslVfJzw7BSZluvwBfN/QCEAyEpZYjS8WwU9A6lGGUzxHzyNut2amIHbE/bsmC3Z
         pKMPLVV/DtF07Meut+V/qHvH9R5dhr43XT2KQGgs3VnHHB2PqDbet3yUawtJsS3ajApF
         cIm5ptYnH6s0Vg0hO8MO4WwYvzicUthXOpgmGXPuLrd4m4gJoDzQhmDfpHnMvjHtKp83
         84wQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9WjHth8XKLL0CE0TLIqDP0Q/Op2Dx3RnEW3oc6k7fpA5ITGn8tEXRLu0hKNRJXVPhd7FUIOl/MFpi3bk+uLg=@vger.kernel.org, AJvYcCXQU7p8/p+tX8bPTjTmeG1XUdHwoIBHAeF40VbVIm/7MSw2O1z9mHQQO3L48rZ1aajCMHw8s5ceowdmc+g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxzq2m+Yu8pXdScg/ryOzqrsZ+KkbmcVsHB45ngoBCee1lwIttH
	4wStO+r4+Lbi0Msdwz06/MCU1GHNW0aeFJkIJLvugQYPyTkLtQ6s
X-Gm-Gg: ASbGncvQV/S/XHWP0gCVD+To60vZGOtBFNFGDNCas1Wcl4e1T+6TvjsdCYTuV+cR9cT
	vIJKgTljwR0MdqfGNA1W8N//qwObhIe5zNILeXBKagmiBky8v7lMh0jLQZYKSqsK60wdyWz9YI4
	Os6YC+RERkt8s8avYJqzvIqKV+AwtKJoN32m+mOI52SobdRbOpp119zECZKzZWQlxK+aoX0gEXT
	CBPhXrT6m+LIZmhsjoiboJodjCRkBglODgNk0l+bwPHtrdLqPcy/xEp8t1xwy0JQmEFMgeO3HZg
	WByQO+SZet3FD9XtkOl1503zeV5Wkny5X6O+TKOffeNfhjT9JaHZq9midtoxa0OR5DomXIR3bdT
	hG6qA7w9rWbAiIA4WsRBxzJkWYzuzN8w=
X-Google-Smtp-Source: AGHT+IGeQYINgSiuj9MExDiagzanVfMGfm2vYpMms9YEMbg7e5WF1UWNjSYsdL+EpezN3zRAcMgi9g==
X-Received: by 2002:a05:622a:5884:b0:471:fc73:b656 with SMTP id d75a77b69052e-48b1aa581b6mr62100351cf.12.1746140621825;
        Thu, 01 May 2025 16:03:41 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-48b987209f1sm9736091cf.52.2025.05.01.16.03.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 16:03:41 -0700 (PDT)
Received: from phl-compute-11.internal (phl-compute-11.phl.internal [10.202.2.51])
	by mailfauth.phl.internal (Postfix) with ESMTP id B451A1200043;
	Thu,  1 May 2025 19:03:40 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-11.internal (MEProxy); Thu, 01 May 2025 19:03:40 -0400
X-ME-Sender: <xms:zP0TaHqF_4E1Srlb4d2YlgyIsz7cui8lXRnYr35dJm6qhAzUpaXsDA>
    <xme:zP0TaBqNJQwuHCAapdnVtKiUySQtyqxXgWG5WkmkB-ETngH11qjvDNQ367KrWHt4T
    KPteE4bsdRyCDqBGg>
X-ME-Received: <xmr:zP0TaEPIGoDBZcSqzbt898VrSwUx5z-ATeIQt7L9BLdQiohpluJ67CZY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvjedtkeehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddt
    vdenucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrih
    hlrdgtohhmqeenucggtffrrghtthgvrhhnpeehudfgudffffetuedtvdehueevledvhfel
    leeivedtgeeuhfegueevieduffeivdenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
    grmhepmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgr
    lhhithihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsohhquhhnrdhfvghngheppe
    hgmhgrihhlrdgtohhmsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohepvddupdhm
    ohguvgepshhmthhpohhuthdprhgtphhtthhopegrrhhnugesrghrnhgusgdruggvpdhrtg
    hpthhtohepfhhujhhithgrrdhtohhmohhnohhrihesghhmrghilhdrtghomhdprhgtphht
    thhopehruhhsthdqfhhorhdqlhhinhhugiesvhhgvghrrdhkvghrnhgvlhdrohhrghdprh
    gtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdp
    rhgtphhtthhopegrrdhhihhnuggsohhrghesshgrmhhsuhhnghdrtghomhdprhgtphhtth
    hopehfrhgvuggvrhhitgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhihuhguvges
    rhgvughhrghtrdgtohhmpdhrtghpthhtohepthhglhigsehlihhnuhhtrhhonhhigidrug
    gvpdhrtghpthhtoheprghnnhgrqdhmrghrihgrsehlihhnuhhtrhhonhhigidruggv
X-ME-Proxy: <xmx:zP0TaK7i-peov85ysTE54F4cZJgvYXmjQU8UckHtwO_m8d5388If9Q>
    <xmx:zP0TaG6cJjaDxmCgnu3aCDdND0Bk2N2QiIjAwf3W_zPqu5VjsuRTmw>
    <xmx:zP0TaCgLStn69s7HZtZGdVtOPdFIyqevuveHfddN3PhFkLTf0XRzSQ>
    <xmx:zP0TaI5BCnb_Ya9ltCIiJyawOGQCujlcrtGf4kZfdBWhHx-vcOoJkQ>
    <xmx:zP0TaFJK3BQpaOF2BxLzzxE8qoOEIMUQxbCyD8GTC5zXl8NyaaaULhH9>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 1 May 2025 19:03:39 -0400 (EDT)
Date: Thu, 1 May 2025 16:03:38 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Lyude Paul <lyude@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
	Anna-Maria Gleixner <anna-maria@linutronix.de>,
	John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Christian Schrefl <chrisi.schrefl@gmail.com>,
	Russell King <linux@armlinux.org.uk>
Subject: Re: [PATCH v1] rust: time: Avoid 64-bit integer division
Message-ID: <aBP9yvWnB66qJeRh@Mac.home>
References: <20250501015818.226376-1-fujita.tomonori@gmail.com>
 <aBNojspyH5dHsuOm@Mac.home>
 <20250501.220717.849589327730222635.fujita.tomonori@gmail.com>
 <aBNzIp9UF7GZVYLs@Mac.home>
 <aBN1BzCawU0a9Nx9@Mac.home>
 <cbbeca76-7a7a-425b-9cdd-8da778b6d8a1@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cbbeca76-7a7a-425b-9cdd-8da778b6d8a1@app.fastmail.com>

On Thu, May 01, 2025 at 05:11:44PM +0200, Arnd Bergmann wrote:
> On Thu, May 1, 2025, at 15:20, Boqun Feng wrote:
> > On Thu, May 01, 2025 at 06:12:02AM -0700, Boqun Feng wrote:
> >> On Thu, May 01, 2025 at 10:07:17PM +0900, FUJITA Tomonori wrote:
> >> > On Thu, 1 May 2025 05:26:54 -0700
> >> > Boqun Feng <boqun.feng@gmail.com> wrote:
> >> > 
> >> > > On Thu, May 01, 2025 at 10:58:18AM +0900, FUJITA Tomonori wrote:
> >> > >> Avoid 64-bit integer division that 32-bit architectures don't
> >> > >> implement generally. This uses ktime_to_ms() and ktime_to_us()
> >> > >> instead.
> >> > >> 
> >> > >> The timer abstraction needs i64 / u32 division so C's div_s64() can be
> >> > >> used but ktime_to_ms() and ktime_to_us() provide a simpler solution
> >> > >> for this timer abstraction problem. On some architectures, there is
> >> > >> room to optimize the implementation of them, but such optimization can
> >> > >> be done if and when it becomes necessary.
> >> > >> 
> >> > > 
> >> > > Nacked-by: Boqun Feng <boqun.feng@gmail.com>
> >> > > 
> >> > > As I said a few times, we should rely on compiler's optimization when
> >> > > available, i.e. it's a problem that ARM compiler doesn't have this
> >> > > optimization, don't punish other architecture of no reason.
> 
> What is Arm specific here? I'm not aware of the compiler doing anything

Because Arm is the only 32bit architecture that selects CONFIG_HAVE_RUST
for non-UML cases, i.e. this is the only 32bit architecture that has
this problem. If your point is we should do this for all 32bit
architectures, then I won't disagree. Just s/CONFIG_ARM/CONFIG_32BIT
then.

Regards,
Boqun

> different from the other 32-bit architectures, though most are missing
> an optimized __arch_xprod_64() and fall back to slightly worse code
> from the asm-generic version.
> 
> > Copy-paste errors:
> >
> > 	    unsafe { bindings::ktime_to_ms(ns) }
> >
> >> 	}
> >> 
> >> 	#[cfg(not(CONFIG_ARM))]
> >> 	fn ns_to_ms(ns: i64) -> i64 {
> >> 	    self.as_nanos() / NSEC_PER_MSEC
> >
> > 	    ns / NSEC_PER_MSEC
> 
> I'm sure this is still broken on all 32-bit targets.
> 
>      Arnd
