Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5A1C54652
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 00:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748563299; cv=none; b=o96QB4lWmSqv931KgfiBWonUNaZ/j+9Pkt+PQErvrnJ42iM+s5FQUvRDQ9QaYEDXI7JLz5QB3S0sNli14g16aQiswdWkYl9uKtYBc2hRl59RvuM0A1P9KXoywS88M+e+pMbibc9heYYEYMHaCsWRV22fPL9hhw2CbmALAkMCEVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748563299; c=relaxed/simple;
	bh=4KfLO9jtt3CCT0Cofo6vrnLfO0G69jIIrdzEkUUZOLM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r5pZsK+dnAoh7JJdk8Cwq8OFfHt0PQdN7KttQJkWv/UBnTe6JeuQMiPvXAJToMOqjJd+kZVtq4mk5NOTk7QbRpFUp5SIgA0+tt0EDtm/UzOBCxu2Mcjdk+svxheYn8ZKyJ5grAWvgrDXA96fyDGdNxp/zCALVMg/2zwmXjgappA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=dyi4uLR+; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="dyi4uLR+"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-70e4b1acf41so13611767b3.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 17:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1748563296; x=1749168096; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5MIX3b1M4438lffSOGfLxCT9xEv4uwXG8CbDYBfSaRA=;
        b=dyi4uLR+foo0voEBBcdPlsiMcllA1nw76lqSd1O3yvxQLIGcfdJXRLasHsmhzkHeBB
         y/Mvo4bPlIm4amTRC35QA5ucjEZewN6YYn4/Wq4oFyeUyE1ipBmhIDqB9F9o+UiI7fFz
         e0X094E8l1AVyk7fw/DUmPAt/8P7JwcIOSiya9Bn5cal3kNh3JcscvXQ7H6JKAHlPw5B
         E7bNdd2udG8EBF6LF8qZWmNq7OPHPpuQLkaYnG3ebsmh0GhXn8aGWxAWH6lFAy0u2OJx
         shzPZIIbOSaLzAwyzgVBbp3wL+h2EIxoHAW7YruQf0sG3hbiRYkEfxxlk7RzS4E4AMpF
         ZXiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748563296; x=1749168096;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5MIX3b1M4438lffSOGfLxCT9xEv4uwXG8CbDYBfSaRA=;
        b=TeUTy5UTj4kh+anv3Vqn3xSwHIZgu3SCkWihimDZm73f5iKcfCWuU2UDjauuifHa+u
         a6x9t5rHGvw/phEOBBKNX5Ox6XxYJBzmRTcNNy33ikMsYMgb/BklLHwa8x7582Z35RCg
         96zBAHccSFFJcf+y17YPaqkLzPUYsJvTtbyB0T5Vfxu/VDnPXs2MrxO/kqGzyZILWIJt
         Bui3iVyrgBq5XwEq7dE7ix4Ne9CZ0alDRRbgTWOLv3MrVj8gtPiOqWyXRTkPCMEMsdmA
         NQ/QNI0rTGJbXYuVGNzaGB6R2yVKsvlouqsNMS+/3jx81a3uyHWKa6i1aS6PhbfmLrWN
         JfLg==
X-Forwarded-Encrypted: i=1; AJvYcCUhtt6QQlKKfO1NnLjMoQpz6nboMz8nvXeZOCJCeeMMBU/y3VhdNcCebw8SyE6mqk7Or+fdhaRSYfemvUI=@vger.kernel.org
X-Gm-Message-State: AOJu0YySlCdJHLxIyIG0ootDT/99MP+IWJKnGPVBFVQzrCaU99Ai7yFR
	xMGD+4XgAPAkwXkq93AkCaqnTURo0NUk4AA+bBUHRPPTiJCZ1oSQBKSbFwWECOCiTaq4VcFka8u
	FysD27RkeVFy7YItkWDLurekefMo+vSAngFLXQLPu
X-Gm-Gg: ASbGncuxJJyISpfusfQQ0oLT+xYS7EUQQjTOchFFIPr64M/gW7By+5s6K0xhrUaD+Fg
	S/RCNbqeVU47lXRvPVNAdRY8NwtO5ytFbYhO4PxI1NIaF99b10btrVZuAxYvib3ah/SkjPN+pQG
	smQRUOuCPPNU0Z/Wbwz5w++GqnpeGlbMF/
X-Google-Smtp-Source: AGHT+IGGGhQAa5S3GKFovKVI20G8rdzbsW9bl7o1JKIxwh7YiQMFUZDSf0TqE1szcGdV4kZYLl4fwoY5cOSMpz5XAHU=
X-Received: by 2002:a05:690c:fc1:b0:70c:d322:8587 with SMTP id
 00721157ae682-71057bf5e77mr3658087b3.6.1748563296467; Thu, 29 May 2025
 17:01:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <3c2679cb9df8a110e1e21b7f387b77ddfaacc289.1741210251.git.rgb@redhat.com>
 <fb8db86ae7208a08277ddc0fb949419b@paul-moore.com> <aDW5mI2dE7xOMMni@madcap2.tricolour.ca>
In-Reply-To: <aDW5mI2dE7xOMMni@madcap2.tricolour.ca>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 29 May 2025 20:01:24 -0400
X-Gm-Features: AX0GCFsDgJPI3AA4g9bJCmVnYDRvl1eKBbP8-Y291QRoyfFXSEbMHlAYVV3Af9k
Message-ID: <CAHC9VhTO-bdwzfSeDvJcV19PPfqXn_HM1PUfHe5Z6fPmmsypqA@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] audit: record fanotify event regardless of
 presence of rules
To: Richard Guy Briggs <rgb@redhat.com>
Cc: Linux-Audit Mailing List <linux-audit@lists.linux-audit.osci.io>, 
	LKML <linux-kernel@vger.kernel.org>, linux-fsdevel@vger.kernel.org, 
	Linux Kernel Audit Mailing List <audit@vger.kernel.org>, Eric Paris <eparis@parisplace.org>, 
	Steve Grubb <sgrubb@redhat.com>, Jan Kara <jack@suse.cz>, Amir Goldstein <amir73il@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 27, 2025 at 9:10=E2=80=AFAM Richard Guy Briggs <rgb@redhat.com>=
 wrote:
> On 2025-04-11 14:14, Paul Moore wrote:
> > On Mar  5, 2025 Richard Guy Briggs <rgb@redhat.com> wrote:
> > >
> > > When no audit rules are in place, fanotify event results are
> > > unconditionally dropped due to an explicit check for the existence of
> > > any audit rules.  Given this is a report from another security
> > > sub-system, allow it to be recorded regardless of the existence of an=
y
> > > audit rules.
> > >
> > > To test, install and run the fapolicyd daemon with default config.  T=
hen
> > > as an unprivileged user, create and run a very simple binary that sho=
uld
> > > be denied.  Then check for an event with
> > >     ausearch -m FANOTIFY -ts recent
> > >
> > > Link: https://issues.redhat.com/browse/RHEL-1367
> > > Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> > > Acked-by: Jan Kara <jack@suse.cz>
> > > ---
> > >  include/linux/audit.h | 8 +-------
> > >  kernel/auditsc.c      | 2 +-
> > >  2 files changed, 2 insertions(+), 8 deletions(-)
> > >
> > > diff --git a/include/linux/audit.h b/include/linux/audit.h
> > > index 0050ef288ab3..d0c6f23503a1 100644
> > > --- a/include/linux/audit.h
> > > +++ b/include/linux/audit.h
> > > @@ -418,7 +418,7 @@ extern void __audit_log_capset(const struct cred =
*new, const struct cred *old);
> > >  extern void __audit_mmap_fd(int fd, int flags);
> > >  extern void __audit_openat2_how(struct open_how *how);
> > >  extern void __audit_log_kern_module(char *name);
> > > -extern void __audit_fanotify(u32 response, struct fanotify_response_=
info_audit_rule *friar);
> > > +extern void audit_fanotify(u32 response, struct fanotify_response_in=
fo_audit_rule *friar);
> > >  extern void __audit_tk_injoffset(struct timespec64 offset);
> > >  extern void __audit_ntp_log(const struct audit_ntp_data *ad);
> > >  extern void __audit_log_nfcfg(const char *name, u8 af, unsigned int =
nentries,
> > > @@ -525,12 +525,6 @@ static inline void audit_log_kern_module(char *n=
ame)
> > >             __audit_log_kern_module(name);
> > >  }
> > >
> > > -static inline void audit_fanotify(u32 response, struct fanotify_resp=
onse_info_audit_rule *friar)
> > > -{
> > > -   if (!audit_dummy_context())
> > > -           __audit_fanotify(response, friar);
> > > -}
> >
> > It seems like we should at least have an audit_enabled() check, yes?
> > We've had people complain about audit events being generated when audit
> > is disabled, any while we don't currently have such a check in place
> > here, I believe the dummy context check is doing that for us.
> >
> >   static inline void audit_fanotify(...)
> >   {
> >     if (!audit_enabled)
> >       return;
> >     __audit_fanotify(...);
> >   }
>
> That would be consistent with other security events messages.  I was
> going through the selinux code to see what it does and I am missing it
> if selinux checks with audit_enabled().  Are selinux messages somehow
> exempt from audit_enabled()?

There are likely a number of callers in the kernel that don't have
audit_enabled() checks, some are probably bugs, others probably
intentional; I wouldn't worry too much about what one subsystem does
when deciding what to do for another.  In the case of fanotify, I
suspect the right thing to do is add an audit_enabled() check since it
is already doing an audit_dummy_context() check.  To be clear, there
may be some cases where we do an audit_dummy_context() check and doing
an audit_enabled() check would be wrong, but I don't believe that is
the case with fanotify.

--=20
paul-moore.com
