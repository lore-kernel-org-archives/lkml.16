Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CCB8189B91
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 03:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745551873; cv=none; b=sNVkqOaOHlblJZj8/YkehAqfR7wyhEiNxWVyYzXPABfojX4rPmy0FboN0QmRA5W9SPfhscqm1KkRaLaG/O5OowGrqw/F8i0FlwnUBg0Bcb2iNc6YTshJaVh4fuo/LNt+P4xzKfqHo5S6+hEEUlsU440UdZ2AqrXsgFKiN8BhhD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745551873; c=relaxed/simple;
	bh=jrRGhxPyf95ypPJHo2BAQFIRKdPXSpjIpa1ctUMjIXA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ouh6RzCKMkW+YqYH8Ncp4vO3nleU6AEwDXdSxU71ry46vHUiGGydavCMIsdv87RiVeeUMdPGquDWd0Bdx5Ax7BNA9tq/eqvSG3hi6W35DsnRu9PJ7EpWEt6ZQ+sUhGiZFnngFqJhCfT2zGUj+TvK+MpUnMhbcdjadA3cfGbTNFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=cCk29Fz1; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="cCk29Fz1"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5f4d0da2d2cso3497691a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 20:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1745551867; x=1746156667; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3+X7UpAVVUSxTxgawTFy/Rtqo3IuG46uus58xF7sJ7Y=;
        b=cCk29Fz1C0hLHkCm5qwn8DfPUw7FIYEPDCk84a3H0C/KXpd2feEgPSUAaZRd+AlXzs
         gha19n5arA0FEYpqeN2TJyoma+NLCg77DEev7AtziC0PCYC6owNAXZFFEwPr7pgUlJzw
         PzJNmbpqwYsMU8eJQhhNQvLRgWrLtTHlCzIgM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745551867; x=1746156667;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3+X7UpAVVUSxTxgawTFy/Rtqo3IuG46uus58xF7sJ7Y=;
        b=un/2pZgfF2PXPo8y2ETogYkb7QHKaHGht+50m4MZEfkWNB6N5Lpg38ctY2dYn9xdEj
         7Rh8w7CGhYyUIILp7SgXiI8129UooV/h/Y+0keKpHN+6NVmhzSLa6lg9M2WcnjEW4tjh
         h7E6MzCG/jYISUb98+24HtyDIt7hyquViHBoC03uQiY3q+gqIiFFklG07srP4Sm3vU3D
         QcacuVmrQ0tnLa4kKwpYo6QypZAWeyqazTNdH/llrXza786nj4atqVDHPQLm5FVz42FZ
         vf22n7gjWwgKIlRDlF+KAwJWAcmo8t6qnLTsl+LGtZgVqmOgZuTFYH+8+SpDmFFr/byC
         ETtA==
X-Forwarded-Encrypted: i=1; AJvYcCWmmmQQNiXKt3LyDMebRaC44H4ltU4rhOte4NTCRw2fJZZkM1kRAqTL3eZUJqEFJ2753IaCJIhZwmUkVI8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxiq/ZYIuWswXBLrtohBX+rj9ofAe+JTX2fgAEcwW8UQ2VfdLA+
	eEOvPkoFgtUpoTPUrUJTP5x2cA4aA8Khbts0yUS+GuKbPL6wEfXoFMKdUzXAZPHrxoNnMjmrCmr
	HcS8xlA==
X-Gm-Gg: ASbGncsHUHRRW3J4oeTFPeYZtSXNN237glx+ZFd5FAFXJtHKK1q9XIQ0sLQANiPnO6N
	bXf8X8k8JRWjyRsZPwiDOvpgsgX3iVa1SbDAKvioGo5BEZLpZy192as7ZzasVDzcMaNObqpwkjL
	RBMuW9FqpI330OyuV5vS15CdGtq3nd2gkQibb+LXCAOnQSiub1MM4o5eAvl6SWbMeVpHDiq7RqC
	g7v5oLKdzQ/u/QnCT6St3So17sMnin7AZ9yOO9XG5Yo32s/QYfKJ0eHqrmvr79DTAEK4XRnvwU3
	88zIEdPjULnFtKh2+kNAKE+PMskHLkiaB3N1c+b+Ot9ewepEkcXefS+vXZHOuPrPnTbwO01wsSu
	47WJ+QMGQYU3wtcVF5d/Qq2txCA==
X-Google-Smtp-Source: AGHT+IF0jHbVkHoIntcj/+mNChVbABYQUs8Lqzh82NqarXA6s9uWgPhB91m55N4IpcS57NatEWOM/Q==
X-Received: by 2002:a17:907:7241:b0:ac1:dfab:d38e with SMTP id a640c23a62f3a-ace7109521dmr64645966b.15.1745551867427;
        Thu, 24 Apr 2025 20:31:07 -0700 (PDT)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com. [209.85.208.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e41db02sm63111366b.15.2025.04.24.20.31.06
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 20:31:06 -0700 (PDT)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5f4d0da2d2cso3497659a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 20:31:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVrQH+4i2hnBuxltBOxIQfHBwBBhfmCBZNYQckGaF7AfRN/c3/wFPRip4ynZdg3m+wdEf8rXfqke72f5hE=@vger.kernel.org
X-Received: by 2002:a17:907:6ea0:b0:acb:5c83:251 with SMTP id
 a640c23a62f3a-ace713cfb98mr63838566b.53.1745551866239; Thu, 24 Apr 2025
 20:31:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250425003342.GA795313@ax162> <CAHk-=whfT3A8K2Z+WbieGG5Hhc9QAT5s3qsbB19O0Roj2G5tfA@mail.gmail.com>
 <20250425021138.GA3800209@ax162>
In-Reply-To: <20250425021138.GA3800209@ax162>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 24 Apr 2025 20:30:50 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjDV3nOK34rbU8bdo6OjM=KYoCN92=1eVEVFu=FQr8TNA@mail.gmail.com>
X-Gm-Features: ATxdqUH-bKC0VcMIV-F2AOd9j-f5mi3EXH_KaqVlz4TTORr-ZxoTf-cSfjxOSBI
Message-ID: <CAHk-=wjDV3nOK34rbU8bdo6OjM=KYoCN92=1eVEVFu=FQr8TNA@mail.gmail.com>
Subject: Re: Adding __popcountsi2 and __popcountdi2
To: Nathan Chancellor <nathan@kernel.org>
Cc: llvm@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 24 Apr 2025 at 19:11, Nathan Chancellor <nathan@kernel.org> wrote:
>
> I will test declaring __popcount{s,d}i2() as aliases of
> __sw_hweight{32,64}() to see what effect that has but I figured that
> calling the __arch_hweight variants was more correct because some
> architectures (at least RISC-V and x86 when I looked) use alternatives
> in that path to use hardware instructions and avoid the software path
> altogether. While there would still be the overhead from the function
> call, I figured not using the software fallback would at least soften
> that blow.

Once you have the overhead of a function call - and all the register
games etc that involves, you're almost certainly better off with the
simple unconditional bitwise games.

                Linus
