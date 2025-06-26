Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1426217716
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 10:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750932311; cv=none; b=P1zWExK7OFWr3QJRr7EoGNAuJlaq1xufdzDKJM5C0Owit/9lWA1BPs9UCqXr6AbLTRuu66TNd3VoVGn2Q7c5U9PkiLsAx1F2GTKhWjcVtH+D2JpGfk9xFwLHhj9E7whas5dRkLviMUMPQHOyYyBzhs+099s+DYnUHSW6U9tm9ZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750932311; c=relaxed/simple;
	bh=dqhmiv/jrw4EXl4UG21c/emO5d4PlM9K6RNlISK2dIU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PKNqzSDjFw9S+ncSQGfPv1ZZF74Vje+V6eoN3I8h5+CsmqL9aG6Bld2MAXUUH8Sxy1R6f9BHQ9tqfggX/j8jJs72tVdWeo1B2Q/+Xx4corN5JqzrRGSeMSd2h4d+MBqY4VWssTxD4KlAsw4dqwGcUvU7oEKLPp6XP1gfjJPS1vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zGz7Le59; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zGz7Le59"
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e82278e3889so486068276.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 03:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750932309; x=1751537109; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ef52RvSy9XhGGhE8oWCY3Xw5VEy2HnHxn8942Y4DhVA=;
        b=zGz7Le59KlLp8uhVP4c8kwKnCfxyfnVL7Tm7MrDqe7zF+LGtaw/xaFo75A1kdtkDf4
         Bf/OPvT70sGzZ1fT4+nCIYIlcfH0ib3GZyvRfNwDSoEtpxws5AxtLoqe9Sw1y/oXCevw
         FGzSDx8viD/zCLj3BM5eCM63dtl3EzstzyLwn3zRuT20eMnLyJmM04bB3eYI8W/CrzTm
         NSF2FrY3FtGPtp+YlCgeccZEsazKPDhyZ++WTYlTUO+cYtlgYX2AZUdvU5WGhahwJZ4U
         VLjKJ4ZlDaOEZqZCAhh83PjCJuFNAdf5whbpR3Wph/Iyj8e0+NxP7+lIo0/ov9y7wRr8
         Htpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750932309; x=1751537109;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ef52RvSy9XhGGhE8oWCY3Xw5VEy2HnHxn8942Y4DhVA=;
        b=tAfQ+6Y2k+dsC250Xi43+xxiG+TQ01ZBNYr0eb145TWv+4x4GAbynTehgBv0KdJ1CS
         /XQF0h1ghxZALxXyh6Ji2XQvvjjFnvGHZuh9CLkc+q21xQaqQMGP6FKlJ3D9PFFtOVe8
         x40Bl5v7DWwHbdA7tdi/QHKlOfjqV2Ha2QhTPGtZgIyJ2m/7SbX4GF0MXTJfQCJu4ZT4
         AxCu7DVd5aIRvSEJLmt1m7gRqbCpcLY9GhYDI1HuvDHq/OshhEVXXTsYaAQlr8nSF/4O
         mQocZAZI0caYbmG52ThQufIH7BQGm5P57V5KcwojVhQMtadyoeBOzusv3gExnkkYqq9l
         CmAg==
X-Forwarded-Encrypted: i=1; AJvYcCWYVpI7lr4yq7cyH4ermiNF1rZOulpyBEXe4vvf6WrnXDIZuFpC2wEZoE0/DTYn0wdxCqzBh6dUrOzbVds=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQ56ErP/l0MoSTyax84Bt9pvEIjzsGW3LxEP3ijJZsIxboNwQ3
	N38Y6fUpuIPM+bjzDr0wvf5w+CSjeAy0lxgKD5I23u0i377Mna5YY8tDueMuGIsahgJBvwoKVf6
	Yc4KVUG4jbK/cKelacnfvlW4PkXn8J7GMEl3KRNUvOQ==
X-Gm-Gg: ASbGncsiyT5XOLWZyjEa/w8qAR4dQQNIQOMJNY2eVn9L+3ATezJmqP3DvBD68wZkXGx
	n70JPNhoLlGQCJmGqOYn2u8gE5yOGhdI0U6ze1zz02tvWxLllRWv74DPdvwwSszESKD/PvOR5qB
	HOgMjJxOVOB9ecJLn6uOPLZnB++L2hjsEGPVKK3uGOffeU
X-Google-Smtp-Source: AGHT+IF7NPAj4Z0CZFURC7bo9oEf2t9Aj4FR2LgmBRt7AfszBVvGJ/ZF2nnBKEqjrDtJWKPfIQqisqh3ixSWLzu82bc=
X-Received: by 2002:a05:6902:1386:b0:e81:28d6:ed5 with SMTP id
 3f1490d57ef6-e879b88783fmr4524514276.8.1750932308884; Thu, 26 Jun 2025
 03:05:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <22759968.EfDdHjke4D@rjwysocki.net> <2045419.usQuhbGJ8B@rjwysocki.net>
 <CAPDyKFq8ea+YogkAExUOBc2TEqi1z9WZswqgP29bLbursFUApg@mail.gmail.com> <CAJZ5v0h-9UnvhrQ7YaaYPG5CktwV-i+ZeqAri8OhJQb4TVp82w@mail.gmail.com>
In-Reply-To: <CAJZ5v0h-9UnvhrQ7YaaYPG5CktwV-i+ZeqAri8OhJQb4TVp82w@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 26 Jun 2025 12:04:33 +0200
X-Gm-Features: Ac12FXyAJDJvyhpucU5vdfApDbdiWQJG4l_jYuOIpSNd9YClkqba7MNA8LQyvF4
Message-ID: <CAPDyKFoW5ag69LBnxvP5oGH1VAErBn17CAOzh=MX2toxAHwLxA@mail.gmail.com>
Subject: Re: [PATCH v1 4/9] PM: Move pm_runtime_force_suspend/resume() under CONFIG_PM_SLEEP
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>, Linux PM <linux-pm@vger.kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>, Linux ACPI <linux-acpi@vger.kernel.org>, 
	Linux PCI <linux-pci@vger.kernel.org>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 26 Jun 2025 at 11:41, Rafael J. Wysocki <rafael@kernel.org> wrote:
>
> On Thu, Jun 26, 2025 at 11:38=E2=80=AFAM Ulf Hansson <ulf.hansson@linaro.=
org> wrote:
> >
> > On Wed, 25 Jun 2025 at 21:25, Rafael J. Wysocki <rjw@rjwysocki.net> wro=
te:
> > >
> > > From: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> > >
> > > Since pm_runtime_force_suspend/resume() and pm_runtime_need_not_resum=
e()
> > > are only used during system-wide PM transitions, there is no reason t=
o
> > > compile them in if CONFIG_PM_SLEEP is unset.
> > >
> > > Accordingly, move them all under CONFIG_PM_SLEEP and make the static
> > > inline stubs for pm_runtime_force_suspend/resume() return an error
> > > to indicate that they should not be used outside CONFIG_PM_SLEEP.
> > >
> >
> > Just realized that there seems to be some drivers that actually make
> > use of pm_runtime_force_suspend() from their ->remove() callbacks.
> >
> > To not break them, we probably need to leave this code to stay under CO=
NFIG_PM.
>
> OK, pm_runtime_force_suspend() need not be under CONFIG_PM_SLEEP.
> That's not the case for the other two functions though AFAICS.

Right, but maybe better to keep them to avoid confusion? At least the
corresponding flag is needed.

Kind regards
Uffe

>
> > > Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> > > ---
> > >  drivers/base/power/runtime.c |    4 ++++
> > >  include/linux/pm_runtime.h   |   20 ++++++++++++++------
> > >  2 files changed, 18 insertions(+), 6 deletions(-)
> > >
> > > --- a/drivers/base/power/runtime.c
> > > +++ b/drivers/base/power/runtime.c
> > > @@ -1941,6 +1941,8 @@
> > >         pm_request_idle(link->supplier);
> > >  }
> > >
> > > +#ifdef CONFIG_PM_SLEEP
> > > +
> > >  bool pm_runtime_need_not_resume(struct device *dev)
> > >  {
> > >         return atomic_read(&dev->power.usage_count) <=3D 1 &&
> > > @@ -2063,3 +2065,5 @@
> > >         return ret;
> > >  }
> > >  EXPORT_SYMBOL_GPL(pm_runtime_force_resume);
> > > +
> > > +#endif /* CONFIG_PM_SLEEP */
> > > --- a/include/linux/pm_runtime.h
> > > +++ b/include/linux/pm_runtime.h
> > > @@ -66,9 +66,6 @@
> > >
> > >  extern int pm_generic_runtime_suspend(struct device *dev);
> > >  extern int pm_generic_runtime_resume(struct device *dev);
> > > -extern bool pm_runtime_need_not_resume(struct device *dev);
> > > -extern int pm_runtime_force_suspend(struct device *dev);
> > > -extern int pm_runtime_force_resume(struct device *dev);
> > >
> > >  extern int __pm_runtime_idle(struct device *dev, int rpmflags);
> > >  extern int __pm_runtime_suspend(struct device *dev, int rpmflags);
> > > @@ -257,9 +254,6 @@
> > >
> > >  static inline int pm_generic_runtime_suspend(struct device *dev) { r=
eturn 0; }
> > >  static inline int pm_generic_runtime_resume(struct device *dev) { re=
turn 0; }
> > > -static inline bool pm_runtime_need_not_resume(struct device *dev) {r=
eturn true; }
> > > -static inline int pm_runtime_force_suspend(struct device *dev) { ret=
urn 0; }
> > > -static inline int pm_runtime_force_resume(struct device *dev) { retu=
rn 0; }
> > >
> > >  static inline int __pm_runtime_idle(struct device *dev, int rpmflags=
)
> > >  {
> > > @@ -330,6 +324,20 @@
> > >
> > >  #endif /* !CONFIG_PM */
> > >
> > > +#ifdef CONFIG_PM_SLEEP
> > > +
> > > +extern bool pm_runtime_need_not_resume(struct device *dev);
> > > +extern int pm_runtime_force_suspend(struct device *dev);
> > > +extern int pm_runtime_force_resume(struct device *dev);
> > > +
> > > +#else /* !CONFIG_PM_SLEEP */
> > > +
> > > +static inline bool pm_runtime_need_not_resume(struct device *dev) {r=
eturn true; }
> > > +static inline int pm_runtime_force_suspend(struct device *dev) { ret=
urn -ENXIO; }
> > > +static inline int pm_runtime_force_resume(struct device *dev) { retu=
rn -ENXIO; }
> > > +
> > > +#endif /* CONFIG_PM_SLEEP */
> > > +
> > >  /**
> > >   * pm_runtime_idle - Conditionally set up autosuspend of a device or=
 suspend it.
> > >   * @dev: Target device.
> > >
> > >
> > >
> >
