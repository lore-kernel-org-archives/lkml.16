Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 228171EB1A7;
	Tue, 22 Apr 2025 14:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745331266; cv=none; b=eQhidfWEuTWYuC1Ks8sOJXPfhcL6abOdGxwx1Tw/GyDOaCAt9qIIWa+nc8TRHmdJIjwQD15uwxADyxXuAhSZyzeyB+KLT9y0N9F9etjlF3Jwk0RD6WfDCKSN2lGrydq6FRzq/KUk3FcB0YQV7hZSHxOGPEtJHKZSogw8+DM0B5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745331266; c=relaxed/simple;
	bh=gUMVoxP1PW6j/I8kRltlqngD5Tz3sb5zUqOPutaff5Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EQRZv/PZCdNelIkCA4oNngnzox6fDjbCa0hLblxfAh7laHOVs/oR2t3PUuBOtOmKckyZHbVwB/AD5uyn3WwvcJ74R+eO1WzPOwlO/GP7iDSVPFOWMaafZ0AYBJMU1BdgOTO8MiBWeOkwpTQLZnc8RSHYiNTgarfhSNpnY6ynAQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YxWEyWZi; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YxWEyWZi"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6ecf0e07954so75745176d6.1;
        Tue, 22 Apr 2025 07:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745331264; x=1745936064; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7AU8LYxryxrg2aje8ybNOhFsh0cyGVLb/levXOmOy3o=;
        b=YxWEyWZiKGnOYOWU3WbswIsSUPUmDZT4Zp+K46oATAab2SVji9dlnQacVZMdvt8Ui/
         EK2W0sjWJ3vXruS0WBTuiUxpnmMdMMDqaCYH5ck023enzNZBfWkqy4TNaYdfzwaWKSe2
         4i9vq2tyjI6l7tIbUGI/r/a6lRv/PNv2BQ5GMUgy4Iay2J1a2UMz059MevNiQZ8u5NRT
         vJvDalUuCOF57Y33weZzVzp5XRbk4jnQBClBGCnmlJlZRbT+T8cTD0OpWr9Ccmnf8Oe+
         UT9uwd+mbgVaWHG5gGOXZ99PvOL3ko8tlBXc4wZ4EAj9/fGhO9p7/Da7wz4gUsYToQdE
         HVeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745331264; x=1745936064;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7AU8LYxryxrg2aje8ybNOhFsh0cyGVLb/levXOmOy3o=;
        b=GZ5ZZeSZLFJQE9AvxLXamcwBRYL2mNBlBS7vCwAcDTPP5ohBpqmJ9yd6HbZeJWlILU
         ezIjSkwoZWwV4NhRWUcdaqA35QJs7yV6Kfw6ASOWjdKe2+QEi9rMEqez/dpYq5V9DYRn
         kIr9nlpmpQjaBouIQQANxFQg/NFk/DaQgwhi5L18Lsay9MzAItntSVNhsN8Dn02g7SAR
         KDh7wZ3oZ0x0yq6QYuu3RvvvLshxMeiw+fACpBLKTQPZVfqn1cOuDtD2DfEpgZJWPkU8
         brSvyIzuLdyhB0LgP3OYJ3VPxgW5T7SSJ399wKQW0n6Jg+KPSa+cK9CkVNXosdDMHgjc
         tbKA==
X-Forwarded-Encrypted: i=1; AJvYcCVHUS06n258HtJDZFk8nf1pZJQLAibt6osgtcub2jSKQRtlGRwN9sd8RhiTHAKupJItMU1JuIQYkzySWGI=@vger.kernel.org, AJvYcCVl5ARGdlKWDC9v2/NWI3WCoWAtWD9puaUQiK+Ubp8AaSAFw9XDAf34lMEDPdwJBzQqCJLHLvmNra58luPSD7I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzx2FIrsEy2BSEQosvywipt0Ow3uhqBri0UsbbHo46lVF3OGhw+
	hs58o7r+5vFye4B/ai9AJRoRo0ZBXenVofydoyVo3X+SiObIzOF9
X-Gm-Gg: ASbGncuXlYorIcV4DEhMTbci+hc5F2YxkF9MpVGSW4f015L9eAeupEnsO4NnxEJrARB
	16elb5pHSm8QHHqcFoWLObUKTaknCG1jXyHTLwqw0yxfqVU/ZPySgvg6gAWJlUPXroJJHOWl6Hz
	GiPAFvP4hnyV6n+urK2/9wJQ/0dfsGTiI9T+2Lz4TsB94HyBsaWeXbYdwb9X9ivjZ2+tmjc6asO
	oMjnJAC3W3BUaV45ZsZyuuDKDmdrJc8sTwuaq1LhTQTSSfUwGl5ve9/gyehEoO6hVeceIzP9BUF
	J6wuCyq9574X82wsg6ckoAZaL9SXh7f4nyPALTpxNa/XdQ35pny5vsmKRPJcBMI16ZCix27AjH0
	fVxCIAi0/ZAfgs7MkJWx47DimORdIAj8=
X-Google-Smtp-Source: AGHT+IEYbxYNpY1Fsi+JNxeMSp7UkU6GptWQw2frJdvbeyOqWjoQZMt8BGy1LZAYXE9MEofS4Z4rhQ==
X-Received: by 2002:ad4:5bca:0:b0:6e6:9c39:ae4b with SMTP id 6a1803df08f44-6f2c467235bmr262888116d6.42.1745331263931;
        Tue, 22 Apr 2025 07:14:23 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f2c2af14easm58127366d6.3.2025.04.22.07.14.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 07:14:23 -0700 (PDT)
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfauth.phl.internal (Postfix) with ESMTP id E2529120006C;
	Tue, 22 Apr 2025 10:14:22 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Tue, 22 Apr 2025 10:14:22 -0400
X-ME-Sender: <xms:PqQHaBDp79iYVU1_VVZ92tZmLMA8OR61DI46uSi-QZYaoRuLtCN6Uw>
    <xme:PqQHaPi3QOxYkfT_J5kTXhPcPLnd1NTgne8AFEQcrvN7wZH41xrtgwm2crxUhAq4q
    n3HOBNYO3qYOErYzQ>
X-ME-Received: <xmr:PqQHaMl811xM2bg-pecthYIuDxw3nkYc66s3rtuDB1tF9y-Mv4qfD9jf>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeefleehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtrodttddt
    vdenucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrih
    hlrdgtohhmqeenucggtffrrghtthgvrhhnpefgieegkeelgfekheetudeiiedvlefghfef
    fefffefgudejvefgtdfhhfethfegjeenucffohhmrghinhepghhithhhuhgsrdgtohhmne
    cuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghoqhhu
    nhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedtieegqdduje
    ejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfhhigihmvgdr
    nhgrmhgvpdhnsggprhgtphhtthhopeduhedpmhhouggvpehsmhhtphhouhhtpdhrtghpth
    htohepsggvnhhnohdrlhhoshhsihhnsehprhhothhonhdrmhgvpdhrtghpthhtohepohhj
    vggurgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghlvgigrdhgrgihnhhorhesgh
    hmrghilhdrtghomhdprhgtphhtthhopehgrghrhiesghgrrhihghhuohdrnhgvthdprhgt
    phhtthhopegsjhhorhhnfegpghhhsehprhhothhonhhmrghilhdrtghomhdprhgtphhtth
    hopegrrdhhihhnuggsohhrgheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghlihgt
    vghrhihhlhesghhoohhglhgvrdgtohhmpdhrtghpthhtohepthhmghhrohhsshesuhhmih
    gthhdrvgguuhdprhgtphhtthhopegurghkrheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:PqQHaLwjDL5na5xp5dQW21T_tK5vcdmRCQz8udIXm_Ha7NqM1qA6EA>
    <xmx:PqQHaGTj2QgnnMZCUnbt8hLh19b94B1vcdgyAQO8ghT4SuG9W1MAJg>
    <xmx:PqQHaOZFKGARGDIPWQn3wE8muzXVjV_ggD12UGHHx0dp58dQS0Ip2Q>
    <xmx:PqQHaHT4l3Z5kmYEK25t_MNVn3mLQ9V4R-jwN4Vz02n1xXH0EZRitQ>
    <xmx:PqQHaEDOjbPL5R5HsdJEY9qNkyDd6in3TYMLARNMV38YmTnsYyA4D6wG>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 22 Apr 2025 10:14:22 -0400 (EDT)
Date: Tue, 22 Apr 2025 07:14:21 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Benno Lossin <benno.lossin@proton.me>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, Fiona Behrens <me@kloenk.dev>,
	Alban Kurti <kurti@invicto.ai>, Michael Vetter <jubalh@iodoru.org>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/8] rust: pin-init: allow `pub` fields in
 `derive(Zeroable)`
Message-ID: <aAekPSsKnQWJSBhQ@Mac.home>
References: <20250421221728.528089-1-benno.lossin@proton.me>
 <20250421221728.528089-7-benno.lossin@proton.me>
 <aAchUjDJsukcCgKM@Mac.home>
 <D9D0ZHG5ZKGL.30GLJKI6X8TG7@proton.me>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <D9D0ZHG5ZKGL.30GLJKI6X8TG7@proton.me>

On Tue, Apr 22, 2025 at 08:30:40AM +0000, Benno Lossin wrote:
> On Tue Apr 22, 2025 at 6:55 AM CEST, Boqun Feng wrote:
> > On Mon, Apr 21, 2025 at 10:18:33PM +0000, Benno Lossin wrote:
> >> Add support for parsing `pub`, `pub(crate)` and `pub(super)` to the
> >> derive macro `Zeroable`.
> >> 
> >> Link: https://github.com/Rust-for-Linux/pin-init/pull/42/commits/e8311e52ca57273e7ed6d099144384971677a0ba
> >> Signed-off-by: Benno Lossin <benno.lossin@proton.me>
> >
> > Kindly request tests/examples for this patch and the following one
> > (patch #7) ;-)
> 
> If you send a patch, I'll take it :)
> 

First, I'm happy to help improve pin-init, *if* I fully understand the
changes and have the cycle ;-)

However, here we are at the review process, so I need these examples to
close the gaps between the implementation and the usage to provide any
meaningful review. There's no example/test in the commit log, the kernel
code and (I've checked) the GitHub repo. Although I fully trust you, but
there is no second source that could help me verify the changes easily.

In this case, it may be special, because you're in fact syncing an
external repo with the kernel part, i.e. the development is done, so if
we trust the external repo and of course, if no obvious error is
founded during review (from the people who can review), we should merge
it in. If that's the case, this patchset is more of an "FYI" instead of
a development process IMO. Is this the case here?

Regards,
Boqun

> ---
> Cheers,
> Benno
> 
