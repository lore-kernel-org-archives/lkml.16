Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63DB829DB60
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 22:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744409662; cv=none; b=JJxaTq+2IoLZSvLX8OzauPb6ioHXa6K8rv+bk+rYT+UOPqzRfHNtHZO3VDpWRT9saX+Sq1gqXPavToUoPTrTWLCujolgH/GAzH+QuQNLpTe1Bwt6ia7D8xCmhnKCM1hr7d1Xv7HnogJuR8yxDucNuu3Zxox4sKFxUiC44XHVws8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744409662; c=relaxed/simple;
	bh=inbFC05GiKvTcdNo0+ZTfj3hju7i5EVggQMpuyhjTeI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XI79XsUiOIqlrbl39cyr/HVnbmooK4i9K2dE2whaByhg2pLhmf4Xw84o2yZFSx7R2d86R0/Jxb/X5dCuw3LZEERc/2/mzPQla+ngSkfMdHIRNRcnVhdMrogF0oRQaNjpAuhJEE/kBtUjc88+/JkG/PBIhQPgxAVljHxpwUVAzUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=G/SPHAu0; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="G/SPHAu0"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-6f6ca9a3425so31228247b3.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 15:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1744409659; x=1745014459; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p+m7hz6r5/ApjZEveg5QQkULfTfewkyo7s8/B03DRoo=;
        b=G/SPHAu01IjVZJIJXPOs3rz9w9xPbN1VLyJSwQ2znutM4zpt5X4IceNGFlSojMVAe3
         6JjGxow84UH9sjx2v8jRIw4kBPGOt/FQy5PA3IHdKoN+TNePGtEkXdIDprZFSXw+L/1Z
         llTiKxpgAdzD2fs2h05Wj4m+NbQC5d7WGN0CcijviBuQdoe+NYY9jAN0vQ0WTWaqlmT+
         SUD8unXKHuTxLYoqjS3/LzA6wf+3m3OgOKW2qj+PHjbiRGFM3B2qQiXVKSLYtGYuZ/Dv
         0LDnK6i78dIm6cccsOgKBrdYRCsnCeqeVey6J5RdSyUfydyzwMlNqS64x69GddcGn8l6
         iFmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744409659; x=1745014459;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p+m7hz6r5/ApjZEveg5QQkULfTfewkyo7s8/B03DRoo=;
        b=M+SOs8t/M0mfiFr6bBohPBQd76nQMk4xPDLUCqOPgKT9B4wB3PTZiowtl8R6hejukR
         r5ggvNJGhSvSN5JYuTf+2SCJAG9ZepKcoLemjcKWvy+7SRyfL+4euo8FUzMUpv0VXrCH
         F+lIXL9W8ibTZxlSYBJxZ2lzPa4ayNhOJVhAWaXQXi/NUCZYIX4nhaP9jErXRG0kdC2Q
         4k8VhhbSI7OlVhj/4F4C9D9yvE7r0+/ZEC6xEU5xftiwb2Go7Hq0W7O64bLPmOoppFiv
         Qk+Db9G3/SaQWyA+gvAWfv0CRPDjWGvrqawQSzCHKm0lVFDxwun0aroiT7dLxIeiszw+
         FwPw==
X-Forwarded-Encrypted: i=1; AJvYcCXmOKBDsAGSpP6l05EJwjQ6IwDcT8K4y2ib7k7OG3RLDNfeGEGNvZkNe2POXKQQx3O0jYZH8vq7xxffH9c=@vger.kernel.org
X-Gm-Message-State: AOJu0YxLxBMsLDPiTNAc+2kxsf21j4+/jEKGiUFFKJyRm/kacdIFqGjL
	tEKyRvtRxkLyLoY4e/uJC+uevJOQ6taLF35enDwpsTY1WC8nZyLEfWRbY2Avg+BOcT+ZIlktyJm
	wnBYXg3XA0dIhyx3160Q6ap9nf9fpom6gPly7
X-Gm-Gg: ASbGncu7RBb6tMLvqjTxWD2tk+mP9P6BrfBcu7WU7gW+Tdh2JeAOewHwvMn4STjboIh
	5sn6lmOl1jxPUaj26d1a+8uEy2j3fkGqa4MwC+eWtehJiyPut5ZXLH2Yrd2Tp+4J/FUQfVTz9DD
	TEWJf4orZyZrttAT+1e2b/eg==
X-Google-Smtp-Source: AGHT+IEynk71rTo5QAU0nN+o2O+0yFjyQ113XZBjQvgh1uLkqf8zyYIq2nZaaxEVVWn37yekS9kI1R7YzDqNHi95Q40=
X-Received: by 2002:a05:690c:7002:b0:6fd:6748:928a with SMTP id
 00721157ae682-70559a6a25fmr75224277b3.29.1744409659266; Fri, 11 Apr 2025
 15:14:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <fb9f7900d411a3ab752759d818c3da78e2f8f0f1.camel@huaweicloud.com>
 <Z_f-uBGhBq9CYmaw@lei> <bbc39aec812383f836ad51bc91b013fa8de8a410.camel@huaweicloud.com>
In-Reply-To: <bbc39aec812383f836ad51bc91b013fa8de8a410.camel@huaweicloud.com>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 11 Apr 2025 18:14:08 -0400
X-Gm-Features: ATxdqUHUqC_GnYV1ob9atu9iK3mHRkgbWg3uQONWT0Q0sNaX4f87ERAqln_Lkfg
Message-ID: <CAHC9VhTaffwcGsmcix21ODAwMYxVDM+SH=By_oejxMZK8vSSUQ@mail.gmail.com>
Subject: Re: Credentials not fully initialized before bprm_check LSM hook
To: Roberto Sassu <roberto.sassu@huaweicloud.com>
Cc: sergeh@kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Kees Cook <kees@kernel.org>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>, "Eric W. Biederman" <ebiederm@xmission.com>, linux-fsdevel@vger.kernel.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-integrity@vger.kernel.org, 
	zohar@linux.ibm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 11, 2025 at 5:07=E2=80=AFAM Roberto Sassu
<roberto.sassu@huaweicloud.com> wrote:
> On Thu, 2025-04-10 at 17:24 +0000, sergeh@kernel.org wrote:
> > On Thu, Apr 10, 2025 at 01:47:07PM +0200, Roberto Sassu wrote:
> > > Hi everyone
> > >
> > > recently I discovered a problem in the implementation of our IMA
> > > bprm_check hook, in particular when the policy is matched against the
> > > bprm credentials (to be committed later during execve().
> > >
> > > Before commit 56305aa9b6fab ("exec: Compute file based creds only
> > > once"), bprm_fill_uid() was called in prepare_binprm() and filled the
> > > euid/egid before calling security_bprm_check(), which in turns calls
> > > IMA.
> > >
> > > After that commit, bprm_fill_uid() was moved to begin_new_exec(), whi=
ch
> > > is when the last interpreter is found.
> > >
> > > The consequence is that IMA still sees the not yet ready credentials
> > > and an IMA rule like:
> > >
> > > measure func=3DCREDS_CHECK euid=3D0
> >
> > "IMA still sees" at which point exactly?
>
> IMA sees the credentials in bprm->cred prepared with
> prepare_bprm_creds(), where the euid/egid are taken from the current
> process.
>
> > Do I understand right that the problem is that ima's version of
> > security_bprm_creds_for_exec() needs to run after
> > bprm_creds_from_file()?
>
> IMA's version of security_bprm_check(). security_bprm_creds_for_exec()
> is for checking scripts executed by the interpreters with execveat()
> and the AT_EXECVE_CHECK flag.
>
> Uhm, it would not be technically a problem to move the IMA hook later,
> but it would miss the intermediate binary search steps, which are
> visible with security_bprm_check().

I'm still trying to make sure I understand everything here, so I've
got a few questions:

* How important is it for IMA to vet the intermediate binaries?  Those
binaries don't actually do anything with the program/scripts, right?

* Based on the comment block at the top of begin_new_exec(), I'm
assuming that using the security_bprm_creds_from_file() hook would be
a problem due to challenges in returning an error code?  There might
also be an issue for any LSMs that run *before* capabilities, but I
think that would only be Lockdown in the default case so likely not a
big problem.

* This patch has been out for almost five years and presumably offers
a performance bump when doing an exec; I'm skeptical that Eric, Linus,
or anyone outside of security/ would be interested in doing a revert
to better support the AT_EXECVE_CHECK for a LSM.  Yes, I might be
wrong, but for a moment let's assume a revert is not an option, what
would you propose to solve this?  If you can't think of a general
solution, can you think of an IMA specific solution?

--=20
paul-moore.com
