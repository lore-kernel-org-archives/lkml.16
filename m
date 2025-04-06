Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 438AC33991
	for <linux-kernel@vger.kernel.org>; Sun,  6 Apr 2025 19:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743966266; cv=none; b=rHBHzUTM/s12fBoNM8fhqeWkCx5sGEwTvtAVVVk3xaMW+aFBY4C2xP72uXPAUIDniL/QdJZH5oy9pZqIizPXXWOCylieXcXzzgbSUq5UfOxV7SU7rL4i4waGMcfrIs485tuOaJsNpECWE5DxmLkP9KkcXjBs8Y1Jf+2pQ56NyAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743966266; c=relaxed/simple;
	bh=pdyeFSXyF80p2wcG/rvIzmUa3/BuhjSNWLfNCTX1yz8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XRVOAw8t1JI7yt1GwVEm3GnoFH1FF4EeoBYSI1lj41kNr6UNXYaNLv+0G+ob1nEJJ/yQDn/Sk7xAwTF9zeC9VOVLlqmFk6TJFtCaZcbZz9ZD6gIWydHjkBiWn7fSiKDRfocKsIf+G8xwbqkjTrUrGhxrll6EoNvcnkKpkSOUzdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=HbiCpsAe; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="HbiCpsAe"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ac3b12e8518so691838666b.0
        for <linux-kernel@vger.kernel.org>; Sun, 06 Apr 2025 12:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1743966262; x=1744571062; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rZAdZl8Dd5Nt+AmHaPGfqPYrp12wnf/Y8GSjdpHpchU=;
        b=HbiCpsAe9XGU+wMyoN2LiB+GzEeag5Uszg5EEBxGv/vH2Mb56YMy6hVraNuuFeBtza
         62aCiTaABWZ4PhQv/CaPlQuuTzc4jz4C+EiP6QW/RjEaRIIQGd+HbDmSgtRX2CVC6X8b
         ndFhGv+WYcz1rPtKG8l5r5Fmdtvb/aQWsAv8c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743966262; x=1744571062;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rZAdZl8Dd5Nt+AmHaPGfqPYrp12wnf/Y8GSjdpHpchU=;
        b=D/T2ZXgDcgJRkcma+PiBckDtIypebgEqvwVMJrE6FHruU+a8FJNkr7qsmFxc8dDysu
         +wOjO7QsUaSwP7OPzIqWXQcGZoR4zZvADmQqTNgAMA1MH0NpBle1jCGfLD+3XwE5Cooh
         JnhLgdJ9iao1FJEZQJmENi5Jl5Q8M3Gq763159AXtkiapzsjkX0S6YqZyLzWXUsjBvT1
         1RCa5OwX4a9baThv85mePk7Fsyy4oZfjAKkYcokueDiYorKrdxK1Vb2KO3FgXv6ocPOd
         bTEwQigCVDcK7JlKX/zoVw2/R5N7XkTVIRoulwQpDlYeMs3OmQV4MmClyly9I2/o4fha
         qh7Q==
X-Gm-Message-State: AOJu0Yy4YkWEdjl7js23PNlwxB+hufsPdcw8HW6X5qm8Y6XLXqLlilmJ
	3hdF+MweVoheLwRB5D0cJjnasISTOgIlezRSpElLl+b1YDXZ4QhAmtdBl9tyge4MzdrFHFj9kpq
	ajUU=
X-Gm-Gg: ASbGncuy2ANEZvwpug6wfugYNZABXbn3ragxLZFbpDGyBUSYWvEtYTCKops7nBh24EZ
	LdgvTNTrEVtxdeAqMSG3+L6/87lq4Y+N+cHxBO+SWyttRu216qrNxpitQIrwp8iodnA0U2OAbGX
	vuB3G6TGFvWpt53+IXWkmnmXGGfZjKpnYhqj8U/UoKKhdKmKPihMWdqswaV83Np4UJLE0fWzWQB
	v90Y7Hli9/QG0MjdKet2lM7B3Fa8EeSwRw8Plk3lGxp2oAKe2IQmy279plXvVvtuPdmuxoosI0v
	O5RuRmRy8Bqpeu4xmb8bJ876iRXlzSWlr3+kAc+LMvAlI6/P42nxvUR2jYauHuRPxgkbjA/r1KF
	kzc/y9ASAnU3pOf6NhS8=
X-Google-Smtp-Source: AGHT+IGf3z+IOQw18qqbhnmIeZnV6N0uPPx0lSG0JvYMarupZBItnB3abaPabfytNRvz0CntIBCU1Q==
X-Received: by 2002:a17:907:2d87:b0:ac7:391b:e68b with SMTP id a640c23a62f3a-ac7d1c1dfb0mr873463466b.61.1743966262237;
        Sun, 06 Apr 2025 12:04:22 -0700 (PDT)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com. [209.85.218.47])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f0880a405fsm5626450a12.75.2025.04.06.12.04.21
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Apr 2025 12:04:21 -0700 (PDT)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ac2c663a3daso706194466b.2
        for <linux-kernel@vger.kernel.org>; Sun, 06 Apr 2025 12:04:21 -0700 (PDT)
X-Received: by 2002:a17:906:38c2:b0:ac7:ecea:8472 with SMTP id
 a640c23a62f3a-ac7ecea8580mr421913366b.26.1743966260962; Sun, 06 Apr 2025
 12:04:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <202504061053.F27227CA@keescook>
In-Reply-To: <202504061053.F27227CA@keescook>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 6 Apr 2025 12:04:04 -0700
X-Gmail-Original-Message-ID: <CAHk-=whVfxi4KRu-H=tsgSdoGdDz1bvu0_miJT0BTgAf4igpdg@mail.gmail.com>
X-Gm-Features: ATxdqUFvIrnn0sLprtozpL3oMfX3Mv-v3p1AFV33Gzw-RIeKAnQyu49vt-NR7RY
Message-ID: <CAHk-=whVfxi4KRu-H=tsgSdoGdDz1bvu0_miJT0BTgAf4igpdg@mail.gmail.com>
Subject: Re: [GIT PULL] string fixes for v6.15-rc1
To: Kees Cook <kees@kernel.org>
Cc: linux-kernel@vger.kernel.org, Andrey Konovalov <andreyknvl@gmail.com>, 
	Andy Shevchenko <andy@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Nathan Chancellor <nathan@kernel.org>, Peter Collingbourne <pcc@google.com>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Will Deacon <will@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, 6 Apr 2025 at 10:54, Kees Cook <kees@kernel.org> wrote:
>
> - Add wcslen() to support more Clang libcalls (Nathan Chancellor)

Oh Christ.

Does clang not know how expensive function calls can be?

I really think the right fix here would have been to say "don't do
that", rather than make that function available.

When the function implementation is the stupid version, there is *no*
advantage to a function call.

In user mode, if you have

 (a) long strings

 (b) you use some optimized vectorized string library

 (c) you don't have the problems with function calls being potentially
expensive due to return prediction CPU workarounds

this compiler optimization may make sense.

But in the kernel, it *never* makes sense, because none of those three
issues are ever true.

So this change is just *stupid*.

And I'm not pulling stupid code. The one-liner rto just disable an
optimization that isn't an optimization is the right thing to do.

And if LTO has problems with that, then LTO needs to be fixed, dammit.
It's stupid without LTO, it's doubly stupid with extra
"optimizations".

               Linus
