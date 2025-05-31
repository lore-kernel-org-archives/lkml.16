Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4543E220F56;
	Sat, 31 May 2025 11:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748689536; cv=none; b=b22JGpYbvmV/qqphji26dUo1loFGettYdhHZEiCkcnNaq0mAgUxu7FfjGS6Lpq1j1ZoE5VOwbsgZs6oAth0juX5HlJ6OO+vadpS6hQk6UsLYilbroqpZlIp97QUyyWNcW09Pwbnv2NfTVPNbwRgNYvunN/Nl57sXoYv4jJAl84k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748689536; c=relaxed/simple;
	bh=dYDKXesgHkdXXeckfKtCNiqnxIHSWdQGcNNgbHW5FwE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YaQ5rrEdo/cmIGMMDj86L1e+DmmcykVgDXSXmqRt+Wr/6F8tn7eTcKCxXA/dUsWKv8sSzqGorwJMwgdWpL/mhGrTO9wjPNK1myevBUWzDyKFIyp0rk6zXlL4/Hg2VzFQFDGs6n3UyxjDFiqiOBiSNDjmcCvvuprxpJkvuxPkI1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l3x3cLQ5; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l3x3cLQ5"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2322d8316f6so3661755ad.3;
        Sat, 31 May 2025 04:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748689534; x=1749294334; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dYDKXesgHkdXXeckfKtCNiqnxIHSWdQGcNNgbHW5FwE=;
        b=l3x3cLQ5WhBv5FksNnJvzkefnH/11ApTYhw+PHXO2RH2T7cw8lmwKznrNM2c5NnbQp
         vYTEp/X8Y/cjO1e0tcYlZpMay6rzCNBgXWV5HgsjDg5AR258UgnmyQrxBB6RYl7gF9uB
         +KsY7OAn9OdcZWYe94d+2i/ki41IShtDa6PNZ7WMdSO8erQvSxikK47HcgSay1x4aI+2
         9HhWisxEoRtlnwaGtK0/2kbrXtnjaq8UZdrIb4lbglZBxpbA0fya1y3T9Eg3WvK1kOk3
         3ChAN73vkdkoTOX/08+WiSKO8/VKlF0GiN4JqaRIGV5wjuJKH3X6nFx6RyvLVNTgjXEu
         p4uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748689534; x=1749294334;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dYDKXesgHkdXXeckfKtCNiqnxIHSWdQGcNNgbHW5FwE=;
        b=Qh+jprJDquA9hraffUrM7PB4000whTMAJbkcoj/TeHkfSLoyfSJj4Ozav0COvsuPrK
         V8zSE524t6TxvXtDaJzcW+gUaK5vmKLFx13ZS7crg/iPq9P8oVXammUCZIjCi2tf5e0n
         3cFAfa39AE5QMLz4XayoZxLA7PNpE2m27GeVMSZpDCaaCrhh/CUwGtD6NxPTrj793HWd
         Y2JWQNxDiyv2i7fuDWO8agxzMqGwKJy8BY6aQrrpR1m9jD0JQKq5LX6iBwkJoqqEPQn9
         UvQ5vR5XGYPxe00tBjldQk5kr/hLcKWh55EKjRxOL09c60R+oolWerQP+n488kYw1BaY
         LtHw==
X-Forwarded-Encrypted: i=1; AJvYcCUuDOyoSenc9FXVYSqvxFiDKSBHGuCltdj8mBmQGXzT15LesMl1tPMPlD0ack7aIKjd3MFyKeXC8LBhtYw=@vger.kernel.org, AJvYcCXes27yghyu66B7W2yRyjAgcgO2Z8rTB7RJeq8HS0KbtTgmu2F69jWfUErcrJlourAhh8VYmdWLVQeg5WT2gVM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzG7jdXp+NhVeR+lk6QHDsBinsUABV7OyyUKzSlihAwe2twziRQ
	boceUZH/umL303Y1jSb7MdHqyrQ4gj76OcEmIXH27OUBA8KXRoR2VrCbYZhtF+Jmsd/efXKv/sV
	7Yv6EpjNCQTH3b1T8OsrlqbdKPi+MthM=
X-Gm-Gg: ASbGncusEO6FVQwVEXkjqWJJQufSGPSOM+8LqLfFLqR/nx2qVtwbSAxpTApxVuBp+nb
	ZqKSslb3+3xNgdDP1poXrJWatiufywMMmkTisqCFieBy/dB9g6DFX2uvezXEhJ7K8WXcM55tZSA
	KX6V6oGbs+42jlmilzfEsDaQle+JP6FJq2H28zJmIpTvgaWjfXtc211g==
X-Google-Smtp-Source: AGHT+IHr0F8f28AYuxYXH9ARPMLJdMBMX5+b9+n3J5cdDU26jX1yTPwIm+xgtmwf171/lr9FNtaP2xnoPF9dJCvL0lc=
X-Received: by 2002:a17:903:1a68:b0:235:737:7a8 with SMTP id
 d9443c01a7336-235351e09b0mr31579385ad.3.1748689534463; Sat, 31 May 2025
 04:05:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250530142447.166524-1-dakr@kernel.org> <20250530142447.166524-8-dakr@kernel.org>
 <DA9RRZVPZSMW.1LGW9H4G0RLT5@kernel.org> <aDowAzvEvrQcella@pollux> <DAA6ZTTNP0CM.270XX92YOFGWB@kernel.org>
In-Reply-To: <DAA6ZTTNP0CM.270XX92YOFGWB@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 31 May 2025 13:05:21 +0200
X-Gm-Features: AX0GCFvOph2vOvoPyYINMtiojBc1C6_u1HQWHSUz7m-6nP4AYTe1_0MCnlRK8co
Message-ID: <CANiq72nx8VNjKw_P+49AcMUuY_pE2jYoybLMCAyjhGv-Z-a22w@mail.gmail.com>
Subject: Re: [PATCH 7/7] rust: sample: misc: implement device driver sample
To: Benno Lossin <lossin@kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>, gregkh@linuxfoundation.org, rafael@kernel.org, 
	ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me, 
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu, 
	chrisi.schrefl@gmail.com, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 31, 2025 at 10:11=E2=80=AFAM Benno Lossin <lossin@kernel.org> w=
rote:
>
> We could separate the common parts into a single file and then
> `include!` that file from the two samples. (Or if the build system
> supports multi-file samples then just use that, but my gut feeling is
> that it doesn't)

It does, in the sense that you can use Rust modules (i.e. different
files). Multi-file in the sense of linking several C files + a single
Rust crate root also works (we have a sample doing that).

Reusing the same `mod` from two different crate roots should also work
(well, unless `rustc` doesn't like it for some reason, but from a
quick test it seems OK), plus games with `#[path]` and symlinks.

> I really would like to avoid `cfg` in samples.

I think the `cfg` is not the end of the world w.r.t. learning (after
all, `cfg`s are part of the kernel all the time, and it is not the
first sample). In fact, one could argue that it is a good way to show
what `cfg` can do, in a way.

But another disadvantage of `cfg` is that then one cannot have both
modules at the same time, and thus 2 builds to test both etc.

Cheers,
Miguel
