Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69A7C23F41D
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 12:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744805874; cv=none; b=bd8YW1dWfcouoMY3/GuKxJvqm2XHBhUoyhF+dyjc4CNYxebXfN3dKnxEXV5WbrHSVtzUwwbSu4uP67g3SswPbG0GWQK8W1j5vbVo2RohnPTgTo5PXAWgtcSQu8/Su9meQAqvt/Pz75o/qSC3qI7mirYD52K2QnDb6QCcQXy+uTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744805874; c=relaxed/simple;
	bh=D1y0KTa//ihPdQUc7xWoDdFeEGayl6MAw3XGGJlN9oY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=etcc8uwLjeFsu87OCK1J7UyMhOVS/s3ymdJGmGL3fHdm76j1RNOo4ixsyZ9F54vxon4peVzuGOdx0ynlzkOzCpzfdQ55DYYsUPjPPMroeJh0cFnY/YwvprfNa7eatPBFv2N/TUsCUZRvBX17/QmBcVBVTx1/pOJE4yEsq5nr4F8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=n+nQJPtm; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="n+nQJPtm"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-43d22c304adso2943135e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 05:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744805871; x=1745410671; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ujHiZnvLKpv7O+1PchdCF4Z+DSa+OumwellZTchKlcM=;
        b=n+nQJPtmMcWRPPtlnZ0CC5Q5y7MWmpvh5m8xWVeYqcMBMGG6dkgtSISNIks2/bfjhs
         Bh2UAFMo9yODVboMDTeDF+clVY+iHpqritnPVVKRlwX0TOWsiO4fOp6p/NSDVO1yyS6+
         bC+suvI3B3CrfcN+ajR+uh0VW2jqAtFS5neXC7xDu2rcuy0XgtxUTOKrfkYwYEs+C4+8
         yJMnxAqTLL5R2eUW7M04MuIGTA6z8QAi4zUgU5OyPSdVHy6OAyQ1rHkyEm1VvWyxwE+J
         /CNu1SwytcEwh2s8SawfIm7qiBwCgLuBuW0kZ0+tigNIdJAJhv4bokGqsDf4ncK4WqSx
         ZbaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744805871; x=1745410671;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ujHiZnvLKpv7O+1PchdCF4Z+DSa+OumwellZTchKlcM=;
        b=PCEbgd2EI4pi2WZ9Xrl4rK9GNfjlkJfandGRSePmiQwZWsoOMldmGh60nCdfjltnqv
         LaVPRPBJ/g+sq7/rxXRWeRi3WJxj+IPuSy/KeZZ3LdpIsx7U7j5cR3WrcWuwuBfSo8nn
         iE2xaCCH6+jScx904x/0QsTpDZpjH6XY65y2MLILtPxKDvLtci5xF5HLhLeCgJlPJH6N
         1Om6538oeuK/XxwK2Y4NSVpv2gvHD1Vpr3ySiGVDYBKpgS3I4YnQphPeTZ86GFbbDaFL
         R5bMpn8D5JBkVKTeAAfP2ZQvT+5xQyqOG+V5rQslT+h4R8XAjap8gCEY0c1QXUY+cpRF
         ChSw==
X-Forwarded-Encrypted: i=1; AJvYcCV9QioT0f0vC2rMkDc3wTZqh63gbKaX/7gR1VeaP7gNjVcOJoD4SGZ/hHYP2nuBU4LcG+EUZf+8ODYb0Y0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz10jV7d5jOoYfEx9thgNjvxQYKQxnsV0wNxjK1sAJSgGhkd7iR
	HbmLqiBO8GFLb4sZfLKv9h0q04l45Mc4TpPtLmyHALFpUaKWgfbyDVFA3vH1H+ardSTcxishKGD
	C1pbr8UZm5570LA==
X-Google-Smtp-Source: AGHT+IEzatG2HQFac6ZOfa+8cIrCdslwsCCFqQIEGW5V4XRwi//PICjXbEq1k1OUg3aeTxgDNHaNRm3VyImE5Do=
X-Received: from wmbes23.prod.google.com ([2002:a05:600c:8117:b0:43d:7e5:30f0])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:a366:b0:439:873a:1114 with SMTP id 5b1f17b1804b1-4405d76933amr15311095e9.6.1744805870771;
 Wed, 16 Apr 2025 05:17:50 -0700 (PDT)
Date: Wed, 16 Apr 2025 12:17:48 +0000
In-Reply-To: <Z_45kDv_wAHIBNpI@cassiopeiae>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250411-create-workqueue-v1-1-f7dbe7f1e05f@google.com>
 <Z_1QzTdV8mHJYdQ6@cassiopeiae> <Z_4gb8ZAlbfhobgW@google.com> <Z_45kDv_wAHIBNpI@cassiopeiae>
Message-ID: <Z_-f7Bgjw35iXkui@google.com>
Subject: Re: [PATCH] workqueue: rust: add creation of workqueues
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Tejun Heo <tj@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Lai Jiangshan <jiangshanlai@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@gmail.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Tue, Apr 15, 2025 at 12:48:48PM +0200, Danilo Krummrich wrote:
> On Tue, Apr 15, 2025 at 09:01:35AM +0000, Alice Ryhl wrote:
> > On Mon, Apr 14, 2025 at 08:15:41PM +0200, Danilo Krummrich wrote:
> > > On Fri, Apr 11, 2025 at 03:34:24PM +0000, Alice Ryhl wrote:
> > > > 
> > > > +/// An owned kernel work queue.
> > > 
> > > I'd suggest to document that dropping an OwnedQueue will wait for pending work.
> > > 
> > > Additionally, given that you're about to implement delayed work as well, we
> > > should also mention that destroy_workqueue() currently does not cover waiting
> > > for delayed work *before* it is scheduled and hence may cause WARN() splats or
> > > even UAF bugs.
> > 
> > Ah, that's a problem :(
> > 
> > Can we make destroy_workqueue() wait for delayed items too? And/or have
> > a variant of it that does so? I'm not sure what is best to do here...
> 
> I think the problem is that the workq is not aware of all the timers in flight
> and simply queues the work in the timer callback. See also [1].
> 
> I'm not sure there's an easy solution to that, without adding extra overhead,
> such as keeping a list of timers in flight in the workqueue end. :(
> 
> [1] https://elixir.bootlin.com/linux/v6.13.7/source/kernel/workqueue.c#L2489

It looks like panthor handles this by only having a single delayed work
item on each queue and using cancel_delayed_work_sync before calling
destroy_workqueue.

Tejun, what do you suggest? The goal of the Rust API is to make it
impossible to accidentally trigger a UAF, so we need to design the API
to prevent this mistake.

Alice
