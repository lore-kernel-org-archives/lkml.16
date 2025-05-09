Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56131221DA8;
	Fri,  9 May 2025 07:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746775161; cv=none; b=FQlErtkM8AqfB6fqXFORU4peX9TkWvUcZ0rA1PrnNJPlXj6txHsvwpNIIOZvwpjBEAbNdIO4gwAgsQbubfKX/5Ndhd//eMYHT9ocgkQUBHnwR5tfbIU33T5jRdNYSvmB9CywnShizW5ZE76cle8GIMWmFToUJpCPmGD06F/vcJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746775161; c=relaxed/simple;
	bh=C6mDpnaR/sLALalCTG2F9+y2wyLmIawx/3g6JvyML/4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DTYra9qBkpYS3wkzZe2dM4DWF/QA42OheHztwOd6Q0nYCm6GYlChuqB2pp0LAtElJMQ96QGvroWx7PIkYfFfaBfRszZrgs1/Hrz28luyqRAz4XMj6Wn1G7x8jUc2R8kdltKzj8aH3jTaH7KhuiYndWwKFBmGvK8BS/oLLkRoqLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IQi5V33a; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IQi5V33a"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7c5675dec99so205525985a.0;
        Fri, 09 May 2025 00:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746775157; x=1747379957; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BEEF2dYVp6IYEOXVj/odIE//ILxHazbUNnumfhkoOBk=;
        b=IQi5V33ab6+Z8lud7U++Rbms+p6p8zhtqunYjCjFBOrvqGvSs1Fk+dcaP3ZyG05yTK
         ch32V29XotjWjvJZM1gSKPae3Jv9W3Jrk1NvJ9fK9ZLxmrMuhB/YzsbhvKUF711gvpXc
         wf1jEkqxPhWMuU9I3ONFhEUTi9NXgg8j75CaJEU7/kw0pYq2zWtimL/g3LddCwvtVM7Q
         aoBbnhwmroqkfYDqjG4MCq73fpYkQ+1s3wT7NvtVB94v6QJRTLP6OTXak5VMh80V7/Iy
         W9+25lIuaSb+cgtbd7Tz0JnKs2G3r9B+/6vtn6ZYSQeC7mEyMfIShPAL+hPd9BdcHBCw
         Dc8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746775157; x=1747379957;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BEEF2dYVp6IYEOXVj/odIE//ILxHazbUNnumfhkoOBk=;
        b=GhVFfdwFeneBM3EptXXGFn4XE2ukdLJEUCwjllGxEv0G5X5AUBpsakfzGrZjLFz2y/
         gH0MZ4tqvsTU68WqE0EPmkt4Y0VDSicPgkodNb9l5/uPIIDvBfiDBbL5i1lMMZQhMuXR
         jCNGLR27mKDluRUShYqAIXkr2g5t6ITYQDTlHJ4WF96cNQXvIOnnW6DONfeddqMNqnl1
         NclElyTWa5Y2YVHEbvnSa39cmfz/u9mkYvnPrSydeCX0YjPOMG7CpR3hFE7VvNgQc7oq
         Aj3JTyizC5U07upPm8u+AVCkqSuFReQf0YqOE4Kvux51B6ZPCLICxI/g0y70urMu5zjl
         rrdQ==
X-Forwarded-Encrypted: i=1; AJvYcCVjL7e0na0nIXGl5zwT5hvpeBigeSPp0Lk0ia11bbjK/N6eMgJDRGNGVAu6GYHwtf/njfJwVOK4d1Az2Xqgj80=@vger.kernel.org, AJvYcCXrO2mPRi2F5irUmYLCXoQdpNMdX4wTIkUj37u9c484taZwGYCz/oIuZ0pMMtMeGz0hPuE2eY/t194wjok=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8Y/MWX7QxvW5+NlrbAScgZm8E3CUHyNmsPGlLg8BdgmQKC38J
	DKiR31btJDxMGUMH1+v1BdmyKyeSLWEOiWWkSkNYrR3IolPQtYHuXeQq1g==
X-Gm-Gg: ASbGncs5PBl89Nr23gpGWfI/t6Y+s5e4ASk2Qp3B/QGd30FLfAMEafEcFzXqXA3lSAh
	Amv3cQMbNiYM1Vj9jkkWXLpK6YozMJsR4/UiUfHfaKdou6yviwM19LAwIO/rAoxz36PQjjR495C
	QRKnrdhpWOlS8aO4tFHt7A113+a+mkf470SjiKRtosJk2z9kP/viYI9MaovRbcfYaIc12lYwmj9
	S9ZCmiW56De0U/EFAzAKyNEv5zi8UVPizihAYG+bt4u/i7WYTlobMbQyCdFqazxt07Ad/7RLUZc
	fFXwW/BG1SBmjN1OKngWYY6c+zA7O/beI0jLNASgLPBGTL9rMRe0wOEg6KT3YBpFUcST3DlGhWJ
	gcvb8fq6B1rnW4p050WuyZrleGaU6qXfgRJ9KE9nMtA==
X-Google-Smtp-Source: AGHT+IEQBSAtFEWvAn9Bu40xDuzcDonSeIINvn0y/cqVzlkWN3FFvQBHNwBFRhRGFbv1EbjbEgFfkA==
X-Received: by 2002:ad4:5d63:0:b0:6f4:c84d:d1bd with SMTP id 6a1803df08f44-6f6e47c26d5mr30915456d6.6.1746775146435;
        Fri, 09 May 2025 00:19:06 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f6e39f4689sm10206106d6.28.2025.05.09.00.19.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 00:19:05 -0700 (PDT)
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfauth.phl.internal (Postfix) with ESMTP id DA8951200043;
	Fri,  9 May 2025 03:19:04 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Fri, 09 May 2025 03:19:04 -0400
X-ME-Sender: <xms:aKwdaI5lZ9hV0-9tZpnnbxIxjauNJzaXlt_NKbMgfCjHL7-CDbuEtw>
    <xme:aKwdaJ7tIRSgnEzFi-XWsPY8vKU3rwxGuhwLxTtKGCOVKcz6yOm7OK2pTMDpKPaG4
    KSx-YW6HDGvtcFCEQ>
X-ME-Received: <xmr:aKwdaHd49hZf2sKtMAhlGZVsiIwGj4XzGitDhZrShIvMTDw_ExlcsV1m>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvledvtddtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddt
    vdenucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrih
    hlrdgtohhmqeenucggtffrrghtthgvrhhnpeejvedtheejueffheevgeeitdehudevgffg
    gedvieetveetfffftdfgieekledvgfenucffohhmrghinhepghhithhhuhgsrdgtohhmpd
    hkvghrnhgvlhdrohhrghdprhhushhtqdhlrghnghdrohhrghenucevlhhushhtvghrufhi
    iigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruh
    hthhhpvghrshhonhgrlhhithihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsohhq
    uhhnrdhfvghngheppehgmhgrihhlrdgtohhmsehfihigmhgvrdhnrghmvgdpnhgspghrtg
    hpthhtohepfeejpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehmihhnghhosehk
    vghrnhgvlhdrohhrghdprhgtphhtthhopehpvghtvghriiesihhnfhhrrgguvggrugdroh
    hrghdprhgtphhtthhopehmihhnghhosehrvgguhhgrthdrtghomhdprhgtphhtthhopehj
    uhhrihdrlhgvlhhlihesrhgvughhrghtrdgtohhmpdhrtghpthhtohepvhhinhgtvghnth
    drghhuihhtthhotheslhhinhgrrhhordhorhhgpdhrtghpthhtohepughivghtmhgrrhdr
    vghgghgvmhgrnhhnsegrrhhmrdgtohhmpdhrtghpthhtoheprhhoshhtvgguthesghhooh
    gumhhishdrohhrghdprhgtphhtthhopegsshgvghgrlhhlsehgohhoghhlvgdrtghomhdp
    rhgtphhtthhopehmghhorhhmrghnsehsuhhsvgdruggv
X-ME-Proxy: <xmx:aKwdaNKgw7ujogb7O0063iug6O7bmEZeOmjelf5Ro3z6SFWiX4uYSA>
    <xmx:aKwdaMLpo06aE_bsv7qG_y_-Cxg1dUwLcfsEkxPJfy4yq-mYicBXvw>
    <xmx:aKwdaOxvjfvWrC7ssLNh0zVkObWAxSGHrsraS_ABZWmNz1xR5LM6qA>
    <xmx:aKwdaAJB9HXCDtbShdI5XBnOrt7DYHuKvNWcnDo35S8Y2X7NWuDffg>
    <xmx:aKwdaLZG8F17TvUA6OQHZXxCF-GTgDe5twZyX9x-gu3bbZXRRq75JxQP>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 9 May 2025 03:19:04 -0400 (EDT)
Date: Fri, 9 May 2025 00:19:03 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Ingo Molnar <mingo@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,	Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>,	Valentin Schneider <vschneid@redhat.com>,
	Miguel Ojeda <ojeda@kernel.org>,	Alex Gaynor <alex.gaynor@gmail.com>,
 Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,	Justin Stitt <justinstitt@google.com>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
	Tamir Duberstein <tamird@gmail.com>,	Kunwu Chan <kunwu.chan@hotmail.com>,
	Mitchell Levy <levymitchell0@gmail.com>,
	Martin Rodriguez Reboredo <yakoyoku@gmail.com>,
	Borys Tyran <borys.tyran@protonmail.com>,
	Christian Brauner <brauner@kernel.org>,
	Panagiotis Foliadis <pfoliadis@posteo.net>,	linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org,	llvm@lists.linux.dev,
 Daniel Almeida <daniel.almeida@collabora.com>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH 4/5] sched/core: Add __might_sleep_precision()
Message-ID: <aB2sZ60WI5thp6ve@Mac.home>
References: <20250506045843.51258-1-boqun.feng@gmail.com>
 <20250506045843.51258-5-boqun.feng@gmail.com>
 <aB2aAEELa3253nBh@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aB2aAEELa3253nBh@gmail.com>

On Fri, May 09, 2025 at 08:00:32AM +0200, Ingo Molnar wrote:
> 
> * Boqun Feng <boqun.feng@gmail.com> wrote:
> 
> > From: FUJITA Tomonori <fujita.tomonori@gmail.com>
> > 
> > Add __might_sleep_precision(), Rust friendly version of
> > __might_sleep(), which takes a pointer to a string with the length
> > instead of a null-terminated string.
> > 
> > Rust's core::panic::Location::file(), which gives the file name of a
> > caller, doesn't provide a null-terminated
> > string. __might_sleep_precision() uses a precision specifier in the
> > printk format, which specifies the length of a string; a string
> > doesn't need to be a null-terminated.
> > 
> > Modify __might_sleep() to call __might_sleep_precision() but the
> > impact should be negligible. When printing the error (sleeping
> > function called from invalid context), the precision string format is
> > used instead of the simple string format; the precision specifies the
> > the maximum length of the displayed string.
> > 
> > Note that Location::file() providing a null-terminated string for
> > better C interoperability is under discussion [1].
> > 
> > [1]: https://github.com/rust-lang/libs-team/issues/466
> > 
> > Tested-by: Daniel Almeida <daniel.almeida@collabora.com>
> > Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> > Co-developed-by: Boqun Feng <boqun.feng@gmail.com>
> > Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
> > Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> > Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
> > Link: https://lore.kernel.org/r/20250410225623.152616-2-fujita.tomonori@gmail.com
> > ---
> >  include/linux/kernel.h |  2 ++
> >  kernel/sched/core.c    | 62 ++++++++++++++++++++++++++++--------------
> >  2 files changed, 43 insertions(+), 21 deletions(-)
> > 
> > diff --git a/include/linux/kernel.h b/include/linux/kernel.h
> > index be2e8c0a187e..086ee1dc447e 100644
> > --- a/include/linux/kernel.h
> > +++ b/include/linux/kernel.h
> > @@ -87,6 +87,7 @@ extern int dynamic_might_resched(void);
> >  #ifdef CONFIG_DEBUG_ATOMIC_SLEEP
> >  extern void __might_resched(const char *file, int line, unsigned int offsets);
> >  extern void __might_sleep(const char *file, int line);
> > +extern void __might_sleep_precision(const char *file, int len, int line);
> 
> Ugh.
> 
> Firstly, '_precision' is really ambiguous in this context and suggests 
> 'precise sleep' or something like that, which this is not about at all. 
> So the naming here is all sorts of bad already.
> 

I accept this is not a good naming.

> But more importantly, this is really a Rust problem. Does Rust really 
> have no NUL-terminated strings? It should hide them in shame and 

You can create NUL-terminated strings in Rust of course, but in this
case, because we want to use the "#[trace_caller]" attribute [1], which
allows might_sleep() in Rust to be defined as a function, and can use
Location::caller() to get the caller file and line number information,
and `Location` type yet doesn't return a Nul-terminated string literal,
so we have to work this around.

> construct proper, robust strings, instead of spreading this disease to 
> the rest of the kernel, IMHO ...
> 
> Rust is supposed to be about increased security, right? How does extra, 
> nonsensical complexity for simple concepts such as strings achieve 
> that? If the Rust runtime wants to hook into debug facilities of the 
> Linux kernel then I have bad news: almost all strings used by kernel 
> debugging facilities are NUL-terminated.

This is more of a special case because `Location` is used (i.e. file
name is the string literal). For things like user-defined string, we use
the macro c_str!(), which generates NUL-terminated strings. For example,
lockdep class names.

> 
> So I really don't like this patch. Is there no other way to do this?
> 

There's a `c_str` [2] macro which could generates a NUL-terminated
string, but using that will requires might_sleep() defined as a macro as
well. Given that might_sleep() is the user interface that most users
will use, and how it handles string literal for file names is an
implementation detail, so I figured it's better we resolve in the
current way.

[1]: https://rustc-dev-guide.rust-lang.org/backend/implicit-caller-location.html
[2]: https://rust.docs.kernel.org/kernel/macro.c_str.html

Regards,
Boqun

> Thanks,
> 
> 	Ingo
