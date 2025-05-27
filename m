Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74131D531;
	Tue, 27 May 2025 23:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748387589; cv=none; b=BBovjRmu8dqjULqI9nXx52WHosKGm769zcFV4edL37tBzmOVGdgvbqbzK1gyhOkvPLNItk5bbSGWuLvl509ts66wWFUh2bPpafQVbipvoZybtG5w7eglnIT+NDi8NPEoSRJIBjld51ImC3VbbgLIa3Vn6zx3SLbYOpz+C+GCqtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748387589; c=relaxed/simple;
	bh=OM1S+xzckocQDitzE0xcXk70w3a+Vur86a4Jg3bhIvM=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JzYrVcJ1vE7tQBmLdesR4O5i/amHWJYMqN22WhtViAZ3VXaoPw/L2XVjNyUeSjFe+Ghdpvz0EdHg7BJR1RW3362pwxYcO/rzqdhpuuvHlaByZY4g964c9CUCZzbAE0o1Dy8ssEKFd0Gz7ifs2gb75pGGXxBGMx+AV/msjyRztmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k+6miZQs; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k+6miZQs"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7c7913bab2cso356009885a.0;
        Tue, 27 May 2025 16:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748387586; x=1748992386; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:feedback-id:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FIeb9xQX45ddiIg6LlYezmAJ/ENKsPdd/luEvBzS8mQ=;
        b=k+6miZQslTq8Ha6ySvqvfKYRcw6cDqjH16/FS2hHmeL0lcc6iNu1DNYrYQO4m+OWrn
         +sDg/qNlMjtzs8g3JcdBLdXSK3tlfPJZFpJ5h/vR6/ZyYkLlHifDNkOoQTmwYOmmm6+j
         5T88PaEqK3jMbe/hXFPFT7njldiXjdmf29vBFVPvkyopznC3geqlEJ0+8Be/gHk/hwe5
         61RdXIGq2ekIS9L3YvyzQvZOYkmRdIMyLMHOm4jQEhg5rhyywg2fyfOm7lWb5fZG3ggg
         nf8lrmaVEsGAnbwzt9zy8AIhfelSAydXH9yaqMWsxzeE2+BiHBh2LNEk6KxQGUpG/EXB
         2asA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748387586; x=1748992386;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:feedback-id:message-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FIeb9xQX45ddiIg6LlYezmAJ/ENKsPdd/luEvBzS8mQ=;
        b=VqvnX+6ZpbqrVRQBmMxG23Xwqa63ngmTEV8Rsi++GgIHBAUK+JEPa409gIZQFZbhov
         EKb5fJpKHRHwggmV1Y8zDdJypVa5nph85m46XfcyqQUhZMp8yFUXAJmh1hhGQ+/3vH5E
         AaZDUTYr5Q6fvsKLx0mq8HbeauIQ1Oi9HJHmmTiA2G+RieD0odWWFtKdhqCffHcmTy7Z
         oUlFI0/DtndRAAMtbNsEiKRN6L4FnPD/TqDhrcZjuBMYdxlUvPiAVsHwmx6Xrkl8H/ta
         8i0OvRB6Cv3tNGwtoYG11cMd0n2aFu2PDXBj24t6dEtfPAeIMyrLGvHtmydcRbbJYoyW
         MC1g==
X-Forwarded-Encrypted: i=1; AJvYcCUQz8oiOJk86KqNpqd4/wW9RfSeyxjWUsq3+8VFFLL5Wqba+GcXJHuoWoTFcsSQnOWbk8Lv0+3MMRoqY2s=@vger.kernel.org, AJvYcCVZSMyqoZVjce4z64pb/c/HcteV2pBk1IfJrrQ+E21EvbaIyW3kz5adkRAMYRDeaxYMG5//vdC9YTYUGX7k7tk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyqXIjFcHcd97rpWXmvUfNpKttrFJxi8ZRKKIqDsaJ+WodJa8DE
	krFATkhk6julRTXslFUnls64fM9boZ+Uuvqn+S6bXs78zrqZBMfHQuLv
X-Gm-Gg: ASbGnctn74EKkvqqpj/XmBtfotszK2pFBxFPZE3KjaxXCogGR9W/uQiRmdy5iy3nrsA
	JVt7RisLckqdZeQfH0tLp7MP6ancVsZbBSZmNuY9XH3MdH63gsMIN3KF9qItyqaon/ZiMehbgfx
	PtLIeBga5x7B5m0qwWM4Qd0UqB+pj6WZxNB4sEISMe/lsJATa92WUVkYb+nieb+mTaeb3+fx9bc
	qhufxjD2oEsKGRM8qvcvEwkWZg5Hl2RUuVFb52MpPe4tj/pph/QtH6E0x5XYLJj56VBg6OAojZ5
	nKJikiqCtb+QwTrg+XXmrY2D0VPYAOLjkcIYOyPt9ch9DgLALoURx5gMdIXwesKn/c7GSmigphI
	XIRZbdSZZKvwBO0bzdnPnztFvGz93UTWa33mhpHf2DJbj5pkFdRJr
X-Google-Smtp-Source: AGHT+IGWY2d2x+KNXNMe3IAPU+UGaqKwbqvFKAE2sokZBPcfOpPqd8K09nKee4n60Y1gUyvahQwNiA==
X-Received: by 2002:a05:620a:3190:b0:7c5:4eee:5409 with SMTP id af79cd13be357-7ceecc3c64amr2536285385a.48.1748387586193;
        Tue, 27 May 2025 16:13:06 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cfc5d485f0sm434885a.102.2025.05.27.16.13.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 16:13:05 -0700 (PDT)
Message-ID: <68364701.050a0220.48858.0017@mx.google.com>
X-Google-Original-Message-ID: <aDZG_3X-4O6fpsPd@winterfell.>
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfauth.phl.internal (Postfix) with ESMTP id C9A941200043;
	Tue, 27 May 2025 19:13:04 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Tue, 27 May 2025 19:13:04 -0400
X-ME-Sender: <xms:AEc2aDze-ZPaS9Yi2VaBWHH43BYyrrFX2R_f4x29i6mzvEhbyzeu7A>
    <xme:AEc2aLSjU65h9JJw_gSy7l9CAVl8aHKVNKGq7S-GbNz_ubajm83wDS8gsK3GjepEB
    n7QO4x2TcH4U_sgNg>
X-ME-Received: <xmr:AEc2aNXDAFh7jDw4zJ8RRFk7YtqtFUaLY9HWmoZVuuxDhKTPKepUb51P-S796Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddvudeijeculddtuddrgeefvddrtd
    dtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggft
    fghnshhusghstghrihgsvgdpuffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftd
    dtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhf
    gggtuggjsehttdertddttddvnecuhfhrohhmpeeuohhquhhnucfhvghnghcuoegsohhquh
    hnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrthhtvghrnhepffdtiefhieeg
    tddvueeuffeiteevtdegjeeuhffhgfdugfefgefgfedtieeghedvnecuffhomhgrihhnpe
    hgihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgr
    ihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqd
    eiledvgeehtdeigedqudejjeekheehhedvqdgsohhquhhnrdhfvghngheppehgmhgrihhl
    rdgtohhmsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohepudehpdhmohguvgepsh
    hmthhpohhuthdprhgtphhtthhopehvihhrohesiigvnhhivhdrlhhinhhugidrohhrghdr
    uhhkpdhrtghpthhtoheprghlihgtvghrhihhlhesghhoohhglhgvrdgtohhmpdhrtghpth
    htohepohhjvggurgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepghhrvghgkhhhsehl
    ihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtoheprghrnhgusegrrhhnug
    gsrdguvgdprhgtphhtthhopegrkhhpmheslhhinhhugidqfhhouhhnuggrthhiohhnrdho
    rhhgpdhrtghpthhtohepghgrrhihsehgrghrhihguhhordhnvghtpdhrtghpthhtohepsg
    hjohhrnhefpghghhesphhrohhtohhnmhgrihhlrdgtohhmpdhrtghpthhtohepsggvnhhn
    ohdrlhhoshhsihhnsehprhhothhonhdrmhgv
X-ME-Proxy: <xmx:AEc2aNgrhKv5TMpiYUexu3roT9yUv9kV0nsRRV3stHj-zWPU_OEZQQ>
    <xmx:AEc2aFB_Dr4lgNjoQHv9l8wC6_AcmYiJwdluAtbl6f5kFNdAar11-w>
    <xmx:AEc2aGKxNDHTyOoRhAGyExtG1X7iOwAPn0QRkVkisAlYi9qbH49hOw>
    <xmx:AEc2aEAkwz9zdL_UkN9V4c5IA7UZdplFrHb_tGbYNMhxTb9ZkOEOzA>
    <xmx:AEc2aBy8WGzyDHjvssNEFka21z1Tf8cEXia-FVHO9evOi4Cm-sAsYJ6D>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 27 May 2025 19:13:04 -0400 (EDT)
Date: Tue, 27 May 2025 16:13:03 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] uaccess: rust: use newtype for user pointers
References: <20250527-userptr-newtype-v2-1-a789d266f6b0@google.com>
 <20250527221211.GB2023217@ZenIV>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250527221211.GB2023217@ZenIV>

On Tue, May 27, 2025 at 11:12:11PM +0100, Al Viro wrote:
> On Tue, May 27, 2025 at 01:53:12PM +0000, Alice Ryhl wrote:
> > In C code we use sparse with the __user annotation to detect cases where
> > a user pointer is mixed up with other things. To replicate that, we
> > introduce a new struct UserPtr that serves the same purpose using the
> > newtype pattern.
> > 
> > The UserPtr type is not marked with #[derive(Debug)], which means that
> > it's not possible to print values of this type. This avoids ASLR
> > leakage.
> > 
> > The type is added to the prelude as it is a fairly fundamental type
> > similar to c_int. The wrapping_add() method is renamed to
> > wrapping_byte_add() for consistency with the method name found on raw
> > pointers.
> 
> That's considerably weaker than __user, though - with
> 	struct foo {struct bar x; struct baz y[2]; };

Translate to Rust this is:

    struct Foo {
        x: Bar,
	y: Baz[2],
    }

> 	struct foo __user *p;

UserPtr should probably be generic over pointee, so:

    pub struct UserPtr<T>(*mut c_void, PhantomData<*mut T>);

and

    let p: UserPtr<Foo> = ...;

> 	void f(struct bar __user *);

and this is:

    pub fn f(bar: UserPtr<Bar>)

and the checking should work, a (maybe unrelated) tricky part though..

> sparse does figure out that f(&p->y[1]) is a type error - &p->y[1] is

In Rust, you will need to play a little unsafe game to get &p->y[1]:

    let foo_ptr: *mut Foo = p.as_mut_ptr();
    let y_ptr: *mut Baz = unsafe { addr_of_mut!((*foo_ptr).y[1]) };
    let y: UserPtr<Baz> = unsafe { UserPtr::from_ptr(y_ptr) };

passing y to f() will get a type mismatch, so the detection/checking
works. To avoid the unsafe game we need field projection [1].

> struct baz __user * and f() expects struct bar __user *.
> 
> It's not just mixing userland pointers with other things - it's not mixing
> userland pointers to different types, etc.
> 

In short, with UserPtr generic over pointee, we can have the similar
detection as sparse.

[1]: https://github.com/rust-lang/rfcs/pull/3735

Regards,
Boqun

> In practice I've seen quite a few brainos caught by that...
