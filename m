Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1DE12FA62F;
	Tue, 17 Jun 2025 16:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750179490; cv=none; b=u6DI7J51Z/NVy2mQTllgBr9MQz/4+mKj9KVvhvYy+Ujh3YSYoQpNi+Z8hxt+8zek1ebsWIoO0zX+nHWfuK+EZtZ8DvGhBFXY16KOGq7sK13B+p6B2yO3CcDkbJu+XQkyc4v4YHXMe1fjq5bD90FiuI8+sxR7/ZLRydc7DkKd+94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750179490; c=relaxed/simple;
	bh=1Bs87EcWnkvpggmdbY0wX6xeH68zxUYyV6RtUK++704=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hFg0xyCO4FM73rfQOCpQpJaO40b9DD7fiJVn1fUZaZtWkW1khJIOYCqSetCqXeUgowKSzzr7LqSslHiU7PiFYpN5Jy1bNlhsnho9LvmQYU3nugipapBYr4NyyPuAP1TqvFV+63nJMZrD8MhNLQn+Xp+JH+ug8keWrkx5GSIyX9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QCKl/2je; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QCKl/2je"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-4a43972dcd7so76363971cf.3;
        Tue, 17 Jun 2025 09:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750179488; x=1750784288; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rilYjlhaNDVdjd7csRjL4EGUNwGQ/gFFWVDo17odFDc=;
        b=QCKl/2je1eg90We8hnhEyRJpcVfocV3/62cQsIrIi1gYp3tXq0mYfCuP0Ddf+wuTv7
         PFxWL6mXWSxm+yvFKlDZYsWYPJeman4iAsdwuQQWcffA/tOh2QEXRqWfgqI/vhv2myat
         /BoQuQdR7mFJZPgnOa9tU4PmXTWPeDILi254tz9IjBji2ojUGlAkLN0qXhkpFl6Kg1xi
         k5Bl7Fej2KyyoknrHRl+oEx2rIh5gauT5mgQTvQfwh5MjOeVsZIe4GHasNJ7Z6/LDHUe
         I9jtHIXZuNI/MCZ4rZjL4OQRomv8T7TDyHY5OKUobvY/zVHt0onF7CWx9AMtbTvRVOLT
         ecjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750179488; x=1750784288;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rilYjlhaNDVdjd7csRjL4EGUNwGQ/gFFWVDo17odFDc=;
        b=TsJ+y7Ab6eHlpomq2V0bT7+30Qu814w/ttv5xvzezjejrIVnGojyR+Vnb0DUf6JoYr
         tI4NIY5ux2daoiPTiCkpu01Yd2U4N696lsDE/rcyo7I+knQZV1YThKHesVQYN4ITFwZA
         2LSCej2dnx0zMjn4RSzHMFQE5uqusCAcZWjBaqe7CimMkQ26qC3B4dgmAeaZn6HtAPHP
         fBrz0YYi4MTkN7Xub7hI2WLlz3KMZCcSD/E2D5BpWLAoQ5jjmTq54/oZ1EhqBUchA9Ma
         Iefxi5lo/R62BivshzBH9LGetcAQTcYSdU743EtMRs5Bb9xjo2AIwNtV46QDaiHa8G+r
         JBVQ==
X-Forwarded-Encrypted: i=1; AJvYcCUVpfHqY+CBp8TW1VEmhEZCGLkIvZhvP/NVdMLGmL3/Cy9JTB8iVDaHavOmzwgfsVvxXsldOotMZRmxpiXksQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3uompiZRsHGJ+xTBwfMFAUR3JP6ktJFbZhnjP1WjVTaQuVYP1
	aRXiYX/DDL9gsuw9xoIXHvOBc0LXAXNJzGTL5mmLe3ZFFnzfdXEohA6fR7aorA==
X-Gm-Gg: ASbGncugbNeb8HxNhTvSuWrpqXRISRtVf61dNQ17A+0a8TNfuMKQTqNxCBvGruWqaH4
	5OaNqjvVi9PO2OXGpWbmH6lCENQFN+diSe13Wq+vykE9og96SkfzjQ6gY5oY8BTSziIMDInk16P
	rhmecCJBU1KJogamCOQTVTTw++7HNaZ61UakJpKginngHkc36ioXWOYy2RKgMgzgJEHkoide4tq
	6eZ2onczKHe24hkP2AdUCdFFJeJX3lGKOaNj2A6cYCj3V82JYK+EQ5Fvbe9dh6hCxFUpJGQImcf
	4PPSQ7ZSWWfst4iIIuaIpyZcYSwHMfz6E7TH6SfMyBCtxnvIk9+seJUNY1sPxbiHaV8PxIdYTCh
	JQ2pPuKmDwvnwaKg2Z85N3EuQXM4JYFJ9RsBVYMa9YONvXQ3CgC8NYnIQrnPeZ3Q=
X-Google-Smtp-Source: AGHT+IGuFWeaYecImy2bHGqxSNTqfw6S5I6X5n9MeyDbLsDjZgSMdwMyJxl4k4V7F/D+P2UHM7r6Gg==
X-Received: by 2002:a05:622a:303:b0:4a4:2c75:aa57 with SMTP id d75a77b69052e-4a73c6196a8mr210254991cf.44.1750179487521;
        Tue, 17 Jun 2025 09:58:07 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a72a4e144bsm62932181cf.62.2025.06.17.09.58.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 09:58:07 -0700 (PDT)
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 77E8F1200069;
	Tue, 17 Jun 2025 12:58:06 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Tue, 17 Jun 2025 12:58:06 -0400
X-ME-Sender: <xms:np5RaP9Cdbvkg9dycDthwKIQQj6ZN75RNrcyJF47txBmXuEfGrLk6A>
    <xme:np5RaLu8KFgHN6-_RDIo5LwFKkaht6H7soAL1mkHxB8kERm5bOxQuEPjOuRlN70w7
    -wbOl0XbVnDe34z1w>
X-ME-Received: <xmr:np5RaNC1rED4vQTqf8fuwflPKHrk0G2IcG7vIk7St4G4k8vJ8H7vQ7k0MXE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdejudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffr
    tefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecunecujfgurhepfffhvfevuf
    fkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpeeuohhquhhnucfhvghnghcuoegs
    ohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrthhtvghrnhepudevie
    dvudeuteefleethefftddufeehfeevhfetvdeikeeivdfgheejvdetjeffnecuffhomhgr
    ihhnpeguohgtthgvshhtshgpkhgvrhhnvghlpghgvghnvghrrghtvggurdhrshenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsohhquhhnodhm
    vghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdeiledvgeehtdeigedqudejjeekhe
    ehhedvqdgsohhquhhnrdhfvghngheppehgmhgrihhlrdgtohhmsehfihigmhgvrdhnrghm
    vgdpnhgspghrtghpthhtohepvdehpdhmohguvgepshhmthhpohhuthdprhgtphhtthhope
    hmihhguhgvlhdrohhjvggurgdrshgrnhguohhnihhssehgmhgrihhlrdgtohhmpdhrtghp
    thhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtg
    hpthhtoheprhhushhtqdhfohhrqdhlihhnuhigsehvghgvrhdrkhgvrhhnvghlrdhorhhg
    pdhrtghpthhtohepohhjvggurgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghlvg
    igrdhgrgihnhhorhesghhmrghilhdrtghomhdprhgtphhtthhopehgrghrhiesghgrrhih
    ghhuohdrnhgvthdprhgtphhtthhopegsjhhorhhnfegpghhhsehprhhothhonhhmrghilh
    drtghomhdprhgtphhtthhopegsvghnnhhordhlohhsshhinhesphhrohhtohhnrdhmvgdp
    rhgtphhtthhopegrrdhhihhnuggsohhrghesshgrmhhsuhhnghdrtghomh
X-ME-Proxy: <xmx:np5RaLe1hfV4MNhdSV5osNPd2gjVrV6wvTQ3ZBx1zIhtMLV9IRmDQQ>
    <xmx:np5RaEONKB6AwKC3dMi55W3nn9SZ7keu5ttqL8OPWV-sepjI0hXjBw>
    <xmx:np5RaNnz2BrrhpjP2Q_fVrBnLYG79KIpw2tH6TN8YhSmqKlUQRUhew>
    <xmx:np5RaOtaHsZGMPZz4bqBsQEql-5KvlZqs36Hy2Ft9XjJlsFZPmaLaw>
    <xmx:np5RaOuk8EM-LXz6DV4OnPOTsCyBzB2gKe2L9iukOxJ0HXcPvAYgwq8b>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 17 Jun 2025 12:58:05 -0400 (EDT)
Date: Tue, 17 Jun 2025 09:58:05 -0700
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
Message-ID: <aFGenbg8S36G1aeP@tardis.local>
References: <20250616153604.49418-1-boqun.feng@gmail.com>
 <20250616153604.49418-2-boqun.feng@gmail.com>
 <CANiq72mZV3Ezxb4FvDdMvn=O+ReUPBx9usUahLgwTKKCFD_+cA@mail.gmail.com>
 <aFFwumsjuAEIJVUF@Mac.home>
 <CANiq72k+d3FzM8O7R9_WrpU3o3RygpGAS3S0Z5wPZsvC3k6=WA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72k+d3FzM8O7R9_WrpU3o3RygpGAS3S0Z5wPZsvC3k6=WA@mail.gmail.com>

On Tue, Jun 17, 2025 at 05:28:41PM +0200, Miguel Ojeda wrote:
> On Tue, Jun 17, 2025 at 3:42 PM Boqun Feng <boqun.feng@gmail.com> wrote:
> >
> > Will do, one thing though: the comment lines seem to wrap at 78 or 80
> > chars, so do other lines for conditional features in rust/kernel/lib.rs.
> > However I believe in Rust code we use 100 chars text width, any
> > particular reason that I should keep these new lines the same (wrapping
> > at 80 characters)? Otherwise I will make the new lines wrap at 100.
> 
> We have both styles, so up to you.
> 

I will use 100 characters then.

> It would have been nice to at least know already if `rustfmt` would
> eventually land on 80 or 100 for this, even if the automatically
> wrapping is not stable :(
> 
> > Sure, will do, but I'm afraid there is only case, unless I misunderstood
> > you:
> 
> I meant the "If `file_with_nul()` is not available" vs. the available
> one (since it is mentioned in the docs already).
> 

Yes, but the example would be one, just the output would be different,
hence I said the "only case", but see below:

> > /// use kernel::file_from_location;
> 
> I would hide this line, since it is a single import of the item itself.
> 
> > ///     pr_info!("{}\n", file_from_location(caller));
> 
> I would suggest adding a comment on top of this line mentioning the
> output it could potentially show, e.g.
> 
>     // Output: ...
> 

This actually helped me find a bug in the current implementation: I
should use core::ffi::CStr::to_bytes_with_nul() instead of to_bytes().
Please see below for the update "Examples" section:

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
///     // - If file_with_nul() available: "rust/doctests_kernel_generated.rs"
///     // - otherwise: "<Location::file_with_nul() not supported>"
///     pr_info!("{}\n", file_from_location(caller));
/// }
///
/// # foo();

> Thanks for this!
> 

Thank you!

Regards,
Boqun

> Cheers,
> Miguel
