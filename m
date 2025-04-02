Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 939861F55E0
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 23:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743637932; cv=none; b=AxiUK6uGHMY4akcKfJ6LJV+xgf8CEo62bbynXnWIalamUXglypmUD+cQOvhKR28h/gMneAPJ9f71ch8tb+k6Dum1/AvUfHOdSsUVrqdlIemU29JtMwqyXnb/e2vZF9Li21zC8QCHi2owAxsYw9v6UT81EaOhWioLLFbz+LeM5s4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743637932; c=relaxed/simple;
	bh=jMLyU6i1wwQTrBMKiV8dfyZD/y9tvNEeMglIXxnMzwY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=erI0h+WMlgNOBGbRWFzRqQZZtLSpzYAUDtrPjljY8Uae4PgBdT35ij7aQsjqhiBkYLKpHukuU1wsMGvGG4iun5b2Jeg0e9es8T+y2jZ6AXc7lMudRgdkXD2VovaISJgTn4pp8llSCsgU0Ow9aMyoFRcjixeEkr8xcB2ilTr7Gvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FLX+Ktmb; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FLX+Ktmb"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-54af20849bbso391889e87.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 16:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743637928; x=1744242728; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QZY8otkMYxUzAC1QwZ9rYHNq5MXftY+mTN4XwBPSLJk=;
        b=FLX+KtmbffTRczIrxBTVM58L3T2qwstq/D0tdJEq6WjT60z99cBmqzOm5RSMo9uyXm
         YGWHO/Do10lnM/1qNsr9G+Sp+TS36zaDeWRc6MIUIpH9oHMo1AZLTgqlDuvjA8KOkTN7
         zxUyfqDvP6GAlly1c9r7kEinHVyhA2tRP+BdQjeqjOKgAhjmfmPVK4Vo/5nlhy9+x6Pp
         UqvBDHgge3eM+mK01oK8ice/4Faem4dIkeeR7oGIgkgKifOYdilD7GVy7V3Qrh2/ZzL3
         zYZbTEM8bT+z2utPNQIPwSZZARMNxusK2LFS1hiMFAw0WqUchnN37H3gxoD5Eh8rIxyw
         +7SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743637928; x=1744242728;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QZY8otkMYxUzAC1QwZ9rYHNq5MXftY+mTN4XwBPSLJk=;
        b=Pqrm9rFtdWODkYW+8bF3pKsEloqbYwpe1l99m+Lb54lHgxneY7fMiqs58f0OtkBOvs
         EyE8QYpcPls8CuL2tuY8qX5sEG3fHpqE/6YZ7GWwUvJc2TeDxbLXryVWlMPdo2dSWrN7
         Bk5DOa/ahAygYAJxPILNCsxTUAHPSv/A0hW70l+TRywAnajkgh0W86o8X29Bu5FNe8N5
         LLtwm4OJOg7wTOzbV2L1HNTnbC2Wt/S9edeoBaMcOgMrUo5zd9MdQdukZ3gFlBDctZa9
         /Rr9V4OyPKtVJ0spgFAemaPShYgUyzK4xAbWvuLAyJUp1/YJjb3UR+b5c1fz3IYFBQBU
         to2w==
X-Forwarded-Encrypted: i=1; AJvYcCVXw/LsCQs718QBv32ZpLciwqBFgprVDXJsbmu+fi15s5VBnYSwgPczTf6aQAnUC9BZwHTd5JnaxW89B1k=@vger.kernel.org
X-Gm-Message-State: AOJu0YwIxX6jhsaq9tPIPAEHxyqfy580U93CGt+AYqFq7gIWcA0nBVNR
	7b5sRko6uaNYBg1X8kZZdzFE3TgXV/S9cK3kfrndO5w4bpeBFNiMKk9tvW+Ed7b8VvUtDOYMKU6
	l6DBcO4bxly5bzYrltijvqb73L2g0NfdQAN+GyRbJa/dDnOghGlo=
X-Gm-Gg: ASbGncuPzodo1+bAWjgYCcKxC8J8Ip6NWzDxWJxdHqOzM1YcQCqDk0IiU1Im57kwQkS
	4gHK0hIQNNDKlpaAfnnuplxGfqdSbLlHXq7eHgzzX4Mqbn0rGQgzBLyZJFlZOyi8yxifuUWLXmP
	lP46gf5Pfzns1p6xUss/lUpsVlBxQHLmoSDM6dW869N1LIKs4AXuP2wv8=
X-Google-Smtp-Source: AGHT+IHlbF+Rcpq4SNzQqBS7VAxDQsrV3ZwngjWYjf5S0S28hVedbHbtxlbFZnmwmOWaFBpWoJrxhCkIAdvd/qI3WYE=
X-Received: by 2002:a2e:a817:0:b0:30d:62c1:3bdd with SMTP id
 38308e7fff4ca-30f0213b687mr1914151fa.23.1743637927467; Wed, 02 Apr 2025
 16:52:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250402233407.2452429-1-willmcvicker@google.com> <20250402233407.2452429-3-willmcvicker@google.com>
In-Reply-To: <20250402233407.2452429-3-willmcvicker@google.com>
From: John Stultz <jstultz@google.com>
Date: Wed, 2 Apr 2025 16:51:55 -0700
X-Gm-Features: AQ5f1JpHnrRyIgSkaS_9jCoC0VsbpgZrv9QWyrsHr40oDXAIBk4dIsCvT_HYCMU
Message-ID: <CANDhNCpGxedaxjZ=6Trai3exbQGf7WRJUeTC1jqoHOhup2mNLg@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] clocksource/drivers/exynos_mct: Don't register as
 a sched_clock on arm64
To: Will McVicker <willmcvicker@google.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Saravana Kannan <saravanak@google.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Donghoon Yu <hoony.yu@samsung.com>, 
	Hosung Kim <hosung0.kim@samsung.com>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Youngmin Nam <youngmin.nam@samsung.com>, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 2, 2025 at 4:34=E2=80=AFPM 'Will McVicker' via kernel-team
<kernel-team@android.com> wrote:
>
> To use the MCT as a sched_clock, the timer value has to be accessed vi
> an MCT register which is extremely slow. To improve performance on Arm64
> SoCs, use the Arm architected timer as the default clocksource. Note, we

Nit:  sched_clock is sort of separate from the "default clocksource",
and after this patch we still register MCT as a clocksource, so this
doesn't sound quite right.

I'd probably reword this slightly to:
"The MCT register is unfortunately very slow to access, but importantly
does not halt in the c2 idle state.  So for ARM64, we can improve
performance by not registering the MCT for sched_clock, allowing the
system to use the faster ARM architected timer for sched_clock instead.

The MCT is still registered as a clocksource, and a clockevent in order
to be a wakeup source for the arch_timer to exit the "c2" idle state.

Since ARM32 SoCs don't have an architected timer, the MCT must continue
to be used for sched_clock. Detailed discussion on this topic can be
found at [1]. "

> can't completely disable the MCT on Arm64 since it needs to be used as
> the wakeup source for the arch_timer to exit the "c2" idle state.
>
> Since ARM SoCs don't have an architectured timer, the MCT will continue
> to be the default clocksource. Detailed discussion on this topic can be
> found at [1].
>
> [1] https://lore.kernel.org/linux-samsung-soc/1400188079-21832-1-git-send=
-email-chirantan@chromium.org/
>
> Signed-off-by: Donghoon Yu <hoony.yu@samsung.com>
> Signed-off-by: Youngmin Nam <youngmin.nam@samsung.com>
> [Original commit from https://android.googlesource.com/kernel/gs/+/630817=
f7080e92c5e0216095ff52f6eb8dd00727
> Signed-off-by: Will McVicker <willmcvicker@google.com>
> Reviewed-by: Youngmin Nam <youngmin.nam@samsung.com>

Otherwise, looks good.
Acked-by: John Stultz <jstultz@google.com>

thanks
-john
