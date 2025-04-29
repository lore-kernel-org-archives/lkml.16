Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0653252900
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 08:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745914182; cv=none; b=gy5MI9A1Pzg8qQA98wYXeiklp27/guSRPuNDzsG6y0Z6sG1ZjlovfRyx8RteazTM/6GygQsLoSWqnPeUCGNnR+806eAGt3N/Dy8mXyhUwQLGGzm4EphUXmoZRzQcs0LuXMqGb11v6HC04i8YWrsP+f5shwVSy3mrHgfcI0BL5fM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745914182; c=relaxed/simple;
	bh=7VZwQqCG0GmrXu7ZorMUhbmxOdH1h8tMkLewjmBRvX0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=pNN2UGfBN28CZ6qQSR31zq9uH78TcECkmcU0vJIQxBm4nJuwstXS5CB6nvcLmTU8d+GKW3ZBcse0BEUnlQHTSTu7etrKP69lFMQ4d136vjgNIfe2BB06UMetHj3bsbbMVLbv4DbS7nKWO5mDfZmFDDKpeg1eIqUzup17PbK9NNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RtRmJwqf; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RtRmJwqf"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43ceb011ea5so31477655e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 01:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745914179; x=1746518979; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=nto1T/+0mRSZ8od51AhqtN3vVPNmwGq3ZP7h3UYYZ+c=;
        b=RtRmJwqfO9gIVIV/qmAwMvKi9DpS5g+sNSjrSXKfvGAJeZTe7gUv3LU/Uow1nhv8Vx
         FCx3Q+AKlZbug3fcBebME9AKHHh7o0ba52V4NayB8LUhpVEUb9u9uzHj3NfknvBVIHMR
         lHdkN5kvceeNlguAWk1qdQ6RYIc3f9hYurQr5YySxaTJkOGjxdwHaaSvULbGGMHnPjia
         rl5DKTC2OerPIQ7He5pPh68sdVn+dtK9Zo2Y1hr8tkavbdpwSt+VJvct0gDFNwo1409S
         G/mdPpbR/hbZKrmFXR9Hm1x1vIBTha4u5fOogVj0kBJ6JjqzGLucOSe1Z6QbYHCvDV9P
         NeLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745914179; x=1746518979;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nto1T/+0mRSZ8od51AhqtN3vVPNmwGq3ZP7h3UYYZ+c=;
        b=isY4z5dWEEumAlefCJou8SDjHQvbr8HEYLHis8G4FRLIMbJQ7t0rrB5SDbYBbzL9lb
         XUityX27PKmB7QQK3accsRh9pz/S6YR+destbRrVCm9xG6Dpvrdg05vl3dNU2pbR+JDJ
         zby5dQLZanGkUoNb4A4BYQM/6/xjTrtFJib8t9nV7Mah+TdEx+AyO92/P0ZFMsByh4WP
         3fpCEUkPbH6ePUGZjxro5EMTAquKc4un6jwG4ZSCjbRjNGIUYNE4i4ZP0g2J8mUOPswV
         WnSeEckuusjk+R7HiSz6oV/8g4aIfE/ywoRdmJlllBCKVEQ8tYKD/mM+CXq7W01AEGH5
         gTrQ==
X-Forwarded-Encrypted: i=1; AJvYcCXbI6epyS9ZkBZwTedQjx0JPKiACgrGopEPB0qo9tzYe601lYVQ61rdAiHl5pofE1BqjhCET6KdT/CWqP4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPCJnpyIL3Jofj6ogVRCxaH559mI2msGEjEngt77Avh5dCw+q4
	NfM4BEA7MBsRUtdJ5YB11wTKo6JlHrjV2Up/mc4urM4sQxTtUIojApJkzuMejQG/9T05zUNZdsB
	91kVBDI38IvbQMw==
X-Google-Smtp-Source: AGHT+IFXrgBkFElYd0tijwJi0z0pCe4jvrxzX42Si29dbC7sbSQWeA7o9FzD+QEPV95aSxi+jD6mw2A92+z5q1g=
X-Received: from wmbji1.prod.google.com ([2002:a05:600c:a341:b0:43c:eb09:3790])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1d06:b0:43d:10c:2f60 with SMTP id 5b1f17b1804b1-440ab845ea3mr78069915e9.24.1745914179395;
 Tue, 29 Apr 2025 01:09:39 -0700 (PDT)
Date: Tue, 29 Apr 2025 08:09:37 +0000
In-Reply-To: <aA-A5ERYLP7r5zK7@yury>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250423134344.3888205-6-bqe@google.com> <aAkbw0jEp_IGzvgB@yury>
 <CACQBu=XaOohewMnLj9PvgR5rYBxzYSXf2OAjCzUY=GFTJ9L=+Q@mail.gmail.com>
 <680a6b54.d40a0220.27afd9.5e84@mx.google.com> <680abbce.050a0220.144721.78ac@mx.google.com>
 <CACQBu=VEATxHmFvt0TKbb+Hx5jeEGO8SL733=0m8LNnX6S+ZKw@mail.gmail.com>
 <aAuR_0om4FI5Pb_F@Mac.home> <CACQBu=VkFT5yDuDz098L+S+tGvtGHMvm4FaZ6p3sr9VCp88jww@mail.gmail.com>
 <aA9MDH8RjOH9hQ2E@google.com> <aA-A5ERYLP7r5zK7@yury>
Message-ID: <aBCJQQWnQ-TRMECr@google.com>
Subject: Re: [PATCH v7 4/5] rust: add find_bit_benchmark_rust module.
From: Alice Ryhl <aliceryhl@google.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: Burak Emir <bqe@google.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Rong Xu <xur@google.com>
Content-Type: text/plain; charset="utf-8"

On Mon, Apr 28, 2025 at 09:21:40AM -0400, Yury Norov wrote:
> > By the way, if you add assert_eq!(bitmap.len(), BITMAP_LEN) before the
> > loop you may get the bounds checks optimized out.
> 
> That sounds cheating, isn't?
> 
> I think nobody will reject this series because of +15% in performance
> test, neither +25%, or whatever reasonable number.
> 
> Let's just measure fair numbers and deliver clear maintainable code. 
> There's a single user for bitmaps in rust so far, and it's you. So
> you're to call if performance is bad for you, not me. I just want
> to make sure that your numbers are withing the sane boundaries.

Right, well, in Binder's case the relevant performance comparison is a
single call to the bitmap's next_zero_bit vs following a sorted linked
list to find the first index that isn't used by an element in the list,
so I'm pretty confident that the bitmap will win no matter what.

Alice
