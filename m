Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5D9F1B4248
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 09:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744707701; cv=none; b=pFDyaLDB/zQmY+s1TipXABYebEkwnRgCbd9U3SfR6X7X5wjYWyo9yPeuauMrGn4Ns2aik3oOfz8Tu9AzJO46XmknY4qiNv5eeAGz9vSJ1sJwMa3/2/UclSsWSI1GEi2jDeyBd23z3YMhzoCI1Uvc+uSmE/RX+KvxtROs6iI/9i8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744707701; c=relaxed/simple;
	bh=fQ7T/qUhM3lDIvKK1VLf3X6MBV4DNYEWZWyZsblYqH8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=i3NEf864Mov7+g5N5dHirWTfiEDw/cXrDBwn+0GhKzw67ar+BHTvodBoBsol1bIaspJ041ebTAmbHxFh+lZ9GIkU0IJRDbTw5CvUtFry7GycCXABjOVaLxibIijfQiaOPUVZfXggKUhzfy4+gRyZMm5ou8jTiMhmk4D31FYqBRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rKgWT49b; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rKgWT49b"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43cf172ffe1so43082225e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 02:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744707698; x=1745312498; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ATQ2WAeqp0anILpiDAuFRK6bq5Jh77B0cEqGlrXYkoY=;
        b=rKgWT49bM4AyxpnOnD5JudJ4pidZxOQ1PLF1AfmqMXTzHEgkwMt3xe9Tj8rX5o2i+P
         3/OmbWsjbHNmzuaDZrKQDc7XjRB8ko9EGf/ibgyR3Z7R6XrpGrnRLDfpHEg9vl07+o0l
         JSkJ25skgVoUBGVTwJeJMhQEwWlgnLnamyU81D86AAIXfM1nlwMOoOdr3m2NM6p5mOzs
         5WYO2a5+w2deGOsibBJxYRvGuss164TIKzyNKJVqgBUDSTxgifd/UpSXki8/DfXAGuOK
         /ESPhX3uA+ub1yFot50p/GQkxiDWN2MKoHNMMKcStiY02p+mBTfRJQuuSvLJWZFT2lWa
         L7sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744707698; x=1745312498;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ATQ2WAeqp0anILpiDAuFRK6bq5Jh77B0cEqGlrXYkoY=;
        b=dLaAV2tgN/nxFzjDrID+mgbSDC6REYxGg4Nq7jm5JMbdpTtzvuXOT0WrcOiLs9yuUu
         EW7UfFbM+aWGPWQ4E6ZxewsT8fjnEQqVL2nGIfz6vp62IOjV0+Q4bt7bT0aerMzp6twg
         NvKxuPNvWBKkaz7+ALwVXKEh7i/lNfrxpq09ZPzlsRf4xO/+jQgrEsdOLKi9rZNdW7t/
         MRONLIM5XKL35Vg6ia4JOqiOw2Ej2uGr0HWhNEVUm5jQ3cc+Hv8IBlEImYBvpnEAvCI+
         jXDncyyWDGJ2WcerDdHR0vmh72VU+Exwut/HTPY6NRkuSSBODp9K0r296k6oNN/QbNFs
         hMBQ==
X-Forwarded-Encrypted: i=1; AJvYcCVbmqO9++tkwgDNgw3tX78GmTTSBWkokqNKVNsogGJjsSY/zYW96GcEKQQGxZSvURea+dKwR3nt3xjt0q4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwEYABgQ6j35uNR2vmJsmBO+55P7uOleI0KnS0YRW9IGpl7F8Ub
	cPCpRgc8tO1tUhMAHxqRHYn+J8eZqWOLf/3m+DLAC8MEBcoZcFbAElRM6R2QWHYzfSZF6Wtuk+q
	iMBzjPHKzpJPbqw==
X-Google-Smtp-Source: AGHT+IFmFs/nlsx2QPkRnmhjLHp1bf+lNep9itSd3yUo4cUQIyVWVraBimHdDf8+ne/yfkGfhA9ATJZ9DuVeWog=
X-Received: from wmbgz6.prod.google.com ([2002:a05:600c:8886:b0:43c:f517:ac4e])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1389:b0:43c:f75a:eb54 with SMTP id 5b1f17b1804b1-43f3a93d3e0mr126794805e9.13.1744707698153;
 Tue, 15 Apr 2025 02:01:38 -0700 (PDT)
Date: Tue, 15 Apr 2025 09:01:35 +0000
In-Reply-To: <Z_1QzTdV8mHJYdQ6@cassiopeiae>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250411-create-workqueue-v1-1-f7dbe7f1e05f@google.com> <Z_1QzTdV8mHJYdQ6@cassiopeiae>
Message-ID: <Z_4gb8ZAlbfhobgW@google.com>
Subject: Re: [PATCH] workqueue: rust: add creation of workqueues
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>, Tejun Heo <tj@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@gmail.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Mon, Apr 14, 2025 at 08:15:41PM +0200, Danilo Krummrich wrote:
> On Fri, Apr 11, 2025 at 03:34:24PM +0000, Alice Ryhl wrote:
> > 
> > +/// An owned kernel work queue.
> 
> I'd suggest to document that dropping an OwnedQueue will wait for pending work.
> 
> Additionally, given that you're about to implement delayed work as well, we
> should also mention that destroy_workqueue() currently does not cover waiting
> for delayed work *before* it is scheduled and hence may cause WARN() splats or
> even UAF bugs.

Ah, that's a problem :(

Can we make destroy_workqueue() wait for delayed items too? And/or have
a variant of it that does so? I'm not sure what is best to do here...

Alice
