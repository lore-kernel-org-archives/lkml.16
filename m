Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF8F2BE5E;
	Tue, 20 May 2025 20:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747774762; cv=none; b=PoblS0ZKg5dxcnz7mX6v9F6zhOlne9rut4iYDWANhoN6Dpq88GQbDIjTB9RvV40QjsAxaqe2s1u5fI1h3/FZ0MIM2y0KdNB36AF04Lqu0SSN/igtjyOlZ/zAOuXck04tsohlIgfsgw+yuVogTaqbAUdn1AdeI8mcSvBQT2K89wA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747774762; c=relaxed/simple;
	bh=q5KcfP90dN/T9Mg+SdalKw+0adx0XXosjT/FvEsz5fQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xnpc2EZm1eTb4TX4wRV3ewEO7COULY8/OyDXnrKsWPi8qX5q7Qivgo4NgwXcLE4lpyXnWO6QxX/gwg/vCr6uzYMo7SPuixKRR4lnZkOwCflhbnIRhvJxD/+9V5fiqAcdvAVfBxGdFa+G8xn4uUV5/6wPP1yaOGxdzvZzwAdVkgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xmd10ndh; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xmd10ndh"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3032a9c7cfeso968821a91.1;
        Tue, 20 May 2025 13:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747774760; x=1748379560; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UHwjdpsi/AzvsQnl7KqQJsfhwXjWFdC8xkE8bxdxejY=;
        b=Xmd10ndhTF/jn0IALnTSs/ghk/rNYsRBlt3vuuKAkHbayLSDYY/lv/bHkXmBEGjuv0
         o92avElpKs/89okDy5RWzYX4aBShuegjB5cH6T+H++Ik91SK6heCn2S/ao1RxSPlhg46
         OMGElNb7qOtnlAZuOP6cK0ctvas9z7TBe+OoZxbYShYEsMNqtju079csHtqCnK031zCH
         QGAhpRZn6sbVkTCGpaM5H9FZ0+9EM31lZnhIt54PKhqcJiBtTMAFLRK4WnRXCAlLN44m
         i94EwWMuLY4j8aO5JxDoP/T0Ltcc3JVNjDWZgeHAPNBpoMAvT0mNZnaaSxcof7h+s5sO
         MHHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747774760; x=1748379560;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UHwjdpsi/AzvsQnl7KqQJsfhwXjWFdC8xkE8bxdxejY=;
        b=rEfxNvPMzOjD5kqs0JeaL26VbduQsfShl4b75bEJh6j+vHM4MD78NzXRMv9h+zecaz
         eV6z9NrewD40G+nb0VF/C+S6/ia0AlesLyN8K2WuDt6S5xaSc2UxwGR0NQE3qmbuGxNF
         1405Uf7685jC8m4m/5UPA687VcOvrIPzFhyBIxYhyb7yLlVjaJrEwQXrrzy4hyMXumr/
         a6lS3QgsEMsQ1+4TpFvxlItH6xsMAynazoW/GBPirGEgkU2Cy0x63iZYJAGA2Ontu+ex
         mgU/Zim5a10C6IbTpv/pFgTtuhxvovTbeHHGb3L3u9JhGyOUJDZ1TjpCtRJqKtlwkT9H
         Yv+g==
X-Forwarded-Encrypted: i=1; AJvYcCWG5de3WjVpSveiUf+uHYRxyuORWUvbFyAeZeUBIQi+q2mxvlkKEP3RG4+ERAiN7FsUA9IY3BZX1p8Akok=@vger.kernel.org, AJvYcCXpLC1XOhoCo70E+q35IyHo87rw5XOgHqmpqbkSiCbT8TTNhiQuOqZ+OCD+sHOVe7CwS29rBRSYwCNtKBCem1g=@vger.kernel.org
X-Gm-Message-State: AOJu0YwqX48hMSPB8MCLSaSQraC6RImmSmomSZEbRuEs7ULqsjgSmZ+5
	WPT1UAboM3HaCJ3/RRJX/8iowtonQEf0d9m3lR2JgfMY0o0bPln4SXbEw7s9I2c/c4MGWeHaVMY
	LlVSDHn4g/U4dJuNP6pXDAulHMm5fcnA=
X-Gm-Gg: ASbGncsB93hajRvxUMEjYBAOvabwwHU+H7kd5xvHhw17dgTFjtN8DSBwNm+Ta6IoPb/
	COEs4OQ/R5VLODJPGdqPEZHWTrP+RskMz1FqNfyZcKGsoiDE50IBTZCR4OdtrEOK31DwXOuKSWe
	xUcDeChQF2OQMn+UYc8GEEOAefiZkVsmDUBXaTT/Qh4Yw=
X-Google-Smtp-Source: AGHT+IHSh2Ez7DqS5SylBUy5xfjUaW77lu16/Pj+leUne/FZoiF5pEF5fDTSu+q6YTmS9r3Im/CxMmw27QRna8Qa3Dw=
X-Received: by 2002:a17:90b:1b04:b0:306:b6ae:4d7a with SMTP id
 98e67ed59e1d1-30e7d5bdb2bmr11018568a91.3.1747774760073; Tue, 20 May 2025
 13:59:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250517002604.603223-1-jihed.chaibi.dev@gmail.com>
In-Reply-To: <20250517002604.603223-1-jihed.chaibi.dev@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 20 May 2025 22:59:07 +0200
X-Gm-Features: AX0GCFtlh5YMGW89tpCWW92KV2_u5QZFUB66lp1_ViXAXBMJwJiscqnzkKMG5PU
Message-ID: <CANiq72nZ00SjqdnxZ0u2vB2ROyjr-kJPLDfYtoKA3AtJA8+1mQ@mail.gmail.com>
Subject: Re: [PATCH] docs: fix typo in rust/kernel/str.rs
To: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
Cc: skhan@linuxfoundation.org, alex.gaynor@gmail.com, ojeda@kernel.org, 
	boqun.feng@gmail.com, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 17, 2025 at 2:26=E2=80=AFAM Jihed Chaibi <jihed.chaibi.dev@gmai=
l.com> wrote:
>
> Fixing a minor grammar error ("then" to "than") in rust/kernel/str.rs
>
> Signed-off-by: Jihed Chaibi <jihed.chaibi.dev@gmail.com>

Applied to `rust-next` -- thanks everyone!

    [ Reworded. - Miguel ]

When sending a fix, please try to find which commit introduces the
mistake, and then add a Fixes: tag. That helps a lot when figuring out
if something needs to be backported etc. :)

Fixes: fffed679eeea ("rust: str: add `Formatter` type")

Cheers,
Miguel
