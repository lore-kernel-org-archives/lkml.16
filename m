Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 567062E54DE
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 21:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750194637; cv=none; b=BjKYNQw33fpcp7Mz3w6ypMX8+g8L9YSsdPXGuyrAiVlDiBoOIcBGcPg/XMxVE254Cm7YenMWfZq90fo6g/Q8JnvrR6kwzz2Gyf45FpHxInJHmQ+/IsuXdVe/WDziINpb4EvjkpPe9BpXGke3Gv65Ljnn3L39fT4au+JjmsU8STc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750194637; c=relaxed/simple;
	bh=ir2qXEQz0ITQfoN65/zED7gUfzbFZUXr94ByJGJvwQY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SUw4IXJgQy/Ui/Owxip44mBVu9jNjCHqA3DtWvfNShGRifWDqPWvcWYCJWLvd300MTzoZxwrHuXlPGt1TKRGBSKjzi0tH994UwD4Z4x96CUOORKn4lEWnkFLlqPt5F1kWsTTWJHHaID9qXZdSeupziPMRGDCMFiJ/pADR84JL0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=HMsC5FfB; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="HMsC5FfB"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ade750971f2so806345266b.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 14:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1750194633; x=1750799433; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NscEjg9Y1LWinfHLpsahI5dfBkkxck14FsEzSEH/mHM=;
        b=HMsC5FfBBK8m1OzFzla6fblWwkNIzUHDmGhhJ8yI7xn5y17BmMGS+n9v0OX3/0ZUok
         05Ye3ty1blfiv0qAEkOtr0rGdneAksgoWTKeUx1NmzyaJCi2GjCR2iMXQ3sjkl0sGEcj
         uxMct+ygdjDVcBLicGWBCL8TFCeFJsYuQOOG8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750194633; x=1750799433;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NscEjg9Y1LWinfHLpsahI5dfBkkxck14FsEzSEH/mHM=;
        b=fAJcCLmN3Mqz8O+/9AAPhkQYqY/QByABERg+Es/vhpslnQZ7pRKSfErEuQzaRbO86e
         9JeCOyssIRpLf4uZq2p30HGFFUwarFb8kwvVPRXfW0kEvsmheEmWD2ogLP4FQJBGgWuK
         3pHE2SXZ5Jzv7p5y9RcJ2RPH2G5tN7cgHZK39Ill08Y7Sgz3cZeO+imi2j1utW+I9YeG
         8d7ykOdnXNjkF9Yz1zc80belXM9hqyP9SRvSP2mfXQjTUoxMym5dZFVFCuG2STY7xZnj
         /mX6m9LCCg00hsMOg0WVxEB73qcdNG1lmERmlSNyM+s5q183yfLm3ykdslwLKWQf3YlM
         HW/w==
X-Forwarded-Encrypted: i=1; AJvYcCUDOj29aomf+ilMwxnlTADy4uWZ6gv4M1jmpiFIdiWv3NlRnt3XJqRPvUCkCwwAGoHuWaMJJqw71W9GyeA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyODrdlLVieniIRSgIzNQITB7Wv8ARrgeWlIz69WEicgZpDF1v/
	yyaj4JydEGS0fFMdKD0z9bgLl+jIX6U3BOD9qumDhqn1H/Ll4AwXLj5E07Vhgac8gld0Vn1seG9
	VsjzETkY=
X-Gm-Gg: ASbGncs9rwuuyPsGsaGvGWfEOqGoHd6+LZ7+erf939qhRHdlU7czjtVxTiO25S5EkPy
	20kzZGI+B3hY4FkhpduBfqzuzVeSalXg1888IJFssNjbfOSTp33pfnE7DRZo7R3NM2kYqGn/1Dg
	xbTK5q6iLWDMtAWRwK3gVSlNAaYYCd1RbbdlnT295L3hU19EimMkA6G+6yY1WDVn/ahokFVZ6TS
	bnpQR00N9rPSgJM2mNTXq9sykngo8Qxli6BbVdSGJZguFTctsp35K8DoUHNkzZqzJN13qldoEOz
	BLRAeA7h2JyHuccDJDctodtMfBif0m4pfjFRDfrZCbDboxP0frgFvrjg/6h2wkOlAG7e4fN820w
	iu5quJRjxYhRS8kvkvdaDQhTxAs1ajlkD48DGZLiU9S9fIek=
X-Google-Smtp-Source: AGHT+IEAOYBdzYn+NO4BMoLEPoFZ2TICCfsAPMa0lc0PKl2T526FM9j/LBlkuR6yz0cdyACOQYAFAQ==
X-Received: by 2002:a17:907:7f26:b0:ad5:430b:9013 with SMTP id a640c23a62f3a-adfad451756mr1401887566b.42.1750194633524;
        Tue, 17 Jun 2025 14:10:33 -0700 (PDT)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com. [209.85.208.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adfddc96709sm428844466b.134.2025.06.17.14.10.32
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 14:10:32 -0700 (PDT)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-607434e1821so9004384a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 14:10:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVQkYuN783PTg8j5SP2eCigaM1iIDRcoBHgRtr5HO3/jUoXWkSahL21D+yTnwVfNV27Pju0Cgx6QHROljk=@vger.kernel.org
X-Received: by 2002:a05:6402:5188:b0:607:f55d:7c56 with SMTP id
 4fb4d7f45d1cf-608d097a0a3mr14798722a12.25.1750194632040; Tue, 17 Jun 2025
 14:10:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250616014019.415791-1-ebiggers@kernel.org> <20250617060523.GH8289@sol>
 <CAHk-=wi5d4K+sF2L=tuRW6AopVxO1DDXzstMQaECmU2QHN13KA@mail.gmail.com>
 <20250617192212.GA1365424@google.com> <CAHk-=wiB6XYBt81zpebysAoya4T-YiiZEmW_7+TtoA=FSCA4XQ@mail.gmail.com>
 <20250617195858.GA1288@sol> <CAHk-=whJjS_wfxCDhkj2fNp1XPAbxDDdNwF1iqZbamZumBmZPg@mail.gmail.com>
 <20250617203726.GC1288@sol>
In-Reply-To: <20250617203726.GC1288@sol>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 17 Jun 2025 14:10:15 -0700
X-Gmail-Original-Message-ID: <CAHk-=whLENPVgWtHg5jt42he8Eb2pFzZngbvfSWXUmq64cyaAw@mail.gmail.com>
X-Gm-Features: AX0GCFteh8AxHdG-O3SktB-Vd7hTjMUC_EBJsHwrbakY8eEhqvV4OBO-zVcDyV4
Message-ID: <CAHk-=whLENPVgWtHg5jt42he8Eb2pFzZngbvfSWXUmq64cyaAw@mail.gmail.com>
Subject: Re: [PATCH v2 00/17] SHA-512 library functions
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	sparclinux@vger.kernel.org, x86@kernel.org, Ard Biesheuvel <ardb@kernel.org>, 
	"Jason A . Donenfeld" <Jason@zx2c4.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 17 Jun 2025 at 13:37, Eric Biggers <ebiggers@kernel.org> wrote:
>
> Okay.  For now I'll keep the test commits last and plan for a separate pull
> request with them, based on the first.  I fear I'll quickly run into
> interdependencies, in which case I'll need to fall back to "one pull request and
> spell things out very clearly".  But I'll try it.

Thanks.

Note that this "split it out" is really _only_ for when there's big
code movement and re-organization like this - it's certainly not a
general thing.

So you don't need to feel like I'm going to ask you to jump through
hoops in general for normal crypto library updates, this is really
only for these kinds of initial "big code movement" things.

> Just so it's clear, this is the diffstat of this patchset broken down by
> non-test code (patches 1-3 and 6-17) and tests (4-5):
>
>     Non-test:
>          65 files changed, 1524 insertions(+), 1756 deletions(-)
>
>     Test:
>          14 files changed, 2488 insertions(+)

Looks good. That's the kind of diffstat that makes me happy to pull:
the first one removes move code than it adds, and the second one very
clearly just adds tests.

So yes, this is the kind of thing that makes my life easy..

> Note that the non-test part includes kerneldoc comments.  I'll assume you aren't
> going to insist on those being in a separate "documentation" pull request...

Naah, they're relatively tiny, and don't skew the diffstat in huge ways.

             Linus
