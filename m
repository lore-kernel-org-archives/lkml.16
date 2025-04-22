Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6EF12BCF72;
	Tue, 22 Apr 2025 21:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745357399; cv=none; b=W0A2JRyBVKBxithJ0+g9oPHUbGsaC6z22HNswgj8dCGiRputHs32IOH7ufU7PEuFqh1X6OpGFsaIUa2Un/GW8UzHBTAOFb57J9W4lfsAXHWYEf7KMFjURJVn2Yf4XU1ZSnQ+jxIzo4GEUKfULcstBHugMngc0TtNz2p9TJT9ub0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745357399; c=relaxed/simple;
	bh=wi1Vil8SnJaYMa9h0eFuXCHbGVeBFLu5MRGCP/dmpIc=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gE0kxwd0sAMFg1sxPyWx1wi0g8A3nfZgpS2Ry5OheN8uDoUqRDFOri/n/hruoXUcGzOhl4BbwUavHQSogtQxuLr4vE8phKkgJ/Fr7U90XCiuV0xRlzQYOv3tQlQF3g8584G+BAS+jMBsjxb15OY3PivYZ8heYtyol/D0un254Yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mMMQRaBF; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mMMQRaBF"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7c922169051so238927685a.0;
        Tue, 22 Apr 2025 14:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745357396; x=1745962196; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:feedback-id:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kfCCpV5yGpw+yXlwBosH+v8yoeaVUArIv11TpYTddyA=;
        b=mMMQRaBFtszj/GN/KPyVb5GRWfN2+RmH9uF9kf9xamok/IecAljJWnKL3zEdz7pbJX
         GW9XBqKShyIld2n1oexh92z8cBK3u/nbXmmr4n//namWly7ckci0WmM2lY9wflvM13ff
         Xxj6eIdOZXa03sRMGWQ6XTk8JADG8+0KPhcHy6NYkmS1Ots2UsKz+D63hcw9hets/upW
         wbh6upcyR1RW69WtxXXXLuV58P2rDRz2aaTh+EwdDD1JalXfxUcsVP9AarJUkW33jj33
         00mD05yBxH1uDcf7SxLULbnLblp/RAKEIhbwUmvZjYOqYAZsu+7Eb8r8suJ8dTrHOrzZ
         A1Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745357396; x=1745962196;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:feedback-id:message-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kfCCpV5yGpw+yXlwBosH+v8yoeaVUArIv11TpYTddyA=;
        b=evIdcpOzCsBKQ/chBqaIgP3ycFbrkWA/+icWmaoFXrEaJZIPB8itV4MLhZNy2tbtNa
         IQ5/gOrl3MxcyvVr0pFQ9bvlJmtkeYJXqKh01/XzF1GLWuXIBqtF/glUhHFUEvx6srSC
         0kUFFhzhF6tEL47WqZKznEVMLKC2Cwtz27OEZcnHsuyutyTSY5LtsVJTzBDkcMiSXg8b
         hqAmKiGQ7FbePZwrXRmC++geVRDeWsozMiVku09f6nmuiZ6ptn7kJZ3IGTnUOpxtm+PW
         0eC2gpRjUf6ptgsLR4dmL/KKWHFwyHHgbrKDegWUbQO5ObNUsnIwJGB0449cmhnLvyls
         ixLg==
X-Forwarded-Encrypted: i=1; AJvYcCWTdF3VZOSrfwOBZuUus58PNaeFlasXjYs+ZHIIJYomZm5NDLGjTEk4j4RLzcByuh23OsfpAZDKQplVJd0=@vger.kernel.org, AJvYcCX2R1ewGheziMnzOw+Fi+7guz1m1qGsoE13T0Wb2LB2Km5fQU+SbUgWrREP9ze4RJEaCJB4qyf2dDN3RpkJbyg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyAvZ6MzWSEbg1d/YneWqkY6F62mqzQdeYtO0dZQaiTWBoM4v4a
	/BIXjL1GCoTIyYgJMyJ9LjHB1TTUOmlGCkSv7ewdP+Ex9B90siKL
X-Gm-Gg: ASbGncuN972oKQgLWtcSi0raqO4h76QK1ONRezU3ENhLzZulsCYi+Iw6W9fE5iD74s4
	nCZ4GqBu2sfzH5s8Cn8ychcADGKiIlHP0o5CDA6G+TefN+ZUWmhxRQFs7PcRUK8pt2X5BjjgSet
	RmtoKegtAZdFfb3qVaVG86HAEy5khYfjhW94soBeGk7F+2SwS9Y0abSQLCb6jSGrzm0HateVdyR
	cE85pCPU+xyZSDryFA9cTD4xHnfDY9AHQaq0mJfrhOX1BZbwTPowjjZ4w7EVvqQuZqdtCai8TdQ
	QMSDleBGtLXssGfqJI9r2Yrobfs3vyY66e6rfCQNJVKEXmwxgvQs1CY1x3bPixruVP3dJ2eStg8
	kreZca7My0xWhsMscLZikZCQBVnlJho832cMX5OO5Mw==
X-Google-Smtp-Source: AGHT+IGyTHIaOoMU3SJhWrAULCjm/h9QlttGGRb4sE9gkC38/e0cK5gFrKqdBgNaw7tXCm8JIvP2hQ==
X-Received: by 2002:ad4:5f8f:0:b0:6e8:fe60:fdeb with SMTP id 6a1803df08f44-6f2c4553c77mr255271916d6.17.1745357396385;
        Tue, 22 Apr 2025 14:29:56 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f2c2c21c61sm62073476d6.109.2025.04.22.14.29.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 14:29:55 -0700 (PDT)
Message-ID: <68080a53.050a0220.c2cd7.6290@mx.google.com>
X-Google-Original-Message-ID: <aAgKUTDiiH8xaUk0@winterfell.>
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id A20F81200079;
	Tue, 22 Apr 2025 17:29:55 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Tue, 22 Apr 2025 17:29:55 -0400
X-ME-Sender: <xms:UwoIaMOp2IkE8Ar4S6hnJstcxpoF3qBUhmC1exkmku2_miJEW7W9HA>
    <xme:UwoIaC-Wfzt44nYK_3EQM1ehzFD8sZAQ7ugD8OZ2La_PIaYPzg1MJbzA30aid4__a
    y53CmR_7E_th2mf-g>
X-ME-Received: <xmr:UwoIaDSE9SK53gRi7Z9oyW-Iw1q7MKCPo3q2nXjmA31YOUefzCBFt6C7sNsb9Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeegkeduucetufdoteggodetrf
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
X-ME-Proxy: <xmx:UwoIaEtuI7RZ_X0FGQ2Wz6YkoC8onkbp1pixLiAWHFnBAQpKI6Yqsw>
    <xmx:UwoIaEcclXvbIz35_ZATHx-1wzKYvzwl_n_0Gja7kQLUk6ppl8tpEw>
    <xmx:UwoIaI1wP7oyqxumF5YkSIuFKKl25Fu2WMMJ8COIUCH9VNVUSQyYeA>
    <xmx:UwoIaI8ru8a8X8-ZmRdHJQ1tWkg_hbZ2RlOsP58baz32K9PQQg19TQ>
    <xmx:UwoIaL_SWPmQ2xrNpOq6SEWq6uNeyVxmEiwtrD-_newXoBHKDB38_C7v>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 22 Apr 2025 17:29:55 -0400 (EDT)
Date: Tue, 22 Apr 2025 14:29:53 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Matthew Maurer <mmaurer@google.com>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/7] rust: alloc: add Vec::push_within_capacity
References: <20250422-vec-methods-v3-0-deff5eea568a@google.com>
 <20250422-vec-methods-v3-3-deff5eea568a@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250422-vec-methods-v3-3-deff5eea568a@google.com>

On Tue, Apr 22, 2025 at 09:52:18AM +0000, Alice Ryhl wrote:
> This introduces a new method called `push_within_capacity` for appending
> to a vector without attempting to allocate if the capacity is full. Rust
> Binder will use this in various places to safely push to a vector while
> holding a spinlock.
> 
> The implementation is moved to a push_within_capacity_unchecked method.
> This is preferred over having push() call push_within_capacity()
> followed by an unwrap_unchecked() for simpler unsafe.
> 
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
>  rust/kernel/alloc/kvec.rs | 41 ++++++++++++++++++++++++++++++++++++++---
>  1 file changed, 38 insertions(+), 3 deletions(-)
> 
> diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
> index ebca0cfd31c67f3ce13c4825d7039e34bb54f4d4..a005a295262cb1e8b7c118125ffa07ae252e257c 100644
> --- a/rust/kernel/alloc/kvec.rs
> +++ b/rust/kernel/alloc/kvec.rs
> @@ -307,17 +307,52 @@ pub fn spare_capacity_mut(&mut self) -> &mut [MaybeUninit<T>] {
>      /// ```
>      pub fn push(&mut self, v: T, flags: Flags) -> Result<(), AllocError> {
>          self.reserve(1, flags)?;
> +        // SAFETY: The call to `reserve` was successful, so the capacity is at least one greater
> +        // than the length.
> +        unsafe { self.push_within_capacity_unchecked(v) };
> +        Ok(())
> +    }
> +
> +    /// Appends an element to the back of the [`Vec`] instance without reallocating.
> +    ///
> +    /// Fails if the vector does not have capacity for the new element.
> +    ///
> +    /// # Examples
> +    ///
> +    /// ```
> +    /// let mut v = KVec::with_capacity(10, GFP_KERNEL);

Should be:

    /// let mut v = KVec::with_capacity(10, GFP_KERNEL)?;

, right? I.e. a question mark is missing.

The rest looks good to me.

Regards,
Boqun

> +    /// for i in 0..10 {
> +    ///     v.push_within_capacity(i).unwrap();
> +    /// }
> +    ///
> +    /// assert!(v.push_within_capacity(10).is_err());
> +    /// # Ok::<(), Error>(())
> +    /// ```
> +    pub fn push_within_capacity(&mut self, v: T) -> Result<(), T> {
> +        if self.len() < self.capacity() {
> +            // SAFETY: The length is less than the capacity.
> +            unsafe { self.push_within_capacity_unchecked(v) };
> +            Ok(())
> +        } else {
> +            Err(v)
> +        }
> +    }
>  
> +    /// Appends an element to the back of the [`Vec`] instance without reallocating.
> +    ///
> +    /// # Safety
> +    ///
> +    /// The length must be less than the capacity.
> +    pub unsafe fn push_within_capacity_unchecked(&mut self, v: T) {
>          let spare = self.spare_capacity_mut();
>  
>          // SAFETY: The call to `reserve` was successful so the spare capacity is at least 1.
>          unsafe { spare.get_unchecked_mut(0) }.write(v);
>  
>          // SAFETY: We just initialised the first spare entry, so it is safe to increase the length
> -        // by 1. We also know that the new length is <= capacity because of the previous call to
> -        // `reserve` above.
> +        // by 1. We also know that the new length is <= capacity because the caller guarantees that
> +        // the length is less than the capacity at the beginning of this function.
>          unsafe { self.inc_len(1) };
> -        Ok(())
>      }
>  
>      /// Removes the last element from a vector and returns it, or `None` if it is empty.
> 
> -- 
> 2.49.0.805.g082f7c87e0-goog
> 
> 
