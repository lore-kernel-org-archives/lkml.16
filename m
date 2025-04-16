Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89823221D94
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 13:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744811172; cv=none; b=hsadiaAWH6QAE592xBO4oBfin7fx64Zx66nYCj2TsTfRN4qCfN7cqsTDIVDEtWC/sraZKKogNTNCBceN6GFnyvtC92/WJmcO+kBk3TSeufvg4Z7bB89FxdUlLgRq3NB/baaPUkawbBJC3YP6GFC+pJlU2kjL+Y7YE2BPdI5rQ4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744811172; c=relaxed/simple;
	bh=t+jlbKBTkg3+/hs9ZVICnnlmyrYUYqdcHWmZM6Rv6hw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hh9ddTqo/CXFKXm3REaqesu9uSLcXPYNa4Ql4bbCSoDDTJLd3HLzXJd4AQiwG27sp/fC7do5eaM3Fqh+oYe2e4cCkuP+w3flZTgVW5cRpW+H1FB1mVWjN54jFRMJWIRbs98+e0o6yNBe8J8LEa3b8noNG6UR9Nu+71udM552fp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kfrbmt2/; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kfrbmt2/"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3913d129c1aso573734f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 06:46:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744811169; x=1745415969; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/VGTw2OCtCwNoikhMS1xSw/P9HzEaDz2YmQHVZNP6Cw=;
        b=kfrbmt2/S6WL/ORkdeYnxwAB5fjVRitH+4VwLe0WRFFvLCMScgXZYPnDsZWoDIdXLL
         5pDRHAiPZvrGS4y/1WDiJ1JYOaZ1Ghq2d/rAyMGPvbiMSqBiIlnvECQASlzf4sB9fYNq
         ULNxxhOE+nNsyTpgsY/l5/a46kFMQoabTofnQNq7UF86CjvjKxoxoRTTg3KBM8Py7CJe
         02CweFMYJYCXQmo7oxTIbXsnWqp5FI3kzXP92K7je/GlgPahaPT/CKTm7uxgUTx6ba5H
         QSAYCi8AcWwYUALdJbTb6kxL9GFQCI85U7EKuxK1alJxKVXCkb+AOdVmCzjQKB4RBh+t
         GR0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744811169; x=1745415969;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/VGTw2OCtCwNoikhMS1xSw/P9HzEaDz2YmQHVZNP6Cw=;
        b=EjcASQyz17JI7Bs2l0JwnRFrc+9psm+mis93qPrmq8qrqbFwE0b9TGX8EJDtZLMMzz
         UpdEWpuvCriDX66G1tj4Bt7HlBL0D0QYqXNEqFG1m8owei9n4WDj4xXS2lEu/AcmeVmt
         Vr7CoYne52I8AQWD+Iy75wYNsVw1O+oqJfOiPZhxZqR7LuZ0sGara1zY1bC7yutzoTCu
         T7QH70B1FJlz7w/8+w2ItRPDp3RW1JeAqaaJVQHhKw3LwAWFcUach7Eu5beH2633umuW
         3dttP4oLTL98CIWzBhL86GPN9agfw2+XdASjO48EH14Aiff1PhzXSF1ctg55FKtT6ScB
         G3rg==
X-Forwarded-Encrypted: i=1; AJvYcCUdkHUeegQzL/8gQMm6YDNyMqEnoVZAARN1OaxA68r/uqvi19mqQsXDGFj/1DGaA9C7Jy28aLU1pM6BJgc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3VHN8nw9HaDqQgGMrpKURL7xlYNuSn+muliA5kGQ0bP9HLJ11
	EbECZTfddI9Pp4aKTqFpHZvxdTC7aLPwY0kP+DW70KljT8/DeEyCsrYrEhvF26k=
X-Gm-Gg: ASbGncuZrWlvKbG8RmWkVMu/HK13CiR2PapAhfDt1aqTUBtZNv7xmZslboKgUIDulQ4
	7UEyqZGrDL+2rumzzQm7S6p7xnuRE+Jn+dEDVg9/1KS+6WE1ua5xJODsxZ52MINgg2BofAM/pG+
	YW3spZG3KeHE2a7NFsorP4GLWnLV/4V599qd095cF05ttfiSHzRVbS5d9D/emyjLV9HrU9+vrBY
	V73Aa1AWqqnPpRoSMjNT7t9F6XAPs1pu6DZ7sJrQlVjTg6xXjBg9Ld4v9Zq8em34Q7VqMGXFTb7
	lN/cwHExhxelpSzLsbFEW8oBmlidLQBUYC96koVnG2yle8pLA62Eg5BxKotkijpLUZeeIhr5gs9
	rMuw=
X-Google-Smtp-Source: AGHT+IE4YAl2mZjXep57P1NBcGIHNuPRNP7vshUejNnQtQU0uCb6wkLBjcmMTW/advV5IiWmlcYETQ==
X-Received: by 2002:a05:6000:2901:b0:39c:30f7:b6ad with SMTP id ffacd0b85a97d-39ee5ee2546mr1463106f8f.18.1744811168641;
        Wed, 16 Apr 2025 06:46:08 -0700 (PDT)
Received: from mai.linaro.org (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eaf44579bsm16937709f8f.87.2025.04.16.06.46.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 06:46:08 -0700 (PDT)
Date: Wed, 16 Apr 2025 15:46:05 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: John Stultz <jstultz@google.com>
Cc: Will McVicker <willmcvicker@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Saravana Kannan <saravanak@google.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Donghoon Yu <hoony.yu@samsung.com>,
	Hosung Kim <hosung0.kim@samsung.com>, kernel-team@android.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Youngmin Nam <youngmin.nam@samsung.com>,
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 6/7] clocksource/drivers/exynos_mct: Add module support
Message-ID: <Z_-0nX3Z-DLPjL_j@mai.linaro.org>
References: <20250402233407.2452429-1-willmcvicker@google.com>
 <20250402233407.2452429-7-willmcvicker@google.com>
 <Z_6OZHYfC0bC5289@mai.linaro.org>
 <CANDhNCodHATboF2=U2tTwdEkEJ+PsfB2F=fbBrs=J1UzZTEX8g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANDhNCodHATboF2=U2tTwdEkEJ+PsfB2F=fbBrs=J1UzZTEX8g@mail.gmail.com>

On Tue, Apr 15, 2025 at 05:48:41PM -0700, John Stultz wrote:
> On Tue, Apr 15, 2025 at 9:50 AM Daniel Lezcano
> <daniel.lezcano@linaro.org> wrote:
> > On Wed, Apr 02, 2025 at 04:33:57PM -0700, Will McVicker wrote:
> > > From: Donghoon Yu <hoony.yu@samsung.com>
> > >
> > > On Arm64 platforms the Exynos MCT driver can be built as a module. On
> > > boot (and even after boot) the arch_timer is used as the clocksource and
> > > tick timer. Once the MCT driver is loaded, it can be used as the wakeup
> > > source for the arch_timer.
> >
> > From a previous thread where there is no answer:
> >
> > https://lore.kernel.org/all/c1e8abec-680c-451d-b5df-f687291aa413@linaro.org/
> >
> > I don't feel comfortable with changing the clocksource / clockevent drivers to
> > a module for the reasons explained in the aforementionned thread.
> 
> I wasn't CC'ed on that, but to address a few of your points:
> 
> > I have some concerns about this kind of changes:
> >
> >   * the core code may not be prepared for that, so loading / unloading
> > the modules with active timers may result into some issues
> 
> That's a fair concern, but permanent modules (which are loaded but not
> unloaded) shouldn't suffer this issue. I recognize having modules be
> fully unloadable is generally cleaner and preferred, but I also see
> the benefit of allowing permanent modules to be one-way loaded so a
> generic/distro kernel shared between lots of different platforms
> doesn't need to be bloated with drivers that aren't used everywhere.
> Obviously any single driver doesn't make a huge difference, but all
> the small drivers together does add up.

Yes, I agree.

So the whole clockevent / clocksource drivers policy would have to be making
impossible to unload a module once it is loaded.

Do you have any ideas how to ensure that the converted drivers follow this
rule without putting more burden on the maintainer?

> >  * it may end up with some interactions with cpuidle at boot time and
> > the broadcast timer
> 
> Do you have more details as to your concerns here? I know there can be
> cases of issues if the built in clockevent drivers are problematic and
> the working ones don't load until later, you can have races where if
> the system goes into idle before the module loads it could stall out
> (there was a recent issue with an older iMac TSC halting in idle and
> it not reliably getting disqualified before it got stuck in idle). 

Yes, that is that kind of issue I suspect.

> In
> those cases I could imagine folks reasonably arguing for including the
> working clock as a built in, but I'm not sure I'd say forcing
> everything to be built in is the better approach.

When the first driver converted as a module will be accepted, I'm pretty sure
there will be a wave of patches to convert more drivers into modules. 

What tool / use cases / tests can we put in place to ensure it is not breaking
the existing platforms for the different configurations?

> > * the timekeeping may do jump in the past [if and] when switching the
> > clocksource
> 
> ? It shouldn't. We've had tests in kselftest that switch between
> clocksources checking for inconsistencies for awhile, so if such a
> jump occurred it would be considered a bug.

But in the context of modules, the current clocksource counter is running but
what about the clocksource's counter related to the module which will be
started when the driver is loaded and then switches to the new clocksource. Is
it possible in this case there is a time drift between the clocksource which
was started at boot time and the one started later when the module is loaded ?
 
> >  * the GKI approach is to have an update for the 'mainline' kernel and
> > let the different SoC vendors deal with their drivers. I'm afraid this
> > will prevent driver fixes to be carry on upstream because they will stay
> > in the OoT kernels
> 
> I'm not sure I understand this point?  Could you expand on it a bit?
> While I very much can understand concerns and potential downsides of
> the GKI approach, I'm not sure how that applies to the submission
> here, as the benefit would apply to classic distro kernels as much as
> GKI.

Ok let's consider my comment as out of the technical aspects of the changes. I
can clarify it but it does not enter into consideration for the module
conversion. It is an overall feeling about the direction of all in modules for
GKI policy. I'm a little worried about changes not carried on mainline because
it is no longer an obstacle to keep OoT drivers. The core kernel is mainline
but the drivers can be vendor provided as module. I understand it is already
the case but the time framework is the base brick of the system, so there is
the risk a platform is supported with less than the minimum functionality.


-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
