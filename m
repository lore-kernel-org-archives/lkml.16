Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B7AA279796
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 10:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748429239; cv=none; b=acVKHgE5HAjT/JtkMLTtObml9ORuQvTw5K4ysCbkCjsrsSx8ZzGdijecDmCs2ZTVvmh3xI9wuLodS27C9QDPaP1c/zz3/5MV96lnaXeTHnngiBj/OOL6yVlwTugWu00M3YOmLTyiuw/66sbc3910ud2AcWacxTGJT2XFa6n3OC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748429239; c=relaxed/simple;
	bh=4JAIloCGROmw8RqSeSc6609mQLhycM753L10JAOfvMo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=rGZrcB4nfHr3nkdrU+rbSqK0pCrvtosaDAqIEs9JtSI4FlvImrs9CeD5/rON6rCPlZ9sTEebj59DhQD+UPy+5aLD3ZCAtv2/JQfYT/L5HDcTIUB27ZZoPw3x7ZyFfHS3DfGIvCSr/dmv723Ng+8UkqPVO7hWyOzmtVuIa9lxxYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Ol2tJsEy; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Ol2tJsEy"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-450cb8ff112so1458965e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 03:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748429235; x=1749034035; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=LjqhyajdJYKwDqK1rYEUecgF3iQn80xMPzv0hJ7BRlg=;
        b=Ol2tJsEyHTZ87XerQ88q7RZTzdRQ9E//zNiq/kGnch9V7Zn6iAJo5tAMK9huTnYCm8
         wEawGzaGrvc0IWJ4acPoukia+AmqM+kOWud45jgN3mF422bQVg0wKHVjDNVOD/R3imhL
         ar7dsa4JPR3rEd/eKlyR4bWg0qGgkZME8EdhErTrE72GYCOeBFnthhMLLtnE0yVD6FHJ
         SLR0zuRmwUY3pJSSo0P/XzhLLU+C+0xIL6r0Pz/02D9gv5lJpA1sUkMESH+edlXtnKSD
         jc3M9KIqdtpY49+l8ZLl9V8wjkWW9wjGwDbf2ZkskAnDlU5ZdXekjM8o+Iw3cilnMrsS
         3mMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748429235; x=1749034035;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LjqhyajdJYKwDqK1rYEUecgF3iQn80xMPzv0hJ7BRlg=;
        b=pfdo/vhbMKxgXZhueyYhZ7t/3VkyklnjQaFL83ZGaiox08nFrJuTETUyaVOaKqJjhg
         pR7pFoAjM5+HpsEHUgzgaEOznb2GKtY0rvXGxw5HMog7rDbz6GxItnCilSIYDWvn0uTl
         LLJSjdg+sm9KFmRZ9bQCT/azE3o9QAViBAovpRvmg25hbioEU1YcaZJ28ntzMmCB2N6L
         fNnmq6W2ORfTozGpuwykZEcqzexbAEIgdXOWmwW3Ga10SLBiHxAj0SqvmwrSgn2gGMZk
         p9m2UGs2wvyXwONlC8oxEvahAuIRE8agOEVw+km+5Oyf8S874zecGzVAPXk6NLLhH5Mo
         e3OA==
X-Forwarded-Encrypted: i=1; AJvYcCXMGfKIFnSJzkaz5fkmX8/8W4M4OqDX6cM9h1qpLO64bjDAMG8JrXtQQcqbvcUAabaP2AbDueWM4i/lpxA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBfYp5IfnKRFW6izVMCF+kGiKIFvQuV5RZ+UnR8do1r+PvQYFl
	W/nmiK9bHZ/f5YCtKJPDcZXCHv39tdU1QILoJhJL+aN41haMmPoWlGt5EZoAcRw0OHEmulwXkpG
	2VbvcYjljN2BirGKHgA==
X-Google-Smtp-Source: AGHT+IE+opBHokkVpdFQ5IoCIRLjKWUCarl4R8LN6fOCasflCO70IXIp/1PAEYCd3I6TPAjKvNgZbGswp299YFE=
X-Received: from wmqc17.prod.google.com ([2002:a05:600c:a51:b0:442:dfbc:dc3])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:5396:b0:43c:fe5e:f040 with SMTP id 5b1f17b1804b1-45077e36cc8mr14321085e9.23.1748429234963;
 Wed, 28 May 2025 03:47:14 -0700 (PDT)
Date: Wed, 28 May 2025 10:47:12 +0000
In-Reply-To: <20250527221211.GB2023217@ZenIV>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250527-userptr-newtype-v2-1-a789d266f6b0@google.com> <20250527221211.GB2023217@ZenIV>
Message-ID: <aDbpsB3ayj6tFfbI@google.com>
Subject: Re: [PATCH v2] uaccess: rust: use newtype for user pointers
From: Alice Ryhl <aliceryhl@google.com>
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Miguel Ojeda <ojeda@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Arnd Bergmann <arnd@arndb.de>, Andrew Morton <akpm@linux-foundation.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Tue, May 27, 2025 at 11:12:11PM +0100, Al Viro wrote:
> On Tue, May 27, 2025 at 01:53:12PM +0000, Alice Ryhl wrote:
> > In C code we use sparse with the __user annotation to detect cases where
> > a user pointer is mixed up with other things. To replicate that, we
> > introduce a new struct UserPtr that serves the same purpose using the
> > newtype pattern.
> > 
> > The UserPtr type is not marked with #[derive(Debug)], which means that
> > it's not possible to print values of this type. This avoids ASLR
> > leakage.
> > 
> > The type is added to the prelude as it is a fairly fundamental type
> > similar to c_int. The wrapping_add() method is renamed to
> > wrapping_byte_add() for consistency with the method name found on raw
> > pointers.
> 
> That's considerably weaker than __user, though - with
> 	struct foo {struct bar x; struct baz y[2]; };
> 	struct foo __user *p;
> 	void f(struct bar __user *);
> sparse does figure out that f(&p->y[1]) is a type error - &p->y[1] is
> struct baz __user * and f() expects struct bar __user *.
> 
> It's not just mixing userland pointers with other things - it's not mixing
> userland pointers to different types, etc.
> 
> In practice I've seen quite a few brainos caught by that...

We don't currently have any way to perform that kind of pointer-math on
user pointers, nor do we have any users of it. I imagine that this type
checking is only useful if you can actually perform pointer math in the
first place?

Right now, actual reading/writing to userspace is done via the
UserSliceReader and UserSliceWriter types rather than directly on
UserPtr, and UserPtr is just the constructor for those other types.
There is already some means of type checking on UserSliceReader and
UserSliceWriter, so I'm inclined to say that this is good enough.

Of course, if we ever add a way to do pointer math on user pointers,
then they should have a pointee type and hence also this check.

Alice
