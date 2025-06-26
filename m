Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1B3E22173C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 10:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750933268; cv=none; b=awHzrbcC8Mt6btNLYeRtCs4DHTBMs4aTqJff2GiF4jt93AV52czw96gwhDIot9a4SohMftArohQRtbJwC23YD4RKxITZ/xm6WMm2VmfDc8f2trH0JS5hM3ZOR35XsTXl6+B161oghIEOgwmOgrVOjjdz+p1BO4Ji+meY+9RAfcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750933268; c=relaxed/simple;
	bh=c08UXPYZtjpEMhL4kGvfOaWGJO+poU22yY2ilFqSmcA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UjB2Ht5+yaILX4bPGMPmpMErdWT6zO1tlqjXZUYqgLdxnLVnnK/BLqJVEaHjIeR8RyIN6tWdyHSZ9wJWpNCEApEh2jxdSqGOO0Asq7m7b9qvvpicu3WQnY0rORMfkGJkXeovY6A0pttW7HjiK4OUbJrutiHlDKUvA8yxwCOMUbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Y+sLk1Zc; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Y+sLk1Zc"
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e8600c87293so584620276.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 03:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750933266; x=1751538066; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EgWe1yEUe01r1E8Tw1sTfxB+GfHH0ZziUvZh1CX89D4=;
        b=Y+sLk1ZcybgkjHFieEeaIHfAuTAQg+fAEa9nPTsjOI3n8eDvwfuV+a/ZU8HTMMFwd0
         sEN7Atrl15tz+lxoIgtZ7WGVLOz8vrMJaCKcUttBCMooKyQRx2BkpklFpD5YfTTPSS1/
         zUPwe8jfIlM5ltQWG9GrbC5eiVHSbrYGLW/ya7kyn7X3CK7VMlJln+M+VaQzK8nC8nHk
         6GXZDFo7wRgaZjXEsHP5KV5fRbNkG3lNPk6T2wZONhVvFIivaKEfbyi7+SVEcLm3fzXW
         56YFqS8kv9BH6LyUDPg5ysCDhIYzA30vsr6gwYpv+YpnwhYKYu+tbxFvQTnYJ4L7z1mo
         0qpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750933266; x=1751538066;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EgWe1yEUe01r1E8Tw1sTfxB+GfHH0ZziUvZh1CX89D4=;
        b=VS1NeLA5o0NpJwkKVLCgKZIeMVUyzG5Hyfh5HQIFzYajEg18H9wKsRU0EBaW7g8s3D
         nCNJHvUhFRi2PWxh7EzYIdztD6oe8nb0bFcGhC5FwqsQafOKJo+T/UAepWW4xV59cKNR
         U86DCFHd960GQRu13nukFrZ3vr2kOr1ChOvpRdy4OsyWua+aWWd2iiTpYYxKIkpDjDSi
         FLEISg2bCQWDn2UJa+/g6PrzXw2eMOEepeiCrLFnPs4XCHfDEr+Euhhu3R07a2qYBN0J
         OBJBizk12dRCnVmZEc8b4X4mD6IScJtkr0WSWp2vyfTCa65vq4JCWlqfpl3GmfJLN/rE
         dA6g==
X-Forwarded-Encrypted: i=1; AJvYcCUaJ3tCo76GtbIg5ix6T2s7e5Iilcn/0XlPW9r5WWHmQ/p+GUUb3t4kNV8gkgbJ6IPK7yLQsmm4OoB1vS8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHjdftsShqKc2sLyGuTAhbK02XAL45AZ3u7z1exQuUbdW3Fxph
	11nzCHCbH+eSiJ5lnkRsOmK+c5BdzyLATUu+KVtwW6zcojMhBmAWAlmpZ1QKR/32XicWcZNQGVo
	pm7GTYNEVfCxOksyxnN/xTNd9vneuESN8r1WwOpvFpA==
X-Gm-Gg: ASbGnctc3AdmunH4umJyVQVQ3JH5ibUk4jOn7SJXuz3kxsHVAlTWIU3HKlS7SJ7TqTO
	IJnkF+R8ZIAwUjY/QbLx9f67D2YnfKBpeMpq0bFsJmpnCDEfOJoe62CQAbIV3oBvf+h9nA6jmG9
	FIFUCdaZaChivS3O35n9yFXG2aIKoJ0+9Y9WWHTdWe9gmU
X-Google-Smtp-Source: AGHT+IEyk3mms1+5t/8MuCL0xllpmb6YLFcWeRD/hQ0f5nW0B1ALuSQjWxbP5EYpCLmojQnL9hQoN2Or3EhNmCkqm78=
X-Received: by 2002:a05:6902:2b90:b0:e84:2adb:2548 with SMTP id
 3f1490d57ef6-e86017a744amr8247814276.24.1750933265396; Thu, 26 Jun 2025
 03:21:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <22759968.EfDdHjke4D@rjwysocki.net> <2045419.usQuhbGJ8B@rjwysocki.net>
 <CAPDyKFq8ea+YogkAExUOBc2TEqi1z9WZswqgP29bLbursFUApg@mail.gmail.com>
 <CAJZ5v0h-9UnvhrQ7YaaYPG5CktwV-i+ZeqAri8OhJQb4TVp82w@mail.gmail.com>
 <CAPDyKFoW5ag69LBnxvP5oGH1VAErBn17CAOzh=MX2toxAHwLxA@mail.gmail.com> <CAJZ5v0jx643Os_hvAwoOvYbP3VPhAhgWBqQJk+Rp8zn=w49w9Q@mail.gmail.com>
In-Reply-To: <CAJZ5v0jx643Os_hvAwoOvYbP3VPhAhgWBqQJk+Rp8zn=w49w9Q@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 26 Jun 2025 12:20:29 +0200
X-Gm-Features: Ac12FXxpBZ3tZsz4pEVg98bpJK1QwSul4p2Gdnai6PYvcQNw3Uyzytb7ot0tbss
Message-ID: <CAPDyKFpnvg3w9B_R7F-xrhXU+upFSJv5c=buVR5FyFnqoach_g@mail.gmail.com>
Subject: Re: [PATCH v1 4/9] PM: Move pm_runtime_force_suspend/resume() under CONFIG_PM_SLEEP
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>, Linux PM <linux-pm@vger.kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>, Linux ACPI <linux-acpi@vger.kernel.org>, 
	Linux PCI <linux-pci@vger.kernel.org>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 26 Jun 2025 at 12:13, Rafael J. Wysocki <rafael@kernel.org> wrote:
>
> On Thu, Jun 26, 2025 at 12:05=E2=80=AFPM Ulf Hansson <ulf.hansson@linaro.=
org> wrote:
> >
> > On Thu, 26 Jun 2025 at 11:41, Rafael J. Wysocki <rafael@kernel.org> wro=
te:
> > >
> > > On Thu, Jun 26, 2025 at 11:38=E2=80=AFAM Ulf Hansson <ulf.hansson@lin=
aro.org> wrote:
> > > >
> > > > On Wed, 25 Jun 2025 at 21:25, Rafael J. Wysocki <rjw@rjwysocki.net>=
 wrote:
> > > > >
> > > > > From: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> > > > >
> > > > > Since pm_runtime_force_suspend/resume() and pm_runtime_need_not_r=
esume()
> > > > > are only used during system-wide PM transitions, there is no reas=
on to
> > > > > compile them in if CONFIG_PM_SLEEP is unset.
> > > > >
> > > > > Accordingly, move them all under CONFIG_PM_SLEEP and make the sta=
tic
> > > > > inline stubs for pm_runtime_force_suspend/resume() return an erro=
r
> > > > > to indicate that they should not be used outside CONFIG_PM_SLEEP.
> > > > >
> > > >
> > > > Just realized that there seems to be some drivers that actually mak=
e
> > > > use of pm_runtime_force_suspend() from their ->remove() callbacks.
> > > >
> > > > To not break them, we probably need to leave this code to stay unde=
r CONFIG_PM.
> > >
> > > OK, pm_runtime_force_suspend() need not be under CONFIG_PM_SLEEP.
> > > That's not the case for the other two functions though AFAICS.
> >
> > Right, but maybe better to keep them to avoid confusion?
>
> There really is no point holding pm_runtime_need_not_resume() outside
> CONFIG_PM_SLEEP and pm_runtime_force_resume() really should not be
> used anywhere outside system resume flows.

Right, I am fine moving it if you insist.

>
> > At least the corresponding flag is needed.
>
> What flag do you mean?  If pm_runtime_force_suspend() does not go
> under CONFIG_PM_SLEEP, needs_force_resume will not go under it either
> (so I'll drop the next patch altogether).

Yes, that's my point. needs_force_resume needs to stay within CONFIG_PM.

Kind regards
Uffe
