Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17C6A1E1C3A;
	Tue, 17 Jun 2025 13:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750167744; cv=none; b=o5+UsZ1B3ZTE7RC+acBAJDEVZyomQ7zGgo3EnpamUaIM6YoiHW2IaPA8dnqyxkGsVuSu2rTQDwIeF/QACcvEvdweJWCBIKXo908IVyUg5ceNky3wTa8mZhI2iyslOdAyFtGprH2CMM9c+wgEL8A7+Ba4RQHqPTxE8VMrzgRARv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750167744; c=relaxed/simple;
	bh=6kxGzBsimhmuPwPFGSko0prjDnLGC3C5jeaYqBgiAYE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mu7mSKAvjC29798wt4D1tPstdm3LEMP4f8a2H4JuGWba4K1hyOT5l6TnO7FEHHCov+wYwNz1Dp6dsWiodc92UlKItSRz4Xe+Cqma8e166mqaloFi4E/1ou0BKVRNvDB6YEOtpaf4oRqjLFBbzHkDukTfyhgjJ3vfLwTxPBpvHnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MBzkJ3ps; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MBzkJ3ps"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6facacf521eso58089416d6.3;
        Tue, 17 Jun 2025 06:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750167742; x=1750772542; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XWJ7ISGxakN/jn9ul7R2vYujXeqC/5WxHQKkaVruGAA=;
        b=MBzkJ3psDMyySuSEjnC3jNYqO8CUuxRnChKl9As+zL1IKlhC+xJlySdSKspKOOfsWg
         050tKLxqR9B9cBXCI8ycDSeAWMfZrkGRFZoEGiVhzRGP6wkp0v47T2UUaxvIRibf26D6
         4KbnjLd+Pt2FSgkxSfVTgi48twYZ6TQ27sLBQnTrA3gMISHSgca3J0Vk1C6TJnePYHPe
         LaLRR7O7EH0Rhxo9XVCpLO5zNU91X6dE8oN8zNA4XIm522NNlNPj9GMKncKgFm7a5g4+
         wW8032KivhjOD6qiQ0Lv+PoYzilzZnmATu7epU+dfrgtYcrKCArvf4ocBArPZElRhJO6
         bX0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750167742; x=1750772542;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XWJ7ISGxakN/jn9ul7R2vYujXeqC/5WxHQKkaVruGAA=;
        b=cvEegJV14hGt/rNBCnhwVQ463iyE8rUXXjypAdg+fac5A2HUVA4DrqQNt576INnrQq
         AV6jU6bZEJqPdaigXe3ud7hvMcDLWlba2H6jmbyk8k208N6IT2CWrgqjiPXeBLlInX89
         173ObuAht/h4GAn4u0p8beDpQsUA3HPjdelUa91Zks2Atvu1ArsbAURl8OU9ugFTE+ID
         6HatfP3+gBCxmRVOJd2ZFuV3dkvkjkVagZadzaU7uCK823JZILssvBetBPOPZDeQkZzh
         vjYGt0/IjwLTnXRPyDK1USWlIjQSMb6EkXLmsg/QcYSgqRJyX6eijSzn+rDaiQjhiSY6
         WDFg==
X-Forwarded-Encrypted: i=1; AJvYcCW7kwqTFBJuIyQPMnGT+CDMcLBsZ4t0ppmCQ25cJGJuyandlLKtwjUdjzwiD+lYLYjOa5BOBdZxSSet+Ice6g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxrbVqcQwieguZJRXAyZ3zI1HCV35126qScPkameYzDxDEmtgbT
	eLrPQfNsugERAcMTUZE7nz85heafxmvVtZMcywMV57u4RLUfEX25GC/F
X-Gm-Gg: ASbGncuSPXIVqQDEhDc3cgnY57KR29JGJlytuz6dESVLGcEE6Fp5usoYMcfutIOjSRV
	QKUUSDdEZeDz5d0KctW7bW4vCjBzlGtTFGMUVougtSv9t54m+xnu65hlvFpaSFKTevBsJyBW0KB
	V+9gdCOYsupoDQkx7MrnprxzdHhP59V9sItyd7nBS2dhxGvMeE3GJAcNAu9ROfBchDSlPxj3dKb
	IpHrUyP2qdFkqy/SlwVl9rN+UNbtYt1XIo4aqYgTzLmprOKfMHw1U6oNaaX67qBRWruAICefN4u
	4MdTV+4L9Qsdk5cdVcYrfWz5a3LsWvqvG8hbQSizi2f6t7R71PRTMqzmQogvNhhFsTf4uAyeQre
	aRjPpeKgkilQlV53ep8kiQJxO4DBTuNH7ymGjVn7KdzgRp5KcEkf9
X-Google-Smtp-Source: AGHT+IFCRqWnxQpO0pQYeKbbmW1W+l157ql+WXTsNdBkzj3reR0BtOT3jqKUShAVTiLTHo/6newWug==
X-Received: by 2002:a05:6214:20ea:b0:6fa:8c15:75c1 with SMTP id 6a1803df08f44-6fb4762f389mr173448666d6.2.1750167741846;
        Tue, 17 Jun 2025 06:42:21 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fb35c31566sm62538946d6.61.2025.06.17.06.42.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 06:42:21 -0700 (PDT)
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id A29511200043;
	Tue, 17 Jun 2025 09:42:20 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Tue, 17 Jun 2025 09:42:20 -0400
X-ME-Sender: <xms:vHBRaJEqTVLDutusw6X0M-H01-T_xUeBgsHIK8NoIT0qUDLuQbgNZw>
    <xme:vHBRaOWBu6Igc3-KdKlyXRbRi7nzAcQCvJWQxys4ajnD2ymXQZQKnkScwnjg2TyEi
    gCPrf5SP0G2YKOtMw>
X-ME-Received: <xmr:vHBRaLJkBg1nWMvkL84D6Nh555Yx50exa5hVZW0Rvuk60FgdUXrNMLsTew>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdeffecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffr
    tefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecunecujfgurhepfffhvfevuf
    fkfhggtggugfgjsehtkeortddttdejnecuhfhrohhmpeeuohhquhhnucfhvghnghcuoegs
    ohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrthhtvghrnhepffelke
    efudethfekhfehkefhledvjefggedvjeejffduleektdffieevjeettedunecuvehluhhs
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
X-ME-Proxy: <xmx:vHBRaPE3LL_SkVw-NzNfn1NmzIBd1MT1h8Y76HQoBvjUMNnW-P2_aA>
    <xmx:vHBRaPUbhuwa1rlaL7zP7N22OZBUX1aYTaSPr2JL3kPzcQkCI5dIJg>
    <xmx:vHBRaKOh-u6yMneJI4FYWyMBJm2AdbUklzMM7RlfEgNECXKoXBSjIQ>
    <xmx:vHBRaO3V0LzUsVBds_gEaNibmCBhsVWddaAEQ-KgX5nyhCrnoJhZIg>
    <xmx:vHBRaMXQSspjud-EPx_AVCsflpcG_eYpnaLQLjiMNfFR46yuovKJSCcM>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 17 Jun 2025 09:42:20 -0400 (EDT)
Date: Tue, 17 Jun 2025 06:42:18 -0700
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
Message-ID: <aFFwumsjuAEIJVUF@Mac.home>
References: <20250616153604.49418-1-boqun.feng@gmail.com>
 <20250616153604.49418-2-boqun.feng@gmail.com>
 <CANiq72mZV3Ezxb4FvDdMvn=O+ReUPBx9usUahLgwTKKCFD_+cA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72mZV3Ezxb4FvDdMvn=O+ReUPBx9usUahLgwTKKCFD_+cA@mail.gmail.com>

On Mon, Jun 16, 2025 at 11:19:52PM +0200, Miguel Ojeda wrote:
> On Mon, Jun 16, 2025 at 5:36 PM Boqun Feng <boqun.feng@gmail.com> wrote:
> >
> > introduce a file_from_location() function, which return a warning string
> 
> returns
> 

Fixed.

> >  #![cfg_attr(not(CONFIG_RUSTC_HAS_COERCE_POINTEE), feature(coerce_unsized))]
> >  #![cfg_attr(not(CONFIG_RUSTC_HAS_COERCE_POINTEE), feature(dispatch_from_dyn))]
> >  #![cfg_attr(not(CONFIG_RUSTC_HAS_COERCE_POINTEE), feature(unsize))]
> > +#![cfg_attr(CONFIG_RUSTC_HAS_LOCATION_FILE_WITH_NUL, feature(file_with_nul))]
> 
> I would change the config name to `CONFIG_RUSTC_HAS_FILE_WITH_NUL`
> since that is the actual name, i.e. without "location".
> 

Sounds good to me

> By the way, please add a comment on top, like the others, i.e. something like:
> 
>     //
>     // `feature(file_with_nul)` is expected to become stable. Before Rust
>     // 1.89.0, it did not exist, so enable it conditionally.
> 

Will do, one thing though: the comment lines seem to wrap at 78 or 80
chars, so do other lines for conditional features in rust/kernel/lib.rs.
However I believe in Rust code we use 100 chars text width, any
particular reason that I should keep these new lines the same (wrapping
at 80 characters)? Otherwise I will make the new lines wrap at 100.

> Alice: the tracking issue uses the wrong name, i.e. with the
> `location_*` prefix.
> 
> > +/// If `file_with_nul()` is not available, returns a string that warns about it.
> 
> Could we give a couple examples, i.e. of each case? (No need to assert anything)
> 

Sure, will do, but I'm afraid there is only case, unless I misunderstood
you:

/// # Examples
///
/// ```
/// use kernel::file_from_location;
///
/// #[track_caller]
/// fn foo() {
///     let caller = core::panic::Location::caller();
///
///     pr_info!("{}\n", file_from_location(caller));
/// }
///
/// foo();

> > +        use crate::c_str;
> 
> Do we need the `use`?
> 

No need for that, and thanks for catching it!

Regards,
Boqun

> Thanks!
> 
> Cheers,
> Miguel
