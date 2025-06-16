Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 092168488;
	Mon, 16 Jun 2025 15:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750086140; cv=none; b=Zhw0o08jNDcS3h0/awfcL2ExH9fbDbDyleM4K62LAbVNey7zRApAQ+2XgTfJuSU/0M4/ZjruFq/ybRIWpxNFB1e/Zkmvwck8fnMRIvgA8Nq5RYY8ltVbnOnL115Psw8P5KsIbHIOHLJt4Jn32r+hSJkkdG5/xota8jM1Lirgemw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750086140; c=relaxed/simple;
	bh=JCQknAprNlRaRH3VNCOPHvAgVWxdW540EkUC2RxQbug=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HGbFMWHQ/U+ZP04JvbaPaS3VKur21GgxuP9PFCAxY/lzG6ErK/hi9tyMxvw1qhDlr0fNsiXKBipReGxlgHOu3akYhuAuuZuUY58SFfIwpiuyXYFBr1+103+iTmMhApFX/XQPLBJkeDc7cK9GlfxtPHQFVurFvx1gmMcwLQuo4Ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k0OfcAiA; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k0OfcAiA"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-4a44b0ed780so67878621cf.3;
        Mon, 16 Jun 2025 08:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750086138; x=1750690938; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rwgpX5X/SCSKuQA+X6Wr14gURs3q9R5/sK1cAoP4C5g=;
        b=k0OfcAiAikyNBYKeaP23as4rl5Uzk6fwLcuyxTapPupcjuj5rrjjF1D0EeGGXe7mE9
         C9WztOjTcRHna0oMhEDZ3R2GIDKQdyWqswhnlqpjW0yQhc4sZ0l0S6UGqJFFEA5Wqo/U
         T3j1/vGS20+letvCevUf2XEi+as2GucHRqIyZg/3FD15BVJgtOavEyyzJ8Zxi4H3rDxT
         GhVh85oPtPd+eoZd4obrpkKsiK0e5FBFtTJHl435wA9LyYuHFeIZ3xyRcAfi3i9F66CG
         a7A4YCKwE9JyL0LBMmOAwwUbRjpSlR79x9AS3qLi+GiOvx/sEbJLqmbnlxyFm9bwGKXR
         eCAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750086138; x=1750690938;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rwgpX5X/SCSKuQA+X6Wr14gURs3q9R5/sK1cAoP4C5g=;
        b=ZAZIXHfafEM71RX0rl9auK5NhB0lmEh8ZyPPoYMqyD6/mNTuNgo/968tsJMbNXKaK4
         8B39me+SY0MtH7WNZSJGIoW91jgT1XoGm+feofbsg63nit/09yCSiQaDAuAZy1cAyTYr
         PKvqXDNB1/PZYJ12Qj1GxZkzh7TuBl2XThzQALSTTqpekijMAdLrRGidB43FdjoTg7HB
         Wb66LEKJ4zfn9yaIkZDloUiBQ1xNrsbLpGGIcDLbujRaLRuJGBfxOI4IgW8Fsmik1z6X
         Vbpth6zpsDQFZ1rIzIg7lcT1XT+ImnAV3Vi2QZOE7RgfjQAGt+ucvQoNXmuzWziX0Iu2
         RivQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQuZOYLn5NUKf6ZzQ4/1lhsWU+YFXQXzF68b114nbi3HlzPA4LxjsHRhuOlkPuiwXN0rNxRcPKqV42AyxWiKE=@vger.kernel.org, AJvYcCVNF9tEMj+8p4B8PGPlj3uyPkftw1NG6q10IZoQhUpGAEDVaGudCI8vF+FIAzkcKWTjOegw6RdMR5kVI2s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3ZPQ4GOtE6xlg+VvnxuWQngLnjiKUz81egEefOpJGGPkeyFTx
	ZVbJv5KWRBejtTDrrxuaB9nbGKFaVv1ZIPmWojNQKs/lQVv8JJJi8ul7
X-Gm-Gg: ASbGncuMTuIkRejAR+eJh4VM4EapQgjnXtpDPpBKBzqVKfZ11HE1Nwwta55I5irbeZS
	0+Z1qlyUSTEzbNFTAK2ikILkBOF2MNtN1e9/cQdkHQxWuCCs0RQmcejUar8tiXgfimfSfvhpse9
	fe/np7M/pPlQvbvI7jJ4HTArUn1ahF959u4d8p6SSCIhwiAev95TvNWISiDVxE9BceoFj9Jt4jO
	uNNKdthxheAY0MJJuTEZes5KI9Sm3QD8Cwo9plF5Fb80msAKdX6uN0Hn9KaTWzS3P30q8U8Nw64
	fBmDNfSRaImVPOIAW/NXirAGU/aMXCL7bDNt0Ckg8dDiSMQwH1kxjrNlqHMBbv9MUoLEWNTdfQP
	lHKncwvndRlnbRD1ZCmewxrGOyDmpzlifjWRZRmzghMKTKrmBAiVx
X-Google-Smtp-Source: AGHT+IHu7j4JO1Xh2sKe5r+VwP4idYsvwoWSUvoHNcSBKiiyOGa2xqmyYRuhHztCpmvWIAUC3TRLfQ==
X-Received: by 2002:a05:622a:453:b0:4a5:8387:8b9f with SMTP id d75a77b69052e-4a73c533a10mr127583261cf.15.1750086137767;
        Mon, 16 Jun 2025 08:02:17 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a72a4e7edasm50151221cf.67.2025.06.16.08.02.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 08:02:17 -0700 (PDT)
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfauth.phl.internal (Postfix) with ESMTP id D0C921200043;
	Mon, 16 Jun 2025 11:02:16 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Mon, 16 Jun 2025 11:02:16 -0400
X-ME-Sender: <xms:-DFQaMIMUV5BlWzax-bGLEnY5aQD5n9anZZJrmDo8vD_hVhhdD5b9g>
    <xme:-DFQaMLWxkBzXAmjKHmMVmqQMWZP7OAJiaAu2ZBBTJj-bq3YS7KOz1ui9bexDqhvd
    UFiuRWFp9yK7E-Tqw>
X-ME-Received: <xmr:-DFQaMsU1GdEImg1QIGALTtYGSVtY-Jfy662MBvd36CE_yGbkwKnD81vHA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddvieeklecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtugfgjgesthekredttddt
    udenucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrih
    hlrdgtohhmqeenucggtffrrghtthgvrhhnpedtgeehleevffdujeffgedvlefghffhleek
    ieeifeegveetjedvgeevueffieehhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
    grmhepmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgr
    lhhithihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsohhquhhnrdhfvghngheppe
    hgmhgrihhlrdgtohhmsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohepudegpdhm
    ohguvgepshhmthhpohhuthdprhgtphhtthhopegurghnihgvlhdrrghlmhgvihgurgestg
    holhhlrggsohhrrgdrtghomhdprhgtphhtthhopegrtghouhhrsghothesnhhvihguihgr
    rdgtohhmpdhrtghpthhtohepohhjvggurgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoh
    eprghlvgigrdhgrgihnhhorhesghhmrghilhdrtghomhdprhgtphhtthhopehgrghrhies
    ghgrrhihghhuohdrnhgvthdprhgtphhtthhopegsjhhorhhnfegpghhhsehprhhothhonh
    hmrghilhdrtghomhdprhgtphhtthhopegsvghnnhhordhlohhsshhinhesphhrohhtohhn
    rdhmvgdprhgtphhtthhopegrrdhhihhnuggsohhrgheskhgvrhhnvghlrdhorhhgpdhrtg
    hpthhtoheprghlihgtvghrhihhlhesghhoohhglhgvrdgtohhm
X-ME-Proxy: <xmx:-DFQaJaoAjpZ7EIKlPsHb-8B7ioeolksyBEfLcAlQOG4QCTKwt8Jvg>
    <xmx:-DFQaDZQJNErWToPm-V46sMX-6H01FZpWeNR70c8wEklulnKo-RE3Q>
    <xmx:-DFQaFBHNfMEc6_EFIwMlNy4z5XKEaG2juYkq0n-1rdGr32hY1N2qA>
    <xmx:-DFQaJbOHvyoWSTmccJWI-Tm5F6rXS47f_Lwscgljbus9CFq4KFzJQ>
    <xmx:-DFQaLqGsZUNZ4aS-MdQNKpIfKdmB4e9AMF0Ly1VVQWwswKCR5s12EJ5>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 16 Jun 2025 11:02:16 -0400 (EDT)
Date: Mon, 16 Jun 2025 08:02:15 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v6] rust: kernel: add support for bits/genmask macros
Message-ID: <aFAx997imisc3HGk@Mac.home>
References: <20250610-topic-panthor-rs-genmask-v6-1-50fa1a981bc1@collabora.com>
 <DAMAPVAI3V8X.N8SAQD6KOO1Q@nvidia.com>
 <9578ECFC-6C59-40E3-9340-A426E8D2328A@collabora.com>
 <aFAqLYBMHkC_X-dr@Mac.home>
 <D29BB87C-356E-4885-8308-456028AE3B6F@collabora.com>
 <D12DC02A-E1EE-47F1-86AF-C25C492FA3D4@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <D12DC02A-E1EE-47F1-86AF-C25C492FA3D4@collabora.com>

On Mon, Jun 16, 2025 at 11:45:21AM -0300, Daniel Almeida wrote:
> 
> 
> > On 16 Jun 2025, at 11:42, Daniel Almeida <daniel.almeida@collabora.com> wrote:
> > 
> > Hi Boqun,
> > 
> >> 
> >> We should tell/educate people to do the right thing, if a..b is not
> >> inclusive in Rust, then we should treat them as non-inclusive in Rust
> >> kernel code. Otherwise you create confusion for no reason. My assumption
> >> is that most people will ask "what's the right way to do this" first
> >> instead of replicating the old way.
> >> 
> >> Regards,
> >> Boqun
> >> 
> > 
> > This is just my opinion, of course:
> > 
> > I _hardly_ believe this will be the case. When people see genmask and two
> > numbers, they expect the range to be inclusive, full stop (at least IMHO). That's how it has
> > worked for decades, so it´s only natural to expect this behavior to transfer over.
> > 

Well, there are always users who don't read the manual, but we shouldn't
encourage that ;-) Technically kernel internal API is unstable, so use
before fully understanding the semantics is a user risk.

And if we provided non-inclusive range as inclusive, there would be
complains (probably from the same people) that:

    for_each_bit(genmask(a..b), |i| { do_sth(i); });

doesn't behave the same as:

    for i in a..b { do_sth(i); }

And we cannot always make them happy ;-)

> > However, I do understand and agree with your point, and I will change the
> > implementation here to comply. Perhaps we can use some markdown to alert users?
> > 
> > - Daniel
> 
> Or better yet, perhaps we should only support a..=b.
> 

Yes, given the const function factor for now, and I think eventually
most people will get themselves more familiar with Rust syntax.

Regards,
Boqun

> - Daniel 
