Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FFD11A7046;
	Thu, 30 Jan 2025 17:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738257312; cv=none; b=tjW4PFzLv4rXI0iN9INslbkxjVngUMRn2eIkxcC7KcRZHt7wKcwsDHp/ayE0EOprpP7wFSLAzgiZNkhkX1dZ39GCTkDqq3Hd9tyRP5dkP6qnfhMkiv6vA9T9IQ85o4b2ajyjMep5ATk5MZjgMVNU3LWuvur+BiV6leSGtnkYASI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738257312; c=relaxed/simple;
	bh=UXjNB0UMPnnjT5uO3pgSHKSY6/GKAEciBOD/W4D8ESk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Uhv3yX4WsC5wsZCOldp4BxS0ug2zRlPpi3W8VSIVi4+5WFhBNO1nPioBOwpFBCV5T0NwFau+AJfCdnfr4Piu9tfKtRcFiJK8u0pjOJwaY8L335Sfsp8WzjI7fEVN8kwMPjMaYXB/WQsxKVeKXySIcWvkkPiLCgyJHt5Q1+kOyto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZiwAn9wf; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZiwAn9wf"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7be44a90468so128471585a.3;
        Thu, 30 Jan 2025 09:15:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738257310; x=1738862110; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:from:to:cc:subject:date:message-id:reply-to;
        bh=hbuEK2fPae0ZQnZLb0Yz+s8H8/0oyUXFKhbZq4VQ6CM=;
        b=ZiwAn9wf6a4VliWWjQrAY5Maote4j0r9sviolodh4kbdGdfl+tmTsL27KmmR8V/utA
         qusZydu8MiVaSEWZRA4oHDlfmUSP75Hr4wa67CRzMlEgsEcleDeQUsquhNS1TsM8y7kf
         Sdo53OOjG0WAivVsVw6h2Kvfx0gNGman7BRsTej2ZCuEFI8fPD7oK89O+s5UwPICEDo1
         occKeb1ZIYvg3aMsCvj85MH8wWyIekuPVWm9NCeGJnFVodct8VffMvqMMO4bm5l23+Ty
         MOmrnJF9jrt0QJgrM2PzWgHg0gG054qeVOIbcnFzqx4sZ41sKkR34d28zminOVPNtQTB
         6LPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738257310; x=1738862110;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hbuEK2fPae0ZQnZLb0Yz+s8H8/0oyUXFKhbZq4VQ6CM=;
        b=gkvZztqQGewYQj5ur6DE3ZUPnnzGMm25sQlS2gG2ROF4L9egYXxVOEz5/lZK0ma1Mx
         K+a4413k8G3XOoWGaFhVQyl0mY30XA4Tz05qhUXURIv1bznM5Ib0ujYgnN7AHdmiVROk
         2GumBAKYprfkLKcCn3EsxKPUv/f0zVU/Q452QwctByy1nEWz2gcKVPnpIT5lXSHw3KY6
         +BGk0elyy1mH5hEkhoQUGokn6OxuZmd7QAoGTxnhlHJtEESYN1ib7XITfzwPIa6Nr6Uv
         ivXH93gqpm2qtBNzkpo8OoA+mMfBvubAstDchCT+z6R0T/ZgwXkGDY+lrkJUq7la7VOJ
         GMLQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGz6YcOdsd8BTu639AkwXGUePXGpiX9FC0Pcx1cRqzanRKtWdbj0wCC6pMjNmpdYg/8usBX7eBCY+dSBkl/5A=@vger.kernel.org, AJvYcCVsAMie+wsJ8oX1tdzaw9wR+/5rUtfe1tAMyWQbMDRii0wes5gIf8EzLQs1FycHHOs7lFEIQ5Va3fBhH9Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/FgVBwh7ZrbHXpBBbJ/KnPMw0WxbP+cPDREtc4m87L08n7EQr
	QNG9wAerfzME1dslJznbM1GFAK2zd1yc7+eqfbd9GzM4E4NEJiUY
X-Gm-Gg: ASbGncs5LcS84wbfq21DQ7TiT0G29bN09Ma/a1oKTEk4PAUR6GtTiiSUJAKrCjtva6F
	zp2jLFLMO710kTgCUCcSqdL6insK4r2SLdDQB3RrZL7TD22QH8gW6dQxQ+6PZczB3E96FDMP61p
	mK8gj9EBuuuIEoqxrKPtsZyaeTXjvYEdnwkDDDw8YJWUmmFdKT2cqWurDl/OaBeXdCgUvJRbq0S
	lJdAYK9B4RUmwHfifOFSIMEriGyOLbKfxUGENOMB+j/K5399dCEkRASdui1rK9OaoKVJ4vv350v
	aO6jnxILfc2IqLYBXooMOr9C7BO5zp1Hbx6sJyieXMoYI36oATnbVHDNAUBMWtYFBUC8rfr4N2D
	kgcHVAg==
X-Google-Smtp-Source: AGHT+IE9kKwFRBHbh9oKRjwrEd006Fopov34115FoI0DAwBXL2ejkngc1wGWIcDrrmcAuev45KpPww==
X-Received: by 2002:a05:620a:2723:b0:7bc:df55:2cd0 with SMTP id af79cd13be357-7bffcda869fmr1411012685a.48.1738257309890;
        Thu, 30 Jan 2025 09:15:09 -0800 (PST)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c00a8bba5esm93312885a.4.2025.01.30.09.15.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 09:15:09 -0800 (PST)
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id E93101200071;
	Thu, 30 Jan 2025 12:15:08 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Thu, 30 Jan 2025 12:15:08 -0500
X-ME-Sender: <xms:nLObZ05q202eEIU7zOMIH5ACZhBYnLbORvsd1nGacMSJlfCEz26WQA>
    <xme:nLObZ15zzDMO09HWwsmG--V7NlcP5qrF7mQIvYmwwzwSov-276sJ2kip3SSNXMDZd
    kBkoUb9TuQXfY2PXg>
X-ME-Received: <xmr:nLObZzfru5ORUAkUA0Nd3eTk7sIF3EICaHRdz4p6m3krv1K2XbXek0aPYhA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeigedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdej
    necuhfhrohhmpeeuohhquhhnucfhvghnghcuoegsohhquhhnrdhfvghnghesghhmrghilh
    drtghomheqnecuggftrfgrthhtvghrnhepkeekiefhgeetvdeugeehueeikeeivdffkedu
    geegjeevvdefkeetffetuddvgfehnecuffhomhgrihhnpeguohgtshdrrhhsnecuvehluh
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
X-ME-Proxy: <xmx:nLObZ5L87YnTBK3v3aSAESEf_HWcQo9IFV1hcU-uhxFnLnYlj3k6Yw>
    <xmx:nLObZ4J6Gzr8eAS6S7wyGVZT5wyoz7rDBNiLbaN8vM2pAGibp7iGgg>
    <xmx:nLObZ6yRgpr2kCacjELt2ioLVGo6o5tmkaFTVxC5qtTbaVsu-JvPNg>
    <xmx:nLObZ8Ifpv2YukxzeGNqhcEdlmKN7UYqGAiWJ8KbNCcIxAiw5mRitA>
    <xmx:nLObZ3aezMsZ76GsfMd22XarDMK_QtNcyB15RI5bE7tbvcl8aqGyNNQf>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 30 Jan 2025 12:15:08 -0500 (EST)
Date: Thu, 30 Jan 2025 09:14:21 -0800
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
Message-ID: <Z5uzbW2j9fUBt-3H@boqun-archlinux>
References: <20250130-guard-get-lock-v1-1-8ed87899920a@google.com>
 <Z5ubrUcSuaTtj_wW@tardis.local>
 <CAH5fLgiTG8nNRdb2=3PdZN=2Bg=KLGy4hvrae+E0jcOeCTBpjw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAH5fLgiTG8nNRdb2=3PdZN=2Bg=KLGy4hvrae+E0jcOeCTBpjw@mail.gmail.com>

On Thu, Jan 30, 2025 at 04:43:22PM +0100, Alice Ryhl wrote:
> On Thu, Jan 30, 2025 at 4:33 PM Boqun Feng <boqun.feng@gmail.com> wrote:
> >
> > Hi Alice,
> >
> > The patch looks reasonable to me, however...
> >
> > On Thu, Jan 30, 2025 at 11:39:32AM +0000, Alice Ryhl wrote:
> > > Binder has some methods where the caller provides a lock guard, and
> > > Binder needs to be able to assert that the guard is associated with the
> > > right lock. To enable this, add an accessor to obtain a reference to the
> > > underlying lock that you can pass to `ptr::eq`.
> > >
> >
> > ... could you provide more details on this usage, for example, why do
> > you need the assertion, is it for debug purposes? Does the current C
> > code have the same or similar logic? Besides...
> 
> I added the assertion because it makes the SAFETY comment on a call to
> kernel::list::List::remove simpler. The C driver does not have the
> assertion.
> 

Ok. Make sense.

> > > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> > > ---
> > >  rust/kernel/sync/lock.rs | 7 ++++++-
> > >  1 file changed, 6 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/rust/kernel/sync/lock.rs b/rust/kernel/sync/lock.rs
> > > index 41dcddac69e2..681d67275b49 100644
> > > --- a/rust/kernel/sync/lock.rs
> > > +++ b/rust/kernel/sync/lock.rs
> > > @@ -169,7 +169,12 @@ pub struct Guard<'a, T: ?Sized, B: Backend> {
> > >  // SAFETY: `Guard` is sync when the data protected by the lock is also sync.
> > >  unsafe impl<T: Sync + ?Sized, B: Backend> Sync for Guard<'_, T, B> {}
> > >
> > > -impl<T: ?Sized, B: Backend> Guard<'_, T, B> {
> > > +impl<'a, T: ?Sized, B: Backend> Guard<'a, T, B> {
> > > +    /// Returns the lock that this guard originates from.
> > > +    pub fn lock(&self) -> &'a Lock<T, B> {
> >
> > How about we name this as `lock_ref()` or something else, because
> > `lock()` itself is already used by `Lock` for the lock *operation*, and
> > this is just an accessor, I would like we don't confuse code readers
> > when they see code like "let b = a.lock()".
> 
> The usual name for this operation in userspace is "mutex".
> https://docs.rs/lock_api/0.4.12/lock_api/struct.MutexGuard.html#method.mutex
> 
> But since our code is generic over many lock types, I went for "lock".
> But I guess it could make sense to rename it.
> 

Got it. The good thing about the naming of lock_api is that the name
"mutex" is not used for other purpose, while "lock" is a bit different.

> > Moreover, if the only usage
> > of this is for asserting the right lock, maybe we can instead add an:
> >
> >     pub fn assert_lock_associated(&self, lock_ptr: *const Lock<T, B>)
> 
> I guess, though there is precedent for having a method that gets the
> underlying lock, so I think it makes sense. If we had an assertion, it

I don't disagree, but I just feel we should be careful about introducing
two "lock()" that one is an operation and the other is an accessor.

> would probably take an &Lock<T,B>.
> 

How about:

    impl<T, B: Backend> Lock<T, B> {
        pub fn assert_held_then<O>(
            &self, proof: &Guard<'_, T, B>, f: FnOnce() -> O
        ) -> O {
            <assert `proof` is associated with `&self`>
	    f()
	}
    }

In this way, not only we can assert the correct lock is held, but we can
also guarantee `f()` is called with the lock held. Thoughts?

Regards,
Boqun

> Alice
