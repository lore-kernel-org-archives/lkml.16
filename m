Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20C3E1E51EE;
	Mon, 16 Jun 2025 20:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750104488; cv=none; b=Lx3vhQ+u5ogDtQwwhDM36LhEQkYzz+rLKrO4J6zpC5yEw2w3/tZw4rkTVFtp5ua/BFjuIFlYtrMfNFUnZYe29GIrwht87stUkFmB4p+lfS1SEoVVEnZy/K8KMroe0De4UV3WhicjEHbjBQy5CF8b7r9KGaLTagW0lu+LfJg6TxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750104488; c=relaxed/simple;
	bh=o/g8EGefqFf+8sl7JVh9ggpmVhN8LB8JxDlCidNJnNA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cJFcd93f83RNfbGyazW33ZNn8UTuFldYJXI2UENbNq9fn3aZ0N46SpsGQEY09Y2A7FCBK5W5rfx4lHXMpnozBKeWJz/TUtJ6mwsbJCFpCjL3hMDbK++9KJxKcXIcl/oPVmaClBk32WjU9WQGdewIIijWxS1hi/Fb/7f2VSA8fLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RqeQFSxU; arc=none smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RqeQFSxU"
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-4e7e044e9b6so180850137.1;
        Mon, 16 Jun 2025 13:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750104486; x=1750709286; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=o/g8EGefqFf+8sl7JVh9ggpmVhN8LB8JxDlCidNJnNA=;
        b=RqeQFSxUtnfkzEbxQGJTBz6XGwcou0kdtTxTh9CRbXVF2/SjJL0qHqvJ8S3MUl2c1O
         MZQUcWDSGTLt7keL0ktovjfw45gkA+3glLmZ1elXVmAKk63O7CfDNBhHyx+3atNiTm3O
         /xHqbf6M+qs/SoEx+n9FVacWAiKcI776rGybkP7vK8WoAyBha02nC9h5scLp4tuwGycH
         5JVX8GLudjkDxrhUPVCFpqOYb96ngCYuRuYjqu+venmukEj9qHAh1DoEF/1lP3VSQPyA
         N4wmgtJbKdTcHuD4C64DP1cyyBPUB7pA0z1ljhmKBDBfTSRX3uUNOUNNBZsKPkNVs5Y0
         QcJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750104486; x=1750709286;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o/g8EGefqFf+8sl7JVh9ggpmVhN8LB8JxDlCidNJnNA=;
        b=spYWZDjJjA0p9bX5p6SexyzjFHBnc9k3Cb8iKoHN0gFaXvkOuPSozWHLk03S/j/K5F
         GrmGTtpBNA77vAr3zyYi080+37vggfxM6swX/s9XnLHWKoZ66xe7UwbVJQ2dNnOVBUwN
         oElEx/KyY9JjHaJ9j0bwKBxrrA+qdmbr3VyZGeT7h4nnrt9t2raOgEv5JD8C7qR0l3fy
         b39cW1ZR/epJonnVpeX91LFD6RhMgd5ZxrRUEG/wGXKnBbJ//SkYqceXuYFOlCa6zZ/t
         GxoeBLAyUTpurYaqfZeFdR7GGNTwrvs0L9NzIsRyDYV5dncDX6u3JPQgm+OdsO9A1CgI
         602g==
X-Forwarded-Encrypted: i=1; AJvYcCUE9zgTFJX15W/wIFMjmeujhwTuv/d8xwSr+MfEAc29LQ6ssTIvMaRw5EyUcIfO2tR5qWDux8pX4ZESMIQ=@vger.kernel.org, AJvYcCVDCLadENPFzhsEvL0rxAxEBfTza9gJJCZzraaTnV+muHVMwJx368Ns7Boaq498nBm+Dp1YfaInl+stEcNlRsA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6ZX3DSuARiK2b63buQRBsbDrcdeytvnZuPwUHG2vZntiool+y
	vpjb+zNvGaNJ2bR5wNVkg9EkJ85q4OtDSCuxkb9G9yeA5sWt2xdCkB3xSzhs5ESRQ42r/XpBQ0u
	9vQeilWbJx/NcqGLjQhSqJUy69NWoevQ=
X-Gm-Gg: ASbGncuob6cH2alPoVqE3zbHoZ6ErjLf8MM7E71RhyXOqPN4oN7whQOVqyJw/BWGTz8
	d/9yYitLShJzGTGQwT2MFaZGFBZDA3nSnnJPEgotGJf4b81ry+QpEMvzelVgxGar/tCymexwvDF
	mqoeC7vyypICbs/OAp8fpFo873uTbaThAZIzXdtptN5bDtTsfGnjrTv+k=
X-Google-Smtp-Source: AGHT+IEkfLCiF0Z6CQt1ppE73blvXDR6Sn3UX4Ge/PsK02XDB/stZ+aPV7xk1UMpTrx76BV/CUvPzMqLUjPEYhD/rG4=
X-Received: by 2002:a05:6102:32c5:b0:4de:ece4:d260 with SMTP id
 ada2fe7eead31-4e7f6145a63mr2267392137.3.1750104485714; Mon, 16 Jun 2025
 13:08:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250615072042.133290-1-christiansantoslima21@gmail.com> <CANiq72mnxRquFmjoJemb=3LSq+ZdUfs9J+HXTwM6AavprsVNUg@mail.gmail.com>
In-Reply-To: <CANiq72mnxRquFmjoJemb=3LSq+ZdUfs9J+HXTwM6AavprsVNUg@mail.gmail.com>
From: Christian <christiansantoslima21@gmail.com>
Date: Mon, 16 Jun 2025 17:07:54 -0300
X-Gm-Features: AX0GCFvfd3sus9vgnOYwRZ7JhguYdIFZRLNxbBsWrdihP62PfqSgcUSv7GwXyjM
Message-ID: <CABm2a9fVSGm+WWjdkAmJHUH9eH=Qx5efORKxyJtt0HnQrs0QHQ@mail.gmail.com>
Subject: Re: [PATCH v7] rust: transmute: Add methods for FromBytes trait
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, ~lkcamp/patches@lists.sr.ht, 
	richard120310@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hi, Miguel

> Please start with something like "Add methods ... and ... They are
> useful to ...", i.e. the idea is to try to explain the "what" and the
> "why" (what is being added, and why is it being added).

I see, sorry.

> > Signed-off-by: Every2 <christiansantoslima21@gmail.com>
>
> The previous version used your name in the SoB -- is this expected?

Not at all, I checked and my git config was messy. In the next patch
everything should be fine. Thanks for the feedback

> Can we do the cast earlier and then use `.is_aligned()` instead?

Of course.

> Also, since this is inside a macro, we should try to avoid assuming
> anything about the caller's code, so please use `::core` instead of
> `core`.

I noticed that core is used in other places, is it worth using as
default dependency since other people use it and reduce verbosity of
the code?

> Also, this is still missing safety comments on top of a couple
> `unsafe` blocks (pointed out in an earlier version). Are you building
> with `make ..... CLIPPY=1`?

No, but I'll activate it now, Thanks for the valuable feedback!

Cheers,
Christian
