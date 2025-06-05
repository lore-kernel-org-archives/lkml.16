Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63EFC1C6FF5;
	Thu,  5 Jun 2025 04:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749099475; cv=none; b=tA7UOEdGjFYrM/pW6lHcI3hEtH7pgUuscdrbwpJWH2I0P9D/lhZYC0ZCBbg6ucOO7JSodhtirVc0Eb6Jeczj12f9M3DGwvMx/2BRmL+ayFxeObjWfIeEut5NjEh1MTWQ/FMqYWt+O7hyT59sJMt9PAWMed/EfT1OjZkWnODsxmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749099475; c=relaxed/simple;
	bh=AuYV66Ih0LXZxDwQJor5VmM4o4LMdvsXL4ek9ntMWYo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g4CZhTktJAZO7oCFi7toultGwUCMkAOrwSGmK9HzLczOAJCMn5jY3ebLSTT1yKBL39lyhgqqSnISCCrULADFwYGB4oC+r6lYrp2sVZFJpHQf2flsLo+eALf2DSuekd/GIbrVPg5Kqz3N/sUAiwuhy2xWnh0kVW+pWifv6hrbO1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hwPNDL/g; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hwPNDL/g"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7d0997d3ac7so65286185a.2;
        Wed, 04 Jun 2025 21:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749099473; x=1749704273; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hxLMAwf5kST/2aAdJnXG9CfUn1R9lHnOYKKuQIdJb+0=;
        b=hwPNDL/gcZTZl7lerzfg27MLN2wwixLFGT3bHNmREMjDbDu8fnn5GFHSn9ilJdiUJ1
         Kvm9utU9fa18bc+g6ZkifvXldN9wKWYDA5GU6VWbgbhJDKZwFIbIRZEYT/LKdiUgteiW
         kI8XDVV5pLqviJZ+qALndWERphLmEZP/NsK7slEeQY5uHDecVP+jAz76jDQIj5wdp1CI
         BaIEV43nAINaRrPdwwv0kZkAQ2yzXUYzZXk2A/8QegOh1iEb9KhMuAO9uZvIZFDvzhsy
         ALw0rByc4xk9y9EvfVF1xruZBCvi/E3HJgWsSkwKtKRa+UW61z4oZ5ecFPvhrFJJZD0X
         lJCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749099473; x=1749704273;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hxLMAwf5kST/2aAdJnXG9CfUn1R9lHnOYKKuQIdJb+0=;
        b=YcugcHV2irDvX4SJ76QcAigBpmelh4AeVnP/XtxI5k4075ya3Sb3ezKs4jd9sTU89x
         IdYrx//lxxRbwkQRU0sQn2Q3dAL2Qvg/3B1HZCgAVbOBD12y7nxnL1/FaLxbfsBsgUj/
         7mxg4ruHafW/Ysr2t5bRBunmRJRAQXjNKbZ1uxqPNlbPWDBtihimQHEWO5pSivAn0bwj
         +6IQXY92/cM5R/vf8+BxqyMtQsFxBvOUb9TbiXwJRubgTg27CzvagMy5LqloPzkDemT8
         cFZUQfxBWG+Ewh9+Y70Yh/fQ4cnFInHcOdYJCSImPfhfc0y1LXUYbKmfJumPBeVgQINq
         6xYQ==
X-Forwarded-Encrypted: i=1; AJvYcCU0O2O/xEXCNUE+kv135QMYBtDKBuSd8ktUGaf1bqNR7xNwvm/cd9L72yBKR7Gi7eu0KwLlcgHN1eUkRAa6fAc=@vger.kernel.org, AJvYcCUHI6wFmtGmrOoGnXgB7IPKRpTbA3Gfai3pGNcrA/TJAGlY6CTSOc5nyAUzzTkcJ7xMadXFeJvaBgBBENk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwRZStguk/O9cr6mpqyzjDfwDwDC3qM4aJv3XlvlIYpyTukozn7
	lzgQZdFTw2lJn3FEHgYjvwci68xgafr5dSfPmEeGwL0Rb/YeIN/6l9Ml
X-Gm-Gg: ASbGncsLCs0gZqO7iEMBH/V969QRfT03WVCV6xjkXzlKZRVMi3miHlcjKLw8DZlgjPV
	bMRJxJuEjBqPB4xUAxwm8QBqmgsb66NeE2KTpoqaUEtl9cHhDXcw8EKIuT+8q/IziymfVv0ur4X
	NGARuQwWvbv6J3s0YvO0ZKYjUxBnDENC8l4TCULccai65Jmr9zD+As6ouD0t+tyk3/HJqlZ3a6c
	xHwJW8e455+cDiXk3i16hzrzTINpCO1ppjvh23fR/116GsdpDC29njmRsVd+wFJJR93anM0c9PO
	F6R6haXCM9nO1CizHFcqw9oE7UvG8Iz6N9FUWs++Xa1SJbiYyFnfDmYKIEkORdwU3pwbvxVSLJ1
	ebTMK6mqvyH2z23MIf/m+1JlRe7GJghrsETvQXiiRRnUdEuvdsl6h
X-Google-Smtp-Source: AGHT+IEb4KQbsxDXGPCc7TeXoW3/SOxU7yi3JWWPXwW1535gcjsOPKCrVSY8aqqP/ctMHA9Sr0onFQ==
X-Received: by 2002:a05:620a:4802:b0:7d0:a1ac:e83a with SMTP id af79cd13be357-7d2198934bfmr731043285a.16.1749099473099;
        Wed, 04 Jun 2025 21:57:53 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d09a1a7949sm1185334785a.108.2025.06.04.21.57.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 21:57:51 -0700 (PDT)
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfauth.phl.internal (Postfix) with ESMTP id F01FA1200066;
	Thu,  5 Jun 2025 00:57:50 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Thu, 05 Jun 2025 00:57:50 -0400
X-ME-Sender: <xms:ziNBaMyiLRIF-jACRBLQUluBcYifJmU5V7RV4ywNZOGn4lmjE9TLeA>
    <xme:ziNBaAS1twFlnAw_dPsTkMIbEeCEQfeYZG33PZshIf-gKrZFWtXZffFBQUW1MTJY2
    jB913R7bDwLbwiJgA>
X-ME-Received: <xmr:ziNBaOUC6hamRHq6QlKJ80AuSwH2kR0m8OD7g1XS2vd99gYTW2ds5DijwQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdefudeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvden
    ucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrd
    gtohhmqeenucggtffrrghtthgvrhhnpefhtedvgfdtueekvdekieetieetjeeihedvteeh
    uddujedvkedtkeefgedvvdehtdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuve
    hluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghoqhhunhdo
    mhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedtieegqddujeejke
    ehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfhhigihmvgdrnhgr
    mhgvpdhnsggprhgtphhtthhopedufedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoh
    epthhorhhvrghlughssehlihhnuhigqdhfohhunhgurghtihhonhdrohhrghdprhgtphht
    thhopehojhgvuggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrlhgvgidrghgrhi
    hnohhrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepghgrrhihsehgrghrhihguhhordhn
    vghtpdhrtghpthhtohepsghjohhrnhefpghghhesphhrohhtohhnmhgrihhlrdgtohhmpd
    hrtghpthhtohepsggvnhhnohdrlhhoshhsihhnsehprhhothhonhdrmhgvpdhrtghpthht
    oheprgdrhhhinhgusghorhhgsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrlhhitg
    gvrhihhhhlsehgohhoghhlvgdrtghomhdprhgtphhtthhopehtmhhgrhhoshhssehumhhi
    tghhrdgvughu
X-ME-Proxy: <xmx:ziNBaKhlPIZZ7oMaw28npzqkZ1tw0xp2n5aR0bsO52KALVo2rC3KKA>
    <xmx:ziNBaOD8Lw5rL7m_IjoCsH5TG2PVnSRb6fXapqs4bCIKwfMQz2VuYA>
    <xmx:ziNBaLKHBgfcDMsl3OLg9h8xdhuJyXOlc3GgNoesowZR9wfL1cqzIQ>
    <xmx:ziNBaFBEZ8KMhjVH8nl3e9Y5SptA4GerewjTcAhDM5PhDfHH97FnbQ>
    <xmx:ziNBaOzCyO8PsWhDt09QLdMMeirNcs0hTfjfDxQ73_0XpP7Bi54PzyRA>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 5 Jun 2025 00:57:50 -0400 (EDT)
Date: Wed, 4 Jun 2025 21:57:49 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] Rust for 6.16
Message-ID: <aEEjzTMJm7YzS1Ks@Mac.home>
References: <20250605025400.244965-1-ojeda@kernel.org>
 <CAHk-=wik7gvxt-CEak_4HsGziRwo6-7q9LGeW37Pj9182dJ=ow@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wik7gvxt-CEak_4HsGziRwo6-7q9LGeW37Pj9182dJ=ow@mail.gmail.com>

On Wed, Jun 04, 2025 at 09:18:36PM -0700, Linus Torvalds wrote:
> On Wed, 4 Jun 2025 at 19:54, Miguel Ojeda <ojeda@kernel.org> wrote:
> >
> > There are a few conflicts, including semantic ones, but they are all
> > easy to apply. The resolutions in the latest linux-next are fine; I also
> > did a test merge -- please check either to catch the semantic ones
> 
> Hmm. I don't understand why the suggested merge adds those
> 
>         let self_ptr: *mut Opaque<bindings::drm_gem_object> = self_ptr.cast();
> 
>         let ptr: *mut Opaque<bindings::drm_gem_object> = obj.cast();
> 
> cases to rust/kernel/drm/gem/mod.rs, and it built cleanly for me
> without those changes, but that may be because my build doesn't
> trigger this.
> 
> But in the name of safety, and because I didn't understand that
> change, I modified my merge to do what you did.
> 

FWIW, I think this thread has the explanation:

	https://lore.kernel.org/regressions/CANiq72mFL4dn+0JppLLfxyKnM+xYwKeduFw2j07hUfxWVVHdUw@mail.gmail.com/

I believe these changes are needed because in commit b20fbbc08a36
("rust: check type of `$ptr` in `container_of!`"), we enabled the
checking for `container_of!(ptr, struct, field)` that `ptr` must be the
same type of `&struct->field`. But the drm/gem code is added from a
different repo (probably the nova tree), so the adjustment has to be
done in a merge. Miguel can keep me honest on this one ;-)

Regards,
Boqun

>                  Linus
