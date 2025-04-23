Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED7E128A414;
	Wed, 23 Apr 2025 16:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745424002; cv=none; b=KEHbHIhJlRSAKwY5GV38t7Faxq7KXzvt1b4MdWOm96O8rb6byGO4r+Y5l8x5YedaSCB3VZzRc8drgFBkOFfc8HE3Cya4UKQydAuOdlGj3A3hiTXCqxGwmMTP1N9ThsI2jhKoA4UxV5UUD/zDkolr/ANO07Uf3nYZDpsI2LiCLYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745424002; c=relaxed/simple;
	bh=QPJfcjXdLieG82fN+AZrPgGVjBSFHt/vMUNUousEIyM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c+spK3EAb8xTaQg4zCq8iMvBuqWTbph0B7qmbtVLo0oWUCOYIKDlIoorKLJUMYHL7Ol7XTaUhXVvIREP4wCQcvXwSKiQK8Kk/8+WBwIfZgKonP04kevG4iO0kPLPcTxSXTRFr2t7Zu/qYu+hQvMrjaToMZ6aLaD8KkFZ6s5MEfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cbrxbRlG; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cbrxbRlG"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6ecf99dd567so562946d6.0;
        Wed, 23 Apr 2025 09:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745424000; x=1746028800; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ouo4X4IJUdjgJTmW5w+NARiJGi4G+qZbFnJpYhAWztE=;
        b=cbrxbRlGDtlBHw7mGOgvT5dFYmRi7fZ57a0Skq/j9WootZL7rUVFTSwKqsk+soOqKQ
         EBww0R0xzeW/hOnYT28IbJjl82MeG0rup3XYQXwSeMkswMW3qsShAqBxYpzQ4rD2WE3X
         q5QLxMG1TBHnnbPgbMngCxTDLBT2kRPi6Yitcuhf6w/zjgWTZMNWQEDeBBUQXnZDwEpR
         gQjQSpTi33vXugRv4rfGociOrhcWgkpvGle58XgKhEs4zpAwDKEgalR7yyX0p9chUNlu
         0tXnoE9C1xQRKOAhJhNZr5xzQJ5SegVE67IbjzZi6MN4XodBb244KxaUTvQjkqMr9hng
         LSmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745424000; x=1746028800;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ouo4X4IJUdjgJTmW5w+NARiJGi4G+qZbFnJpYhAWztE=;
        b=W3IX214pmem2NTbxwvgc16VBBG077nU5wsDNNzzMgl/fjGEwG8WkC7CpERN/WsMpkj
         Mjd24Ufbn/PJsLhSfi9NtZZllqHAQrvsHm8fyhxOZdBGCZILuLVSAsZEWWAnbGJ0yKee
         GdFwDLbrrfLrKUDw4fTCqECbxzlbW+4Gp3vYDMl8gUnYRu586JPc1R7g3x0wVihjOOIh
         JWDm89otxXk+gNNmGK+56zh3lo9aS82xgz9ZMQfVqswQZ8eh+2DCSn5MxfvzSUiPotxg
         BmL/SRe3S0ACpqgS/2+bHRkczsUifkeRkbhRPi210qJABBwhPjwi2ZPFtZAVdfztpWn/
         mYHw==
X-Forwarded-Encrypted: i=1; AJvYcCX4rNHmFHEFoamc4NsfYUQgCwOU1UdoIJ1lAs+YwIF06L9Fm3y+qg/f2BRb0P4k7A88SaEldR4WKJAV3O20cyw=@vger.kernel.org, AJvYcCXwb7jGJCsmprukhz+rqUt9AmWrj/OS4mdNPiDFimQ8d2lDMu3Qb/RnlYwygVJILgTBwUohI64csRrZDXI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUFVIapRl4WpQOvDh80xsNp5hcnlaeLjSgs7LM2xvfkmIyZqPs
	Nwb1LIiWhR10dQMO6xd4vyFAqXgHNWcOq3nKaIAdGPTn+UpzNtU6
X-Gm-Gg: ASbGncuchwa0Y7mycJwVWSHPcsFBBdjVHrdJ4RPUJSYWBW6ykaG28CNqd4766y+EPYk
	/odIDU33Y/qs5UrPTB1Pn0FXq4RML7li9fq1m0o9EkEHZLJwKiNaJd6LhfuJY/7NJ9oS+U+ASzX
	BABs5OozHWsWbCfY8a9QQvCVNhDzfwRX/6jvJZaDQo9/4b2OewpmpCWiGOLAMj6n7Mnkn6124GZ
	8t20QfUi7Ur64gcRMJMbeqNcf7iW5Mm7Uhn7tX/SbaLr5+BMcM7ISMWyQ2lq0pb58fpUhI+4Nr1
	YdZCVVp4Sy7+V/4muepc2BfalDgMHNOXMHMlhYpcR+yjjEjokzFE8OCW3mIuHnB6bCWLPMFuqN8
	whz5DBnWLgnR4wYRXzFcP0Kmq5bzm8zc=
X-Google-Smtp-Source: AGHT+IFQL4/eHWDTwuX2mRBHoZlsBgouOwIX6qIDFuzVAzjKEXALU0XbvEgwIN5msgrac1BdzJtHSQ==
X-Received: by 2002:a0c:ff0a:0:b0:6f2:d45c:4a35 with SMTP id 6a1803df08f44-6f2d45c4c2fmr214701366d6.37.1745423999562;
        Wed, 23 Apr 2025 08:59:59 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f2c2c21cccsm71913046d6.106.2025.04.23.08.59.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 08:59:59 -0700 (PDT)
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id B8CE81200043;
	Wed, 23 Apr 2025 11:59:58 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Wed, 23 Apr 2025 11:59:58 -0400
X-ME-Sender: <xms:fg4JaBe-roJo0YgN5QuBVC1zAzy_jk6w0pgtCRu4SXuhwmXg2eMGEg>
    <xme:fg4JaPO1WRpGcHJwxLl_GV0cC8ZHgCrtBI6Sniza2BRzgAWBM-MSzIxCEBupQMkKY
    irPuByZb7dszrU5bQ>
X-ME-Received: <xmr:fg4JaKgiDz-PCZRoZD41w2qy55V6VlBv51Rn0Oygr4ZfUmWs3Q-oTN0Z>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeejtddvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddt
    vdenucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrih
    hlrdgtohhmqeenucggtffrrghtthgvrhhnpeehudfgudffffetuedtvdehueevledvhfel
    leeivedtgeeuhfegueevieduffeivdenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
    grmhepmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgr
    lhhithihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsohhquhhnrdhfvghngheppe
    hgmhgrihhlrdgtohhmsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohepiedpmhho
    uggvpehsmhhtphhouhhtpdhrtghpthhtoheprghlihgtvghrhihhlhesghhoohhglhgvrd
    gtohhmpdhrtghpthhtohepuggrkhhrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehm
    mhgruhhrvghrsehgohhoghhlvgdrtghomhdprhgtphhtthhopehruhhsthdqfhhorhdqlh
    hinhhugiesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhk
    vghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopegsohhquhhnse
    hfihigmhgvrdhnrghmvg
X-ME-Proxy: <xmx:fg4JaK8dWFozj2aO0KZt0FDdm-tFpY-L97ls-qGL2q0OZfjpGmuNxA>
    <xmx:fg4JaNuhx_28ieyG9MzjfpipfT9ydU6MDqzSec-Jo3vkU1VRm-p3ow>
    <xmx:fg4JaJFINQrhZrdV5Oq1Ugd2Wl5f-h1t4J4rs2BwemKR15uvEUIpgQ>
    <xmx:fg4JaEO9K05kYuHaF046nVOQDc-v9j9RUKDyIXfye158Aj-glETX0g>
    <xmx:fg4JaGOUHjE0SBBiNTfcXc5tA57MdWQ4q23YQEW4ccJlMmKf8OJHeKc8>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 23 Apr 2025 11:59:58 -0400 (EDT)
Date: Wed, 23 Apr 2025 08:59:57 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Matthew Maurer <mmaurer@google.com>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/7] rust: alloc: add Vec::push_within_capacity
Message-ID: <aAkOfZ6I_w4VUsnx@Mac.home>
References: <20250422-vec-methods-v3-0-deff5eea568a@google.com>
 <20250422-vec-methods-v3-3-deff5eea568a@google.com>
 <68080a53.050a0220.c2cd7.6290@mx.google.com>
 <aAirBuiNdraU4ty3@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aAirBuiNdraU4ty3@google.com>

On Wed, Apr 23, 2025 at 08:55:34AM +0000, Alice Ryhl wrote:
> On Tue, Apr 22, 2025 at 02:29:53PM -0700, Boqun Feng wrote:
> > On Tue, Apr 22, 2025 at 09:52:18AM +0000, Alice Ryhl wrote:
> > > This introduces a new method called `push_within_capacity` for appending
> > > to a vector without attempting to allocate if the capacity is full. Rust
> > > Binder will use this in various places to safely push to a vector while
> > > holding a spinlock.
> > > 
> > > The implementation is moved to a push_within_capacity_unchecked method.
> > > This is preferred over having push() call push_within_capacity()
> > > followed by an unwrap_unchecked() for simpler unsafe.
> > > 
> > > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> > > ---
> > >  rust/kernel/alloc/kvec.rs | 41 ++++++++++++++++++++++++++++++++++++++---
> > >  1 file changed, 38 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
> > > index ebca0cfd31c67f3ce13c4825d7039e34bb54f4d4..a005a295262cb1e8b7c118125ffa07ae252e257c 100644
> > > --- a/rust/kernel/alloc/kvec.rs
> > > +++ b/rust/kernel/alloc/kvec.rs
> > > @@ -307,17 +307,52 @@ pub fn spare_capacity_mut(&mut self) -> &mut [MaybeUninit<T>] {
> > >      /// ```
> > >      pub fn push(&mut self, v: T, flags: Flags) -> Result<(), AllocError> {
> > >          self.reserve(1, flags)?;
> > > +        // SAFETY: The call to `reserve` was successful, so the capacity is at least one greater
> > > +        // than the length.
> > > +        unsafe { self.push_within_capacity_unchecked(v) };
> > > +        Ok(())
> > > +    }
> > > +
> > > +    /// Appends an element to the back of the [`Vec`] instance without reallocating.
> > > +    ///
> > > +    /// Fails if the vector does not have capacity for the new element.
> > > +    ///
> > > +    /// # Examples
> > > +    ///
> > > +    /// ```
> > > +    /// let mut v = KVec::with_capacity(10, GFP_KERNEL);
> > 
> > Should be:
> > 
> >     /// let mut v = KVec::with_capacity(10, GFP_KERNEL)?;
> > 
> > , right? I.e. a question mark is missing.
> > 
> > The rest looks good to me.
> 
> Will be fixed in the next version. Let me know if you want me to add
> your Reviewed-by tag with this fixed?
> 

Sure, feel free to add

Reviewed-by: Boqun Feng <boqun.feng@gmail.com>

Regards,
Boqun

> Alice
