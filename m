Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E88552701D7;
	Mon,  5 May 2025 19:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746473038; cv=none; b=SLgPldZ2Izy4R8lVOX2jxAua+dal4fV7Sp12K4nTbtTc2cSjaXKXFS3UhuhaymfGHC9VaCtKTu0r41T+iR7tJHH4PEPv2cpfgUG/VBjaGoXzmiX1CvM1ANRCzv934AfdITnyN5Y+1FbhMc/WgjRWPvBtm2RFXBc+R58ptxcKtwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746473038; c=relaxed/simple;
	bh=UbHoQe7vUVf7Q1SI3GkdZE7oA+6I/inQSpaW5ZkL+0o=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Atjo1Vus2GgsFinc3DvqipDZ3Mh/GmJMxxktP2Wf6KMlZILyhOwbq+3up9/2wV78G12sWUGHAMdLMzBF64EOzk++aYcVW874X3edN8YMkIJ8Duimd1thIS3hFObeCZ/4WCDbHl+JcH7WsPNe4EIeMDZEb2V6vq0Ex/uLpAOnv80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZB6Pub9P; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZB6Pub9P"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7c53b9d66fdso752006585a.3;
        Mon, 05 May 2025 12:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746473036; x=1747077836; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:feedback-id:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y8mF8ekD0FxTBHH3O3DC3PQgEAeAHA89eZzD5JEpN1k=;
        b=ZB6Pub9P6hIu+p3eBV4+WYAtQdNz/AknxYGD1TkFHEcIDmmqtLTkUEEdlNn0AsNtx9
         KthvQbLwpxFDn7NFJHH/ILITgS/NYgccD537L+73yRCJODuM9Zu1JJatCLBuK2DT/ZFc
         /ZTJD4yNkQ1wXw/++meWi2FDV95RWvDexB1m/FoYPx7IuX79xrAT3dBvx0rcyZky26J/
         9Klf5bGP4uFtdfIu7qy4uuAXUIlWDk3Rwu6nS/3pZ80k5PvN3Bupu0mZhGybBwnU6l8Q
         tCI7crXNkZx7oZ7vuGupsSlv8jq5LFftWWhX7lTCiUuif2pCqKx8QEYjsREAtRb/qLwX
         9giw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746473036; x=1747077836;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:feedback-id:message-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y8mF8ekD0FxTBHH3O3DC3PQgEAeAHA89eZzD5JEpN1k=;
        b=kg+JGCbFUmTPhLx1C4UBdyam7f8mGUWKhXeD+KgmNSJo8CVey1zfrODlflbc55p5Tt
         D+elPNyhyXAqAH5g0DGx++sTZlcS2MG/5WbgUXNSoYqemDzC0rDdpv18fCRrf0+8afhT
         VAO4Ci7fWneYXXQMGyxk4joDLwrrh9IlQNsiuxXZbzl1pn4fBOfRs0tIPGVkhguEjjIx
         +BxrryY9H54tnNoMZoRyREr5WGoacfj+JkORk8eV+FiKZv+c/FIEyxVTJxK3pacLBf1c
         kKw68SxYamxTMP2eUtQPAHPdoaojxhUpdqdAdUFQbGiGzltsdwL18feePborqSzWstQ1
         Bmww==
X-Forwarded-Encrypted: i=1; AJvYcCUJPgryGOHGb+CmvHIUl5Dc5owbRLnEY0I/Po8IJuX7c9vvjZOju+ve8Rkuc8mJIpqtch23uQPn4QtdeRu4gB4=@vger.kernel.org, AJvYcCWdOLqLBr68lZZmBfX7sm4bNLY/C3D856T3//usLGWuj90VmUKVO6V8jSwffs9g0bgnDjRbz+tz26o747U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6ieTeX8zLOW8b6vSWoY3j15OOu6j7TeEsuhP8L4jcliwmJ/Nw
	soOqnt+4CnAqt82f9So2JWMW80EyccgkOolNdhJMN648jo7EeFxe
X-Gm-Gg: ASbGncvNz7xNb5IAUfVFrLr3cwHZsrH23ij1mVrh6mZvRTtZmMept6ht0MUDMOeohWg
	ixLoori6LMgEAtlMAClxhHepsx0wVrWxsMWyysb09o6vlloVp99p43+WV2EKpfc/a0PBkRc4PEA
	CyyIl7wZ0l23DnEOjtrNRGwoMiVxn8nUGcE6VdFPT+GKUUOBE+OcAkp1VqzgcXRXFEHsHQg5CxR
	kqpFKd4VyVlTzbAr8jRpAzo6IldAFdQA3cBCWhd9U12N8RbdQlCICo0iNOhBnGBaeQh6t6fyJnv
	7nEUiyaTlzNzYyMqXD2dlpi+5T4kIBT7+GJwORsORGoQbj1Cl9Ez7SnkB3ZMFXxKzNKpoMBm5vE
	5pLNpsn2LwesaOTAVUblqoGeUHgKk2hU=
X-Google-Smtp-Source: AGHT+IGvCi9dvpJ661lNc76enNNlEwB/QD6Uff/ADRa+mgR1Z9RDyZIeu8KthCjtjfHh3Gk4PHDP2A==
X-Received: by 2002:a05:620a:3941:b0:7c5:9a37:c418 with SMTP id af79cd13be357-7caf09d77d6mr74859885a.51.1746473035648;
        Mon, 05 May 2025 12:23:55 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cad23c4ab1sm599381985a.47.2025.05.05.12.23.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 12:23:55 -0700 (PDT)
Message-ID: <6819104b.050a0220.d2081.0b87@mx.google.com>
X-Google-Original-Message-ID: <aBkQSO3U-OoD7Sra@winterfell.>
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfauth.phl.internal (Postfix) with ESMTP id 7C9241200066;
	Mon,  5 May 2025 15:23:54 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Mon, 05 May 2025 15:23:54 -0400
X-ME-Sender: <xms:ShAZaBmaVG0PRHuvlLPiaGNyAVzJE4cnszeuM2s-MjMB8sc4z2rLDw>
    <xme:ShAZaM0uepT0JL0QzXaNEWJ3MtM9md9IzJdtJmriXOi37R58zOP29Rd23J1xNTrMM
    v0Su9GP7cKzgUtjdg>
X-ME-Received: <xmr:ShAZaHpzbuBZbkpzj56ODNlcCeF_e5ZbAneTnDx40dkS8ffEc6QC9Qn7iQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvkeduleegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddt
    vdenucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrih
    hlrdgtohhmqeenucggtffrrghtthgvrhhnpeehudfgudffffetuedtvdehueevledvhfel
    leeivedtgeeuhfegueevieduffeivdenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
    grmhepmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgr
    lhhithihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsohhquhhnrdhfvghngheppe
    hgmhgrihhlrdgtohhmsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohepudegpdhm
    ohguvgepshhmthhpohhuthdprhgtphhtthhopehgrhgvghhkhheslhhinhhugihfohhunh
    gurghtihhonhdrohhrghdprhgtphhtthhopegrlhhitggvrhihhhhlsehgohhoghhlvgdr
    tghomhdprhgtphhtthhopehojhgvuggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhope
    grkhhpmheslhhinhhugidqfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtohepvhhi
    rhhoseiivghnihhvrdhlihhnuhigrdhorhhgrdhukhdprhgtphhtthhopehgrghrhiesgh
    grrhihghhuohdrnhgvthdprhgtphhtthhopegsjhhorhhnfegpghhhsehprhhothhonhhm
    rghilhdrtghomhdprhgtphhtthhopegsvghnnhhordhlohhsshhinhesphhrohhtohhnrd
    hmvgdprhgtphhtthhopegrrdhhihhnuggsohhrgheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:ShAZaBkzIlB4_pDBHf0z31HdwgW72w85O6IVCPL6jy7Jp1hTUHNkcw>
    <xmx:ShAZaP37x93VN6pJW-kl-hicwlUygorJ7hlj73wiXS-W87shmE5ZtA>
    <xmx:ShAZaAs1rk6b4TY8QRJ4uSTy54DLrQmgbdoQz4adoSGsOiBs2ZCECw>
    <xmx:ShAZaDUJluaXYaXSmLDAzg37MgVmroq0gmFXhEJkHl_2S0RcHwjJZw>
    <xmx:ShAZaG1WtHU8sPru3B9n48o0O1BkYSy79Nc2mYr2GEaWskYZcugXFZbW>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 5 May 2025 15:23:53 -0400 (EDT)
Date: Mon, 5 May 2025 12:23:52 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] uaccess: rust: add strncpy_from_user
References: <20250505-strncpy-from-user-v3-0-85c677fd4f91@google.com>
 <20250505-strncpy-from-user-v3-1-85c677fd4f91@google.com>
 <2025050544-sneak-compactor-d701@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025050544-sneak-compactor-d701@gregkh>

On Mon, May 05, 2025 at 04:30:05PM +0200, Greg Kroah-Hartman wrote:
[...]
> > +
> > +/// Reads a nul-terminated string into `buf` and returns the length.
> > +///
> > +/// This reads from userspace until a NUL byte is encountered, or until `buf.len()` bytes have been
> > +/// read. Fails with [`EFAULT`] if a read happens on a bad address (some data may have been
> > +/// copied). When the end of the buffer is encountered, no NUL byte is added, so the string is
> > +/// *not* guaranteed to be NUL-terminated when `Ok(buf.len())` is returned.
> > +///
> > +/// # Guarantees
> > +///
> > +/// When this function returns `Ok(len)`, it is guaranteed that the first `len` of `buf` bytes are
> > +/// initialized and non-zero. Furthermore, if `len < buf.len()`, then `buf[len]` is a NUL byte.
> > +/// Unsafe code may rely on these guarantees.
> > +#[inline]
> > +#[expect(dead_code)]
> > +fn raw_strncpy_from_user(ptr: UserPtr, buf: &mut [MaybeUninit<u8>]) -> Result<usize> {
> 
[...]
> Also, it's not your fault, but we don't have any type of __user tag for
> data coming from userspace yet to track this type of thing?  The

I think the type `UserPtr` is supposed to track this information, i.e.
Rust can only get a `UserPtr` from an input from userspace, and of
course Rust code cannot treat `UserPtr` as a normal pointer. For
example, the following would fall because of this:

    pub fn foo(ptr: *mut u8, ...) {
        raw_strncpy_from_user(ptr, ...);
    }

Regards,
Boqun

> compiler (well sparse) can catch this type of thing in C, any hints on
> what we could do in Rust for the same type of guarantee (i.e. don't
> touch user data before it's been copied, and then we need to treat it as
> "unverified" but that's a different patch series...)
> 
> thanks,
> 
> greg k-h
