Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07A2E1E04AC
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 10:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743676875; cv=none; b=ruqE2rJFAwjsB/nbYM++cgJZGYJXZuc9YQRVtTKrSnF2DIpxm2dlJrMRcbtFGP9hWxEDuC5TK8GIizgN1ab8VBcZgI2UXZOigp600HKpMnf8x+C4KLTJq11junEr8mJdkapjU2MyCd3CSWUgBeOP6OwLgzvtlb3xF19IQvaHw08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743676875; c=relaxed/simple;
	bh=w3puXIk10j3grXCzeg/dye50AX/dbma602RfkKLEt5I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kTk25tUAryZOz2UVaHKfmDVESBL9wz1kXWcuSzhh4dZZkPnjqHrxgKigMOnywdOm8m0bXRL+KUJyDaZSMNEznbV33le/JSugr01hk11R5AzrgCvgkdXAqjyGlpx3ZvEY01dxYr8G2VdqJhbsUHPMQWzo219jD+VtImEPzNq9hqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Gh5XwsTK; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Gh5XwsTK"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2264aefc45dso10425945ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 03:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743676873; x=1744281673; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xaqpB2fKyAFdhuEgji5gE8Bclt23o7aXsep06MfQD+A=;
        b=Gh5XwsTKEWSDJzmIDsl4M1jYmqRFwLvVIsM8pPX3uAupFOc8a9BeQ7GXVuGpiTrATA
         zIe+7+ihfZBT/anKpxdK0AZk33sXTht4g1Z9Hpf+rta5ZU4EtzyOFaVqvILTzEABSloK
         q63bXg23kGoiSaShYY1nM/o4XvDoFjE2C/gHBNWEf83byQINbshsann45z2+gFN6dVT0
         XMYhDcQw6g2CPp1ySO316tk0J1Rq6q4nhuPs+JtecZ+n1IA9931XcIxTWHnYOruAvjGh
         FUmXnPfyU3ldExAv3v78Q4lpOhy5lT/2MWkTTErvHHTa8sxiaT9n7D0Yzjt8r13SKGdV
         MJTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743676873; x=1744281673;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xaqpB2fKyAFdhuEgji5gE8Bclt23o7aXsep06MfQD+A=;
        b=CkEwQL6C3Zo4ihUzBU2sOoOGb3sFqh2g0CkWjEsz1UdwON6BHzr6xO3yI7a9wIYQVf
         NSxSSiKJFnGp126sSiWfmZY8ce6zLr5pIYZm3fxoO8y9xomTRSDma8pAnUWnSv5XKEWs
         jmwgnRZxRejMVTyPwXLzDFTKDl+xoZklvsxtcqIplI0va3igwcZUpE77yZqikvulyHEs
         iXlxaKLModckhIkiLyxtBPU+VnWJsjKbUVOf+9okham2H7mwOOWRQM5sLiF05k+PJnA2
         oAYMrK3UhBIuZKzSzUSxOyUCDucHymS8fa3Uqm1RVrU/wojWEeyBkjDYJdhTX24N5lJU
         BUiw==
X-Forwarded-Encrypted: i=1; AJvYcCUID+kz8T9cELnCYiX6dFBoKYnbw3YgfOb+BUsATdjfH5gMPYz87xRSIzoJT6uOOs8dRO4EzP3TFN7UCz4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxpcus3fM/otN0xmqF0H9VYOLeVPtFyLcvpU2beW+o3YP9esA60
	PA6JqVoD8f0hA15lucpUgZustogif9tEqwUL7CQj6MrYKC1Rl2o3OmSCpGV17BM=
X-Gm-Gg: ASbGncuabubKCSDe2SD0npL6j69b7ROd7CY6s48A+no/11Ixl7shfftKB4GnYZ8goaq
	h10vFqn+Nxt1ecN+0YyOtKGApqD6jNiAFvlyCJZHPKnkl7Dmz0sDZ7pBWAsCkdnvQkYqDnIFib3
	A7lUDJFf6SKjefNFBttz0BbOqx7+SLvUPaAsm7WoXBjqln4NJ5rioumr8P8e+qxEC0lXHzmrV4e
	cdG3scMMeiuIXPdIpbGMOPl8LKR65tvS9ObXe4MyfqS27EJC8f/Csp/4CZdzDI4mq2uM/RDL+Lr
	1PIttIkzVUdCFp2x3D3M8Uk6vsdP+CnmQyNwWmBHr54Fyg==
X-Google-Smtp-Source: AGHT+IFGqy2Q/sZh/jCKLxA2RtwQLujeaxMETzHoV8eMmsx8L5NdueYuP+vLuTAXPYakiKXL5xbILw==
X-Received: by 2002:a17:902:d487:b0:223:5a6e:b16 with SMTP id d9443c01a7336-2292f949419mr332824745ad.5.1743676873233;
        Thu, 03 Apr 2025 03:41:13 -0700 (PDT)
Received: from localhost ([122.172.83.32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2297866e7f5sm11114405ad.206.2025.04.03.03.41.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 03:41:12 -0700 (PDT)
Date: Thu, 3 Apr 2025 16:11:10 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Yury Norov <yury.norov@gmail.com>
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	linux-kernel@vger.kernel.org, Danilo Krummrich <dakr@redhat.com>,
	rust-for-linux@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Burak Emir <bqe@google.com>
Subject: Re: [PATCH V4 1/2] rust: Add initial cpumask abstractions
Message-ID: <20250403104110.yz2d776fvxja3rj3@vireshk-i7>
References: <cover.1743572195.git.viresh.kumar@linaro.org>
 <35f4223be4a51139348fed82420481b370d7b1db.1743572195.git.viresh.kumar@linaro.org>
 <Z-1b_FkYUJEIj-YW@thinkpad>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z-1b_FkYUJEIj-YW@thinkpad>

On 02-04-25, 11:47, Yury Norov wrote:
> On Wed, Apr 02, 2025 at 11:08:42AM +0530, Viresh Kumar wrote:
> > +    /// Set `cpu` in the cpumask.
> > +    ///
> > +    /// Equivalent to the kernel's `cpumask_set_cpu` API.
> > +    #[inline]
> > +    pub fn set(&mut self, cpu: u32) {
> > +        // SAFETY: By the type invariant, `self.as_raw` is a valid argument to `cpumask_set_cpus`.
> > +        unsafe { bindings::cpumask_set_cpu(cpu, self.as_raw()) };
> > +    }
> 
> Alright, this is an atomic operation. For bitmaps in rust, Burak and
> Alice decided to switch naming, so 'set()' in C becomes 'set_atomic()'
> in rust, and correspondingly, '__set()' becomes 'set()'.
> 
> I think it's maybe OK to switch naming for a different language. But
> guys, can you please be consistent once you made a decision?
> 
> Burak, Alice, please comment.
> 
> Regardless, without looking at the end code I can't judge if you need
> atomic or non-atomic ops.

I don't think I need it to be atomic:

> Can you link the project that actually uses this API?

https://lore.kernel.org/all/3054a0eb12330914cd6165ad460d9844ee8c19e2.1738832119.git.viresh.kumar@linaro.org/
(search for "mask.set" here).

> Better if you just prepend that series with this 2 patches
> and move them together.

That's why I did earlier, but now separated them. I can provide links
in both the series to each other to make this easier to look though.

I can also prepend that series with these patches once they are fully
reviewed.

> > +    pub fn set_all(&mut self) {
> > +        // SAFETY: By the type invariant, `self.as_raw` is a valid argument to `cpumask_setall`.
> > +        unsafe { bindings::cpumask_setall(self.as_raw()) };
> > +    }
> 
> Can you keep the name as 'setall'? This would help those grepping
> methods roots in C sources.

Sure.

> > +/// A CPU Mask pointer.
> > +///
> > +/// This represents the Rust abstraction for the C `struct cpumask_var_t`.
> > +///
> > +/// # Invariants
> > +///
> > +/// A [`CpumaskBox`] instance always corresponds to a valid C `struct cpumask_var_t`.
> 
> Can you keep the C name? Maybe CpumaskVar? Or this 'Box' has special
> meaning in rust?

'Box' means heap allocated normally but CpumaskVar sounds better.

> > +/// fn cpumask_foo() -> Result {
> 
> cpumask_foo() what? This is not a good name for test, neither
> for an example.
> 
> > +///     let mut mask = CpumaskBox::new(GFP_KERNEL)?;
> > +///
> > +///     assert_eq!(mask.weight(), 0);
> > +///     mask.set(2);
> > +///     assert_eq!(mask.weight(), 1);
> > +///     mask.set(3);
> > +///     assert_eq!(mask.weight(), 2);
> 
> Yeah, you don't import cpumask_test_cpu() for some reason, and has
> to use .weight() here to illustrate how it works. For an example, I
> think it's a rather bad example.

Okay, I will import and use cpumask_test_cpu(), use that for testing
the output after every operation and do weight check once at the last
to make sure all CPUs are set in the mask.

> Also, because you have atomic setters (except setall) and non-atomic 
> getter, I think you most likely abuse the atomic API in your code.
> Please share your driver for the next round. 

That is a lot of patches adding bindings for OPP/cpufreq frameworks
and a driver. Not sue if I should be mixing them again with this
series. I will provide links though.

> I think it would be better to move this implementation together with
> the client code. Now that we merged cpumask helpers and stabilized the
> API, there's no need to merge dead lib code without clients.

I was expecting to get this merged separately, so I don't need to push
a big chunk together (where reviews eventually take lot more time).

But I am okay to merge it all once and just collect Acks until the
time the client changes are fully reviewed.

-- 
viresh
