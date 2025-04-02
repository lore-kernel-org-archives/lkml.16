Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 761CA2E3394
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 10:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743591490; cv=none; b=OLun2NhctwEqjqjcu7sOiGW0N9bUIqXJhqgPs+sWTn6hVORvcuY5e4WsQzufds3sCv4LvUTFTyqBt0Eezc6wU2NRP1FOvXK6L2pcEtJzKUMCSEMMkdL2IpBuXSpI9gkBg8qmpJ/tKAxutNIZNgE+QT6BMaX/+X8fPa3VrSB5+xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743591490; c=relaxed/simple;
	bh=oHnXcQB0S0up0mwwkEsheU8fO8/UbkzmWrVgmRgqwko=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VyDP7+N56UPwFdZvFC0NGaEjM6gmWFEYumo60mte+/v5ECDMr/XoYAISw4SaG20IEVxWliRjBpGvHiEpiS3LCYvsTmbx0rNvEZRUXlA4C3AlOYXhq2SRf+dAePbhOLkOvclzk9ianFO+RmybRg+5W+TJI6DyIeaNRFfI4NuNkZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=E9IKNskH; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="E9IKNskH"
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e643f0933afso652481276.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 03:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743591487; x=1744196287; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z8FfKXwZWZe+Vwy/+2J/r9/5ZnSBT9FI69EHi06JWxg=;
        b=E9IKNskHrpSNTx8Og2tiqaql0a6zZV7SruxotsJLW57REUASIl1FmqGgDvbJ7X6NAS
         +WwtD2vgiWiosKP4NjLMnyxrFjf75xbTL+WOiVD9tA+Qs4vYZWxImLPB5MSaMeKTEKLf
         T+Tfi3HBrbU/wEMuXHzlDipeUenj38FBmp5XxMX7Jtqfigt9+ApOdzNW6V9h0sdlV+aj
         UZx9nV2XLAesdn9jXJV5R9roZRWs8qqvdkve967C5HiEisGk18srwYD94ivZ7pd91ZJF
         mXOhD71+j8a/46r2haBn+KnVRS6MaFxUyiuKFhVPHRp0a2n9f6KKw6Wb+8PBwxgwynKR
         Mazw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743591487; x=1744196287;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z8FfKXwZWZe+Vwy/+2J/r9/5ZnSBT9FI69EHi06JWxg=;
        b=DkJo0XcZnlqvH0As+hRrv5AUAGv/uf6/T0O49qU74bWuoDu7OyMbS6LEIcgfSpkTFM
         f5eL1roHHaNRrfJHk5TrYDQu7DmdjP2Ymclypep3l23MXt0rXFtrc19lMBQzk4MrnTDm
         Kb7B59FTRcePtA1B5CIonpjnFQxlvn99FS3l31vQ+mh73AOakYX/f2blNP6A3cWC9Veo
         I/ZTnfYO3eyEGiwS9aTPUofCxbb3wbKAYA5VSWkaLm10Zztx7LgZPaUYh4GlC1VUDL+4
         Iyx94COccUCvEtbO6MSc+/N47LI4axuRPIz3PmemoGPbg7QvoKVWMSbk885rWLNHB0G+
         YsBQ==
X-Forwarded-Encrypted: i=1; AJvYcCW66Ve4yH0lrzTwCXZjxGimbNDVwvfiU43StL80JqlJlhLigoS8v+z2g/1wvFx+xxoIfJy/Z5vVS9+s/2o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8OewSyICF0cNW9xPC1ntYG1EQp4bXWYsljo0ngbSe/pEWonBR
	R60SdTtXvolp/HxP/yxJCc7FnqNrhhLYYBjbwthu3DsL4b8hH+nZZfkbPjTCBX6+bFGsBKvpro1
	VpLuRBwr+hp0IJswW1oW7XsyLHCfTUeC8ncpDCQ==
X-Gm-Gg: ASbGncv4Q4Ywc1Vx8GmugTqNn3rZmoXS9zhGDSeMTOm0oKWG+jzNYJO0x1c/iIGKGIb
	7zwxepG9hnoAIRAJf16f3ArFuG1AgJ+1rMhaOaw9luHRWJrsN6AAAXkfKYLUtxqgnbmIK90SJle
	OLWpoaUsm7Wu4eI5x+tzcxsaUDTx0=
X-Google-Smtp-Source: AGHT+IHF4Hljr4H0DWptLVjHo3hM2xZRvUkaXcgdJ4IUCbeypueQRjMmC31a9Q/VTJ5sLrPOCFUp1lwnnPu7PdjUYbM=
X-Received: by 2002:a05:690c:2d89:b0:703:b8f7:a653 with SMTP id
 00721157ae682-703bf172bbdmr19977377b3.9.1743591487285; Wed, 02 Apr 2025
 03:58:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20250326030527epcas2p33aa30e62cc8a00c9e151c35bee71dac5@epcas2p3.samsung.com>
 <Z+Nv8U/4P3taDpUq@perf> <8634f0mall.wl-maz@kernel.org> <Z+TEa8CVAYnbD/Tu@perf>
 <86v7rulw2d.wl-maz@kernel.org> <CAPDyKFrxK3Mx055hx+a4SP3CWDpWP+CEHxz+WJfT+RficK0_Ag@mail.gmail.com>
 <87o6xgyqkw.wl-maz@kernel.org>
In-Reply-To: <87o6xgyqkw.wl-maz@kernel.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 2 Apr 2025 12:57:31 +0200
X-Gm-Features: AQ5f1Jrh6EOc3e_W1e2v-3GPFZowzyDlexG_NRudvbxcUrGJw_lLxrjADg_ZJEI
Message-ID: <CAPDyKFqs+o1snQL-kwC+4-ENDO=P9MwPnAN6YTkExJgLsosHhA@mail.gmail.com>
Subject: Re: [GICv3 ITS]S2IDLE framework does not invoke syscore_ops in GICv3
 ITS driver
To: Marc Zyngier <maz@kernel.org>
Cc: Youngmin Nam <youngmin.nam@samsung.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Saravana Kannan <saravanak@google.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kernel-team@android.com, hajun.sung@samsung.com, d7271.choe@samsung.com, 
	joonki.min@samsung.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 1 Apr 2025 at 15:11, Marc Zyngier <maz@kernel.org> wrote:
>
> On Tue, 01 Apr 2025 13:45:43 +0100,
> Ulf Hansson <ulf.hansson@linaro.org> wrote:
> >
> > On Thu, 27 Mar 2025 at 09:25, Marc Zyngier <maz@kernel.org> wrote:
> > >
> > > On Thu, 27 Mar 2025 03:22:19 +0000,
> > > Youngmin Nam <youngmin.nam@samsung.com> wrote:
> > > >
> > > > [1  <text/plain; utf-8 (8bit)>]
> > > > On Wed, Mar 26, 2025 at 08:59:02AM +0000, Marc Zyngier wrote:
> > > > > On Wed, 26 Mar 2025 03:09:37 +0000,
> > > > > Youngmin Nam <youngmin.nam@samsung.com> wrote:
> > > > > >
> > > > > > Hi.
> > > > > >
> > > > > > On our SoC, we are using S2IDLE instead of S2R as a system susp=
end mode.
> > > > > > However, when I try to enable ARM GICv3 ITS driver (drivers/irq=
chip/irq-gic-v3-its.c),
> > > > > > I noticed that there is no proper way to invoke suspend/resume =
callback,
> > > > > > because it only uses syscore_ops, which is not called in an s2i=
dle scenario.
> > > > >
> > > > > This is *by design*.
> > >
> > > [...]
> > >
> > > > > > How should we handle this situation ?
> > > > >
> > > > > By implementing anything related to GIC power-management in your =
EL3
> > > > > firmware. Only your firmware knows whether you are going into a s=
tate
> > > > > where the GIC (and the ITS) is going to lose its state (because p=
ower
> > > > > is going to be removed) or if the sleep period is short enough th=
at
> > > > > you can come back from idle without loss of context.
> > > > >
> > > > > Furthermore, there is a lot of things that non-secure cannot do w=
hen
> > > > > it comes to GIC power management (most the controls are secure on=
ly),
> > > > > so it is pretty clear that the kernel is the wrong place for this=
.
> > > > >
> > > > > I'd suggest you look at what TF-A provides, because this is not
> > > > > exactly a new problem (it has been solved several years ago).
> > > > >
> > > > >     M.
> > > > >
> > > > > --
> > > > > Without deviation from the norm, progress is not possible.
> > > > >
> > > >
> > > > Hi Marc,
> > > >
> > > > First of all, I=E2=80=99d like to distinguish between the GICv3 dri=
ver (irq-gic-v3.c)
> > > > and the ITS driver (irq-gic-v3-its.c).
> > > >
> > > > I now understand why the GICv3 driver doesn=E2=80=99t implement sus=
pend and resume functions.
> > > > However, unlike the GICv3 driver, the ITS driver currently provides
> > > > suspend and resume functions via syscore_ops in the kernel.
> > >
> > > For *suspend*. The real suspend. Not a glorified WFI. And that's only
> > > for situations where we know for sure that we are going to suspend.
> > >
> > > > And AFAIK, LPIs are always treated as non-secure. (Please correct m=
e If I'm wrong).
> > > >
> > > > The problem is that syscore_ops is not invoked during the S2IDLE sc=
enario,
> > > > so we cannot rely on it in that context.
> > > > We would like to use these suspend/resume functions during S2IDLE a=
s well.
> > >
> > > Again, this is *by design*. There is no semantic difference between
> > > s2idle and normal idle. They are the same thing. Do you really want t=
o
> > > save/restore the whole ITS state on each and every call into idle?
> > > Absolutely not.
> >
> > I agree that we don't want to save/restore for every call to idle,
> > that would simply be unnecessary and add latencies.
> >
> > Instead, I think the save/restore could depend on what idlestate we
> > enter and whether it's a system-wide state (s2idle/s2ram) or just
> > regular cpuidle-state.
> >
> > Today, we are pointing the callbacks for cpuidle and s2idle to the
> > same functions (at least for PSCI PC mode), but it's easy to change
> > that *if* we need some differentiation between s2idle and cpuidle.
> >
> > >
> > > Only your firmware knows how deep you will be suspended, and how long
> > > you will be suspended for, and this is the right place for to perform
> > > save/restore of the ITS state. Not in generic code that runs on every
> > > arm64 platform on the planet.
> >
> > Assuming we can make the code for saving/restoring generic (not in FW)
> > and that we are able to make sure the code is only executed for those
> > platforms and states that really need it. Do you think there would
> > there be any other drawback for doing this?
>
> Yes. We'd end-up having to implement all sort of split PM schemes
> depending on the GIC implementation, what the firmware does, the
> various braindead assumptions that the integration makes, and other
> parameters I don't even want to consider.

I don't think it needs to be that complicated, at all. But let's not
discuss the solution at this point, at least for me, that's too early.

However, I do understand your concerns and share them.

>
> The GIC power management is, for better or worse, *outside* of the
> scope of the architecture. Most of it is implementation defined,
> because each and every implementer/vendor sees it as added value to
> invent their own particular flavour of crap. For example, there is no
> provision for wake-up interrupts, because nobody can agree on how
> that's supposed to work.

Right. I guess it falls in the SoC specific area and we need to live
with it, for now.

Anyway, the main reason why I joined the discussion is exactly because
of this. I have been working on enabling the same deep state for
s2idle as the one that corresponds to s2ram for some legacy arm64
platforms. To allow the system to wake up properly from this deep
state, I needed to save/restore these types of GIC registers.

I intend to post a complete series for this soonish. It should show
what is needed for a particular SoC in this regard. I will keep you
posted.

>
> Do we want to deal with this in the various GIC drivers? No. It is the
> job of firmware to manage this mess, because this clearly delineates
> where the responsibilities lie.

The FW could deal with this, but that would only work for platforms
with new or upgrade-able FW, which is not the case for these legacy
platforms that I am working on.

Moreover, we already implement the save/restore for some GIC variants
- and in some cases using different ways to do it. In my opinion it
would be nice to have a common solution that would only be enabled for
the states/platforms that really need it. In the series above I will
try to implement this, let's see if I can make it.

Kind regards
Uffe
