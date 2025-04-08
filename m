Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EE302417D8
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 19:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744142226; cv=none; b=d416T4Rh0QM6AGRWI887S3bYDyn08UlaQoMMgoJL0XTjgPGEv5VNvSnw6dJTe0seZVn4yZvnTejqZaU1+INLkbQ0fvpnBx+JRhV8UtS2bRnZKGVTxe3pjFfDcVEEsYZlzUL37lJ7BL0YsSRJjvHAbPDFx7g5IKgpbVSkBWDrGpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744142226; c=relaxed/simple;
	bh=O8+yWIuTO5smvRzCk842q03XtmrnDsxb3kk7KIJLihY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GCVUlHrcheIoHvWM71ckpRC7rRob5vzFq09C9oIvJQP/t1A3+gJKB0F+f/e71LkakiXnMJ/RkxRWjVRkK3S/4naZtZB8bHuiZC56gkZI9Cxg77f6C5fHT03bGYZDeGqlyRC7Tth5cOSu4zd5JHaYntrDk0HulzMNxEwyC8MamiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JOWjYHoJ; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JOWjYHoJ"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-227cf12df27so380815ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 12:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744142224; x=1744747024; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jjAX2sNBU3681HCQX4kVcY41KRirctMYti/FTqvGf3w=;
        b=JOWjYHoJvMoF1KaBbZSUzORIBnatG0SrfCRXLd28q8jGxhMSD43kcwq3saOgY2E2YU
         ej2JN+FaTiyjkymyTH3UDqyll8NTHwDPrhd8YaT6E2TeQfo1OOiEvEPvRONK48ep7en/
         uh3vnuQqUygKG7mArgN5KIj+5AGz7IPQSoL91Yp2XMhHN+xdEk5T0A62ZqYrPHqmHqBv
         dhi2alQe5RY07MB/nhF18uGIovp4jg8bEdIKvCp48wDFYnZxMTVMObLs9JtxBZVQLN5B
         BQIAferV8ssJBl9pLUkYk4cOWQPtw59gFabjm22g7KLvZF6S1FXBrKgLFylrFOJnFDM/
         5yjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744142224; x=1744747024;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jjAX2sNBU3681HCQX4kVcY41KRirctMYti/FTqvGf3w=;
        b=N+J5Ik5UhZkF8mzmvwsSKiVWzmXwwJ0MyOxRsrYTUeU0mT5mO7wRQ+HYHwDCVsz6WA
         Pja2ei0lMytjBEMNzTkZNaBBsCv+IjczDYxYc+8ig1sJb7PSPtr3OwnTizNe6H0da/wk
         ioUel20v1eng2PKkV8bkqb2I1WH6F462joaDOXZfcMw8QUMYMZO5uowf3xu+E0Vzwkfr
         YyRjko4x3bemTvd8aiyGC1iNoSWVjD7jqP32K7psW4RR2Bc/SSFipeEhrLSihDQsDmGZ
         3exQpc4kzPvwQFnGB7oMnuV3EvyzJ7gti6eY+VGz147N5uzsid2JPyYuUCWmX/edpigy
         vFTw==
X-Forwarded-Encrypted: i=1; AJvYcCW6l2vWHQzEEPSk4srn5NNpw32wT9MO1kRIHp5S9fBdnnZhJPcWYMF9fkRaXgmP4D+W5yxWAEtuxhFpUK0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwqTTsc/nUUlb7jBpjkxvgOIBWTkZBnamLNT5w+UM5lr6Xf2zdY
	LUvFwqGayI6vH/eR+CjUysK2xIZqLGYkHFGuJG9vHrO1J87cO1ai32wHNIgKEg==
X-Gm-Gg: ASbGncuSkpVrov4gg5aPmtYC0zVitgEKzhlxqKMmL8Hd01e7Yp8EbfTnssLG4iBnv+4
	z2dbbCN9HhLGcOLWkWkBj6MiR+OvCjv+mW3JcXlQnt3lSEihS1FSd/6NFW7x4vi2DAW5BsdJ3GV
	PRtNUXJ4ejZ1GsiqiPSqcYxwwBXxUT9/eUd5/59fq+DhURibO+IuX+DFDEahXhk/XoUO8HAkk8L
	J/T4b3FbqkthMJ4/fb5kkRGQS7tGFpYpd6He/di+zMxtZQVPcM2epqW9WNnfoLpbdd0Y1nIJLym
	vvWsURwV9uWBvzLV22AsV5VWskg6PEIMXgugpyXXMz1Kx1MnyWfGBV/W6RbtxM3rKE8KsVY+JHU
	kNs6OiCzkIGYjP/A=
X-Google-Smtp-Source: AGHT+IG/aixR6L8wT+D56lcGE9b7SLefmOG0gGQfiOnOqHm+lRiKkcPryTAOxW4tpKPSv5Ftu+jjDw==
X-Received: by 2002:a17:902:ef02:b0:223:4d5e:7592 with SMTP id d9443c01a7336-22ab5eaa24emr63238645ad.21.1744142224358;
        Tue, 08 Apr 2025 12:57:04 -0700 (PDT)
Received: from google.com (198.103.247.35.bc.googleusercontent.com. [35.247.103.198])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739da0b2f71sm11294568b3a.130.2025.04.08.12.57.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 12:57:03 -0700 (PDT)
Date: Tue, 8 Apr 2025 12:57:00 -0700
From: William McVicker <willmcvicker@google.com>
To: John Stultz <jstultz@google.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Saravana Kannan <saravanak@google.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Donghoon Yu <hoony.yu@samsung.com>,
	Hosung Kim <hosung0.kim@samsung.com>, kernel-team@android.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Youngmin Nam <youngmin.nam@samsung.com>,
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/7] clocksource/drivers/exynos_mct: Don't register as
 a sched_clock on arm64
Message-ID: <Z_V_jKD0CekA41po@google.com>
References: <20250402233407.2452429-1-willmcvicker@google.com>
 <20250402233407.2452429-3-willmcvicker@google.com>
 <CANDhNCpGxedaxjZ=6Trai3exbQGf7WRJUeTC1jqoHOhup2mNLg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANDhNCpGxedaxjZ=6Trai3exbQGf7WRJUeTC1jqoHOhup2mNLg@mail.gmail.com>

On 04/02/2025, John Stultz wrote:
> On Wed, Apr 2, 2025 at 4:34 PM 'Will McVicker' via kernel-team
> <kernel-team@android.com> wrote:
> >
> > To use the MCT as a sched_clock, the timer value has to be accessed vi
> > an MCT register which is extremely slow. To improve performance on Arm64
> > SoCs, use the Arm architected timer as the default clocksource. Note, we
> 
> Nit:  sched_clock is sort of separate from the "default clocksource",
> and after this patch we still register MCT as a clocksource, so this
> doesn't sound quite right.
> 
> I'd probably reword this slightly to:
> "The MCT register is unfortunately very slow to access, but importantly
> does not halt in the c2 idle state.  So for ARM64, we can improve
> performance by not registering the MCT for sched_clock, allowing the
> system to use the faster ARM architected timer for sched_clock instead.
> 
> The MCT is still registered as a clocksource, and a clockevent in order
> to be a wakeup source for the arch_timer to exit the "c2" idle state.
> 
> Since ARM32 SoCs don't have an architected timer, the MCT must continue
> to be used for sched_clock. Detailed discussion on this topic can be
> found at [1]. "

Thanks John for the suggestion! I'll give more time for review feedback before
sending the v3 with this update.

Regards,
Will

> 
> > can't completely disable the MCT on Arm64 since it needs to be used as
> > the wakeup source for the arch_timer to exit the "c2" idle state.
> >
> > Since ARM SoCs don't have an architectured timer, the MCT will continue
> > to be the default clocksource. Detailed discussion on this topic can be
> > found at [1].
> >
> > [1] https://lore.kernel.org/linux-samsung-soc/1400188079-21832-1-git-send-email-chirantan@chromium.org/
> >
> > Signed-off-by: Donghoon Yu <hoony.yu@samsung.com>
> > Signed-off-by: Youngmin Nam <youngmin.nam@samsung.com>
> > [Original commit from https://android.googlesource.com/kernel/gs/+/630817f7080e92c5e0216095ff52f6eb8dd00727
> > Signed-off-by: Will McVicker <willmcvicker@google.com>
> > Reviewed-by: Youngmin Nam <youngmin.nam@samsung.com>
> 
> Otherwise, looks good.
> Acked-by: John Stultz <jstultz@google.com>
> 
> thanks
> -john
