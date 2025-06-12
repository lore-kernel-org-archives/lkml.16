Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C68B2D6626;
	Thu, 12 Jun 2025 20:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749758710; cv=none; b=BCEqVfkcKhcYbd5fUuSN2XmfzME2zVMVV3mNpU62427nu8sPnco0Qj/morh5NdQYX5bpdzmNqs9miR03WdSkyHPsVNbRrBjheBbJJV6B6JtLGjR94gU+9uLlvwdz3pLiozWEYgHLIZJ9TtLnQQAFJH+zEX29hCaq2iiWtOwYeOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749758710; c=relaxed/simple;
	bh=fD/NnX816hgjKube9yvfb+JWWN6f4VcImV0sIZEIMeU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=klM4lao1jd3yKpPuYKq7qQIfV6E3nCuj+HvZuc/5ZU9qTOH/pfp25OPNSjjV5gNxhN3OfKIpuJP5zPgWvTUThukAnfm1smd1S8e2XKZx3N0Jc02KvSAnVskjx3CLaLdYKl/FqmRPi86/hCZJzm4m+LVBBb3oyN0EF++GP+0Sk1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G0d9AOEA; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G0d9AOEA"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7d38b84984dso210859685a.0;
        Thu, 12 Jun 2025 13:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749758708; x=1750363508; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/v8Wi9pmLbzK2fVR/8wTPHTfFlRGupAggALw4VZWcDE=;
        b=G0d9AOEAACmauQ22y8hkW79aTKoUuThVoKelZUVjnDs7zu+yYfMpouqd1kOGjpav+p
         hRc1er93aBk6gYJuMcLg1lBFMIq7rkWhvT8+Uycglntwhjo81oTPh8jQYWgp5oO37GBt
         usDIDtwxRwji1Gzo/3r0AbSIb1sxjGcGGA72T6tHXIEzh3vh/DC71D6qzf+/BHeVaFeT
         Dlac8Lu7q4InsFtj6O3X9tV8ltZgq11QR3NsFfPqNY6WAHtUTBZSS1WwRgn34zUqwTw/
         A/BQwBmf4h8R5NQPI9bQUf+MUksGj760RYTJkHOTkDKipO3ojxqjqkeBsJbjfLuSxCeK
         tTbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749758708; x=1750363508;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/v8Wi9pmLbzK2fVR/8wTPHTfFlRGupAggALw4VZWcDE=;
        b=K9ARBx7gocsj0/UhcGWJt/bE7GyrDYwbHPpYCC1PuCPNJbZ63Vf6+EAe0bjHwH0xwN
         g15Ekzw+Q99ZDF4KqKJw/0Oo0mBheXG1ltExkd/wBRt5uuw3FTvecrSIZccpRWoi1jEx
         2DIegh0+pCRea7tE/azfDYj1GMYHgGslMk+dFOqttSGyVJP49Cq91gllX3ZfCzZef4cl
         DhhlvXhgR3ZerJLmbvLB9yO+pxmMh9LsRhQmR+yDen5c6iEp/e3spKX3EwCfMwBL0wzO
         XMPgloJNj4+8oeOyoZMRHHxddxIE1mu2tRfoklP5lJ9wCsts0YzXDYj1wp+xBWRw9mDn
         7jXg==
X-Forwarded-Encrypted: i=1; AJvYcCXUmjxAuAZV2OGfM0ylujzF7LSreWcIYisux/Vk7LIuwC+25Mv/3QtGUyBPEIbjRxzo9U2RfvJdI5K9pqVfLjQ=@vger.kernel.org, AJvYcCXW669PTUFj+joLUQo91sy2Ej1k+Wiep0ZVlRGjIQYlpo40yPz9qjJdsVlu5BK1T9N9myBnKOi5ZYGFfPc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVFjoc1qDigbq6cdNneGbHzsy7Qs5dprRzuMyU0qOxL2eEz2yw
	D1+G43o/n7Q2bBZY2o1s8eJiyGJA2QCmNHG1hJXvoatmgfAE8Rln2xWd
X-Gm-Gg: ASbGncvD3cuNpd3rlMZgpUNaIUxyg5e5/t3Jsil/8bsN014OHVzeYMih7ZIT2BqyQT5
	YZuZLI3u4FKKnFZ7Rg6mIF5Hekj69bD4Qh70TxjKGBDq3H4xCOnZsPCK41SVebXR5hphcT5I6Ol
	EUoHHCH752t+vUxjtgNXnZosGj8E/lC/FfsWmz6oVQMYf6zIhGmPMpRc7mY6X0Qw9afqdz09VCf
	Gm4tGiSfEz9HzFBD0ANrmN4xA1jxgsC6Mjziao6z6hmzU/EjGJWJaYn2fEzqujShYLvEWJFBTiH
	3zRluGUoehYu0aFRACrnQJT4DY0aEfZkkUBX2bCJ8e4hm2V2NjwpKIpiO76S9truwN9un2taFlq
	H6AqCbT6mUk32LcaivnPOpQDT4mdB+Mo+8/FB7J/rc4Ksb1Dwx2Tg
X-Google-Smtp-Source: AGHT+IGPvbhYn1lrn4qrmeoqzJFjK9J0A7QGgbiWc7FHysFCIXuha98d9b++ZX/ELwLmeM9pGf4jzg==
X-Received: by 2002:a05:620a:28c5:b0:7cc:fddb:74d9 with SMTP id af79cd13be357-7d3bc3aa135mr102342385a.22.1749758707841;
        Thu, 12 Jun 2025 13:05:07 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3b8e014dcsm78864185a.34.2025.06.12.13.05.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 13:05:07 -0700 (PDT)
Received: from phl-compute-11.internal (phl-compute-11.phl.internal [10.202.2.51])
	by mailfauth.phl.internal (Postfix) with ESMTP id A02B01200069;
	Thu, 12 Jun 2025 16:05:06 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-11.internal (MEProxy); Thu, 12 Jun 2025 16:05:06 -0400
X-ME-Sender: <xms:8jJLaDKg1c-9WrSx28hWxxjLGRPk-oC9LXUQXrH7iYPsPfmRxfKG6g>
    <xme:8jJLaHI98L03KajeyCOFSEhjpbfFLEDSLmvOCQZ0RfDaBO4JoiHAt_1ovxTbHdkCD
    8foDAuobfUGm_rjtQ>
X-ME-Received: <xmr:8jJLaLvt9i59zBXEyTt_YbiW5XQE0leVQffWjB_jhVQ7AWkwHLZNU40kESA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdduheelkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddv
    necuhfhrohhmpeeuohhquhhnucfhvghnghcuoegsohhquhhnrdhfvghnghesghhmrghilh
    drtghomheqnecuggftrfgrthhtvghrnhephedugfduffffteeutddvheeuveelvdfhleel
    ieevtdeguefhgeeuveeiudffiedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghl
    ihhthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepgh
    hmrghilhdrtghomhesfhhigihmvgdrnhgrmhgvpdhnsggprhgtphhtthhopedvhedpmhho
    uggvpehsmhhtphhouhhtpdhrtghpthhtohepjhhhuhgssggrrhgusehnvhhiughirgdrtg
    homhdprhgtphhtthhopegrtghouhhrsghothesnhhvihguihgrrdgtohhmpdhrtghpthht
    ohepohhjvggurgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghlvgigrdhgrgihnh
    horhesghhmrghilhdrtghomhdprhgtphhtthhopehgrghrhiesghgrrhihghhuohdrnhgv
    thdprhgtphhtthhopegsjhhorhhnfegpghhhsehprhhothhonhhmrghilhdrtghomhdprh
    gtphhtthhopegrrdhhihhnuggsohhrgheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohep
    rghlihgtvghrhihhlhesghhoohhglhgvrdgtohhmpdhrtghpthhtohepthhmghhrohhssh
    esuhhmihgthhdrvgguuh
X-ME-Proxy: <xmx:8jJLaMamAHDz7-udyNIXaRAnQ5xED8QoPEp7Vi9OM1U-oarB-YAKnQ>
    <xmx:8jJLaKaq6PRdbPepVJaW_bsaSLlxn2oAo5ggiqXbd9brNEG7wnkirA>
    <xmx:8jJLaABpUBZ_vC7o5pmrsbmXztk0Mv4neO5_MKsYE9cNAfEfp-lrzw>
    <xmx:8jJLaIZGMP1bP5oyTJkZ5v-KBjTvfqzJBLQlOLYji6S0FsvmZRB56g>
    <xmx:8jJLaOo3I22I0K7cjp0hS0Av5MFGXjhucJXIc_y_asDa0_aC3TqKWFek>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 12 Jun 2025 16:05:06 -0400 (EDT)
Date: Thu, 12 Jun 2025 13:05:05 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: John Hubbard <jhubbard@nvidia.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Benno Lossin <lossin@kernel.org>, Ben Skeggs <bskeggs@nvidia.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Timur Tabi <ttabi@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v5 04/23] rust: add new `num` module with `PowerOfTwo`
 type
Message-ID: <aEsy8XDy6JW8zb6v@tardis.local>
References: <20250612-nova-frts-v5-0-14ba7eaf166b@nvidia.com>
 <20250612-nova-frts-v5-4-14ba7eaf166b@nvidia.com>
 <aErtL6yxLu3Azbsm@tardis.local>
 <f8d9af76-fc1d-4f7a-8dfb-a0606e44c56b@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f8d9af76-fc1d-4f7a-8dfb-a0606e44c56b@nvidia.com>

On Thu, Jun 12, 2025 at 01:00:12PM -0700, John Hubbard wrote:
> On 6/12/25 8:07 AM, Boqun Feng wrote:
> > On Thu, Jun 12, 2025 at 11:01:32PM +0900, Alexandre Courbot wrote:
> ...
> >> +                #[inline(always)]
> >> +                pub const fn align_down(self, value: $t) -> $t {
> > 
> > I'm late to party, but could we instead implement:
> > 
> >     pub const fn round_down<i32>(value: i32, shift: i32) -> i32 {
> >         value & !((1 << shift) - 1)
> >     }
> > 
> >     pub const fn round_up<i32>(value: i32, shift: i32) -> i32 {
> >         let mask = (1 << shift) - 1;
> >         value.wrapping_add(mask) & !mask
> >     }
> 
> Just a naming concern here.
> 
> The function name, and the "shift" argument is extremely odd there.
> And that's because it is re-inventing the concept of align_down()
> and align_up(), but with a misleading name and a hard to understand
> "shift" argument.
> 
> If you are "rounding" to a power of two, that's normally called
> alignment, at least in kernel code. And if you are rounding to the
> nearest...integer, for example, that's rounding.
> 
> But "rounding" with a "shift" argument? That's a little too 
> creative! :) 
> 

Oh, sorry, I should have mentioned where I got these names, see
round_up() and round_down() in include/linux/math.h. But no objection to
find a better name for "shift".

Regards,
Boqun

> > 
> > ? It's much harder to pass an invalid alignment with this.
> 
> Hopefully we can address argument validation without blowing up
> the usual naming conventions.
> 
> 
> thanks,
> -- 
> John Hubbard
> 
