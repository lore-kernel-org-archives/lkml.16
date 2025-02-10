Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 457EE189906;
	Mon, 10 Feb 2025 06:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739167394; cv=none; b=J9TltLHtqrWe6hr+sDAdP1mDqtGEk/MWMl3nBre6eoh+UpctSrPlTArXh5KZNEt1SksXnYEToZ6JLvQrGcVQzXywrisKMiQUoBsTfeiY2ZWMWxTSRM70vabhWclPZxkpXQRUBtZMqUgYT82NCV9Kb57Ls9ht7dL7g/LVXOLHXNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739167394; c=relaxed/simple;
	bh=PdnSNbfqlPaAeM8g+EXz+FdCiZRtKAMpuUjYtSMo+9U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZPqOZdF96oIfh3oaEdx7cSzcmS9QCQ3X/5zODV/6L8e5a6iiV3q7N2Kc9nWYU5ZOsy05PQ/sHw1+DUgNHtXvazEmhVP7S2Rw0uGEdwM/OPv4DUVdlSkUBAVa9LPmuAWM+MRvnQs230USSyFMYuRHmFTFsUn7gugmlfKloGW32/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NUivTwnX; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NUivTwnX"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-7c05c2dc5ddso80752085a.1;
        Sun, 09 Feb 2025 22:03:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739167391; x=1739772191; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LKWXl8MTm6gUQV5WQREvCDDX8UQM5VlckT9ixmVr0tM=;
        b=NUivTwnXdeJzUpg6H3AblB1Ko0xgYsC7BMkNUSScB9PDp+tt1hcyGBMk44yOW2lPbm
         X9PHFY2uaezzJ9WUlm6BrLQLjAr3XjVrNCC1yo4JfoXLMevDDDLGVoKc9Lf9LHTrRT/n
         UHi3X3GqznHv6YYBBOd/tqcnvzISMgkdcaYKKTlPThVzsVknisaSk8lgb+Un51RlDa7G
         0bey2rBrcYRyGuM88U3mSRfSh4VlOEoHSIrz9kK5xyq9mi6tMNsi83gpuS5XYhwAac1g
         jlQlIL9E8DUWHJDLSQ5/BOHFgdFw9/KcgL26+nSs7Tef9bv/yyVOqpsFYhIep5kmoLdM
         h/Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739167391; x=1739772191;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LKWXl8MTm6gUQV5WQREvCDDX8UQM5VlckT9ixmVr0tM=;
        b=I4LLnDtDG/pHUC8amUHq+334nRHoQVDPqBq/ZlGCYaB+Ac9dkTEkgC+c2L/M5MgiB4
         PnNMDgovwROPK5HmmR2EprPqlrKieW3oEYR19a+vrAVtkLs2TgojoxSq9LvObrp/K7Zk
         PU3HsTIqf5WTRJSGMtqUsvBFIa/YQkNPbmpSNJUfQwpQ+an73+1L3m2VZmDlgEaxbcWj
         zV7NglhSVCSvwSNzJp+jJtgT5lkBGSq3BBl0rFakBUSgMe3oZxkdME0N0VSdBL7zy95U
         7SNPY7UNDjho4/PH/w32FWISjOGwsqPtvjsLozJhSz8tK/EowTIRJYd6e1pM9Mt/zFhd
         ekTg==
X-Forwarded-Encrypted: i=1; AJvYcCU13v22wl6u0MZsYlK8ECCGbnNPNNW4+AzT2EoyQyDjK44khvNPR7PZwXudm6/96jWS8FXjcy6gDU1KTEs=@vger.kernel.org, AJvYcCWk5ZD51NX2NIvUowiAXXFxzDIK/qPDYEyATp0tfplpIv9vnDEvJfuQm56056qqDtDjPIhClqmmYonjOAu9YV4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwpBToYSjLDsqApje2TWxQgUiunB8llg9eXXWUyqIiQE+GAtz1y
	+Appf+r28IiRn+JT1K1FtTxB9vvsnJVKRuU0j54CusjEYNa4E9Vg
X-Gm-Gg: ASbGncsqxZXGB8P2qqiDuXLaa6o7O7tKT9SvTliqjyAdUEt9IJXnlG8pF7tQFCbK9mu
	Z0Y8DNoCqF942P7/2GsDwMHALFaLIUhVM4J9M/nNsXzYPg300Kwh9fpFcIgL4ltA6bvy2fIo9ee
	iVcmKNK1OU3g1j5BoF3bRWjU8EmxywnQbGlH1UlSO1IGzL/K5dvGsWFHEfYqqUMpHSs/a4eTCX2
	OliE6MdGeM9tBE9xao0qmkXHTEK8W8dS5rFjErp9/S0eihAldgHt4ko27+/+h3kpWUNWX5m1Kh+
	mRRJ4evoXBdGdO2x7W/TVRGiT4tSS7o4iEyL1geHgjB0lBOOiPhgs7XoSTViRWrxfLjcpGQFEe1
	D1vdHnA==
X-Google-Smtp-Source: AGHT+IG5+VU7zRM/3r0g+sE/Wg4Ktyu7wdrWw+1NPB3fYwy5Y4TagVJrNa1v04JtKUEcyOmVxBbGUg==
X-Received: by 2002:a05:620a:290c:b0:7a3:5f3f:c084 with SMTP id af79cd13be357-7c047c45d4bmr1937165685a.30.1739167391164;
        Sun, 09 Feb 2025 22:03:11 -0800 (PST)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c041ded12asm495385885a.5.2025.02.09.22.03.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2025 22:03:10 -0800 (PST)
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 41E001200043;
	Mon, 10 Feb 2025 01:03:10 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Mon, 10 Feb 2025 01:03:10 -0500
X-ME-Sender: <xms:npapZ1SZhivTxCTX1RoW-zzAB6row9ZzSGxLGA_ofGHo3Qk6TUipQA>
    <xme:npapZ-zcdu86-RmDvfTvA3SDb0XcZh0C-NF88kYY7fsOCbW4eNwJoTa0KGBPXRHTx
    GS-_hBAEekex97ODQ>
X-ME-Received: <xmr:npapZ61wCAllvYsjPP-7r-X1uONfGElfPoMXiDoyUQJD3xtQKUH6T-jyOg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefjedvkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddv
    necuhfhrohhmpeeuohhquhhnucfhvghnghcuoegsohhquhhnrdhfvghnghesghhmrghilh
    drtghomheqnecuggftrfgrthhtvghrnhephfdukeeiueevheffkeekffeufeelheektddu
    iefhjefgveehvdetjeffteeviedvnecuffhomhgrihhnpedugedqrhgtuddrqdhlihhnkh
    dpkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehm
    rghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthi
    dqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghi
    lhdrtghomhesfhhigihmvgdrnhgrmhgvpdhnsggprhgtphhtthhopedugedpmhhouggvpe
    hsmhhtphhouhhtpdhrtghpthhtoheprghlihgtvghrhihhlhesghhoohhglhgvrdgtohhm
    pdhrtghpthhtohepohhjvggurgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepghgrrh
    ihsehgrghrhihguhhordhnvghtpdhrtghpthhtohepsghjohhrnhefpghghhesphhrohht
    ohhnmhgrihhlrdgtohhmpdhrtghpthhtohepsggvnhhnohdrlhhoshhsihhnsehprhhoth
    honhdrmhgvpdhrtghpthhtoheprgdrhhhinhgusghorhhgsehkvghrnhgvlhdrohhrghdp
    rhgtphhtthhopehtmhhgrhhoshhssehumhhitghhrdgvughupdhrtghpthhtohepphgvth
    gvrhiisehinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepmhhinhhgohesrhgvughh
    rghtrdgtohhm
X-ME-Proxy: <xmx:npapZ9DTMpg0rtjkLPhGDN4AfmaAWVdm4EL8_AlZP9z0M3ZElbbEgg>
    <xmx:npapZ-jT9Ffv2wQMx_nPmX89VP1hh_q7L927T4tx7fhCa8apghha4w>
    <xmx:npapZxpGZ3Q5bDWKwDNX6r35ww7HCzbiYQrVUmdWIOcMHJrjSGBPdg>
    <xmx:npapZ5jGifcx16iuVSPPnRgJGlW57ft_3MlSe3ChM-tqzuHzxzU9Yw>
    <xmx:npapZ5Tr5hr3Pi9pa6xvM-gDD9nEbD4Wk4STqp46zVmfpvjQAS42WGf1>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 10 Feb 2025 01:03:09 -0500 (EST)
Date: Sun, 9 Feb 2025 22:03:08 -0800
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
Subject: Re: [PATCH v2] rust: sync: add accessor for the lock behind a given
 guard
Message-ID: <Z6mWnMWpAKmSjOBg@Mac.home>
References: <20250205-guard-get-lock-v2-1-ba32a8c1d5b7@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250205-guard-get-lock-v2-1-ba32a8c1d5b7@google.com>

Hi,

On Wed, Feb 05, 2025 at 10:54:50AM +0000, Alice Ryhl wrote:
> Binder has some methods where the caller provides a lock guard, and
> Binder needs to be able to assert that the guard is associated with the
> right lock. To enable this, add an accessor to obtain a reference to the
> underlying lock that you can pass to `ptr::eq`.
> 
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
> Changes in v2:
> - Rename to lock_ref() to avoid confusion with lock().
> - Rebase on v6.14-rc1.
> - Link to v1: https://lore.kernel.org/r/20250130-guard-get-lock-v1-1-8ed87899920a@google.com
> ---
>  rust/kernel/sync/lock.rs | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/rust/kernel/sync/lock.rs b/rust/kernel/sync/lock.rs
> index eb80048e0110..8e7e6d5f61e4 100644
> --- a/rust/kernel/sync/lock.rs
> +++ b/rust/kernel/sync/lock.rs
> @@ -199,7 +199,12 @@ pub struct Guard<'a, T: ?Sized, B: Backend> {
>  // SAFETY: `Guard` is sync when the data protected by the lock is also sync.
>  unsafe impl<T: Sync + ?Sized, B: Backend> Sync for Guard<'_, T, B> {}
>  
> -impl<T: ?Sized, B: Backend> Guard<'_, T, B> {
> +impl<'a, T: ?Sized, B: Backend> Guard<'a, T, B> {
> +    /// Returns the lock that this guard originates from.
> +    pub fn lock_ref(&self) -> &'a Lock<T, B> {
> +        self.lock
> +    }
> +
>      pub(crate) fn do_unlocked<U>(&mut self, cb: impl FnOnce() -> U) -> U {
>          // SAFETY: The caller owns the lock, so it is safe to unlock it.
>          unsafe { B::unlock(self.lock.state.get(), &self.state) };
> 
> ---
> base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
> change-id: 20250130-guard-get-lock-dd5452793d9a
> 
> Best regards,
> -- 
> Alice Ryhl <aliceryhl@google.com>
> 

I queued this with some changes on the commit log to make it more of an
objective tone, please see below, thanks!

Regards,
Boqun

--------------------------->8
Subject: [PATCH] rust: sync: Add accessor for the lock behind a given guard

In order to assert a particular `Guard` is associated with a particular
`Lock`, add an accessor to obtain a reference to the underlying `Lock`
of a `Guard`.

Binder needs this assertion to ensure unsafe list operations are done
with the correct lock held.

[Boqun: Capitalize the title and reword the commit log]

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Fiona Behrens <me@kloenk.dev>
Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
Link: https://lore.kernel.org/r/20250205-guard-get-lock-v2-1-ba32a8c1d5b7@google.com
---
 rust/kernel/sync/lock.rs | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/sync/lock.rs b/rust/kernel/sync/lock.rs
index eb80048e0110..8e7e6d5f61e4 100644
--- a/rust/kernel/sync/lock.rs
+++ b/rust/kernel/sync/lock.rs
@@ -199,7 +199,12 @@ pub struct Guard<'a, T: ?Sized, B: Backend> {
 // SAFETY: `Guard` is sync when the data protected by the lock is also sync.
 unsafe impl<T: Sync + ?Sized, B: Backend> Sync for Guard<'_, T, B> {}
 
-impl<T: ?Sized, B: Backend> Guard<'_, T, B> {
+impl<'a, T: ?Sized, B: Backend> Guard<'a, T, B> {
+    /// Returns the lock that this guard originates from.
+    pub fn lock_ref(&self) -> &'a Lock<T, B> {
+        self.lock
+    }
+
     pub(crate) fn do_unlocked<U>(&mut self, cb: impl FnOnce() -> U) -> U {
         // SAFETY: The caller owns the lock, so it is safe to unlock it.
         unsafe { B::unlock(self.lock.state.get(), &self.state) };
-- 
2.39.5 (Apple Git-154)


