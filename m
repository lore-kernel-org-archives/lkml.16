Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D971725C6E6;
	Wed, 25 Jun 2025 16:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750869930; cv=none; b=q3FMhNwnpMpJpAKe2N79WOZMm2G0UlgAKUfvq95iwnKfdTSSWSLdhxucbx6O4AuLfXP06rkNS0aGpSzPiG7fVLTUBL4wQkJ9T8hmRciAoIlGYzuH0g2CjHejpjQ5xOaIvSpU4kMsrYQehSeB6/LPt3T4XGZ/l9da6leDcoguDhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750869930; c=relaxed/simple;
	bh=+pcqlrDkt0jVREnPds74/Z9N9Zn/N6DG7Poux5gY6qo=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fUhiZJ/49w30XFsUKCPND6FNZFDNXOIa85pAUQnL+/m+kJ7t3WLAbp4ASSHHvaAGQ0kGVrWPBLHMkh6ZIISsLyBUgt5xU4I++XNsE88pIL5/cyO+6NzPdMnL3KJd18/60k7SiFrkgGzzGmDxbtO/3SHyq8CRpeyjIp5IUO78MJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QuQfAze5; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QuQfAze5"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-54b09cb06b0so78476e87.1;
        Wed, 25 Jun 2025 09:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750869927; x=1751474727; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MRZr72IanLp2/fvK7GINdWTxeiG4EJ1++O5w+i7hkpI=;
        b=QuQfAze5BYe3YlkJUie0Hjw3vwoDno7yV+zkzTkmaar64+t0g3bsKvdqVkcR+9V+Oo
         GcUzIlhtLbGCvZJfEr2wP54E5XYGyAXoAOOqS3NUNNbWgqH98pDmiLmUpqpNynMymKYY
         9Pb7BHFuN3aVy86CMUS8XuiiT5Gz4CK4OEmA6vg9R28jCr3LroeAoU05GZpEUD9npyVt
         u/QSVGqMIWlMdf2VurWNsj3RJdHD/0p0y762E4RC/Dyf/9PbXk1IyYkMmTnidwUC/IBL
         0f+rfKYzO7k4MmbF7wzDMjpPB+hlHdqQ7pQvxq+4+ppVevtJmmNZHfBB1eykg6AQhbpo
         J5uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750869927; x=1751474727;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MRZr72IanLp2/fvK7GINdWTxeiG4EJ1++O5w+i7hkpI=;
        b=EVo3l97zQhzS4zp4ICRGCJELh9gExju7x3EOKBizgY3WmIHKAnz2Gt7I/VGVPlR8BE
         o0kC2ewEomjpE4zqrnZq7H4JWL6Mn6MpPY+M2SMKFiS/sqJnClDnv8jzHT7tFHLSxC9/
         42rd5Hn79bAM3ba7/wxVnArhFRLOXpooE4qBMYou9Mv6FtHn+8Utu/gRujjYv9OnQhzh
         5Q1E4y4zwR8WAfzd+2nDo8hthT9Ka688XdYsOauKfTe7x638wwYKxeNWOd7B+wqwecnS
         XKXwz70ZQQo3DBJbggw7E9UPppTTxM5YShyPrjYirOrApSYZ+J4qaBoyxtPjk7lOJZXc
         V65g==
X-Forwarded-Encrypted: i=1; AJvYcCULjmGlKv7rCalZOxiZ6ZM4LzM9bNJQ/W/PqfFwn3On30Gko96movN2tL1S0sBUEMkpz7YSFMDMQgM51BM=@vger.kernel.org, AJvYcCUq82xxL8j9RgTq9Wr/4jI+jsweWxV2rNHk9GnPwRd5MAn+xL7GvMB1msvzNWuIczbeGmckujHabah/xlNYntc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5pD2C3t2lmibfju42+amysxTOO4+aXUact3Wu8/8ErP5xdwG/
	Hb6qYw/lwgs7qADvWVzVSVsu4ggaYB12bMM9qPAjYkfSPx83BTb7YUMA
X-Gm-Gg: ASbGncs6YFt+qd9xaFvQv4me1GNJxuUJCZN4cigEkt2BytaVYW8UBQ/LmvmSof5lzIL
	0vjbmSQZUPRaf8AhR2MMt9OFLz93D4YLGdQShmot59XO0bY8Q/kIICC0euDi/JzNSnTMpV75upM
	6TjF2B1gRYJS5QX0jB4MpPE60PDNGMjtt79waC+loiw2vVntpoklTHIojiroASvhKmGmYCYlP9+
	zyS3IzcrI9QfyhHz+YfdS3JQ2AAyhWn7/bnJ9MYPDTtC7wl6PYnvxELBbkWvMmPXAchjKQiWlPr
	eWEkWp+umVrSip9ShK7avcpBIVFqsfUBbZKBQ9cwuQQVkk39r8obmav3Weu9U+5uB18rTWrbKSs
	2oBSvh71iO2I=
X-Google-Smtp-Source: AGHT+IERJA18iuqTJ67hC1NMSnjOwwmCBiC97X66Q79tKTCEdC0ZK7RYZyFhg8vu+PtcnRO0IUB1Dg==
X-Received: by 2002:a05:6512:2315:b0:553:cf7d:72a0 with SMTP id 2adb3069b0e04-554fdcc4d03mr1141864e87.5.1750869926585;
        Wed, 25 Jun 2025 09:45:26 -0700 (PDT)
Received: from pc636 (host-95-203-1-180.mobileonline.telia.com. [95.203.1.180])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553e41c3593sm2251685e87.152.2025.06.25.09.45.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 09:45:26 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Wed, 25 Jun 2025 18:45:23 +0200
To: Boqun Feng <boqun.feng@gmail.com>
Cc: Uladzislau Rezki <urezki@gmail.com>,
	Vitaly Wool <vitaly.wool@konsulko.se>, linux-mm@kvack.org,
	akpm@linux-foundation.org, linux-kernel@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v3 2/2] rust: support align and NUMA id in allocations
Message-ID: <aFwno6S5x7M-_YDP@pc636>
References: <20250625062917.3379804-1-vitaly.wool@konsulko.se>
 <20250625063026.3379921-1-vitaly.wool@konsulko.se>
 <aFv11ORZDmM7g6S-@Mac.home>
 <aFweqnzDyxWyt7UF@pc636>
 <aFwf5bWd4JtotCc0@Mac.home>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aFwf5bWd4JtotCc0@Mac.home>

On Wed, Jun 25, 2025 at 09:12:21AM -0700, Boqun Feng wrote:
> On Wed, Jun 25, 2025 at 06:07:06PM +0200, Uladzislau Rezki wrote:
> > On Wed, Jun 25, 2025 at 06:12:52AM -0700, Boqun Feng wrote:
> > > On Wed, Jun 25, 2025 at 08:30:26AM +0200, Vitaly Wool wrote:
> > > [...]
> > > > @@ -151,16 +159,11 @@ unsafe fn realloc(
> > > >          layout: Layout,
> > > >          old_layout: Layout,
> > > >          flags: Flags,
> > > > +        nid: Option<i32>,
> > > >      ) -> Result<NonNull<[u8]>, AllocError> {
> > > > -        // TODO: Support alignments larger than PAGE_SIZE.
> > > 
> > > Thanks a lot for doing this! While you're at it, maybe we can add a few
> > > tests for various alignments of allocation? I'm thinking:
> > > 
> > > #[repr(align(65536)]
> > > pub struct Test64k {
> > >     a: i32
> > > }
> > > 
> > > #[kunit_tests(rust_vbox)]
> > > mod tests {
> > >     #[test]
> > >     fn large_allocation() -> Result {
> > >         // Better use `new_uninit()` to avoid allocation on the stack.
> > >         let x = VBox::<Test64k>::new_uninit(...)?;
> > > 
> > > 	assert!(x.as_ptr().addr() & (kernel::sizes::SZ_64K - 1) == 0);
> > >     }
> > > }
> > > 
> > > Thoughts?
> > > 
> > > Regards,
> > > Boqun
> > > 
> > > > -        if layout.align() > bindings::PAGE_SIZE {
> > > > -            pr_warn!("Vmalloc does not support alignments larger than PAGE_SIZE yet.\n");
> > > > -            return Err(AllocError);
> > > > -        }
> > > > -
> > > >          // SAFETY: If not `None`, `ptr` is guaranteed to point to valid memory, which was previously
> > > >          // allocated with this `Allocator`.
> > > > -        unsafe { ReallocFunc::VREALLOC.call(ptr, layout, old_layout, flags) }
> > > > +        unsafe { ReallocFunc::VREALLOC.call(ptr, layout, old_layout, flags, nid) }
> > > >      }
> > > >  }
> > > >  
> > > [...]
> > >
> > At least we are lacking of vrealloc() exercising in the vmalloc-test suite.
> > I am not sure it makes a lot of sense to add a kunit test on top of rust-wrapper
> > around vrealloc().
> > 
> > From my side, i will add the test case to the test_vmalloc.c test-suite.
> > 
> 
> Thanks! But we will need these tests from Rust side anyway, to test
> 1) whether the Rust wrapper does the right thing, and 2) whether any C
> change cause the behavior changes on the API that Rust wrapper rely on.
> 
Ah. Got it :)

--
Uladzislau Rezki
