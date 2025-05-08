Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76A0F4B1E57
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 08:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746693438; cv=none; b=jHTQN9wUlNSapOXISEY6DxYNDflBK9fvaLmOZQdYdtWwFeHbYsh6+MK5SNq/lPKNV2uQ3UGmv/4rZgcMLEolmuVJ5p6XJvu5zMdGJtBnx8nuTD9nt3juZ1qngEtyAjfmjF/r6A4NceZJcUEliiv2whCPhS7BuWiBhIvfqhhdoMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746693438; c=relaxed/simple;
	bh=UnZgUVt+Cd48H6Gxupey/FinooCxbbBTr4OCkTqyW30=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IS9Giy3JsLp4mTCT9RwhMd7AHL+AaS5b/rZvglcAZR5+hCeMSHzu87Oz1/nNl7uoOH75EssiVJah2X28bQ1Crjg6Nwboi0JiNxQDRAfGB70J+/kpRSSWz7TrHM7IRcNoEfbXKI3h5JoQ6E0Jwc3iSZ6yCPXrCCmZdZtdG2EKotw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com; spf=pass smtp.mailfrom=ionos.com; dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b=dYi8D3PM; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b="dYi8D3PM"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5fbe7a65609so1171456a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 01:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1746693435; x=1747298235; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d3yAv0PhhoFlOwGT9Vpb8yBJ5ZFaUviPQ0VRAAnAe30=;
        b=dYi8D3PMm9u03zbJ2xkM1aeEq5sC2l6LudzCBqzFOYwTOJFMKs8E0GXVjJj8gLVGmx
         ananJVYqURdhtLtXtkM2FSxGb/SGzbQOjWhKnBWJT42ksg142tEwEOtIc+WhJA/RAcba
         6nQwE3IjBBk/BdjzCp07AxlphFrpje3DCy9JmL4woZMzX4Ua7hyIyMXqlkz9tQXM+QXI
         Bj0Sud5RrFi5UsBc6DAB04jzvan25J4js5eJnkgZSfVtMRlbzH8/n9IuENIl3725T2Jq
         ojG/HIngbRA3PVBTuEh09Fy+sH50D0IXSnBpqp0Ha7eqYgOY+Zij6fkFnmvsDh2W0Fey
         Qnyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746693435; x=1747298235;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d3yAv0PhhoFlOwGT9Vpb8yBJ5ZFaUviPQ0VRAAnAe30=;
        b=UFf2oBB3GzcYPKmpMMP/NNt1xvojoZc1IKDTmLdKjlCEZpDQS1KryhLisSHRPJpiiS
         bKCX6pNCEBaq6+qwP9dhCVZiijrFhdW5mer8CUUz4at/lmMByBPkMvIhAdBnmdfHMGpp
         5gx26axucan5HwUD6mWOYuETUyAoXaerdwAnuobs/GS11P7NHSACT4fGlxrfiVteeiIN
         HgckRvEbcW5ZVMMXItKDzTo4OjWUpMrx2hdIQuWMsshSirANUJsyNlmBdsZzcxBCv/I/
         HxsyyPHWNDUTZUhUqtfZO1ySFeOdVFbBTXdpEtFQEjO7SKXqAPB15/IB0cA0tBVWb29m
         628w==
X-Forwarded-Encrypted: i=1; AJvYcCX9sfpw2ig2CzL6lSKwS0UmjVt2T3TZMjon7ZlHs7cSG5ZtSqT/RfbZ09i7F4P1BvZ7ijMacrXxcoZ21gk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzspt6Gh0fYKYaFQicbOeY5JfzJ7aH34YfhRLil3IIzgxW8wssC
	1DGiM21BSQFAFWaXNZkLbbwff+Fm3ThWYk0vOhDevAFtQK/3jmVfgAA9y2HbLWSEYYNuoxiY6WG
	97q6yKbkNwtkeVuv8jAs7wnmWmvHEZyQA+2XsWQ==
X-Gm-Gg: ASbGncux433vzq94WTiOFK2q21oU+bxNIy26CIuoGLJMQ17MyjpresCyOcs5Wbs9Adh
	quQP39JNCk6sD2imV8RYX/98Ol7fwF2XvWaQ7l0kWx4N7iK9U9kiSm8uY1nrM+YyuzfFTeyBmHT
	YZIh1hOge7MLbQhzVmfWjj8DTQISD0KpdNcc7Md5e8kBZuo/s7UuI=
X-Google-Smtp-Source: AGHT+IHZ2rhB+iv4wHWS2kFS9398kogCHfihOoXvOhDhqZc6h3WfEVMvj050CiBlPWaNyledskveiDEA3cZvZP72aAk=
X-Received: by 2002:a17:906:c10d:b0:ace:d66f:e2ed with SMTP id
 a640c23a62f3a-ad1e8bf55e8mr654880966b.25.1746693434806; Thu, 08 May 2025
 01:37:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250306082615.174777-1-max.kellermann@ionos.com>
 <20250309151907.GA178120@mail.hallyn.com> <CAKPOu+_vTuZqsBLfRH+kyphiWAtRfWq=nKAcAYu=Wn2JBAkkYg@mail.gmail.com>
 <20250506132158.GA682102@mail.hallyn.com> <CAKPOu+9JCLVpJ-g_0WwLm5oy=9sq=c9rmoAJD6kNatpMZbbw9w@mail.gmail.com>
 <CACmP8U+aLY7wmEqdb=a_tpDCY5LaPGb46DU+jSD3bCXX=JUAuA@mail.gmail.com>
 <CAKPOu+_=ocLeEqcaSMjb5qqrvi6KAu3GYJa19Fqz_dm3a5F77w@mail.gmail.com> <CACmP8UJmC22+59RcHu_X3xpdUYP-i93rjdVQvZn6_Haj-F8tPw@mail.gmail.com>
In-Reply-To: <CACmP8UJmC22+59RcHu_X3xpdUYP-i93rjdVQvZn6_Haj-F8tPw@mail.gmail.com>
From: Max Kellermann <max.kellermann@ionos.com>
Date: Thu, 8 May 2025 10:37:04 +0200
X-Gm-Features: ATxdqUF3az4N3FOazSPMnBdAataIURztGU21AUNdHQXvyCKx5MItY1Zad7HyxIE
Message-ID: <CAKPOu+8+1uVrDJHwmHJd2d46-N6AwjR4_bbtoSJS+sx6J=rkjg@mail.gmail.com>
Subject: Re: [PATCH] security/commoncap: don't assume "setid" if all ids are identical
To: "Andrew G. Morgan" <morgan@kernel.org>
Cc: "Serge E. Hallyn" <serge@hallyn.com>, Andy Lutomirski <luto@kernel.org>, paul@paul-moore.com, 
	jmorris@namei.org, kees@kernel.org, linux-security-module@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 8, 2025 at 5:32=E2=80=AFAM Andrew G. Morgan <morgan@kernel.org>=
 wrote:
> See the "bprm_set_creds" paragraph. My concern is that there is an
> exploit vector associated with an abuser setting LD_LIBRARY_PATH=3D to
> something nefarious, and then invoking a setuid program that happens
> to re-exec itself for some reason. The first invocation will be as
> before, but when the binary re-exec's itself, I am concerned that this
> could cause the privileged binary to load an exploit.

Let's talk about this potential vulnerability again. Consider the
following code:

 #include <stdio.h>
 #include <sys/prctl.h>
 #include <unistd.h>
 int main(int argc, char **argv) {
   printf("ruid=3D%d euid=3D%d\n", getuid(), geteuid());
   if (argc > 1) {
     printf("setting NO_NEW_PRIVS\n");
     prctl(PR_SET_NO_NEW_PRIVS, 1, 0, 0, 0);
   }
   if (**argv) {
     printf("re-exec\n");
     execl(*argv, "", NULL);
     perror("exec");
   }
 }

Without my patch:

 $ /reexec
 ruid=3D1000 euid=3D0
 re-exec
 ruid=3D1000 euid=3D0
 $ /reexec 1
 ruid=3D1000 euid=3D0
 setting NO_NEW_PRIVS
 re-exec
 ruid=3D1000 euid=3D1000

Without NO_NEW_PRIVS, the re-exec keeps the real/effective, but also
gains setuid again, but the suid is no-op; the euid is already 0.
With NO_NEW_PRIVS, the re-exec drops the euid=3D0, and doesn't regain it
- the setuid bit is ignored.

With my patch:

 $ /reexec
 ruid=3D1000 euid=3D0
 re-exec
 ruid=3D1000 euid=3D0
 $ /reexec 1
 ruid=3D1000 euid=3D0
 setting NO_NEW_PRIVS
 re-exec
 ruid=3D1000 euid=3D0

Same without NO_NEW_PRIVS (but internally, the re-exec is not
considered "secureexec" because the setuid bit is effectively a
no-op).
With NO_NEW_PRIVS, the setuid bit is ignored, but the process is
allowed to keep the euid=3D0 - which is the whole point of my patch.
Indeed, no new privs are gained - just like NO_NEW_PRIVS is
documented!

Back to your LD_LIBRARY_PATH example: with my patch, glibc ignores
LD_LIBRARY_PATH because effective!=3D=3Dreal (still).

But without my patch, with the vanilla kernel, glibc does use
LD_LIBRARY_PATH (effective=3D=3Dreal because effective was reset) and
you're actually vulnerable! It seems to be quite opposite of what you
have been assuming?
(Don't get confused that the kernel has reverted the euid to 1000;
this is a privileged superuser process with a full set of
capabilities!)

Am I missing something obvious, or is NO_NEW_PRIVS+reexec is a serious
Linux kernel vulnerability? (And it is fixed by my patch)

Max
