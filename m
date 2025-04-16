Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 252C9187553
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 13:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744810140; cv=none; b=a5rLpGOj/21Z7BxqdDMZ8nZG2DNnQ8x+aukW6uqLH4aNe/Wg9676hJSEsyAmbczRqmpWkate1J3Mr5sRGe6/qyrpdpkza7c/6DwlhocHoCMwfkhEMyQaMEzJkA74r6mDGRCe/wMalWsgHXPYoyJje/S8k1caMwKm3mv6lzqdjqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744810140; c=relaxed/simple;
	bh=ZVJBGbbDNJ4zOnp9Im0juKuDL3UdrCHlHhesvSkdjwA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=WY/vz+GRzZ3dcJIRGzvB2UUYdSoDSWuUzNH9/6uvXCJiGEDd+3Hn1/Q04HNojEus/Owu1pGMDTf/e/2XbxdlX4PnYQbJmIVCSYdTQUhzbpT51Mo8iqFOJY7TBjUhHx0+VPpfteuDKsxIC3mUowYGE3m/6KsYc0PwJNtpOdlvgrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DBQOtUYH; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DBQOtUYH"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-39ee54d5a00so391581f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 06:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744810137; x=1745414937; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=u81oNAdu49vrXOlbtVMx6BBHkvoR1t20Iu3dXwAhN/A=;
        b=DBQOtUYH5V5yK+TvOL/yhmBeoj3qzyJi6ORz0NuNNB7OK0uvdwU8/BD74p082lTox2
         tF+KdAnDDuRMF3+I61bUz/vIVRGCKjzZ495HAWLip829NtQ28sFKgdy0oQskPF4ytoPD
         NyGtGAaaSveIxh1LvMtmwJb3tykdifBDSxfJoI8X3WdKQLERnZeUFWvpiw8k5z4WXqhq
         hkw2SJ6NE4MzLkLrWvPuc/6qDS/5VOZQPiSBG1t27936xccJW1u1HORldAs98pdB95/I
         p7MfWpZekPwxle+ZPMeUHFRobcDGdGJ47xyXwAvzzlGiyqmJ2IMlqd4/U36fyCpwk+n4
         7sDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744810137; x=1745414937;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u81oNAdu49vrXOlbtVMx6BBHkvoR1t20Iu3dXwAhN/A=;
        b=GF+wUi/K9wrz1b5sjkpgei1vnYLikIEBMQxsmGDf79sQgMPFkGj09Nj0f1Qgf5BfP2
         HHivzMTK2jEOop9OLWc5PoQaaMwo7lDcrJIXEo3uxCAXdA05tPyJAKCZU0Zpe0Mvrpj2
         xP2OwNpy+mKz/5Mo5MLJ0xuDoe7lDq4rPJmHt0eGAIdnrcgPvCPFQePpL7HNJa01THXB
         jVowKXwguYxZnch/sh7hEbcy8h/XC+ItLjfhxNomnnYysvS1lJ/FHmcAcLZatWzk1Cne
         MXM3NELuXWIPbYPkxsyISeT8APTemJP9aHqPX2rG3+mCZNgl0nrAjpZL14Y/llSDUEe0
         /SFw==
X-Forwarded-Encrypted: i=1; AJvYcCVl6kapS0uGFtjA8+WixfffjKq+nitKruNtyL45HuGqWMzhJqEkEGSkUqXMofmHCBtM7kv6JZXGQxElnd4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTfSapf9tI2j95vKjrhzSPWW9pjlQqPenuj9KzoWBV5KZHdg4X
	ZPAKHJHiH4o35mQEjkIk69lv8Hfnd6h2yKfjnMceKtuuri+Nv780ZvNS6zH9iFGcNwkSP/pt9p5
	EbocLtgKd0lMWjQ==
X-Google-Smtp-Source: AGHT+IG9tHRn4kQG7O4PYIe6bQiZU/BwZMZlgMYNzuNvEr4SHrv8sdo9mrdCS3klZTLkNKvguqHeCRRXkHnjB4s=
X-Received: from wmbfl14.prod.google.com ([2002:a05:600c:b8e:b0:440:602a:960f])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:21c4:b0:39c:1410:6c20 with SMTP id ffacd0b85a97d-39ee5b8bd00mr1589935f8f.45.1744810137500;
 Wed, 16 Apr 2025 06:28:57 -0700 (PDT)
Date: Wed, 16 Apr 2025 13:28:55 +0000
In-Reply-To: <20250407-vec-set-len-v3-0-c5da0d03216e@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250407-vec-set-len-v3-0-c5da0d03216e@gmail.com>
Message-ID: <Z_-wlwaiJNsSZbCC@google.com>
Subject: Re: [PATCH v3 0/4] rust: alloc: split `Vec::set_len` into `Vec::{inc,dec}_len`
From: Alice Ryhl <aliceryhl@google.com>
To: Tamir Duberstein <tamird@gmail.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Andrew Ballance <andrewjballance@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Mon, Apr 07, 2025 at 10:52:30AM -0400, Tamir Duberstein wrote:
> This series is the product of a discussion[0] on the safety requirements
> of `set_len`.
> 
> Link: https://lore.kernel.org/all/20250315154436.65065-1-dakr@kernel.org/ [0]
> Link: https://lore.kernel.org/all/20250316111644.154602-2-andrewjballance@gmail.com/ [1]
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>

I'm still wondering if the divergence from upstream alloc is worth it...
but the code is okay.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
