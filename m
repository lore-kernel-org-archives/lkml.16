Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E512220F07D
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 10:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748427692; cv=none; b=UYSG1uFmzU3urHCLNlNMUwzK8vvgUoMAyKtd4tCXGhRmvoOlP21XMloSYgr4ghaJMRgJ7+a3ZQLeFR/PWyrMIj2w0LTH/XSOIaWsX4sLWOf8X6XznttJpweL1hVPHZ+HG3s2dvTdcNnWb8RINU0Mbk/sbDBG85ZtZG+/1/EY6+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748427692; c=relaxed/simple;
	bh=dcMsoNk413jU5nMOVSSWNMWozGrxa6Y/JoRiP9+BC/w=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ogWJMWgeHWynV5jTI103grSTuseAD5RLZSZXBDVFAG/V9gYwJv6AuWcTreN9RNexusdL08bV7W+ODTuqbhyyY1tZidCj08Io2WX4OF4Y0YuQdbQCSA1k00UoFXLfnfu4Rg+K8Sdf7h/iXj7N6DFSTRwIohclpk49gIl2j6QTN4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dPGc8QOZ; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dPGc8QOZ"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-43d0830c3f7so35144935e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 03:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748427689; x=1749032489; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ihiUk54rwHLhPgQ/ymNPw0bmICGiLYzE3RfqwI1pWg8=;
        b=dPGc8QOZEEOtso2iiK+PNqTfM11KNVC0sX2yftEkhPp8JR9hFAxJKOGokvsok0nJUd
         mx/2MxhInCejAtp732bS2ikE2y7eLEm7XoPtfRppkUxSJLEE7dY82J+ZHe/iI16ol7fr
         7yKHDNfvZoZlt3g2cQ11ZaPv0QauV6DpqC3uNQANv9aGfRkXDI90RBhUsTH61MxSY2qO
         2wAqDY9g9YGlY5njlyu8u3ioG64IIVzjS9zBCPvMPAnjkTpD/P3H9+NwgQ8CkkYVFaGw
         j7/HFzjiryTSe26tXWkZ6Fj4WmzHdoQmNBIoXXEVUNHYmyaT3Tb5H1Ppg9WPj1dxXKcI
         gKMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748427689; x=1749032489;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ihiUk54rwHLhPgQ/ymNPw0bmICGiLYzE3RfqwI1pWg8=;
        b=R8Hw4SKgUbAfMB8tIaKqfhUP2Vo8Dmmhfzhpdr8JwPaKYZluIFaPshjcWNAeKCppSk
         dSng38UjtbGOFWbuQFQp0HPNgq/ZkgJSSkhxs8jLcqlKOvhF8myTXW/IDnSqrGSeqpP6
         wFQp8aAlosAdGvyV60sV5uy8VwwhKDOpfYaql/6XzqPHHt0VUlfCCOabirsP17ErKaTA
         H+oxO3Um3XuDm5MKOXQNLn08pPk6sZ2xyGlSqKmEvMosyyLtlcFpc0XDh3YKV+CNE6NY
         RL9AFeFrVF7qo1WJ2XjVg11NjfZj36dZF1s+YatkBNM7MMQbCntGaLJe4Kaad/FdKZs4
         TUow==
X-Forwarded-Encrypted: i=1; AJvYcCULxuKLZmVr2BRuYa8NqPu7ADvUwdqld6aPEwDUEjOdoXAok5qocQeoEQ7BKPejgBDQpy4xGpLPDRCdbzg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZjEFbBXG50mQkqctcxAbB9bM+TQ4TeZK+yTlrXKD9IhnQDsMR
	AottOZMchSW1InpO4C9XBBj7JaA+rOnY393bhlATqsjXB4AGbvElEWCULph44qGa/Eh+Y0iAtuo
	oCFtH2MCJl+aYkReTsg==
X-Google-Smtp-Source: AGHT+IHs5mJnbDInw3TkGPf3wo/Sg9XehLgPlODOdQf67wGziF/MJj+S+6bCTlQgb/SVU7imTB0yCuQAEVqM6f8=
X-Received: from wmbez3.prod.google.com ([2002:a05:600c:83c3:b0:442:f8e9:a2ac])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3f07:b0:442:f4d4:522 with SMTP id 5b1f17b1804b1-44c916072e2mr127245905e9.5.1748427689385;
 Wed, 28 May 2025 03:21:29 -0700 (PDT)
Date: Wed, 28 May 2025 10:21:27 +0000
In-Reply-To: <20250527204928.5117-1-albinbabuvarghese20@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250527204928.5117-1-albinbabuvarghese20@gmail.com>
Message-ID: <aDbjp1oCqtGi6W9l@google.com>
Subject: Re: [PATCH v2] rust/list: replace unwrap() with ? in doctest examples
From: Alice Ryhl <aliceryhl@google.com>
To: Albin Babu Varghese <albinbabuvarghese20@gmail.com>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, tmgross@umich.edu, dakr@kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Tue, May 27, 2025 at 04:49:28PM -0400, Albin Babu Varghese wrote:
> Using `unwrap()` in kernel doctests can cause panics on error and may
> give newcomers the mistaken impression that panicking is acceptable
> in kernel code.
> 
> Replace all `.unwrap()` calls in `kernel::list`
> examples with `.ok_or(EINVAL)?` so that errors are properly propagated.
> 
> Closes: https://github.com/Rust-for-Linux/linux/issues/1164
> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> Reviewed-by: Benno Lossin <lossin@kernel.org>
> Link: https://github.com/Rust-for-Linux/linux/issues/1164
> Signed-off-by: Albin Babu Varghese <albinbabuvarghese20@gmail.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
