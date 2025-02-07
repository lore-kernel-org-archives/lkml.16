Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A191165F01
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 08:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738918450; cv=none; b=o0zCQg8qXyi8q/elH2asDUgY4h8pehQWTfxlLU0Y/YxSJTMPsQBSNzEbjK3tY60j5NbqhRhDZejXooO+TW6IW55IZRkhPQsJyrpEajrQkK3zzPrFZscbBOIHwyJ7572Vx1n6U9/nZoTZ72ThmKbPygjvhEdRTAnA1x/3OGutJXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738918450; c=relaxed/simple;
	bh=9YpRgDpXU7I7owpZmRmyzaYa/6nDtjaGWuZ2d3DUa7Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fa1gwr6KJf8V5w1leeylfVAkF702izPEJ2rNTSI5DW/TiNxeXzCdAY1QNJLkvE4FiQsjdA/1UMxL27yMe36CTcoUDCeN+Oh1ySiRAZiIO+YE5Z9RNdIo1rhHbrvvn/ljpK5qph5Px9Or9I5ecmiA9u/vQEGXNvfv+umFPQvqaRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=JxyHj+mR; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="JxyHj+mR"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-30761be8fa7so16986601fa.2
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 00:54:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1738918447; x=1739523247; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9YpRgDpXU7I7owpZmRmyzaYa/6nDtjaGWuZ2d3DUa7Q=;
        b=JxyHj+mRgzITlPG8rh+s9KeYHq9Kqq43I7VRIYkhrAm27BkxHjM1HgR6SWP11tP/nx
         cjbu3Hz05x+FYTFMx5w6YUJ+W+rO1IP8FFil86UYwBQ+B00gAh1nYkNVItEzwtBG2FcA
         NYyb+g9srRfxRkjkmhPjLFDTnAe1fpcI602FT5EdUafcv6IKLd2PxUgodqgP6i9ziP7w
         jSUcilml/Zm4wTl368lti0134QsT6uOL53laFt3Mhim9UT3gxx1aN7ymc58mht7zqSCW
         vQqQX9HOLdIsuAblTAERx405xttawK6cXLPUaku+w/karePkV3uc+69iMFK6YuK+hPFu
         TOqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738918447; x=1739523247;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9YpRgDpXU7I7owpZmRmyzaYa/6nDtjaGWuZ2d3DUa7Q=;
        b=qO47fjoRN+/d21JUP2vOIsOAd9EHbArR4RrySV/pQC3m3/S5KtYhYA7X0w/7VIKgi7
         VXqfsn0u09xVszZHFDrmfyGvv2OTatDmRupCf+GDy7MSTtSYAtMa/eU38GWFGyehYTLI
         3WfMpUjtwzDqk5OmkTyB1abFTaxZJBk8Sp6/eu+nXvMeJW4xV/9KzypSPHvjCH3fK8VV
         Vwd4pPvT2RbxYT/Noz/KjSPkANNxmUIXpz+mUJkuJ3taCfsxyIPSm+R7hrXxT/kVyns4
         q4WvvoTJgzgf1AvJaxOWJbt1fICkQWMNZjcMkS3wy9XIbXod27vVjSwDeSpdh3n2SqAB
         LplQ==
X-Forwarded-Encrypted: i=1; AJvYcCUrmkgt8RWb4onyMm0JIXTta9ocNlBqbDYyRDP4Ts4hX219WCPwm1l7lya8r9J82ex+g49RDV1pX42wG0A=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZuG27b4ECmOogtpWwlEYzNPKiO3AYaMPHnDiiN0x+6n0fFeyo
	tNueFWQLUmlWJkUC5MTsMxZhmR2uATO8aq2368HUKAPgFqbO+vb5ROz5WyTBcPR+BR/9xGCA7PX
	1etaOYHYDU3ofFFB/ls6vs/irQ3iHG27L60MMZg==
X-Gm-Gg: ASbGncsAKCb798EMZAID8CNfPa13PKBVW46Bmi+WCb2GvnCLocN0vZ3EbEr2E9gEgBO
	Fj5ALFOAEQ2odcG3NFrclY+zDkiUg+utSVAHrYSNRD7uCFcdcU+U4ChTA2b1uNzh6E8GLfrwFNa
	K1SkEBAuQi7Aid8pVUKmYmBE5y1NU=
X-Google-Smtp-Source: AGHT+IFsHFJNNKLdEXxQ9RmJCfueArNgIRv8RA8F15dLwBa+jex6lO4HgAmkMuAZ7uzNIjHQrLjlpHUd8vXUHrS8TPM=
X-Received: by 2002:a2e:a58d:0:b0:300:33b1:f0cb with SMTP id
 38308e7fff4ca-307e57fd423mr7386291fa.13.1738918447302; Fri, 07 Feb 2025
 00:54:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250113225530.124213-1-s-ramamoorthy@ti.com>
In-Reply-To: <20250113225530.124213-1-s-ramamoorthy@ti.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 7 Feb 2025 09:53:56 +0100
X-Gm-Features: AWEUYZmOl7wUQPy_ROOuSzKSygvKItMb-rBgZEqVwt35XGP1BYQLd0FbfBe00Ew
Message-ID: <CAMRc=Meqjy+cqfueM_dQE8uP32zS0ib41qE+OPPWFkhoVTGc2w@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] Add TI TPS65215 PMIC GPIO Support
To: Shree Ramamoorthy <s-ramamoorthy@ti.com>
Cc: aaro.koskinen@iki.fi, andreas@kemnade.info, khilman@baylibre.com, 
	rogerq@kernel.org, tony@atomide.com, linus.walleij@linaro.org, 
	linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, m-leonard@ti.com, praneeth@ti.com, 
	christophe.jaillet@wanadoo.fr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 13, 2025 at 11:55=E2=80=AFPM Shree Ramamoorthy <s-ramamoorthy@t=
i.com> wrote:
>
> TPS65215 is a Power Management Integrated Circuit (PMIC) that has
> significant register map overlap with TPS65219. The series introduces
> TPS65215 and restructures the existing driver to support multiple devices=
.
>
> This follow-up series is dependent on:
> Commit f84464ec8190 ("regulator: dt-bindings: Add TI TPS65215 PMIC bindin=
gs")
> Commit 8206c20f4c82 ("mfd: tps65215: Add support for TI TPS65215 PMIC")
> Commit 0e0b7f00c111 ("mfd: tps65215: Remove regmap_read check")
>

Did these go into v6.14?

Bart
