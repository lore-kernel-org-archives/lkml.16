Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94AF13234;
	Wed, 28 May 2025 16:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748448155; cv=none; b=tptD1J/ZgUGP9hhQt+r3JF9cF/bP37Yy8snr4k3WUFanaOjQbgJn1WqBUbSbk5hYbNFYWuSZl7AzsgOSKOr/sVnl4v93e3wO8ZaanQKW0kn7CHA8W0/Ef0F5X2OMv2AA+80NNK26J9rrOM672+yXQHXGp7QZ5MM98xuIpB8x6AY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748448155; c=relaxed/simple;
	bh=BfaLnGVVAMXeRLwpyWCe0o/QrbP67rbScb+PH9wdpLE=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lYHknyX27TZl7kjod5bIMSUSc3qPq/33bnWISA9lZ0SyG43d0Pb6t6gin0wU/tDZXGYWaOkqt2k+P96RxrgWSrAc9a/KvdWmNt4Wqb4WGTFMoIQ6TK9oT4D1pCTZHYAgCd5pLBy8H8HU6ICoIkVzE/eszNw7w+MBDMyulWREXZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QxDSKSsS; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QxDSKSsS"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6ecf99dd567so379346d6.0;
        Wed, 28 May 2025 09:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748448152; x=1749052952; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:feedback-id:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6pJnqnr02148Y6KCRblrRe9rVOkiYKPXEDLgkGFViuE=;
        b=QxDSKSsSI2ZaSPUhk+2+cDqY7nF4M1bzpHiQXEKXY1OlF0MUzcTSFkR+NLV4bsZy+9
         LOU5+joQItQle93+a2s7Ig/aBo8FmV+6nE0Zajk8Y8LxPTyf+53MPCK3WH1PhMaRms//
         n9op56ruxtVu7+zxlJYelcfAG9kpIzfzYkMQKPMkRV4abuhaa4PpVcGtvZVHfDhqB+Si
         Vmk3Iyff9Vl2gJKSr+Myd+1//R45twpwwNEeVzgc+Jy+yEaGl0+uXlBEAUe14771fepH
         N3WK/WI9qGOwV+jC9iiIV6o/0tRf4xKjDq5xH7WGefpPZ52ZxObtWsem1ib02nw5VrrX
         ecJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748448152; x=1749052952;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:feedback-id:message-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6pJnqnr02148Y6KCRblrRe9rVOkiYKPXEDLgkGFViuE=;
        b=Uuhmsx/HixIiKHsTADk80FIvzD8/Fu24gGGzvWB3gNX9dzxm4QQa/GdWXSjRr6QMtW
         mpBhL7zBD0zjr9X8joMiIGxxDfbUCIIiJl9eLCytYehuV/NTC4bZsj+wLyVPx6726dpJ
         TcqfKBu2C9RBn2kWQ4/s+Guy43rFMCiumaIkP1b1vWxEEoKmItmK8NUVd3PLscXaD4Vr
         nGiBCrXqjDUkBV4O8qcfi3gLtW6LWfC/bjIEacj6snN22Y6YZQzuDK7i47JL4i5Ybg5M
         xGV/VZLGbKvt7/qxQNDFdSZB4OoHshVgTfGlswahhHK0ONaGvLfya2fc8vNluwXN7XKr
         pMaQ==
X-Forwarded-Encrypted: i=1; AJvYcCVb0BucaQI78gUNsOAqBtbtbE61m4AHbVCNW3vkHJYO0MNXY+IwIjTayvulkWZDLUmhm3kaX0yaYqMkWRU=@vger.kernel.org, AJvYcCXVi6Cw3kkf5cHU2FP/QvJ9rGaRwBly0+6WQkJALlLURjRhSKNJdRG4jnayA+v5wGt8IDnoiPc1Rp7lIgF4YaI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwSBWvgv63Tmr9V3+I7nPEbmqmma5f+XLdRvPbRrmWMRdcsFMjc
	fvHlngzM0661lQB1VmvTxoEUMh4tDGB9Ebw41pn29OYu+NggIrBYZdLb
X-Gm-Gg: ASbGncv0AEjWz7XCLODkZ3xNLwRmpGS6pN/f3uzxHNSNC8oANruZkDAg/oAwZW6bRpY
	IeX7GMoZIZSrvbI5JItvMF45pe0l8wfhzqIzPK/4a066gjMFhzp4UNiDrF4adqOvlTGja2ZMDy+
	cucgFPwo6ND8jAcJkopL2NAg+HDCjCQHc31aEs8FV0vvqt7OU2LRG9+GNTCYZd51zX7+qf72HrS
	D6cV4etU2gbzm0HYsP3oiHrbjyFjbMT0AS8GuV3ZQGa2vhvtb5pZ2Cuj5lWkFEvwbqdzaMm+uKl
	KgQmzRo6CCyuPmAvwB2j5Spt+8iUaqB4Bn7pYXh+VjVZk/BC0LpdxPP8/Tb4P++slWO6Eiz8eWd
	YtcxJxrm/hUFJNrDL4R5KLJ1+ldZq/JFcq9vRtFQlvw==
X-Google-Smtp-Source: AGHT+IEj1aBYgtsIbxF3nbJLZWnraAF3NKveBguXb55vmTnnLPGMU1HlcAD8nkRwVJsLjQOT2OfHmA==
X-Received: by 2002:a05:6214:5095:b0:6f8:af2b:8ba7 with SMTP id 6a1803df08f44-6fa9d169f5dmr258168286d6.24.1748448152162;
        Wed, 28 May 2025 09:02:32 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fac0b3b66bsm7957036d6.57.2025.05.28.09.02.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 09:02:31 -0700 (PDT)
Message-ID: <68373397.0c0a0220.2ee6b.2fb9@mx.google.com>
X-Google-Original-Message-ID: <aDczlTQQzbfPXzey@winterfell.>
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfauth.phl.internal (Postfix) with ESMTP id EC75B1200068;
	Wed, 28 May 2025 12:02:30 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Wed, 28 May 2025 12:02:30 -0400
X-ME-Sender: <xms:ljM3aINkF85vo4dlFZfGWc3slJUF1ZPH1mexJ_yx5V-o4mzFZtcHnA>
    <xme:ljM3aO-Z_U4agQ-XRRQRrihNmzwsqxPPII8GAdY_s3Oax_Eky25dzlaEuvYINiAET
    CEcW5YJJvgK3AB55g>
X-ME-Received: <xmr:ljM3aPSc-5uJdWR5ynE2IBqLhkOlutv0DDFDdvaO-UC_1_2uzT2F9eVmGDSihZGRnVQvgdQvwwym>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddvfeeikeculddtuddrgeefvddrtd
    dtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggft
    fghnshhusghstghrihgsvgdpuffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftd
    dtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhf
    gggtuggjsehttdortddttddvnecuhfhrohhmpeeuohhquhhnucfhvghnghcuoegsohhquh
    hnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrthhtvghrnhepiedtfeevhfet
    keelgfethfegleekfeffledvvefhheeukedtvefhtedtvdetvedvnecuvehluhhsthgvrh
    fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhp
    rghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedtieegqddujeejkeehheehvddqsg
    hoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfhhigihmvgdrnhgrmhgvpdhnsggp
    rhgtphhtthhopeduiedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheplhhoshhsih
    hnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehvihhrohesiigvnhhivhdrlhhinhhu
    gidrohhrghdruhhkpdhrtghpthhtoheprghlihgtvghrhihhlhesghhoohhglhgvrdgtoh
    hmpdhrtghpthhtohepohhjvggurgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepghhr
    vghgkhhhsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtoheprghrnh
    gusegrrhhnuggsrdguvgdprhgtphhtthhopegrkhhpmheslhhinhhugidqfhhouhhnuggr
    thhiohhnrdhorhhgpdhrtghpthhtohepghgrrhihsehgrghrhihguhhordhnvghtpdhrtg
    hpthhtohepsghjohhrnhefpghghhesphhrohhtohhnmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:ljM3aAt4-Ab_1Obb2rBA5a_v2j1UlHJKAsw7tPaNeADDAuuzIUIjaA>
    <xmx:ljM3aAfDDKRukUelNx5wwfVlBq7ws9WwH9IMIPOA6FokY8nsMPCDoA>
    <xmx:ljM3aE3wAa4zkaVawqnZMUuw0jGC1d9CXpi7hS2LUwbs-ko0pZrh9Q>
    <xmx:ljM3aE8QUpSA4nIyL3YcrjtKvWw61rzp93FJYTuHoBEu-SYGiH3Q0g>
    <xmx:ljM3aH-4HHUZwYlbRDZ1Iy3V-EZaVd--TD2Mr0M1jv0up0mQy4gwxdmW>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 28 May 2025 12:02:30 -0400 (EDT)
Date: Wed, 28 May 2025 09:02:29 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Benno Lossin <lossin@kernel.org>
Cc: Al Viro <viro@zeniv.linux.org.uk>, Alice Ryhl <aliceryhl@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
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
 <68364701.050a0220.48858.0017@mx.google.com>
 <DA7WMFWY8I6Z.2EADXSPL111PP@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DA7WMFWY8I6Z.2EADXSPL111PP@kernel.org>

On Wed, May 28, 2025 at 05:38:08PM +0200, Benno Lossin wrote:
> On Wed May 28, 2025 at 1:13 AM CEST, Boqun Feng wrote:
> > On Tue, May 27, 2025 at 11:12:11PM +0100, Al Viro wrote:
> >> On Tue, May 27, 2025 at 01:53:12PM +0000, Alice Ryhl wrote:
> >> > In C code we use sparse with the __user annotation to detect cases where
> >> > a user pointer is mixed up with other things. To replicate that, we
> >> > introduce a new struct UserPtr that serves the same purpose using the
> >> > newtype pattern.
> >> > 
> >> > The UserPtr type is not marked with #[derive(Debug)], which means that
> >> > it's not possible to print values of this type. This avoids ASLR
> >> > leakage.
> >> > 
> >> > The type is added to the prelude as it is a fairly fundamental type
> >> > similar to c_int. The wrapping_add() method is renamed to
> >> > wrapping_byte_add() for consistency with the method name found on raw
> >> > pointers.
> >> 
> >> That's considerably weaker than __user, though - with
> >> 	struct foo {struct bar x; struct baz y[2]; };
> >
> > Translate to Rust this is:
> >
> >     struct Foo {
> >         x: Bar,
> > 	y: Baz[2],
> >     }
> >
> >> 	struct foo __user *p;
> >
> > UserPtr should probably be generic over pointee, so:
> >
> >     pub struct UserPtr<T>(*mut c_void, PhantomData<*mut T>);
> >
> > and
> >
> >     let p: UserPtr<Foo> = ...;
> >
> >> 	void f(struct bar __user *);
> >
> > and this is:
> >
> >     pub fn f(bar: UserPtr<Bar>)
> >
> > and the checking should work, a (maybe unrelated) tricky part though..
> >
> >> sparse does figure out that f(&p->y[1]) is a type error - &p->y[1] is
> >
> > In Rust, you will need to play a little unsafe game to get &p->y[1]:
> >
> >     let foo_ptr: *mut Foo = p.as_mut_ptr();
> >     let y_ptr: *mut Baz = unsafe { addr_of_mut!((*foo_ptr).y[1]) };
> >     let y: UserPtr<Baz> = unsafe { UserPtr::from_ptr(y_ptr) };
> 
> Shouldn't this use `wrapping_add` since the pointer shouldn't be
> dereferenced?
> 

Good point, so:

     let foo_ptr: *mut Foo = p.as_mut_ptr();
     let y_ptr: *mut Baz = foo_ptr.wrapping_byte_add(offset_of!(Foo, y[1]));
     let y: UserPtr<Baz> = unsafe { UserPtr::from_ptr(y_ptr) };

(using wrapping_byte_add() + offset_of!())

Regards,
Boqun

> If we don't use `wrapping_add`, then the field projection operation for
> this type must be `unsafe`.
> 
> ---
> Cheers,
> Benno
