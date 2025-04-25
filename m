Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1A3E78F4B;
	Fri, 25 Apr 2025 14:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745591747; cv=none; b=X3faSQmPwGJQQhNFJvSBDdMjDI4oNhwiqoXVvlcD1P2klI/7leqVWudLKWVqajxfZncVNMOjEkW4onkzZx0LkJS+QQ3gTcri7JwEuk1NO2ai6EzGq2AV3aMlfXj4y60he9lGJN5FurXgKrXfw+OqyqSPH9Rxsk2wFka21r36Vow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745591747; c=relaxed/simple;
	bh=fdeBkGkMukhxU8cple3tu8Yt8GXBmlJPzBaFw11jie0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pHCdNgixpMzHeZwQOJVbnhpie18IbwC8t1yk1bUbP5hAaA7BeRxTwqCsLW1NF8dFMZvNjIYuWZO53ipx/TZ39uviRakZ1QfmvW7hs9Dp4ZLPUh+KVlzkNmmmhwO8QcOalUScTarGzzefi+W9lXPmQboXrUCIfB8NCKRq3jV03pI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WdnuCepw; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WdnuCepw"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7c542ffec37so260367085a.2;
        Fri, 25 Apr 2025 07:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745591745; x=1746196545; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R7NyS+L3HhIoZbXMf4RXCcEE0afLlZMJpbcou5mRhPc=;
        b=WdnuCepwgNqZBq0wORiR792d9YQbadBeRtZ71xrBaZsSM7k9+Pbh/tCEiiOvRqyBVj
         Nnl/RUw8TUbYZ8oN3qgi5lb+Gcs/F4mr2x82aK+0tMkuhp3NOcYtEzHARCq6wWvmkNZC
         G4iFcHyUvhJ1VJKK93puH7VqwhNJCJS1fAcD6P1jGYdlVQCOXXwFlGJrBM8cUg40MuuY
         3xWj+9FjbihYPs1tNorNrsiOZ+OReKNYgUkqtQXJEXRGAnopeTKn1bFYB4ZbiEXqoaed
         whfvnlNyoi9WSH+GkMZIMYx9Aeo4EcTtWSbmElkQUm1q393fxrMeKtGf6d+7cVYECmt2
         4f5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745591745; x=1746196545;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R7NyS+L3HhIoZbXMf4RXCcEE0afLlZMJpbcou5mRhPc=;
        b=qu7FGNBnszwPOJLPBp8zl7GGu2lvJbfB04/2IcSTHdY/yB2p9P+OXzmDxIlINACUIv
         ivZ0tMGyKpxwfb3dOIvXZE7wa4+Hm9LfiDFtKMC47TFLJjkzbdv72FuaN2J1cS25GIR5
         4tiAaJ5zhTJR/0qpV8mXE9KmnuYyyuw7M3/y/9MoY/uUJaSVipq2S9BQiotN8U7YSIxw
         l5Nmlk5/+F8GwmPPjDOAkXdRDFQwU6iGcPU1u22zK448W4imP5g1IBgJojNgB5iqHi8G
         zvtfEOJkO8Z3MLjfocPd1BOS1S8x4EoC+JQCBPH6BRoE81/QSLakI+9v6ohxPjpHnPms
         OJeA==
X-Forwarded-Encrypted: i=1; AJvYcCVnHb7E4X7wZKhv1FZoCdOEcPIGIn9qb8esJpFg5zJcEveyANupT//HAU8v10cArN6uMLx9yZIop2xoSmk=@vger.kernel.org, AJvYcCWw8g+hAk0SkQlIPUHuYSTv/L/ppOfgOjyQPq0Aua2hzS+HhK1Ri4jo9bRShRyhSKSs8jWGuXHZHPkvefRTrvk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxng3Ivi3AilzTlRm+u60E8TJKIZZPGUx5HFcIhJtoDCrTaWGvA
	IZTAutZj/1/tkgF18ERHTJGARjrvulivNYvMVaMisraJOc5vQfQj
X-Gm-Gg: ASbGncvVeSWGGbl+M77B6PGDH6QP6ti3BUi0hQfN2HoHZ5piajqRXT2XdKknk48ZzL8
	PjqyJFWksKYnnyXoIfH5AJKi/Gg+XDNl69+s2F0/Gcog9vTaYp77xReOon1cUXshaR9DuGBxyDw
	0Fx7tMu3P6atlanZ/QfemiGRHiBjBAAGuG7O46+oQinyMSusU/2iKVAAPLASfEYgxHtLV/gMfY8
	b7IGZCiYSu4B/TN+RLL3UaDrxnA246yaWKQlc1sGZIkxRCgCJlsEqZhw4q2zh7C6kRGStzKD9Am
	srHXHKyQP6Rg7KndLi4JVdw3bJQJfHc4LlkRddr763UTANDn3zFe1ZNzvxVuxcsF8PEQp7zyEs6
	p9R2LukFL5SpQc3Lpb4LJdA/hSV6DGH8=
X-Google-Smtp-Source: AGHT+IFLqjrZzkI6kcfdF9o3ONLC+USZsPR0Qbimq5t24aCXz7pkjAlzpCmPQVRYydFXr419+T7LUA==
X-Received: by 2002:a05:620a:4554:b0:7c7:a537:7ce2 with SMTP id af79cd13be357-7c96072d3f0mr344642985a.32.1745591744597;
        Fri, 25 Apr 2025 07:35:44 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c958e7f1edsm224222785a.89.2025.04.25.07.35.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 07:35:44 -0700 (PDT)
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfauth.phl.internal (Postfix) with ESMTP id 629081200066;
	Fri, 25 Apr 2025 10:35:43 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Fri, 25 Apr 2025 10:35:43 -0400
X-ME-Sender: <xms:v50LaAFUrkUO-OV1eJiIJSpIkm3Oey09vL6z3ZrGpPFNKzJ6Q7SKlw>
    <xme:v50LaJXGlOH83Qme6-q7rgfyFEDghQl3bF59SnJ0HGipYWmuyB3w2VLt1nxUwxg0p
    7x3nQJZfKNY4rOhNg>
X-ME-Received: <xmr:v50LaKLDfvXBkwok1_LSVP-HXDsj6ifwwYVaheWBRT9s7gD9iTRu-ioe>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvhedvheelucetufdoteggodetrf
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
X-ME-Proxy: <xmx:v50LaCFE-IQREtgf9bJmmZb-DXAIlgkkCzUrzO6c2islviRAvfaivw>
    <xmx:v50LaGVsmlMOBZHCSCi6JlEYghdcufpw1BeeibwSm96oDa4uKgn67g>
    <xmx:v50LaFOBJVr2Z9pmSB8CUFB8rBK9DmxYVjCj0TG97pL6OAbXQYQCcA>
    <xmx:v50LaN0zSrlhhmLIF_rVcq47T8557r7pG3gLJALBNFh9H_p2yfYPIg>
    <xmx:v50LaPVvnQ3lYkC_2hLfGZ09SoErUdpWDk0QyI8zexkdWvE_a4LcqZJQ>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 25 Apr 2025 10:35:42 -0400 (EDT)
Date: Fri, 25 Apr 2025 07:35:41 -0700
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
Subject: Re: [PATCH] uaccess: rust: add strncpy_from_user
Message-ID: <aAudvTvdhLwBv9gG@Mac.home>
References: <20250424-strncpy-from-user-v1-1-f983fe21685a@google.com>
 <680a5f5d.050a0220.2035d2.545b@mx.google.com>
 <aAtZQkre4KRU2kr1@google.com>
 <aAuQjSzatuNoDDXL@Mac.home>
 <2025042509-french-washbowl-5cde@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025042509-french-washbowl-5cde@gregkh>

On Fri, Apr 25, 2025 at 03:52:16PM +0200, Greg Kroah-Hartman wrote:
> On Fri, Apr 25, 2025 at 06:39:25AM -0700, Boqun Feng wrote:
> > On Fri, Apr 25, 2025 at 09:43:30AM +0000, Alice Ryhl wrote:
> > > On Thu, Apr 24, 2025 at 08:57:13AM -0700, Boqun Feng wrote:
> > > > On Thu, Apr 24, 2025 at 03:17:48PM +0000, Alice Ryhl wrote:
> > > > > This is needed for ioctls that operate on a user-provided string.
> > > > > 
> > > > > It is somewhat unfortunate that strncpy_from_user does not nul-terminate
> > > > > the string when the end of `buf` is reached. This implies that we can't
> > > > > return a &CStr from the function, since the buffer may not always be
> > > > > nul-terminated.
> > > > > 
> > > > > That said, we could add more convenient helpers on top that add a NUL
> > > > > byte in that case.
> > > > > 
> > > > > This method isn't defined on UserSliceReader because it complicates the
> > > > > semantics. The UserSliceReader type also has its own maximum length, so
> > > > > we would have to limit the read by that length too.
> > > > > 
> > > > > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> > > > > ---
> > > > >  rust/kernel/uaccess.rs | 27 +++++++++++++++++++++++++++
> > > > >  1 file changed, 27 insertions(+)
> > > > > 
> > > > > diff --git a/rust/kernel/uaccess.rs b/rust/kernel/uaccess.rs
> > > > > index 80a9782b1c6e98ed6eae308ade8551afa7adc188..1bd82045e81ea887008e30241bd6de27f096b639 100644
> > > > > --- a/rust/kernel/uaccess.rs
> > > > > +++ b/rust/kernel/uaccess.rs
> > > > > @@ -369,3 +369,30 @@ pub fn write<T: AsBytes>(&mut self, value: &T) -> Result {
> > > > >          Ok(())
> > > > >      }
> > > > >  }
> > > > > +
> > > > > +/// Reads a nul-terminated string into `buf` and returns the length.
> > > > > +///
> > > > > +/// Fails with [`EFAULT`] if the read happens on a bad address. If the end of `buf` is reached,
> > > > > +/// then the buffer will not be nul-terminated.
> > > > > +#[inline]
> > > > > +pub fn strncpy_from_user(ptr: UserPtr, buf: &mut [u8]) -> Result<usize> {
> > > > 
> > > > Sorry maybe there is an email I'm missing, but could you provide more
> > > > context of the usage?
> > > > 
> > > > First the function name is a bit weird, because the 'n' in "strncpy"
> > > > means the parameters should have an 'n' (i.e. length) in it, but there
> > > > is none in the Rust version.
> > > 
> > > There is a length! It's the length of `buf`. It's pretty normal that C
> > > methods with a pointer and length become a Rust method with a slice.
> > > 
> > 
> > That's exactly the point, no need to reuse a name from C if we have
> > something better.
> 
> Up to point, us kernel developers are used to the C names, so keep it
> close if at all possible, ESPECIALLY for just links/wrappers of C
> functions like this one is.
> 

Well, see my other suggestion about always putting a NUL at the end.
Then it's going to be a different function than what strncpy() does.

And I also asked for the usage there, because IMO, there's no point of
replicating a strncpy() in Rust, we should design a better API, rather
than mimic what C does.

> > > The distinction between strcpy and strncpy in my eyes is that strcpy
> > > reads until you find a NUL byte, whereas strncpy reads until you find a
> > > NUL byte *or* you read a user-specified number of bytes. This method is
> > > in the latter category.
> > > 
> > 
> > Then copy_from_user_until_nul()? Or cstrcpy_from_user()? We should have
> > a bit consistent naming on Rust side regardless how C names things IMO.
> 
> You need to specify a max length, otherwise that's just going to confuse
> us all.  strncpy_from_user() is the function we are used to using for
> copying up to N number of bytes from userspace where a 0 termination
> stops the copy if N isn't reached.  So I vote highly for the original
> name here please.
> 

Have you read the Rust the function signature? There is no parameter for
the max length, the max length is implied in the `buf` slice. Plus we
should really consider what the usage is, for example, wouldn't it be
ideal that we provide a buffer that has an extra byte so that the
copy result is always NUL terminated? I randomly checked a few users of
C strncpy_from_user() (alloc_name() in mm/memfd.c, mtrr_write() in
arch/x86/kernel/cpu/mtrr/if.c), they all do the same: providing the
extra byte (i.e. buf size is > n). So it seems preferable to me that we
provide a function doing that instead of just replicating
strncpy_from_user() semantics here.

(You're the one that keeps telling us to focus on usages, and I think
that's a good perspective ;-))

Regards,
Boqun

> thanks,
> 
> greg k-h
