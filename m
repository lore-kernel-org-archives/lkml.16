Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB2A12E9ED9;
	Tue, 17 Jun 2025 18:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750183924; cv=none; b=XjY3zHoOEc4G3HaVs+/DnQLRjUFz5asCkm8EFry9gkBnPt9EAN8tqI75ZPoqFlnsTjg5wju2yHb653PkinV5Pu9Qe80A4ihXNzbvO1wcOP5zpsU84n++Ia9huMB12Za2sH6rQ8F8WlhH1v7x/0mSBDSeVQDfYz1b3nOivmvPAPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750183924; c=relaxed/simple;
	bh=mJEQQtCXm4CbhxpD0YdXbvjo5vaigVL4nH3ZnOBdan4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UYjFsyDbuxwBdPELYUbILwfvoDIpEdICR2JCC+nmVfh1Eg2kQVpXHKF1FbuETxD386Zoqm/iOtLvCPX8zXRhrMlq0aVYh1aMHsupe4h2Fj3+jOFikY5yD2lFawG2i1ENd9H+5s//1WTFe2y/PhH47wKL3Bismo+/ryT4+t/5PSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zh57qdAf; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zh57qdAf"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6fad3400ea3so59550536d6.0;
        Tue, 17 Jun 2025 11:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750183922; x=1750788722; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Nw48nOKCPYPpMcfmeMUVXExLGuuvx674Ajy5aRz4EDk=;
        b=Zh57qdAfRYs2Aka9u2UyOCbMKAZSyQrzqRSrP+BBmuf56VXuWRpRDvNizPYrv6VCpi
         WboB3MTUWGFPyvuhWSzqOxRPSHYgfVkD9FW+N+jflTWt4rbsCAkcAiMEvyVIxC4ym91j
         cFpms36e1NytrSvNN4Q2ablysxxZfWTwVOzwBXT6a/a81d4mtnN6OTPx6cjnX2B7BWtD
         00k+OU+sGUR9vHhq+lzlLmQFYChpvsvm9q01dMnYbDwcQwJ5gjtDexxz/LM+9oQEzFXK
         QynfOh4N4I+a46K7erAxxREA2lB+DyWqf2+iOEkGAyGWL7Stc0QacWUR7HcID7tw6IXc
         wAwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750183922; x=1750788722;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nw48nOKCPYPpMcfmeMUVXExLGuuvx674Ajy5aRz4EDk=;
        b=sh/5KfBFXGuFD8RtifhvejStaWGudN1/x/M98SAUQZ428iTY/MS2PBBxZCYhailyZc
         mdNQiDzCMmh1X/hajcO8p23dgsrKX5+yhncMfntGfp8+3qsJr2qW75fP+WmFU5FGJKSh
         027Xj4MvOzRxMPpnTGKBJwmDVGoTErR9ZsgA0dwTlJTN235R2RWcRgN8hVIfWswBijIU
         c0cSQfiR17xZh1ByERxIUeUfY4Y4BgiMvfndZz37AHQP9GHiXckkQ+UgO8obTfYHJ98r
         tTen2QeMiTtQE7W6E3+dunownqLwqT14GPFeTeNpn6vZ7IfoaackpqTvSk4ObzAmDTii
         68lA==
X-Forwarded-Encrypted: i=1; AJvYcCVoOVv0yUlHn/Z+tPTMekQnA8KSKgALao0lbQxCmaWvc8AY9/yEdBj5kP5lxUEpArASJUi1fMiA+jlQQUODgg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzdfBGG23aerfOKAuYgEpQhUm0w1LqPouagn2lM1aof9Dty54Yz
	H8O9L+Js+M6shEB49kD86sfIc/nt7OhmJWN3fWVqD5davkUD5YBA13uB
X-Gm-Gg: ASbGnctdSKh50o9THyUQ6oMQ4Gs+h6nLNRxcp4hxsla/R2MKX7oIqruZ5HWe9lYWPRb
	heBnLMLwdoBx+O4qkg/D3xCKLi3syqDxX8JGj5Y1klPD+7Wal0UZVLvHrwqdc4LiGNSKUEdr/KI
	MzqjlmWN4qDfVQAe/jAdwYtKFXDMiPDQwcXKd+bcr/SLsyJO/uVajE+S8kPSK4hMqYPfnBkkFex
	9WgjKI7gUn1wGtmW8k3aCVK8aKFizyl/ZlNv/IaHjtOa9AyzSDPTFQIwq3Jvp2sx4op/ueaN4Ox
	iW68Q5mejl97AUWgqevt4Xq2yDyUgEc4TUAof98SAUhvBwRfURHxsuyFo0cB6Dtv7+kOf2s2HgY
	ull/22gPXR/iLAW1akh0tz0UsUrf3kVNmhIpymisro4bv1yXlz+4fvGAM5cn9LWs=
X-Google-Smtp-Source: AGHT+IFMcvkvGElYJGlFyiklVlOAbk8qjqZEOICNGJsMfCuntmKIdja7qPsbSG/L6WV7F4sj8NBdfA==
X-Received: by 2002:a05:6214:2244:b0:6fa:ffff:d7d8 with SMTP id 6a1803df08f44-6fb4724992dmr225642266d6.0.1750183921578;
        Tue, 17 Jun 2025 11:12:01 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fb35b2fd7bsm65410636d6.35.2025.06.17.11.12.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 11:12:01 -0700 (PDT)
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfauth.phl.internal (Postfix) with ESMTP id 7218F1200069;
	Tue, 17 Jun 2025 14:12:00 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Tue, 17 Jun 2025 14:12:00 -0400
X-ME-Sender: <xms:8K9RaDqNWDepbxshPesr8H6jd1OuQoh08gaYzXTsru6osLA8BDcT-Q>
    <xme:8K9RaNpZBOXelkKeafOTq6hgoD73hboKMTMuddpvJ94tSukSUzMAGgDTlMRfohnl1
    4J0XJ5iIVlI8CkaFQ>
X-ME-Received: <xmr:8K9RaAN27EPG35_drTS3hIYyLJ01KFLFCFjGJ0xOF1hJFUgdEIEsP86g4g4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdekiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffr
    tefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecunecujfgurhepfffhvfevuf
    fkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpeeuohhquhhnucfhvghnghcuoegs
    ohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrthhtvghrnhepvefghf
    euveekudetgfevudeuudejfeeltdfhgfehgeekkeeigfdukefhgfegleefnecuvehluhhs
    thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghoqhhunhdomhgvsh
    hmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedtieegqddujeejkeehheeh
    vddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfhhigihmvgdrnhgrmhgvpd
    hnsggprhgtphhtthhopedvhedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepmhhi
    ghhuvghlrdhojhgvuggrrdhsrghnughonhhishesghhmrghilhdrtghomhdprhgtphhtth
    hopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphht
    thhopehruhhsthdqfhhorhdqlhhinhhugiesvhhgvghrrdhkvghrnhgvlhdrohhrghdprh
    gtphhtthhopehojhgvuggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrlhgvgidr
    ghgrhihnohhrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepghgrrhihsehgrghrhihguh
    hordhnvghtpdhrtghpthhtohepsghjohhrnhefpghghhesphhrohhtohhnmhgrihhlrdgt
    ohhmpdhrtghpthhtohepsggvnhhnohdrlhhoshhsihhnsehprhhothhonhdrmhgvpdhrtg
    hpthhtoheprgdrhhhinhgusghorhhgsehsrghmshhunhhgrdgtohhm
X-ME-Proxy: <xmx:8K9RaG5dXAfAIBTzm_8GB80DxwoOp8NCCakxJW2x0IAiDDCXubE7Ug>
    <xmx:8K9RaC5g8N8HaNrbSJMoJuCAVXLLxJbKhZarqwiV0MKx7zJB_bm4iQ>
    <xmx:8K9RaOjjEF_VTeN2G4AVmww-M8EC-3m3r1XZgBcmONti9ZUQ0aCSLQ>
    <xmx:8K9RaE4LcWN9LDBIbXrZ9yPRrJ-VCEe-j_rXOiwdYNZsIdpI8qWZtw>
    <xmx:8K9RaBKx4v8RyGvN2pmXQBE53TCrjt6o5LgPnGtcWDbZABDd6jOJjdmD>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 17 Jun 2025 14:11:59 -0400 (EDT)
Date: Tue, 17 Jun 2025 11:11:59 -0700
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
	fujita.tomonori@gmail.com, mingo@kernel.org
Subject: Re: [PATCH v3 1/2] rust: Introduce file_from_location()
Message-ID: <aFGv7-0PzewfS5kr@tardis.local>
References: <20250616153604.49418-1-boqun.feng@gmail.com>
 <20250616153604.49418-2-boqun.feng@gmail.com>
 <CANiq72mZV3Ezxb4FvDdMvn=O+ReUPBx9usUahLgwTKKCFD_+cA@mail.gmail.com>
 <aFFwumsjuAEIJVUF@Mac.home>
 <CANiq72k+d3FzM8O7R9_WrpU3o3RygpGAS3S0Z5wPZsvC3k6=WA@mail.gmail.com>
 <aFGenbg8S36G1aeP@tardis.local>
 <CANiq72neJ-1e9Cef5RJMdJGEqWVEW7F72_J0GcDpJuEd_APrxA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72neJ-1e9Cef5RJMdJGEqWVEW7F72_J0GcDpJuEd_APrxA@mail.gmail.com>

On Tue, Jun 17, 2025 at 07:21:06PM +0200, Miguel Ojeda wrote:
> On Tue, Jun 17, 2025 at 6:58 PM Boqun Feng <boqun.feng@gmail.com> wrote:
> >
> > This actually helped me find a bug in the current implementation: I
> > should use core::ffi::CStr::to_bytes_with_nul() instead of to_bytes().
> > Please see below for the update "Examples" section:
> 
> Yeah, writing examples can force us to find issues :)
> 
> I guess we could conditionally (`cfg`) assert in the "otherwise" case,
> since we already had one case, but I didn't suggest it earlier because
> it is a bit heavy, and the interesting case is the other one anyway so
> it wouldn't have caught the issue. I guess we could assert it ends
> with `.rs` for the interesting one.
> 

We already know the full function name from Location::file() ;-) so the
assertion is easy:

	assert_eq!(Ok(caller.file()), file_from_location(caller).to_str());

I didn't add the assertion of the otherwise case because that would
involve either writing another string "<Location ... not supported>" or
define it as a const, both are a bit overkilling to me.

> By the way, I would avoid the actual filename, i.e. I would give a
> more "normal" example instead of the `doctests_kernel_generated` one

Good point.

> of the example itself. Something like:
> 
>     // Output:
>     // - A path like `rust/kernel/example.rs` if `file_with_nul()` is available.
>     // - `<Location::file_with_nul() not supported>` otherwise.
> 
> It could make sense to have an intermediate variable (especially if
> you end up asserting anything), then you could put the comment on top
> of that instead. Then the `pr_*` call could then perhaps show a
> "realistic" example, and could inline the variable name, e.g.
> something like `{caller_file}: my message\n`.
> 

How aobut something below? (I use "" instead of `` on purpose because
the output variable there is a string)

/// Gets the C string file name of a [`Location`].
///
/// If `file_with_nul()` is not available, returns a string that warns about it.
///
/// [`Location`]: core::panic::Location
///
/// # Examples
///
/// ```
/// # use kernel::file_from_location;
///
/// #[track_caller]
/// fn foo() {
///     let caller = core::panic::Location::caller();
///
///     // Output:
///     // - A path like "rust/kernel/example.rs" if file_with_nul() available.
///     // - "<Location::file_with_nul() not supported>" otherwise.
///     let caller_file: &kernel::str::CStr = file_from_location(caller);
///
///     // Prints out the message with caller's file name.
///     pr_info!("foo() called in file {caller_file}\n");
///
///     # if cfg!(CONFIG_RUSTC_HAS_FILE_WITH_NUL) {
///     #     assert_eq!(Ok(caller.file()), caller_file.to_str());
///     # }
/// }
///
/// # foo();
/// ```


> Anyway, no big deal either way, what you had is also OK.
> 
> By the way, I noticed a typo in "with a NUL terminated." above.
> 

You mean it should be "with an NUL terminated"? Or it should be "with
a `NUL` byte terminated"?

Regards,
Boqun

> Cheers,
> Miguel
