Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E8718BFF;
	Thu, 19 Jun 2025 18:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750359590; cv=none; b=KhVvqNcp6gAOWUBXsb6L7+jdo8Z9ZI7URpHQdAqvyhpIGBQq+LPYbwFRURE0YnhAu+5uYfXZAK8APrOXCm8up/4QOL/5zqVN/SaivU0qyToUPuxI+aPqOBpwsO74iTOf/43zrxrxwwWQOjhbUedR+WMOmPqjGPYPU55N9hBUxg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750359590; c=relaxed/simple;
	bh=TOLG7xak6w6ND+LVUwrbrh5S5uS1/4Bq6RJXuBLzuYg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CLKq9bluC57CBJNG0DO8/rDNC7vQ29476EZRVUxvIBIMjVswwz7F7c8FdDmptE3r3N2VohoNeP2/OfB9YD34wgFZ/RJt2zcMkM2h8bYhecXs224gGSG2TlMotUz0GvCebBvTIk0Dj+d0MBUXMZQBOXgKFzNDNUDdEWhJPIe7kWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UMVSs56X; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UMVSs56X"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-4a4bb155edeso12731441cf.2;
        Thu, 19 Jun 2025 11:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750359587; x=1750964387; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:from:to:cc:subject:date:message-id:reply-to;
        bh=w1ELSZE3lty0Xtt9gFHfkShknLrwt+fHBo6ZnqC38yM=;
        b=UMVSs56X30UFkKT5BCtUYmD2cYkocu70rZ+DVpADiP/49aQr1/NoS+UKqhfhK34/QC
         QFIT8p3u0kk3T9OUYL1xLjCJMN/PjNvdPs7cxDLXDw2UXeJqBTzuCWoVONx9rHIUUBLI
         Zfkh6vTkCTY4y/af78apQlqh5/cM2kHZ8c0BcXsrczCjyQoepWmugcxCzDmOuZqBBu7F
         CnS2fz7QxaUa9IZIln29a9Zx23cRgholDflhcRka3uYbC12X9Y7NoTjRiS/7OQdl9Lj4
         UnHpzes/XxoDwPXPpJwLpve5llutyvs6eLqrrReqaRSzQdCG4FKwOIHIdenZx4gNI9SQ
         /iug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750359587; x=1750964387;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w1ELSZE3lty0Xtt9gFHfkShknLrwt+fHBo6ZnqC38yM=;
        b=WowRT9tn28wrNdvu5BhfXCCiB40K9wWZCZhfeliKWoPzYmcTpJdqLBP3H73ar/fz6i
         7N/YXEM12CL0Vv0WP+JUDVefJP3CjDZcFZFXaaechU+tk18G7bNHxtgSMEHTtt/bqZxo
         b4w+aFdrBhi/lVntdqIvopdEdDOgc0GFoJirlcX6B+inth2ISs6k1h8Xh0M7g4/wlDB/
         j4L2JlwN7qAJjdj1qkboISO3VVjO+w2/8myE6YJ1yA2Vz9myeby51sRAODGAdMyRZh3A
         p76Kaxu9Z09rxfgg6iMbpztcxM9BoUR7Gcsf0RC1v+47lbN+uQuGrz+Zq/Flxoz1eLI8
         RdhA==
X-Forwarded-Encrypted: i=1; AJvYcCUo+c5y78hI4WAcUOJRO8p4gXchfLvFbF4dMUE/yyA+eE8TuMWxIkG2cvkxPdwQeSn12qT9GFadMNQCTJn8H+c=@vger.kernel.org, AJvYcCWlO8XvzITJrZuo9EHHCHdiwS/ONIyYZ156PJCEhugmsoRqJ7DFQjvY70Okfe5onhwPi6bmivIdJEzN81c=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHmQ+FkoC8RRhoouU/yHncA4OWK8kmmS0ZhZGuEq3Vx+SXedY7
	bfoWWovIp+sVACNroXzNTb1c1uPxW2D0yitpBXIRxCw87cW8QwaWESkB
X-Gm-Gg: ASbGncuh4r5PEyfp3AjQ/TC+9RMthRmxVG6dUZkBqv0cI4ysASnebRP2joEyPlqU1bN
	F+9dvsP9EOwfdspNiOFosTjDBhY03X/0+vtDhPr7QIH44eJxolHzYsQwApzBsUbepdGH3PJ6Jnq
	ddkawS0o+UPHb5+ppBCWH0SnhovNCsV1LpIN8ZjeyvXmsH5isKCizENqpMi+Ja+3zojMcC1bbQk
	cr+/V/hIw4ChHm3YcOW/S8I6CMFEOCjNs93a4jIxHKRNbYx4BXuWC7O1JwbR2KsL8QbM93S2LQM
	emLGD/gQ3nonptkr9eYAaerXngEy3brbNsjB8rEFULQmMMtvslmGUbAhqdsZshLEmxSH4g/VKGd
	kp+d7NiDPVWcTcaH2wXEiujhwpjxEzTaB9M/HCl9U3NBwVjm2MCZv
X-Google-Smtp-Source: AGHT+IEIgZxzyOBbU026FFGgQ/qSObmFThlspIoJ7vJYnwMQjddxFrmO91nElkJJQIyudzdSB+LRLA==
X-Received: by 2002:a05:622a:7:b0:48c:c121:7e27 with SMTP id d75a77b69052e-4a77a2915a0mr3401691cf.50.1750359587110;
        Thu, 19 Jun 2025 11:59:47 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a779e95716sm835841cf.75.2025.06.19.11.59.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 11:59:46 -0700 (PDT)
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 3BD0B120006A;
	Thu, 19 Jun 2025 14:59:46 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Thu, 19 Jun 2025 14:59:46 -0400
X-ME-Sender: <xms:Il5UaFwUm3PUou08uwL1xN2pjGv8M-cbIc3aFZThUoZuf87B8FKGPw>
    <xme:Il5UaFRvGGIwAHbo5zlNONWAagbCg32ok-2X4lFnlKhb6Iz0Lka2Zx0GECMrkUPQ6
    ceAMflvd70oSZhhmA>
X-ME-Received: <xmr:Il5UaPU2PSkpbIPqiKHGihtTFB9LqChWdCpAGqT-GEECpVw5q_bV3Dr6HiU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdeifedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    epfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpeeuohhquhhnucfh
    vghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrthhtvg
    hrnhepvefghfeuveekudetgfevudeuudejfeeltdfhgfehgeekkeeigfdukefhgfegleef
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghoqh
    hunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedtieegqddu
    jeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfhhigihmvg
    drnhgrmhgvpdhnsggprhgtphhtthhopedukedpmhhouggvpehsmhhtphhouhhtpdhrtghp
    thhtohepphgvthgvrhiisehinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheprghlih
    gtvghrhihhlhesghhoohhglhgvrdgtohhmpdhrtghpthhtohepfihorhhksehonhhurhho
    iihkrghnrdguvghvpdhrtghpthhtoheprhhushhtqdhfohhrqdhlihhnuhigsehvghgvrh
    drkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgv
    rhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhhinhhgohesrhgvughhrghtrdgtoh
    hmpdhrtghpthhtohepfihilhhlsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlohhn
    ghhmrghnsehrvgguhhgrthdrtghomhdprhgtphhtthhopehojhgvuggrsehkvghrnhgvlh
    drohhrgh
X-ME-Proxy: <xmx:Il5UaHjwL_NU87JWSrE_NoKy27mrE-IzSnX0hayr7OJkvSB76VkxoQ>
    <xmx:Il5UaHD3WJjrvM5Df0V4a7igLKaHy0rWF7uvU9kuJhNHh2jkT0r1sg>
    <xmx:Il5UaAKXVoi38l5Ljb086A9XcVCvfHF0dIbQFpsCku0shdOojhXlVw>
    <xmx:Il5UaGCp_zxMhgeVDs4vZDvGjsqBcRq2xtDa72SLwsqdilcR3WX6aQ>
    <xmx:Il5UaLwqOBiupHG4-F5Moi-qw72BfxCHiiTySJp_NNWeBIMBP2Fic9Lt>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 19 Jun 2025 14:59:45 -0400 (EDT)
Date: Thu, 19 Jun 2025 11:59:45 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Onur <work@onurozkan.dev>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	mingo@redhat.com, will@kernel.org, longman@redhat.com,
	ojeda@kernel.org, alex.gaynor@gmail.com, gary@garyguo.net,
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org,
	tmgross@umich.edu, dakr@kernel.org, thatslyude@gmail.com
Subject: Re: [PATCH V3] implement `ww_mutex` abstraction for the Rust tree
Message-ID: <aFReIdlPPg4MmaYX@tardis.local>
References: <20250619140656.498-1-work@onurozkan.dev>
 <20250619141401.GI1613376@noisy.programming.kicks-ass.net>
 <20250619173344.6c72c48a@nimda.home>
 <CAH5fLggxqK+aZcynsq0koWZG5DD=Byc+DrqEZ9ZCr4+pdScMqQ@mail.gmail.com>
 <20250619145334.GM1613376@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250619145334.GM1613376@noisy.programming.kicks-ass.net>

On Thu, Jun 19, 2025 at 04:53:34PM +0200, Peter Zijlstra wrote:
> On Thu, Jun 19, 2025 at 04:44:01PM +0200, Alice Ryhl wrote:
> > On Thu, Jun 19, 2025 at 4:33 PM Onur <work@onurozkan.dev> wrote:
> > >
> > > On Thu, 19 Jun 2025 16:14:01 +0200
> > > Peter Zijlstra <peterz@infradead.org> wrote:
> > >
> > > > On Thu, Jun 19, 2025 at 05:06:56PM +0300, Onur Özkan wrote:
> > > > > +bool rust_helper_ww_mutex_is_locked(struct ww_mutex *lock)
> > > > > +{
> > > > > +   return ww_mutex_is_locked(lock);
> > > > > +}
> > > >
> > > > Do we really need this? In general I dislike all the _is_locked()
> > > > functions and would ideally like to remove them.
> > > >
> > > > Pretty much the only useful pattern for any of the _is_locked()
> > > > functions is:
> > > >
> > > >   WARN_ON_ONCE(!foo_is_locked(&foo));
> > > >
> > > > Any other use is dodgy as heck.
> > > >
> > > >
> > >
> > > It's an abstraction of `ww_mutex_is_locked`. Since this is an
> > > abstraction module, as long as `ww_mutex_is_locked` exists I think
> > > we should keep it. FWIW it's also quite useful for tests.
> > 
> > We're not just adding copies of all of the C methods - instead we
> > focus on the things we have a use-case for. If you're using them in

Agreed. And as Peter mentioned allowing a public API of is_locked()
doesn't make much sense.

> > tests, then that could make sense, but otherwise you shouldn't add
> > them.
> 
> It might make sense to include the assert in the method. That is,
> instead of providing .is_locked() that returns a boolean, have a void
> method .assert_is_locked() that traps if not locked.
> 

Moreover, we should also make it not public in the beginning if there is
no real user, which would still be usable in tests. I.e.

    impl<T: ..> WwMutex<'_, T> {
        fn assert_is_locked() { }
    }

Regards,
Boqun

> 
