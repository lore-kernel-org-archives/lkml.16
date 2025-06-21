Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D2704C79
	for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 14:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750516410; cv=none; b=hCeL8OoUzUO/vkMyBk17gd5k+Fr2NA05ARKQ+r0IZkDVC8xyHQalgb5w1hWP5flwH3E4pu/OhBHSkHNrmT4mIzQoq+jNFqav0MEIrKIc1F/FtTLNnX6gXrawEJ7yBS7rF2Uv+sMxnp8f6w7cAcukEoVCD+DTsIKGfM0p5KpIvOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750516410; c=relaxed/simple;
	bh=I6d8/1VZec4f5AQUip3+X2NfvIMT+90kg5qi0SN+OVc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vBCxVw3nCoBkEEh1i1s1OiAQdK6R+qE/9o0yDJolx2Qrm228t7O0aj5L8APvQUKFxefmnMCBVGlMADfqj0Qv4b12BxBIedN4RRGfDHPH/07nmBDOF9cLLVy1Y8YzyLKCpMyOTBq9I3UIXPUds9Ky7pqfTKOdT8gvMAYCLq1d9vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aDGn0nXZ; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aDGn0nXZ"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-b31bca0a32bso1979877a12.2
        for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 07:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750516408; x=1751121208; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rpcV6fctoPHKkMmJOO7gDCJf9UFeAem7Es9ZNVW1blc=;
        b=aDGn0nXZIXlCHFBCmoCXqvqtK1pTT+YlIZh70mn8K/zH/+WGTOrRdBaSqUWep7Ac4E
         UTKpgZ+XqERV5PbWeEz+/UGJoPMsHtsjNIE0EgOO/MUi0K+C3o5F/aKEKKz1HjpLlmjo
         7ZR4bW5IyVFHdRmAEGUyZTsZecrAWHoG4a8lhq9eUzMrtPKSUi3vnmpil1AbQkCRWJ2L
         SWfotqjiAv1F8qZZsKwLV3cGqPxKkybq3I7YITy1g4aCs4iKhoKW1pEjJ66GS3q4nBqI
         Qvrsv7w9ZPVUwpTTGRO/2LHsahd2N0ph2xFPE9osMpelI98Y2WuXUwYgjRWJNcZMryVs
         b1pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750516408; x=1751121208;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rpcV6fctoPHKkMmJOO7gDCJf9UFeAem7Es9ZNVW1blc=;
        b=mB3PZrnBWuSXY7T45GEZhcTP106ZkkQM0joowc4uZHsUXnN3bnaKWngaAvDkrU6COx
         r5mwrXONB5hbg2eteQO4dRzUA/73Ir2C7cO7/G9J15Il91sHI/CcZbm/e9i3RFaHBRcp
         lYsosGzrJX9WqjUVp5aHkw+DiMQ+2an1cGdAUjpVNXiuRCexKSm0huSvnNP6fgahOkG2
         kPU43FhD2dp4yAEiFxhN4OwxJWdiYlwEfZ4oYoinvfnjr5V39SkhILYEFiDsWMlOxJBS
         8PLepBkva66TBGP0nw1AwqpGjbaSi/+nOCh0/SklIBO3GkKEf8DVyf8j7ZRoyNBc+INe
         6kvQ==
X-Forwarded-Encrypted: i=1; AJvYcCXrJqxvbII1AIItScmT7BhFtoLD7b0lkqTpaXeJXc/2yGsMVZeOoNgDiw99BSnCxrFky3J2Gn9cTKMQxOM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQSH6R1UUFk+giI8+KaTMdveRq9C6OloJ6HBH7pTMb5ERH2f3u
	Ch+EIXxK/uG5fzg1Vf3hxwBOnUEHftu5lQu7s4OwNwxc6H2SnXTYGRvuPoqXQA==
X-Gm-Gg: ASbGnctK5VSZRQwi6qRbakMJ1R1JNKd+qCYs9o+LHlx1pBNx7rJfFrWssVmRmEUU83k
	pBe8dlzVUSmvzVFCs2nfQ4VSWdVTufavFDNBLeY7H8Cazc5q8sK9DA/6i863eegf16U36UVOIjB
	XIKm/G9KlQATvC0YjktKmlu3xfnA5NrPwWahh12ZpZQuEqISSIebkomqg4VgbP5vSSzqGFYXB1Y
	93mi4G7u2mnYySFP/UxfZhXSvCqZCaYOiuYuwSBT//ptlUP7Cw7cjrhpfTtDSAYTXX4W5JOFtKF
	OMa2MRr5EfQcOXZ9cJ0dZicBOq8Fr82csKNtcmTEpJxIfxs5aQrctlY6rR6xcR5qcu8KIpnf
X-Google-Smtp-Source: AGHT+IEa1dzclDb2tuusdyRFUEN+RVm3ocXALNNj4v2dS5L9ixXeDKVBkqE/mg1/e/SCGi0mCloBfg==
X-Received: by 2002:a17:90b:3505:b0:312:959:dc49 with SMTP id 98e67ed59e1d1-3159d642a58mr10688811a91.13.1750516408260;
        Sat, 21 Jun 2025 07:33:28 -0700 (PDT)
Received: from localhost ([216.228.127.128])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3159df93ad9sm3999598a91.21.2025.06.21.07.33.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jun 2025 07:33:27 -0700 (PDT)
Date: Sat, 21 Jun 2025 10:33:25 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Yunhui Cui <cuiyunhui@bytedance.com>
Cc: linux@rasmusvillemoes.dk, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	dennis@kernel.org, tj@kernel.org, cl@gentwo.org, linux-mm@kvack.org
Subject: Re: [PATCH RFC 1/2] riscv: remove irqflags.h inclusion in
 asm/bitops.h
Message-ID: <aFbCtb2oWxPbq1SN@yury>
References: <20250618034328.21904-1-cuiyunhui@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250618034328.21904-1-cuiyunhui@bytedance.com>

On Wed, Jun 18, 2025 at 11:43:27AM +0800, Yunhui Cui wrote:
> The arch/riscv/include/asm/bitops.h does not functionally require
> including /linux/irqflags.h. Additionally, adding
> arch/riscv/include/asm/percpu.h causes a circular inclusion:
> kernel/bounds.c
> ->include/linux/log2.h
> ->include/linux/bitops.h
> ->arch/riscv/include/asm/bitops.h
> ->include/linux/irqflags.h
> ->include/linux/find.h
> ->return val ? __ffs(val) : size;
> ->arch/riscv/include/asm/bitops.h
> 
> The compilation log is as follows:
> CC      kernel/bounds.s
> In file included from ./include/linux/bitmap.h:11,
>                from ./include/linux/cpumask.h:12,
>                from ./arch/riscv/include/asm/processor.h:55,
>                from ./arch/riscv/include/asm/thread_info.h:42,
>                from ./include/linux/thread_info.h:60,
>                from ./include/asm-generic/preempt.h:5,
>                from ./arch/riscv/include/generated/asm/preempt.h:1,
>                from ./include/linux/preempt.h:79,
>                from ./arch/riscv/include/asm/percpu.h:8,
>                from ./include/linux/irqflags.h:19,
>                from ./arch/riscv/include/asm/bitops.h:14,
>                from ./include/linux/bitops.h:68,
>                from ./include/linux/log2.h:12,
>                from kernel/bounds.c:13:
> ./include/linux/find.h: In function 'find_next_bit':
> ./include/linux/find.h:66:30: error: implicit declaration of function '__ffs' [-Wimplicit-function-declaration]
>    66 |                 return val ? __ffs(val) : size;
>       |                              ^~~~~
> 
> Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>

Is this patch a prerequisite for #2 or it fixes build on master for
you?

If fixes broken build, I'll take it and send an -rc pull request.
Otherwise, please work with RISC-V maintainers to move them together.

Thanks,
Yury
