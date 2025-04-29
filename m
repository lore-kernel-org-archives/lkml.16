Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE038155333;
	Tue, 29 Apr 2025 20:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745958666; cv=none; b=eMHprqtHDoaY8tMsx3492l0kOCT/CQIlD7MCUICdD51g5ijKC/CdPKWYbxoKyZt7mHy5gO593zuEPj9+F8JzDs8iE4xQXDqYZcMR9f7byIXS4kIH992+B8b8HBvSC/F/PM5pmDrL63NPNdOfzSTdYhtfht/H9E9g0oZidFiV8KI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745958666; c=relaxed/simple;
	bh=3NAiBmHtTUvBukAq3tzhCK3XveFMPNrqWEs6lnHu918=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lqVoOXkCQRSk09upJ/vW2aHt9o4AqMd69wl1yWLThHyQACi2v+ZFoR7uZWeH83CXZedo4LWuHYEHRCidSpk4iuCFoUj4pIc5LO9QJvfSCVb0jiAg7NmlVOMIiM8eU7dO/hI7rw6RRAd7mJNYGgtMCHcL9DKWAPkThWLDI0RJfAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cfWfKxXQ; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cfWfKxXQ"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7c08f9d0ef3so409290985a.2;
        Tue, 29 Apr 2025 13:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745958663; x=1746563463; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:feedback-id:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8IrVLu+xbZHw86gSzaTwHKCDaUis8qZ1FxmdJF1+Lbs=;
        b=cfWfKxXQK+p8C6WLNaYwR75OonY5lOwpoW3ftOHQf5kazK7zBg8q4o63/bO6BBd64w
         rn/LV2HwCLsl1p0yDPQyui+EBOmW6i8sFXC/A1RfNewoiL2Sbi7OdZxphfIBIdrEnf7X
         9DOYF0rNF4GPg684LMNKXxou8P3GrvO6DYf5rolvdZ+iNUcRE7Jr3Z6DBVJ3hhQ0dIYJ
         DgdvL+k/6X95k1IfC4XRyvUgWWMZT/VWrTaJfpSRqSCctCJblepzVx7OH9hLzStnd9bE
         lmsKvegEJu0mwFmF7wFCywK9/rUZKPuHZ/vouMw99smEWY/rTMETKgkPhvoCkjsIcJZN
         vG6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745958663; x=1746563463;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:feedback-id:message-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8IrVLu+xbZHw86gSzaTwHKCDaUis8qZ1FxmdJF1+Lbs=;
        b=T4+0DMAvn9X+cjbdibc3HyvDmao58XeXOTYY8Xs4SxzCNk1xg/RN2l+CIxfPfaWCUb
         AS104p9Qie8mz3SDOwkRzWQhjTro4x7b/JHR4ch9PScXtoIQPX9+PZ76kUeGDY/Ba8Yb
         ZJbPdKCn48+PFPjD12r/8eHm1nTkg0YT3q8hifw8Xrx2NEhhxvB+kuDvFBjXya+qoTv4
         sfgT2UphQDN77pq6Nu2tO7ns5vIaS//3/UHaRMGSkfIJQp12ASHDOV2J4vfqLDxBaDc1
         /WY2jQnx0t9rlzxFhlEB+XgxZ3q2/2cCW8kFBPph6YcmO88udYn42R0AfJoiFSA6mJRD
         AAFg==
X-Forwarded-Encrypted: i=1; AJvYcCUPdaJ3gEkDX/mzf7mJ/1OtleaUEvIEKKYqRGh2RLx8NW9BSZO0+dM3gtWcXe9K6DLKpC+u4MzZq6kg2Vg=@vger.kernel.org, AJvYcCVe7GJTdJuOscc4sYmSBq7HFB7XF/Rpoaeh5fj38fuXtOI+5qEIouifd3eG39f6sX9xaCauhC3VHLlh9jLUuBQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4aYNmmuzyAavF8QVvJZ43LM+f8ueMHEyznRzLgPJoEutaGD+I
	LXpaeTXpr6fb4WYxEMIv1QiA6x3qKFASV/Oxhwsjfxs1a6sMnd9d
X-Gm-Gg: ASbGnctCI0FARMORKW29TdH7oC10i7r30dSFr+DkryfHvMqyO8NpZ1oz2RHrkYFGuYy
	YUP+mbZoaMsyzX1hVcTOLYZ8q2ZHD9k4EDwpw01KixU9s+JwgEw3z1mhur51NpfEXPYru64mVZZ
	ZSyJihgKt41A0fiXUvXnDDcW9c0e5d7PPbPTgwVMGjlH+QwzkaxAAYe7RMvTto1rrIlPY6d/ayo
	2aVIri9kOpJogJwpNemuz6pcSQtWmAEggDGy1W3bFOAeoa6Vb31x5tGir7WBWH/9CaF9Qma0Lpi
	RudYddPjM4vIGfqzMJsvjURPy7OO3MlENs/AGgE0blabQMEalcVFI0/NLmUAtKKCA0yGXCDgXVo
	qi78vdfzOZslziZNuT6CXoSZfcc1QrEM=
X-Google-Smtp-Source: AGHT+IEcOIrfRiXTPMTDAZWmyvM0oVtrhQUVxPQtYuNRlmJlRbTPqMTxAo3h4mtkWiO8Ui2T9KmTiQ==
X-Received: by 2002:a05:620a:2951:b0:7c5:9b12:f53c with SMTP id af79cd13be357-7cac7408a09mr88102985a.5.1745958663599;
        Tue, 29 Apr 2025 13:31:03 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c958cbd21dsm775902185a.42.2025.04.29.13.31.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 13:31:03 -0700 (PDT)
Message-ID: <68113707.050a0220.17967c.36c7@mx.google.com>
X-Google-Original-Message-ID: <aBE3BGLH8fQxzdVP@winterfell.>
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id 9362D1200068;
	Tue, 29 Apr 2025 16:31:02 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Tue, 29 Apr 2025 16:31:02 -0400
X-ME-Sender: <xms:BjcRaGMRRvXPDNcwoOSYjkqhqAeRm01t8yR1zAR5e2N9RwqTdQZVkA>
    <xme:BjcRaE91rosMSAvrkcU1ZrzhDW7Ivs5geQ38NY9JpwdymJSq4ahr1OuHthI6fwXOK
    pUxwgZGRhlh4b5DfA>
X-ME-Received: <xmr:BjcRaNRE4dR4ciaQFCGOXVf8yOOblDuLGTd1qgycHvRJ4_0ghyqeHwj6-3A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvieegjeekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddt
    vdenucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrih
    hlrdgtohhmqeenucggtffrrghtthgvrhhnpeehudfgudffffetuedtvdehueevledvhfel
    leeivedtgeeuhfegueevieduffeivdenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
    grmhepmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgr
    lhhithihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsohhquhhnrdhfvghngheppe
    hgmhgrihhlrdgtohhmsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohepudehpdhm
    ohguvgepshhmthhpohhuthdprhgtphhtthhopehjhhhusggsrghrugesnhhvihguihgrrd
    gtohhmpdhrtghpthhtoheprghlihgtvghrhihhlhesghhoohhglhgvrdgtohhmpdhrtghp
    thhtohepohhjvggurgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghkphhmsehlih
    hnuhigqdhfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehvihhrohesiigvnhhi
    vhdrlhhinhhugidrohhrghdruhhkpdhrtghpthhtohepghhrvghgkhhhsehlihhnuhigfh
    houhhnuggrthhiohhnrdhorhhgpdhrtghpthhtohepghgrrhihsehgrghrhihguhhordhn
    vghtpdhrtghpthhtohepsghjohhrnhefpghghhesphhrohhtohhnmhgrihhlrdgtohhmpd
    hrtghpthhtohepsggvnhhnohdrlhhoshhsihhnsehprhhothhonhdrmhgv
X-ME-Proxy: <xmx:BjcRaGsyFJjzTs_PPgw-L5y0-vh9LrlUp4d1vfKFfwtWcyGEvGtJ7g>
    <xmx:BjcRaOddzWY3owJSYqOkXK8w7NhJ1xw0qWdO85hsBULW5BOTqrZmlQ>
    <xmx:BjcRaK0hqavGQ-WxVaP8oNu0OLV2WcqAxCLhorUqsRr94d5fqK_rLg>
    <xmx:BjcRaC9WXo_Z221RcA1ZN0TxNnCoWljy2rsNAvOGO_Sa6Cy6fh2yeg>
    <xmx:BjcRaN-4nQq7N_2vsNTtXg-6oZs6DdludsQT7hBIuLm-qJlA07-1Jexu>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 29 Apr 2025 16:31:01 -0400 (EDT)
Date: Tue, 29 Apr 2025 13:31:00 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: John Hubbard <jhubbard@nvidia.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] uaccess: rust: add strncpy_from_user
References: <20250429-strncpy-from-user-v2-0-7e6facac0bf0@google.com>
 <20250429-strncpy-from-user-v2-1-7e6facac0bf0@google.com>
 <68110cce.c80a0220.3b03fb.43d0@mx.google.com>
 <0ac7cfba-6b69-439e-a9ee-1175ca8d0913@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0ac7cfba-6b69-439e-a9ee-1175ca8d0913@nvidia.com>

On Tue, Apr 29, 2025 at 01:28:09PM -0700, John Hubbard wrote:
> On 4/29/25 10:30 AM, Boqun Feng wrote:
> > On Tue, Apr 29, 2025 at 09:02:22AM +0000, Alice Ryhl wrote:
> ...
> >> +#[inline]
> >> +pub fn raw_strncpy_from_user(ptr: UserPtr, buf: &mut [MaybeUninit<u8>]) -> Result<usize> {
> >> +    // CAST: Slice lengths are guaranteed to be `<= isize::MAX`.
> >> +    let len = buf.len() as isize;
> >> +
> >> +    // SAFETY: `buf` is valid for writing `buf.len()` bytes.
> >> +    let res = unsafe {
> >> +        bindings::strncpy_from_user(buf.as_mut_ptr().cast::<c_char>(), ptr as *const c_char, len)
> >> +    };
> >> +
> >> +    if res < 0 {
> >> +        return Err(Error::from_errno(res as i32));
> >> +    }
> >> +
> > 
> > Nit: this can be a
> > 
> > 	let copy_len = kernel::error::to_result(res)?;
> > 
> 
> Doesn't that discard the length, though, by returning Ok(()) ?
> 

Oh, you're right, so probably we need a to_result_i32():

    pub fn to_result_i32() -> Result<i32>

, so we don't have to open-code "if res < 0" every time.

Regards,
Boqun

> 
> thanks,
> -- 
> John Hubbard
> 
