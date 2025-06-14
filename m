Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96215192D87;
	Sat, 14 Jun 2025 17:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749920914; cv=none; b=bwnq19C+U4X7HrYjn4lM6NfU8GPmUSKUpNWZg0HjVnLk6V7cWoczrbZMYqgGgMXUEVigAC4346FW3KnDoIXyOspZfRKO/+t68YG0/8q39yixkUNUNBClADZ1qb1WFQtHgaW3CXh8msdpOUqg3LnxAQX/7EkuEFwtZOc8F0/TcJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749920914; c=relaxed/simple;
	bh=EDaI/W+7ZFbOpeNW12E5ZZw/Wv+ZPYi3ICn1spYmLS8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GPaZIkf/gq+ZIUNqhKys647NB0D/R2t9kDdkq+40BR+EAFQ7E+jXOfVumzjsrQIQMbc2+4dXx3wjqF+tkSdfvGKcuy610wDGMk8PR5lxAVWsDzO94P1BTxvvBwGdxKgYZwqyF7HgpN1vBqQA/iSTX6bzXNjK452Q0JEZGoNvzyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CCTgwRgu; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CCTgwRgu"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7d0a2220fb0so366626185a.3;
        Sat, 14 Jun 2025 10:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749920911; x=1750525711; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oxVUAAHvP8h1CL9/50hYyRFp+95+lQwkRR0h40rA/qQ=;
        b=CCTgwRguoaL+kA3rPaPEGt6rfsu5Tx1Zgy11z1hw4Gz4Qnfs+Rvh76DNgxsrHdGkgN
         YF0pLZZkh1cho6GSyggS8rZF43M5rGR0cIqA1BliKNeidFbsHcVnWHRbyeY5YHVYY02i
         I8JQF7yHaSCUchVHIm5sMCgBE7aFhS68qtz1MUGwQcEe2ZEFraeGemOMhEwbyZwIELBT
         3P6GwSZsvwWYPF0NW1zn7C2z28s0lwsUUToXngb1W4pRRW0a6kmqsGPLDH7FQb9qyMto
         MOilAmopvk8e8QXeUlR/g6f6nn8OmCQEnv9mVhbXnTc5bdiWqrDfWVbcKi5X66mWBcB+
         OQqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749920911; x=1750525711;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oxVUAAHvP8h1CL9/50hYyRFp+95+lQwkRR0h40rA/qQ=;
        b=FlPJgdQXobEPaZVg/ntAoThcYk00uYUsvz+SBhvLAf4WIDcvd3HHv6EFcmh2F6hGlC
         yXkMGcwjf79r4XZ/MCnaicbvdVDTLSa2U6vLOPGMVRF6ns+DkglvbszVhVZn02gVL0nJ
         9fZASeWByQqJXdTVymYDixjqG8tDNMB0d2MY5edUS+37joYDfJfFWTLujDPV6OqEE2W/
         oUoyG/tqxdK2U+BadIiqzBAEm0N1dUylUPrIStvc6bk+qNJRMxjElUyNDDoSLlOKRDYr
         adaU8aFH1HOGjWda4pXMvUJsXMbIi9zuKb0pQtwb82pueTO5aAfEO7wNR+9eqq/8epoW
         ZEBA==
X-Forwarded-Encrypted: i=1; AJvYcCUzYqZWaWkcWJGDUhVmC+drLIA/cpDN8tkol68btCAhJv93WU23EtGL+9hZeR8U0TAHQcuSJV49Uiop04h5Htw=@vger.kernel.org, AJvYcCXCX8o7b1MK8HLvLk64QMLVZz0zt9Ze9/dSZSgyq1h8u2jSLoQ+FZOjupU0dUCm/jmb5llh/c0bwhSmSJc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLzmljpToHpZF/VsUKLQCEMVsjNPEKgNWhC4gMj8h7hq4rb583
	yZLKo+hdi1QStLGLBVyiIUDe6RfoCRAv6gM4QpA/78IkBdZlk3DWXovX
X-Gm-Gg: ASbGnctane+5BrtlHi63eCFfNICNXjo4UKCAzXLV6CIPuV02aPp0stTz3EJgJzBMszT
	Lx7PijBtbegWtYG/PcrnkwGaqgG/WGBSivhKsftfCcxNXBltPgMut4ijQLw20JduJb92Y6NBBtv
	fGvRVuMQcjUkZgVaMVdN/Brygjv8SuRaDLzXr4v6Z7vbLDrl+lmVO5dElTtrYqpFTRLmubMHwRA
	SSLBfaOgPgYrsGxXtgGXNKJwRZrx/0hopfg/Du0QIHispuUsMs7hmfc9ns3TWAHm9T66zbgVnED
	yca+nnAaEbz61fIovhaZBsFWJ5sGSt66QMVW8vv3MVLwJcAuFdyIyskHHI3G7fVHabr7T/cU/Et
	bWWZn2hhKRV74hqdkhh5lXv/IXWiZoTXXx0SEDH6YXeHx668axz7x
X-Google-Smtp-Source: AGHT+IFuI5Iogxyn4F7KxbnZi28W1LHxaKHJ2292LsmPp2oZPmDqNDtGdBDsq/ot6E0bqW+DooZb2A==
X-Received: by 2002:a05:620a:17a9:b0:7ca:f41a:546b with SMTP id af79cd13be357-7d3c6c096f4mr572262285a.6.1749920911374;
        Sat, 14 Jun 2025 10:08:31 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3b8dc9323sm312906185a.20.2025.06.14.10.08.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Jun 2025 10:08:31 -0700 (PDT)
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfauth.phl.internal (Postfix) with ESMTP id 1054E1200043;
	Sat, 14 Jun 2025 13:08:30 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-10.internal (MEProxy); Sat, 14 Jun 2025 13:08:30 -0400
X-ME-Sender: <xms:jaxNaDa_fdqUB9RuIocIKW8UidJwkUIn4A0q3HBRGMgUVREMdHNxiA>
    <xme:jaxNaCYKE2MOC8kSyCcAy3XqoI1fat1wBEmgdNhrtxQwdZ9PPcZbff-BHc5C49H9Q
    uC_GkmccjMksRy6RQ>
X-ME-Received: <xmr:jaxNaF_OoZCym3thLwfVjhd25VyveWQJBL_hzrurVDE2cEuL9ZeGvhoi1Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddvudeflecutefuodetggdotefrod
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
X-ME-Proxy: <xmx:jaxNaJqkxdpUUQV9yk0sxRCuluUUw6kOcfHdnrkh8a61mHlNX1arFQ>
    <xmx:jaxNaOo1RT6izaizxVP9UWs-2IAqcudHXVlcSDLtSJO3_0bkEf81Sw>
    <xmx:jaxNaPTMhtLH-bGDn1gnSf3WN-VSrJZQigtqfdLxvmE12vyDfrM2Zw>
    <xmx:jaxNaGoNFrt02Ky4jp8HsgwAFF4rdUi-lnYGAWrorw-ffzxbY1dtPA>
    <xmx:jqxNaP6-2cpiS8pKJslikTdmjkOA37vypgNNkTF-P6_7EVybrvejQAAf>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 14 Jun 2025 13:08:29 -0400 (EDT)
Date: Sat, 14 Jun 2025 10:08:28 -0700
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
Message-ID: <aE2sjA4DxFndTZYk@Mac.home>
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
> >> +                /// Aligns `self` down to `alignment`.
> >> +                ///
> >> +                /// # Examples
> >> +                ///
> >> +                /// ```
> >> +                /// use kernel::num::PowerOfTwo;
> >> +                ///
> >> +                /// assert_eq!(PowerOfTwo::<u32>::new(0x1000).align_down(0x4fff), 0x4000);
> >> +                /// ```
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
> >
> > ? It's much harder to pass an invalid alignment with this.
> 
> It also forces you to think in terms of shifts instead of values - i.e.
> you cannot round to `0x1000` as it commonly done in the kernel, now you

Well, for const values, you can always define:

   const ROUND_SHIFT_0X1000: i32 = 12;

because `0x1000` is just a name ;-)

or we define an Alignment in term of the shift:

    pub struct Alignment {
        shift: i8,
    }

    ipml Alignment {
        pub const new(shift: i8) -> Self {
            Self { shift }
        }
    }

then

    const ALIGN_0x1000: Alignment = Alignment::new(12);

and

    pub const fn round_down_i32(value: i32, align: Alignment) -> i32 {
        ...
    }

My point was that instead of the value itself, we can always use the
shift to represent a power of two, and that would avoid troubles when we
need to check the internal representation.

That said, after some experiments by myself, I haven't found any
significant difference between shift representations vs value
representations. So no strong reason of using a shift representation.

Regards,
Boqun

> need to do some mental gymnastics to know it is actually a shift of `12`.
> Being able to use the actual value to round to is more familiar (and
> natural) to me.
