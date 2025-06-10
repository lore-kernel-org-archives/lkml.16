Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F810286D47
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 08:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749545789; cv=none; b=R+qUD3qCnLVp7RfH+nRrk/DwkUkDfmISljQXoFfM5PGKxroXe4/zs5iJZFhigYyEFstfoXyzrASvcGzNfcOEg7lYuTMjfyBPj5uxPsPaJcfMcpF3Jya9ZPPAXCTGPnR4y3DGCNQU/PtA1Q1YlXK72X72ivaXlF9hvQGDfC4Tb8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749545789; c=relaxed/simple;
	bh=OkZteTqj89vD8YE8ptePo6qrcQZ2K/hgw6QIlko8l4I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ttLYtTqI6JY4t6f5Tht7GkEbKEoffcJ9/t9jXbgEQW12ZudIaVX0tQu7ogImKf8o9OZA90cgCer13Meyv1ho5Y4xsloxAxCXSLVdI6J/ToGKoQZDr5g8ELRkpZaQZZ+yL0A5DLe+n9637VWdgmEZOrF8YtYphnWdpJEZ139+ebo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=REm/iiLy; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="REm/iiLy"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-54e7967cf67so5481572e87.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 01:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749545786; x=1750150586; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OkZteTqj89vD8YE8ptePo6qrcQZ2K/hgw6QIlko8l4I=;
        b=REm/iiLyWzCQdVDhejtchpAGCLW06qY33QEcpkKT0mU8/SK3kDGP5IfRDpLfweo4Xv
         +TyEKbteqqZA4bEbdWk34SmtyljSJsLGe2zWVl6VHYMzfPlnYcP130SSP9w0BVY2spV+
         jMx4UyfRZSM33JjWlq61XitXxuiWq75VM4zECuqbWGZ/Nd5pXRZiKtuMu6aHjUfDmkHm
         SsylDLf+4zqoVomnS+7HyOfDuwW0D1nWx5YIzcLdtFtwacnmfiWF1hRpbwOccTlpzdmP
         E5XbY2xb6a47bxm6B0XMNXUFILMOg6g4SA6anR7iyL9Hdgj0cZ6kunEWgzZBK1W2RWbB
         L4Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749545786; x=1750150586;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OkZteTqj89vD8YE8ptePo6qrcQZ2K/hgw6QIlko8l4I=;
        b=Z9v+3wu+CfIhK6yU5SKHTxakiFlVVhicFYS59/s99VDdqsmQw6bjDO0HbMEcPcEfFW
         Xqv9K8ZNdodb+yp6d2cSoq/HaJeDsXm0iRNg9lJnBhfxcnjyvOuV3EL1E4R3B5RSlsa4
         NwsTJBnMwfyk45jT/JV4nY5Mcnpx0NPl5dCM05h/jgAy7DlNLrJrYVzl86q9xcdG8ZvT
         Xcx7Lnv10/FTOAM0djwIQu5bsWPuWywCq+1HPIwRlRJGHtdLr1B+UktDDwJSEpi+N1dV
         NcOrQ13avJ/eoRCEKt5FSyuWmOIdh1Ps4IRLihf+1J3CnKs6w+PBXa6ixCdN9k8Z5Fbm
         xAhA==
X-Gm-Message-State: AOJu0YyvjIDjk4ryr2yVevmT1iyhKcqbjSUg1gkDlcRcAemlg2JLAiGv
	FT9/ikGPJkAMaXM1DBMmCZzmmrMBmnx+mk2sexI0Q+yXInKfu15NBdmQwEWO6arYqoqCu/zpgsZ
	UIbDqZBO2SBS29c7pPtcr06s+LXs2YMhF0s/aGgxpuQ==
X-Gm-Gg: ASbGncs9R+MPS/OpbT7LMT0z5EoqqHVqzLvykxX0dFr12lNtLD+3Ga7PLdDmbJFHTFa
	iVRHUx9YcxR55HdCyxxZiTDL180tTRV+Qj9f5jdODqFw3DMTOTGG/ekZFx1/GHwBB5ugzViJfRz
	exTxMxcdlBWh6U3HhD4Q3LTA1qcn4nBxXnDcVl8KPYmT4TLIHQ/RDdROZ0HwB6i8oj0CsmkV+IH
	cz2
X-Google-Smtp-Source: AGHT+IHzM+g8BwVMSg5KivE3bnbyFxgHgy3hbTS2tih154P54kB9fXPtu7mzpu/YStm0VVubWDKtpspp5AmH+ODLbKg=
X-Received: by 2002:a05:651c:b2a:b0:32a:d211:2ed2 with SMTP id
 38308e7fff4ca-32adfe8a6c6mr42703181fa.39.1749545785649; Tue, 10 Jun 2025
 01:56:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250609103535.780069-1-marco.crivellari@suse.com>
 <20250609103535.780069-3-marco.crivellari@suse.com> <CAJhGHyBVWDKXfMLT3LBKFUu9ot2uRk=1xLebGf_Grh_j1_VOSg@mail.gmail.com>
In-Reply-To: <CAJhGHyBVWDKXfMLT3LBKFUu9ot2uRk=1xLebGf_Grh_j1_VOSg@mail.gmail.com>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Tue, 10 Jun 2025 10:56:13 +0200
X-Gm-Features: AX0GCFtNT8ZM4KdInKuliZqvk54d-8PBBI3JXa0WsFmi7nSIWBf7sMmoV2W9XMM
Message-ID: <CAAofZF7KRtTzLk7hhBSAirQ=sstmQG2gxGtbTW6LseNFzrxK1g@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] Workqueue: add system_dfl_wq
To: Lai Jiangshan <jiangshanlai@gmail.com>
Cc: linux-kernel@vger.kernel.org, Tejun Heo <tj@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Frederic Weisbecker <frederic@kernel.org>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Michal Hocko <mhocko@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Lai,

>What is the reason for removing system_unbound_wq? I believe system_unboun=
d_wq
>is a perfectly appropriate and descriptive name for its callers. I=E2=80=
=99m not opposed
>to system_dfl_wq as long as it will be an alias for system_unbound_wq (or =
even
>system_percpu_wq, if that can be configured at boot time by sysadim).

The rename to system_dfl_wq is mostly to make sure this is the default wq c=
hoice
when per-cpu is not strictly needed.
It has been proposed here, anyhow:

https://lore.kernel.org/all/Z79E_gbWm9j9bkfR@slm.duckdns.org/

>If anyone feels that the term "unbound" in WORK_CPU_UNBOUND is not aligned=
 with
>the "unbound" in system_unbound_wq, I acknowledge that concern. In that ca=
se,
>I would prefer to rename WORK_CPU_UNBOUND to WORK_CPU_UNSPECIFIC.

Yes, personally I like the idea.

>Many structures and functions underlying system_unbound_wq already use 'un=
bound'
>in their names, so simply renaming system_unbound_wq does not increase
>consistentcy.

What if we keep system_unbound_wq and instead of a pr_warn_once we
just redirect this to
system_dfl_wq, when it is used (like in this patchset, in eg. queue_work())=
?


Thank you!


On Tue, Jun 10, 2025 at 5:04=E2=80=AFAM Lai Jiangshan <jiangshanlai@gmail.c=
om> wrote:
>
> On Mon, Jun 9, 2025 at 6:35=E2=80=AFPM Marco Crivellari
> <marco.crivellari@suse.com> wrote:
> >
> > Currently if a user enqueue a work item using schedule_delayed_work() t=
he
> > used wq is "system_wq" (per-cpu wq) while queue_delayed_work() use
> > WORK_CPU_UNBOUND (used when a cpu is not specified). The same applies t=
o
> > schedule_work() that is using system_wq and queue_work(), that makes us=
e
> > again of WORK_CPU_UNBOUND.
> >
> > This lack of consistentcy cannot be addressed without refactoring the A=
PI.
> >
> > system_unbound_wq should be the default workqueue so as not to enforce
> > locality constraints for random work whenever it's not required.
> >
> > Adding system_dfl_wq to encourage its use when unbound work should be u=
sed.
> >
> > queue_work() / queue_delayed_work() / mod_delayed_work() will now use t=
he
> > new unbound wq: whether the user still use the old wq a warn will be
> > printed along with a wq redirect to the new one.
> >
> > The old system_unbound_wq will be kept for a few release cycles.
> >
>
> Hello, Macro
>
> What is the reason for removing system_unbound_wq? I believe system_unbou=
nd_wq
> is a perfectly appropriate and descriptive name for its callers. I=E2=80=
=99m not opposed
> to system_dfl_wq as long as it will be an alias for system_unbound_wq (or=
 even
> system_percpu_wq, if that can be configured at boot time by sysadim).
>
>
> If anyone feels that the term "unbound" in WORK_CPU_UNBOUND is not aligne=
d with
> the "unbound" in system_unbound_wq, I acknowledge that concern. In that c=
ase,
> I would prefer to rename WORK_CPU_UNBOUND to WORK_CPU_UNSPECIFIC.
>
>
> Many structures and functions underlying system_unbound_wq already use 'u=
nbound'
> in their names, so simply renaming system_unbound_wq does not increase
> consistentcy.
>
> Thanks
> Lai



--=20

Marco Crivellari

L3 Support Engineer, Technology & Product




marco.crivellari@suse.com
