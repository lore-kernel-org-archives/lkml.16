Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADB1425C813;
	Tue, 22 Apr 2025 21:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745356313; cv=none; b=sJGItdBMNKTFZqcOwLvQIn3rNbhUKdtgwJAxAf2jXgvD4Ds9FXzkIOJvkFM/OdtEagsUcUKEMA9w/H5y9Lyb68xWwvQuhDIW0q8KmfssZubHE4AHN3W335heM6lQEMg2CFNPnJ0HddAREJrPha9PwGf2HMLTZqyXPaaz6zuzin8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745356313; c=relaxed/simple;
	bh=CFd9VjwjftMmd2VkU+6DhwAiWYoZPRh758C3870gwj8=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CyH2Twcu2qPW20dM/nCCXPBCce9zLP7COB4b7+pUD7yKJIPK+3e4P1Ld6dICitDaRomRg/iZaguS9SMtZrsziOv4/yR9/Dkd1/kcj6FhAoI09wHuQJaHBkSsYoc7+Ay6rQ1mHmKuZ0M5/GkmJ6G0/UB3l4ciV/p309x0M6yIhdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aZYg8UQF; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aZYg8UQF"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-4775ccf3e56so3816871cf.0;
        Tue, 22 Apr 2025 14:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745356310; x=1745961110; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:feedback-id:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/PgZ7AYND5WhQoEi2XZI2rh/gTmv5RWWjYeDKi9UXao=;
        b=aZYg8UQFlHqAbQ8Je6KRdEQ/DjnANqy2ltGAWr8ffqfYHrZrg12lEDwkuxJuQlAdeu
         MjXru/1OrnWQdMOzJOPs5cPILm+RVwlb+IMIAj4pF4/D+PrJbc1ZBAHF4UJtKmUzn1g/
         deNNE3OpFZNz9gx+m2VSVzY0gprp8rUX43hpFOebuhoGip1OnfrYRZCnmLZsWjpwNnfH
         IIWdPLRLu7VYmFjeHNfMk0prFzOSbJWgUMmWNQfYxDQW5oOidBvUGAjtg/o3QSwDJuiX
         h0fj7Jhky1zqVarduSI5uSgBSmz309aKrZ7KZf/MwW2rXKzvb/X67viMAzYDqAojkYVq
         dSHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745356310; x=1745961110;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:feedback-id:message-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/PgZ7AYND5WhQoEi2XZI2rh/gTmv5RWWjYeDKi9UXao=;
        b=bTosIU3wurkfNOHzb8fC3eFSQSFnpr0bKvmfKQ8KPED3HRmvylz94++/QLu1xBE/SF
         csUC9C4vyjBxxpCy+41Q2KioqiILoXMwgEY9++lhtAyUVwRLNXb4DXVdteUFJgcCJgtT
         KDIuNQX6569r9pQnpzpVcANl/JIccZn6uKdLLxwu6fjH9EXtkNW0SfA7PAQ+j0XtZA6d
         ltZC7oIxmZVemgvXrAOUqZZ+nf3LKa3oQd6pFDcbkA9NgNiVYcCw1n8iP2Hgz+0w1Lju
         Tu4Tu6+RyZQXoKqWohFBnVjKkf1kuDESolp7l8b8gwe7wtVwOaZ1x6KJe2PtYNH1UtNq
         Nu5g==
X-Forwarded-Encrypted: i=1; AJvYcCUvdVYojUt5d1QxufIua2GNSRsHjV0zYxOR8Vjvj+ieOrYfnoPYVD2P3X4UDnGPzNTlyyWnJBOkhGqIf7D0WkM=@vger.kernel.org, AJvYcCVOawLO5bsIfZh/9ZaAMl0+R/F4TyQoyZYM1kF4G25CrJTMs8bTt97LQmzbQtp5DzrKJGwKz/FSQe+GT+g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx26Xrx85dGmVDMH5T3XimTqu0N8GEG8bowA7a9Ieb4n6iL4076
	hM3TRoT8/7ltHbrF4W3PD2MzPRNnGL7ZIUs6C8Q64E3Bir2fpZ4X
X-Gm-Gg: ASbGnctzY0lQrNP9QKW45Y8YISwUmAl+dGz2pQJ3qKmBt/Tgj+pKy29SnugzSoftyl1
	r0Xe4ob1aoQRkOig1XwndTiJd8Fsj3PkWEHfuk6Aa0f9Z6mQFZ+WGG8eLUnHp0mbIkbyte1nEHs
	D7macALFnUwG3CH3U8n3Wer7amqv1ZmYNDL/TiSyWqnoqg5UpHnrxqCID2sfnPIij2snglyMivv
	lyadTJm4ppiv+AKKrsaKTha0lz/sVDgqFaWxShfaHLzRRkTR3NnWKGASUZ8953e20wSYZW76JHv
	k+5ZHoJj7sUoW+U13SfgB1+eXm8Q/YyP9GAURy2Pllh8l2oordP17fUHRK6GSxAwdbvlww2vi6V
	Ynh1tUWh+CbS0y/O43K5Rd14XF35b6/M=
X-Google-Smtp-Source: AGHT+IF9aYnsP2suDMAEkPYuXKb3S/ROW0/1U/0AfLx7J0QHP6ZO2Y0WwOoyF9mMNfRZWc9UV5TyxQ==
X-Received: by 2002:ac8:57c9:0:b0:477:51c:d853 with SMTP id d75a77b69052e-47d1ffc1e60mr7524531cf.9.1745356310215;
        Tue, 22 Apr 2025 14:11:50 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-47ae9c3b2b5sm60117471cf.30.2025.04.22.14.11.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 14:11:49 -0700 (PDT)
Message-ID: <68080615.c80a0220.29b7e9.5b75@mx.google.com>
X-Google-Original-Message-ID: <aAgGEl6k0cagWLBQ@winterfell.>
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfauth.phl.internal (Postfix) with ESMTP id 136871200069;
	Tue, 22 Apr 2025 17:11:49 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Tue, 22 Apr 2025 17:11:49 -0400
X-ME-Sender: <xms:FAYIaIUl6jmUDcqWdZgjFP3VrPnI2-k0ne2mR3jJfjhfMfqYxnNZ3g>
    <xme:FAYIaMmT-TrifyF-xbk135q9Xs-lExdbNqbyfuzPHRkR8zRMTfwfYJrYWPUjU_d_G
    wrPfOGOUcFS-FTfZg>
X-ME-Received: <xmr:FAYIaMbattlly5KzD2FC7wDm3lnbhc-HJf_0ykMGvILGwabOSyGJRaEGWio>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeegjeekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddt
    vdenucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrih
    hlrdgtohhmqeenucggtffrrghtthgvrhhnpefftdeihfeigedtvdeuueffieetvedtgeej
    uefhhffgudfgfeeggfeftdeigeehvdenucffohhmrghinhepghhithhhuhgsrdgtohhmne
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
X-ME-Proxy: <xmx:FAYIaHV21KLSwsSfUZ7zVk_Q2fOfSKzZju6Btp3OXi2klnulu5EyLg>
    <xmx:FAYIaClSAx3xURh8hmCu1PTx_48NXi0vYSy_4cwLlQ3lOS3zL5MT1w>
    <xmx:FAYIaMdt7SI5eq23uQy7t0N9wdesMzpUCO6YWYIQj1BFfZZqjtrjrQ>
    <xmx:FAYIaEEZyme2V5_CWRBDhYMR68eFqqIlRNbKJtRca6SwcCBKaf9y6g>
    <xmx:FQYIaInzWXI_3UUtsJlIKsrYrUWmwF3xQdoGuspYxGzxk4rcxv6bGSox>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 22 Apr 2025 17:11:48 -0400 (EDT)
Date: Tue, 22 Apr 2025 14:11:46 -0700
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
References: <20250421221728.528089-1-benno.lossin@proton.me>
 <20250421221728.528089-7-benno.lossin@proton.me>
 <aAchUjDJsukcCgKM@Mac.home>
 <D9D0ZHG5ZKGL.30GLJKI6X8TG7@proton.me>
 <aAekPSsKnQWJSBhQ@Mac.home>
 <D9D8YDFLD98E.D8DZEIIW4EN5@proton.me>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <D9D8YDFLD98E.D8DZEIIW4EN5@proton.me>

On Tue, Apr 22, 2025 at 02:45:22PM +0000, Benno Lossin wrote:
> On Tue Apr 22, 2025 at 4:14 PM CEST, Boqun Feng wrote:
> > On Tue, Apr 22, 2025 at 08:30:40AM +0000, Benno Lossin wrote:
> >> On Tue Apr 22, 2025 at 6:55 AM CEST, Boqun Feng wrote:
> >> > On Mon, Apr 21, 2025 at 10:18:33PM +0000, Benno Lossin wrote:
> >> >> Add support for parsing `pub`, `pub(crate)` and `pub(super)` to the
> >> >> derive macro `Zeroable`.
> >> >> 
> >> >> Link: https://github.com/Rust-for-Linux/pin-init/pull/42/commits/e8311e52ca57273e7ed6d099144384971677a0ba
> >> >> Signed-off-by: Benno Lossin <benno.lossin@proton.me>
> >> >
> >> > Kindly request tests/examples for this patch and the following one
> >> > (patch #7) ;-)
> >> 
> >> If you send a patch, I'll take it :)
> >> 
> >
> > First, I'm happy to help improve pin-init, *if* I fully understand the
> > changes and have the cycle ;-)
> >
> > However, here we are at the review process, so I need these examples to
> > close the gaps between the implementation and the usage to provide any
> > meaningful review. There's no example/test in the commit log, the kernel
> > code and (I've checked) the GitHub repo. Although I fully trust you, but
> > there is no second source that could help me verify the changes easily.
> 
> Maybe this is just a case of me being too familiar with the code, but
> the change in this commit and #7 are very trivial. I'm not too sure what
> I should use as an example because of this. I could do something like:
> 
>     #[derive(Zeroable)]
>     pub struct Foo {
>         pub a: usize,
>         b: u64,
>     }
> 
>     #[derive(Zeroable)]
>     pub union Bar {
>         pub a: u64,
>         pub b: i64,
>     }
> 
> But I don't see a lot of value in adding those either as doc-tests or as
> examples. Rust users normally expect that derive macros can handle any

Since there is no user using them so far, I think these examples can
serve as regression tests, that is, if someone accidentally breaks
something to make them not working, we will immediately know.

> kind of visibility for fields (there are exceptions of course, but they
> don't apply to `Zeroable`).
> 
> The union case is a bit different in that not all derive macros support
> them, so I agree that the docs should reflect that better. I can add a
> patch when I find the time, as I'm stretched pretty thin (hence I
> suggested you submit a patch :)
> 

Maybe you can open issues and see if others could help?

> > In this case, it may be special, because you're in fact syncing an
> > external repo with the kernel part, i.e. the development is done, so if
> > we trust the external repo and of course, if no obvious error is
> > founded during review (from the people who can review), we should merge
> > it in. If that's the case, this patchset is more of an "FYI" instead of
> > a development process IMO. Is this the case here?
> 
> I'm not 100% sure on the workflow for pin-init. Ideally all changes made
> to the pin-init repo can be ported 1:1 into the kernel. There are of
> course smaller things such as commit references in commit messages that
> need to be adjusted. But aside from such smaller administrative things,
> the idea with the sync was to only have one singular version. If you

I think this is fine and matches my previous understanding. I just
wanted to be clear that normally if an example/test is requested for a
patch from a reviewer, the usual response is not "hey, why don't you
contribute one?" Of course the request has to been reasonble. In other
words, we are doing a special workflow here.

> want to spend the time looking at the pin-init PRs then feel free to do
> so :)
> 
> Since I port the history from the repo and not do one single commit with
> "sync with version v... of pin-init", I do think that kernel review can
> indeed change things in the upstream repository, but I'm not sure by
> which means it should do so. I want to avoid to rewrite history
> upstream, so there it has to be a new patch.
> 

A new patch seems good to me.

Regards,
Boqun

> ---
> Cheers,
> Benno
> 
> 
