Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01ADE228CBE
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 23:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750721035; cv=none; b=QyPwoxIwL/k7JUeb+bt08sOU3izOabJOB9o0gEryv2HTZ/H/PIKWPbwNf9buYuRc2ThxPcb3/YSYIrVHYLncMYhKQcMBf71bAFlb7mH2hp/cq6TF1bZcFzesQDn5ulGTxqdx81v+9tQROCwLuKJemDrG6SdzANa0M/ZLZeEdTcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750721035; c=relaxed/simple;
	bh=vP5+0drxEJoLf9RIzIy0U7Sua2x4szgGO0Sc8NDmFPY=;
	h=Date:Subject:In-Reply-To:CC:From:To:Message-ID:Mime-Version:
	 Content-Type; b=ciQyUMKwPWdd9HmfgcO9DRRH0QZZ/ccsRih8df6tJqhNBKf4DFUpxlDp8zy+AnTmWnM8GoTYN5DlhFw5vLXIpAWcg0DItpMI1WdW5MRD9/oweHSY7Y9qpP2vtkTl686NgSHBR9YPQIwElnuitnNywZDHXCCZprO1pALTzKsQ/4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com; spf=pass smtp.mailfrom=dabbelt.com; dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b=JwfU6mSU; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b="JwfU6mSU"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7490702fc7cso2537180b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 16:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1750721033; x=1751325833; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IgHNU976VfrOwOD3ulvb2vI7O/PDlbsrK2gzKqrmtPs=;
        b=JwfU6mSUsC5mp9UqArTdPwKYB01CULbnSZqskytJbCWAESCTo/Om2jgCjth64lfuwv
         QY7Invz4kz7w8wA1QnVhIB1zfvpsylExkZToowQleJ8Dm4S9za+I1ulsC1ujc7HOxMdm
         PI/GC1G8svz/s7RSqbwdESd9mSbnnw3Xm3a/vhoeHo37t0BbQ9H/MEmfCNdjkgpQDLl3
         hii2WYCXQ+CqyXjVZcLHqv2Y1qWaqjastaCfCsxwo7h8haE42j9i8BrTql/62+Ioxvyg
         i6KLHsqDgBNx/zNymf7LTo1y4vHC4i+m5zO/CZbbM+S/spcOUl8xKixEsqk3MyZbI0e7
         enIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750721033; x=1751325833;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IgHNU976VfrOwOD3ulvb2vI7O/PDlbsrK2gzKqrmtPs=;
        b=G4I69EIwgZbPv8EadSyt0aKDar6APp2CZ32hL1RZ5eJEpzS7fRLngxmeZta6ZLzOxK
         QwyHPAr75kSQdI0rGIjr52WCsf82lj8cgRPwjI1KujBT/8Fr64m9jwuzaEF9G0IXkWHZ
         bhFgCiq+k7vOfj40bsNNvlpPG9VH8tJ0RullJMGJ0D0/PKJSZgYWFnSvb75wRXsC7je4
         9cC9n4cZoGBFgeynSnupJA4KFMv03Ri29aSsQVQl5pah42oZEUbWmT+NkbowVMc1g6fx
         nKLYHsfPbLnNwOFAHoFga8KnpCGgdQTb2aFQPeZgA4fNCOZ7/87gZ2ALWSBKRCwJt3i3
         ybIA==
X-Forwarded-Encrypted: i=1; AJvYcCWsV4u25lVaLtVdCYQxbtBZIRiJqJrmR1IV6rjxslKt3YI2HO/mEp/kmLmu6p0o0Ci9XhSxMRt8PnVhTwQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6ubxebT9vQhmQj/FIQYqOcD/sKiOZinOgId2ZcZxPBa6aVbp7
	UFUNT5R5gHGh3Zi/xSOZK6hE9d7BOs9oGTacCceLtAIFvVqe7fEevnXEbm2bYexRmYE=
X-Gm-Gg: ASbGncuK+jea+rjpGEHJyYaKJoLhVONKUhUVTBtzaM0Hg3zoD/MrUu9LRmNCxqXBmf5
	q9KzX3IyTxNRon4PQciK0TeMEAA8zEbGrp3AWzQL4rsbCwBglcpceArfIi4R1eZ04QWMxvtOzSk
	nlbnUawWFfALE9jXOeUKJ/NxbvVgt+E9qHkkaq/Bcm8xTYMo91Ze4g83J2v8WAjxo1MwyFaypwf
	yRUIMhDlOvLQPnniffwkdpPCwSonxWDcC/LUoOX/APv0E8Z9y3DpuGiY2tiMqiXENEbZQna7aAX
	DEERqtn4iEIee7POZER6k7FlckCFjmkUW9W7oQhG55nS/iBinCYyunYhUQEf
X-Google-Smtp-Source: AGHT+IGv2SJju6xgRevma8Cx/i6GeIJiS1WAChIRaAqec6j+z8o+1u/uy+Lb1YfHwJThHoUvyYrxYQ==
X-Received: by 2002:a05:6a00:3cd4:b0:748:e38d:fecc with SMTP id d2e1a72fcca58-7490d71c76amr16954440b3a.22.1750721033150;
        Mon, 23 Jun 2025 16:23:53 -0700 (PDT)
Received: from localhost ([2620:10d:c090:500::4:8d10])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-749b5e211d1sm243166b3a.44.2025.06.23.16.23.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 16:23:52 -0700 (PDT)
Date: Mon, 23 Jun 2025 16:23:52 -0700 (PDT)
X-Google-Original-Date: Mon, 23 Jun 2025 16:23:50 PDT (-0700)
Subject:     Re: [PATCH v2 5/9] lib/crypto: riscv: move arch/riscv/lib/crypto/ into lib/crypto/
In-Reply-To: <20250619191908.134235-6-ebiggers@kernel.org>
CC: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, Jason@zx2c4.com,
  Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
  linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
  sparclinux@vger.kernel.org, x86@kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: ebiggers@kernel.org
Message-ID: <mhng-8FC37478-859D-40EA-A0E9-3EA86429DC53@palmerdabbelt-mac>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On Thu, 19 Jun 2025 12:19:04 PDT (-0700), ebiggers@kernel.org wrote:
> From: Eric Biggers <ebiggers@google.com>
>
> Move the contents of arch/riscv/lib/crypto/ into lib/crypto/riscv/.
>
> The new code organization makes a lot more sense for how this code
> actually works and is developed.  In particular, it makes it possible to
> build each algorithm as a single module, with better inlining and dead
> code elimination.  For a more detailed explanation, see the patchset
> which did this for the CRC library code:
> https://lore.kernel.org/r/20250607200454.73587-1-ebiggers@kernel.org/.
> Also see the patchset which did this for SHA-512:
> https://lore.kernel.org/linux-crypto/20250616014019.415791-1-ebiggers@kernel.org/
>
> This is just a preparatory commit, which does the move to get the files
> into their new location but keeps them building the same way as before.
> Later commits will make the actual improvements to the way the
> arch-optimized code is integrated for each algorithm.
>
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---
>  arch/riscv/lib/Makefile                                         | 1 -
>  lib/crypto/Kconfig                                              | 2 +-
>  lib/crypto/Makefile                                             | 1 +
>  {arch/riscv/lib/crypto => lib/crypto/riscv}/Kconfig             | 0
>  {arch/riscv/lib/crypto => lib/crypto/riscv}/Makefile            | 0
>  .../riscv/lib/crypto => lib/crypto/riscv}/chacha-riscv64-glue.c | 0
>  .../riscv/lib/crypto => lib/crypto/riscv}/chacha-riscv64-zvkb.S | 0
>  .../crypto/riscv}/sha256-riscv64-zvknha_or_zvknhb-zvkb.S        | 0
>  {arch/riscv/lib/crypto => lib/crypto/riscv}/sha256.c            | 0
>  9 files changed, 2 insertions(+), 2 deletions(-)
>  rename {arch/riscv/lib/crypto => lib/crypto/riscv}/Kconfig (100%)
>  rename {arch/riscv/lib/crypto => lib/crypto/riscv}/Makefile (100%)
>  rename {arch/riscv/lib/crypto => lib/crypto/riscv}/chacha-riscv64-glue.c (100%)
>  rename {arch/riscv/lib/crypto => lib/crypto/riscv}/chacha-riscv64-zvkb.S (100%)
>  rename {arch/riscv/lib/crypto => lib/crypto/riscv}/sha256-riscv64-zvknha_or_zvknhb-zvkb.S (100%)
>  rename {arch/riscv/lib/crypto => lib/crypto/riscv}/sha256.c (100%)

I'm assuming you want to keep these all together.

Acked-by: Palmer Dabbelt <palmer@dabbelt.com>

Thanks!
