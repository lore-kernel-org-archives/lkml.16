Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66A45214A76;
	Mon, 31 Mar 2025 16:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743440343; cv=none; b=BzxWPnI9rQUCeS27uTFMWUM9pgNbGAya7aj5tUZm7gBJdEvQVE5MQ3fxqvZ5NZD2GRAyOgYiVqQEpx541UwoQ6X86SE8Hkzx2e3yqZYuGEHcmXbkzKfLzu02QgKW1AbYs03Q5Guf89TpfWRhPHLa4JnFC5efV8mTErbrTb2gUdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743440343; c=relaxed/simple;
	bh=HZNDKd024pe96v5UWcvnuoxHZAhcTmXsf1N7yDmU8MU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=spM11Gq8fS+DXiOg45yoltOqocF161ZxD6iGWStGYG6ucFqgBOEqaS1G0ypwPhT2k0eyEXUQjqOlm24mOhDLu7WlXY/LxvSMRVTHAcFPqliZO/6LI3Bmb2YwbS8u/4SEEJDPvkv45i1qJH6E3taf3DMutaYqB79G1kg25Ma0Q44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hQzxgXHJ; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hQzxgXHJ"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2ff615a114bso8365104a91.0;
        Mon, 31 Mar 2025 09:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743440342; x=1744045142; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dzgfWwLwvWmls+vgzMS+CuPusxWeU2qYjEpkGcdCwzE=;
        b=hQzxgXHJJ+UTJ1fWdxTwrB1kepfAXYUAYKAFnqpMkSluSwEyIAUWhKlcU7zsm1PBHQ
         pi2gW+BQDzBjRVEVtcwHUxNH6b97vep5DyHYp0ZfkS38jTiimA+GrDk6/9fLJS/BK3c/
         i0HZQekKH2yKyu1aSGd+ubQ5ova5swhmDEPziRgy3wu3FpTlH5JjrTC/iVIopWeIlBhQ
         hTJUYGULOrd8TIOyYMDRIhDMvTyS5pc1AV9zBEbY7Gfd/6OpiLywVswyfg1jbqBgmCPS
         JJSewGuzbMiawzrQrscW1mf7CHRJSbrmDoiYaloZGdhEsT17Qqh+ZOIOG1Z6CB9e2kBn
         75Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743440342; x=1744045142;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dzgfWwLwvWmls+vgzMS+CuPusxWeU2qYjEpkGcdCwzE=;
        b=xJPS4D8FsioDm6OGWugncOW9Sfx0KQZqJLvdU/t4AegS/F/64tDl35vp74Ch3oAOoO
         8MKIa3y9cMOaIccBCZkIxkr0ZkqmLUoI6D5HdOj+HATtdpaWPMjdaLSmFFiA36GkGAh+
         5VGxJrhOUCKzIFwOmxinSVyGe4zi4iayz+Kup5kAaCLEGoluLpNhm++b7dcrBuczQ7kF
         xr/LiytA/AY7Tsw2PXN1glDddYJc8Lo+/3dG7J2+6r1hEVwI9TriMr0UdgTYwrM2o+wD
         MmoaAGF8GRulfuFeAnTcr0H96GeQCAiRHzKI74Xco+m65FB/0H7Yr2i4wcTx2EPrU9Ay
         PapQ==
X-Forwarded-Encrypted: i=1; AJvYcCUI/sPxrB22S684TfFlVAW1R0NIy0xieRCHl5NfVziHMSkT2DrUIuBe49O4aw4KWcpquXGw9nzJuOTplgw=@vger.kernel.org, AJvYcCXPesPzH2KSVsuTftE5iUC60GShaBYLaXHZBku2B3FpcuY+g/GuJ0VL4FnEga/jkNBRLlXDMPMqkfJkFHYQg0g=@vger.kernel.org
X-Gm-Message-State: AOJu0YwiO4bhn64DKQ/1ydKhauGfKH6evTgcav45yWdQ6qtKOWbJgmOV
	8Mt4+g7IUEDtfvCl/kd6WytbuzhS2tlWG03ppnEiwtFtpDXw/epH
X-Gm-Gg: ASbGncv7CByb3++x3ksXucU9CQvHR7XJ/Xklb3DlMmrIPwNW+RMBas/wr9AExwWxlVq
	YUTglorAWXb2t+R9sp8F8iiOU3BPbwlqZ5vIHjOZ6ITJvXIZO2zVtX7zFYRODqtNqaH6eDmYvIQ
	5whd9niq9bbf35wNKM+QCSYHrJq1k+fkUqtwAQpNtRlH4FpeVP4QATgo9TAKD/7U/kp4wJubpNh
	mwiofWU0/lgujlcDaJbctx7/UZyHvCr7k1TmiyWIGp1xcM4DzVy7dGL6Nm/lYWfHYmzi0EHfg3y
	MD3Q3YNfrp88ESC3yiS2xwmEKDwHhf1XWl+VunDq5zCE
X-Google-Smtp-Source: AGHT+IEuIz1qHkkAh0uIKwL7zmsf3tDgQPEZCDyYQTqKZXJVvRuWDPN+0/epQgb0XRJwjrKkT6ax0A==
X-Received: by 2002:a17:90b:258c:b0:2fa:6793:e860 with SMTP id 98e67ed59e1d1-3051c63c952mr22957168a91.0.1743440341592;
        Mon, 31 Mar 2025 09:59:01 -0700 (PDT)
Received: from localhost ([216.228.125.131])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30516d56521sm7430178a91.19.2025.03.31.09.59.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 09:59:00 -0700 (PDT)
Date: Mon, 31 Mar 2025 12:58:58 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Burak Emir <bqe@google.com>
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 3/4] rust: add bitmap API.
Message-ID: <Z-rJ0vMFsFIOP84B@thinkpad>
References: <20250327161617.117748-1-bqe@google.com>
 <20250327161617.117748-4-bqe@google.com>
 <CACQBu=VBYx+LoZnSjAsU7DJsnQJ0R1WEc3aJfgNxoU1zG4=emg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACQBu=VBYx+LoZnSjAsU7DJsnQJ0R1WEc3aJfgNxoU1zG4=emg@mail.gmail.com>

On Fri, Mar 28, 2025 at 11:36:51AM +0100, Burak Emir wrote:
> On Thu, Mar 27, 2025 at 5:16 PM Burak Emir <bqe@google.com> wrote:
> >
> > +    /// Set bit with index `index`.
> 
> I missed this, will change to /// Set `index` bit,
> 
> > +    ///
> > +    /// # Panics
> > +    ///
> > +    /// Panics if `index` is greater than or equal to `self.nbits`.
> > +    #[inline]
> > +    pub fn set_bit(&mut self, index: usize) {
> > +        assert!(
> > +            index < self.nbits,
> > +            "Bit `index` must be < {}, was {}",
> > +            self.nbits,
> > +            index
> > +        );
> > +        // SAFETY: Bit `index` is within bounds.
> > +        unsafe { bindings::__set_bit(index as u32, self.as_mut_ptr()) };
> > +    }
> > +
> > +    /// Set bit with index `index`, atomically.
> 
> dto, will change to /// Set `index` bit, atomically.
> 
> > +    ///
> > +    /// WARNING: this is a relaxed atomic operation (no implied memory barriers).
> 
> Is this the kind of warning you had in mind?

The __set_bit() in C and set_bit() in rust is a non-atomic function.
Relaxed atomic API has a different meaning. Please add something like
the following on top of 'pub fn set_bit()' implementation:

    /// ATTENTION: Contrary to C, the rust set_bit() method is non-atomic.
    /// This mismatches kernel naming convention and corresponds to the C
    /// function __set_bit(). For atomicity, use the set_bit_atomic() method.
 
> > +    ///
> > +    /// # Panics
> > +    ///
> > +    /// Panics if `index` is greater than or equal to `self.nbits`.
> > +    #[inline]
> > +    pub fn set_bit_atomic(&self, index: usize) {
> > +        assert!(
> > +            index < self.nbits,
> > +            "Bit `index` must be < {}, was {}",
> > +            self.nbits,
> > +            index
> > +        );
> > +        // SAFETY: `index` is within bounds and there cannot be any data races
> > +        // because all non-atomic operations require exclusive access through
> > +        // a &mut reference.
> 
> I have considered marking set_bit_atomic as unsafe, but then come
> around to think that it is actually safe.
> 
> I'd appreciate a review of the reasoning by my fellow Rust-for-Linux folks.
> 
> What must be ensured is absence of data race, e.g. that an atomic op
> does not happen concurrently with a conflicting non-synchronized,
> non-atomic op.
> Do I need to worry about non-atomic accesses in the same thread
> (temporarily reborrowing a &mut to & in the same thread is a
> possibility)?

To me - no. Atomicity only works if everyone follow the same rules.
If someone accessed some data without grabbing a lock on it, and
ended up corrupting the kernel, it's not a problem of spinlock API.

Thanks,
Yury
