Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B64FF229B29
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 11:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750333298; cv=none; b=Fj+eWL4kzDKIf9i2XwiJOs2YpPG8HoreKpeQEovQOrd9XazviM0t92gXs+Xhs0+Oy6LDmBpOuOzVnyz5AQQ8MvfCkBYgTXR8ffZLBhsaWMvVi+prwFoLtHIePSLh1dEWKA4iPqtsVFBjhOmFb0ApeiXpvuAH7ICWOYr1ZoRDUnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750333298; c=relaxed/simple;
	bh=FNkRJbjUbXtGGE6vjhHrYlnt1hp6guFu6M6ANMABhwU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=utPGtyw+7Wio4VW8bKBQcmrpoGpQgKQsRRio8bI+vj70KBRDZTTjg1Fs1RKcYusuwAf/WLz/rFKDj6RUIFO1TtJOXH2TL+T9qVkEDRsKItwWLbk+N8d9hZIkzX6jNWeg4XwlYeZRKKVC+lYQc9bqFBux3E9Mj3+kqrtZTXMp/vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FeJazXEM; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FeJazXEM"
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e82596e88c4so652705276.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 04:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750333294; x=1750938094; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4Gg7ntijtB80tv+b2enRtRMmTEicRNdW1NiQNVbSDNo=;
        b=FeJazXEMOjHde4QHNCFjVSVDnhPcE6Xy0G5YeyvdEcbZ8YEaokBq+Ys4zrqtht0bdR
         5TLVJQvgAjU7sKdEdpz2j4e0JtpV0eScMMbx3TU02Csu072OndkAQyvVCPOsuxDGNWJM
         r7ujWsdP7Ick8ifhdGDIF0NDBpGQ1Y/jWzT6rPAcn8cI5nC5+fqizuHgIGKY2AbpbV+w
         mVB5qoRSBMGugRh1RlaUovWtwgmSmyvvXr2yloHc0Q8rc+9u48IQa89nnaCCaIT73VO1
         5l7wR7bnZhLx9eyvpmsdnlIi5nLVS2vkt5ahMEfIMqoe637wU1NZFEY+LyDLxj2IK5hx
         BeWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750333294; x=1750938094;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4Gg7ntijtB80tv+b2enRtRMmTEicRNdW1NiQNVbSDNo=;
        b=C8Jx4BvyAG/z92JJQ+3pxOoNUa/4OKbFJH5ArdcnM/3XOPWXsK8N0bVLj+JjrLrFrt
         8Hpdk9rubIjv0iwSbYVX0n+Zq/u0A3x8w2WG2gtUAdU3JDRpRx7Yx9Om8bkdtFp3WrvF
         OihNMWXG+zOrf9csz2q23E7C+vBXJGkIBCAdBbNnQpDo1DaZQaDSFmQ82gXiCfmM35X3
         6TYLTWYcE/HNe5fq642JtRrqsdoi10n/zxBJJ9JT5iL37eDzopCKcR75nYHpTLjrnEJl
         Gh1e9uQXksbqaJ7jwTYd5gR3N9Di8o4uMo2xYWcQHaPvZN4idMpFN8/S+eMszLUpZ1jm
         16bg==
X-Forwarded-Encrypted: i=1; AJvYcCWOOeL9woCl4S5kAhE7Yvh0iEVUP4Vitxi9c9rHQVjwzhm1X2AeLzBtly6bBAS5t8w9sCr7ghnd2BUHy4U=@vger.kernel.org
X-Gm-Message-State: AOJu0YyEwqcYBtomhDrlgnDJCWLetXodvTI6pPX1Umhj1tS7+5QHWtnr
	IWexkf5j+xitqM2zSmC+tm+Y1Mg81EV3v32iqlOsqz+Xvh4a8xAS92nM356veHMPq0pyM++SMAp
	T22uBp+35gjNeVI5U3e63KrUoWtcUxIdZVQuRXRbYHZukLAZ0FrCTrOA=
X-Gm-Gg: ASbGncspjh1a/OlIKlXrtNju/gqnGePMf+UOdmvTlqCKiO61hZeoAo7YaLZcBcRWokp
	/6xYUJOEmcFiITtsr/bUH5EXEpjcudo5E/G4CFQ5iye2nUL0lTF7vLMgAz3L6enQtSiMyXh8e1O
	KdC9eNqO0013Y/6QoERiJuuqv1riw+aw7XlTq1yDgkAVOH
X-Google-Smtp-Source: AGHT+IESytQv1SK+Cd0PiaLJS4H3+JL25iRqvMAyP4xLxjP0vD5U9p3Ec+J/uOKogngm7hlSby5T2PNl/VdbIi6REWE=
X-Received: by 2002:a05:6902:1b8e:b0:e81:9d60:93a4 with SMTP id
 3f1490d57ef6-e822acac581mr30264102276.10.1750333293696; Thu, 19 Jun 2025
 04:41:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250523134025.75130-1-ulf.hansson@linaro.org> <fd4cfe7a-e29b-4237-b82f-48354deead3b@ideasonboard.com>
In-Reply-To: <fd4cfe7a-e29b-4237-b82f-48354deead3b@ideasonboard.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 19 Jun 2025 13:40:57 +0200
X-Gm-Features: AX0GCFuFeZwy4zEBgov1_20jiDIxj_2DarP8G86PtCbzf_bxqvHrj-WuuKyOtBY
Message-ID: <CAPDyKFpprO=HGuiHX3MQ_+m1YRnaWG=XwCx8-fSdXak8VBDUbQ@mail.gmail.com>
Subject: Re: [PATCH v2 00/21] pmdomain: Add generic ->sync_state() support to genpd
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Saravana Kannan <saravanak@google.com>, Stephen Boyd <sboyd@kernel.org>, linux-pm@vger.kernel.org, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Michael Grzeschik <m.grzeschik@pengutronix.de>, Bjorn Andersson <andersson@kernel.org>, 
	Abel Vesa <abel.vesa@linaro.org>, Peng Fan <peng.fan@oss.nxp.com>, 
	Johan Hovold <johan@kernel.org>, Maulik Shah <maulik.shah@oss.qualcomm.com>, 
	Michal Simek <michal.simek@amd.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 13 Jun 2025 at 12:33, Tomi Valkeinen
<tomi.valkeinen@ideasonboard.com> wrote:
>
> Hi Ulf,
>
> On 23/05/2025 16:39, Ulf Hansson wrote:
> > Changes in v2:
> >       - Well, quite a lot as I discovered various problems when doing
> >       additional testing of corner-case. I suggest re-review from scratch,
> >       even if I decided to keep some reviewed-by tags.
> >       - Added patches to allow some drivers that needs to align or opt-out
> >       from the new common behaviour in genpd.
> >
> > If a PM domain (genpd) is powered-on during boot, there is probably a good
> > reason for it. Therefore it's known to be a bad idea to allow such genpd to be
> > powered-off before all of its consumer devices have been probed. This series
> > intends to fix this problem.
> >
> > We have been discussing these issues at LKML and at various Linux-conferences
> > in the past. I have therefore tried to include the people I can recall being
> > involved, but I may have forgotten some (my apologies), feel free to loop them
> > in.
> >
> > I have tested this with QEMU with a bunch of local test-drivers and DT nodes.
> > Let me know if you want me to share this code too.
> >
> > Please help review and test!
>
> I tested this Renesas white-hawk board, and it hangs at boot. With
> earlycon, I captured with/without boot logs, attached.
>
> The hang case doesn't look very healthy with all these: "kobject:
> '(null)' ((____ptrval____)): is not initialized, yet kobject_get() is
> being called."

Tomi, thanks a lot for helping out with testing!

rcar_gen4_sysc_pd_init() calls pm_genpd_init() and
of_genpd_add_provider_onecell().

rcar_gen4_sysc_pd_init() is an early_initcall, which I guess is the
reason for these problems, as the genpd_provider_bus has not been
registered that early (it's done at core_initcall)

Do you think it would be possible to move rcar_gen4_sysc_pd_init() to
a postcore/arch_initcall?

Kind regards
Uffe
