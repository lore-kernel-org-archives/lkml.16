Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FD582989B1
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 19:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744312771; cv=none; b=mIlLzGFDVqjTMpfIv2PJKlXt46k2sbL9KQm8Rbwm/cI+0xXbR4f6I77+HCeNbtVyKC4dJ4PxOKOBe2r9A7+YIR10p7Coa1ZpCut4G/Z9UfJQo5efqDACbjvvFNchiJFPQP5P9XQXLbK1rfi0AeRZGbepKmTJLbPR4IlVmfthF8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744312771; c=relaxed/simple;
	bh=qLecS17V4Ykj9ANOTFkIIdgMiJiHoAwH0/7Ik0aQQjs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f2S37WOMD8pUMN9VT1iQ5MGtKRQ83mp8UhTmTIGEVJajSlPTPIyvhud6HZqUsKi4gouplK9KGrtRc8T87JTHQYi1xOrWK1Ad4ICuCWPHMWXpN/Oy6hT8SiJ3wDmz4chb8HAmRCfCN6JE0pQVBoqwb4SWNEuAZqDlkgAKHMyU92A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=btPn/+Vk; arc=none smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="btPn/+Vk"
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-86d69774081so498384241.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 12:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744312768; x=1744917568; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uJ44KL1v8cclERlkY/9+gHNrRoHqolMrfYg+/+KMHGY=;
        b=btPn/+Vk9/WlQQrF0srK5t4G50iAoanakOj1jz9+kIze6qYJQ9//+dUHSLifiVkm/j
         HVl5hXWqLiOkqUFnUltZWsl/orOjkOREjlra8gM3Qfd8oyPIf7W3a3P/aA75iyIc1PZM
         k3YTlMrEwDJi2GSDRRuTssSCo73KUPtsrd66bauXZwCvZZKb01GefbN7//Qx3fJWUYBR
         oEZ4ZBy+QsAb+T7oPUGPjlEl7DWfExs6NlWnHzSucxV+DsfmrxO67kMoMyiTy0VJNeTj
         H1+avLoJJFTS+VPuW8hL92D2fczv/zPKD0nHsgKGi/MndHPCD+OEeHVXpb8tUvVQwE3A
         /9/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744312768; x=1744917568;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uJ44KL1v8cclERlkY/9+gHNrRoHqolMrfYg+/+KMHGY=;
        b=fZitxC5DqBmr4UK2cR48NeWCH69g55pvHCbN7h6gt93WvY6mCA8bcGIE8Tqe3YXVqa
         FmPYb0rmtMx/paasht9YdVw5+CHzAfnVm0rGI6qSc9rwvckBQWQbvKFXKU+aDQsffM5O
         LUvQu6s8w1Lg+2WfG9/x5V2Pl7koJSid12qMRU6WMWRWQjckcAFJXWq/AWZE/8UQM+NB
         wNw97o6mWB4nN684X6AEzFOs6yyliC/OuSwChw1v0b3D3RrtlhzC/zILe/feRT5/mLIe
         lANzDUNeZ6Jo6Kz03d/t95N7b0wwXLMvklP91BSe3beKppb1uN0EGHweQRzPHD1RxhPZ
         CixQ==
X-Gm-Message-State: AOJu0Yxy/eeZaY5hIrj37jxVp/MAnToVFZ7+WPRBST85bndwzO4SIXxF
	h7E+xhDQxpr+oz9IyKcwSP939GJhAzKeFiKUz8LJk2ttF/d7xQGY+Yj19nC1D6LKsDlNlMZiscO
	K0KxEbB5USSueW2KU5mZMBGynn7PjYHtoh/hDiQ==
X-Gm-Gg: ASbGnctZWMDuUfOnbPdqF9xgZ72puG/ZzHSNH5ukFRw85eJjp8r1NFhaFZ9J4BMNMG/
	OrOmZIP9WAifyHi8ClIiZ/Rgng0vpYi0fU/vbbrRFADkYDw0vzPtduOK1D9zfKQSZPKee5TmBNp
	dBH4Jb41ehxRsMGxfEnV0ZqcwjhR1PBboK2yZy4xOYU0JCKyvaN7Tx4KC3
X-Google-Smtp-Source: AGHT+IHU6YSwa0MLo8eCVOlFo/lHCz4iATY4ROkZpkiR5Y6ykoDC8YdvHIZgJD1qNNAUnzcTLOICHJeYH9sIlGNd8og=
X-Received: by 2002:a05:6102:5718:b0:4c1:76a4:aee4 with SMTP id
 ada2fe7eead31-4c9d35d5f51mr4752389137.19.1744312768378; Thu, 10 Apr 2025
 12:19:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CA+G9fYve7+nXJNoV48TksXoMeVjgJuP8Gs=+1br+Qur1DPWV4A@mail.gmail.com>
 <20250403011849.GA3138383@ax162> <CA+G9fYtrsLHvMH=ofmdS3MMsMTEj3k0PD7=qsRsA4WkSqLkCzQ@mail.gmail.com>
 <20250405002757.GA836042@ax162>
In-Reply-To: <20250405002757.GA836042@ax162>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Fri, 11 Apr 2025 00:49:17 +0530
X-Gm-Features: ATxdqUGxZ781SEBtkgK3P-Nu9oNJpMn3ybOmTk6SMAJm8t2wE9n95hV6rO8wxr8
Message-ID: <CA+G9fYv=jUunRgUs=ROptP4p5DNxUuUHxYsnWaxUUXbiwdszsA@mail.gmail.com>
Subject: Re: v6.14-12245-g91e5bfe317d8: Boot regression: rk3399-rock-pi-4b
 dragonboard-410c dragonboard-845c no console output
To: Nathan Chancellor <nathan@kernel.org>
Cc: open list <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>, clang-built-linux <llvm@lists.linux.dev>, 
	Arnd Bergmann <arnd@arndb.de>, Ard Biesheuvel <ardb@kernel.org>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Anders Roxell <anders.roxell@linaro.org>, 
	Kees Cook <keescook@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 5 Apr 2025 at 05:58, Nathan Chancellor <nathan@kernel.org> wrote:
>
> On Thu, Apr 03, 2025 at 04:17:44PM +0530, Naresh Kamboju wrote:
> > I=E2=80=99ve re-run the tests to validate the boot behavior on the Rock=
 Pi 4 board
> > with different Clang nightly versions and the latest mainline kernel.
> >
> > The combination using clang-nightly:20250319 successfully booted the
> > Rock Pi 4 board.
> > However, the combination using clang-nightly:20250401 failed to boot
> > the same board.
> >
> > "name": "clang",
> > "version": "21.0.0",
> > "version_full": "Debian clang version 21.0.0
> > (++20250401112529+290d7b82cb5d-1~exp1~20250401112547.1360)"
> >
> > Reference:
> >  - https://lkft.validation.linaro.org/scheduler/job/8196258
> >  - https://lkft.validation.linaro.org/scheduler/job/8196275
>
> Thank you for verifying. Do you test with clang-20 and if so, are tests
> at that same revision passing? I want to make sure this is an LLVM
> regression before trying to get into figuring out how to bisect with
> your setup. Another way to do that is to see if clang-nightly boots are
> failing on the stable branches, which would point to Linux not being at
> fault.

clang-nightly boot failed with stable-rc 6.12, 6.13 and 6.14 and
mainline and next on following devices and virtual platforms.
- dragonboard-410c
- dragonboard-845c
- rk3399-rock-pi-4b
- Juno-r2
- e850-96
- FVP (Fast Models Fixed Virtual Platforms)

Boot Test links,
- https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-6.12.y/build/v6.=
12.23-2-g8e0839d16957/testrun/28076019/suite/boot/test/clang-nightly-lkftco=
nfig-kselftest/history/
- https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-6.12.y/build/v6.=
12.23-2-g8e0839d16957/testrun/28076006/suite/boot/test/clang-nightly-lkftco=
nfig-lto-thing/history/
-  https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-6.12.y/build/v6=
.12.23-2-g8e0839d16957/testrun/28076009/suite/boot/test/clang-nightly-lkftc=
onfig-hardening/history/


Lore link,
 - https://lore.kernel.org/all/CA+G9fYve7+nXJNoV48TksXoMeVjgJuP8Gs=3D+1br+Q=
ur1DPWV4A@mail.gmail.com/

>
> Cheers,
> Nathan
