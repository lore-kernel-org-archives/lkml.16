Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83379205AA3
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 09:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744708914; cv=none; b=K8+tfMp+u35QjcblOCJgLFPg82p5m7Yw1+at7/ot6CGVPsjG+bogrk3SI2OTymj5NubvF+/UVBJ18f71OAG1+qL4ZEy9E3KMtzhycjWN2tvAa6XgNgJ1Ykcuo5evmP+hQicPis1YxG2lJls/SYGa9nI4ovtHvjxxj4eJP1Q5Ucg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744708914; c=relaxed/simple;
	bh=+yOgWRw3uvx1BqDbM0dE8P/uGNyvZzC8BkIpRI9L2y4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=CzetmKUCircARlUxnamTzT0S2Ceylqum74jg8msC/6SsT00j4q4MgZ0Mmp10RTCBbxrRFxrN4W8HTK4Og7WJ0+28xnsjAU053P9ulMtTpBO0rLMW6Q7Zjb8qlbu8huVbX7dJZVtNro1lOkARPhYA3lyPpYfaLvAafuxsM8M1JbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FMC964Sg; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FMC964Sg"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-43ceeaf1524so29084025e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 02:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744708911; x=1745313711; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=lQYLM5MPeJ7pBPciZLXP19wi0JXlYOv2HtY4ZImtR8U=;
        b=FMC964Sg1gF/wQ4cHtzhmW/oui/3XREaN/JAwnre953UHMtIk4WGZC87uAg9G1FPVp
         MgYtt0M/oHDbH/Z3GlVCx8q3b86f9CyPs6wTwLKCn9kdAK5f5A+2fz+WQ36wytvgh0+7
         PXqD8990XlL+ft98SK4NZiRB9fKlhzDL/WScUBfYSvSBLrRXIcubRariuVp3xt1h3Ij8
         25nESYP6IJWQrZpq6fRaV5E9cH8JwFfmBXBgKZBIrkokEbYmahye7Xmj8fJD+78f6zNc
         zGnXqIGsjGi1UyFQiunFA/PJutD6Eb5iVYKpx9xsWjMsQrv1hH0q/2QWOWDdPGLl9zmW
         FpSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744708911; x=1745313711;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lQYLM5MPeJ7pBPciZLXP19wi0JXlYOv2HtY4ZImtR8U=;
        b=bSH3QB5R7HBvcC/lTTsYoNO1YW4HJvyhNoaG1gKtyVwOTKbJt3uxLZfyrerQ25QsmN
         KFMpHYXNN46yxSa8rG3FkK4tm9bOQ8aij8I9y+KV6pNBQ734kB6mydlMOgOoMyvLy4p9
         otcq/7huXJOzM4CanqnWBYJPMlJxmpS0QA/opio3QxWMODuLH7kkLLcXtobilZYf1wwg
         TWk/a3YyMwc1m2I+96WTKhWpgH8gco1vsSvp5RjDFrIMHui6r4aaeafNxZWaQ7qhLv5z
         3+NeJtBqJzAPM9m5bbmk56zQvN4K6yX7o8uKJb7Ap01hRFUU6gOgQlnCqGnhVcaCnP9x
         r8Vw==
X-Forwarded-Encrypted: i=1; AJvYcCVW52KVeI+HoYUJIlo2pi+7BOAtk1vdnXBOMfhG0mNuWTgVhvoBqbF45v5QXOegj53owhcD4TL3tk2Xo3U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1QscLAEo9niNhG5nrRiHS9ALl539ww2oIid//zOKPfVsSzn+T
	xoKfpcTh/FF+joVOnUja9lsFlk/utllUAAZPHA5BxFhndhfDcXhSwQ8dlneK6OUmGg9qBQBBV19
	5xpxT27aN67jdxg==
X-Google-Smtp-Source: AGHT+IE++y4l2+SOKTm/ba4RBqWahO7dM+xuUIWSBv+zaQNUdrGck4nuQOj0QinRrlx7d7Z9v+cPlDIM1Wp0pxo=
X-Received: from wmqe16.prod.google.com ([2002:a05:600c:4e50:b0:43d:47b9:bedd])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:cc8:b0:439:8878:5029 with SMTP id 5b1f17b1804b1-43fd3916ab2mr18708075e9.2.1744708910972;
 Tue, 15 Apr 2025 02:21:50 -0700 (PDT)
Date: Tue, 15 Apr 2025 09:21:48 +0000
In-Reply-To: <Z_1KJ98k7WL5qWfS@slm.duckdns.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250411-workqueue-delay-v1-1-26b9427b1054@google.com> <Z_1KJ98k7WL5qWfS@slm.duckdns.org>
Message-ID: <Z_4lLEFjobzEWT77@google.com>
Subject: Re: [PATCH] workqueue: rust: add delayed work items
From: Alice Ryhl <aliceryhl@google.com>
To: Tejun Heo <tj@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Lai Jiangshan <jiangshanlai@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Mon, Apr 14, 2025 at 07:47:19AM -1000, Tejun Heo wrote:
> On Fri, Apr 11, 2025 at 11:12:29AM +0000, Alice Ryhl wrote:
> > This patch is being sent for use in the various Rust GPU drivers that
> > are under development. It provides the additional feature of work items
> > that are executed after a delay.
> > 
> > The design of the existing workqueue is rather extensible, as most of
> > the logic is reused for delayed work items even though a different work
> > item type is required. The new logic consists of:
> > 
> > * A new DelayedWork struct that wraps struct delayed_work.
> > * A new impl_has_delayed_work! macro that provides adjusted versions of
> >   the container_of logic, that is suitable with delayed work items.
> > * A `enqueue_delayed` method that can enqueue a delayed work item.
> > 
> > This patch does *not* rely on the fact that `struct delayed_work`
> > contains `struct work_struct` at offset zero. It will continue to work
> > even if the layout is changed to hold the `work` field at a different
> > offset.
> > 
> > Please see the example introduced at the top of the file for example
> > usage of delayed work items.
> > 
> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> 
> FWIW, looks fine to me on the first glance. Please let me know how you want
> to route it. If you want it to be through the wq tree, please let me know
> what to do about the dependencies (I just applied the "remove
> HasWork::OFFSET" patch to wq/for-6.16 but don't have the other one).

Normally I think it is most natural for workqueue patches to go through
your tree, but it may be easier to take it through Miguel's tree with
your ack as an exception this merge window since the container_of change
will probably also affect other work.

It sounds like this is also the conclusion you and Miguel came to in the
thread on the HasWork::OFFSET patch.

(If you're planning to change the default workqueue configuration from
PERCPU to UNBOUNDED this merge window, then please let me know because
it might change the calculus here.)

Alice
