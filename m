Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B1971990CD
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 09:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744104106; cv=none; b=sKx7n6g0HryGzVS6ZKelqC0oSOfvma7mCa9/lVjEV6SF71encdCoM7cpcwpiaSMQpOq7Ic7LtPNOodq3aJpjYFKyP8jcPveZ8gOMUM2QXtm2aeuXUWBtuNd97di8oEnTwxH9TvTmGhuxS8HAEyoIYQAqmuJP+AmHIr/dmEsOhdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744104106; c=relaxed/simple;
	bh=rMXmOoLfApqdyZIGTug2i9Lbecgrlq9hnHfN6wSw/hI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vvqabg8ZZyW6rVLgcWcQiPrEay5v142uKNiDM2JxmS45BvtCgMVMkBPmW5UMrG1DjDe1wFxhE9GMkWHaKA8nWoKNEQzXktkr/63Kg23CwcSuuaSnAWP+YWGar7crJPHPNmGsoCulZbBW9TF4iFme902iShr0ciywzovQIpE4AOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bc1N7/Si; arc=none smtp.client-ip=209.85.167.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bc1N7/Si"
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-3fa58dc37c5so3198648b6e.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 02:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744104104; x=1744708904; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Wzntjn/7W/TUVu1yIL6azEufCUdgmp744dp2mHH9/5A=;
        b=Bc1N7/Si68sdnPvJ7oeFzkD2HNj+FICqYkfSsfBqaWmz1NMPVnrhdWZWoZ2cvV/K86
         dUVv9cOS7CDe4K2m6KkDvboDdGbR7n8HIrHIkPzl2ytuQOA0+W2xDsY2YaLsQnztYVuK
         BRURvgJeepKnq63JZ3JA9TeIv1zUF7JGr7yI9og2++qEISZgedXg6mP6yz2S5gw8cja7
         /kcmFK3zsHKR+L4ym6Qo8mboniboTelq4EGk4M1az0aHpe2AfUJs+S4qzQYghreD35ON
         UFzbK0JtBQjuv7fPi3sIiSHdbhxr1FSy2GCTkUnMmXR7czrcN4mqvgorKUOyo8eD0P7W
         7H8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744104104; x=1744708904;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wzntjn/7W/TUVu1yIL6azEufCUdgmp744dp2mHH9/5A=;
        b=Yee1S062fob2IrzB335a0OhzFn7DOXn8MBjENb30NlJaagigu6MYdV5s0jEq3w5c2L
         VrkviRdamy8nc98OZ/1e/qTay+FQylysUXfpbGMkBI2KPnxD7fS9yZSbqrPBqGYobQr4
         t53MFp1f7KkgLxRYk+WuxjdYWvQr6mfEubi+3UUXf7R5adGLgZehlJeYckMy30cD8svv
         gKgPH8nqt/x6gBthUB7y/M1DozcwWHpOOacigTpsMQUvddqod+VatbIgiod7LOvLPgM5
         Gn0n9SbX4G/7+G97E8yT9Yej5NMXQwCsBkCg0JIPhqeED2PuUE4z2JaeRDSw4GL1a7DT
         TiUg==
X-Forwarded-Encrypted: i=1; AJvYcCVmquXJnGfljLaLidBbgAvSMhR/cEFjpuweXUGpoWtFZtBAtBlyVQQryWXPzMyKsbsW4TF8qNdjUJLcT5g=@vger.kernel.org
X-Gm-Message-State: AOJu0YyqYwS37aDqtzIm5M8cUbjWz8JwXNnD4lpSf+8bICOYEGLinQiN
	2FmTu8EW6knTnfBQpllry7ZZL5u/lz9qgp85N18bw0ow3tDC7pJemsg7kQ4Y+kVJtxGoelVc2vU
	OCAVSD5ZKm2/1dXHvi/uRIDwBVaw=
X-Gm-Gg: ASbGncvxhNoleWYn4iTXkFz4XhZu1T9WJCFhJeYtthKYZ/H6A37y/Sduwxapta5SSFN
	bAE0tSpvu+NzN9okOL9KFDpZG2DYuvwyfSLvdteT3oXutWD3Mia3nfZtbLxqacXnvVYZEdoxqvP
	78qrPoruNQMmqvhvYZ98HbV9Ay7Dv3P4Tv4ahGZtZZ9J+ouZHoR51WhasBeg==
X-Google-Smtp-Source: AGHT+IH97Pkwh1nG4fNaueAH8o5pGsvE76ZIPhgAetjxFJ5CX2nbrQLJns4NEAaTWmlQ6qIe+Pw+8Bxj2G0HpWk9KX8=
X-Received: by 2002:a05:6808:1185:b0:3f7:d442:1986 with SMTP id
 5614622812f47-40067d11723mr1748319b6e.1.1744104104404; Tue, 08 Apr 2025
 02:21:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250408084301.68186-1-zhangchunyan@iscas.ac.cn>
In-Reply-To: <20250408084301.68186-1-zhangchunyan@iscas.ac.cn>
From: Chunyan Zhang <zhang.lyra@gmail.com>
Date: Tue, 8 Apr 2025 17:21:08 +0800
X-Gm-Features: ATxdqUF5IRWgtHm9hj-QRVwRgetDyXHPLdYh4eqoUgr4I6hFN9twbtwwm3-H1a0
Message-ID: <CAAfSe-vx-fvqk1pxp0rCU70Wq6HHH52k9OZaCO8O+-Sw7-yGCg@mail.gmail.com>
Subject: Re: [PATCH V6 0/2] riscv: mm: Add soft-dirty and uffd-wp support
To: Chunyan Zhang <zhangchunyan@iscas.ac.cn>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Andrew Morton <akpm@linux-foundation.org>, 
	Alexandre Ghiti <alex@ghiti.fr>, Deepak Gupta <debug@rivosinc.com>, Ved Shanbhogue <ved@rivosinc.com>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 8 Apr 2025 at 16:43, Chunyan Zhang <zhangchunyan@iscas.ac.cn> wrote:
>
> This patchset adds soft dirty and userfaultfd write protect tracking
> support for RISC-V.
>
> This patchset has been tested with kselftest mm suite in which soft-dirty,
> madv_populate, test_unmerge_uffd_wp, and uffd-unit-tests run and pass,
> and no regressions are observed in any of the other tests.
>
> This patchset applies on top of v6.15-rc1.
>
> V6:
> - Changes to use bits 59-60 which are supported by extension Svrsw60t59b [1]
>   for soft dirty and userfaultfd write protect tracking.

This should be an RFC patchset, we should be able to enable these two
features only when the extension Svrsw60t59b is valid, I will add that
check in the next version of patchset.

Thanks,
Chunyan

>
> V5:
> - Fixed typos and corrected some words in Kconfig and commit message;
> - Removed pte_wrprotect() from pte_swp_mkuffd_wp(), this is a copy-paste error;
> - Added Alex's Reviewed-by tag in patch 2.
>
> V4:
> - Added bit(4) descriptions into "Format of swap PTE".
>
> V3:
> - Fixed the issue reported by kernel test irobot <lkp@intel.com>.
>
> V1 -> V2:
> - Add uffd-wp supported;
> - Make soft-dirty uffd-wp and devmap mutually exclusive which all use the same PTE bit;
> - Add test results of CRIU in the cover-letter.
>
> [1] https://github.com/riscv/Svrsw60t59b.git
>
> Chunyan Zhang (2):
>   riscv: mm: Add soft-dirty page tracking support
>   riscv: mm: Add uffd write-protect support
>
>  arch/riscv/Kconfig                    |   2 +
>  arch/riscv/include/asm/pgtable-bits.h |  29 ++++++
>  arch/riscv/include/asm/pgtable.h      | 136 +++++++++++++++++++++++++-
>  3 files changed, 165 insertions(+), 2 deletions(-)
>
> --
> 2.34.1
>
