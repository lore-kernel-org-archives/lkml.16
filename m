Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F175835963;
	Tue, 13 May 2025 00:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747097432; cv=none; b=M24OV655kKYh7/5gnqoLXejRa6PVOB3WDg+6EeL7coraLpbPDa9Hddsd6WQFDwD59v2CFLGHfGDvh3fFJzIXmhTzBSb0O7UejN9W6azfVsaEo0SMcIhljBafVkUGNz5SzmMCMfbqUJeLKIK7aFBb1Yovql5qUsjQVthRhuS9I/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747097432; c=relaxed/simple;
	bh=pKJ3zzQ2o+0ek73CqN7VAD01BuP66vpZIIDFYMfhxik=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RR2RZxTHilIeil7ASU6oM9hKCLfA9YF1AYfU241pI948rfz4GSga1Esms8LfVMj7wlONsmdF+labbDbh6VGf0nSOc3VxaL1FS4cmE/ypXDZzJVGkXEu6qWZNH9wgspuL3NG66m3GNx2SpDwPN15lpry7WKoNS94D9JY7Flf9MaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QQEPzcGo; arc=none smtp.client-ip=209.85.166.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QQEPzcGo"
Received: by mail-io1-f46.google.com with SMTP id ca18e2360f4ac-85dac9728cdso141084239f.0;
        Mon, 12 May 2025 17:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747097430; x=1747702230; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pFExgw6I64CfiBILuJYy3YAdnSGdTUqnVjigSWHrhlk=;
        b=QQEPzcGomExo/5cgtYKivWhVO9MXN2aQAW1kxk0Yu45yZaxS4k+ZGnVvZ0SEL1VxeI
         itBn+KqyUrNoe/mwzoQsCngpTvfOiAcyZSETVGsB+z5SloAeVM0w+27ay/vQck+E+xX6
         zhzxZN4glxX711hZV3vciRaTWKSLi58CivdiDcSDqileEiLGTR7fOWeCLFbsDr4xgJ9q
         sa/5aSpxz8PWPiz61Um3HBeO21X/KLUuSZTpKmKIA6q43oeUM0l1b10gRKvq3I3KIvP5
         fXoC8slzvj7cT+4FAYzKxsmEfR5uuZu2vG0PK94OnIA0ZXuMulkdYuXdQZjhYKPeVdxR
         nZtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747097430; x=1747702230;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pFExgw6I64CfiBILuJYy3YAdnSGdTUqnVjigSWHrhlk=;
        b=T7aU2jKwdMKqPJisUBZltRdAgsTlgC75Qx1G9UFss9qEtCbZIb/wMyPldGX6lunRIk
         P9AqPL/aTRUgBb1nKPAwsqSm2I1K4GJ4lZVtCwXAfYdaOcohSLNIHi5k8QMgroKbHYde
         xCR+cmXc279SEnOUadgCJvrFAYjYhTdUcPZMVy9aclR3WoSo+ZkNXODFStTxE4Qq+SAs
         S1trdN9pRzOd1lHIzgkuhu5ApuLj/UJyTVd0AbJMzOUQnZyytp8w9Ud3DHJfdWrW0Iny
         M7bnLWcBlbRvMHx7EcZD4V8yTC2aqMFHg3f/40IjdOkBeJnZItsvtKxfWZeF9znSGXW4
         rfbQ==
X-Forwarded-Encrypted: i=1; AJvYcCUtMYAlcif9Un+Zijij+CxYVWaFxiBP/y1nrqxB9AOnnFfTvwN3XTbZglzQr6/bn0g1TVdzfmQxhV8=@vger.kernel.org, AJvYcCVfFmxjcwZXaEnGUPfpK0bPOnaSMUMOO9nC2y8YNHrR5LercDZzqLycg8I+7y2pajkDnlg2/D4noAqesXs/@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5c3E3Wh0YgBlGlTBcwziDTsPILz78QQkyxAq5yeiGZLDDQOLX
	Y9OPsAuWfJl63Q2VwzhYuyzRZTnzjcta9M5DFMvRwfNeJol0l5G1J/bn04q68R4d4Ugq/q7kik6
	o7rpJKneRXmLBcaduoKP4V4+v5i52ttTN3Jg=
X-Gm-Gg: ASbGnctwdyNchmay6KdgUExy4OtrNkCDz3mYuB/KSYs9eqkVgbeQNXa4WCb77Y1wrST
	cbFr+l0MmLhKjk42OZOpjnjarZOq64NizrTqyvxkz1uaASUiOuHkbcmN9Gekf8W6UTxMWNIhHJm
	t5T+1TVNA//P1K8IG+Oh1MjS0PBASquH/f
X-Google-Smtp-Source: AGHT+IHg1M2nc8+AJQ2gyRTnCOW1RGBKSDLedExyUbzzJBOgk/rK/+JPsywaFblhSvrc696dqyzd8z+SAAgyUECzWu8=
X-Received: by 2002:a05:6e02:188d:b0:3d8:1d7c:e190 with SMTP id
 e9e14a558f8ab-3da7e1e7416mr180384915ab.7.1747097429935; Mon, 12 May 2025
 17:50:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAL+tcoCVjihJc=exL4hJDaLFr=CrMx=2JgYO_F_m12-LP9Lc-A@mail.gmail.com>
 <aCGR4EOcWRK6Rgfv@smile.fi.intel.com> <aCIL0zZvf1fvTahk@infradead.org>
In-Reply-To: <aCIL0zZvf1fvTahk@infradead.org>
From: Jason Xing <kerneljasonxing@gmail.com>
Date: Tue, 13 May 2025 08:49:53 +0800
X-Gm-Features: AX0GCFvYJrRX6jNEfyngKE_7qQIdJXCJWq9aLLm48eKkDFEPwUalY3JU0sUNA_Q
Message-ID: <CAL+tcoCJxoiGi=Ea1KCG4_ri2=GbNhhVhEV5anMLyai6qg2zeA@mail.gmail.com>
Subject: Re: [PATCH] relay: Remove unused relay_late_setup_files
To: Christoph Hellwig <hch@infradead.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Andrew Morton <akpm@linux-foundation.org>, corbet@lwn.net, linux-doc@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>, linux@treblig.org, viro@zeniv.linux.org.uk, 
	Jens Axboe <axboe@kernel.dk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 12, 2025 at 10:55=E2=80=AFPM Christoph Hellwig <hch@infradead.o=
rg> wrote:
>
> On Mon, May 12, 2025 at 09:14:56AM +0300, Andy Shevchenko wrote:
> > Also note, we usually do not care about the out-of-tree users. The main=
 Q here
> > why are they out-of-tree for so long time?
>
> We do not care.  If some of this ever gets submitted it can add the
> needed helpers back.
>
> This entire discussion is silly.
>

I'm surprised how you described it....

Now relay works like a filesystem which helps out-of-tree users
transfer a large amount of data efficiently. it's totally not like
other pure dead code. I meant what the trouble of just leaving it
untouched in the kernel could be?

Let me put in a simpler way, two options, 1) just clean up, 2) keep it
and help so-called 'out-of-tree' users even if you don't care. I don't
figure out what the difficulty of keeping it is :S

It seems that turning it back to a filesystem again is the only way to
stop debate, then no one would clean up its dead code and reckon it's
obsolete any more :S
