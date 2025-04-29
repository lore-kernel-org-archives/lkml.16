Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D4B12BF3CE;
	Tue, 29 Apr 2025 13:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745934501; cv=none; b=X9yCicZIflUuaM7eZ4hE2/Fi37tI9n7XexM+Z9mDGncCFS1dzyP2yySbvL0UU8rWSndx2URH1WntBs1QDYEbudavfo9VUzKnZgTnvuvK22V57/nyqPjMXOBOMGm10T9nnVYC/WSnyJUWPMNfRQGSzR36GQBD7bP/fqQFla5phFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745934501; c=relaxed/simple;
	bh=3UTN0yKFCFM1cU9sTmUdoricE1PyGLGZkh5FyiCMzKg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AVIxHHfMkvCCM8aPZr672RF2GuJBRA7ox0f+EcUO6l8zsLJ3IsFIc/JBapIpbU6rfQWf9XO4ICwmSH0A3i4FjRXhmUaFeoTfCbkLc2pjyedkv32+ej3kwts1d14fcz8SzezaVe8C2Rib6mpEww5nhCN1CbBV/irydt3XbrI1sKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QsZXYhY8; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QsZXYhY8"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3032a9c7cfeso619267a91.1;
        Tue, 29 Apr 2025 06:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745934499; x=1746539299; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3UTN0yKFCFM1cU9sTmUdoricE1PyGLGZkh5FyiCMzKg=;
        b=QsZXYhY8lnoGpf7zPUPZJRTYPljMcGYngmW1dIOw9eBVYq8/UYL9Xt3q29g5wkO5QZ
         gy4P4TbdrAOBEh0D6QzLhu5WHUXvXA6iu+lXoM8YyC2E7jREKLxI6HDzanlg4oeYJ5fy
         AAFTZ6/cJtNezpKmg4bardbrK8Hui71EQ6ltTkSssZiY/+jHgEI9/d90FRMG2dXgwy4T
         kecabTR3fB0VfU1IEypXVUHhE07IjhVdhvRDDd+7Rz+u6sI/Tgow1EaR10OD/sk/kah3
         +Xx9m/R97SkDVeC9Peezb7fr9YaCKgnyM6nrHVzCen9L2gok4GSiY+i27gGM/l088675
         ekyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745934499; x=1746539299;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3UTN0yKFCFM1cU9sTmUdoricE1PyGLGZkh5FyiCMzKg=;
        b=E5h08BZ8mpExxnRplqx+10Fwo69AyRebHUjtJaDR/nOFGN+KAHrXlLMuWy5gfIAL/T
         v7moyzqWH2Fy/VkCtFXJBvRSBBOQT1IEaXb6qN3Ub6KomcWcspNd5rnrzE7VJ6rp40cl
         l3chPSvRvRKtpjPGXy8jLKEo9VXgaPLWt8mumGKCQCKwO18wZFAUGZYn0zj672Vhg1bW
         zbVPaXofYMr9aoSvDkrcdcxYXzJoy4tG8fKWWuIIbgHrfDJ4lUKbcyA5XAsMbq/C0ejL
         BLZIQe6KM6y+DzJtCHKFzjhwIEGDfWy6TWJ2SQcXh3KX9e6K0r9X2OmGdh+KedcXVBtD
         dhdQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbqhRnQQtGKZ0zWd0S+WT38pLIZe4QT8InT93XuBuVtXBKonwPAxx69IlP0CVXdrRXzWqwJRnGAxQ+RbE=@vger.kernel.org, AJvYcCWSZuO6nevgNNGMv1W8tD1hYrJ3CFRirtNj/fc6ys1UHGdDgeTYxMzQQzsT1DW2wOFMsOW9pAv/LS55zamVk/8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzkmMY1qaPNsu+m801pYMvWdAo91n2jKoYJUMPNrFvGCCCWYi4N
	6LW7BnxYMtB5djAOOoDTNV6wnc5IqcjZ2Fl+IOz0b/fsHQNZAl6ZgfJhZhlGxSN6UMjPpVFnfh1
	bAnAmYO44uHsVOUpjHZpKwolJDhk=
X-Gm-Gg: ASbGnctKgVeEAB8dBIXQvnGwGWjOmUGSSAeARsR+Byul3cqTSBdPvCmciF5IDGkxehX
	/ZALBpuSXjYVeQK3czSSyBr85bixHKhV9AXP9ZBOxyoFQ/ZEQ3nzBvuW4eebS/AJhJY3LpAtcMz
	FuTIkKqwKP9io+HljjJaTy6g==
X-Google-Smtp-Source: AGHT+IHApWOCR0pchAwdFsc2rTFZuflIKfyFi5jyVEU4MEU2Xndu6ccMMN3KcANjTu5macF4UxOTh35AersHNTxlTPc=
X-Received: by 2002:a17:90b:1e4b:b0:2ee:f59a:94d3 with SMTP id
 98e67ed59e1d1-309f7c73b88mr8495550a91.0.1745934498742; Tue, 29 Apr 2025
 06:48:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241119185747.862544-1-ojeda@kernel.org> <CANiq72n4Fw96hcuqQeorsfH7z4Tb+R1gdf80H_XkD-oA6z5TSA@mail.gmail.com>
 <PVK5DQh3QRZOFQ4cMasO5h75CnLppaPo_aKbvSjzd0gv-bUIagkLyv1FZG5KvJqSUWnl8qwSmmQdl6BVPEcNKQ==@protonmail.internalid>
 <CANiq72mNJrMMbEcfJMLT4kM-_iviM0AR6oeigCyrb5eMWkn3KQ@mail.gmail.com> <87jz732ihw.fsf@kernel.org>
In-Reply-To: <87jz732ihw.fsf@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 29 Apr 2025 15:48:04 +0200
X-Gm-Features: ATxdqUGH6Kje-6C0vtqC58kT4m1EaQsxwq5IrujrVqv1brWAT_mXpD5oJuR-R3Q
Message-ID: <CANiq72=siqas5D61A1xCFZ20Sb3zdZNhTrtRFtEWDrJtEry_-w@mail.gmail.com>
Subject: Re: [RFC PATCH] rust: allow Clang-native `RANDSTRUCT` configs
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev, Aaron Ballman <aaron@aaronballman.com>, 
	Bill Wendling <isanbard@gmail.com>, Cole Nixon <nixontcole@gmail.com>, 
	Connor Kuehl <cipkuehl@gmail.com>, Fangrui Song <i@maskray.me>, James Foster <jafosterja@gmail.com>, 
	Jeff Takahashi <jeffrey.takahashi@gmail.com>, Jordan Cantrell <jordan.cantrell@mail.com>, 
	Matthew Maurer <mmaurer@google.com>, Nikk Forbus <nicholas.forbus@gmail.com>, 
	Qing Zhao <qing.zhao@oracle.com>, Sami Tolvanen <samitolvanen@google.com>, 
	Tim Pugh <nwtpugh@gmail.com>, Kees Cook <kees@kernel.org>, Nicolas Schier <n.schier@avm.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 29, 2025 at 3:40=E2=80=AFPM Andreas Hindborg <a.hindborg@kernel=
.org> wrote:
>
> It is on my list, sorry for not getting to that yet.

No worries at all, and thanks again if you end up having cycles to test it.

(It does not necessarily need to be Andreas, of course, others are
welcome to test too ;)

Cheers,
Miguel
