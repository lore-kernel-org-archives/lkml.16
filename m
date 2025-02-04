Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28DC913AA20;
	Tue,  4 Feb 2025 14:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738680459; cv=none; b=pVwsXjZebRbap9bUgNPomgvyr2hTIhmFX2+12zCZnCd+zGTH3lbk8r3gfz4wFXx+eae0OXFnRMF1py0FLBGCwWS0kBV7LAv3AWmjCgbB+LUjo9TZlZfIF09xrE6Gbq4FA/I0CniAgv9RBQB6XJnMskW/WEtNxuJsffRpUUcbAWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738680459; c=relaxed/simple;
	bh=VWE7rYiS1H09bpLtw4nxJsxCXrvC2b05homXc0eVsOU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iSoYLSyMt8Ig5yN0eF7GmH6ClI+T2c26XB3VZCcBdJP1SH1/vqSTaNEnedhVgHFINykhg1sNeFJS3tS770iOtrNYMmZ067taNHLkS9FjG7681Kd8XBuzEXnuLz0/JmZHBZY+yAjbSnKhtYb2OGlwPciOGudJJRwO8aPnjyWrDxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SlphlIOE; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SlphlIOE"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6dd1962a75bso43965986d6.3;
        Tue, 04 Feb 2025 06:47:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738680457; x=1739285257; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ClBeI/UpQwbjzinpxgVI81L53zhkDK+0fCWLCZc+ZLk=;
        b=SlphlIOEFU035yoT5NcowYdOhW1p1xof5bEKVBWcQzeJMi2J666Gpb7wANZo369yXD
         DQd2kyjLpWtLRrGWQUsMfzKKrKgkyqzLKdypYZMtToL6R6hyK8kqbrJjrumOvPGGBIr+
         rMul/Ev6lqQgeBbuPmpx1V2NLasm4zAoF/70vxpksVoR8q5lg8u37+CvllOB2SggxcWF
         srGmZ5Who69nAKbioesTrKh3WISThrAv8clJKf/4YgblPALc/3etxT3+vJhJIyjGsJ08
         zsLXAEVVh75SCrBONieA0q2F1nR/0vbAcZq+pixmZuMdwcFdwAeu1cmpp4Xi8VG6kh+R
         InZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738680457; x=1739285257;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ClBeI/UpQwbjzinpxgVI81L53zhkDK+0fCWLCZc+ZLk=;
        b=iOKG+EfR3qKPv5Dr/55vZn7u4wCXkNx7a8gJQ9IamCzSnV5dOrLGqVOGeDNAr+V6uq
         33HIi347iPEMAM/bSpV6EDN6ReuJnfmhV7JTvbK5maEazy1dpPdTvUBbhZYnxO8ayEtR
         T9d+3efMkHt/OMKgF3pjVlCIJMoukAq5dq7N3WWgkB91yEiJwrrJybjsE3PfYon0+8xu
         3TKfTtlp36JaKfi05XoLzD0bJt8baS/U5/X8mKl2XsGJrYt7ZW/572L9ChMHriW0h1GL
         DhTRIB9vBn8jJYDFtowuhaJpI9RiBW76nQVp0KxdiUdkJBU2NY8HVVEW6NFU0vvZasqT
         PuBA==
X-Forwarded-Encrypted: i=1; AJvYcCVGbDfsMGnaks9rlXHED1nU4l1W1Pdf62iDbGMoP6Fawep6et616yYvkyLQS1WpPqslgCFF8oxv8DZMaWw=@vger.kernel.org, AJvYcCXZhbhHJUb85l8F+0AFuP15zRKHSjfDQrWQhfovUpL/nMjzsUfvE1oK5hAitGzxOd2rtyd74KhkdWicoKj4gYM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9Hm7EbIBHA0UM51itqTBhbCO8dy9Z0gqDiOnU/bbBbM8m+UkN
	QDghjYS1+aMlS4Nh76hSWhcnEw29BAn6SpFBPpgLV1aook+o0psJ
X-Gm-Gg: ASbGnctD8QFZVP3cPKInbuv/i2Dp2lTMJOwGqhPTCzzXlfBmQVBOQ4mc5IZ7iKcQRH4
	9LrcvoX3pHQA9vZXK7nsjrRN6g6QbCtHjV6ix2XRelPjRguMXuwuG2IV+e8PB7QHNLrXGusvQnQ
	yWlbUGD9dBBTf1dsLPwYzRnfp6jwTsImlqrtfdaAvycHbBvCSIWbMM16DlFHZruiXZWwmxmX2Y7
	WFhDET4KJASjS+P5eZe8mt0Sz+uG7wIBQwggiYcWjCKpjXffCiHYr75nCaYViP6vp717HegKeK8
	K5QhoiTGBOL1AANV8wdrIbF55imFZhD/uFIx2K+RCY6GYFtarm39XBHpVITaaZXTtUJvRpkXu76
	BqhY9jw==
X-Google-Smtp-Source: AGHT+IGw2/GHQEvQ/LM3LAhpdh7BKctHnFItfqxE9BlbTD4YrC3GxsUswJyWgyvI5jKUoE2TuJsgEw==
X-Received: by 2002:a05:6214:62e:b0:6d8:850a:4d69 with SMTP id 6a1803df08f44-6e243bf360cmr330398186d6.1.1738680456806;
        Tue, 04 Feb 2025 06:47:36 -0800 (PST)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e2547f2c78sm62678596d6.6.2025.02.04.06.47.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 06:47:36 -0800 (PST)
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfauth.phl.internal (Postfix) with ESMTP id 5B2D81200043;
	Tue,  4 Feb 2025 09:47:35 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Tue, 04 Feb 2025 09:47:35 -0500
X-ME-Sender: <xms:hyiiZ9bGV0Kqdiw3U0Zb5vt3EZAKFzyN2NpoBbzuGidIN6LN9vCozg>
    <xme:hyiiZ0YJQkXiu1dvFMEnJKMjWSBEf1xu8QtJQaoKPKSd3suKQl1j1xRFqA_mp7dtt
    mevHEjDBaEHS5Xuyw>
X-ME-Received: <xmr:hyiiZ_8uWwljP3hTcDUeKiZIJCGHmAwUoNzE1krY0X58RJej66rhhcK-bQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdektdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddv
    necuhfhrohhmpeeuohhquhhnucfhvghnghcuoegsohhquhhnrdhfvghnghesghhmrghilh
    drtghomheqnecuggftrfgrthhtvghrnhepiedtueffgeeitedvudeuveeiveduudeitdei
    vefgvefhhfekheduudekhfekfeegnecuffhomhgrihhnpeguohgtshdrrhhsnecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghoqhhunhdomhgv
    shhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedtieegqddujeejkeehhe
    ehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfhhigihmvgdrnhgrmhgv
    pdhnsggprhgtphhtthhopedugedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprg
    hlihgtvghrhihhlhesghhoohhglhgvrdgtohhmpdhrtghpthhtohepohhjvggurgeskhgv
    rhhnvghlrdhorhhgpdhrtghpthhtohepghgrrhihsehgrghrhihguhhordhnvghtpdhrtg
    hpthhtohepsghjohhrnhefpghghhesphhrohhtohhnmhgrihhlrdgtohhmpdhrtghpthht
    ohepsggvnhhnohdrlhhoshhsihhnsehprhhothhonhdrmhgvpdhrtghpthhtoheprgdrhh
    hinhgusghorhhgsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehtmhhgrhhoshhssehu
    mhhitghhrdgvughupdhrtghpthhtohepphgvthgvrhiisehinhhfrhgruggvrggurdhorh
    hgpdhrtghpthhtohepmhhinhhgohesrhgvughhrghtrdgtohhm
X-ME-Proxy: <xmx:hyiiZ7qIA6JuebY-wnPCDbaXzUYFwDOWbFfVeSIONGNT5DO3w9JOHA>
    <xmx:hyiiZ4oXFLyz_d094FYQ0IpCDRtFREP2mBDHcwoQ0iVJ9HhiUHeJQg>
    <xmx:hyiiZxSe0gF8K-xM_jyBN8gz989f3cOf_JDQkO5svJS5CYXtt4AR0A>
    <xmx:hyiiZwrYwIXWVI68EHmhPM2XnMDqhxahxDxCRwJefe5l0Do6O4o1EA>
    <xmx:hyiiZx7FHROtzGP_ivpsRsXFBTJ-DPzWM2J8Fyd6U9D_q_FAr33aHzcP>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 4 Feb 2025 09:47:34 -0500 (EST)
Date: Tue, 4 Feb 2025 06:47:33 -0800
From: Boqun Feng <boqun.feng@gmail.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: sync: add accessor for the lock behind a given
 guard
Message-ID: <Z6IohVx6DEV4a6cK@Mac.home>
References: <20250130-guard-get-lock-v1-1-8ed87899920a@google.com>
 <Z5ubrUcSuaTtj_wW@tardis.local>
 <CAH5fLgiTG8nNRdb2=3PdZN=2Bg=KLGy4hvrae+E0jcOeCTBpjw@mail.gmail.com>
 <Z5uzbW2j9fUBt-3H@boqun-archlinux>
 <CAH5fLggDna0E9MtarHDxoS=w3zp-2HipASOLGfYFzTg8fxUu2A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAH5fLggDna0E9MtarHDxoS=w3zp-2HipASOLGfYFzTg8fxUu2A@mail.gmail.com>

On Tue, Feb 04, 2025 at 02:39:33PM +0100, Alice Ryhl wrote:
[...]
> > > > How about we name this as `lock_ref()` or something else, because
> > > > `lock()` itself is already used by `Lock` for the lock *operation*, and
> > > > this is just an accessor, I would like we don't confuse code readers
> > > > when they see code like "let b = a.lock()".
> > >
> > > The usual name for this operation in userspace is "mutex".
> > > https://docs.rs/lock_api/0.4.12/lock_api/struct.MutexGuard.html#method.mutex
> > >
> > > But since our code is generic over many lock types, I went for "lock".
> > > But I guess it could make sense to rename it.
> > >
> >
> > Got it. The good thing about the naming of lock_api is that the name
> > "mutex" is not used for other purpose, while "lock" is a bit different.
> >
> > > > Moreover, if the only usage
> > > > of this is for asserting the right lock, maybe we can instead add an:
> > > >
> > > >     pub fn assert_lock_associated(&self, lock_ptr: *const Lock<T, B>)
> > >
> > > I guess, though there is precedent for having a method that gets the
> > > underlying lock, so I think it makes sense. If we had an assertion, it
> >
> > I don't disagree, but I just feel we should be careful about introducing
> > two "lock()" that one is an operation and the other is an accessor.
> >
> > > would probably take an &Lock<T,B>.
> > >
> >
> > How about:
> >
> >     impl<T, B: Backend> Lock<T, B> {
> >         pub fn assert_held_then<O>(
> >             &self, proof: &Guard<'_, T, B>, f: FnOnce() -> O
> >         ) -> O {
> >             <assert `proof` is associated with `&self`>
> >             f()
> >         }
> >     }
> >
> > In this way, not only we can assert the correct lock is held, but we can
> > also guarantee `f()` is called with the lock held. Thoughts?
> 
> I need mutable access to the guard during the function, though? I
> don't think a closure is helpful in this case.
> 
> How about I rename to `lock_ref()` instead?
> 

That would work for me, thanks!

Regards,
Boqun

> Alice
