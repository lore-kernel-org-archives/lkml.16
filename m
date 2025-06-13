Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7033718A6DF;
	Fri, 13 Jun 2025 15:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749828316; cv=none; b=eytB3TJ/XKw3fH8Lzz0GMq/gzxa+ZJVHhlnvcQgJ5KLHKG0+O9ovrCUtH00AowdrvUvnMJVUFDyeMl+8F1bafRgVl1mFGJ15cMS8natWqsMK3JcV7mI5S9TqRpIUCVLVP2ooWAf0+jwLgsc0PAulO7PWKQDql0EAcdxzxfcXxMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749828316; c=relaxed/simple;
	bh=7kbpf/amXiLBHBqrXHn/DDFLA4Nstyyxn9xRrRyEAxY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RfvUCvA3qsuv0/9W+k6+F+YyyNgQ3FRavIlI3OohzB2fkEuvZsFyb7sLD0UcJWJ+LHdXpOATSSj3IZnjvSmX+A5HkGx71MtdNBuqauCCb/+bS2L8oljNABf13/ljQOqRvwD7PorNkqZg7sdMY0VNwVGlw01PFgHiEfIYokMpJjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E31CWq5M; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E31CWq5M"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7c922169051so140821585a.0;
        Fri, 13 Jun 2025 08:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749828313; x=1750433113; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lAvMYCY7N602oTIv1xbvy3rwaOD5ob45HmfKgySj4yM=;
        b=E31CWq5MpUA0O/wu1tAnQI2jhikTTKXYgddt/d9IuoU1B9gJ16FL0ixk+LrLBlIQLD
         TWDpcYGJ325BigLzPO2uB+9FDkuWccmc75UL10JGzMbgxQ0ush0uXpb31dwyVQ13l5QY
         rlM0iv4BTbPNDLQ3oopXm9CahGg8Yc9Oy0+ZofqYhuK3+pNrsRAhhLcBG43uIkOAdQUR
         hG1IIHsWt6bv2toBSmPSVyu9ngdABPlP0ehemzOFmi7MniQynzOyVkJvP4J1AZ72QwQO
         jHFe5k2ZURVuZvYNXVQcXwxFXzg0saTGLUpa2M/uTz/vFiW5x+M3xBzVhOsIWxVijd5p
         EZNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749828313; x=1750433113;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lAvMYCY7N602oTIv1xbvy3rwaOD5ob45HmfKgySj4yM=;
        b=mlawKeQDTB293EotX3K1jNPnbsZZ3ePAXMeFjMBNfKCQ7g2RyQd00MF5QpQJDi3/Ii
         SWwT4UFhfK73ROvN7baztBht4/XHFJUEBKhHTyArB77rSK4DzefuGO4uoBQnGqGpaqW6
         SxYBSinTaDqR+/AaayXah/gZsieR4lXUTZsbeAm/QS8+25Q5HfFDlF/L3U8LyQanx5oO
         NW/izgv/ZpXiCwpf/34xqcFKTsWAVyp8LWSxmLrlcX+8ruI2zcBpr+kNEFVzN2sxeGsY
         tPmFcOFLD3ARrsmQyvUytUIuCVYAFJRyf+C42Xp27pGyK1kzd2MDrEq4uZHMhlJt6idb
         A38A==
X-Forwarded-Encrypted: i=1; AJvYcCUHSQMO008sSv9G8EOHsI6eSBaVIFmsto/eulxf2raRIqBhLErpkjuM4OdWD1oQNU9AJpLuj7h5T11Y0Fk=@vger.kernel.org, AJvYcCUbJAE9lGu5Dbr+7biEvJ+ymFxIdGw/lqbI5757jG8yDajiTyIvWjb8MN/orzGTIkRB36ngUR4EwBcoceZ5fEU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzxJb2WNQX0YSHoMrC516lkYi1XZ0x68+XleXVINSlCzpTdMkW+
	n4aiTGgpuQJPWR3BuPpa4Po8o5B4wMgNL9EfvvrspvXBDFj0V3rwR+fZ
X-Gm-Gg: ASbGnct5yHAclEzbKvaoEs1zzmFxULp9QqtB0ftkhGxRn8wu1KVDoSbtX0feDaSHYUj
	uIgN2cVtdqfMOB7mNi+OMe3qbksspavptvtuUNW4JSGGzUR9AChFO6p0uGeOLH1HKjrRZC0BPNQ
	kFxmOGYt3tJI/duEwOYV4VTjWUfolQqo2poJ/v7SKNjdJX4e3GfEl7ZUaeR0T4lTuNzuZOHf+Dm
	ng6GYlOhKSqb0GDEore7PCk1cTZU1z1Y0rRAYzK40hstlxAjcPT/2X/klin0+ZPwGlA5vWZgv8u
	CuC1hahgtV/WRTw6k0g20AdHwBlPIIzV67rNcOAzzNXTtlkCWPfuCAOQ3kC/zXi9/NAaYhCE8UE
	/GxnzIKZSeSBgoGi9b7YaJBwcE4GGAxAd7iyVW+3NOVjjNQRNjAIi
X-Google-Smtp-Source: AGHT+IF0nUAxa3ReBaADmdgbTluy0nUpM5l1CqJ7CF4aRQW+mAF+H8dNcq9aeQVegX9bYVkg1XO5gw==
X-Received: by 2002:a05:620a:2905:b0:7ca:df2c:e112 with SMTP id af79cd13be357-7d3bc4b8904mr469287285a.45.1749828313083;
        Fri, 13 Jun 2025 08:25:13 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3b8eac852sm184655885a.71.2025.06.13.08.25.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 08:25:12 -0700 (PDT)
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfauth.phl.internal (Postfix) with ESMTP id B68461200043;
	Fri, 13 Jun 2025 11:25:11 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Fri, 13 Jun 2025 11:25:11 -0400
X-ME-Sender: <xms:10JMaOdiZhcyzdY9O-UyB-HYPT4bQ2eExX7BSrCeeVb_lvLYlm5YuQ>
    <xme:10JMaIPCXbrhyhWgzd2KbHv3tqiEgajb8TKENsm-AA05nZMNtwojaMca2R1AEfHoG
    PHK8lHfRad0WPP8Iw>
X-ME-Received: <xmr:10JMaPjb0XgDR_VD9sZev4hdAsMDoQjNbtigy7Ghh-_dV-W9yvAHZM1Hvg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddukeefudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddv
    necuhfhrohhmpeeuohhquhhnucfhvghnghcuoegsohhquhhnrdhfvghnghesghhmrghilh
    drtghomheqnecuggftrfgrthhtvghrnhephedugfduffffteeutddvheeuveelvdfhleel
    ieevtdeguefhgeeuveeiudffiedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghl
    ihhthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepgh
    hmrghilhdrtghomhesfhhigihmvgdrnhgrmhgvpdhnsggprhgtphhtthhopedvhedpmhho
    uggvpehsmhhtphhouhhtpdhrtghpthhtoheprggtohhurhgsohhtsehnvhhiughirgdrtg
    homhdprhgtphhtthhopehojhgvuggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegr
    lhgvgidrghgrhihnohhrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepghgrrhihsehgrg
    hrhihguhhordhnvghtpdhrtghpthhtohepsghjohhrnhefpghghhesphhrohhtohhnmhgr
    ihhlrdgtohhmpdhrtghpthhtoheprgdrhhhinhgusghorhhgsehkvghrnhgvlhdrohhrgh
    dprhgtphhtthhopegrlhhitggvrhihhhhlsehgohhoghhlvgdrtghomhdprhgtphhtthho
    pehtmhhgrhhoshhssehumhhitghhrdgvughupdhrtghpthhtohepuggrkhhrsehkvghrnh
    gvlhdrohhrgh
X-ME-Proxy: <xmx:10JMaL_kfhoKrO6X8e3fz52F0wnehq8a6jKkLf17zQC5_DLEj2z-0A>
    <xmx:10JMaKvD4gdM7EQ95ZJZjAv5YReN4IXxytDIypr7FBVye2qNKA75zg>
    <xmx:10JMaCGO40MMjFycUE4eFTeVCmv8MrGVbGoWc57K13ufV-rjUvrk0w>
    <xmx:10JMaJO7nnDgCfmU5iEo8WgGK6AoKvkSkG8oC9hOFgZth1sQ5r7QFQ>
    <xmx:10JMaHO8UP66GCv2E26QOvTPmojbt-HM3WaXjUu0O8N_sb9of3oQwtMv>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 13 Jun 2025 11:25:11 -0400 (EDT)
Date: Fri, 13 Jun 2025 08:25:10 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Benno Lossin <lossin@kernel.org>,
	John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Timur Tabi <ttabi@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v5 04/23] rust: add new `num` module with `PowerOfTwo`
 type
Message-ID: <aExC1j8WmkJn3Csb@Mac.home>
References: <20250612-nova-frts-v5-0-14ba7eaf166b@nvidia.com>
 <20250612-nova-frts-v5-4-14ba7eaf166b@nvidia.com>
 <aErtL6yxLu3Azbsm@tardis.local>
 <DALGWEM3TD3O.95L77CD6R62S@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DALGWEM3TD3O.95L77CD6R62S@nvidia.com>

On Fri, Jun 13, 2025 at 11:16:10PM +0900, Alexandre Courbot wrote:
[...]
> >> +#[repr(transparent)]
> >> +pub struct PowerOfTwo<T>(T);
> >> +
> >> +macro_rules! power_of_two_impl {
> >> +    ($($t:ty),+) => {
> >> +        $(
> >> +            impl PowerOfTwo<$t> {
> >> +                /// Validates that `v` is a power of two at build-time, and returns it wrapped into
> >> +                /// `PowerOfTwo`.
> >> +                ///
> >> +                /// A build error is triggered if `v` cannot be asserted to be a power of two.
> >> +                ///
> >> +                /// # Examples
> >> +                ///
> >> +                /// ```
> >> +                /// use kernel::num::PowerOfTwo;
> >> +                ///
> >> +                /// let v = PowerOfTwo::<u32>::new(256);
> >> +                /// assert_eq!(v.value(), 256);
> >> +                /// ```
> >> +                #[inline(always)]
> >> +                pub const fn new(v: $t) -> Self {
> >
> > Then this function should be unsafe, because an invalid `v` can create
> > an invalid PowerOfTwo.
> 
> Doesn't the `build_assert` below allow us to keep this method safe,
> since it will fail at build-time if it cannot be asserted that `v` is a
> power of two?
> 

You're right, I misunderstood a bit, so if compiler cannot be sure about
the assertion from build_assert!() it'll still generate a build error,
i.e. even for cases like:

    pub fn my_power_of_two(v: i32) -> PowerOfTwo<i32> {
        PowerOfTwo::new(v)
    }

where `v` is a user input and the value is unknown at the build time.
build_assert!() will trigger.

Regards,
Boqun

> >
> >> +                    build_assert!(v.count_ones() == 1);
> >> +                    Self(v)
> >> +                }
[...]
