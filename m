Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87B921E9B38
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 07:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744355387; cv=none; b=Kx3mVsPmu88WhSmQKuKW+Q7OB6q03KkVYrNcVeM1COPvh+KB4ge1LE3WouvgrFerD/yq2fhc4sDYcgTJlq6jOjXdr0UbqmwvLON5ksi7/x1nj6BztXy3qoPxUjkr8LOzHR3ycTxTzfiDmLEftyCzA8RlEHAP24aiVAqdI9LOZwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744355387; c=relaxed/simple;
	bh=2HKkKC82etiMsqe1ATwTtzyBnGYDYBFXiV6zeDl4Fys=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n7ExCuhyxSUi2IY4SByx5POXNKZda5O/yEvD9YT7/OPs6jSa8oIYGD8J63k7KiKeaJA+INSB8GfWegepN5+5/ZBDkCi4tF2diCNzID45g9T8Vq4VdlixhYb66XfgjPbdxXAIPvfMwAfKrau/ApBwBj2TmeJYSHQtCwm2OOK7RUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=n9xMDIBd; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="n9xMDIBd"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-22a976f3131so17971775ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 00:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744355385; x=1744960185; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SsaZNHdeANXtSEjMxf+DUvyz9Eisyu48b8JNmNeFVJQ=;
        b=n9xMDIBd9w69awd+45JOJMBrruaUOV93mNs/5WEnq/vQcIT3OsRurowehVFGSez8ZR
         CRb73DMes08+Z7yTPV5MaoeGoLiakUEhfjol1XCt5OCZ9dTpBexoPOKy18O+ChkzODY+
         sHpS61CFZElGq5MWFbnv5cIzX1GCBTZ4qvHKVCy5CiDUfiD+U19uqdVH2RnNi346s6ew
         h2i9V8UMMf9349e66iR0ZEGdpdjOHEmXj/7ZQZkeyljxqo2PQ3b6X1YI7W53kqzWH52a
         /lVb92Zij+eIj8x/Mp1nwR/qMxR77XeuhpVqNSE6J99po16+ffI4W4rwVX/75HscTn+O
         cs9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744355385; x=1744960185;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SsaZNHdeANXtSEjMxf+DUvyz9Eisyu48b8JNmNeFVJQ=;
        b=IPBzWD27WdHlzPlRRg/HqYYasCiyv7KwXLombsLtyaHLJW57WUgIj9qwTa1YKGdJOa
         2w4uIFUJZgURzlZWfhoJIWMiIW4YmAPwFTGt3SEvkup9uNd5yIq47BVkwJ9DnYPONBWD
         I3ESAvvTEEYSZpNTahHAQv8BseKaz12PZD8fcuxoj3BQ/yaDA4sEbHnGNE1pFH3kEbbN
         fQ3ZoluwD5kOzTY0xqcc6S1V8tg7yU9vBrkFYmjLXhOmkMKifWfvkm2C26fKAjieGrx6
         edkteVrFnzLT5PUFaafblQLEj6ia/UOzhfgzfjRYlYtZB+n0Xnf4IwLBoZjzKv+/pOXp
         0DnA==
X-Forwarded-Encrypted: i=1; AJvYcCUNozDc+H/RsBee3ZAeLU694RUqPy7tPpM9RmmCBHoxmkVaTmEWfzdr4vHakNgKIPvmgNiwi8bzWNMRH2Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YzxDaYZE93C0yCPdv1xLY9TZNngCiSmfE18IawvZE+OOLrAmk0N
	FdOvUd5GuNZyrTTpYe7lmx0WNH2axP+4muhM+lFBjysVaaSjXl/cbTPTTNS4VRg=
X-Gm-Gg: ASbGnct2zwkuBu2CVvQlOXT4szHhAO+NpUExI07hax6ZNyFwSxMeMpk8mMt1JaGeWzn
	iv25hw6fwHJAwlq0qZ9fPyFGaloAZym+lHOO9ExERtEGngnRThkCZbq/xA0YA3v1ivQlm8FTVBT
	EBidRxmv2mFNKpEDuSqX7VzYBrZi3ZQMe3nreWb79vhOOnM7S8z8gnEon16qqvF1BCEVSpdwSMr
	kRCMHp4OruIHuNRp4FbM69TdVGCCFPWR9huSyDZBxCLYqnCho2w+zbFmuT1agZFQ0Hi9vGDH9dw
	WeCJ5hozFWsKOoWP1Zaw34/zzolqhLJ9vK642vdnC4KoddBPH0FL
X-Google-Smtp-Source: AGHT+IHQQmLLJrkqWF9B7mkZc3DCkY3lsb5cw00cICBBOVuQHLOx7UsWGycFoczOYNtiuWWk6Tj2Mg==
X-Received: by 2002:a17:903:22c4:b0:224:a74:28d2 with SMTP id d9443c01a7336-22bea4c6cbcmr24391065ad.26.1744355384775;
        Fri, 11 Apr 2025 00:09:44 -0700 (PDT)
Received: from localhost ([122.172.83.32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7ccb569sm42002035ad.225.2025.04.11.00.09.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 00:09:43 -0700 (PDT)
Date: Fri, 11 Apr 2025 12:39:41 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Burak Emir <bqe@google.com>
Cc: Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	linux-kernel@vger.kernel.org, Danilo Krummrich <dakr@redhat.com>,
	rust-for-linux@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>
Subject: Re: [PATCH V4 1/2] rust: Add initial cpumask abstractions
Message-ID: <20250411070941.6xbz4lrwkejr3aqf@vireshk-i7>
References: <cover.1743572195.git.viresh.kumar@linaro.org>
 <35f4223be4a51139348fed82420481b370d7b1db.1743572195.git.viresh.kumar@linaro.org>
 <Z-1b_FkYUJEIj-YW@thinkpad>
 <CACQBu=WMu_CmzERJAHmjiuQ-NZe6DK2kAkvP0cnFN-Y+QhRwvg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACQBu=WMu_CmzERJAHmjiuQ-NZe6DK2kAkvP0cnFN-Y+QhRwvg@mail.gmail.com>

On 02-04-25, 18:00, Burak Emir wrote:
> On Wed, Apr 2, 2025 at 5:47 PM Yury Norov <yury.norov@gmail.com> wrote:
> > On Wed, Apr 02, 2025 at 11:08:42AM +0530, Viresh Kumar wrote:
> > > +    pub fn set(&mut self, cpu: u32) {
> > > +        // SAFETY: By the type invariant, `self.as_raw` is a valid argument to `cpumask_set_cpus`.
> > > +        unsafe { bindings::cpumask_set_cpu(cpu, self.as_raw()) };
> > > +    }
> >
> > Alright, this is an atomic operation. For bitmaps in rust, Burak and
> > Alice decided to switch naming, so 'set()' in C becomes 'set_atomic()'
> > in rust, and correspondingly, '__set()' becomes 'set()'.
> >
> > I think it's maybe OK to switch naming for a different language. But
> > guys, can you please be consistent once you made a decision?
> >
> > Burak, Alice, please comment.
> 
> I really like the explicit naming convention that includes "atomic" if
> an operation is atomic.
> It seems also consistent with std library.
> 
> > Regardless, without looking at the end code I can't judge if you need
> > atomic or non-atomic ops. Can you link the project that actually uses
> > this API? Better if you just prepend that series with this 2 patches
> > and move them together.
> 
> The type &mut self gives it away: the Rust type system enforces
> exclusive access here due to aliasing rules.
> So a non-atomic operation is sufficient here.

I should leave it as is then, right ? Don't rename to set_atomic() ?

-- 
viresh
