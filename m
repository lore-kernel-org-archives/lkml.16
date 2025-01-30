Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6B041E0B74;
	Thu, 30 Jan 2025 15:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738251189; cv=none; b=eE7l0VvvXjr7mjHslpPgkHTpOqDSwDqsYLCM2PuQuN2z4PFskgndCu5LhGdDSflEPVGklXsr1apltWiFnXhGZY2hXJ17FMnIhb72mxcTO11cctQyLjh3MlkNjYMBt9jp5BaVNmBZRMO76eByvw8zKmDZoUljNU+caXJgfnLd/k0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738251189; c=relaxed/simple;
	bh=TIelep2JLarJVxWnkD5TqSIFRGCQK3XQgJAjfyWQrjM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=etqjDRk48oXuYmAhxwoAsSxh2WKsl262Giib7aDzszKJlS38jzmLg+Ihe/MaDob17gyHWF9S7j3nMI3Ut03Kq2pZyPGWUBhJhrnwlz+EojRi1aT0ZapOxWDkDQm9W1DT7YJX2znlYaQhfppiQAsrcMKHsEfQsnXki2pGFYdJkdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A1uCww8b; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A1uCww8b"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-4679ea3b13bso6632181cf.1;
        Thu, 30 Jan 2025 07:33:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738251186; x=1738855986; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G7VwIpRCZKScIque5lToOQ+mMjhVOHN2OynFs/wbBFQ=;
        b=A1uCww8bh/U1GIiViiCmTZHF4QEIqoZNGtfFrnU+VfBcJAa+ULeb25IJ4/0UrKuXpm
         3bySgzIygTkMmJHifHdYUSpz+6Gi5D5L8lzaspkRe1h3QLKLInPYVr9njv5kgwCAnGkw
         8Upl2krv1hEY+l7tN1E49QJ/kHePcWBxLYKcZ6WGj7QYnb30fUDba1JnoaE3hb5P28t8
         +TqyzxVTJfOy17q0wumtxMmd8PBjSMstNUFoeUrCjs+hhTBeEm3uLUCMEdGRSCktSOZI
         a/mghwsL4X6wPs8wlXpD4eSo1Q9JduHchs7/4at9HWhBqExqtmgnemcJwpuXMwrNrRnB
         uleg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738251186; x=1738855986;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G7VwIpRCZKScIque5lToOQ+mMjhVOHN2OynFs/wbBFQ=;
        b=r4kg36X8ZYFQR9GbBpE2VhnmqNNEQPtnYIts9LV2rT11VDD2ixisiKc5tTcy7uxmlC
         DY7jALl0XFvL+XY5NUhIQ0D/G+1DCaNxYmZoyxzNpoE7uWO9MW2CcBJ75sEwiP38oWBM
         IhtMMmnWeaSEfKQ9Y6WENATUz05CwcQY43/dGBnO0FACTta4lQPpD9yAWBborCoqsNhY
         EYPkvE8yHYu2FUU58WiytJPyCR7Ck99VALJH3n2e1o3vrW/w0P8D6vdnc3mvQWVFys93
         s/x1+0Y2pJzpnhU6A4HLML5sJlZ6U/7rDoq6kEIyaSwtmg7whCBxczD2Pzc0wGH5LNcB
         Ixpw==
X-Forwarded-Encrypted: i=1; AJvYcCX9fdW/dKcTdgi1J7MfVSxxbbChPTXRxVaj4lTIcqweJYR8cdHKNgi41Jfn/fz1qEVzBC1tcPEyWSXLPZc=@vger.kernel.org, AJvYcCXCpQRSbPIZA/+ygMrp8tQ5G77249vQoFyKaT6sHVFMEFmmSJE282C+SJcrKQbMTnQ/IaP0kJiEn07lKI5CaUs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzane7RZwBkr1N14gGC45vAV/z2BTnZA4EZ/tfcJd7YKlG99WQb
	Dxhl84vYdhqIjCCcpQHg5n7c3ZG/orPa5C3Wz+3Exe5ocwJStLU9
X-Gm-Gg: ASbGncv1pNpMHU+YNJBRWlgNDZMj70WfDGTRdRTT9ZM1PsFEO1HYUAI2huoj3uG+UwP
	LWVD6qbEDGM+5FX2647U7r7kSwx2yI/ku/GSEsOlXXVU7Wl7CE+VAnX+//rqSzpGMs+HTfEtQ7b
	+t3k4zQ+L0BiPRWJ13cv3h7Jq1wWxRUfpBtRibvZV49hA5KlVworbc//62smwZrCdkhd7YKCzGi
	zCeIBOE0mVAEA3OYt6/JXfX1KKbJclPsJkhN3k/bhyvk8ZjAuTmrebj/1+Co6dF4dddwVSHmpFY
	zR/GbfoVJEYcCj0sSW9Um1kS3K7PMhZmJeRAbRnqIcPJUSzNE7CFzaWYeja43cZn1QCKTK37G9l
	9vOnPdg==
X-Google-Smtp-Source: AGHT+IGUBtxbrIgoDPFffciXpQPGLrk1UXuyZ8Uyz4nO9baFs6ejUl6X/jPak7GVMQEK4iCztVoURQ==
X-Received: by 2002:ac8:5e0b:0:b0:467:6e88:4548 with SMTP id d75a77b69052e-46fd0ae333fmr125661411cf.39.1738251184915;
        Thu, 30 Jan 2025 07:33:04 -0800 (PST)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46fdf1895besm7819001cf.69.2025.01.30.07.33.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 07:33:04 -0800 (PST)
Received: from phl-compute-09.internal (phl-compute-09.phl.internal [10.202.2.49])
	by mailfauth.phl.internal (Postfix) with ESMTP id BD1A21200043;
	Thu, 30 Jan 2025 10:33:03 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-09.internal (MEProxy); Thu, 30 Jan 2025 10:33:03 -0500
X-ME-Sender: <xms:r5ubZ6ml46ylExwkzVNUF8ksBbGV02g6gfKGSi88sxf2Ke6REF2MCg>
    <xme:r5ubZx17hbEB2J1OWvC7ngkix3y6ZleJLU89v93L2cCAafXXEP-d3MbwAMeQWG8d5
    f8YtnmVSbJxY0CaJg>
X-ME-Received: <xmr:r5ubZ4rRjR5a-Xj_qiQrtq_MVnqOVlBYtmOndrHtNmV16OtcPfhnFNfYbg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeiudekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvden
    ucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrd
    gtohhmqeenucggtffrrghtthgvrhhnpeehudfgudffffetuedtvdehueevledvhfelleei
    vedtgeeuhfegueevieduffeivdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhi
    thihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsohhquhhnrdhfvghngheppehgmh
    grihhlrdgtohhmsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohepudegpdhmohgu
    vgepshhmthhpohhuthdprhgtphhtthhopegrlhhitggvrhihhhhlsehgohhoghhlvgdrtg
    homhdprhgtphhtthhopehojhgvuggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehg
    rghrhiesghgrrhihghhuohdrnhgvthdprhgtphhtthhopegsjhhorhhnfegpghhhsehprh
    hothhonhhmrghilhdrtghomhdprhgtphhtthhopegsvghnnhhordhlohhsshhinhesphhr
    ohhtohhnrdhmvgdprhgtphhtthhopegrrdhhihhnuggsohhrgheskhgvrhhnvghlrdhorh
    hgpdhrtghpthhtohepthhmghhrohhsshesuhhmihgthhdrvgguuhdprhgtphhtthhopehp
    vghtvghriiesihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehmihhnghhosehrvg
    guhhgrthdrtghomh
X-ME-Proxy: <xmx:r5ubZ-mfv4gQ8fVd4k9Tj-oiT21JZ7x2uMb3PzV1edxNBiVNCsnOOw>
    <xmx:r5ubZ40wUhiuWNCXOrpwZUKGhSiPjOZj2ZEP71sUswvP5u-PLdewhg>
    <xmx:r5ubZ1v2f7tMGLGDwfzozcwYCvYBOh8TAzViGf5BgGtCAqPjHAIrBg>
    <xmx:r5ubZ0U4U0VBh9C1TApQ20hcgkDajujQ5kH-BDZA6tE9BuXUmdSs3A>
    <xmx:r5ubZz3ASQdzcTGjqd1slTxjAtIkdUJMV-QWAVuiaS57-NfHLZ3q8hpa>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 30 Jan 2025 10:33:03 -0500 (EST)
Date: Thu, 30 Jan 2025 07:33:01 -0800
From: Boqun Feng <boqun.feng@gmail.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: sync: add accessor for the lock behind a given
 guard
Message-ID: <Z5ubrUcSuaTtj_wW@tardis.local>
References: <20250130-guard-get-lock-v1-1-8ed87899920a@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250130-guard-get-lock-v1-1-8ed87899920a@google.com>

Hi Alice,

The patch looks reasonable to me, however...

On Thu, Jan 30, 2025 at 11:39:32AM +0000, Alice Ryhl wrote:
> Binder has some methods where the caller provides a lock guard, and
> Binder needs to be able to assert that the guard is associated with the
> right lock. To enable this, add an accessor to obtain a reference to the
> underlying lock that you can pass to `ptr::eq`.
> 

... could you provide more details on this usage, for example, why do
you need the assertion, is it for debug purposes? Does the current C
code have the same or similar logic? Besides...

> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
>  rust/kernel/sync/lock.rs | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/rust/kernel/sync/lock.rs b/rust/kernel/sync/lock.rs
> index 41dcddac69e2..681d67275b49 100644
> --- a/rust/kernel/sync/lock.rs
> +++ b/rust/kernel/sync/lock.rs
> @@ -169,7 +169,12 @@ pub struct Guard<'a, T: ?Sized, B: Backend> {
>  // SAFETY: `Guard` is sync when the data protected by the lock is also sync.
>  unsafe impl<T: Sync + ?Sized, B: Backend> Sync for Guard<'_, T, B> {}
>  
> -impl<T: ?Sized, B: Backend> Guard<'_, T, B> {
> +impl<'a, T: ?Sized, B: Backend> Guard<'a, T, B> {
> +    /// Returns the lock that this guard originates from.
> +    pub fn lock(&self) -> &'a Lock<T, B> {

How about we name this as `lock_ref()` or something else, because
`lock()` itself is already used by `Lock` for the lock *operation*, and
this is just an accessor, I would like we don't confuse code readers
when they see code like "let b = a.lock()". Moreover, if the only usage
of this is for asserting the right lock, maybe we can instead add an:

    pub fn assert_lock_associated(&self, lock_ptr: *const Lock<T, B>)

Regards,
Boqun

> +        self.lock
> +    }
> +
>      pub(crate) fn do_unlocked<U>(&mut self, cb: impl FnOnce() -> U) -> U {
>          // SAFETY: The caller owns the lock, so it is safe to unlock it.
>          unsafe { B::unlock(self.lock.state.get(), &self.state) };
> 
> ---
> base-commit: ceff0757f5dafb5be5205988171809c877b1d3e3
> change-id: 20250130-guard-get-lock-dd5452793d9a
> 
> Best regards,
> -- 
> Alice Ryhl <aliceryhl@google.com>
> 
