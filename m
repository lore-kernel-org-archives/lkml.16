Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E0864C96
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 06:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747117526; cv=none; b=LtjAPvKC/CdfYH/wfbCXYJk9AQtdwX7PU1hxZNxe1AsOC4kI4YMajPomcLYQ1nWp6IaJMak+zeG5CJO8066yMmOGSm8JZuBcIUtQJWOg5mC7jGt2jQyplGKBwbv4oMfvB7dT53uPw42eOcuJwpGg0VUlSSPhxpjdKOrj0yCy0Tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747117526; c=relaxed/simple;
	bh=GqtRlJfZnmbJm0yIQvEOs1d77xZ9lXjI7VAkBS3mmwM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e0YaSs68MdMwxWuRCNCGEMcdwUkR5YmBIp9HejA/iK/cZ2+8f1/fu7EDYkkiDcsxig7lgiDXu2JNczWBf+VRRxzWFknmCogT07VWrs9pmCBtjxAHioMFh3lTRzZhFi4IwHrwdzXVimhZHXGfGEiSBv8oBk8OHLpDItJi4jFgQCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com; spf=pass smtp.mailfrom=ionos.com; dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b=czWsPNar; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b="czWsPNar"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ad257009e81so269586766b.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 23:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1747117522; x=1747722322; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hMy27SUOUHjFgx4eCz9B65ftALrCP71VAoYeAnNsHWs=;
        b=czWsPNarcGsD4VdOmeJJ4aZXKnQWPK0vpvqtBcOQxVg3S0aP1RWeux7JF4U7YPtTiC
         a2QKItaAmh4lMako3WtfIWcG+uU8vhEABJNvKHk/GGNtnBvAgY4yQI1A7TfwgrI2WAFM
         Cv5UyEIRndMRAWw9u9R3sG224EUXHGI33mVHtRiK4itXfawMuuCHIQEXnFGdujwPaCGY
         2jMWKLCL7GmVoOTDwfon0ciaNbXdlD2GPBR/C3j9Q0QreeY7UuCY3P5Dl9qnRvvNxbh3
         uzIEnhze/wpFecOxLSNulIQpnfMjS9v59dFFhMB95bAPTs67HX26XJ5PNfZmU/3kH/zg
         MvaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747117522; x=1747722322;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hMy27SUOUHjFgx4eCz9B65ftALrCP71VAoYeAnNsHWs=;
        b=T5oxTb2qNrx0gz1mVqj53g3N0iuoO1TBoIYuIx8zmA9D5Nmfzg8r/Rcw0YEcZgO4vF
         ttF9XyrTmzRnWEjmtjy8tPcWg99SMWtB/ZzfoiHu5bKv8lys3Z/BPxzklm6rmlQKUJRx
         SdQKULHFcleOtk5t4c/HXr5Ex7iUYOEFNue7ZZkIEM6ZWE2j8/u4JQ4Y69LrrRhwiFeZ
         RQNr+XkrWPXsqzdggVmyhlha5xcrBvO9DS8Bwg2ZGuKnVyEudL7wUBMsydEq0ZxxH37o
         wOKGmNCckOkax7J1rDlEty2nmbrap/Bs2mduW0vk0Q7jKAqZj/VUKfGPOTpTPXHBJael
         wGNA==
X-Forwarded-Encrypted: i=1; AJvYcCWBFXMz5aEfqyefaOPUN5QK/laqqK5zFLhPTu8SpvRpeV51mIyCv3Pln/gP4sfSGzXkqivpxSmKxJRf9D8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZAhMBj5BJhowHGg9YzI2kaDCCRGvP2Wg7thgK+cx2lji13zIu
	VvL1LISt7lbkmL36IndMHGWlwNjGs3/ILHWo+378iVBYdTZRUh6/2wCEfgQzhyOxvBeTMji2mWe
	nFhvZf/afOY93skYDrbwLXeXws+IFZ81T9yZINldhHE3brTfXg0c=
X-Gm-Gg: ASbGncuVzaWRzVdjO/+U+CxjxTdAnWIpfkg56jrUwwE3rQwPpy58xVthHXEPlzxPGQe
	FtxnPbvgMfanFeSPgEAyeb0KmzohxS7/TUzzX16vqFKU5gJS7bl7VKB6E5+5i3R/+W+Wcrf3MvA
	63wbn20EC8q2dVXgDSqjkdIECNohcBUDUe7XT+7Qn5VOyWrmWRj1s/086YKMLIwA==
X-Google-Smtp-Source: AGHT+IG647+SWHiRPBpmcyTCAQgNrpKSrAL7jbN5Sny0ekfWyxtAPvKoYFEIg2r1yRsHtl9r5N9ZLfsz6l0iz/p77d4=
X-Received: by 2002:a17:906:7c55:b0:ad2:28be:9a0d with SMTP id
 a640c23a62f3a-ad228be9beemr971370366b.52.1747117522448; Mon, 12 May 2025
 23:25:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAKPOu+_p6D-s9k_rokup+7JC-GDJMCxweBrR2JthLGtSufrUCQ@mail.gmail.com>
 <20250509180150.GA707254@mail.hallyn.com> <CAKPOu+_MEX-KC-Mp+Pn0=mKRoNQcrAs0nEUmyU84EZC=2CMkXA@mail.gmail.com>
 <20250509192642.GA707808@mail.hallyn.com> <CAKPOu+-iV8daKn_TVR5QStoBNWD-MDpG6Bmj4zoe4QQL_PLJtw@mail.gmail.com>
 <20250510130938.GA712334@mail.hallyn.com> <CAKPOu+_U6AAf5MTSi8mmUTbLdGEw0w=5mqnaCZ3YjvxgCN6WeA@mail.gmail.com>
 <20250510160809.GA713084@mail.hallyn.com> <CAKPOu+9ooP6yH6qHgAEaX_3W+kGxYjJX9UuTeGS_BPc3BhTDyA@mail.gmail.com>
 <20250510192919.GA714187@mail.hallyn.com> <202505121725.34FC22D2D@keescook>
In-Reply-To: <202505121725.34FC22D2D@keescook>
From: Max Kellermann <max.kellermann@ionos.com>
Date: Tue, 13 May 2025 08:25:10 +0200
X-Gm-Features: AX0GCFt2YKft5rKYk9VB3kfR5YVIotimG0mSBdNHgk6STCjx6j0JxaKEBSjbkJE
Message-ID: <CAKPOu+_eL3j9+yaDRMnoCfoyapNSp04rgGaRzpKn9ycbkif_9g@mail.gmail.com>
Subject: Re: [PATCH] security/commoncap: don't assume "setid" if all ids are identical
To: Kees Cook <kees@kernel.org>
Cc: "Serge E. Hallyn" <serge@hallyn.com>, Andy Lutomirski <luto@kernel.org>, paul@paul-moore.com, 
	jmorris@namei.org, morgan@kernel.org, Eric Biederman <ebiederm@xmission.com>, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 13, 2025 at 3:24=E2=80=AFAM Kees Cook <kees@kernel.org> wrote:
>
> On Sat, May 10, 2025 at 02:29:19PM -0500, Serge E. Hallyn wrote:
> > Kees, do you have any input?
>
> I'd like to move this back to the list. I don't think there is anything
> secret here?

I don't think there ever was anything secret, and I don't understand
why it was ever taken off-list. My initial post was public and it
already contained everything.
(My reply will go back to LKML and a full quote of your email to give
context to those who were excluded from this private thread. I assume
you're fine with that?)

>
> Regardless, I apologize for being so late to the discussion. Last week
> was weird. Anyway, random thoughts from the thread and refreshing myself
> on the various code flows:
>
> - musl doesn't clear LD_PRELOAD under AT_SECURE: Ew. That's a bug, IMO.

Why would it be a bug? If a program doesn't use or care for
LD_PRELOAD, why would it need to clear environment variables that may
or may be used by other arbitrary programs? Is every program
responsible for clearing sensitive environment variables for every
other program on the planet? (I'm stretching this for the sake of the
argument, but I hope you get my basic idea.)

> - We care about non-ELF, yes, but currently all realistic paths lead back
>   to ELF (e.g. creds are calculated from the interpreter and not
>   the script for binfmt_script).
>
> - "classic elevated privilege check" in userspace is just wrong. It's
>   been insufficient to check for euid!=3Duid for decades. Looking at
>   AT_SECURE is, afaict, sufficient, though.

We agree that AT_SECURE has been the canonical Linux-specific way for
this check for at least 20 years.

Yes, everybody should have an #ifdef __linux__ with this check instead
of geteuid()!=3Dgetuid(). But that's not the reality we're living in.
Did you know that not even util-linux and e2fsprogs get this right?
Look at:

- https://github.com/util-linux/util-linux/pull/3566
- https://github.com/tytso/e2fsprogs/pull/226

(I posted patches to a bunch of projects to get userspace fixed.
Others that don't get it right include: cups, libevent, Firefox, Qt,
Chromium, GnuPG, krb5, Postfix, Mono, iptables and many many others.)

The reality is that knowledge of the existence of AT_SECURE has
propagated only to a tiny bubble, and the majority of people have
never heard of it.

That alone would not justify fixing the NO_NEW_PRIVS behavior; but it
looks like the NO_NEW_PRIVS behavior was initially an undesired side
effect of a broken setuid check in the kernel. What the kernel does
here is not documented, and neither does it make sense. This is really
why I argue that the kernel should be fixed. If it doesn't make sense
AND breaks userspace, there is really only one way to fix it. But
that's just my opinion.

> - Linux has a kind of messy separation of logic:
>         - fs/exec.c is looking at DAC, but sets up checks for ptrace,
>           nnp, shared fs
>         - security/commoncap.c is evaluating DAC, caps, and ptrace.
>
> - in the kernel, having euid !=3D uid is _defined_ as being setuid.
>   Whether or not this is "more privileged" isn't part of the definition.
>
> - NNP applies only in two place:
>         - stopping gain of euid/egid from setuid/setgid of a file (same
>           as nosuid mount option) in bprm_fill_uid().
>         - unconditionally removing euid when lacking CAP_SETUID,
>           in cap_bprm_creds_from_file() (same as shared fs, ptracing).
>           (The explicit check for NNP is not redundant here: it's forcing
>           NNP even with CAP_SETUID, where as the other LSM_UNSAFE flags
>           allow CAP_SETUID to bypass them.)
>
> I've read through the thread and I'm convinced the original patch should
> not be applied (it changes the definition of setuid and setgid). Having
> the _purpose_ of the patch explain in the commit log next time would be
> good, but that came out in the thread later: there is a removal of euid
> under the described construction of apache/php/etc.
>
> In CAKPOu+8+1uVrDJHwmHJd2d46-N6AwjR4_bbtoSJS+sx6J=3Drkjg@mail.gmail.com:
> > Without my patch:
> >
> >  $ /reexec
> >  ruid=3D1000 euid=3D0
>
> I'm so confused. Is this "reexec" marked setuid=3D0?
>
> >  re-exec
> >  ruid=3D1000 euid=3D0
> >  $ /reexec 1
> >  ruid=3D1000 euid=3D0
> >  setting NO_NEW_PRIVS
> >  re-exec
> >  ruid=3D1000 euid=3D1000
>
> I assume so, since this is the behavior I'd expect.
>
> > Without NO_NEW_PRIVS, the re-exec keeps the real/effective, but also
> > gains setuid again, but the suid is no-op; the euid is already 0.
> > With NO_NEW_PRIVS, the re-exec drops the euid=3D0, and doesn't regain i=
t
> > - the setuid bit is ignored.
> >
> > With my patch:
> >
> >  $ /reexec
> >  ruid=3D1000 euid=3D0
> >  re-exec
> >  ruid=3D1000 euid=3D0
> >  $ /reexec 1
> >  ruid=3D1000 euid=3D0
> >  setting NO_NEW_PRIVS
> >  re-exec
> >  ruid=3D1000 euid=3D0
>
> I see how this looks inconsistent, but it is correct: any LSM_UNSAFE_*
> flag will trigger the stripping of euid. It could be argued it should
> strip _more_, IMO.

One can define NO_NEW_PRIVS this way (though I don't agree that it
should be), but that is not how it is documented currently. And the
name NO_NEW_PRIVS doesn't even remotely imply this behavior; you argue
for taking away privileges, but the name says no new privileges shall
be granted; keeping existing privileges is that.

For better NO_NEW_PRIVS documentation, please consider merging my
patch: https://lore.kernel.org/lkml/20250509184105.840928-1-max.kellermann@=
ionos.com/

In any case, I will keep my "ids identical" patch (with "secureexec"
bug fix) in our private kernel fork, because we need this behavior,
one way or another, but there is only this way. Thanks to everybody
who participated in the discussion - I really learned something here,
and that helped me understand the "secureexec" mistake in my patch.


Max
