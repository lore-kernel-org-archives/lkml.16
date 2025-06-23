Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6C061CD0C
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 04:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750652564; cv=none; b=VfJMn2CmijpcUy3pR7o+/ziJny6way4jB21ctIUFcKAVEl/B/hw7un3boeFfWhK1zrx8OBfRcT0y2yTsFfYLO7/BxvMslq/382QbGMzuoc8kybe+XN4TXP2yELdrVC65A5GYldtlO4zVgkgszhKoADxfxwOFDA1ddZBvYIRlHmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750652564; c=relaxed/simple;
	bh=5st921uDKTkKgU9TnR9YHhTWnF9x4IKBuHUsPF/rAnw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LSx+QDTyQ3lDAFHIN4p+BtjzSTOwu3Bjo+wfbfschxwU+9D2k2IpuVK7U3oCHD4SSqkhfAQp7n2pmc6InvUiBPob2mq86QiLa1954M0TGLu/zF964ScUrJtm4L9nSiHHXvwWryOnzPIDzlr1cd7XPSOgNjqgGxgdadObIGekFFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RNIz7TiT; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RNIz7TiT"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7424ccbef4eso2762873b3a.2
        for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 21:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750652562; x=1751257362; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5le86o5MqelUxj2e52/BUzqyGfWPs3z+KMJ1+yNcPzE=;
        b=RNIz7TiTIAXBb2+QIkWrigkzTdXFQwbQUtb553PGcs75/uylo91RYCbTX2F+NzkbjI
         KwPKJ0u0HOB/JAfsNwq6O3Zi0E+f4onqRi5IBCEe4z+AOzCg/JYs5QE4DLDPGnVF0xGe
         TCOWdwtnlfCmN9lnuwjtWc7gPIfZyTW3pIlp/82VALG1ImZK7ixKWzKqy/RdAMWQZkfb
         cqEyKZPGkbITuTCDHulW2iUD+yD6ifhqwIk50bsz8nggK48IAg6O0JJVP2XZA619z22f
         OvOwrSnLHU2OlYS3XVAKADami5u55iUC7K1S2S/t0KXE1E6qMVELi3YCKqs5mRzNrY41
         8Xkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750652562; x=1751257362;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5le86o5MqelUxj2e52/BUzqyGfWPs3z+KMJ1+yNcPzE=;
        b=tRe01PzvdM4/GRlITD3xd5QdjhwRSLie3CO/BV+L2gffM4s7nDZ/bonDYxwnFtLier
         9x4JaGZFXZmv75alHtn2ujY7ZD/207c9iOBM+3+ta6QK8dUaXn7RPUC5FQgm5ZGj4pxn
         GSizd3AxHPRjs8m1JEgvdIjP/vA51K3oBIM0bL62iR9DR6NdcVodCQOuuqgStd0vMXfI
         4WnLjcr0msYMTbNZp0iy7SsXj8Bd2+i611LVVormXVfbZHZTgUcR80dvWHw3ebgG2JJb
         nFaUxUrjaHu6ajC51qV6dctm7ZnG2UyXlAyyW/7T1jXnIiaNvc70KywD+7NlgcbUgzK7
         MGBw==
X-Forwarded-Encrypted: i=1; AJvYcCUyglqWF9f1nxss8FKclAdXa1dDqrGu8LUYv7L2UlK1/Z2vPVx7+OJC7sf2JJiOouufNj8U60F6QZMucPQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLjhL8uWj8PBfC4TBVOZtTdhEKiPt22HhSPUtOPx4P41RJ3Poj
	DFfdH5FMvI2hC1idLIRoC12hlsjA31e4KXDRI2jO7P+t8nIb7Z+OOkgk4NtblNkgb5g=
X-Gm-Gg: ASbGncv9ncFEyYOTnbo1+TmGDPxik6Ms7e0bPHkpAfbJnFavUxxIKF8JBiRJIGI72qG
	2qNCDyZsQz3Li3NpH1cPKNk5K6njqQAWSdFI72bKJA2BFOOR45I7+vpScltD4Ay2gRGKWzrGD3x
	z3B6/NODQy5TPmvKufHV2zU+vDNqQN7ZMcvO40/CCDFaRvvgz94VWTPPTD4DHnZJLXRGJWj3XN6
	4nYHCEaDEKibHYre/+PTIgUaWeHQsEOIBni76ffSbnl28pgbRr61Vb7CtD8nc2KqUEfMKwDDLKa
	hUsKxe+Jhg/Gku0vGNKcHdWZ5zTq6AXE1nvZJVcLVD8SD9i1TnPnZRIr8vvD//HlBi+DMLf48w=
	=
X-Google-Smtp-Source: AGHT+IE5TuInEJuZ3oFFcgdcOzCV6/0HecXdCRlo90x7islTcM4Alv43ENFRCRPNZUw0wjGIr3K+EQ==
X-Received: by 2002:a05:6a20:729d:b0:21d:375a:ee33 with SMTP id adf61e73a8af0-22026e8226amr18176424637.9.1750652562097;
        Sun, 22 Jun 2025 21:22:42 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7490a6743basm7412269b3a.142.2025.06.22.21.22.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jun 2025 21:22:41 -0700 (PDT)
Date: Mon, 23 Jun 2025 09:52:39 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Abhinav Ananthu <abhinav.ogl@gmail.com>
Cc: vireshk@kernel.org, nm@ti.com, sboyd@kernel.org, ojeda@kernel.org,
	alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org,
	aliceryhl@google.com, tmgross@umich.edu, dakr@kernel.org,
	linux-pm@vger.kernel.org, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: opp: use c_* types via kernel prelude
Message-ID: <20250623042239.4sea6d6lmamfrc4w@vireshk-i7>
References: <20250620095920.20765-1-abhinav.ogl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250620095920.20765-1-abhinav.ogl@gmail.com>

On 20-06-25, 15:29, Abhinav Ananthu wrote:
> Update OPP FFI callback signatures to use `c_int` from the `kernel::prelude`,
> instead of accessing it via `kernel::ffi::c_int`.
> 
> Although these types are defined in a crate named `ffi`, they are re-exported
> via the `kernel::prelude` and should be used from there. This aligns with the
> Rust-for-Linux coding guidelines and ensures ABI correctness when interfacing
> with C code.
> 
> Signed-off-by: Abhinav Ananthu <abhinav.ogl@gmail.com>
> Suggested-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
>  rust/kernel/opp.rs | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Applied. Thanks.

-- 
viresh
