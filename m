Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D1EF2BAF9;
	Mon,  9 Jun 2025 02:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749437750; cv=none; b=u3hHu3IHqhZgW7XrN42qlXNnbxRPmx3uNHHfp7YNyJuHVrpAZKSe5o2LWQzI/6c+hEHRYtmqFB2PvrA6WZBfjoxTmGXsICaA210IN9iRTU1FHZfcR2k8/KTHh/fEt1RsuQ6fmhXPfs96aYNfBQ5y05ySckJhjg0n34zl8dCA65A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749437750; c=relaxed/simple;
	bh=zL25QnSJbyDfgZdgjJxG+wF8DFwe59qRTTO1P+aIkS4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ibHGv+EqPAG8Agvwq0iCJF3ibhkHXOdfF/wJ+YvdksGzwoAEp/E6Xptvgd27mt6RwrajnKVmmfW4sZktWMiBWtPW63w5QI7uf4Y4TVALsP1JORaH0KAp6N8skdz90ElqcehY1GpgrakuaRKduqnOdgKW0zRgKb/BOqCvH4j6nhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QqxXyBQj; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QqxXyBQj"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7d38b84984dso216895085a.0;
        Sun, 08 Jun 2025 19:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749437748; x=1750042548; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w+/FFWV/f9pTpZ/GEHZm7Bepjf6z04NXAZYgfWfPY2Y=;
        b=QqxXyBQjogYdKd9xxgZfdXDlw2tStBnq6p5rA4ZMEgsrz7D/uWSXVp/InjzwOopjrw
         /JZw2bsHkGS1YXhPnYQ0bhGO4I3bUwd+TPhGuSndZCuPoR7NeRkZxtG1dYGYqhRYLxqb
         vFdk7DbC4fFSVrgcZe9pludMM4jUtk5GYkRyGWLKG3vDlwLOk4swIHl4kXQuM9p+k7N5
         AKAHEImP1cXDgrMbrymCK2EagWaUPWkQQYkv/Qb12t5ghZVYDl/HbhCQpy8LcY4QvcaB
         cyDezKfH71P7Ngy83dFf/wEXsUlwOTg1B/r3eYKv3VcteRYGMoVozCHV4ijrw5sRymMB
         rH9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749437748; x=1750042548;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w+/FFWV/f9pTpZ/GEHZm7Bepjf6z04NXAZYgfWfPY2Y=;
        b=M55oUEEq3iaPj4KGtEH2gMavSU7v54MZ8pdrUQCkWV79PF7x0QPbPAKo9bTXB9PdJN
         /WrZnr5j8ze955njvLKA1UHC+RqVQid86FDFEkcJoV9Tr5K2BbMcVeo2DXzis2YdAYPh
         9ZPsK9k6Z3MU+5JGuYNnrVNSphj8Tkv66BMZX0gRDbXYZNuKDS+UGudtZcv2zaAgp67s
         xDgxilMw/hzK2tjqPi3PpHToRZvitYLMYdSsyGksSSl5TuIxmGOG5sBX2yDDJbS3zxMO
         AIj5k/wWuXOE+vBNHBmR3ss3tPG/EIYEikUbGFCqfM9BKWb09LGv/VzEE3dyZxp8b563
         nH+g==
X-Forwarded-Encrypted: i=1; AJvYcCVKWFBhbR3AtLzCY2MND/on1INJBTB8iq7Qie1TVeIEW2+W5busC1eLJK3L86KQXferzyp53TxMtIDitnU=@vger.kernel.org, AJvYcCXVHTHuIvXXvcpOCM1zaEr2gXx8yyY838/WpAgtlOHYEeG6wm4jApcT5mvkoVCVaUdwfJjxzDn8SVRRswiPX04=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3w/P+LJxEE8a0/x5fHojXopWiO4CHrw7JHy8JkriQBo0tbQot
	HkdAMC4lpybNdu1Rq9FfZ2zOlTLnWzOyai0Mrys9aLg3SJWkMJLeW7/0hbhIZg==
X-Gm-Gg: ASbGncvD1Ert5dENv1GmlyN9hf1FNfwy81a+ysIZyzzs7jdvSyzVxO1j8dwQe0f+ZXh
	B71JAhILe5RILXD75GWEnQKkwRn1e19Ov4ruihbj5i3zBLpbJbc0BYwaF9ZkU+su2eyAqe4QQIC
	yeoqCqCyFkizXUylBKY3yDjp1YzjUgFd401wzWXDJTbxkr96t/yVO75RjPseE0lLosbB89kykxI
	Nn3jlle0mOwFquFGB3ixLJ8kmaPWLAMfma2Lz9A6JoGtpKS1MKJcMUxYH4+nV5J5p0xcxKZuQee
	jBXRraG47bW1L7M5vjOuRpAeUAj2H34mA5diC3YKvKZ+f8ySk6X/cphckZ+M53ztC31NdNGvbme
	JzfACppY3pgdNKTE2VJkzQJf4VGdqZVmrrgX2LU1qwg==
X-Google-Smtp-Source: AGHT+IEpSK2t1614TwoZ5MUABCqnEkWxyEhzAwiRtFJdzxGC4nqxhsaAHT/AB92SAzIn328EhahQag==
X-Received: by 2002:a05:6214:f62:b0:6fa:ccff:352a with SMTP id 6a1803df08f44-6fb0905595bmr226174656d6.37.1749437736059;
        Sun, 08 Jun 2025 19:55:36 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d25a61b5fesm489447985a.93.2025.06.08.19.55.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jun 2025 19:55:35 -0700 (PDT)
Received: from phl-compute-11.internal (phl-compute-11.phl.internal [10.202.2.51])
	by mailfauth.phl.internal (Postfix) with ESMTP id EE0C21200069;
	Sun,  8 Jun 2025 22:55:34 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-11.internal (MEProxy); Sun, 08 Jun 2025 22:55:34 -0400
X-ME-Sender: <xms:Jk1GaH_11Mjbh0lkAc4Q0q7O5cm_4ml022kC6RZ_iDF4-fdt4bRFpg>
    <xme:Jk1GaDu9RpK38ZjOwlxDix_pqd6GG2Ubp35YekrVW2eYZWsewpBOGyPZ99Xhy1Xcr
    J8JGMLU4Re8xKA95w>
X-ME-Received: <xmr:Jk1GaFDs5WlLxDmsp2T0cTWQS_K_1Ys5R1_MxyzHWhPR1FOtANZ1uSQCwg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdekjedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvden
    ucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrd
    gtohhmqeenucggtffrrghtthgvrhhnpefhtedvgfdtueekvdekieetieetjeeihedvteeh
    uddujedvkedtkeefgedvvdehtdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuve
    hluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghoqhhunhdo
    mhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedtieegqddujeejke
    ehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfhhigihmvgdrnhgr
    mhgvpdhnsggprhgtphhtthhopeduledpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoh
    epfhhujhhithgrrdhtohhmohhnohhrihesghhmrghilhdrtghomhdprhgtphhtthhopegr
    rdhhihhnuggsohhrgheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghlvgigrdhgrg
    ihnhhorhesghhmrghilhdrtghomhdprhgtphhtthhopehojhgvuggrsehkvghrnhgvlhdr
    ohhrghdprhgtphhtthhopegrlhhitggvrhihhhhlsehgohhoghhlvgdrtghomhdprhgtph
    htthhopegrnhhnrgdqmhgrrhhirgeslhhinhhuthhrohhnihigrdguvgdprhgtphhtthho
    pegsjhhorhhnfegpghhhsehprhhothhonhhmrghilhdrtghomhdprhgtphhtthhopegurg
    hkrheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepfhhrvgguvghrihgtsehkvghrnhgv
    lhdrohhrgh
X-ME-Proxy: <xmx:Jk1GaDfq2Cc9Jxrdnwv7AfRwPeBEq70lvlWIEfbJttWLi1WkpGsi8A>
    <xmx:Jk1GaMPnwLIM-gmzaDM0l1Te4BagACzGsYptTjrngM-gn-IkwAunyg>
    <xmx:Jk1GaFl8Bq8kFBwr08alJ2V9BiN16zgZINHjgiqh6Vw3nrQcwqhdDw>
    <xmx:Jk1GaGt5JJx4R_SSN6FeOEnsgCR4R5rMLuJWmhkF2uhfYCSCctunxw>
    <xmx:Jk1GaGuh8gHyT-uPDd_KyRgv83ejeRnvmEN0iqq7yhNUjQh0D6lTBY9T>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 8 Jun 2025 22:55:34 -0400 (EDT)
Date: Sun, 8 Jun 2025 19:55:33 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: a.hindborg@kernel.org, alex.gaynor@gmail.com, ojeda@kernel.org,
	aliceryhl@google.com, anna-maria@linutronix.de,
	bjorn3_gh@protonmail.com, dakr@kernel.org, frederic@kernel.org,
	gary@garyguo.net, jstultz@google.com, linux-kernel@vger.kernel.org,
	lossin@kernel.org, lyude@redhat.com, rust-for-linux@vger.kernel.org,
	sboyd@kernel.org, tglx@linutronix.de, tmgross@umich.edu
Subject: Re: [PATCH v3 0/3] rust: time: Introduce typed clock sources and
 generalize Instant
Message-ID: <aEZNJYjK97tAZlUu@Mac.home>
References: <20250609010415.3302835-1-fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609010415.3302835-1-fujita.tomonori@gmail.com>

On Mon, Jun 09, 2025 at 10:04:10AM +0900, FUJITA Tomonori wrote:
> This patch series introduces a type-safe abstraction over clock
> sources. The goal is to remove the need for runtime clock selection
> (via ClockId) and instead leverage Rust's type system to statically
> associate the Instant type with a specific clock.
> 
> This approach enables compile-time enforcement of clock correctness
> across the APIs of Instant type.
> 

Reviewed-by: Boqun Feng <boqun.feng@gmail.com>

Thanks a lot!

Regards,
Boqun

> v3:
> - rebased on 6.16-rc1
> v2: https://lore.kernel.org/rust-for-linux/20250504042436.237756-1-fujita.tomonori@gmail.com/
> - removed most of changes to hrtimer code 
> v1: https://lore.kernel.org/rust-for-linux/20250413105629.162349-1-fujita.tomonori@gmail.com/
> 
> FUJITA Tomonori (3):
>   rust: time: Replace ClockId enum with ClockSource trait
>   rust: time: Make Instant generic over ClockSource
>   rust: time: Add ktime_get() to ClockSource trait
> 
>  rust/helpers/helpers.c      |   1 +
>  rust/helpers/time.c         |  18 ++++
>  rust/kernel/time.rs         | 201 ++++++++++++++++++++++--------------
>  rust/kernel/time/hrtimer.rs |   6 +-
>  4 files changed, 148 insertions(+), 78 deletions(-)
>  create mode 100644 rust/helpers/time.c
> 
> 
> base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
> -- 
> 2.43.0
> 
