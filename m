Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2A2E15F41F
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 21:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744837242; cv=none; b=OShILpTYbzQJkTkGRWRNFt9HO82f9SVNMbjz/aJHmNeeZJ9FMla5Z4z5RJzwpqMOHU7KA41YXUMUgDXSjUiMxENK/bnZQAV9qlY1dYjFUIofYzCXsXuucf5jhweN24Q92fjGAX0RMtE93925oNWuV1XjM6GxFS2y6B4Hqtx2WTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744837242; c=relaxed/simple;
	bh=sXjuke0/1XVuLNfiPlV5GEJxawgB3CfnH2aaqTJFQXc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dkvVBibCfnYg3k5/rvRvZ72zA/A/QStYYoC5yKbOUOM7eBA6odnerUw5jEwAs1SkxW8QvA315RyeWyy6cJ7jPm4HW4cgJ91zYNzmC/0Ndnpl7uCBc6calMRGg87NBWX5yCn5jhZ72GF278ryfhTq6a5KbM/fBHNkykUe/12D47M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dWqyRNDF; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dWqyRNDF"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-54addb5a139so111834e87.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 14:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744837238; x=1745442038; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sXjuke0/1XVuLNfiPlV5GEJxawgB3CfnH2aaqTJFQXc=;
        b=dWqyRNDFYNYZG2I79JBccuGjWRO3erl5pZhj+DwBAhF8STFVP569vI2iwgGytANhUb
         14aRWZoWTYnNU6vXOv7fWxukDs/ubORZZnxlDO7xptGNEC+JrvOPHzWM1Bn9/WJXUL1+
         daN+rU9E+bgpTgpn9XReIcqJ8n38gU6W6dPbcDKKK/idfnBpNh2UwovcD14OJlJqlFuC
         DVU52OX31aUkI0N7XuUdJa5Nc0nQzf6BYgMgvoe4kAY2NhjUsneEzBygPL6EcrtGR3ZN
         i1/jDy6NZTKIaBwzSXA290lYBTyPojymexx7us3U12MXqjM69xXInb4Hv78dLpysYKtp
         5srA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744837238; x=1745442038;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sXjuke0/1XVuLNfiPlV5GEJxawgB3CfnH2aaqTJFQXc=;
        b=Wm8Cr3SOIAZynvAl0S0t5HN97iVufCBj2OjBBl4HPKZiN9MPxBrBG8M0duQ9B1UkWK
         hZSEVF7YSHbK6Mjth8cb83QFlhEyHcKvW7I4wyM3QAWi/Vj5fyvo19+4fDlIiD5xZljA
         xqWaRjlS59sj7HxSHuj0o3gs5Fm5nsHiFKI3Oc+K6FB2QyaCqjB6/6tuSGn/5Q5DBeKo
         Tif1tRZqLpZV61MdHhfhcmGSn/q3uzeTsdF/4EAz90UYFX58MPqv+Pb2k4bfVUJVWiRE
         aoX26mSdoUyVUdBDSOSfiYGpDam6YyDDMPUr3R+HVMNxQFnH2V7o7LunQOfN6OwjB90D
         lcUA==
X-Forwarded-Encrypted: i=1; AJvYcCUfVe4V8Gh3TV7p17Twjoe4IAdrLf5baEdfREmGl26YZ9MaPrwML6Avm0CvN5b2yTvTp2n5sAIcebyITjI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXHvjin9Os2GJABwTtWp1jF1bmhvBerNR0gvIJD8Zv0Fybfgmg
	pVGdb69bMJDWRyHThQDHnflf8qG6ZBr2iiKnp6bZXvJx+m/oHn6VYBvX9rmHkK5Ny2iHLdTFoVA
	I8iKYNrDPkZkRkbU/dT6CSB0yuR+SVqL2yTo=
X-Gm-Gg: ASbGncssa77gqBsoN5Fx3Uldw1Tc90wCYM0DqMRIS5GbM8Rc7lvAeEySX+mawIMOFfF
	fX1vNhd/KJYfU/ci6s+gqrUdE1AEeaPRFVLPckgE9d0cxzS77WU33SINW4JEAbHDpBpK4CQwII8
	0DQUiHtkxgPi/wz5ch3fPxCw==
X-Google-Smtp-Source: AGHT+IG9hAb/RqcUyMjum4adu8+LeKj3lYKNlalqPEWwBfkfUt2vnhzCuPcvV73P/EQrHGM4wuLbO44GnaPBGO/0zi8=
X-Received: by 2002:a05:6512:308c:b0:549:4e79:dd5f with SMTP id
 2adb3069b0e04-54d64aea488mr984588e87.37.1744837237634; Wed, 16 Apr 2025
 14:00:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250402233407.2452429-1-willmcvicker@google.com>
 <20250402233407.2452429-7-willmcvicker@google.com> <Z_6OZHYfC0bC5289@mai.linaro.org>
 <CANDhNCodHATboF2=U2tTwdEkEJ+PsfB2F=fbBrs=J1UzZTEX8g@mail.gmail.com>
 <Z_-0nX3Z-DLPjL_j@mai.linaro.org> <CANDhNCr5n+HtHQEqCq0ZxbvX-nC3u9ewJ1_fj0h1gFQZ3nB8iA@mail.gmail.com>
In-Reply-To: <CANDhNCr5n+HtHQEqCq0ZxbvX-nC3u9ewJ1_fj0h1gFQZ3nB8iA@mail.gmail.com>
From: John Stultz <jstultz@google.com>
Date: Wed, 16 Apr 2025 14:00:25 -0700
X-Gm-Features: ATxdqUFzpyQW831S9hdAwTuoas7KRwwuK39VUOIcXhttpaGT_PCdnsoFhEv7ehg
Message-ID: <CANDhNCo-UF7uVWWMPEYyCzT0R7BTHb+uLq4d8ZfxURuk5r2AwQ@mail.gmail.com>
Subject: Re: [PATCH v2 6/7] clocksource/drivers/exynos_mct: Add module support
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Will McVicker <willmcvicker@google.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Saravana Kannan <saravanak@google.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Donghoon Yu <hoony.yu@samsung.com>, Hosung Kim <hosung0.kim@samsung.com>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Youngmin Nam <youngmin.nam@samsung.com>, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 16, 2025 at 12:48=E2=80=AFPM John Stultz <jstultz@google.com> w=
rote:
> On Wed, Apr 16, 2025 at 6:46=E2=80=AFAM Daniel Lezcano
> <daniel.lezcano@linaro.org> wrote:
> > So the whole clockevent / clocksource drivers policy would have to be m=
aking
> > impossible to unload a module once it is loaded.
> >
> > Do you have any ideas how to ensure that the converted drivers follow t=
his
> > rule without putting more burden on the maintainer?
>
> Permanent modules just don't have a module_exit() hook, so that is
> pretty easy to look for.
> Obviously, I don't want to add more burden to the maintainership.
>
> From a given clockevent driver (or maybe a function pointer), we could
> check on the registration by calling __module_address(addr) [thanks to
> Sami Tolvanen for pointing that function out to me] on one of the
> function pointers provided, and check that there isn't a module->exit
> pointer.

Saravana also pointed out to me another approach that the irqchip code
uses: macros to populate an owner field with THIS_MODULE so that one
can easily get to the module struct
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/inc=
lude/linux/irqchip.h#n41

thanks
-john
