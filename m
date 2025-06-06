Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35B0324E4A1
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 06:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749191274; cv=none; b=U85bqmc4NyG31nTFCXIiXsZBJAC3q3XUijZgEJniWtjYvdamjk/8kLFdQhwsHb5do1KGeCawOPuiI7sbmqbs/EIxQXvsI1rx7ZdFd/aUuxK8olhu1skA1HvnJWBsDP1bE6iPBvvM5BOJLcY4A/xlU8VX0lzt1MsSv8Cru3VkQQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749191274; c=relaxed/simple;
	bh=/6CeuiLut9XVucvvljmh0853EV7UDDXs/x4UmqOUs3c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MvCsvDacjtj+adb3TnN00E3UR6xn+TjuHTO5pc41xrkij7f2A0GZ+z42W3F2ROnBwsiVaktC9QXO/de5phJsOfBz/MWR9uqmtqf59L5+reb1spCNPrGPg6vnBU9hMnAnHDSeWc7+Y6ZvRfNJ+7CdoYRWsxebB6dAwK1F2MDEZL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ccwLfdR0; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ccwLfdR0"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-551fc6d4a76so1817972e87.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 23:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749191271; x=1749796071; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tzDIUNzlZzE8Exp7uJq4kZitY7Z7cIX3lYetygV3xS4=;
        b=ccwLfdR0IpV1glLUzc1+Xu6FyVNb/ivfzuHJWR5+qGlW24b8FUvS066pHN2aOINM/I
         QKXLx2d5uOoy9Mc0pYTCeAov5snRps/KgNzYXSBAehKAmgYMYD11z5/Ck3czJRpk0AkU
         Z3ajccxUdJRmMYOhE4wXETyppgIagL5iFLsKN27xx57bFTgtR8/mZ0cbUWH9Kc9IZHLN
         E4m0OxR4SrnTjMxk42DUpyxwGcukd1vnXiX+Qux08mHu86xvRgA9V1RrQQGtsyR6jbfx
         oalKdz7gnj0xUei1pwHlbJS9Ux+OAA60z4lKhHYKzXjaVAv+BQ7Ug6prqT0sohbxRTMF
         m7lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749191271; x=1749796071;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tzDIUNzlZzE8Exp7uJq4kZitY7Z7cIX3lYetygV3xS4=;
        b=k4qYp0aA38F8XOasPEuGI0NPEGR0rUtu34prnavKqgNSW1hXgTbgsv4s0CadXuRoY0
         jpaTJCn2Wh6e4ZuoPaFJj5pNcO8hsWwIFA+oOwKRp6oZJk8HCqtWxUjlgCtezfyZ5oR2
         X6tW25NI3rQpxOqtaHt4rEXOSJ3olhv4pcOBtEPJoXxW752+dJTvybGSjkvLgqHdVycW
         t2d/487XSLFKPuPsuD5Dqfv6caUWjIbiwUJoetgnnxJ+alfi3Uod4Q0r6gzffZL51fst
         SZNKvAPyjdcFRX2+X19GaRmARArZjS8B+mA48aGUQJ/dPVfPeY6Eub4nCNVRMHb3/SUw
         e2lg==
X-Forwarded-Encrypted: i=1; AJvYcCXmrH/iplEwMYuaUBj7Ldk+pAdXQyManKtVEH1NafksVeSXl8l1l1LEt7WjsIMnUU8HhZY3u75d/W7bwp0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyeIZxrAHnwYfh/6psgFHD2ot8vgVUQb33lhCcguGgJdOY8zLdr
	SBgnPYCvU2X5nqp6VgJaD/XdfhXsTdPnSpUNXB9/giFg2ZbDjnLSFRSU2xQF0Q6dzAqQXf7uO8t
	LBf8bjSICFTBSn2lpT4n8l80c9k1QXWy7X1m6zRc=
X-Gm-Gg: ASbGncvzhL6fXKE2a2brEDaeEifhFDdagkGsC1e5tw4KGkOC1HVLhHE0UGafKwIibym
	tsoBujvNbhMAXggAQO37d8o6MR21F338Kkyj71O/X97T9Dm3UR67H/9Bi9aRQrP0aD6ex004cYh
	cAEP0FrWdkz6ctxgYvrfqLcDAVsNZZSUfq
X-Google-Smtp-Source: AGHT+IGeMMe/IEfSmGHrjkKKtJpK9PNQS0qXxBBszE1Swm/h32AeISc6HAC99hfCMUixWLwv1PU+pXk6joS65XpGV3c=
X-Received: by 2002:a05:6512:1294:b0:553:543d:d963 with SMTP id
 2adb3069b0e04-55366c30244mr466930e87.36.1749191271080; Thu, 05 Jun 2025
 23:27:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250605164733.737543-1-mjguzik@gmail.com> <20250605190054.GH30486@noisy.programming.kicks-ass.net>
 <CAFULd4b1dQO3biWvRoHfpyE-Bot0urmWDzxfO0dEverzuQOpdA@mail.gmail.com>
In-Reply-To: <CAFULd4b1dQO3biWvRoHfpyE-Bot0urmWDzxfO0dEverzuQOpdA@mail.gmail.com>
From: Uros Bizjak <ubizjak@gmail.com>
Date: Fri, 6 Jun 2025 08:27:39 +0200
X-Gm-Features: AX0GCFvjfb_7FBAh99GgftH7Lniw5WfTdcvevEmNBvdRrc32to_dxITK1kHneUs
Message-ID: <CAFULd4Zito-1VasojoL7qZdu_yggDgQL_0qMSv6ZBrtMe3i1zA@mail.gmail.com>
Subject: Re: [PATCH v2] x86: prevent gcc from emitting rep movsq/stosq for
 inlined ops
To: Peter Zijlstra <peterz@infradead.org>
Cc: Mateusz Guzik <mjguzik@gmail.com>, torvalds@linux-foundation.org, mingo@redhat.com, 
	x86@kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 6, 2025 at 8:13=E2=80=AFAM Uros Bizjak <ubizjak@gmail.com> wrot=
e:
>
> On Thu, Jun 5, 2025 at 9:00=E2=80=AFPM Peter Zijlstra <peterz@infradead.o=
rg> wrote:
> >
> > On Thu, Jun 05, 2025 at 06:47:33PM +0200, Mateusz Guzik wrote:
> > > gcc is over eager to use rep movsq/stosq (starts above 40 bytes), whi=
ch
> > > comes with a significant penalty on CPUs without the respective fast
> > > short ops bits (FSRM/FSRS).
> >
> > I don't suppose there's a magic compiler toggle to make it emit prefix
> > padded 'rep movs'/'rep stos' variants such that they are 5 bytes each,
> > right?
> >
> > Something like:
> >
> >    2e 2e 2e f3 a4          cs cs rep movsb %ds:(%rsi),%es:(%rdi)
>
> This won't fly, because gas complains:
>
> z.s: Assembler messages:
> z.s:1: Error: same type of prefix used twice

However, it is possible to use " cs ; cs ; cs ; rep movsb". We can add
a compile flag to the compiler, and it will be able to emit the
desired sequence.

Uros.
