Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6414419D897;
	Sat, 31 May 2025 10:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748687418; cv=none; b=cUpQ7ysnZtQ6j94CaESitNNKEMZCMaXNu2Oa0frhTkuJIetSFiZd/vrA8wJHPU6LCIpn5U/utMxE/w8t4CRo8QTU+rWkTARYyCWIezZffzh3h7md63pufK+num74qxa+iDziHdZ2jj77KjjU3YTHjzlZun5A+koAop2Hq0JQOZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748687418; c=relaxed/simple;
	bh=i718d8Duyh5E9uq4Nx7rsx3JGkX/J1FjKhmbX+FjY1s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F8F2xdftJhUNjnDYUPCHBY/ErbrzevT+AGYSHwKMsg2srFjd0iapEaiBSIBrBzuqhop15PtBnHm5IFiv/ghK2yM5XJv9d2DtaOzu78J2pdmrYfvbSQWin4APfvDycEly5aLVq20f1TUh7e54yxtNFqc9Zpzz/nsDO3sxRw+s8gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SpEii1wJ; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SpEii1wJ"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-b26ed911f4cso230021a12.3;
        Sat, 31 May 2025 03:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748687415; x=1749292215; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i718d8Duyh5E9uq4Nx7rsx3JGkX/J1FjKhmbX+FjY1s=;
        b=SpEii1wJvWCQwpBRsbhWVLX2UjnI5TQBzBskl5qMEGzRSoAQUFyX3F46fxyXv51SP3
         irMFT9bldCrsNn03A0iofJxnmX+UrW1dHmuXzMBq4hbo1jOsrMGPfw8PJw8njjnte9e/
         tn5HcE5OotJ75m4Z135Du+cir8dYsxLTcXYB1s+3drlvXtjiAJO+eT++v4dui+wZ/jmj
         kohEtaucgcqyAZydKAtp9e3z6uyh3XsEK18ZNTQotK08vnh1h8jkCvtskGSE5yXpzmf1
         DF/A3mBGhGuHDmzKVUEb4Vk1u7ezf6AIl+BAwtpnht0qKE63/7EFaW1M4metshPo3KJK
         2kXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748687415; x=1749292215;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i718d8Duyh5E9uq4Nx7rsx3JGkX/J1FjKhmbX+FjY1s=;
        b=edD2o4HJNS0QHA6laHBNEqg8Wq4AEbLjdGhK373ZqxkyKah+JBdyajaYYnKr1/zWjt
         Gt0Ar/VHK2sfgXzE4K0TH3rKdqNZjzcbWS/G2eQ/ktMJedPEwqhOfeaBJ/VK+Yx/IOPk
         cYfjB4xJs0FIOdj9cFoYoKBdcg9YXlB5Kv75EbsHu9bAeyumvMkxZskKKhLRSR9Q6txB
         1/GNj58U7d/bFW3yS7UXy9f2bLauxXeFyfzC03C0DHd9ojApIU7XXUKV+Icm/FhZFDLV
         /2sX9n2TwpyThHRsK1ltug0ir5cGJ2RNEA0TEhelRhBN6jqfiPXmOzdIrjIXxubBizTQ
         +q0w==
X-Forwarded-Encrypted: i=1; AJvYcCUWvuGuujGeStVsYCPDL9bqU9rLUViaYcUove4TvfRBHX4lAlqrYr8SqcYzyHx6ZwOmiAgixYc3HWu4yPzLRyI=@vger.kernel.org, AJvYcCXWYf93k17zbhGL+/CPobWa1WTzCcySv0E28W8gd/rR/dYzyhzHttUVNwMFKaEkyZ7w1FP+KZENJwtOdWE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyLXT+H89cwPyn3NIpyYAOz98R2Hq4pLpymY87mCg210D/tI9+M
	cKcQ7L+RW1KlPqE84z+DTRaZFT53XAV65FCeXuDc5rHxUX7PIJJF3Z/2jDEmi418Q5fUPnipS1v
	++Ao+cuq5Ir4gADEKQSuU3CH/33GuwFk=
X-Gm-Gg: ASbGnctZEdGz6qINwc3YgEpOheqvXSwWiaFU0fzaAzH39NQ753cg+fqTi23NCpo4WIK
	xAhThTnvcnGPURhu2wBAARMT/Yi0TYpV6etTUWjgnLerJkA3lfTPOc+6Q5kwwf9rEUY372WfQUL
	X6UksLjbmd9imZrYuBuf7DsSIfyDB16Hqz
X-Google-Smtp-Source: AGHT+IEbO1ffe0caragupEno3gENSspwEftXpgcfxBUJd5P3Ep1cAVhmqn5914m+yG1FPZmmkUM89TYSRepSPIaMPZs=
X-Received: by 2002:a17:90b:1f81:b0:311:e8cc:4250 with SMTP id
 98e67ed59e1d1-3124daf3e85mr3030330a91.3.1748687415466; Sat, 31 May 2025
 03:30:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250511-rust_unsafe_pinned-v4-0-a86c32e47e3d@gmail.com>
 <20250511-rust_unsafe_pinned-v4-1-a86c32e47e3d@gmail.com> <CANiq72n0EcibX3Vx95tiPEkd04DA4hjY-TJQs9YSOmHj=VZ_5g@mail.gmail.com>
 <0dfe6958-1dc8-4e36-aab8-e83a6da4d0e0@gmail.com>
In-Reply-To: <0dfe6958-1dc8-4e36-aab8-e83a6da4d0e0@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 31 May 2025 12:30:03 +0200
X-Gm-Features: AX0GCFs3MXHNxZq2SeqMHg0ha8grcijFpwljtPcXMw29rIeS3ZM8W8eeSAE_A58
Message-ID: <CANiq72k2DyB2dCMxSz=uE5SCuECxOHM60d1fzF3A0MsTf=aZcg@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] rust: add UnsafePinned type
To: Christian Schrefl <chrisi.schrefl@gmail.com>, Sky <sky@sky9.dev>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, =?UTF-8?Q?Gerald_Wisb=C3=B6ck?= <gerald.wisboeck@feather.ink>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 30, 2025 at 10:22=E2=80=AFPM Christian Schrefl
<chrisi.schrefl@gmail.com> wrote:
>
> Since it seems like Sky has not responded for 10 days
> is should be fine to just drop their COB & SOB.
>
> I only offered to add it since the upstream implementation
> that this is based on was entirely done by them.
>
> If you want to wait for some more time that's fine as well.

So Sky and I shared a couple emails in private a week ago, but I am
waiting on a reply. There is no rush, since this is not going into
this merge window, so it is fine.

As for the tags -- it is up to you both; just please make sure it is
fair and that the DCO is respected. You can also consider another tag
that is not a SoB, such as Inspired-by, if that is more fitting.

Thanks!

Cheers,
Miguel
