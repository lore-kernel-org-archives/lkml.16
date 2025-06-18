Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B738810E3;
	Wed, 18 Jun 2025 00:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750205447; cv=none; b=YoE4IVWWp+unmml0ZHbfdnTfK7MACPfH/nXTx9mgr8fmmoM1ErSsIZ82zlWPHa/Cnuv1Sxl8FtavJzOyIySX0mXjt1qRJNaVlCo7+6Fgm//sDdCJ4/2h5rDaGc1j8gIPEe80EzEMUV4nrAGFeiRoGQRcn9qYtPHOuC7o6+d3qic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750205447; c=relaxed/simple;
	bh=j1pYkqHwGw20PcMTk+IOT/1KV7JsYRwpXxq5o2ug6RE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SncCF9I2//ck6G4CMHUedGth7O3Jna++CWBxv3RkzdtOaAv7AXEop9iL5gzLiGJY/gto202+nOzuY/cKY9C473q1XICJ/1fbZCqcgi6X4M05s1rdJkRgp+FYDX6YYP6LYhCUGYwOiatMNfTCxPJkhiRC9t0ev0suRR4e/g31BFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YHTkmRjq; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YHTkmRjq"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7cad6a4fae4so1233331785a.2;
        Tue, 17 Jun 2025 17:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750205444; x=1750810244; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=boZB0QLofBCKv3xYq4WEe2A++yitI/cZc0lOrTQ4+BA=;
        b=YHTkmRjqGBj+GeAWjDolHYrBmk756SvJWH2E+YHXhJx/w64XyvLlZQzYvts0unj/bd
         0DMPji2UsrPEVPFvMywEYESVGOx/zH6T4+hFaO/JcRMRJTEr8UFmLdi1Vlx43KVHQRpl
         lsm+rYZwFvFmc+rPHuY+E/B4dcIu7+pljebnCXj0ytb/bMd0dsS+VFyqOPXakToMY6Ko
         8LlXybhnQnSVTb22rGhMvMUJgcPOtRlyUOa9trhJ4ovsm/QNBWkOlf/pAqeoHlsCE8DX
         /d0Gr/r+rYSR097ojz3saNwdfPsx1IoD918AtnUs3ciWahtGS+VmhTmeR51JzBSCof5X
         tFrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750205444; x=1750810244;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=boZB0QLofBCKv3xYq4WEe2A++yitI/cZc0lOrTQ4+BA=;
        b=oQ/q4M4KIPZ9nXb+n2NGhKFiRs3qdQ/vXPiBsExgK7m7BwuCHMYc3s5t085MSQi+RX
         16ksDlmYjBkotuccIhagddAsq6G84tSFWY0V4fQRJDFz7ypxfn8gnzdRU+3XQUedcmsY
         BpL4Majd7euHLPt1hvDVjBc/NsdL85P/n5kCLTD13TLNS6AybIG+DUo7XQeiF0ty7EdO
         1X+4gQLdaDp/6OD2Jue8AgTBUIWNMXmIKX7U3hXaQb+cXCi7n2scI/TRO/LZZr70lhWX
         LPdNPHJ9aPWxcO/IEwtzQXq5zlFKX9cBgiuxIw3/JQRWBFmXOvEIh7Va4LC5+/UZIpqQ
         etjg==
X-Forwarded-Encrypted: i=1; AJvYcCWapShx3E9dGSkv5xgTVMK+3lscfVoyZfp3Seank3W4JoQMm+FZQvgcMLMy/F6uWR2FR8z0CpcKeuKZOzw=@vger.kernel.org, AJvYcCXNwHVchU855yhO787GMy/989GbuYIQE+eSISRZ/+oNQCKzeM5hxIVGh+n1rP6xtcDKowXLpTuFDjKaqbL4ifk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/6uRGxtUXG8DaCmw4eB2cm4a4oZZI1h9rQVFKkKjq5hqowzGN
	aOoSncFz3l/sk4wOcdj/a7bzLWNo2hdOS7UcGjfd3AtXO/+3dO8xH5PW
X-Gm-Gg: ASbGncvmeYmalQ7xzuBXL9ieXGTEI/pyyqMQ4YSXpFyAwQao2aKkvUMqcanjJwcMXdN
	UR+ykLwot35X5vPmcaHpIREBkGv7+P+NUR4bNWRKB5R5k2p8WjqeeWMmzjXUUjYP9fRNM0J6jCM
	9r6Qp0ggCWrcEcJviQpX46aeTuye5rRHReRbqh5x4rOQpIBtUA7fBQK0IiFwpTf/wAzP+8yJQEA
	t/7DRlYVkEPnWw8rCoMUTYpf7m89CpGERwXIsRoP+6iLW1wXUhC7dtd8PQjHccS6o3kiIJmSVUn
	JLxQMpjclkb43I6AhMYu+toURpA8QBjX2m2avXDfVD9HjV9mCfa7fnR4cQV6vHzPJPSpLpFDWy/
	7HqT4um5C3AlPw49c42HWNvBKYpkVd81zwdaCPAN31cWT/y7Zkvq6
X-Google-Smtp-Source: AGHT+IEonbtdt7SQutdwJPPP2x3RlMsvidCl5xccDaQBnlHdJNL0NBZzSZPEVJCmyXvgxOOWp5EP+w==
X-Received: by 2002:a05:620a:1a2a:b0:7d0:a0f4:4440 with SMTP id af79cd13be357-7d3c6ce4eeamr2229990285a.45.1750205444516;
        Tue, 17 Jun 2025 17:10:44 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3b8eaccc4sm711691885a.74.2025.06.17.17.10.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 17:10:44 -0700 (PDT)
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 7BC741200068;
	Tue, 17 Jun 2025 20:10:43 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Tue, 17 Jun 2025 20:10:43 -0400
X-ME-Sender: <xms:AwRSaMXertsO12b40ZtQUb-X6XxUkvSCrI_-PWs0QqrYLt-RWc6_Ew>
    <xme:AwRSaAn0KyHGA7cPPWmsKDaub799Pq_wM4v2V7dWi1vetfhL2LbTmtkrvPSX6s1KC
    5svhVpDHlKyuv3s_g>
X-ME-Received: <xmr:AwRSaAZWo1q4lk5dI4mTdo2CYNYHHpcIWTTKACXwQo-gBeGHtARmKMPtNRw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdduheekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvden
    ucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrd
    gtohhmqeenucggtffrrghtthgvrhhnpeehudfgudffffetuedtvdehueevledvhfelleei
    vedtgeeuhfegueevieduffeivdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhi
    thihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsohhquhhnrdhfvghngheppehgmh
    grihhlrdgtohhmsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohepudelpdhmohgu
    vgepshhmthhpohhuthdprhgtphhtthhopehfuhhjihhtrgdrthhomhhonhhorhhisehgmh
    grihhlrdgtohhmpdhrtghpthhtoheprgdrhhhinhgusghorhhgsehkvghrnhgvlhdrohhr
    ghdprhgtphhtthhopegrlhgvgidrghgrhihnohhrsehgmhgrihhlrdgtohhmpdhrtghpth
    htohepohhjvggurgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghlihgtvghrhihh
    lhesghhoohhglhgvrdgtohhmpdhrtghpthhtoheprghnnhgrqdhmrghrihgrsehlihhnuh
    htrhhonhhigidruggvpdhrtghpthhtohepsghjohhrnhefpghghhesphhrohhtohhnmhgr
    ihhlrdgtohhmpdhrtghpthhtohepuggrkhhrsehkvghrnhgvlhdrohhrghdprhgtphhtth
    hopehfrhgvuggvrhhitgeskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:AwRSaLVwQB3hWo_wXIYbSi7tGmXQdhLtvXZge-_PY8ZfPjgPd_iHdg>
    <xmx:AwRSaGlf0nI5rDcHi3_wuUb0W8KsSo-ZKXEQ6P_BDbSrDCgovPNr7w>
    <xmx:AwRSaAeS_Wj4mhYsf5IxChIvWe77tq6M5miiNX1PL0MJ_0U77az0Gw>
    <xmx:AwRSaIEIO6gBSBkaF9UP6qOPWtq0QKxNNgUVvxY3LTDCS6QfjgFIcg>
    <xmx:AwRSaMlRY2hZBYDYaNqf8-_ISMVZ_rkgF_8u_TGEdl4HfnHfvByv-Unt>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 17 Jun 2025 20:10:42 -0400 (EDT)
Date: Tue, 17 Jun 2025 17:10:42 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: a.hindborg@kernel.org, alex.gaynor@gmail.com, ojeda@kernel.org,
	aliceryhl@google.com, anna-maria@linutronix.de,
	bjorn3_gh@protonmail.com, dakr@kernel.org, frederic@kernel.org,
	gary@garyguo.net, jstultz@google.com, linux-kernel@vger.kernel.org,
	lossin@kernel.org, lyude@redhat.com, rust-for-linux@vger.kernel.org,
	sboyd@kernel.org, tglx@linutronix.de, tmgross@umich.edu
Subject: Re: [PATCH] rust: time: Seal the ClockSource trait
Message-ID: <aFIEAiDKnxsZQ8s4@tardis.local>
References: <20250617232053.3927525-1-fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250617232053.3927525-1-fujita.tomonori@gmail.com>

On Wed, Jun 18, 2025 at 08:20:53AM +0900, FUJITA Tomonori wrote:
> Prevent downstream crates or drivers from implementing `ClockSource`
> for arbitrary types, which could otherwise leads to unsupported
> behavior.
> 

Hmm.. I don't think other impl of `ClockSource` is a problem, IIUC, as
long as the ktime_get() can return a value in [0, i64::MAX). Also this
means ClockSource should be an `unsafe` trait, because the correct
implementaion relies on ktime_get() returns the correct value. This is
needed even if you sealed ClockSource trait.

Could you drop this and fix that the ClockSource trait instead? Thanks!

Regards,
Boqun

> Introduce a `private::Sealed` trait and implement it for all types
> that implement `ClockSource`.
> 
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> ---
>  rust/kernel/time.rs | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/rust/kernel/time.rs b/rust/kernel/time.rs
> index eaa6d9ab5737..b1961652c884 100644
> --- a/rust/kernel/time.rs
> +++ b/rust/kernel/time.rs
> @@ -51,6 +51,15 @@ pub fn msecs_to_jiffies(msecs: Msecs) -> Jiffies {
>      unsafe { bindings::__msecs_to_jiffies(msecs) }
>  }
>  
> +mod private {
> +    pub trait Sealed {}
> +
> +    impl Sealed for super::Monotonic {}
> +    impl Sealed for super::RealTime {}
> +    impl Sealed for super::BootTime {}
> +    impl Sealed for super::Tai {}
> +}
> +
>  /// Trait for clock sources.
>  ///
>  /// Selection of the clock source depends on the use case. In some cases the usage of a
> @@ -58,7 +67,7 @@ pub fn msecs_to_jiffies(msecs: Msecs) -> Jiffies {
>  /// cases the user of the clock has to decide which clock is best suited for the
>  /// purpose. In most scenarios clock [`Monotonic`] is the best choice as it
>  /// provides a accurate monotonic notion of time (leap second smearing ignored).
> -pub trait ClockSource {
> +pub trait ClockSource: private::Sealed {
>      /// The kernel clock ID associated with this clock source.
>      ///
>      /// This constant corresponds to the C side `clockid_t` value.
> 
> base-commit: 994393295c89711531583f6de8f296a30b0d944a
> -- 
> 2.43.0
> 
