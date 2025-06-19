Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4B2323AE60;
	Thu, 19 Jun 2025 07:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750317833; cv=none; b=iUOxywvhQp7+9ZAVjRR67boEmapjGdj7gPB5onVLBy7+7preiAbdZluq+MMn3KRQB7HhxBZY2kGu6QzPf++9rk5N8Xw6hze7ryYaqPT4LdooV9Y7ZOV5AZzBU6VVqBDlexATp+BkH6qqkTrFjgWD7aCC2WANEI9+t1rXDw5X5xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750317833; c=relaxed/simple;
	bh=nb2VENM0sUaWVP7DcGKvh8KkGKDw6730hpWK2iWbIK8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rKb7Bs0wGcrhGPRFnm8c7UeHBJzq4hcWuhuY+TSybNwjeIlkJHXIaNfB8PBKtRGB1VKgkqx7Y87vTHBg4NCVxfUKFKQCBTSAbrylsa0YRSgiZ8Lz/49vfn1ajozgxEIY34f/9LKltE1/9ZYm5ME2YFUOKltocjJG6le+OqDDVYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nfc3bjMg; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nfc3bjMg"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-b2700de85d0so52784a12.2;
        Thu, 19 Jun 2025 00:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750317831; x=1750922631; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nb2VENM0sUaWVP7DcGKvh8KkGKDw6730hpWK2iWbIK8=;
        b=Nfc3bjMgKid6TqefausfHOnX9IHBFQ49Nb8M2hopapEoakORhPOXGttCSeafrEEDaN
         2SvXXIf165faYfVEaaLxkc1h0RE9YMNN8140ylWrmI0NaPpPRaRJcXB4nzfr5uSZwfy2
         eesc5NyYW9R2/DJeizH+2NwMnIYLMCf1LMklMzAHqNIggkjtX/I6kS3ZLi7LDz4268Kk
         lHreuzy30Bxh6Z9Fqarh0ZIzJYnSpnWbVMe2DxnBPVr8qULGqIQyO45mctdJCpP5K5Iu
         e6yOOHJoNp0iLTJddgkvPtsq1kDL/dOGA7ZfsVrCjDPGQaUPh5Yx2iLZlX87uOxt4c8i
         G1Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750317831; x=1750922631;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nb2VENM0sUaWVP7DcGKvh8KkGKDw6730hpWK2iWbIK8=;
        b=l4Ve2tv85TFknucjwR2FcEhpnbQCnWh2Iq3LYvo+mvW7uZnxWAQnkmM0V4ojaJKZsZ
         hAeIUd2VGIRPBSBzM7toQPCOaCoMeE8gcTwxkInCKhDOr2oZPXau3PJe8R9/PFaAI0pI
         mExG16lxRQ8WGKOC012WnJTCRCVrnOTW/X6OTJSyhmY2Vgdvh1h+jyim9wWaaFpoVrPv
         go42p8Z2qArEW3B9aZdUrOF1qe9wOLVVKrAqr/nnf0T0JdDnUpzPqhpBthF9p7a8yUjw
         I7600BQmnE2FkJH3cvzRz5+YZskHofcM5UYR+/FR0vc45hWYKVYlRN/R5o1Yzr2ePDXv
         smNA==
X-Forwarded-Encrypted: i=1; AJvYcCWzm/cOX3odv/Dn0rBg4P8LW8BnLOtxfBAA3LxmGYPsjsCdTxtcpyYNkWr1cuOhuxQuBzfXnd0ipRiMXcZmU8g=@vger.kernel.org, AJvYcCX3dh8qfu5np+4rYiOclCkIFd4HoK56mzDNp4Dq1JVXmZury3LZ1t8CGx5dOWeK9DZXYziE9CrLGsXqIEE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzaD51JQ6mt5pLw5yWFifFWh+lThuawsL6TCy32sbHuBkAszN1V
	DzZvqx3sbaxJsthyBFrnlLhkK1qunSsXrl+U9lEibeKXZpbCL2OOD1/dCybLE3BfGU5DvTAnhq1
	40vzuPx5yf2FU1LfNGCzNZPFfe7nx7+k=
X-Gm-Gg: ASbGncvF0ZO7gp/Py1eueXQpZYnTb29TudGUUDIDmNJpP1f2yEDk54r6cTXEQhP4oKV
	UlHM/OBmvYVeUpGgqOkc2ddSdCUwuK99CQs9Q9dscF9w8icSPCngkuZW5Ejw5sUJ4n2icTT8LBl
	CJYlz2RvTDdaRR//rRbGve5mhsT/Z7r1poqvod7FGxtr0yWwASt4bZnw==
X-Google-Smtp-Source: AGHT+IF4xgeSaa7Z6oacjqkh0Uhm6c4701OKVkd4tH+PpdBPRzB6UQ4bdJY88XOmwdVSbKmB5WkB1ChLRw19n7RXFmE=
X-Received: by 2002:a17:90b:53ce:b0:311:fde5:c4ae with SMTP id
 98e67ed59e1d1-3158bfee2a1mr1214205a91.6.1750317830755; Thu, 19 Jun 2025
 00:23:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANiq72kSfHTPeRQjhHKhdw8zuozvNy50CJjTuEbUnW_3j9x8tw@mail.gmail.com>
 <CAH5fLgggDKUwmU3oCTMS1dQGzA5Whp2fnXoLmbGmNF1W89Ar_A@mail.gmail.com>
 <CANiq72mBfTr0cdj_4Cpdk62h2k+Y5K3NSs54_1-9jiszMZ6AuA@mail.gmail.com> <20250619.160844.1477802332578239775.fujita.tomonori@gmail.com>
In-Reply-To: <20250619.160844.1477802332578239775.fujita.tomonori@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 19 Jun 2025 09:23:38 +0200
X-Gm-Features: Ac12FXwkGjT2yKdViSJAtLP5h8VY4TjH8XXhu3mirY9Imu-1zodQb1_8LeMyiWQ
Message-ID: <CANiq72kacWaLo=EE8WyA_M2Pr9h1MkqjeAmqet6CSGWLvM7B9g@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] rust: time: Rename Delta's methods as_micros_ceil
 and as_millis
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: aliceryhl@google.com, a.hindborg@kernel.org, alex.gaynor@gmail.com, 
	ojeda@kernel.org, anna-maria@linutronix.de, bjorn3_gh@protonmail.com, 
	boqun.feng@gmail.com, dakr@kernel.org, frederic@kernel.org, gary@garyguo.net, 
	jstultz@google.com, linux-kernel@vger.kernel.org, lossin@kernel.org, 
	lyude@redhat.com, rust-for-linux@vger.kernel.org, sboyd@kernel.org, 
	tglx@linutronix.de, tmgross@umich.edu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 19, 2025 at 9:08=E2=80=AFAM FUJITA Tomonori
<fujita.tomonori@gmail.com> wrote:
>
> So would the function be defined like this?
>
> fn as_nanos(self) -> i64;
>
> If that's the case, then we've come full circle back to the original
> problem; Clippy warns against using as_* names for trait methods that
> take self as follows:
>
> warning: methods called `as_*` usually take `self` by reference or `self`=
 by mutable reference

Yeah, the Clippy warning is indeed one more data point that the
guidelines are confusing to the point of having Clippy complain or,
more likely, the guidelines' intention is that we should just pick
`&self`.

If we decide to be OK with `self`s in the kernel for these cases, we
can simply disable the lint. Doing so means we lose the rest of the
checking for that lint, sadly.

And, yeah, we are indeed going in circles.

What I would normally suggest for cases like this is answering: what
would be the best for the kernel's particular case, regardless of
existing guidelines/lints? Then, if we think it is better to be
different, and there is enough justification to do so, then try to
mitigate the lose of the lints, talk to upstream, write our own
variation of the guidelines, etc.

So I would like to hear if anybody feels strongly about either
direction, i.e. any other pros/cons that we haven't thought of.

Thanks!

Cheers,
Miguel
