Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36CE4275101
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 09:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744707921; cv=none; b=uIYVO4sRdPYC7iihmI32DlVloDz+e9fAFGbmcV+2XS74pXVEjs7nMEu2bof6Tsr7GRIDSLfdzSVs4RDsAAL08ZcyUl8gUJM5K6iWcopcheNOt16KjcbP5oG8ESBIZIyJeqSLEBY7sozLD44FS/Gmf9FSOXcP+C8XSxLMzO2v98c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744707921; c=relaxed/simple;
	bh=h2DEK8fnN2Gh/YmAl5zHBzGdGpaDN5Or8Mju5hKUKd8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=XTP92Bd2fQJrFgvvYMAoJDqutdK1LNfoCdLxSBNK1brgHu+joB75qEDwUMMXSpRD7ggiC6qF9DdH81JCYyyD8vK3zVzvy5SjsFIDmXqEyY23cnC7ubY8FuUtLkgk/1y6xmjDIqQZ/aU8TKiolHS3do0ginuQaMOZpVnZztolfZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gGkt+i89; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gGkt+i89"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-39979ad285bso3134203f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 02:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744707918; x=1745312718; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=559hWc8vvPPLU6Zg7XW7jcJSKjSV/Q+pFH2bIUlCWes=;
        b=gGkt+i89tLVsYLELj7dd+/fm6VkN/cfF5ZSFHN1rt6Yd9q/EtybUku9ex2k4loEohB
         bNhl+eqaZLs8k7uruuk9mIFe31zT5Xd0sxSwUhx6Eld1euBmQM9UXd4KoJLI42vw5liq
         QEdIPA4+eYZV/vbKVLLFg1iAAycm0W3lvcciUmE77Sq8NkY0VdsHowi20IVuYq6YrlRP
         /4jpj4o7OfDsJBAuvU7ySzYlPxTsJyYuZyisPGPjOJ8y4oJk/k3di3BSlTNN7Psjj2Sp
         pipGXAZgJ/1lxSR5DjlWYCe/VQPnfGFfy7S7L+7P+6maODIRRhb0Oba8F+tmz7otS7nG
         DrcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744707918; x=1745312718;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=559hWc8vvPPLU6Zg7XW7jcJSKjSV/Q+pFH2bIUlCWes=;
        b=CW++OXlPZS85f6pb0x8ugMtoz3Y6TxRj4HWGVP2u1svySisqlMzzfWKwdvLn7chGG4
         bTfqWhKsPc4HySdrE2jrb6v+ZoKTKrjzhi2Vl6bg816WJ/CCVVdMRJgxQ9umcUTktycL
         KQpVciudn0iyufPNvTu5ABP0rJrXL5hvjak9GLVW6hAmY0qZyvTIjTSCTk33qg1Mp88M
         JPG02kmV8Lks4mmVfcAAzTVFsinhvMenx7wyf/3pjV+sd6sVisMtpi45glnl/sKArAcI
         Q3lZXqAWTmnlLMhEjPqaFdtuFT+XOIX6DkWHZjFPbKK7qvdG2t0X2SF/afqJAOuTpiw6
         hovg==
X-Forwarded-Encrypted: i=1; AJvYcCURmU0KHc36sZhWdSijftAXXQc4GoDcd+3x1N+7TB/g0NQwgUwF4E8qZm7Ijd2TJXl3lFaqOFSxOqvU4Es=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzv45kp1TnLVwICvidh3kgx1BTQQrBzCnX0Pg/nxa50KAJyKXJd
	msfy4+YS3LbGJUz4mR4PNTZ0F2DHHAinJNnx0zPGl+Qb1blFhtYzH+kgDlBg6XjDpiJiXNYCmgR
	BK5zug0g7ZLCaVQ==
X-Google-Smtp-Source: AGHT+IGaGphQUOfUzKJDXEiqvP3cldS/F/M+YoDjFINgZTcUVSnk0ewAEd4RsQKkgrKbPZ+Kg1iebePbw3cBLIs=
X-Received: from wmbev15.prod.google.com ([2002:a05:600c:800f:b0:43d:7e5:30f0])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:1843:b0:391:3d12:9afa with SMTP id ffacd0b85a97d-39ea5201eddmr13259999f8f.21.1744707918651;
 Tue, 15 Apr 2025 02:05:18 -0700 (PDT)
Date: Tue, 15 Apr 2025 09:05:16 +0000
In-Reply-To: <Z_1EnkPiBKakGYtM@slm.duckdns.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250411-create-workqueue-v1-1-f7dbe7f1e05f@google.com> <Z_1EnkPiBKakGYtM@slm.duckdns.org>
Message-ID: <Z_4hTBFdodhXkArL@google.com>
Subject: Re: [PATCH] workqueue: rust: add creation of workqueues
From: Alice Ryhl <aliceryhl@google.com>
To: Tejun Heo <tj@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Mon, Apr 14, 2025 at 07:23:42AM -1000, Tejun Heo wrote:
> Hello,
> 
> On Fri, Apr 11, 2025 at 03:34:24PM +0000, Alice Ryhl wrote:
> > Creating workqueues is needed by various GPU drivers. Not only does it
> > give you better control over execution, it also allows devices to ensure
> > that all tasks have exited before the device is unbound (or similar) by
> > running the workqueue destructor.
> > 
> > This patch is being developed in parallel with the new Owned type [1].
> > The OwnedQueue struct becomes redundant once [1] lands; at that point it
> > can be replaced with Owned<Queue>, and constructors can be moved to the
> > Queue type.
> > 
> > A wrapper type WqFlags is provided for workqueue flags. Since we only
> > provide the | operator for this wrapper type, this makes it impossible
> > to pass internal workqueue flags to the workqueue constructor. It has
> > the consequence that we need a separate constant for the no-flags case,
> > as the constructor does not accept a literal 0. I named this constant
> > "BOUND" to signify the opposite of UNBOUND.
> 
> Maybe name it NONE or DUMMY? Doesn't affect this patch but [UN]BOUND are a
> bit confusing and as a part of the effort to reduce unnecessary usage of
> cpu-bound workqueues, there's a plan to flip the default and use PERCPU for
> the cpu-bound workqueues.

Happy with whatever you think is best, but what about naming the
constant PERCPU, then? In fact, by adjusting how I declare the flags in
Rust, it is possible to *force* the user to include exactly one of
PERCPU, UNBOUND, or BH in the flags argument.

Of course, also happy to continue with NONE and adjust it when you flip
the default value.

Alice
