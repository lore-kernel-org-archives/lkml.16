Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7585260571;
	Fri,  4 Jul 2025 06:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751611342; cv=none; b=k5k2/Nc7gVMHg9XBIMUxgLudZE4K1EDRIGz6w9meCsEsfplOZxuOom/uJmrA5GZ2Nj3eWXYs3AVAWX9yQuAF5pAGwai6gTN7twJHK1z6n1tGqxnDzdeyU9jQZYCCmnUwNm2boJD9ZFFb/WMBUUoPTzjqxy1f7yldpBToqEeqQfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751611342; c=relaxed/simple;
	bh=ViSAA+jIXsu3GgiaEzSROieoqkCVPTUAZ8LCHBhP4lM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hlzPzMjGRifIp0GQbQssh5h6LQrTgJuSBpegTe5frLQBXBDk864ENNA6D63Qzz6Xtb5M8jIY23VDWdManvd9ldQLsoPUeTk0YnU8pcgWuX9mFobdr6L52vHLY+7gFg6Bk00SNwB5OuUxsoERExyNddKfoRfcXsdkgW51jj1FNdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SYoT74p7; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SYoT74p7"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3138e64fc73so131479a91.2;
        Thu, 03 Jul 2025 23:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751611340; x=1752216140; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ViSAA+jIXsu3GgiaEzSROieoqkCVPTUAZ8LCHBhP4lM=;
        b=SYoT74p7ZFFXW/oGErllU4KQN0ztsuRYECflyoZaBt+vtj6Dui9EGO+K0gngGX1x2c
         K7pFP7I4o3wa1i0Q/SKCle+M8niXtgA1drCgaraMVhv+7v4HjG2y+lFmejAWW3JEO0Dm
         EPAcw5dTvd+xC3+g5HC1VjukWy9VCc9vrncVsVm/Q+2u6PXwZoYm0ajv+5RRaAINQ0F3
         NmpKaYPnmgq5UNExHCY52sKmuA4i4bosoIQQlxGak93jDIJ6HF8FQ6Pd5yCVm1nzOFZA
         +YZv5+IJLeyCet3IN76by9q5qgSaITZWhRk4C1HYHzxu2Krn2AnqHNTvi66x3Ub0hIOK
         F+8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751611340; x=1752216140;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ViSAA+jIXsu3GgiaEzSROieoqkCVPTUAZ8LCHBhP4lM=;
        b=tGkKtEb0BXNnePaPt3+ZgMAeg8m5Zco9vUed1wzJEFNSVFCUAJZKfXyEliM+Z3/Ny5
         QZodFwrSjJXGx37dGxhn97HtLbnIWsfJVt39kNlOWaWju8PNxB+eWTvyaJRjZwQY4aR0
         br7Z8wjPpPkBbQ9fPCd5SF7HI4WPYtl1ACR14YlklSLws7uJzOSohVYpRQkw8FNv+xgm
         Nx6FnLDEEso7iqtgeEV70e/xGrah8BY1eO/esNsc9bw2oO30b/CSju0sixFRKQOsXrVm
         Fby1l2MvJz2j0L+fpKrDjTiXFsq2y3ER8VKr7Rzj+GUkDUQrPj+LieWvq+vNVay6zmxT
         gFUQ==
X-Forwarded-Encrypted: i=1; AJvYcCUD8efjYEKgnoL0QhPV4SUGl1GzNoO9ZxgrRL1qzFdL1VznFvx9FG+O3hCVi07KqcplXHUqU6V2thXlyIIpvik=@vger.kernel.org, AJvYcCUHRBtMIv1fog5Px2V+CF7QkchRN+M7X738UZPD4pFJNLHrMAx/sgA2KpxP3x5gqb68O71TXNeuPYgacAc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJh1hQQCeesLT4EDmmIjE5n2+rs1cDM00CkOt1f+bndXoO2ci4
	DXoEuLbvxSmufN5EFPIu8aZy/lSyVT3iaQ27h/vU5ipgZ0U41GcFfNVA6cV4ppvwmJzPfW3unmT
	YeSouYRRf4oYalcpK3AYaCrjyTpISF4w=
X-Gm-Gg: ASbGncvijZV8/eyeSJB7JrLj4Sqqbo6svDe5l1/kxsgjZWEW4AZGLs/nBSiXJhjH+UH
	q/x6j4FLldPEZwLRhyfnXG6sr5sa1FJuTlL6aaxeLonecDHnqykoIENcf/xnfwCfx+gtbiwmMdI
	QPivbIZXY4NXUPiVk1aG/U6ImdY99niPUJ74hKH7LzIVc=
X-Google-Smtp-Source: AGHT+IFflxlDHNrJiLaP0pOFaF5MZ6UmoLwnCtBsjbPI2tWqFOHHZtyQffMIjGTdaBjn/nSJ7GrpiGc8bV40j2OMyj8=
X-Received: by 2002:a17:90b:562e:b0:312:639:a06d with SMTP id
 98e67ed59e1d1-31aaccc1da6mr846527a91.5.1751611340001; Thu, 03 Jul 2025
 23:42:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250701.083940.2222161064880631447.fujita.tomonori@gmail.com>
 <87sejfuf3n.fsf@kernel.org> <CAH5fLgjdpso4waCrP6iVaMEOpYLUmqCz8PxqXuSbQBMaxxCHBw@mail.gmail.com>
 <20250704.090751.571327900479764851.fujita.tomonori@gmail.com>
In-Reply-To: <20250704.090751.571327900479764851.fujita.tomonori@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 4 Jul 2025 08:42:07 +0200
X-Gm-Features: Ac12FXwJ0HlfbWLg_t1Axh-UIkOoLQooLeToRwISrwau9tExpdnnh5hh6PUGWjA
Message-ID: <CANiq72m886R2ZOLSSzehU8aTXzYtPmTyyrSxpOQCr7GX_Bcghg@mail.gmail.com>
Subject: Re: [PATCH v1] rust: time: make ClockSource unsafe trait
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: aliceryhl@google.com, a.hindborg@kernel.org, alex.gaynor@gmail.com, 
	ojeda@kernel.org, boqun.feng@gmail.com, anna-maria@linutronix.de, 
	bjorn3_gh@protonmail.com, dakr@kernel.org, frederic@kernel.org, 
	gary@garyguo.net, jstultz@google.com, linux-kernel@vger.kernel.org, 
	lossin@kernel.org, lyude@redhat.com, rust-for-linux@vger.kernel.org, 
	sboyd@kernel.org, tglx@linutronix.de, tmgross@umich.edu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 4, 2025 at 2:08=E2=80=AFAM FUJITA Tomonori
<fujita.tomonori@gmail.com> wrote:
>
> I had a quick look at the official Rust documentation, and I think I
> agree with this opinion.

My personal take: I agree that having both English and something else
is a bit redundant -- some redundancy is good when something (like a
notation) may be non-obvious, but I think a math integer interval or a
Rust range or a condition like 0 <=3D v <=3D `KTIME_MAX` are all
understandable in this context.

Now, whether to use English or any of the other options, it is hard to
say what is best for most readers. Personally, I prefer to just see
one of the expressions, which makes it also closer to other forms,
e.g. a debug assert somewhere, or a contract, or other tooling or
formalization efforts.

Cheers,
Miguel
