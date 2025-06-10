Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 550F021B191
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 08:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749544470; cv=none; b=VPx67Ogrg/DSxYoAFV9Eb+7ZMP4AOSqkajVLgIaYQcuakK3ld6ao3JEzS5soBA1wDucLJsBtJ+tVNjHq857QCcbMcjZIbj7ND3qj4Hx/tuN9tbpVM82N6uoaSrj82iCeIX8IP70cHguCvPHUJDkYFhYV9cf6KIIqmMIkEUVReCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749544470; c=relaxed/simple;
	bh=ELvV6gFOrQIcF0RS07T+VrEtALbsCpR6LtE6ysH5Zp8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nFlu7LHJtoyQvqPpu8lRYrv7WabciNR9srZGmkxb3LeHVcWdan7liQ69AnEDmOTHzP3lN/tZOgTfmZld8bcgSJzDcenzr4RcVWah63Uf6r4Yn6NqMMSGPAH1HourWUmC8V3ra6sCJ6WeA5hGejGF/eN6gojz8sgqCJr3jXsXEvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=MpOher5H; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="MpOher5H"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-32addf54a00so34928451fa.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 01:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749544466; x=1750149266; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rnI1DgLPkvl+HoplXFXE1JhP6UTW1WaSqL4iwK2lNM4=;
        b=MpOher5HAwZT00p0pOGJJMyVwWc1RCFH4NRDVYrcq7zUpwbobV2VWaPEQhyzZqwUmr
         U6IjuYElpeypvuugvgEMxfLpJ2qiS/R7ntkVgbMBxQOAh2i8uPRXuO5tJKyyBf8AhcAm
         CsqrLBcd2jlzhxEvPXE3tBIm79mEReGYfhPq5SFwRL6YReDAE0EYgg2ODT9waLtrsFLo
         b1qE3SOahtJ64LDjdJqL1o5g7ZmgoM84aCASvTiVvmrj/QSV2o4ZlS4sBiJzeA3T2ftW
         5xC7dcOZPyg71y/0IE7bezueZrHfOoRgNofzgScR/HCXBaAvfzGy8r+mqZk7S27UgL/w
         99Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749544466; x=1750149266;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rnI1DgLPkvl+HoplXFXE1JhP6UTW1WaSqL4iwK2lNM4=;
        b=SySiyDYTP3LIL2IYzf1wn0HmYq+pOoBRgkQWo7fQEScbArk1oj3qXR3x70U5LEm1DN
         dpUa7bmk52fyh5huusKVdvSHxtyR2zXD9Tpee0vlpmGTOeP41hlAdYvfZc36Mr4PK4Z0
         dlZxxjxlIfawq+R6slblfzFTQQm4X5T9LXWV00vQM2v0FsOZvNEiJRhPp6IwZ/EVbsvf
         zHuucACDe7HTrquXZMWKatR3PTIvFI/O2P6llanhKtkmkoL+79sUEYI82aokgVRZiFFW
         35ujosveMHKAOkJCCWuramizzWES+eN4zkRZUT+8f64fAYypRSOzB5sqVu5AmksaVJra
         M/qw==
X-Gm-Message-State: AOJu0YwHCMUQ+j9ntiAGN0n9kHKT+7LWqMWYWQYYPzN5n+zhxt+iMNqP
	pha5ObBjOVVkOGwPLO8e/aAKbL918s9wjq4oNwjHlkhK8hYGC8rSp8rED1jVPLwAOZvJpBRSJ+L
	cG/KpXpnrixrgjr4MO56XStqfYNbRS1Tetk9npwtQ6Q==
X-Gm-Gg: ASbGncsDIjXXutCYURDip0r0sroshgIjy9uE2GNIDnAEA9xc9rlO+FFafuLZeirzEDm
	lfV91kBt48PxX/xdva1dECeP3cqXNXXYsM0etb1KPCUq4ZtC0KSENc3/lnfnV1r9wopNbpaZFWM
	6g5Qbm3O45hMjd23muVLVjgZ23xRSw+N7aTbcltN8L12+TSP+iAOVTBSihSvLjMykNUIGW0FtX5
	ZT/
X-Google-Smtp-Source: AGHT+IGr9lWmFu1UQyUJGI/4Xo4wowgXACRdyNHtL5UnU6rXIUKc6xZwnJe2wtyMu2A1FZQOzpdRtDBMYc+8yGgtfXU=
X-Received: by 2002:a2e:a9a7:0:b0:32a:7750:a0e1 with SMTP id
 38308e7fff4ca-32adfc0ee43mr45834241fa.26.1749544466311; Tue, 10 Jun 2025
 01:34:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250609103535.780069-1-marco.crivellari@suse.com> <aEcvBadg_rT2_roQ@slm.duckdns.org>
In-Reply-To: <aEcvBadg_rT2_roQ@slm.duckdns.org>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Tue, 10 Jun 2025 10:34:15 +0200
X-Gm-Features: AX0GCFvP5ttnL06alMQqaDCLEYNQYALKFKO-ol6iDkY7yG85bcqTtlov5MhRegs
Message-ID: <CAAofZF6AfmjYcNQSBFHsteN_10=z0RSt20DpOM8i_NLQBO5qLQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] Workqueue: rename system workqueue and add WQ_PERCPU
To: Tejun Heo <tj@kernel.org>
Cc: linux-kernel@vger.kernel.org, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Frederic Weisbecker <frederic@kernel.org>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Michal Hocko <mhocko@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Tejun,

Thanks!

Let's see if I understood what you mean.

>- Separate out patches to add the new flag and wq. Don't add the warnings
>  yet. I'll commit these patches to a separate wq branch.

Basically these means have 2 more patches, one for WQ_PERCPU (only the
new flag, like in the v1 let's say) and another patch that adds the wq(s).

So, all the logic changes (also in __alloc_workqueue), pr_warn_once() will
stay in the other patch (that you will apply later); this is not only 1 pat=
ch,
following your next point.

If I understood correctly, it makes sense to me.

>- Split out patches by subsystems. I know this is tedious but think it'd
> still be worth doing. It doesn't have to be completely granular. e.g. We
> know that network changes go through a single tree, so all network change=
s
>  can be in a single patch. Each patch can explain the workqueue changes a=
nd
>  that the patch can be either routed through the subysstem which would
>  require pulling from the above wq branch, or, as the default option, we'=
d
>  be happy to route the patch through the workqueue tree. I can create a
>  separate branch to collect the conversion patches that can go through wq
>  tree.

This impacts patch 3, so instead of 1 big patch, you are thinking of N patc=
hes,
in order to add WQ_PERCPU to the callers of subsystems first.

So, something like:
- net/
- mm/
- fs/

Do you have something different in mind?

>- After the next rc1 drops, I can apply the patches to add warnings to the
>  -fixes branch and then send them to Linus.

Sounds good.

Thank you again.

On Mon, Jun 9, 2025 at 8:59=E2=80=AFPM Tejun Heo <tj@kernel.org> wrote:
>
> Hello, Marco.
>
> On Mon, Jun 09, 2025 at 12:35:31PM +0200, Marco Crivellari wrote:
> > =3D=3D=3D Introduced Changes by this patchset =3D=3D=3D
> >
> > 1)  [P 1-2] system workqueue rename:
> >
> >               system_wq is a per-CPU workqueue, but his name is not cle=
ar.
> >               system_unbound_wq is to be used when locality is not requ=
ired.
> >
> >               Because of that, system_wq has been renamed in system_per=
cpu_wq,
> >               while system_unbound_wq is now system_dfl_wq.
> >
> >               The old wq are still around, but if used in queue_work(),=
 a pr_warn_once()
> >               will be printed and the wq used is automatically assigned=
 to the new
> >               default (system_dfl_wq or system_percpu_wq).
> >
> > 2)  [P 3] Introduction of WQ_PERCPU.
> >
> >               This patch adds the new WQ_PERCPU flag to explicitly requ=
ire to be per-cpu.
> >
> >               Every alloc_workqueue() caller should use one among WQ_PE=
RCPU or
> >               WQ_UNBOUND. This is actually enforced warning if both or =
none of them
> >               are present at the same time.
> >
> >               WQ_UNBOUND will be removed in a next release cycle.
> >
> >               Because of that, this patch also adds to every alloc_work=
queue() caller
> >               that require it, the new WQ_PERCPU flag.
> >
> > 3)  [P 4] WQ_PERCPU documented in workqueue.rst
> >
> >               Added a short section about WQ_PERCPU and a Note under WQ=
_UNBOUND
> >               mentioning that it will be removed in the future.
>
> Thanks for working on this and the changes generally make sense to me.
> However, I think we should try a bit harder to reduce friction with the
> affected subsystems. It's a bit unfortunate that we're already at rc1. It
> would have been better if the new flags and wq were introduced before rc1=
.
> Oh well, we can manage. How about something like this?
>
> - Separate out patches to add the new flag and wq. Don't add the warnings
>   yet. I'll commit these patches to a separate wq branch.
>
> - Split out patches by subsystems. I know this is tedious but think it'd
>   still be worth doing. It doesn't have to be completely granular. e.g. W=
e
>   know that network changes go through a single tree, so all network chan=
ges
>   can be in a single patch. Each patch can explain the workqueue changes =
and
>   that the patch can be either routed through the subysstem which would
>   require pulling from the above wq branch, or, as the default option, we=
'd
>   be happy to route the patch through the workqueue tree. I can create a
>   separate branch to collect the conversion patches that can go through w=
q
>   tree.
>
> - After the next rc1 drops, I can apply the patches to add warnings to th=
e
>   -fixes branch and then send them to Linus.
>
> This is a bit more work but would likely produce less friction without
> delaying the timeline significantly.
>
> Thanks.
>
> --
> tejun



--

Marco Crivellari

L3 Support Engineer, Technology & Product




marco.crivellari@suse.com
