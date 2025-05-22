Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFE7922333D;
	Thu, 22 May 2025 08:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747903579; cv=none; b=SFWAQxEeopDApR4jZBhhFBPujoanKnTOSbBEfLnv8nnZnBH3x+oFDRmFefQxvBoPZz1y8Hn7vA/5AH5443GfhVFSrFPFAuKkpI5sVMphP3kHXBKwq32dt1oOvWsjozl/Sbl1OYd+SrVriitNX0Qt4vtO6314xk9VKy8ivr6VGFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747903579; c=relaxed/simple;
	bh=bBxJ2jI2C//1oSmc8MnMiFtY8i7Qaz8dXwp/CgG/dTA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HfPhnEBdStZtbkC9gLj+67YX+KjHKK7EYPLqVr7D9bEyYYKw6IRrkhGtDSklaPOjqeP3eNTcjSs2fj009CkMG4jcWwoSHg1hohSxt+HuqtJM2wjMTQ+Salt2uRCQKaYTKQ+Qq918xoxU1tNRSozWSDlWY7axI7wlub1bekH9hDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AP46fh6e; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AP46fh6e"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3032a9c7cfeso1261845a91.1;
        Thu, 22 May 2025 01:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747903577; x=1748508377; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bBxJ2jI2C//1oSmc8MnMiFtY8i7Qaz8dXwp/CgG/dTA=;
        b=AP46fh6eheA8XLi0dDipF0gWapECaK+VpfRXCUFgoadfBW0Wjwc3BUMepAK6zI2ry9
         LncZ+hFbb0LwtDD4X+fPczbEJxYHMh5Rn8W9ziqa5DLOeSzMVFixTVPduvg3a9pNvbfE
         vnQiMahmTbF3+m8+ZV5yTxu4WKxKk9Eg2wGgu4q3nfIgKCYk+1OqI96GN7Q1AbNtQtJK
         LfACWJcDLVK5qG6isfuAS7zwsAwtbzpHGJ1HBiNFKWJcVx2brV/tfCEF7nPJh78REf+q
         IXLMRk7gjK1FnNhFhizdtpKGskKKkHEc4fbnGV6wbhTIrrWXGcslYHpKiANFs6CJBbPJ
         j1eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747903577; x=1748508377;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bBxJ2jI2C//1oSmc8MnMiFtY8i7Qaz8dXwp/CgG/dTA=;
        b=AQfUYB5OV4w/MU3s9otxDQZya2Y6cmRJT94wh/9bRz+wPfHX5ITz3TluBMk5PZ3l36
         sAGSZAXWL2ymY686h2n7Fs0afAC5Y0X6d1LImwnO3Zrk2xPNffIZaiBqK5Osn+YFV5eF
         2e4uc72+uuLv5LeDwssyoGk0pDhqn2IlQfjo6UZt+BErk/Mi9bQvsfQA1JqeWsA3qPo7
         3yq1sKU/+Vxp0rPalgq5WccaI/H3RkWZeVZ0Ar01WVBfSkIawWZzOdB9M87rQNdmBeEK
         BKPVsbm0wjY8inlFwMVxi29Sf9DBm2dQEYdTW77e1toW6l3lgKP4Qf48gEjbQY/c8Xm3
         JZxQ==
X-Forwarded-Encrypted: i=1; AJvYcCV9bfXtflEO+2cfmjcFIMp2SPjZVMxwYRZCQa4nQ5Fj6s2u0VOZJceBTsSfHS8uxx9e6d2WvKnVZFPYdjc=@vger.kernel.org, AJvYcCXA3Fd2ExBq//fcMFZ51JWOp1uSglt6fKJeUUObL40ItvhcGVgD8b2WAt7odTwC3z2HDUl09OfXsUSHCw/wYZE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQ3iFfg/M1sZqKNjFqi5zRJv50GoKV93Hq3MdMFrCchezWyiDc
	5v7SPrAkCI6bfZcl/tKvlGZQDJU6eFHyQX8hrv7E1qIMYOSRa3B7R7TpF5/8B26sGqRndM+gAnK
	JYwahLfnYwCDT6Q6NW7Sj3suRg/952A6+p1oQDsmJMw==
X-Gm-Gg: ASbGnctnPKAVrrOhvjxXv2He+8Sh2GKGpzwwoa5aUzxaO6B8lYULk+kDhAr0c4h9sed
	A1qDuh9L51hehyes2MTSU8efWKwOtPL21BAZjXFJeOweTkY0r18HUqVgVu3kg6j6m/69b6tlBx3
	2x/+TIVJtXOB8dRTLe4wXteU5t2ZiBEAKXpwLSvQxi+kY=
X-Google-Smtp-Source: AGHT+IFEUErAXQrqjBBPl5uNIbn+/slSrj+fuj4AS1Y2QFurbevf52b9yENWRIYvRaV5fLdSL2wU0HUdEbeZghGIoAU=
X-Received: by 2002:a17:903:41d0:b0:224:1005:7281 with SMTP id
 d9443c01a7336-231d43c3d88mr121249505ad.7.1747903576940; Thu, 22 May 2025
 01:46:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250520-rust-mno-fdpic-arm-fix-v1-1-44e77fe6b2a1@gmail.com>
 <CANiq72nUFqM7mnpSGZF65n3Aak37KVVSa0d830o31EuZyh+OfA@mail.gmail.com>
 <d6515a2d-7986-4b53-a655-869d568d4081@gmail.com> <CANiq72nDCfoy2v-VbMR9ntNbTt=3JoYsVhz_gqX=Q=4iWN1YCw@mail.gmail.com>
 <CA+G9fYtM-s0cgS39wX9Go_OAXxYa4nME6h8CbhyK_-QrRvQk5w@mail.gmail.com>
In-Reply-To: <CA+G9fYtM-s0cgS39wX9Go_OAXxYa4nME6h8CbhyK_-QrRvQk5w@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 22 May 2025 10:46:04 +0200
X-Gm-Features: AX0GCFvUWLoHcftNnHHcnXk02qKWEmZlVswhSl88DhaF-XC_13tHObndO2efYGw
Message-ID: <CANiq72=bdckmehoqoEfpTespZPaTCVDsGSwkEd2fgd5kT70S4w@mail.gmail.com>
Subject: Re: [PATCH] arm: Fix rustgcc unknown argument '-mno-fdpic'
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: Rudraksha Gupta <guptarud@gmail.com>, torvalds@linux-foundation.org, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Ben Wolsieffer <ben.wolsieffer@hefring.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Christian Schrrefl <chrisi.schrefl@gmail.com>, 
	Russell King <rmk+kernel@armlinux.org.uk>, Ard Biesheuvel <ardb@kernel.org>, anders.roxell@linaro.org, 
	arnd@arndb.de, dan.carpenter@linaro.org, laura.nao@collabora.com, 
	lkft-triage@lists.linaro.org, regressions@lists.linux.dev, 
	Nick Clifton <nickc@redhat.com>, Richard Earnshaw <richard.earnshaw@arm.com>, 
	Ramana Radhakrishnan <ramanara@nvidia.com>, Linux Kernel Functional Testing <lkft@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 22, 2025 at 10:35=E2=80=AFAM Naresh Kamboju
<naresh.kamboju@linaro.org> wrote:
>
> [I was off and travelling]
>
> Hi Miguel,
>
> Please accept this patch from Rudraksha.
>
> Acked-by: Naresh Kamboju <naresh.kamboju@linaro.org>

Thanks Naresh! Will do.

Cheers,
Miguel
