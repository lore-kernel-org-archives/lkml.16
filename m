Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A33BA1B0F1E;
	Wed,  7 May 2025 16:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746636945; cv=none; b=AZC0Kx26HKlP+YbTcHhmC46X/AYMzj5zwqtd0JKHPgostbi5jnqCo686oC1zdtC5rstIQvK1Lme+LtD30nlorWW4oCfzLtL/qO/XiZ8dLBqjOEHa8DsWTtAW8OjcrT6iFrDic4+/W5Va9OKBeyhl9mju81b0eerAUi+/eESiSFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746636945; c=relaxed/simple;
	bh=ZZssDqOX+ZB4xi58bWC8yq74FWbsyEBp9ixo4wSD6Sg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s06TFTdPoN4hw+ezkCEP1pLiXWToEp94YrVXYpN6sc4NmWZEv4YBPCesASQJzHlhTIWo4KUmxVZHzUBaLcc4wnVuminkPWaYA8Mw8Pt7uKU+AG+CEWo1nAaU1OWB+C2siXWd6p0C2JiJAgWnvWX8NV2laksKPCQ9832wman1utk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G61qrOCW; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G61qrOCW"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7c96759d9dfso6233085a.3;
        Wed, 07 May 2025 09:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746636942; x=1747241742; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1I5ppO1VDZX6MyoQzXKOYT7d47WFpJvgfa4/DSfWQWE=;
        b=G61qrOCWezV8ej8/8T6FtGufDo+MWsSADyTXoZCwMkTQC5D/UwejB0fQ+uio+zz9Z4
         B72YMfr8t0+YuTcIlJfXJQJdsiLQJGl+ze6EyKyRLyFMNFhHKhZBqrCvz1A1rGCC2D+N
         ARfjoEbPYU/MjVc6Gf1B/weynO7DTDTB+hVSxaLjvKd+ipxR+Cpe6OsG9+mw/AaLs2qn
         RyTjs8ifFqX5lFYLDAalugbw6uIIbMd1BLdJD9pZif1JSXUv//3yDqpB66D3iEJQ/NGS
         6s+ETAkEyFNqBGzm3ejOguu4f1wxhNuAjbC84HMOWV2/ZDwrgiVXCDOBBjm5DIjxrc/Y
         Kimg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746636942; x=1747241742;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1I5ppO1VDZX6MyoQzXKOYT7d47WFpJvgfa4/DSfWQWE=;
        b=ZztLU+Zf/y+c2lT1k1csN66T7t0REpZ/6NQg6XHVlQSfqp/mkyC64FnfQ8qU3F6tCq
         QblfvaYIheSPN9rcPS56Bv8KaDpnmhOE/08SENx4jPmBb12HFJFQEkNYLKg4x9SGwTqU
         YmTVzxkR2TtbTPqzDAP5ABZ/oBy514lt33XweovJROo7BxYk/tpm5kU6RpqjTT8fh3Vk
         itUWwWxSw5DxeKrPHj01lda58C7tRWA6KsEEQ/7fIAz/DPM+SsV7KfhMXloYHbxOAi0k
         qUtyJZuq5cjCb0jnwtLbqv3PyzqGCvJzoWzy02cteeI/UifHe3l4Gd17B221oL5pNr9n
         ZjrQ==
X-Forwarded-Encrypted: i=1; AJvYcCWYc9ikex95DnR+nbF530iWHs+19TyQGDNCiYoZbvHRZ8TzUp4J8P44h8muId4jKjrGpbeDq3vuhl+qw8H5Z84=@vger.kernel.org, AJvYcCXoA9b6qd2rHsRPQoZ0DLTfAHsF9m9nskKS6cSIbJsOARmzVHeIT+z48xh8/awXWK6EQjGu/fqr9GcJ9vU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6ZH1WbN5vQjG0YkmLSVZcYC7N9XUdbxcGrt0WQpoouCwkvppP
	zkvzEoYR2ScUkD8Gw5fLpmQXR8yprEfoQbjShVfh1yw5CsMKido4ac4I2w==
X-Gm-Gg: ASbGncuxLKDuPWsJ0m25e/lIg7w9ZzJNk+qBopIA1WofTWBLdw8mRbey8akuVDg9aWk
	aCOAd4NPl7gfqzPwggfoUG+KoAgWXwL1FVPU+1J+qVfqNW6vTuxQPMfsagOx96ip7ylmHuQspRj
	orP2QBGuPt+spVGOLoaXe8twHPcUkVADkVe5dUci6M4f5KPPOziu9tmp34k+aExI1q6N4qmpzKq
	EiCYDZbKw/1eHwg3LwoPU04Psn/wScLHVXiz+pme53iSrC8bjXBRvzEIGN+B/i5gk/mAR59k+eo
	l3uFA+Ck4Rp+ob98WVQjyRptbaHhIp+Z2efTg9ErBIm4OYWSqhlh+hbHmn2XkpIec4wA9fVKeIp
	MPHH11Ey5kTJvIxA8LsAwooJbzGoTe7TqUWXvAAskkw==
X-Google-Smtp-Source: AGHT+IHuL8oLgBWF1h33SK8BR1KL6BOvxP9dcTGAM+HpWXTMkTKG1Bv/vVNt7Ctfh733dUXlbebQpA==
X-Received: by 2002:a05:620a:29c3:b0:7c5:4a3a:bc12 with SMTP id af79cd13be357-7caf73b6e3cmr543887385a.32.1746636931454;
        Wed, 07 May 2025 09:55:31 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7caf75da840sm174557385a.112.2025.05.07.09.55.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 09:55:31 -0700 (PDT)
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfauth.phl.internal (Postfix) with ESMTP id 7E813120006A;
	Wed,  7 May 2025 12:55:30 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Wed, 07 May 2025 12:55:30 -0400
X-ME-Sender: <xms:gpAbaKm7Otog5VQ3JLZL9MLQev1RjorBVUXtbOLY9wwLwMqoGZtvLg>
    <xme:gpAbaB3ZXYUwSH0VQBSLtmp-FQ2AYXw1lyc31yi0itV8bQoC3dqOGi1JSBK3F0qgk
    602XuzOABjs0xMkEg>
X-ME-Received: <xmr:gpAbaIrXIV42ZqU6EKkTRQbbkpjudJQwGau51DC_hzKMT4QnbwCzEHnl>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvkeejfeelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddt
    vdenucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrih
    hlrdgtohhmqeenucggtffrrghtthgvrhhnpeeltefftdetgefhffejvdekgeekjeejudet
    heekfedtieevteehleffgedvhedufeenucffohhmrghinhepmhhmihhfmhhmrdhishdpkh
    gvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghi
    lhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqie
    elvdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdr
    tghomhesfhhigihmvgdrnhgrmhgvpdhnsggprhgtphhtthhopedvvddpmhhouggvpehsmh
    htphhouhhtpdhrtghpthhtoheprghlihgtvghrhihhlhesghhoohhglhgvrdgtohhmpdhr
    tghpthhtohepohhjvggurgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepfihilhhlhi
    esihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlohhrvghniihordhsthhorghk
    vghssehorhgrtghlvgdrtghomhdprhgtphhtthhopehvsggrsghkrgesshhushgvrdgtii
    dprhgtphhtthhopehjhhhusggsrghrugesnhhvihguihgrrdgtohhmpdhrtghpthhtohep
    lhhirghmrdhhohiflhgvthhtsehorhgrtghlvgdrtghomhdprhgtphhtthhopegrkhhpmh
    eslhhinhhugidqfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtohepghhrvghgkhhh
    sehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhg
X-ME-Proxy: <xmx:gpAbaOktKiAvPVvBHbW_dQAthKTKDBX6F7rZwifPebezFrqZ2GntQA>
    <xmx:gpAbaI2mRDQFtrb1mN4NO1IcZYuvI8QedO7pSCcuCZbmkTsn37LP2w>
    <xmx:gpAbaFs0wD_VERuB4jTWlkQNY5WEmKcvjGFfp804r1Yvv3LQaWcYhQ>
    <xmx:gpAbaEWeYXSmPL1OJ2ypKWViByEPjbbZtlfK3UivZ2Bdj1TodMzVMQ>
    <xmx:gpAbaD0uDwgehyk8GfAkNptp0bluSfJgxJ-7s4Fs9xesN__KXqGo-uhV>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 7 May 2025 12:55:29 -0400 (EDT)
Date: Wed, 7 May 2025 09:55:29 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Matthew Wilcox <willy@infradead.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	John Hubbard <jhubbard@nvidia.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arnd Bergmann <arnd@arndb.de>, Jann Horn <jannh@google.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v16 8/9] task: rust: rework how current is accessed
Message-ID: <aBuQgY4wMv1CsVdo@Mac.home>
References: <20250408-vma-v16-0-d8b446e885d9@google.com>
 <20250408-vma-v16-8-d8b446e885d9@google.com>
 <aBuE6a4rXB8qwXfF@Mac.home>
 <aBuOX0hTLZed3JND@Mac.home>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBuOX0hTLZed3JND@Mac.home>

On Wed, May 07, 2025 at 09:46:23AM -0700, Boqun Feng wrote:
> On Wed, May 07, 2025 at 09:06:01AM -0700, Boqun Feng wrote:
> [...]
> > > +impl CurrentTask {
> > > +    /// Access the address space of the current task.
> > > +    ///
> > > +    /// This function does not touch the refcount of the mm.
> > > +    #[inline]
> > > +    pub fn mm(&self) -> Option<&MmWithUser> {
> > > +        // SAFETY: The `mm` field of `current` is not modified from other threads, so reading it is
> > > +        // not a data race.
> > > +        let mm = unsafe { (*self.as_ptr()).mm };
> > > +
> > > +        if mm.is_null() {
> > > +            return None;
> > > +        }
> > > +
> > > +        // SAFETY: If `current->mm` is non-null, then it references a valid mm with a non-zero
> > > +        // value of `mm_users`. Furthermore, the returned `&MmWithUser` borrows from this
> > > +        // `CurrentTask`, so it cannot escape the scope in which the current pointer was obtained.
> > > +        //
> > > +        // This is safe even if `kthread_use_mm()`/`kthread_unuse_mm()` are used. There are two
> > > +        // relevant cases:
> > > +        // * If the `&CurrentTask` was created before `kthread_use_mm()`, then it cannot be
> > > +        //   accessed during the `kthread_use_mm()`/`kthread_unuse_mm()` scope due to the
> > > +        //   `NotThreadSafe` field of `CurrentTask`.
> > > +        // * If the `&CurrentTask` was created within a `kthread_use_mm()`/`kthread_unuse_mm()`
> > > +        //   scope, then the `&CurrentTask` cannot escape that scope, so the returned `&MmWithUser`
> > > +        //   also cannot escape that scope.
> > > +        // In either case, it's not possible to read `current->mm` and keep using it after the
> > > +        // scope is ended with `kthread_unuse_mm()`.
> > > +        Some(unsafe { MmWithUser::from_raw(mm) })
> > > +    }
> > > +
> > 
> > Due to this:
> > 
> > 	https://lore.kernel.org/oe-kbuild-all/202505072116.eSYC8igT-lkp@intel.com/
> > 
> > , I think we should move this impl block into rust/kernel/mm.rs for now,
> > i.e. (in rust/kernel/mm.rs)
> > 
> >     impl crate::task::CurrentTask {
> >         pub fn mm(&self) -> Option<&MmWithUser> { ... }
> >     }
> > 
> > Thoughts?
> > 
> 
> Hmm.. this alone won't be enough, because miscdevice also uses mm. Maybe
> you could most of mm defined even when CONFIG_MMU=n but keep
> MmWithUserAsync only available when CONFIG_MMU=y?
> 

Something like this, probably? But your choice ;-) Make CONFIG_RUST
select CONFIG_MMU is fine but the question is who is going to unselect
that at when?

Regards,
Boqun

------------------>8
diff --git a/rust/kernel/mm.rs b/rust/kernel/mm.rs
index 615907a0f3b4..8a1c8158f2b3 100644
--- a/rust/kernel/mm.rs
+++ b/rust/kernel/mm.rs
@@ -10,7 +10,6 @@
 //! control what happens when userspace reads or writes to that region of memory.
 //!
 //! C header: [`include/linux/mm.h`](srctree/include/linux/mm.h)
-#![cfg(CONFIG_MMU)]
 
 use crate::{
     bindings,
@@ -130,6 +129,7 @@ unsafe impl Send for MmWithUserAsync {}
 // SAFETY: All methods on `MmWithUserAsync` can be called in parallel from several threads.
 unsafe impl Sync for MmWithUserAsync {}
 
+#[cfg(CONFIG_MMU)]
 // SAFETY: By the type invariants, this type is always refcounted.
 unsafe impl AlwaysRefCounted for MmWithUserAsync {
     #[inline]
@@ -207,6 +207,7 @@ pub unsafe fn from_raw<'a>(ptr: *const bindings::mm_struct) -> &'a MmWithUser {
     }
 
     /// Use `mmput_async` when dropping this refcount.
+    #[cfg(CONFIG_MMU)]
     #[inline]
     pub fn into_mmput_async(me: ARef<MmWithUser>) -> ARef<MmWithUserAsync> {
         // SAFETY: The layouts and invariants are compatible.
