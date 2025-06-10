Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E830EC13D
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 00:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749515541; cv=none; b=YYHVhWGkhftlr3ypLoYffaLBR6G0tK4aBXFvkhw3Ci/cxmmHerD3kq0zcWTQ3aBzH5pWEL2TfWENv/5XJD7CidNyaFKhO91mYBI2REljrB6MO5pruq3lLwfUDhu1vBcVR0958sSUFDzZvaY7ni1eXmpLVYIyLOBBPzay/FUiO+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749515541; c=relaxed/simple;
	bh=TRTa5tgGNKgNZ4KTEE4nVgJEed7wNVNgn+tUpuW+2sg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ucUZeDP6wN6wqiDHuiO+i53JzSmxkQNYrO/Gr5ruDGvX2iSOxUhTPo0b2C7c7TfW9KNWuGzZ48sWiI0sOoFMacNUq4gqEuwut0B6Sh/Myu3OwkuudxuEWKa5s2F15/8WeTGIVUMnjUSQIS8++dMN5RUzl48XQ7BRHShiXspDOek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FTzXuKqZ; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FTzXuKqZ"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-55351af2fc6so5855636e87.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 17:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749515538; x=1750120338; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RkR7kz71cYbWF63G7HL4ImwDStD1UZsWCxUigkYuYL8=;
        b=FTzXuKqZYr3vLoLGI/69GKs29xrUNT3/7CaHzdhqmuI3zbnisWpjqOM3vo+HjeBEpr
         wdAMnqwD3NMEYBNjaptlYdUU0Mz125FWqYvZqVhvM1J9LiXYGt/FScvw5SaawRoxJOBR
         iKW5LGCk0qr/cxbHjbI+6Wc/Dh909kYNNpsqU7VhuGWXE5qOXEUMjXA2wIsqy6G5YZ0j
         kF0Ja4Qj0zFKfvFuKCFDoMJb352ZDOIpJG1bvwhOsr8hCQyo1rfd9zXrw8dsC/0W6aQH
         1z53NrMczyFtM+8AKZa0T5fyzRjDAC9glXycE7SSVdqSjdWIi/915md3ZRS6iIu4fVtZ
         rZig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749515538; x=1750120338;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RkR7kz71cYbWF63G7HL4ImwDStD1UZsWCxUigkYuYL8=;
        b=QEMXXcllvNa+3dDN3QAJ7yWh3amqZiinsuoudZ97afAV4rC3+nJz2oDv1Yr+B9n4SZ
         IAF+3/vl5xaQPI0brvDmWTsemjxZX1FncSJsqd5fcAo938TTZM+O6N0wP1zLkY/WEDOO
         EXc9HqaO3dPWobD9CJ5nqSfAf3O7z79nXEaScrpGJUCKdAtDQH8Qjm37hNQSEUkjVuHi
         38cEj6LEuvpANxsfXQuyAn1ZjDzE3zhhpgkrWxnG2CpUuOWn+VSDxmMyyVCPCH6ZPEB+
         HHVvVu610z8myw+QF0gBAFDAE1+NwQNhAAqshsKmcbD2FTZ/t/6DRnW1V51mK1FHp19Y
         8SJQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQmnp7MuUsFYoFV3kszL8Ux+Xq0dYZ6qfISc+QhjaeLnR82/edX+1Q9nhAbbIqOrMhP9TEFBtoa03tbpw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzKEYyMmVq4MNelTi2nIRawyLcDurHucHBu3laUdsehhg9xSDTT
	TC0U12WdK7tQtbOP1bU0Jjlux+IzHAJwyiCszdRxjaEVujVu2RUs7MumbLe1CjG4FfgtXoLuvP0
	jArURz8wdxyg1ILcfz/3UsVg3cxfpdrwWG64l09Y=
X-Gm-Gg: ASbGnct9dLfp868ujIAIVweUO45vQRAOQGGPCxJt9QkzrfT52RkW012yS4/wDtKQzxb
	3ZCu2S1irnsPqv9QiUdE7vK+64ZuQTyPDfpX1uFiw5DWBQ50eQhsA8VjE2glHEF2lJmTCaJGI31
	A/p39NZHh+Jyc+yr8KDTrPPJyTSKgKoHfqayliyRnhNMoTKrJgb15d5oEVQSKPeujd1hpQzTDXI
	lWrrct2lg==
X-Google-Smtp-Source: AGHT+IE+QOoB+4EYkwNJ33qqgp/tdWSsvGDCg0LnlaKl1vhEEW7aFXBIZWj+I+z8posJeAu8MG6ZSGa46ECVfUTLj48=
X-Received: by 2002:ac2:5d30:0:b0:553:653f:1b21 with SMTP id
 2adb3069b0e04-55366c359fbmr3006474e87.37.1749515537762; Mon, 09 Jun 2025
 17:32:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250609194611.690678-1-richard120310@gmail.com>
In-Reply-To: <20250609194611.690678-1-richard120310@gmail.com>
From: John Stultz <jstultz@google.com>
Date: Mon, 9 Jun 2025 17:32:05 -0700
X-Gm-Features: AX0GCFstX1Bjaf1o8eI-RH5fmIWj5yx6wc9FKIaHmt8_ONMOjbW0Gb6B3l5whhY
Message-ID: <CANDhNCrVtK9Tv+d1=z1yrh4OxiS+neENQejD5pCi+R=Cwra9Xg@mail.gmail.com>
Subject: Re: [RFC PATCH] clocksource: Enhancement for clocks_calc_mult_shift()
To: I Hsin Cheng <richard120310@gmail.com>
Cc: sboyd@kernel.org, tglx@linutronix.de, linux-kernel@vger.kernel.org, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev, 
	jserv@ccns.ncku.edu.tw
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks so much for sending this optimization in! It looks promising,
but a few comments below:

On Mon, Jun 9, 2025 at 12:46=E2=80=AFPM I Hsin Cheng <richard120310@gmail.c=
om> wrote:
>
> Previously, counting the value of "sftacc" within
> "clocks_calc_mult_shift()" use a while loop to determine the amount of
> decrement operation for "sftacc".

This is just a direct translation of the code into english, without
any context or explanation as to *why* the code is doing what it is
doing.

It might be better to explain first *why* the calculation is being
done, and then get into the limitations of the current implementation.

> It's equivalent to the position of MSB of "tmp", for which we can
> derive from (32 - __builtin_clz(tmp)). Use 32 instead of 31 here because
> 1UL should be treat as an amount of 1, not the index 0, and even though
> "tmp" is of type u64, since it's already shifted right by 32, only the
> lowest 32 bits will be possible to have non-zero value.

I was having a bit of a hard time parsing this paragraph, so it
probably needs some more work.

On first skim, this also was a bit confusing as __builtin_clz(u64)
*seems* like it could return greater than 32 (but that would be
__builtin_clzll).  So the (32 - clz(u64)) bit might confuse folks, as
It's pretty subtle that __builtin_clz() only works on the bottom
32bits.  The code should definitely get clear a comment on this.

And thinking more, would using ffs() be more straightforward here for
what is wanted?

> This change is tested against a test script [1].
> Result shown that it can save a significant amount of execution overhead
> for this function, which is invoked often, the whole system would likely
> benefit from it.
>
> -----------------------------
> | old version | new version |
> -----------------------------
> |  11500.6 ns |       44 ns |
> -----------------------------
>
> The execution time is reduced around 99.7%

That is impressive, but should probably be contextualized around how
often one might expect clocks_calc_mult_shift() to be called.
It still looks like a good optimization, but we shouldn't over-sell it
unless there's a concrete impact to users.

Thanks again for sending this along! I'd just take another pass at the
commit message and the comments and see if this can be made easier to
understand when someone 5 years from now is looking at the code.

thanks
-john
