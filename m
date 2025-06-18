Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 462FF1FDE09;
	Wed, 18 Jun 2025 05:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750222907; cv=none; b=PAguaAkuZrJBCivhCI0oFTbzhDuFYaZjTs+ydV6pctiUXrxhtwi/1kNvoXV42mBhXQd8wkARBFUnjcyi+PrUIZ+UW9bIhoSn9JKfzMJaG8b5YRNbuI6hd+wABJ+iVYcihE2fKYFH3LS7Y0LFs5APcplkXZIrLoK62OJAT2poRDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750222907; c=relaxed/simple;
	bh=BfigIgRrToIGrLTr4lcde7vaVdFGL5utAWrI7l1J+FA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Isk2RZO3mO2Ll4i6ZXlTezQgi+6lBKARctLEUm9y4pCZ1RbkGOny9Bg6Erii/CXlV4nH5Hknin50aSDfPj/kIo9RKL5IuatVyY5h4qhdVQ+YALmJVtFsbeYKvdCj8p3Yf9FFWsORpvUUKq3CZXuuVnolPGQycchTShyN9f1b7R0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E67BJwxU; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E67BJwxU"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6fa980d05a8so60214546d6.2;
        Tue, 17 Jun 2025 22:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750222904; x=1750827704; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/6rhOO9XqYvs+n6bpe7FIPcze+Fg/amOVJg+3P/e4+Q=;
        b=E67BJwxUMRgIjjCidmnDYbppCKuVp1yYveDrIwQSYJzWvdK7EghYrqXbh3FnzHkdvk
         E8CAFNgsL6lDXL0L7YQFUn7EjBFC7aVfCngfYO2dOi2VyBguInHkkT1CMl3yuUz3BhCC
         gJ0Pmm+6uJoeC1749hQlqGbvkolIifinoQRYe8cfRhTfbZK/uPhQV7Agswrl8tV/g8pI
         44NCIKqpCbGgiH9KwO4OMzT6gVAxbkQnU7F7hHWEnjihXcFXb95N7lh4nVyKJXOhsbqh
         TRVIWXTmDwjOcqen1Y9LD79/HWt4btp4OWjs42lXSHolFs4nb4T2eeM06MrBb+EA9oYD
         TSNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750222904; x=1750827704;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/6rhOO9XqYvs+n6bpe7FIPcze+Fg/amOVJg+3P/e4+Q=;
        b=GH6g1FteeVAY7zlr+UB5Egm+lAkCs+OcN+FQgdoXeTkwhuenNKOnOMSBf5kw8RAgZf
         1MsmmRAgqf0EBp024DuGE4XtYtyRMartYK8+Hhik25Ad6UYl48HLo1LzKF/kAamo/4uR
         n16M6jKogtHokrAq3ANQHGmEITct9G/O1mnIniPfvjaCwkA5ygxUaKaXqfZa1I2fRYVy
         GAs7MHZiIz863UVB6k6BtP4rMFAytHGX9XySKXf/czlAO7dT5XhVdGgQx7fuOKH5MQ0V
         qRFyEeTVg8jFEXqhYkvqvAjrVS3P4P7V37uM8rRCOTod5241eMKH/QVJOqing7B62kRP
         zJ/w==
X-Forwarded-Encrypted: i=1; AJvYcCUw2n+Y1FC4Mnu/BLvGQxvg4NBAMay8qlD9bv+CviJTKgHgh7n5dccZu2R0Eifq/97PChHh7upuBYXMCfpfGS0=@vger.kernel.org, AJvYcCVYPk30J7E7s4b+f4BhDz+2FUcFsdkIoXcSb3GW3ZxqnbL8UdYZLmKUEBs+v4Z4qeo/gnHNKgfxGILNHBk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPXBanM+/B/wf/jwBmo/Nji5EaPyZ1gBzUkLqN8Pp2gvWg3wIe
	EEaToyu14JSFpJ/T+uZ1Ib5zeKKRJBkDeUxzfGl4oEblQBAnnz05dvx+
X-Gm-Gg: ASbGncuO5peX/tej5/jrVhJUPaU3Bn3l200m7cw1zYpqOeWEaOT1qf80+6irKCtq5fx
	KA1ycB62ABv0TLAt+oYkEroUhQNEqh+E3XlfegZ9ZOKyDaCwsZbKLHMH88jSs7PZybJA+z0KHvy
	yeSfPmyKud6Rp4UA0ARhvgBgmqqPNXG4WGmvrqj7zrtkpgokNPo5yOaawQDZYmz1VkH0NhUzgJg
	6gMlmdTbmJ0UTbusf5Z5bACLN0+sKUW0VfvZ9UiQKg1gagej7tGyb4JfU+pOKQ4osGYmWOpVcFI
	3ZhtJQ3ZFZy3Fwcs7/1pkmQF3vjmyhVGuwLr5fofbDQRS17DXxWRsIT+Au17UDW6RBP3EXTbgE/
	E/tO9IzLSZB00AQgxLlgUIQL6HyJA964yJJ0n6EXQZU0lOORs8m5H
X-Google-Smtp-Source: AGHT+IEHVgT0JWHxZcN6y85oBZsGRvLXlIydgmn/Tc4fH8DanmeNopCqO+Sskjc0G5jyU2oExL+tLg==
X-Received: by 2002:ad4:5ca7:0:b0:6fa:90a2:4ec2 with SMTP id 6a1803df08f44-6fb47770191mr262543776d6.25.1750222903970;
        Tue, 17 Jun 2025 22:01:43 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fb59339378sm21596656d6.46.2025.06.17.22.01.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 22:01:43 -0700 (PDT)
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfauth.phl.internal (Postfix) with ESMTP id B9FF91200043;
	Wed, 18 Jun 2025 01:01:42 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Wed, 18 Jun 2025 01:01:42 -0400
X-ME-Sender: <xms:NkhSaL3KxJxKJmEXMTRw989j01CYUEkhmdQYuasWnpKpXnzt9IrHRw>
    <xme:NkhSaKE8IqKmnfPCDValjfD0HyxVfJYeWnu6qA-5EE9DIw_LfxGv6572MN3S2NbVj
    q6D0AL3fxjXWJoq5w>
X-ME-Received: <xmr:NkhSaL7O2ETzE6a_IU3diXWMegVXj4l14jRDB2UYycV9Es7JYVaDQQ5FoA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdduleelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvden
    ucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrd
    gtohhmqeenucggtffrrghtthgvrhhnpeehudfgudffffetuedtvdehueevledvhfelleei
    vedtgeeuhfegueevieduffeivdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhi
    thihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsohhquhhnrdhfvghngheppehgmh
    grihhlrdgtohhmsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohepudelpdhmohgu
    vgepshhmthhpohhuthdprhgtphhtthhopehfuhhjihhtrgdrthhomhhonhhorhhisehgmh
    grihhlrdgtohhmpdhrtghpthhtoheprgdrhhhinhgusghorhhgsehkvghrnhgvlhdrohhr
    ghdprhgtphhtthhopegrlhgvgidrghgrhihnohhrsehgmhgrihhlrdgtohhmpdhrtghpth
    htohepohhjvggurgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghlihgtvghrhihh
    lhesghhoohhglhgvrdgtohhmpdhrtghpthhtoheprghnnhgrqdhmrghrihgrsehlihhnuh
    htrhhonhhigidruggvpdhrtghpthhtohepsghjohhrnhefpghghhesphhrohhtohhnmhgr
    ihhlrdgtohhmpdhrtghpthhtohepuggrkhhrsehkvghrnhgvlhdrohhrghdprhgtphhtth
    hopehfrhgvuggvrhhitgeskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:NkhSaA0nGrpqP0jXeoUPle72Grs5uoPaL5VQNLfXfc_WRqJmDx0K2Q>
    <xmx:NkhSaOESeD73FACEEq-dxYy5lG7p8ATe2JUVOiVTjFcMOtNs9VfFNw>
    <xmx:NkhSaB_MaICBPbchMOH6MskN2nNCD50tL-RmlukcpakllPlabCqUqQ>
    <xmx:NkhSaLlUNFV1vUOaxDAwNNFn5hCWp5phYNx9p8feo5vWcnL2_vMuhg>
    <xmx:NkhSaKEVo9yxY4DXPSsnVxfVRN8IVSqYSNyyAgizYTk5SrMjrqyWS5BA>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 18 Jun 2025 01:01:42 -0400 (EDT)
Date: Tue, 17 Jun 2025 22:01:40 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: a.hindborg@kernel.org, alex.gaynor@gmail.com, ojeda@kernel.org,
	aliceryhl@google.com, anna-maria@linutronix.de,
	bjorn3_gh@protonmail.com, dakr@kernel.org, frederic@kernel.org,
	gary@garyguo.net, jstultz@google.com, linux-kernel@vger.kernel.org,
	lossin@kernel.org, lyude@redhat.com, rust-for-linux@vger.kernel.org,
	sboyd@kernel.org, tglx@linutronix.de, tmgross@umich.edu
Subject: Re: [PATCH] rust: time: Seal the ClockSource trait
Message-ID: <aFJINI8ImfxMnvrx@Mac.home>
References: <20250617232053.3927525-1-fujita.tomonori@gmail.com>
 <aFIEAiDKnxsZQ8s4@tardis.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aFIEAiDKnxsZQ8s4@tardis.local>

On Tue, Jun 17, 2025 at 05:10:42PM -0700, Boqun Feng wrote:
> On Wed, Jun 18, 2025 at 08:20:53AM +0900, FUJITA Tomonori wrote:
> > Prevent downstream crates or drivers from implementing `ClockSource`
> > for arbitrary types, which could otherwise leads to unsupported
> > behavior.
> > 
> 
> Hmm.. I don't think other impl of `ClockSource` is a problem, IIUC, as
> long as the ktime_get() can return a value in [0, i64::MAX). Also this
> means ClockSource should be an `unsafe` trait, because the correct
> implementaion relies on ktime_get() returns the correct value. This is
> needed even if you sealed ClockSource trait.
> 
> Could you drop this and fix that the ClockSource trait instead? Thanks!
> 

For example:

    /// Trait for clock sources.
    ///
    /// ...
    /// # Safety
    /// 
    /// Implementers must ensure `ktime_get()` return a value in [0,
    //  KTIME_MAX (i.e. i64::MAX)).
    pub unsafe trait ClockSource {
        ...
    }

Regards,
Boqun

> Regards,
> Boqun
> 
> > Introduce a `private::Sealed` trait and implement it for all types
> > that implement `ClockSource`.
> > 
> > Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> > ---
> >  rust/kernel/time.rs | 11 ++++++++++-
> >  1 file changed, 10 insertions(+), 1 deletion(-)
> > 
> > diff --git a/rust/kernel/time.rs b/rust/kernel/time.rs
> > index eaa6d9ab5737..b1961652c884 100644
> > --- a/rust/kernel/time.rs
> > +++ b/rust/kernel/time.rs
> > @@ -51,6 +51,15 @@ pub fn msecs_to_jiffies(msecs: Msecs) -> Jiffies {
> >      unsafe { bindings::__msecs_to_jiffies(msecs) }
> >  }
> >  
> > +mod private {
> > +    pub trait Sealed {}
> > +
> > +    impl Sealed for super::Monotonic {}
> > +    impl Sealed for super::RealTime {}
> > +    impl Sealed for super::BootTime {}
> > +    impl Sealed for super::Tai {}
> > +}
> > +
> >  /// Trait for clock sources.
> >  ///
> >  /// Selection of the clock source depends on the use case. In some cases the usage of a
> > @@ -58,7 +67,7 @@ pub fn msecs_to_jiffies(msecs: Msecs) -> Jiffies {
> >  /// cases the user of the clock has to decide which clock is best suited for the
> >  /// purpose. In most scenarios clock [`Monotonic`] is the best choice as it
> >  /// provides a accurate monotonic notion of time (leap second smearing ignored).
> > -pub trait ClockSource {
> > +pub trait ClockSource: private::Sealed {
> >      /// The kernel clock ID associated with this clock source.
> >      ///
> >      /// This constant corresponds to the C side `clockid_t` value.
> > 
> > base-commit: 994393295c89711531583f6de8f296a30b0d944a
> > -- 
> > 2.43.0
> > 
