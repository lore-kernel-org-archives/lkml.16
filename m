Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15E9F20C464;
	Mon,  3 Feb 2025 14:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738593010; cv=none; b=mcsDW3YR1VuujqSlNdbZhReQGd3RVxNl6RBgOStZkLSZa4YnfBzR9WO9ki9rVSv4v8vRoBdDSTwk3hEZhrc/V/MriuONmJkNTBBLKxba9dnAlkmVId6cBvWM2w3jwOJq/dkZCFnsNXsRa5ZTZNiHljzt80GCjMTYjdYc+0ukCnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738593010; c=relaxed/simple;
	bh=8XzsPEpsyRGi4YWX6B3V+OvrOKb/YV2WMYuZ6HuSEmc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=heJ9W8YCJaOyaDjx9lehgY19XGq42/R5Mci4tJ63oe7Blj+aod0Xe9sEk39bIwJPkY+3x3KOT3Xq/5nO546ENGCNb7yR3QybKBLqgBHIQhc9x0jfNcNv9smAFcAtXE3yTVAjoT7kSBETItbPKGAoSGwbNViCxEL9JOlc5vGQ+pA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hisHXZ2p; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hisHXZ2p"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7bcf32a6582so396491985a.1;
        Mon, 03 Feb 2025 06:30:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738593008; x=1739197808; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KrGivRpKLfJH6uYF5e+fC19rCHtdF/k+KlI9NRXVfRc=;
        b=hisHXZ2pQV6TeDu58UGVqblM2Kx/JBJOURnEwk7ppgLuN6dfAXic63ldtoe/oDzxMX
         oc2xJSVazNyYlOwuvoqGb1YyKO9ovDmqIW3ipDyQucKeohVCQP0Rvd1bBJ0l38tBc64V
         vmxkXWReUYxBybJFLnlPsnU2UfibRh/mua8M70usjwagWghbs1jT5ruoPS/RVjhlNxP3
         JNyv+9kJXUWqtnCQLG6aGqm7s6lxTDH1IJCOi44Jq7CUASMTmRl8ePI8wtGtSGSsJnei
         lhwy9Fs+vGXJ/nKJ8mVKsArYM1nM7Gw0w8VZ7Vqjci+8tjrk3HXv9bXeC5klpyazUAKo
         /bsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738593008; x=1739197808;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KrGivRpKLfJH6uYF5e+fC19rCHtdF/k+KlI9NRXVfRc=;
        b=Pd7xznBsZNkARMzaZ9nFNFYYQhH3GpfrPckVK3o65vHEE5aGcdwt2oiOmHuXjKLJz4
         jCb+hmF9Do4vyiZEh/IZzmg1ZtL4vxP8XhayL67DiGUjv+STycCUxpGWZilXgD3U/Jaj
         EpDcfrMCQcsTGkLPAQfIQTaWF4B4cLV46LFFkjBV88GGz7DsI1/KqDJ8gDf9YBErCs2+
         H2dyi8Rpkbge+UEpc1u6AcRXFTQyoIbjzAjaYS3SezaLRT7KRuY2O1TDsGZzaSPUuZ14
         510V7CAqYiLoGBqGotqK6kBITOOCZFgDWaem8o+I9C2R+TULAs0oUVq7h0ahVhOUbb4j
         vRLw==
X-Forwarded-Encrypted: i=1; AJvYcCVAJCvwB0NOL4z3iAipsJ+Ynv48bcmzFGkWEcssUdgiRm25Xdn7P6DzqW2w25Wr1qn0kxEwr8tNWL6JrfU=@vger.kernel.org, AJvYcCWDribTl1wvQkW3kOFanMiUsB6rgzVqGy+nsJUL3ZMgsot26JznTqTpYlcBwCtgc57ixbUWlvyH6roEGzJ3h+c=@vger.kernel.org
X-Gm-Message-State: AOJu0YybKZK6ev4gy3MNvbwUa7kdGA/dSCwxE/gngUCnvNJxmJt6KFaW
	RLORXxIVWjwEHFAtFqopby9KPnVtT4tfYenmIrB6eKGJa2cc1aTA
X-Gm-Gg: ASbGnctko1gpcIFk5aaTepce3sHZ4bk+dZwO8yXSf2PG7Pm5G6H3kaseBGjDQZxP0Z4
	XWrpQ8sNKdsshQ9cm2XXcH3FwllErt6e6z6m1IWrjsWbAda0CxcTIv0jVrcrwWKR02YGLcVQuXK
	TtKU96A94MIkgnfpn89I+9OO4T4EvMUvyt/zkm1M2OLCvY1OeYxf7f8iQQeHJQYGPLhMOjZX0MK
	Up5LtwfwP5jJaf5xHqOvrzpmsFDaROQVSnf0bEd+qGMMv8d3wtSBBws5dwnOdGRa7aZl7afHts7
	XbVEYb7bujSlY6VofpAeB/0ekWlYPBb8xs4ret6NCUWcXDUXtCBwoPuW5CEhNsVW7LYEhIv8jrl
	r8HzAxA==
X-Google-Smtp-Source: AGHT+IGoqnIySCW4xcBXN10HHnpeNElNjJD/qjRMVinK12TP0Vgh/xKOOiAEjTPNu+EtEwRQ/J98Cw==
X-Received: by 2002:a05:6214:5004:b0:6d8:7ed4:336a with SMTP id 6a1803df08f44-6e243ca746amr373030486d6.31.1738593005127;
        Mon, 03 Feb 2025 06:30:05 -0800 (PST)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e254819959sm50933796d6.31.2025.02.03.06.30.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 06:30:04 -0800 (PST)
Received: from phl-compute-02.internal (phl-compute-02.phl.internal [10.202.2.42])
	by mailfauth.phl.internal (Postfix) with ESMTP id EC9151200072;
	Mon,  3 Feb 2025 09:30:03 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Mon, 03 Feb 2025 09:30:03 -0500
X-ME-Sender: <xms:69KgZ7nFnMAsEsWuIm2I9rwkmSUbqGRGsJr68znH7oyKZxDtLg019A>
    <xme:69KgZ-2B5tiwPPHpdyREC72NW5rENTImzLVpMZqf4WvgPFsAISP98Zace3vON3J_5
    TeG0HmUTdN-MieHlA>
X-ME-Received: <xmr:69KgZxqYvLYkAPpBf4W5LR1mBKixJYWNIvcByvwQfhbAdGVhiRUvkJvQbQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddujeekhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtugfgjgesthekredttddt
    jeenucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrih
    hlrdgtohhmqeenucggtffrrghtthgvrhhnpeejhfeikeekffejgeegueevffdtgeefudet
    leegjeelvdffteeihfelfeehvdegkeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgne
    cuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghoqhhu
    nhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedtieegqdduje
    ejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfhhigihmvgdr
    nhgrmhgvpdhnsggprhgtphhtthhopedugedpmhhouggvpehsmhhtphhouhhtpdhrtghpth
    htoheprghlihgtvghrhihhlhesghhoohhglhgvrdgtohhmpdhrtghpthhtohepphgvthgv
    rhiisehinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepohhjvggurgeskhgvrhhnvg
    hlrdhorhhgpdhrtghpthhtohepghgrrhihsehgrghrhihguhhordhnvghtpdhrtghpthht
    ohepsghjohhrnhefpghghhesphhrohhtohhnmhgrihhlrdgtohhmpdhrtghpthhtohepsg
    gvnhhnohdrlhhoshhsihhnsehprhhothhonhdrmhgvpdhrtghpthhtoheprgdrhhhinhgu
    sghorhhgsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehtmhhgrhhoshhssehumhhitg
    hhrdgvughupdhrtghpthhtohepmhhinhhgohesrhgvughhrghtrdgtohhm
X-ME-Proxy: <xmx:69KgZzmLz0ege_ZgYn8QXvKbMsill1rATvXLo65m_F24I4elyBLHRg>
    <xmx:69KgZ51BQw03SVPM3GKvXUHv77qoJmymLWlZS5suNFGU-D-mNb81zw>
    <xmx:69KgZyuaODamm1u_mEYNxYO_qTeb6wF-yLxGQ0uV4FdyI4M-kRYi0A>
    <xmx:69KgZ9XX3cy5ayCH_vVXCpEUAjj7WyMzyneJTHgoqV5raULNua5ebg>
    <xmx:69KgZ40Qa0GYgF6yxoerwKdfhVsWM_PCPtC83RL270qUeKrFrmKluwcx>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 3 Feb 2025 09:30:03 -0500 (EST)
Date: Mon, 3 Feb 2025 06:30:01 -0800
From: Boqun Feng <boqun.feng@gmail.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Miguel Ojeda <ojeda@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>, Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: sync: add wait_interruptible_freezable
Message-ID: <Z6DS6cIWgGsX7FXL@tardis.local>
References: <20250130-condvar-freeze-v1-1-a91d5661d505@google.com>
 <20250203115418.GB14028@noisy.programming.kicks-ass.net>
 <CAH5fLggyyP1A=uNxr2iYNKOj0V5rxZRU83TRgs6Ah1uJ=Ee2uA@mail.gmail.com>
 <20250203133843.GG7145@noisy.programming.kicks-ass.net>
 <CAH5fLgjVyCSTyZqS7uSzWMTKvrxPL55PKUyM-H0RrnuZiU9VEg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAH5fLgjVyCSTyZqS7uSzWMTKvrxPL55PKUyM-H0RrnuZiU9VEg@mail.gmail.com>

On Mon, Feb 03, 2025 at 02:41:37PM +0100, Alice Ryhl wrote:
> On Mon, Feb 3, 2025 at 2:38 PM Peter Zijlstra <peterz@infradead.org> wrote:
> >
> > On Mon, Feb 03, 2025 at 12:56:05PM +0100, Alice Ryhl wrote:
> > > On Mon, Feb 3, 2025 at 12:54 PM Peter Zijlstra <peterz@infradead.org> wrote:
> > > >
> > > > On Thu, Jan 30, 2025 at 11:30:44AM +0000, Alice Ryhl wrote:
> > > > > Binder allows you to freeze a process where some of its threads are
> > > > > blocked on the Binder driver. To make this work, we need to pass
> > > > > TASK_FREEZABLE when going to sleep in the appropriate places. Thus, add
> > > > > a new method wait_interruptible_freezable for the condition variable so
> > > > > that sleeps where this is supported can be marked as such.
> > > >
> > > > The constraint on freezable is that you must not hold locks. There is a
> > > > lockdep check for this in the code, but it would probably make sense to
> > > > teach Rust about this constraint as well, hmm?
> > >
> > > Unfortunately, I don't think there's any way to enforce this at
> > > compile time, but I'm definitely happy to add this in the
> > > documentation.
> >
> > Ah, ISTR people talking about teaching Rust about the whole raw_spinlock
> > vs spinlock vs mutex nesting order and figured if it can do that, then

Peter, are you talking about the POC idea I proposed on tracking irqsave
status:

	https://lore.kernel.org/rust-for-linux/20241018055125.2784186-1-boqun.feng@gmail.com/

? I'm working on this right now, however, I don't think this would help
spinlock or mutex nesting? Because there's no global(percpu) status of
acquiring these locks. Am I missing something here?

Regards,
Boqun

> > this should be doable too.
> >
> > But perhaps that never quite happened.
> 
> There isn't too much progress on that front lately, but you are right
> that this work could be extended to support this case too.
> 
> > Yes, documentation would be good. Just in case it isn't obviuos,
> > freezing a task that holds a lock can trivially deadlock vs another task
> > that needs that lock to complete before it too can hit freezable.
> 
> I'll include those details, thanks!
> 
> Alice
