Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 571F21B0F1E;
	Wed,  7 May 2025 16:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746636388; cv=none; b=IGyu4NzWy1hWOyxzfwFLVqoHfpZGZsr1FxF6nH4r0wRoSLFYL7PD/FK42y7fRt7c6jgOm0PYwYkhw/2hhlxE58BeLwej7Z/1TB3wHTptcK9quElQAsCcKErED2qgnCqXJbRRIYs9theIAqZ4VnvJsGQR+O18avNwRK8fF+qMnlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746636388; c=relaxed/simple;
	bh=Mtt0cRUZYOVHOueYE9mjwQuBk58ozBbe0Vr58ZLMfpc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EsZVp96cEYGJK/4epBPIzzaNvWlA+mc8haDfNzwqi3d7qSJ45wUhIrWY/3khxRsFfm77RHnbziP+y42xg3cFXtDy2M6C7mywleODRXQVLcfcW2Pr8gRJcAljjnvH3yQyKNlSzsUs6rX8kiAhzijGe6F7WE9CW5Se2r2oojtKOz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N730+WDD; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N730+WDD"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-476a304a8edso78541cf.3;
        Wed, 07 May 2025 09:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746636386; x=1747241186; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hd89TAWi8ved6H/OVhAA1FFV+fScCquo0kkiKhx9eys=;
        b=N730+WDD8znOSG9CCT+VG0Ei8B/rGM1/Uw4H86OaAOvkTcq2hU4MQwL0tth0eQeGza
         myan3tp/ZtSHWyApMoFkoKyv9FLn/nIourQmPoGk4K+vG8QWI7IZbrgmaEKiVdRQO+qI
         bdrCHrA2qOhBEcv2Lr9yqoJyL8SgfsoLDxe8O3EerKGuDQemQvKArrXSPxZHkLhYMGV7
         YJq8vhaDLeVcN+q3bOuowzf6wj1f5t0PfeJ3iIaqdSZDDqeyUtMDiusZVJv0tLZVY2ca
         pcZiBoR0cS7ni7nNTTi3pwnOtgnQLDDa/wFnT96ho75D7JY7d3ttCJND+lx0KcQ61Eg3
         Mfdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746636386; x=1747241186;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hd89TAWi8ved6H/OVhAA1FFV+fScCquo0kkiKhx9eys=;
        b=buuBmd6JQLeXrM+s61MjqGriwhRtl+a2x7zSEYUtEgsjl5S0NDDnnD0Bkkc1AIsUw5
         /fSfSeo9Y9Wo7awDbLXG4LOe+BuAVZneJGvL/iszye30qn4rpdE5ZKM8+QpE+UdhO0Mf
         bcKFiqKjXyJjTV+LUvmMb4FwQZlkpCeJ5ni2AksWfhr+TgDSLqpmnmdEqMnJaY20mmtw
         c1QXGWlh9JvCEcaKQW8ZpgV9jWfQX3zSTuv7AjW3EaaaJQDobSRS1yirsY7yPQ1+qiWc
         ebSoJ6hSnnrCfPU6f+9DTkuw5QPyUHQOaDyWkcjI0pwwqe6O4OtqKzZ1PvmAH908ptFF
         CtNw==
X-Forwarded-Encrypted: i=1; AJvYcCVXp3y+doCOtYdAVygez30wD6v9MbGm89aU1lOlXV735MvVZTLov8/KfagsMENqzN7rYdMuD2/W5yPVK6wQrMc=@vger.kernel.org, AJvYcCWIiPZAygVYowz/CAQVRsHAbeH+o+6SHEwNgk5wv172c7gykBOjEt5yvCZ2ptJg2wN5eLPck5HZ0Xw+0BU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMY7LQxqOWC5BU7zlbCxANY1rszhcl427mXasfSj1ZNzv0Utpm
	W/rMzLRqHxQZX2wxAA+wQyKMqWhX0lUyKPB1amXVr97VlY80X4pM
X-Gm-Gg: ASbGncvSygQzirJ0aVXIhw79MXZfFcrHW6n2sRtwla9WBuQxuHEplmlk4iwMFz8Nu9F
	TdZLK/1Jd+zhxCt/y03n8lgxKmkZC6SkpLYhYnp8x95E9wMta3I+zhhqXDkXKasPbwDzK4H4OxV
	FldGW8KvjBqO9u0guy57iooB858Bq00AH3RNZ8U5oIeJPznxxgrBLURco9wBt5XBK9BiALApgYa
	K9hBvEFdbvouPOzntopJYSaaXbmdRANxok/MwCEHhnB6qhUs7MRWFbRRxgOfSUiVP+jX8b8zO+E
	DWiXkeVaPJ76ygQ/FqQxj2Xnsp+KvAlJex/dXMOUkw/g8XOGjF5Auf05J48XqXsAZ+M4q1InP4l
	qO3p0YDR1SL1okZ+uAKSNcppiiPfUoeg=
X-Google-Smtp-Source: AGHT+IEJua7Vk67mFpz3sMb3PsfxmT1rQAGXeBokkWC0rZEtVZN3iUEH1uX39R05zImyGTFCOjwIPg==
X-Received: by 2002:ac8:5f49:0:b0:47a:e6d1:4126 with SMTP id d75a77b69052e-4922719d749mr53061761cf.39.1746636385896;
        Wed, 07 May 2025 09:46:25 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-492218431casm16787891cf.45.2025.05.07.09.46.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 09:46:25 -0700 (PDT)
Received: from phl-compute-02.internal (phl-compute-02.phl.internal [10.202.2.42])
	by mailfauth.phl.internal (Postfix) with ESMTP id E19BF1200043;
	Wed,  7 May 2025 12:46:24 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Wed, 07 May 2025 12:46:24 -0400
X-ME-Sender: <xms:YI4baPLeooTk3hkLvkhpbrt1yi_8I48Qooxj6Ti8RJF-iy08MQs9Pw>
    <xme:YI4baDJ1tHirj8dzQpBqvt18lxPktT3jf0OutZSjH0bgJJRrGERz8OfP27J91HD4M
    iukQU-mGO-3tOAa-A>
X-ME-Received: <xmr:YI4baHsqmeOANpxF619d2uYpB-a09wJt8nipNGGCfMNVGbQ8wHYGkPmL>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvkeejfeejucetufdoteggodetrf
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
X-ME-Proxy: <xmx:YI4baIYEqZw9oZmdAk9PFSDTieML1mBbTHHLFl9TmQ42g367FTh39A>
    <xmx:YI4baGYV0yk3yxaClxg9rFjtzl-wWA4PiK6V1r8xxeUAJagTkQo_5Q>
    <xmx:YI4baMBcCCMINaER6oW4VzuEatfeyFOGtK7kYqbU6Nbsr_V4f3eNQQ>
    <xmx:YI4baEaPgeH0_WYiaVVIi0mN5YKEt2b4wOcgPrTQCVOBi59WfwweYg>
    <xmx:YI4baKqxGzwWwkoA26Jy7czRmBgtFaCEJLgUuzSIHR7OxwEhZphTKr0F>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 7 May 2025 12:46:24 -0400 (EDT)
Date: Wed, 7 May 2025 09:46:23 -0700
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
Message-ID: <aBuOX0hTLZed3JND@Mac.home>
References: <20250408-vma-v16-0-d8b446e885d9@google.com>
 <20250408-vma-v16-8-d8b446e885d9@google.com>
 <aBuE6a4rXB8qwXfF@Mac.home>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBuE6a4rXB8qwXfF@Mac.home>

On Wed, May 07, 2025 at 09:06:01AM -0700, Boqun Feng wrote:
[...]
> > +impl CurrentTask {
> > +    /// Access the address space of the current task.
> > +    ///
> > +    /// This function does not touch the refcount of the mm.
> > +    #[inline]
> > +    pub fn mm(&self) -> Option<&MmWithUser> {
> > +        // SAFETY: The `mm` field of `current` is not modified from other threads, so reading it is
> > +        // not a data race.
> > +        let mm = unsafe { (*self.as_ptr()).mm };
> > +
> > +        if mm.is_null() {
> > +            return None;
> > +        }
> > +
> > +        // SAFETY: If `current->mm` is non-null, then it references a valid mm with a non-zero
> > +        // value of `mm_users`. Furthermore, the returned `&MmWithUser` borrows from this
> > +        // `CurrentTask`, so it cannot escape the scope in which the current pointer was obtained.
> > +        //
> > +        // This is safe even if `kthread_use_mm()`/`kthread_unuse_mm()` are used. There are two
> > +        // relevant cases:
> > +        // * If the `&CurrentTask` was created before `kthread_use_mm()`, then it cannot be
> > +        //   accessed during the `kthread_use_mm()`/`kthread_unuse_mm()` scope due to the
> > +        //   `NotThreadSafe` field of `CurrentTask`.
> > +        // * If the `&CurrentTask` was created within a `kthread_use_mm()`/`kthread_unuse_mm()`
> > +        //   scope, then the `&CurrentTask` cannot escape that scope, so the returned `&MmWithUser`
> > +        //   also cannot escape that scope.
> > +        // In either case, it's not possible to read `current->mm` and keep using it after the
> > +        // scope is ended with `kthread_unuse_mm()`.
> > +        Some(unsafe { MmWithUser::from_raw(mm) })
> > +    }
> > +
> 
> Due to this:
> 
> 	https://lore.kernel.org/oe-kbuild-all/202505072116.eSYC8igT-lkp@intel.com/
> 
> , I think we should move this impl block into rust/kernel/mm.rs for now,
> i.e. (in rust/kernel/mm.rs)
> 
>     impl crate::task::CurrentTask {
>         pub fn mm(&self) -> Option<&MmWithUser> { ... }
>     }
> 
> Thoughts?
> 

Hmm.. this alone won't be enough, because miscdevice also uses mm. Maybe
you could most of mm defined even when CONFIG_MMU=n but keep
MmWithUserAsync only available when CONFIG_MMU=y?

Regards,
Boqun

> Regards,
> Boqun
> 
[...]
