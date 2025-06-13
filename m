Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 744EF1E51FA
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 15:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749828540; cv=none; b=h+X74E9GFwxcM+eeyStPwtziCgZmLlVJ5uUX3xOkTh10rJpao/E1O4s5DuIwfQMhhh9DhLe4ln+iJuBxyQPYJ29DgRl6YS68uuwxWDIcu63Ej0vz5Rx3bAyRbjEfxbP9O5V44m01/uchODNkLUaI4Qu5bM8d5T47+XmxfznTfWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749828540; c=relaxed/simple;
	bh=X079tyiC6j0ZdiMIK4gOPei70Tw5RKe51eAS+6Dan9c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A72rpGEKo46aEqWNv+G4qxadinWAsXMIN63wTwLuvgSchKcuDMVwWOUjbe+nsDtd8WLT25WFjC2FwRwn/p/Qo1sqMvgUxmvEMY+725bLUFwTUyp7cCTzwkzxTZihbXM24U0vZmB/MIl2YACRAbCAwiNmYKvKRSILRrlAH23J6H4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=fTZxQpsn; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="fTZxQpsn"
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e81f311a86fso2123697276.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 08:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1749828537; x=1750433337; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RYiQRuwhOfYD8gVzgR1jp9U1VSoD6Bt4ofrpbI2Hh+w=;
        b=fTZxQpsnLWNJmIeU1bimWyViEDzYZoAdEBvxRAluDWnE2QWsWnalw2aD2WDTCRYiwk
         isfOOoNbFSJaI6q9ie4GPFZi0cq3Oz15Df5pXLwiHTn1q6+MWl4uR/JXyolQm+4LZN+g
         1eshsr8Nl95wIJRUoTX49GuE2U9UPXupON7jZYtlNzCDJHWyUvH5W/2KkW0ug4tzlY7z
         Dm+/2L21Uop3Wljbpx4oFPzZsWu8Woh1+G4Wua2YML1fWHaAtFRiS1kl27Nk4oUC3tCH
         IuHMFO0tENqrcVpJwacrrHDlwwk5gEpaRM5arSqpLIHj9OQIwQTMACAHG8zXfvzYU2xB
         Qbsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749828537; x=1750433337;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RYiQRuwhOfYD8gVzgR1jp9U1VSoD6Bt4ofrpbI2Hh+w=;
        b=VtGRo42Jo4q1DdAxV9OOhLCKa1tEAEszpuKwA2pGMED4y9e5JdC3hynCdzXkHABV8d
         Y9GJuRkEKHzGvGHOglT9Hm65mr/p/h5MAO4OdsKbcuDTqwUObuWmyQBgN6O3VpNVuFpU
         0Dl/mPWvgFuN5BotKo9E6NxRy8DltKzhAAQ3D9YKAEnmwYYSvSZiXPkVRaX7iMSokFqH
         dTyxV7y655BdJzJv+0/pEeDGQZC0tLl2PQRy9K6zQbBdcGFvuYYU7oY6nNLolIMnM8+O
         9GBpJhwRJHDP8C26VZryd5qcgqJRqyD4R2eoDhTFQcqvWQKJs/yUT88VkfUrOVPjFRAE
         esbQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/Te4HnVQUYy7ncQrjkLlpovRjgYkbAd34qyjHGJ66EzBDyqSb5zlEliBpagXZf3xBrW901hB0lrg1gUA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+rosG+9hLUzFuig4J/AUAh/xLACAi592y1FgDN5zkOMMQRTnA
	uMjHuOBhSihCYvA/YS0X5bVtiDADSddTxwdUi9d3ZljIvdFsa1x+GhBEI8VzV1oVnURJNkhg3oC
	T54p9POYACuv1MircM/qz28UH5ZZEpPdqVKHfM3pQ
X-Gm-Gg: ASbGncuMWehf+weQ3RKnQk6NiurwS7ERxTpn8I2t0M6945lF0tzSeH+NEeuTZiFLz9j
	uqMLoFN+YhANvXSG6U034TKY1T9ECdATpXDWcMsDDuu9mel6XEsOe7vVyQ1ycEiIG5pGcU7Tbyz
	j1YtXlRgX+VmLIefyunfyGe5Lz46Rk3E+a1Y1Kg17utco=
X-Google-Smtp-Source: AGHT+IHAM7TIeCsgU1Wds2vBZ0OPyAgzBs8nTML+ZqkrzmDnQLVACyv894zfs5/H9eigreQUvH2pJpyDzVXsqgs4HVw=
X-Received: by 2002:a05:6902:1501:b0:e81:69be:6388 with SMTP id
 3f1490d57ef6-e822ac9c0bfmr211439276.39.1749828537346; Fri, 13 Jun 2025
 08:28:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <202505151451.638C22B@keescook> <87ecwopofp.fsf@email.froward.int.ebiederm.org>
 <CAG48ez1VpuTR9_cvLrJEMmjOxTCYpYFswXVPmN6fE3NcSmPPVA@mail.gmail.com>
 <87wmagnnhq.fsf@email.froward.int.ebiederm.org> <202505201319.D57FDCB2A@keescook>
 <87frgznd74.fsf_-_@email.froward.int.ebiederm.org> <CAG48ez0N_1CEKyMHdjnvwsxUkCenmzsLe7dkUL=a6OmU4tPa6Q@mail.gmail.com>
 <87zff6gf17.fsf@email.froward.int.ebiederm.org> <CAG48ez1z97sCsx53W0O_dCCJL6tnf2pWuv=qaeszcYBfz_01sA@mail.gmail.com>
 <CAHC9VhRPUXwqLvo4rbxL0++5zqHXfD8_tr-sirTJXdF_Aba_UQ@mail.gmail.com>
 <20250612212626.GA166079@mail.hallyn.com> <40CCFDE0-A0DC-4F4E-8621-206F53D9225B@kernel.org>
In-Reply-To: <40CCFDE0-A0DC-4F4E-8621-206F53D9225B@kernel.org>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 13 Jun 2025 11:28:46 -0400
X-Gm-Features: AX0GCFvlLiGFQLQW5tofuZrL-olApvaLyUTQIv_CthVQiMzqD9L3OJiRvhqwEJc
Message-ID: <CAHC9VhSMmNafbxLqP3j=nOra7OjHiECg6gUsWUuETWcZ01GrmA@mail.gmail.com>
Subject: Re: [PATCH v2] exec: Correct the permission check for unsafe exec
To: Kees Cook <kees@kernel.org>
Cc: "Serge E. Hallyn" <serge@hallyn.com>, Jann Horn <jannh@google.com>, 
	"Eric W. Biederman" <ebiederm@xmission.com>, Richard Guy Briggs <rgb@redhat.com>, 
	Max Kellermann <max.kellermann@ionos.com>, jmorris@namei.org, 
	Andy Lutomirski <luto@kernel.org>, morgan@kernel.org, 
	Christian Brauner <christian@brauner.io>, linux-security-module@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 12, 2025 at 9:48=E2=80=AFPM Kees Cook <kees@kernel.org> wrote:
> On June 12, 2025 2:26:26 PM PDT, "Serge E. Hallyn" <serge@hallyn.com> wro=
te:
> >On Tue, Jun 10, 2025 at 08:18:56PM -0400, Paul Moore wrote:
> >> On Wed, May 21, 2025 at 11:36=E2=80=AFAM Jann Horn <jannh@google.com> =
wrote:
> >> > On Wed, May 21, 2025 at 5:27=E2=80=AFPM Eric W. Biederman <ebiederm@=
xmission.com> wrote:
> >> > > Jann Horn <jannh@google.com> writes:
> >> > >
> >> > > > On Wed, May 21, 2025 at 12:13=E2=80=AFAM Eric W. Biederman
> >> > > > <ebiederm@xmission.com> wrote:
> >> > >
> >> > > > Looks good to me overall, thanks for figuring out the history of=
 this
> >> > > > not-particularly-easy-to-understand code and figuring out the ri=
ght
> >> > > > fix.
> >> > > >
> >> > > > Reviewed-by: Jann Horn <jannh@google.com>
> >> > > >
> >> > > >> @@ -917,7 +911,7 @@ int cap_bprm_creds_from_file(struct linux_b=
inprm *bprm, const struct file *file)
> >> > > >>         /* Process setpcap binaries and capabilities for uid 0 =
*/
> >> > > >>         const struct cred *old =3D current_cred();
> >> > > >>         struct cred *new =3D bprm->cred;
> >> > > >> -       bool effective =3D false, has_fcap =3D false, is_setid;
> >> > > >> +       bool effective =3D false, has_fcap =3D false, id_change=
d;
> >> > > >>         int ret;
> >> > > >>         kuid_t root_uid;
> >> > > >>
> >> > > >> @@ -941,9 +935,9 @@ int cap_bprm_creds_from_file(struct linux_b=
inprm *bprm, const struct file *file)
> >> > > >>          *
> >> > > >>          * In addition, if NO_NEW_PRIVS, then ensure we get no =
new privs.
> >> > > >>          */
> >> > > >> -       is_setid =3D __is_setuid(new, old) || __is_setgid(new, =
old);
> >> > > >> +       id_changed =3D !uid_eq(new->euid, old->euid) || !in_gro=
up_p(new->egid);
> >> > > >
> >> > > > Hm, so when we change from one EGID to another EGID which was al=
ready
> >> > > > in our groups list, we don't treat it as a privileged exec? Whic=
h is
> >> > > > okay because, while an unprivileged user would not just be allow=
ed to
> >> > > > change their EGID to a GID from their groups list themselves thr=
ough
> >> > > > __sys_setregid(), they would be allowed to create a new setgid b=
inary
> >> > > > owned by a group from their groups list and then execute that?
> >> > > >
> >> > > > That's fine with me, though it seems a little weird to me. setgi=
d exec
> >> > > > is changing our creds and yet we're not treating it as a "real" =
setgid
> >> > > > execution because the execution is only granting privileges that
> >> > > > userspace could have gotten anyway.
> >> > >
> >> > > More than could have gotten.  From permission checking point of vi=
ew
> >> > > permission that the application already had.  In general group bas=
ed
> >> > > permission checks just check in_group_p, which looks at cred->fsgi=
d and
> >> > > the group.
> >> > >
> >> > > The logic is since the effective permissions of the running execut=
able
> >> > > have not changed, there is nothing to special case.
> >> > >
> >> > > Arguably a setgid exec can drop what was egid, and if people have
> >> > > configured their permissions to deny people access based upon a gr=
oup
> >> > > they are in that could change the result of the permission checks.=
  If
> >> > > changing egid winds up dropping a group from the list of the proce=
ss's
> >> > > groups, the process could also have dropped that group with setres=
gid.
> >> > > So I don't think we need to be concerned about the combination of
> >> > > dropping egid and brpm->unsafe.
> >> > >
> >> > > If anyone sees a hole in that logic I am happy to change the check
> >> > > to !gid_eq(new->egid, old->egid), but I just can't see a way chang=
ing
> >> > > egid/fsgid to a group the process already has is a problem.
> >> >
> >> > I'm fine with leaving your patch as-is.
> >>
> >> Aside from a tested-by verification from Max, it looks like everyone
> >> is satisfied with the v2 patch, yes?
> >>
> >> Serge, I see you've reviewed this patch, can I assume that now you
> >> have a capabilities tree up and running you'll take this patch?
> >
> >I can take another look and consider taking it on Monday, but until
> >then I'm effectively afk.
>
> I'd rather this go via the execve/binfmt tree. I was waiting for -rc2 bef=
ore putting it into -next. I can do Sunday night after it's out. :)

I'm not going to argue either way on this, that's between you and
Serge, but as the entire patch is located within commoncap.c and that
is part of the capabilities code which Serge maintains, can you
explain why this should go via the execve/binfmt tree and not the
capabilities tree?

--=20
paul-moore.com
