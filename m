Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8611F210F53
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 16:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749660467; cv=none; b=qGTG2qaBb5/sQNm2t0oHvdhNIEV2t6KPfEzo7i7djHk3iFGZfwJvxDY/2lRcOMhBsxKnCAtXy4TDkKJ33KUlF9HR1yEX8p+Rljq8zFMzV+dnZYj3lxu1dIHrNeuyE0k4IO3JIPqoJ7T4jkGEDv2iDFvQxmyCVfU7vcxVNGIzPw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749660467; c=relaxed/simple;
	bh=B9MohXx4AXA4k+FrYa3U3UV1gxDApK8skRfveXG9R7s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RNaKjbsiwUAOaLsGLR/Kydw+wjmw8TSL29O3ou0WITXq7xOpmCVBbEzm4E9Ysgma21A1RyzCiPJbTqTYvKBxUi/70aCIfsqcedslmF4/0DXh+FmdtOLeo7ADsUwWQN87H8/b8hTnsiJ4u6E8uVeJic2WeCbXmDbECGmV0g2iSRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ags5zr5g; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ags5zr5g"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-45310223677so32167925e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 09:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749660464; x=1750265264; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aa2QXtJbJhCTINUZzXosw2JXgzKQuhbyrlej22q07Vo=;
        b=Ags5zr5g2o99dUpv8971TmqpooEfBJ4KFAbpmH5witIphzt/Fvz1muSpAuX1Evkrsr
         skMCAqrRkjDdykvh8EKIkW8ym7eyzXq0vZ4KO0WyPqgAPYTu4RW4Qo1Gn428luIy4VuR
         ux0DDRzOi8q1LdQ1kBZaPx//Fa/EOyvhzHGLvpKQkOMYMbiMd8sbcABpTt8Fngt/raSD
         ghYLwBfQMpjyQL6pI4A0gXICTOkcu4WCzuxmzvkNoMiycmL1ombhzpmO/5Zg+q5jhoia
         bj32WzEnR5Jkz8dFhHlCmSj5XKc0guVqb1mE48P72JC4jjTXojBPx4d1jJsNEE49Zs2w
         40uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749660464; x=1750265264;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aa2QXtJbJhCTINUZzXosw2JXgzKQuhbyrlej22q07Vo=;
        b=RaKzN3VRe7iP21NVN4jGaxgYrmfzeGDYaaLiUCxyladm5NZiF0kFm57UuNKyJKYA+J
         hb6QB0ft/+8dKByyv2d5HIWNXhaj61qIAvp5wf3Dmf70gdO3Gs6o1TeQnCDbx5jCAWmN
         b52I5QDRYuimKbuefFabJvFsK9FSZ5PszpYsmW0U+dTjiPJk2jUMj3OOP/1Z2O4tNwzw
         GBtFrri+sK3+Nx7hS8JPlYGogYDwS4YAmr5rWw5e8Kz5705lAMpGvKJAF1G14OusGsQh
         IN/p09AwO+IxWKpNwDp4YswMlfTS2h4A0d2KReEfabRFIZbz4ygIr8/mlseV1YWiX28m
         mp3w==
X-Forwarded-Encrypted: i=1; AJvYcCWiUGrB3Db328X7BjixjLGxtrpIKxOnwJj7WX4raxeBloxZuTpU2g5aY1v3a4UiXQHDbk2bxqPglrc+NZ8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxfFfJrjl648TdejjsX/76u1tktZV60oZ1MWN+F359czkn+qDvb
	t2p45XZS5WoZ9eI6JLXXhET9O6DvYdSWojZy6V6N81KECHrTT/LDzsJGFVr+Z71AZdY=
X-Gm-Gg: ASbGnctMjxJ4CMPs66lQuOc1rPVovHJN5pDyHZeLJwxRR0bgEVnDeIlHceKUouppODD
	epGXFvy3LLsbEXCSZxU/CZ5+jaRrP2UEgjTv2Cm460ZhwUweHwctKLTI1G2ZQJWvy/8rDQXHU32
	NivjZCQlQ9b/iTC8VPPItnDUYEi6r1vdnbGf2AMUOiuV6MMQBX4snI0BA+V5UKNkGMJf/ACCVnG
	4d9y1zkF9w9ILnFki+gxEdzhw6FBrWCgCWNKw4TiGlLg3GvhsEbt3bGMr5sFLC37gMlk2x+YTb8
	/pDMke+vqY8FDnL6kpXebC0MOadHk7fedKsdCjgBHEd3y26EypVAAq98NE7DWYZ96k9CdC7a65e
	onQ==
X-Google-Smtp-Source: AGHT+IG1I4wXbndzOO2svvUjoO/b5iTEize8HjYtNFgDUXR08tLDK+qTi10v6jyEAqbWH86+wPS7Jw==
X-Received: by 2002:a05:6000:25c2:b0:3a4:edf6:566b with SMTP id ffacd0b85a97d-3a5586c3069mr3191218f8f.6.1749660463878;
        Wed, 11 Jun 2025 09:47:43 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a53244f0cbsm15688709f8f.81.2025.06.11.09.47.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 09:47:43 -0700 (PDT)
Date: Wed, 11 Jun 2025 19:47:39 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: clang-built-linux <llvm@lists.linux.dev>,
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	lkft-triage@lists.linaro.org, Nathan Chancellor <nathan@kernel.org>,
	Anders Roxell <anders.roxell@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>, Sasha Levin <sashal@kernel.org>
Subject: Re: selftests/filesystem: clang warning null passed to a callee that
 requires a non-null argument [-Wnonnull]
Message-ID: <aEmzK5B4pbF5MZ6Y@stanley.mountain>
References: <CA+G9fYt-CMBGCFxV5ziP98upkeK2LBxkZRo7-0XN1G+zLtWK4A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+G9fYt-CMBGCFxV5ziP98upkeK2LBxkZRo7-0XN1G+zLtWK4A@mail.gmail.com>

This seems like a Clang bug, right?  The test for _Nullable is reversed
or something?

regards,
dan carpenter

On Thu, Jun 05, 2025 at 05:41:01PM +0530, Naresh Kamboju wrote:
> Regressions found on arm, arm64 and x86_64 building warnings with clang-20
> and clang-nightly started from Linux next-20250603
> 
> Regressions found on arm, arm64 and x86_64
>  - selftests/filesystem
> 
> Regression Analysis:
>  - New regression? Yes
>  - Reproducible? Yes
> 
> First seen on the next-20250603
> Good: next-20250530
> Bad:  next-20250603
> 
> Test regression: arm arm64 x86_64 clang warning null passed to a
> callee that requires a non-null argument [-Wnonnull]
> 
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> 
> ## Build warnings
> make[4]: Entering directory '/builds/linux/tools/testing/selftests/filesystems'
>   CC       devpts_pts
>   CC       file_stressor
>   CC       anon_inode_test
> anon_inode_test.c:45:37: warning: null passed to a callee that
> requires a non-null argument [-Wnonnull]
>    45 |         ASSERT_LT(execveat(fd_context, "", NULL, NULL,
> AT_EMPTY_PATH), 0);
>       |                                            ^~~~
> 
> ## Source
> * Kernel version: 6.15.0-next-20250605
> * Git tree: https://kernel.googlesource.com/pub/scm/linux/kernel/git/next/linux-next.git
> * Git sha: a0bea9e39035edc56a994630e6048c8a191a99d8
> * Toolchain: Debian clang version 21.0.0
> (++20250529012636+c474f8f2404d-1~exp1~20250529132821.1479)
> 
> ## Build
> * Test log: https://qa-reports.linaro.org/api/testruns/28651387/log_file/
> * Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/2xzM4wMl8SvuLKE3mw3csiuv3Jz/
> * Kernel config:
> https://storage.tuxsuite.com/public/linaro/lkft/builds/2xzM4wMl8SvuLKE3mw3csiuv3Jz/config
> 
> --
> Linaro LKFT
> https://lkft.linaro.org
