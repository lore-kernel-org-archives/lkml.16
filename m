Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0C2A27F737
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 16:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748364822; cv=none; b=m7z2Ur+SJ+XL16cMTrK+pt42iFM10UEO9CjABJP6jnj+C8O8zsraE6mttDCNjzAs8Ky5enlgy56YKbFieZ0hLgI6wmsHL7g/2KDOvtTEccsaW0oZOdyLTnEOklbekkMblW6s83zi+fFQSyCLC7IXKpCKg4SduoY3Wr+W2cGanDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748364822; c=relaxed/simple;
	bh=/+mJueTcwzJnxfUyrN6qtZ9wFPaasq0r/I7p2x6WXUU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D70lVk/qbg+GpOpA2jCRME0X1m2WK4HgdY/wbBDqBLq2MN76IaQ4v0rYQxcraNscQ6Cy4hEMu+7WmWoxyAg30oQG1MYt3km8xFh1M2lq6fmICgrb+JLYuCxzsvULqcXsApxJnNePrAXD/WysEulY4OoY6RqoRK5WDAYJ+NTUu4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lzQ5EWua; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lzQ5EWua"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-4774193fdffso52302541cf.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 09:53:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748364819; x=1748969619; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cIF16cjUFV3ZsiCDhB3+Sm+ikqlHDW6+DhFShdpult8=;
        b=lzQ5EWuaw1fbv7cnAEJQ12/FGsT027YoA2SCoDyyiKp+RZ5PFVOQ7G00/AGei5fhV9
         JDEdX+fCjoZsueF5TIPwiZRX32WkHAASupb6iHMO69WL8nKHoE6HmX6gltoc0PfJ9CpZ
         13k0FSZi6kDaDDiNcsb9rtCxkevReUWaykQ+rvgiAFHKbmpkTi8+6TdRUVSbeYyegK8x
         hFS1g5z3IKr0HLtZmzwxpnnnd12kGYb7QrKT6X7dYFi2fP94eLB13DayrfGOlXqqd4m5
         kNbFhL670RjlXdFxXlxrw9NaELCI74DV1Z3sVt2GqdXeGz5jJrlrT+TGQnbYeGu8dGon
         zoEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748364819; x=1748969619;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cIF16cjUFV3ZsiCDhB3+Sm+ikqlHDW6+DhFShdpult8=;
        b=RXfjXDMRxlWIC6dGy/yvJ/gJYhLXNQpSlwjdluBHLc4MRDtSsSvSQld2geNYtz7bCy
         jI/t+NmT09Mw+ifTGOUVpwXzNNhctFq26KdR6BagKHXPNCVXLy4yMzVV5qqkDgCi1lpJ
         WopRUjtTMqUpP++xdzLFfdjXu/m0pSGVcfJnm1u3UCXOuUEg4Px/8lmSwF89SghnOqBq
         x+DL4KniZBzlxNyt8WpG/0TOExsEVJSeSkNERlKXM3z4/ZAR/Rt3i1Hs0o76pYkCKjOi
         /D7b/kv/P1WADBZh1KOXc8U3iz1lS9OJP8nAUWAK0Pe+X6ZXdBGlIVee8rhWm6vb8VEF
         a6nQ==
X-Forwarded-Encrypted: i=1; AJvYcCW3V4veEI3QgUp2Tg63jpjax/dpkAddk5fEqdJMKRHfiNsqa1lQhAkTM/NAXiJp1uem8pJYleUN1cdi1+Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YwW7zZCSmMrQ7Szkjnt1+O/qwSPLg+Wko1SubZPngzs4EjNLR8D
	hiS4MzUSnf4RC9e9vt+Z3RDxgVQe8Y3ECLhNTiIm+qhGSx56VaLDS6vIjdmcfglgwZYNUSVt6ML
	xsmssqETobsrvBC3k9syziuvxBVaOoQqiacrA+ROy
X-Gm-Gg: ASbGncs/DJhxVqINe7FQGPNqtE5pjTIXpQXS2p3M0CLkBrqGtyx5JcTj/FDoZP/djQ4
	3zAoXY0ubokrGIxlKlkxzyBoNjS8k1swCXhleXixx8Sdwd4aASClCBDdMDDWTzPi1a1q6ASs/Px
	xtybIz7tUi8JaE/DG62YbdT3lNlVn3nqHPqNlZbqdcS14h
X-Google-Smtp-Source: AGHT+IGOVup33wYIMODjDjhZVEP6vy2HF6m2q4apgA6nEaPhlb8nmtWkfGEB1yr2n8kL+JhC8OndZwIrygPLx6jGAsA=
X-Received: by 2002:a05:622a:4c17:b0:47b:4d3:5d12 with SMTP id
 d75a77b69052e-49f47de69a1mr234209671cf.49.1748364819234; Tue, 27 May 2025
 09:53:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250114190709.1.Ia17111747d0450169dbe902e5d7ef25912a9338e@changeid>
 <87a5bsh27o.fsf@intel.com> <CAMCVhVOagmBOj5UOr_HdohPApSAuprsObBm107X0q_1UfvSU_w@mail.gmail.com>
In-Reply-To: <CAMCVhVOagmBOj5UOr_HdohPApSAuprsObBm107X0q_1UfvSU_w@mail.gmail.com>
From: Jonathan Denose <jdenose@google.com>
Date: Tue, 27 May 2025 11:53:28 -0500
X-Gm-Features: AX0GCFscBYeJUL9UQGWT4MYv3EMeVnwe6ivZFeKx6NRoEUN4Z0ec3DV-VJ7qOWc
Message-ID: <CAMCVhVNH0KMEFDX85Sp0zFxgccKvVigsHebXAnvpNi4W6jK3fA@mail.gmail.com>
Subject: Re: [PATCH] drm/i915/display: Add skip link check quirk
To: Jani Nikula <jani.nikula@linux.intel.com>, LKML <linux-kernel@vger.kernel.org>
Cc: rodrigo.vivi@intel.com, intel-gfx@lists.freedesktop.org, 
	David Airlie <airlied@gmail.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
	Simona Vetter <simona@ffwll.ch>, Tvrtko Ursulin <tursulin@ursulin.net>, dri-devel@lists.freedesktop.org, 
	intel-xe@lists.freedesktop.org, imre.deak@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 15, 2025 at 9:47=E2=80=AFAM Jonathan Denose <jdenose@google.com=
> wrote:
>
> On Wed, Jan 15, 2025 at 3:10=E2=80=AFAM Jani Nikula <jani.nikula@linux.in=
tel.com> wrote:
> >
> > On Tue, 14 Jan 2025, Jonathan Denose <jdenose@google.com> wrote:
> > > The display on the Advantech UTC124G3PWWW0E-ES worked fine until comm=
it
> > > "drm/i915/dp: Recheck link state after modeset" was introduced. After
> > > this commit the display flickers intermittently as the driver code
> > > initiates the delayed link recheck in an infinite loop.
> > >
> > > To resolve this issue for the Advantech device, add a quirk to skip o=
ver
> > > the delayed link recheck.
> >
> > It would be better to try to get at the root cause first, instead of
> > blindly skipping required parts. The code's complicated enough without
> > quirks, and removing them afterwards is very difficult.
> >
> > Please file a bug according to [1], and attach full dmesg with debugs
> > enabled.
>
> I filed a bug with the full dmesg a few weeks ago:
> https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13344
>
> > Cc: Imre
> >
> > BR,
> > Jani.
> >
> >
> >
> > [1] https://drm.pages.freedesktop.org/intel-docs/how-to-file-i915-bugs.=
html
> >
> >
> >
> > >
> > > Signed-off-by: Jonathan Denose <jdenose@google.com>
> > > ---
> > >
> > >  drivers/gpu/drm/i915/display/intel_dp_link_training.c | 4 +++-
> > >  drivers/gpu/drm/i915/display/intel_quirks.c           | 8 ++++++++
> > >  drivers/gpu/drm/i915/display/intel_quirks.h           | 1 +
> > >  3 files changed, 12 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_training.c b/=
drivers/gpu/drm/i915/display/intel_dp_link_training.c
> > > index 397cc4ebae526..7804ad38b00cd 100644
> > > --- a/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> > > +++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> > > @@ -32,6 +32,7 @@
> > >  #include "intel_encoder.h"
> > >  #include "intel_hotplug.h"
> > >  #include "intel_panel.h"
> > > +#include "intel_quirks.h"
> > >
> > >  #define LT_MSG_PREFIX                        "[CONNECTOR:%d:%s][ENCO=
DER:%d:%s][%s] "
> > >  #define LT_MSG_ARGS(_intel_dp, _dp_phy)      (_intel_dp)->attached_c=
onnector->base.base.id, \
> > > @@ -1622,7 +1623,8 @@ void intel_dp_start_link_train(struct intel_ato=
mic_state *state,
> > >               lt_dbg(intel_dp, DP_PHY_DPRX, "Forcing link training fa=
ilure\n");
> > >       } else if (passed) {
> > >               intel_dp->link.seq_train_failures =3D 0;
> > > -             intel_encoder_link_check_queue_work(encoder, 2000);
> > > +             if (!intel_has_quirk(display, QUIRK_SKIP_LINK_CHECK))
> > > +                     intel_encoder_link_check_queue_work(encoder, 20=
00);
> > >               return;
> > >       }
> > >
> > > diff --git a/drivers/gpu/drm/i915/display/intel_quirks.c b/drivers/gp=
u/drm/i915/display/intel_quirks.c
> > > index 28f497ae785bb..d472a5f21f8b9 100644
> > > --- a/drivers/gpu/drm/i915/display/intel_quirks.c
> > > +++ b/drivers/gpu/drm/i915/display/intel_quirks.c
> > > @@ -78,6 +78,12 @@ static void quirk_fw_sync_len(struct intel_dp *int=
el_dp)
> > >       drm_info(display->drm, "Applying Fast Wake sync pulse count qui=
rk\n");
> > >  }
> > >
> > > +static void quirk_skip_link_check(struct intel_display *display)
> > > +{
> > > +     intel_set_quirk(display, QUIRK_SKIP_LINK_CHECK);
> > > +     drm_info(display->drm, "Applying skip link check quirk\n");
> > > +}
> > > +
> > >  struct intel_quirk {
> > >       int device;
> > >       int subsystem_vendor;
> > > @@ -229,6 +235,8 @@ static struct intel_quirk intel_quirks[] =3D {
> > >       { 0x3184, 0x1019, 0xa94d, quirk_increase_ddi_disabled_time },
> > >       /* HP Notebook - 14-r206nv */
> > >       { 0x0f31, 0x103c, 0x220f, quirk_invert_brightness },
> > > +     /* Advantech UTC124G3PWWW0E-ES */
> > > +     {0x5a85, 0x8086, 0x2212, quirk_skip_link_check},
> > >  };
> > >
> > >  static const struct intel_dpcd_quirk intel_dpcd_quirks[] =3D {
> > > diff --git a/drivers/gpu/drm/i915/display/intel_quirks.h b/drivers/gp=
u/drm/i915/display/intel_quirks.h
> > > index cafdebda75354..9e8f2816a4fba 100644
> > > --- a/drivers/gpu/drm/i915/display/intel_quirks.h
> > > +++ b/drivers/gpu/drm/i915/display/intel_quirks.h
> > > @@ -20,6 +20,7 @@ enum intel_quirk_id {
> > >       QUIRK_LVDS_SSC_DISABLE,
> > >       QUIRK_NO_PPS_BACKLIGHT_POWER_HOOK,
> > >       QUIRK_FW_SYNC_LEN,
> > > +     QUIRK_SKIP_LINK_CHECK,
> > >  };
> > >
> > >  void intel_init_quirks(struct intel_display *display);
> >
> > --
> > Jani Nikula, Intel
> --
> Jonathan

Hello,

After discussing on the mailing list, Imre found that it was a link
status reporting issue and followed up with some patches at [1]. Are
these patches closer to what you'd be looking for since they more
directly address the root cause?

[1]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13344#note_277=
3364

--=20
Jonathan
