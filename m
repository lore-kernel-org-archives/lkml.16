Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E45EA1E47DD
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 13:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743601015; cv=none; b=He/5SN6CVk3vaSvlNhN7qF2lHnWumX1MrpfjqCGAhQky6UFAiBlXgrSoKNnpApcksvIdz3Tc/iz+zsShdP4DqHnyyvB56NGAXABbJnhE5VJhbURqOMi4XR3ARMfXaO9/vH57BgC1YaSYs8Ezh2V3IKnVUwutrlU1fGma8Wv8MfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743601015; c=relaxed/simple;
	bh=5faFqyoT6zo0fdQZ8vaRQbg7yHWUCkpxyPhNDEV6png=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FSJY9FfJTwKX0srfxlbsK2Sfts0STHf4ccglxZWn4AXC/4XMbuyVKpfqwS7BET+WnJdf60HXsheKx+j5fbKsLv8MfUrzYxjefWBwxIMiygSPDpRh9oEgRXD1AJ0UPuqLrrWq+a/HBjP69it3n07zTnRBvswGQ++TzEJH6PzQRXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aAzl9B1P; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aAzl9B1P"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ac2a9a74d9cso1281661466b.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 06:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743601012; x=1744205812; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6YcnQVeAyHD8E7Z9q5MeYx0CrRnuZdFDj+LArbhVdEQ=;
        b=aAzl9B1PA3MxHkLpVkmQU089GURFAo6O5LbXxO/zboLqww10lzmo3soPFW7niZVJhX
         nMeuAqahJqa1MN8UuZbuYVCJtrWDG4J5LPeiKsURtR9lRItkkAQppa53mhba1NvandJ+
         3ovbNbREuQsMLnZeGQ6FMgNMKOCDgZCWr/Yrxkciy++EWaKn1bO0UpV+z+zZ6FbO7gn4
         c34SncX4RbWP9ysFcImJHKBg9M1CL+r19n22YBjcEvHjzrrhbKL1l9LcPcoj9XvV5oF0
         jw6PJArqaJk6ldxyYf60L4YDrdPpir1lAUHU4xpscDhOGqDU1Y7jhbLMA5jvzhIrbojR
         DKaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743601012; x=1744205812;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6YcnQVeAyHD8E7Z9q5MeYx0CrRnuZdFDj+LArbhVdEQ=;
        b=EZaJ5BVw2E+RFEfPmH7hktD6aVM4HmG/RCVBcbl3jW6dMmrR4HScMikcaFbVCDsj89
         PMr/3DFvpgFw1es+ElE9FEr3Z59Fp1nvz5di/KilVBbvMMTW2f6dKiiCm9WtuFN2YkUU
         EZPgZDisR4glCdigNBSxuAj5yRILc3QQ0XkR2CWjeQE+D6xYjNnS8twb2GAMb9b49t3a
         +GuxG75w6s0W+zLj9YZswdc74hZNCmcw9jo3QJnHO6KysbmzLL4hNckymuEZJRrtoFVL
         QNbOXOu0WBwkXRelgb06M+9W6SFFT5OqHiXMVrZJW/adRuic/90DmA1UAcIFp2qBw4Qn
         T5Qw==
X-Forwarded-Encrypted: i=1; AJvYcCU3zr/HlKx/xcJPkbDrdfcZNnVHjlc+D/oMVWWn1WSNTnyZ1P8xVTKilj0fu3NaNO4nRGdPrsFSABkB0zI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZBkP3btuDDxbZkUI5PcYZZyD/T4JpoSQ+mkLoHKrJE1UM/Nvm
	jJegenukUjnd514S5VK6cwX/jL2hKRbcSkpgqtaLHF4wfXR8UpvWjqC5twxaMYM6n0RFT2zFyZV
	28IJK7CLIhHWN4i8lXcCNn+xvD0g=
X-Gm-Gg: ASbGncvOXiUbKs5hZI0rFQFm978xfRafmXhKUjoeVYOlvwqQ5fcKKdrn2SekahZkSzP
	8t3/26JL5ocWWRL0YD5C9rbPmZzF0ta8nS4/gg1p6+Wc7D0nO0yfvMjwumR4pSgST/5rzgMYbaD
	TVbu1DTKj+nm0G4WW9cEj4THVOTvxl3X2tnxkv28xK
X-Google-Smtp-Source: AGHT+IGiRNUzPFdPSLLv3HybeyLyN8HPd/5lzM/oyvuyIgllHW/BtQW9F5MZSBv3hVR+Ngp7/Cv5R4OpJ+MTpbZUlWw=
X-Received: by 2002:a17:907:9707:b0:ac3:8626:607 with SMTP id
 a640c23a62f3a-ac782e3a8camr647737166b.38.1743601011777; Wed, 02 Apr 2025
 06:36:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ed09edb167e74167a694f4854102a3de6d2f1433.camel@irl.hu> <8963a409dd575e040e5f07e4ad5e9c1d26b421f2.camel@irl.hu>
In-Reply-To: <8963a409dd575e040e5f07e4ad5e9c1d26b421f2.camel@irl.hu>
From: Dmitry Baryshkov <dbaryshkov@gmail.com>
Date: Wed, 2 Apr 2025 16:36:40 +0300
X-Gm-Features: AQ5f1JquQhOZxQMjaSHZ3hNl0wenZmYuULWVR-_sE5d_ZmjrXEhKjyvAnCxSmPs
Message-ID: <CALT56yPd-xfd=47xRxrCk4F3jib4Ti7kg8pRXy-gVAQpbOc=pw@mail.gmail.com>
Subject: Re: amdgpu_dm_connector_mode_valid regression
To: Gergo Koteles <soyer@irl.hu>
Cc: Dmitry Baryshkov <lumag@kernel.org>, regressions@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	amd-gfx@lists.freedesktop.org, Hans de Goede <hdegoede@redhat.com>, 
	Alex Deucher <alexander.deucher@amd.com>, Mario Limonciello <mario.limonciello@amd.com>, 
	Alex Hung <alex.hung@amd.com>, Harry Wentland <harry.wentland@amd.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 2 Apr 2025 at 15:00, Gergo Koteles <soyer@irl.hu> wrote:
>
> to: Dmitry's new address
> cc: regressions
>
> On Wed, 2025-04-02 at 12:40 +0200, Gergo Koteles wrote:
> > Hi,
> >
> > While playing with
> > https://lore.kernel.org/all/61c3df83ab73aba0bc7a941a443cd7faf4cf7fb0.1743195250.git.soyer@irl.hu/
> >
> > I found a regression that prevented some EDID DTDs from being selected
> > in some specific cases.
> >
> > This is the first bad commit:
> > b255ce4 ("drm/amdgpu: don't change mode in
> > amdgpu_dm_connector_mode_valid()")
> >
> > I think the problem is that decide_crtc_timing_for_drm_display_mode()
> > function tries to copy the crtc information from the preferred mode,
> > but that's not filled yet if the first one is the preferred one and
> > it's not the one with the maximum refresh rate.
> >
> > amdgpu_dm_connector_mode_valid()
> > create_validate_stream_for_sink()
> > create_stream_for_sink()
> > decide_crtc_timing_for_drm_display_mode(&mode, preferred_mode, scale)
> >
> > It works if I call
> > drm_mode_set_crtcinfo((struct drm_display_mode *)mode, 0) before
> > create_validate_stream_for_sink()
> > in amdgpu_dm_connector_mode_valid()
> >
> > or
> >
> > if I comment out the decide_crtc_timing_for_drm_display_mode() in
> > create_stream_for_sink()
> >
> > but a better fix than these can be imagined :)

Would it help if you force recalculate_timings to be true if
(drm_mode->crtc_clock == 0)

> >
> > more information:
> > https://gitlab.freedesktop.org/drm/amd/-/issues/4085
> >
> > Regards,
> > Gergo
> >
>


-- 
With best wishes
Dmitry
