Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA53D1DB958
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 04:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744864875; cv=none; b=AlUF7JekUnVf9ea4jiWjmA+IpbPHFQEVWM1/tUfnS9tDMyunahuX7owvgV/CJTD0TtPWK/sWOGUE6lRHe48ivCiaJbO0l9L7bpiEq992qaExkH1cr19lkkoGw3Ulyl5bfc3NrXW+nV1PStKZxbHTSFH1dV1iqJbVm1j7l4GY7Dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744864875; c=relaxed/simple;
	bh=SPeJW8O/RdyKgGzZdcpOtGY1BN9HvfKy7ydyqtr/PlM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nAvqAoqOrKu8VVmf1mw8XAJITj2DRAYAzyMVIeXKigFSyyAVJpXvrVk2ZpYbKCvKShY22x/W3yNDKuXKD5tHTm8UqM3YDeQum64Kbs+QjC3/fRBXU5CRCIHkEOpeFBmJ3/GS/7h4LmUCOo4j3zarVPU0MYnvZeY+FB5dmnSsV2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Wc9NaWYy; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Wc9NaWYy"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-30572effb26so282971a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 21:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744864872; x=1745469672; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=StTtcZEL8yuxE8J2mkGpzTNue0dDQ/MJGGswTzHY9b8=;
        b=Wc9NaWYydXVPhnfu4GiffbN/Qhn7zlGN4oeKKFZ3Wgm/Ep0W5+Nnsobc7nTwUZC4y+
         nsM6WpK1u7kP37SHWpZhje2qBLaq/kXOGctU692HUeA6efi3r7pKA4Eh5x9yZ796GVQH
         eD294EUGl4F/zSqzhntB/oqG6sbL6i9cb3MGFQ6b9zHYFHhRuMoEz0FIAib1gOlyIqKo
         1qBi6apBOA+UEZEMzq+14uzW6dhk0TIQd/gYTJe4YSE5cpSArKByQ63/CJpdoimnLtED
         5aHFFIj5JlxYRrsQBKPDAstYVR4/SZ5G+0J8cwo2pVIEppc0hZ4eA2DRHkhThWrrVm1L
         G5jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744864872; x=1745469672;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=StTtcZEL8yuxE8J2mkGpzTNue0dDQ/MJGGswTzHY9b8=;
        b=RxZ8Q18DYIv41+1oYEl2tGlw8X9lJ131BYNZBW1g0gry4z1+7jpfZntNGCwRJmZvBQ
         mL4T7JevYhuy+a11CY+i8qIfYpyaj2oXNMmZa6s8vEAMDzc44N8uL/G0QpO6qy0moYli
         JH8kM3gHJ+3nJgSeBsCMMZKrwWMly6/tENYM8xFZKq+GZT5L0AbUH4vvCbJnS52nIQHJ
         y0FjnNdzCZpMGDWlAvtQF7Wd7dNvz0BDPs3tHAoa2odEYmpH/56ndaLfp+752Si0D96y
         FfPw9zqYAYJj1Pial+I0ZNMzHC1s/UEt8w9aj0/G9nmG2H/+G2sMSVz1cJROWKuMuAiI
         jlMA==
X-Forwarded-Encrypted: i=1; AJvYcCUvdLP8UEWmwBwnvE4Owai26i1wKTFWGrE0VninhxBAK6L/Gq+t/GRMEoSaNIRMwtIg8E27bLS2T8D+M0g=@vger.kernel.org
X-Gm-Message-State: AOJu0YzsLjFACHkjZ/izeZWz7PpbUzvg0bhg54SO6ZabGo4YkouGgr6K
	uyjk+Uk78ynzJExkMdqGWsvsyV1qkU5TslanHe6oTlvQZiW43jlknNFISBeOk8A=
X-Gm-Gg: ASbGncudnyHkvVLkW9lPmK7yPzEXehEefNiIK20qqOdftpUchPM8abFKjP2rSLYCaHd
	MBgU2hFJyoUSkv6fWiH1L5k7+Jku3+iZ2Z6zyBJB09kw3RnSoZB19pzPklYYrmsbY+H39lhBHiB
	/4IcsO99bYamhznHMrEK6MJI+Mxxpy33lp4Yj5P56VZCkr6E7dt24QfsduF4sRRExZByscDMhZm
	ZzXowdL1hLEjx78+AfRI4xIRif+EGrnAVpWqEmk1QkUhd9W9WxXlRkgni5Tt4D7FcQ5Hl/Xg9hC
	n+c1XMMP8hn0rMdcZerDemu+Gi2Z7NP2ok5W0pT7kw==
X-Google-Smtp-Source: AGHT+IHSwNZXRlBErUquc9s/KXGJ/tJ0ZSJY//U3+xrEDFrzroEcRYfbd88YerCo8sKgIpeIi1M9yQ==
X-Received: by 2002:a17:90b:5864:b0:2fe:b470:dde4 with SMTP id 98e67ed59e1d1-30863f198c7mr8175815a91.12.1744864872142;
        Wed, 16 Apr 2025 21:41:12 -0700 (PDT)
Received: from localhost ([122.172.83.32])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-308613cb765sm2573852a91.43.2025.04.16.21.41.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 21:41:11 -0700 (PDT)
Date: Thu, 17 Apr 2025 10:11:09 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	patches@lists.linux.dev
Subject: Re: [PATCH] docs: rust: explain that `///` vs. `//` applies to
 private items too
Message-ID: <20250417044109.3enslespfaifjw7o@vireshk-i7>
References: <20250416112454.2503872-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416112454.2503872-1-ojeda@kernel.org>

On 16-04-25, 13:24, Miguel Ojeda wrote:
> Sometimes kernel developers use `//` for documenting private items,
> since those do not get rendered at the moment.
> 
> That is reasonable, but the intention behind `///` (and `//!`) vs. `//`
> is to convey the distinction between documentation and other kinds of
> comments, such as implementation details or TODOs.
> 
> It also increases consistency with the public items and thus e.g. allows
> to change visibility of an item with less changed involved.

                                            changes ?

> It is not just useful for human readers, but also tooling. For instance,
> we may want to eventually generate documentation for private items
> (perhaps as a toggle in the HTML UI). On top of that, `rustdoc` lints
> as usual for those, too, so we may want to do it even if we do not use
> the result.
> 
> Thus document this explicitly.

Reviewed-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
