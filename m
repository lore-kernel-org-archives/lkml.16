Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BE3F1ABEA5
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 08:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748854164; cv=none; b=fY41m6WQVEcx8jiT7PwiHYf0vB/ojgVCL6oSRYauYMDM9uw07ZZmpPyL/0RKLFT4knl3gjx3DuNEmHlO/470Cay8q/HlCEpishZ2lb+yF6yAWm25XXDW8mQd9d15JQ2jazMKxY8cW+17CHK9miHZMSFfIxBdtr9vXdk+CSQQaao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748854164; c=relaxed/simple;
	bh=n2B6TOi5zwmiCCw8hYrkqAjJXOSyifR5F4rFcj/vkJs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=gNcPd1xlITG6XM1bZILUtCSJZxXATBRNjiEamnf3ygQVVav77STi1/51RkMR9TZukYhy0EXJVmkbaXOhhAXznfn+fMnH1uuOzsfLJc6ORzW+7Hk0jRnqyuAexqU/6UskKe3R4WKQYE9FP0zIMssJZRmN7TbXx2Uhd154GIcPIZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=U4ueEOzI; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="U4ueEOzI"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-450d9f96f61so20528835e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 01:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748854161; x=1749458961; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ueucLa4g5UxYnhNyLx3PdzH6maubazXY/PAlY008Sxg=;
        b=U4ueEOzIRIXKSry4d0wELKdwl7ubv/gDhYAxqZ4bfrAMW6P8yB8h0jSlJyHlGSy8sX
         jz5VnOENKZVM0nFNqYLioPSrB9G2oBr4L09YcbloRxgzVFhIlZ3z4UfjqqhJyLLHVMOh
         HKIZrg4NWLU++mrpHo/Us2ZYCIQnee9V+GNuc+flqM5YJz6PQwpqp/sijKk/RzFQz2yA
         coAWFpo2c15kg8RMbSW9XWO8Y0s6edryn7cAAztwaGmLYrFYBxlNvs+Hpf5TaY4tYzb6
         HLn9ljm4+XhRbKBZN+6rfoYoB/uuFbZ8QMOoD4TcxEdFWeNgnfi1lJXpl1TqCWAclAx5
         1uvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748854161; x=1749458961;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ueucLa4g5UxYnhNyLx3PdzH6maubazXY/PAlY008Sxg=;
        b=J/8KNFHVjqUOSJHGXJXjHHN881YwkRax3xeerE8R/umXolErJxpRK8O9Po65GcWsVy
         V1ycY+Hq3jNvWLTH//BYuFICqcyrfMr+MNyOoqS5KwE4Tm3f7m53QurZiSCwrgBSIfh6
         LyPCwT/42qsp5f2bjGxtGcWmDlbT0elRUMsZgDoB82eTuEhVefyiu0E9XsfLm3bAqiKH
         UD/VQT3GMOPFyXafj/6jVq7b3JLMeYFLbd7JSMX5g1oKGAu/Mh2nlfGuAApFTpY/pMNn
         +RzhErUwBxTIeoCcaJ3Ipw+d5nW+liOnsVohAZDdEGOw9mIj0RFesedI1tL6HMDihe/r
         o3lQ==
X-Forwarded-Encrypted: i=1; AJvYcCWHRciQgQ8DM1TX+XG6xcRVSDxwaxKXkgLYmAMZBG9EtLnMGMBqDKERl6C81bQ6tepxLXWx/MDM5GqYbAM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwaBk5uIgYUjuC2XH5XjQsuo6JSTAjarx0apTGEVW500b5tbth6
	j2bGibyPtvTFxc3L1+XkDL2/iHA/RHphW1DdngbuePBXL5n1ELPjYAvwPQ2pFx7LOv4d7LLNw5s
	56xw/rNCy+dQEylX0Vg==
X-Google-Smtp-Source: AGHT+IGwV2vrcxIo5Q2RpW+trCcHldsbodGUccT9zIzTeWyylvgZD3WOXAZ8PP5PISNdOCSjG3wsqrOl4ppFW6E=
X-Received: from wrqi6.prod.google.com ([2002:a5d:4386:0:b0:3a4:ef93:98fe])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:40c8:b0:3a4:e56a:48c1 with SMTP id ffacd0b85a97d-3a4f7ab182bmr9525098f8f.55.1748854160649;
 Mon, 02 Jun 2025 01:49:20 -0700 (PDT)
Date: Mon, 2 Jun 2025 08:49:18 +0000
In-Reply-To: <20250601-borrow_impls-v1-0-e1caeb428db4@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250601-borrow_impls-v1-0-e1caeb428db4@nvidia.com>
Message-ID: <aD1ljiG3cFF1TS9P@google.com>
Subject: Re: [PATCH 0/4] rust: a few common Borrow/BorrowMut implementations
From: Alice Ryhl <aliceryhl@google.com>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Sun, Jun 01, 2025 at 12:00:38PM +0900, Alexandre Courbot wrote:
> The Borrow trait has multiple uses, one of them being to store either an
> owned value or a reference to it inside a generic container. This series
> adds these implementations for `Box`, `Arc`, `Vec`, and `CString`. I
> came across the need for this while experimenting with the scatterlist
> abstraction series [1].
> 
> This series provides just the `Borrow` and `BorrowMut` implementations,
> but another common use of `Borrow` in the standard library is to use the
> borrowed type for key lookups in collections. For this to work, a few
> consistency traits (`Eq`, `Hash`, and `Ord`) need to be implemented. I
> am not sure whether we want this on kernel types as well, but please let
> me know if we do and I will add them in the next revision.
> 
> [1] https://lore.kernel.org/rust-for-linux/DA9JTYA0EQU8.26M0ZX80FOBWY@nvidia.com/
> 
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
