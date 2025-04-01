Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 485A4204C19
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 16:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743526238; cv=none; b=XGdUxpBxE9SuFQ96BMAsvyoESSCBQh16+3r1rjpseFV8WOJUvh/aRnDL+SsmYkPWcscj1hufQNMF/hy9Rd5yxhJ8jXXtXX/P0WY/4cP90pOgEElxq2DEA6iuD7JQVFcn1DcA62oZzP0cK/ygpCPzyQQYEK40C0tEkC2xYD62GB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743526238; c=relaxed/simple;
	bh=qUk1PicXzRoPMh0+3kY+HECr2cFI/+cjTJrezXFM1+w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=grIouMuxY41VD7ee8IBxo2wWysJBzi+XvZlwMIbTjtWW3HiuRYYsqCh+7kJUAlthWz3mbTmNv9nJ7QCGEH1m/1wMmx9rhw6aXF9I1Mf16QMgG/8kYd6xhdQPgLtEtK5ARh4i0qDmD9xEPpR7QwWofrABp27W3evfnjHN3fVb/1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=K3Px5ldr; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="K3Px5ldr"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-224341bbc1dso98968635ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 09:50:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743526236; x=1744131036; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2rzQkn+3Vspwxp8Ah2PANQpg8+55TnFG5qd193VBWCM=;
        b=K3Px5ldr2tqCtmLMEyUBmaJhKS1ZCtwKue6Bilu+rQDpOi0FNC66/45c0XdYA0PVGE
         fieEQ4rB9cFilf2+2IoL61XmkhPKbRskthSzG8NAxpzBAafMmAqLtK6l0KA2f92Wxdv/
         RkwvS+8GSq9lEDQZcARlgzs2hVO8PZSJ7sk0+OHDs6BG4f8Gxeeaf7v3qoYl9o3Qkd+D
         oTD/rS4mUwg4X32RQV8j+qIRq0TSVGYkw7oagUgiiykzMOvgqKs2fUlowHotfmL+nzaD
         kvIrfi5FmaIIMrUStUa3ONwxrQ1AjO27Yo9Uh8X4AlczUKq4Ujip2bN4jpfbLZl45VI8
         y58A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743526236; x=1744131036;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2rzQkn+3Vspwxp8Ah2PANQpg8+55TnFG5qd193VBWCM=;
        b=VQwh1OmLp349U8SxU89ltZc3Z7JXGDs2EyZUjSUOhmHUxR9CGSSltNA96DhJ4K37Hk
         cxAIMIEe02m4SgSFlh6y8tGvCm5Msk5C8NvVn89YUF3CnE1NVz2n5vxWQgKuUF4KUZMw
         Jumf8TIwit0OhAgJ3hD2DMzQTcfTKLe0D21NE+o3yUAOdbtjL8QInjA6Gl0KJlpBvZM7
         +XBqB9WyxE2CfXm9WiCffSGTj0hLWnNCaW06dhYLoWy2CWvdDSdUDer7AZP4ZSnBsq3s
         nS88YnfpWpx9a+NVSJPpYL7qRGJWeDnqd0ye670v+ejs6eDqNKzCF5KK4wKMCL6PPUAv
         +P6w==
X-Forwarded-Encrypted: i=1; AJvYcCUr6YzKgQC4rmap0AA2kX2JnCJb4uwXu/sUWV10fTRxf67OA1VrnpZx6Il0WKLXPOEaMcfjtsWOZ2BWN0o=@vger.kernel.org
X-Gm-Message-State: AOJu0YywG2Mr6wnJx0i02XzGWrYQNgPZWXUlqRrSm58a+C/d4pKjSBFP
	4HXO4GIASVo6obBeIejlVJnLmlaMD2TfTPgb+XuCwklehpcyFCg1JCRMIMdf8Q==
X-Gm-Gg: ASbGncuxHC6qUIM/jIpf8OIjtkQ/mINBUyc3O5X75Ba4oju3H2QJCMO+it4Bal1I8t8
	nkZN04DZWtnVkbRDs0TccLmBfUBIS6OUOSAGtNqP6PfAaHuPvIXeb6nBkUF4yOIxM9rj7tFlxow
	jAAIc2czh6h+wSyE9BTrho0SE3Jo4nFVi7up6dZKvQD34KeLe5W9X9OsmKuNGWV+b00QRN1Y4U5
	uSWye5+O8SwdteHG9Ta817KjmKe5ywkHIOKsZWTiphDyGbStZ21JYus2jS6JnQJVsZz2ghO31l7
	kbAiXedWEz39Lzukwv9j2XhrB1YDrTR+SC5bcZIfUJFutogUco6aNWxQ0G7yB/kX//XntkpxXIZ
	PWpZrDS/aOdZUKN4=
X-Google-Smtp-Source: AGHT+IHM3XGbPCmTj9kap2GPt7VppdYLhbKxPnzq9elvCQi+To2CYT1dVqErhbVf2M9uMVGsgotWZg==
X-Received: by 2002:a17:903:178b:b0:223:47d9:1964 with SMTP id d9443c01a7336-2292f9e6322mr233271015ad.34.1743526236330;
        Tue, 01 Apr 2025 09:50:36 -0700 (PDT)
Received: from google.com (198.103.247.35.bc.googleusercontent.com. [35.247.103.198])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7397106ad9bsm9161077b3a.117.2025.04.01.09.50.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 09:50:35 -0700 (PDT)
Date: Tue, 1 Apr 2025 09:50:31 -0700
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
	Krzysztof Kozlowski <krzk@kernel.org>, kernel-team@android.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
	Donghoon Yu <hoony.yu@samsung.com>,
	Youngmin Nam <youngmin.nam@samsung.com>
Subject: Re: [PATCH v1 2/6] clocksource/drivers/exynos_mct: Don't register as
 a sched_clock on arm64
Message-ID: <Z-wZV3RCXKPzpZGl@google.com>
References: <20250331230034.806124-1-willmcvicker@google.com>
 <20250331230034.806124-3-willmcvicker@google.com>
 <CANDhNCrxTTkeq3ewos=07jD67s3t6rXOv=u=_qV6d+JEVoXeUA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANDhNCrxTTkeq3ewos=07jD67s3t6rXOv=u=_qV6d+JEVoXeUA@mail.gmail.com>

On 03/31/2025, John Stultz wrote:
> On Mon, Mar 31, 2025 at 4:00 PM 'Will McVicker' via kernel-team
> <kernel-team@android.com> wrote:
> >
> > When using the Exynos MCT as a sched_clock, accessing the timer value
> > via the MCT register is extremely slow. To improve performance on Arm64
> > SoCs, use the Arm architected timer instead for timekeeping.
> 
> This probably needs some further expansion to explain why we don't
> want to use it for sched_clock but continue to register the MCT as a
> clocksource (ie: why not disable MCT entirely?).

Using the MCT as a sched_clock was originally added for Exynos4 SoCs to improve
the gettimeofday() syscalls on ChromeOS. For ARM32 this is the best they can do
without the Arm architected timer. ChromeOS perf data can be found in [1,2]

[1] https://lore.kernel.org/linux-samsung-soc/CAJFHJrrgWGc4XGQB0ysLufAg3Wouz-aYXu97Sy2Kp=HzK+akVQ@mail.gmail.com/
[2] https://lore.kernel.org/linux-samsung-soc/CAASgrz2Nr69tpfC8ka9gbs2OvjLEGsvgAj4vBCFxhsamuFum7w@mail.gmail.com/

I think it's valid to still register the MCT as a clocksource to make it
available in case someone decides they want to use it, but by default it
doesn't make sense to use it as the default clocksource on Exynos-based ARM64
systems with arch_timer support. However, we can't disable the Exynos MCT
entirely on ARM64 because we need it as the wakeup source for the arch_timer to
support waking up from the "c2" idle state, which is discussed in [3].

[3] https://lore.kernel.org/linux-arm-kernel/20210608154341.10794-1-will@kernel.org/

> 
> > Note, ARM32 SoCs don't have an architectured timer and therefore
> > will continue to use the MCT timer. Detailed discussion on this topic
> > can be found at [1].
> >
> > [1] https://lore.kernel.org/all/1400188079-21832-1-git-send-email-chirantan@chromium.org/
> 
> That's a pretty deep thread (more so with the duplicate messages, as
> you used the "all" instead of a specific list). It might be good to
> have a bit more of a summary here in the commit message, so folks
> don't have to dig too deeply themselves.

Ah, sorry about the bad link. The above points should be a good summary of that
conversation with regards to this patch.

> 
> > Signed-off-by: Donghoon Yu <hoony.yu@samsung.com>
> > Signed-off-by: Youngmin Nam <youngmin.nam@samsung.com>
> > [Original commit from https://android.googlesource.com/kernel/gs/+/630817f7080e92c5e0216095ff52f6eb8dd00727
> > Signed-off-by: Will McVicker <willmcvicker@google.com>
> > ---
> >  drivers/clocksource/exynos_mct.c | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/clocksource/exynos_mct.c b/drivers/clocksource/exynos_mct.c
> > index da09f467a6bb..05c50f2f7a7e 100644
> > --- a/drivers/clocksource/exynos_mct.c
> > +++ b/drivers/clocksource/exynos_mct.c
> > @@ -219,12 +219,12 @@ static struct clocksource mct_frc = {
> >         .resume         = exynos4_frc_resume,
> >  };
> >
> > +#if defined(CONFIG_ARM)
> 
> I'd probably suggest adding a comment here explaining why this is kept
> on ARM and not on AARCH64 as well.

Sure, I can add my comments above here in v2.

> 
> >  static u64 notrace exynos4_read_sched_clock(void)
> >  {
> >         return exynos4_read_count_32();
> >  }
> >
> > -#if defined(CONFIG_ARM)
> >  static struct delay_timer exynos4_delay_timer;
> >
> >  static cycles_t exynos4_read_current_timer(void)
> > @@ -250,12 +250,13 @@ static int __init exynos4_clocksource_init(bool frc_shared)
> >         exynos4_delay_timer.read_current_timer = &exynos4_read_current_timer;
> >         exynos4_delay_timer.freq = clk_rate;
> >         register_current_timer_delay(&exynos4_delay_timer);
> > +
> > +       sched_clock_register(exynos4_read_sched_clock, 32, clk_rate);
> >  #endif
> >
> >         if (clocksource_register_hz(&mct_frc, clk_rate))
> >                 panic("%s: can't register clocksource\n", mct_frc.name);
> >
> > -       sched_clock_register(exynos4_read_sched_clock, 32, clk_rate);
> >
> >         return 0;
> 
> Otherwise, this looks ok to me.
> 
> thanks
> -john

Thanks for taking the time to review!

Regards,
Will
