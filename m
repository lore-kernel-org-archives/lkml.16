Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04D2B208D0;
	Tue, 29 Apr 2025 19:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745956079; cv=none; b=bk51U+/zatK7FEVGKKuDPD1IcdL/ggnaXT4NSQkoejyX5xQ7umo5VZKXWJHKMP4qcvYNADLmzB2F5ucmNSUfjv18rKMZcYIv2YF4mcN3AEVSabZzB2OmOxVUNsKobQe7EDgdN0pmu1ztDVlvesSOcpWbscaonEM+w5oM4ttso20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745956079; c=relaxed/simple;
	bh=iO8BQMjsWG8aVmJrmu3RUdpRg/mY29X5nv5NOPh5RGs=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=twCe7NhHNEqHEfluKPz8WktsyQqHgCq+4oYkzC27pB47PboxagEGFxmsc2OkS8TAHRHCrhFYtbb46Mtx4lxVN4PAuCn1V7zJ6Zrao/vZWes6FgIfCSBLCFszjnzinygs0jodAhOQ2Am5eWaZmeBTGCc4VhFv03pq0FlX505Cet8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dBLtxZ8P; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dBLtxZ8P"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7c58974ed57so710929185a.2;
        Tue, 29 Apr 2025 12:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745956077; x=1746560877; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:feedback-id
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=N94/S8f4FA3mT8/S6kAiZQTgDSrbdfUuUxD7gFGGZLM=;
        b=dBLtxZ8Pw86hObB8n4+RHC44+lIVXarIqHp7V2xmA0fPe//wYxClODoUpP8uILgLYl
         pkoH2ME5O5zAhk1qxs0y1O5g8Bf46T8vA0P88lgXbN0b+rX8gIzh6BEL311rwVfoIaFc
         a6m2BoWmmtp+fmcaWW0DwOmdupNymgNn98mx4HxHGQdNzATXLhCgAWAWAzU5tP5byQ8E
         U+UQSMkfU8Ynhi4rKox/nbo+n8m7hJtmeMeS/Sy58J8YIY2JLnOG83otCMYLs0+zgRiR
         lKOEpNxyXle9xuJ+D5Goq+Ubx+9kSa5uYn5NnqKKDIwe4TG8sOQmCntkY62WeUzrkblJ
         8sVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745956077; x=1746560877;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:feedback-id
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N94/S8f4FA3mT8/S6kAiZQTgDSrbdfUuUxD7gFGGZLM=;
        b=g1nGez5NrpueswmStWo7EWtzFoopS6AiV9ZEmcAEDoA7BVfGDUK1UNi90SUaCLVUJo
         1N0PMoMg8miVjXRHAi6183Z39vnF7VxN8aTnM4aZmuRU75fz0G1o2GqwAHG8DpbqQ8w8
         ieJM8JA6cBcdms5MgLBR7bR4QKAuXMhOIOH1dQSJfqtgU66QzwgajmkR3O7a4jlWozl9
         MzsqBOvddOVjgl19m6zySI+gQn6FhEpnVRPKvDUJYWwjSFsWVaYoe8Qer/s+Ox8vcP3A
         oYL4A14R2eyAOfH9MWa78JV0t+ENgRcf7a5FuHApIxdyaJ53AHR+0hEJUq+YfiHjODA9
         eRmw==
X-Forwarded-Encrypted: i=1; AJvYcCUuedg/bGmAgFgkiCKcqeyqKN9iMgAOCKhO8ojVc3/rGpixfrgaMBetUdn0TQxLApygCbtgsZ8zz5P61/I=@vger.kernel.org, AJvYcCW+SD+6+nBWvKmG/thBWWfu0rOaybO/CdP5U779wTnLb2sbiVhQbAeuvGsu7xhST4e6dpu7p+LySr8f/F/kbQU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzrkbywKjL6whk59dSojR3deEqwL6oq/u96uL5KX5xLpwwD+wCi
	q8p72rgrd8apAgpZTAz2BL4p2GNBF3GzvUUAzjpemGQ5q1MUO4To
X-Gm-Gg: ASbGncteoji2i9OCtPjq9gxFedgxrJrm6VFzRIiWrh5TcQWIPFMNrcn21gQT72AHytt
	LUWuYKx8QYsENmcckIIkTkFbiQwm8R8S7tLsDRzKXgY5wPdySB5xcigPv4QOUsyKm7HARnAEcrh
	kuOpz/hN+QhNcYnomUfzGO1BS9qE/K54ihceg7a1XNgIGlCwXiASKwW0eWQDsphwOz5qD5C66FK
	UT75yJAd/qKya4ucMnouhPTV2KUqbPu8lScbz5T52IloK3qH/vASnlfXNpvlqVT4GmwcaQgKlaO
	pRblc1I1JlN1EY/NV+RSW+GZ0CR92bZ3POBQGhviCBC+TIFxj6OicCzj55/4CZ7P3HgE9+zRyDG
	3QtRk8Y5WfRjU/+YmL0WRWffql5UWY3KQgy9fnLizRQ==
X-Google-Smtp-Source: AGHT+IFekPV+ZaYBT3WSBsNsZgNSp5wvbAICRIDDUzJn+YCZzzBLVFqbU37dOu46mPM1PbmQMZAjXg==
X-Received: by 2002:a05:620a:1a0e:b0:7c5:5794:3e66 with SMTP id af79cd13be357-7cac762200cmr66576885a.31.1745956076716;
        Tue, 29 Apr 2025 12:47:56 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c958e9fdfbsm769933185a.94.2025.04.29.12.47.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 12:47:56 -0700 (PDT)
Message-ID: <68112cec.050a0220.acb70.2c9c@mx.google.com>
X-Google-Original-Message-ID: <aBEs6pqObHQ2SBiJ@winterfell.>
Received: from phl-compute-02.internal (phl-compute-02.phl.internal [10.202.2.42])
	by mailfauth.phl.internal (Postfix) with ESMTP id E867D1200066;
	Tue, 29 Apr 2025 15:47:55 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Tue, 29 Apr 2025 15:47:55 -0400
X-ME-Sender: <xms:6ywRaAF9DQi_fx58yomZvjp0VXGT-VaVdvRK61tfmtikC-1wDsgO1Q>
    <xme:6ywRaJU77-76Z8kCDXjk79trnJH0WstjkrjlE-gJifnhlNhh45aWG7368OHbW3M8-
    kwTWEX9XPw6jNDAMA>
X-ME-Received: <xmr:6ywRaKKUIMZtsDoIMu0tn7mNL5ay29ajcgqdJyOkR-P5BLzDSdMH-16ISA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvieegjedtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddt
    tdejnecuhfhrohhmpeeuohhquhhnucfhvghnghcuoegsohhquhhnrdhfvghnghesghhmrg
    hilhdrtghomheqnecuggftrfgrthhtvghrnhepvefghfeuveekudetgfevudeuudejfeel
    tdfhgfehgeekkeeigfdukefhgfegleefnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhn
    rghlihhthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfhgvnhhgpe
    epghhmrghilhdrtghomhesfhhigihmvgdrnhgrmhgvpdhnsggprhgtphhtthhopedugedp
    mhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprghlihgtvghrhihhlhesghhoohhglh
    gvrdgtohhmpdhrtghpthhtohepohhjvggurgeskhgvrhhnvghlrdhorhhgpdhrtghpthht
    oheprghkphhmsehlihhnuhigqdhfohhunhgurghtihhonhdrohhrghdprhgtphhtthhope
    hvihhrohesiigvnhhivhdrlhhinhhugidrohhrghdruhhkpdhrtghpthhtohepghhrvghg
    khhhsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtohepghgrrhihse
    hgrghrhihguhhordhnvghtpdhrtghpthhtohepsghjohhrnhefpghghhesphhrohhtohhn
    mhgrihhlrdgtohhmpdhrtghpthhtohepsggvnhhnohdrlhhoshhsihhnsehprhhothhonh
    drmhgvpdhrtghpthhtoheprgdrhhhinhgusghorhhgsehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:6ywRaCFBpGfqjdRkPjU1G-XufRh84WZqJB5Au4uUmwtXjKHI8Los9g>
    <xmx:6ywRaGUlI5hrHiSaGqNBC8l91GAgVVv73v0IXQc-EMCWKOjH95crvg>
    <xmx:6ywRaFNGkur3tY--Aq1KVplaNUJjNq-YoP05vavtcyNTDqxUryYfWg>
    <xmx:6ywRaN0UmIyigHTPW2ht7RFZfQ06KBs1CNdWaUSkKo8XUAG_bKKePA>
    <xmx:6ywRaPU87GkfMGNnWnX4UKcaCCHQM_i9B4hfGkBJ_hVyQbJrpx6C49h0>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 29 Apr 2025 15:47:55 -0400 (EDT)
Date: Tue, 29 Apr 2025 12:47:54 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] uaccess: rust: add
 UserSliceReader::strcpy_into_buf
References: <20250429-strncpy-from-user-v2-0-7e6facac0bf0@google.com>
 <20250429-strncpy-from-user-v2-2-7e6facac0bf0@google.com>
 <68111422.050a0220.e6713.25af@mx.google.com>
 <CAH5fLggj-Mfhd3311aKUt9go_+FeAuXdPxditW26QL5VtLD3iQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAH5fLggj-Mfhd3311aKUt9go_+FeAuXdPxditW26QL5VtLD3iQ@mail.gmail.com>

On Tue, Apr 29, 2025 at 09:29:07PM +0200, Alice Ryhl wrote:
> On Tue, Apr 29, 2025 at 8:02 PM Boqun Feng <boqun.feng@gmail.com> wrote:
> >
> > On Tue, Apr 29, 2025 at 09:02:23AM +0000, Alice Ryhl wrote:
> > > This patch adds a more convenient method for reading C strings from
> > > userspace. Logic is added to NUL-terminate the buffer when necessary so
> > > that a &CStr can be returned.
> > >
> > > Note that we treat attempts to read past `self.length` as a fault, so
> > > this returns EFAULT if that limit is exceeded before `buf.len()` is
> > > reached.
> > >
> > > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> > > ---
> > >  rust/kernel/uaccess.rs | 35 +++++++++++++++++++++++++++++++++++
> > >  1 file changed, 35 insertions(+)
> > >
> > > diff --git a/rust/kernel/uaccess.rs b/rust/kernel/uaccess.rs
> > > index acb703f074a30e60d42a222dd26aed80d8bdb76a..7cec1b62bd8b816f523c8be12cb29905740789fc 100644
> > > --- a/rust/kernel/uaccess.rs
> > > +++ b/rust/kernel/uaccess.rs
> > > @@ -293,6 +293,41 @@ pub fn read_all<A: Allocator>(mut self, buf: &mut Vec<u8, A>, flags: Flags) -> R
> > >          unsafe { buf.set_len(buf.len() + len) };
> > >          Ok(())
> > >      }
> > > +
> > > +    /// Read a NUL-terminated string from userspace and append it to `dst`.
> >
> > s/`dst`/`buf`
> >
> > ?
> 
> Hm, append is also wrong. Thanks.
> 
> > > +
> > > +        // We never read more than `self.length` bytes.
> > > +        if dst.len() > self.length {
> > > +            dst = &mut dst[..self.length];
> > > +        }
> > > +
> > > +        let mut len = raw_strncpy_from_user(self.ptr, dst)?;
> > > +        if len < dst.len() {
> > > +            // Add one to include the NUL-terminator.
> > > +            len += 1;
> > > +        } else if len < buf.len() {
> > > +            // We hit the `self.length` limit before `buf.len()`.
> > > +            return Err(EFAULT);
> > > +        } else {
> > > +            // SAFETY: Due to the check at the beginning, the buffer is not empty.
> > > +            unsafe { *buf.last_mut().unwrap_unchecked() = 0 };
> > > +        }
> > > +        self.skip(len)?;
> > > +
> >
> > So if the UserSlice content is "abcdefg" (not tailing NUL), and the buf
> > size is 4, after a strcpy_into_buf(), the return would be a CStr "abc"
> > (with a tailing NUL), and the UserSlice would move 4 bytes and become
> > "edg" (not tailing NUL), is this a desired behavior?
> >
> > Alternatively, we can make `dst` always 1 byte less then `buf`, so that
> > in the above case, UserSlice will only move 3 bytes and become "defg",
> > and the return CStr is still "abc" (with a tailing NUL).
> 
> Maybe we just have this method consume the UserSliceReader and avoid
> thinking about what happens if you use it afterwards.
> 
> > The current behavior makes me feel like we can lose some information,
> > for example, if the user-kernel protocol is that "a userslice that
> > contains 4 64-byte strings which don't have a tailing NUL", we cannot do
> > 4 strcpy_into_buf() to get them, right? But of course, the scenario is
> > completely made up, just food for thoughts.
> 
> But then you should probably just read the [u8;64] type four times?
> 

Ah, that makes sense. Seems I was trying to over-task this method ;-)

Regards,
Boqun

> Alice
