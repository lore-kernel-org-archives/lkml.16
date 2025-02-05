Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85A621519B7;
	Wed,  5 Feb 2025 23:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738798874; cv=none; b=PBjy3wN3dFKiaMN26gdJZQT2YtlmkUbk1Ti0/R2Yxd8cZdk+jfjbwUy5hjjceGtT1X+iLngTemJgThLOP2vWzboWypoBV2gt7jBtg8W2FuU8JL5EpQG3A08qdJCYne8lWR+evI0AuwslHlRgNCVD3AOxNR4RxOMADnGXHdfnRcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738798874; c=relaxed/simple;
	bh=WKEgMyHfPWTlLLqqrmnwtvQK3GmysT72SpoyvC2gz8E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fKVAT3C/Kct/gIcvlpJi6EgcrJKFwFI5BYImT72mJX6mV+vLLSj4hthZZk8zz0152BlwcwlrihTjtOc99rozwT4bHP0Xzu6TNO8SAL6cM++NMQWv4rbymHTQaOoOWxHKNE22bFYHRbEI5DxpTWgweHuaRV4ZyXplAvd+t6ffSqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YcpHmqAE; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YcpHmqAE"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4364a37a1d7so2920685e9.3;
        Wed, 05 Feb 2025 15:41:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738798871; x=1739403671; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WKEgMyHfPWTlLLqqrmnwtvQK3GmysT72SpoyvC2gz8E=;
        b=YcpHmqAEbKZAeTo27JHok8isvzjUe1bidqmP5cJTtO6tTxc8UryM0QHdZLYJ7+/Up4
         Kn/42Lyb1hRwAoQYAuqENN1fn5NUAuluRkzX7KW6FyeJTC3rVrZ5wiiNBAsPoNBDo15X
         wZNLmuiXRtRDFeUDxbigxqgs0v5Ud7PQ2n80jBz9za3ysFaBS4VLfBcX8E9QFIdBJ3t5
         2SVovHALCM4HvqxMr8um+Lk5SDKJJ0cC/Odad5fJCE619m6snMe6Bo9xN1EBkqwHxhoJ
         ZNfmU0NT/j6RqJ4ngvxCvD1yFnpUH7Y2yxRekx/jwWnwQMaGT/loji5EMkZUVuWI8BOa
         r94Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738798871; x=1739403671;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WKEgMyHfPWTlLLqqrmnwtvQK3GmysT72SpoyvC2gz8E=;
        b=KsSNb+HCWlKPmd7FwHPyDuU/GPsHP0laYKN5XUGrtPatAWrl/D2QMvn3ymeXpJv3QT
         KdT5cv8fnDgI2DTv1SO9jVvooYc+XuEHygCM3+0NqYXTrwYt5vMGdIfoCvBGoa1YAkJc
         pOXe3JCNgzvr6HK/QK+wqwIXVgQQD17m9xUp3Tn0KxiKF+6Rh40/sofM7swdZ1Tp/UeY
         soCOG7QDuWuXRaofKFHEkSdkqlszQbWBH3KMSFWQ23ECKPjordPuYC4UmmzP6hRnaos4
         FdpB9P5ZzP4CyPykRVK1Ugl1Z0ZZbVUrS1fZb6mfpPyKrlJ7cFzGCqi7MxmJIg+k3OB+
         XqhQ==
X-Forwarded-Encrypted: i=1; AJvYcCULKR84NO3d2HoNYVFx7Kfs9U+WURyyxYWpFPT24etJQIawdyoMZRZbvp6qELAqvzom2pEz7Fluj88f2Hol@vger.kernel.org, AJvYcCUP8RaQF4ZIzLokJHq5+ZffOtd+7c/k4CWbpBkYOLexz+Wo9iTWIQQX2BwepDZQFtMC6NLQ4ohXXCc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyyxVp+LxNfxmcryqCVxJGQlw8xmhp0M54cqkAr9N1FhamwM7Nh
	DuC+ZLVjvta7EpmzGSZRdqtdRMzmaSq3YvkDeyeIjOnMZ1rlUDcoSULERTcVYCiwkH29E0Z8HI9
	nYYxYPpqyXG7Mjf5HfK8A4TlPRSk=
X-Gm-Gg: ASbGncu5HtVpa+qwqsFOWxZjXv5b7rvSvGiWWHSnJuVc3I8I0lqXHYbKwpnXkTUrwnQ
	krRxW9i7D5I1BhWtUqpyOmOEHpmM5oE9IuBPwJkPE5NYB3wY0EAQTeM/jlZ5ZxC2HD7mOxk9//Q
	==
X-Google-Smtp-Source: AGHT+IFLTv0TDNnJU+yADljvGxMSoZCkyg9G4XwmiEyfBnbRTqPG2jvE/eed1EqqR6nVWHsb9vVYgVGcI2mkW+jV4yw=
X-Received: by 2002:adf:f1d2:0:b0:38a:8906:6b66 with SMTP id
 ffacd0b85a97d-38db492abc4mr3094863f8f.38.1738798870580; Wed, 05 Feb 2025
 15:41:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1738686764.git.maciej.wieczor-retman@intel.com>
In-Reply-To: <cover.1738686764.git.maciej.wieczor-retman@intel.com>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Thu, 6 Feb 2025 00:40:59 +0100
X-Gm-Features: AWEUYZlz3dbMNs5uaCuCxvHCPA1V_UbROZFgxVVkwngTO-akZcC0zg4IFPaM-WQ
Message-ID: <CA+fCnZd1dpqv+rM2jD1fNGvhU_0+6c8MjzsgEsi2V-RkHVteJg@mail.gmail.com>
Subject: Re: [PATCH 00/15] kasan: x86: arm64: risc-v: KASAN tag-based mode for x86
To: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
Cc: luto@kernel.org, xin@zytor.com, kirill.shutemov@linux.intel.com, 
	palmer@dabbelt.com, tj@kernel.org, brgerst@gmail.com, ardb@kernel.org, 
	dave.hansen@linux.intel.com, jgross@suse.com, will@kernel.org, 
	akpm@linux-foundation.org, arnd@arndb.de, corbet@lwn.net, dvyukov@google.com, 
	richard.weiyang@gmail.com, ytcoode@gmail.com, tglx@linutronix.de, 
	hpa@zytor.com, seanjc@google.com, paul.walmsley@sifive.com, 
	aou@eecs.berkeley.edu, justinstitt@google.com, jason.andryuk@amd.com, 
	glider@google.com, ubizjak@gmail.com, jannh@google.com, bhe@redhat.com, 
	vincenzo.frascino@arm.com, rafael.j.wysocki@intel.com, 
	ndesaulniers@google.com, mingo@redhat.com, catalin.marinas@arm.com, 
	junichi.nomura@nec.com, nathan@kernel.org, ryabinin.a.a@gmail.com, 
	dennis@kernel.org, bp@alien8.de, kevinloughlin@google.com, morbo@google.com, 
	dan.j.williams@intel.com, julian.stecklina@cyberus-technology.de, 
	peterz@infradead.org, cl@linux.com, kees@kernel.org, 
	kasan-dev@googlegroups.com, x86@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, llvm@lists.linux.dev, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 4, 2025 at 6:34=E2=80=AFPM Maciej Wieczor-Retman
<maciej.wieczor-retman@intel.com> wrote:
>
> =3D=3D=3D=3D=3D=3D=3D Introduction
> The patchset aims to add a KASAN tag-based mode for the x86 architecture
> with the help of the new CPU feature called Linear Address Masking
> (LAM). Main improvement introduced by the series is 4x lower memory
> usage compared to KASAN's generic mode, the only currently available
> mode on x86.
>
> There are two logical parts to this series. The first one attempts to
> add a new memory saving mechanism called "dense mode" to the generic
> part of the tag-based KASAN code. The second one focuses on implementing
> and enabling the tag-based mode for the x86 architecture by using LAM.

Hi Maciej,

Awesome work! Great to see SW_TAGS mode supported on x86!

I started reviewing the patches, but this is somewhat complicated, as
the dense mode changes are squashed together with the generic ones for
x86 support. Could you please split this series into 2? Or at least
reorder the patches so that everything needed for basic x86 support
comes first and can be reviewed and tested separately.

I will post the comments for things I noted so far, including for the
dense mode changes, but I'll take a closer look after the split.

Also feel free to drop the dependency on that risc-v series, as it
doesn't get updated very often. But up to you.

And please also update all affected parts of Documentation/dev-tools/kasan.=
rst.

Thank you!
