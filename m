Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4081C280311
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 18:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747765059; cv=none; b=bBpRUqfMX522f6nq4jDMRTJuGDhq+1X/2QomZf5v8472UIcxaYP8V3tH7Q0XxPC2R41BD1aX8SZnsDcqttbM7htHj/FHppGuKi0PlByjr5h2Nhv03r45B/3nvzhIk9DAe50+GnJFM8S/SO7VFh7m4iVxVDxZhDxPE4wVlhfVr8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747765059; c=relaxed/simple;
	bh=mzQWAmde9GCU1HYvOGc8jSAoQhxbzid1qCVXkzRnw4c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GzpdDam2+DukSf2/Yw5nLd9NiGg51GJmsBw3bkK84fIHd/Tt1We9ej4HYjSJPBegZswAbIF/T58i6p793cr/YuXnZ7RUZh8BdxL88E/usD9f/VPd6zl5rNOn5Y5bydkKZQcPvUygJ59HCGAw+pygvruhQhaXLtp0CqtLQcYa8EM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=yjewQPNY; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="yjewQPNY"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-231f37e114eso791605ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 11:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747765057; x=1748369857; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rj6cuEtgPwaokC1YAA1DRoIYgCjBGOSAiRIOusBAydw=;
        b=yjewQPNYwXGw0woE963lq3Uy5sOV1tp+qHWg+DTB28vM9uFpV9aYIhFLBhirxgDpxh
         tPog1SNAN2e/zjM/QcZueKNiEmjpwz4s5JqgUkfKokYDHqPIV1f1cLDz5bIEpyZ5BDMo
         H45ieirezR5b2NPfLjuo0Goz/s98N+R3RaemtRr+7q/4RQExIw4ZUEFeHqDJaHxtdwZ4
         ufQvNygZjCFQoypsh1i+4rv5l1ONTevuDhn3TP1FMSYFoo378oGlafF3jJnw76W2E6uC
         w4r7+d/3MGyldBe4dnNTfFsJyZ3ZFgajk9+mafU3FHvLMSbNAeodA3F/Liq5Ps6nUI7F
         STuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747765057; x=1748369857;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rj6cuEtgPwaokC1YAA1DRoIYgCjBGOSAiRIOusBAydw=;
        b=LqnYZS5/hHp+enDJcoCbfR3epmgWDwVkN2ecVXRA/6rGAEYnreWTclQi27mUJF3YvT
         1XLGQodRUv9Hm9TY0twRKsIVfIteU2LZbHeOXQKC8Fhf1nngyM5VOpOGlryTUT4tLiEk
         C3VdiBuausP82S6XaL/gE+l8uNKWWBnauMmctJ2PDcNq4aX4QoT2+IljiNWczdhSsJct
         6rztt5eFEqwkq5CaX1hask+gBxvhxKnM0dzoQWFouFBVnScLggWmvvNhHPVe0j6p5ggJ
         EhSahgfuBe/TxENmoUz6Z/vCsJZpK6+3xBzCy2mH2rj+p3ZPe+nxUOjtJfGc9oZRbm2j
         88dw==
X-Gm-Message-State: AOJu0YwWOUpJQaWXtEd0kcwBETkmNKDkO4ShPl2cNL32jvGV6l0w/SnR
	hOXAU9ZBPUiO3dA7Sj95rhpchoYkbfanIPZMuFayHY5oe8EmE3Y4vJziL8WOM1NQmgAgCE07V+u
	wmxJZ41V4yxu1ybiIn39x9bYN3dvqB6tImUFrZ2d6
X-Gm-Gg: ASbGncvwWhwF0bE6jG2AGxBbtQDf7vbh+XPglDIBjuBVbsDNlAUvMgpfOwsUWXaghE/
	6MiVYhZfro67BdK9Et8nWciQSMvJOIIzTOMpgbILjf+iiduJ5Ucmdrgk0vUYhxu2oq+K8Yhza4x
	nAKD7TjYF6jb1t7JqfPQMREYGN9Gy5bOWe5eOWhGEdmlOcS4E7DFNTcUNOVVMy/O6/o7aAu7s=
X-Google-Smtp-Source: AGHT+IGVnPvRnLKevDofFAioUmUDx1dvHtYmw/Mku7nZSxCpbeKW0qtgvmF1AgzQzrszrgq3CCnsnWp1j01gLsFhaYs=
X-Received: by 2002:a17:903:1a27:b0:231:f6bc:5c84 with SMTP id
 d9443c01a7336-231ffd19beemr8604455ad.8.1747765057194; Tue, 20 May 2025
 11:17:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250515170945.278255-1-amoorthy@google.com> <aCpGePN3w0efNtpr@google.com>
In-Reply-To: <aCpGePN3w0efNtpr@google.com>
From: Anish Moorthy <amoorthy@google.com>
Date: Tue, 20 May 2025 11:16:59 -0700
X-Gm-Features: AX0GCFsS_etfT9mkFmtFjYAT2vSjdTYz3dzVpazIXPRTrkQWmlJtQQkvq6x1LEY
Message-ID: <CAF7b7moWAVAL-_=ZyN-cCvHePxaf15bstQ+-5VzSdpDW=3Gh2Q@mail.gmail.com>
Subject: Re: [PATCH] Rename get_unused_fd_flags to get_unused_fd
To: Carlos Llamas <cmllamas@google.com>
Cc: linux-kernel@vger.kernel.org, Christian Brauner <brauner@kernel.org>, 
	Alexander Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 18, 2025 at 1:43=E2=80=AFPM Carlos Llamas <cmllamas@google.com>=
 wrote:
>
> I don't understand the "unused flags" argument. Did you interpret the
> current naming as "get the flags not used by a certain fd"?

Right

> If it helps, this kind of patches are usually tagged as "treewide:" and
> are often implemented using coccinelle scripts.

Oh neat, I had no idea about conccinelle: thanks for cluing me in

> Also, for this patch in particular I would:
> Cc: Al Viro <viro@zeniv.linux.org.uk>
> Cc: Christian Brauner <brauner@kernel.org>
>
> > diff --git a/drivers/android/binder.c b/drivers/android/binder.c
> > index 76052006bd87..e162d92e8c1d 100644
> > --- a/drivers/android/binder.c
> > +++ b/drivers/android/binder.c
> > @@ -4618,7 +4618,7 @@ static int binder_apply_fd_fixups(struct binder_p=
roc *proc,
> >       int ret =3D 0;
> >
> >       list_for_each_entry(fixup, &t->fd_fixups, fixup_entry) {
> > -             int fd =3D get_unused_fd_flags(O_CLOEXEC);
> > +             int fd =3D get_unused_fd(O_CLOEXEC);
> >
> >               if (fd < 0) {
> >                       binder_debug(BINDER_DEBUG_TRANSACTION,
>
> This is the only reason I found this patch (binder), and fwiw the
> renaming looks OK to me.
>
> Cheers,
> Carlos Llamas
