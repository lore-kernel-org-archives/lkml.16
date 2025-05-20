Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20578256C95
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 22:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747780753; cv=none; b=Bb/ahtnHtWRsfWsS+FDENTd/SHGirMicYdF3d+Pe/KDJSywRJOConjXsZAboNUg4Uxm4BNIWYMClpZwHgogsV6O4ELaCSinolXMQi5in/+tg1uldnVImXnyUFTCG8P7wQB1+kWdzKnKhOxOFfXiw0fgSqAjhobacPVbHMCSX3TE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747780753; c=relaxed/simple;
	bh=wN4yGxSXINzDhFkHcC/bjuOi9mS4R56p+OcnBXeIYr0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qlUD5LwmpPVq0lxw/Rps726pEV0u8OEnwACJm2s/ouYYH5TBaEdhgaCAvebDUzJVFDieVpkDRHVVOGs4YojgekkmoS0m/MFDfFsAlogBF2ThtwE4nEfI1nPx1vSsCgrp9fEV2yptW19YMn1Ccrfd8Iu3a6QHVs8xCt4mcj6cabc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FTP9BtLP; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FTP9BtLP"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5fab85c582fso31049a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 15:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747780750; x=1748385550; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ILFMcZ2c1g7Az+p/u2m4/MT32WFW34DxCQbbI9/Sr3g=;
        b=FTP9BtLPrg+POyMdsTu64YRwNZ4QzsA8Edmg9G/Mq2e/6fyMgkUhHFbtsVxsWNnjLE
         K1+lVMw84m+9SHkGk/dbBHxHIPIRNa5TqLEXLal5I9FJqWgmz61cARfYGV1X8WlzAvs/
         Se7aDG9b6BE3rWlIVcWWJxIqAb+XVuONuZOL/Rgn9iCCoSoDSnooH3JbXfAijly+VyZW
         oUyjoyPV569tGjD3TTVgjl0OtD0FhO4tWEkdT1G4nF4IK8q/SGbIFJB49mm+SC50Mtlp
         jPlBFmhx0fQQbdqvRzlh0uay0Ypc7vAizXAK2Pg33R9uJCaYdH4W17hKhhw2wtJRMMA3
         GdPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747780750; x=1748385550;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ILFMcZ2c1g7Az+p/u2m4/MT32WFW34DxCQbbI9/Sr3g=;
        b=d2m4Uq2JCxWfajnzbV1/+54bwQEjuXF6jFB/Tsdd718mSOi/k2O03BXCfKOtz8FJI3
         mKGJqSrMkDE6DSl/HDUIkrWGVbFpmn1OHuh8QFGiQ9Hyt+GIYu1O14ZRFYS4tBiccO4V
         D65O3cTlr4Ioh8gBsjE3mKz7HxCqUz93xru5L6dmnhODOQU9mdNA9mdcshRLbuPEnfRe
         zhnya6d21ECcm66NBBvhqk1F+3iD9NOuKaCcpDbu+JVOXQEWnkPTOPOdDt0h5a8letru
         KBuGGxaa67epTznOM4yZ/4iuGsleNxup1+WPF0RQbRTPTTOwO47b1UNWikyasTM8tIy3
         1Mnw==
X-Forwarded-Encrypted: i=1; AJvYcCVgO8BZ9bqxZoukIVJV6EmDDVzAykaEnjWZB8u+eQJOXqzlkyQ9oc/e2IicElQ7+I8Tdz7I64VpJelV4Ws=@vger.kernel.org
X-Gm-Message-State: AOJu0YwCYjjWZM1Htdb0n9ITvwiULm9XMQ6FSiqUvMtshyQ0oK8/yUyM
	+qrPCP+0/+EcR9i5QVAq39oUzbtZjDEERtyIJuNkj5yUOJajuGqC3uUlHa7jfLYf1eSRbZIzd5g
	78mkgz53wA7YFPIQDrBOUHXufv3j8+PWgC7N9+4Y5
X-Gm-Gg: ASbGnctvXhXOHICK6kWbeQSbtmIFUKg+2z02rag91499Uqmk4XmCejWvAhJ10rRMHw0
	uogeMmEa89g79FT7M6LegjUFGxuBBCriTAoknazu1Bds9YDBPQ06HjAcBHP4kOBrxJvyUFmZEwz
	1vceeA07dc4fhMdAG5QCF2geJhP50v4JTaV5PMNlWHMfpRpZ/2iH7sa51/uDAMjhihZnONQ8JN
X-Google-Smtp-Source: AGHT+IHiM5utHlvS1KwtbMzIvdi8muzao2WgP49RJiwt9DhoDUMEmyA+7F/EX5MwVE5HhSrPQHgiE4+9FO6Ter/KAZQ=
X-Received: by 2002:aa7:cfda:0:b0:5fd:2041:88f7 with SMTP id
 4fb4d7f45d1cf-6019bf2f781mr321484a12.2.1747780750080; Tue, 20 May 2025
 15:39:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250306082615.174777-1-max.kellermann@ionos.com>
 <878qmxsuy8.fsf@email.froward.int.ebiederm.org> <202505151451.638C22B@keescook>
 <87ecwopofp.fsf@email.froward.int.ebiederm.org> <CAG48ez1VpuTR9_cvLrJEMmjOxTCYpYFswXVPmN6fE3NcSmPPVA@mail.gmail.com>
 <aCeyKHNDbPLWQP0i@lei>
In-Reply-To: <aCeyKHNDbPLWQP0i@lei>
From: Jann Horn <jannh@google.com>
Date: Wed, 21 May 2025 00:38:33 +0200
X-Gm-Features: AX0GCFuMBQxmG9Fb_r1Cs4pa1FI5Ei_amaGItaHzhD2McpCVCWBFjhX6X7HBMmE
Message-ID: <CAG48ez2q3iSXq_2C-DrJ774z-Cq2misdm53r5FBGrdwVbKDZSA@mail.gmail.com>
Subject: Re: [PATCH] exec: Correct the permission check for unsafe exec
To: sergeh@kernel.org
Cc: "Eric W. Biederman" <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>, 
	Max Kellermann <max.kellermann@ionos.com>, "Serge E. Hallyn" <serge@hallyn.com>, paul@paul-moore.com, 
	jmorris@namei.org, Andy Lutomirski <luto@kernel.org>, morgan@kernel.org, 
	Christian Brauner <christian@brauner.io>, linux-security-module@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 16, 2025 at 11:46=E2=80=AFPM <sergeh@kernel.org> wrote:
> On Fri, May 16, 2025 at 08:06:15PM +0200, Jann Horn wrote:
> > On Fri, May 16, 2025 at 5:26=E2=80=AFPM Eric W. Biederman <ebiederm@xmi=
ssion.com> wrote:
> > > Kees Cook <kees@kernel.org> writes:
> > >
> > > > On Thu, May 15, 2025 at 11:24:47AM -0500, Eric W. Biederman wrote:
> > > >> I have condensed the logic from Linux-2.4.0-test12 to just:
> > > >>      id_changed =3D !uid_eq(new->euid, old->euid) || !in_group_p(n=
ew->egid);
> > > >>
> > > >> This change is userspace visible, but I don't expect anyone to car=
e.
> > > >> [...]
> > > >> -static inline bool __is_setuid(struct cred *new, const struct cre=
d *old)
> > > >> -{ return !uid_eq(new->euid, old->uid); }
> > > >> -
> > > >> -static inline bool __is_setgid(struct cred *new, const struct cre=
d *old)
> > > >> -{ return !gid_eq(new->egid, old->gid); }
> > > >> -
> > > >> [...]
> > > >> -    is_setid =3D __is_setuid(new, old) || __is_setgid(new, old);
> > > >> +    id_changed =3D !uid_eq(new->euid, old->euid) || !in_group_p(n=
ew->egid);
> > > >
> > > > The core change here is testing for differing euid rather than
> > > > mismatched uid/euid. (And checking for egid in the set of all group=
s.)
> > >
> > > Yes.
> > >
> > > For what the code is trying to do I can't fathom what was trying to
> > > be accomplished by the "mismatched" uid/euid check.
> >
> > I remember that when I was looking at this code years ago, one case I
> > was interested in was what happens when a setuid process (running with
> > something like euid=3D1000,ruid=3D0) execve()'s a normal binary. Clearl=
y
> > the LSM_UNSAFE_* stuff is not so interesting there, because we're
> > already coming from a privileged context; but the behavior of
> > bprm->secureexec could be important.
> >
> > Like, I think currently a setuid binary like this is probably (?) not
> > exploitable:
> >
> > int main(void) {
> >   execl("/bin/echo", "echo", "hello world");
> > }
> >
> > but after your proposed change, I think it might (?) become
> > exploitable because "echo" would not have AT_SECURE set (I think?) and
> > would therefore load libraries based on environment variables?
> >
> > To be clear, I think this would be a stupid thing for userspace to do
> > - a setuid binary just should not be running other binaries with the
> > caller-provided environment while having elevated privileges. But if
> > userspace was doing something like that, this change might make it
> > more exploitable, and I imagine that the check for mismatched uid/euid
> > was intended to catch cases like this?
>
> If the original process became privileged by executing a setuid-root
> file (and uses glibc), then LD_PRELOAD will already have been cleared,
> right?  So it would either have to add the unsafe entries back to
> LD_PRELOAD again, or it has to have been root all along, not a
> setuid-root program.  I think at that point we have to say this is what
> it intended, and possibly with good reason.

Oh, I see what you mean, glibc's loader code zaps that environment
variable on secureexec for additional safety, I didn't know that.
