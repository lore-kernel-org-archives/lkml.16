Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F2A217736
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 06:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746686305; cv=none; b=Y85jWQn2Jc/bu1FJgj11VHsF3j+YR8+eTYZI3lkfoQuvsFWX2UYFA/5Nrb5ZNoHI3HNYka5Yz5NBDhGqj0e3KlEbFl9zeIPz/UwbAHdnh52OJuXTs5IfFIX+4XreQqbAyJ4rtIPRXU+Tg7jJV/bmhdGwyORcVepWx7OnRmgNyK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746686305; c=relaxed/simple;
	bh=uzuQCC5ghMJYEPnyKjKBV04i+zMfu41L9Xe8o16Wfbg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U0cOlggtW3CLfVNeNEWyrv2eT6qVYXywV5RNMXVMpQpy0q8rKwHfja0DIf/5whwNFBRjLPO4GmVDCz/wmmHSs6T8S3Ft2Lt2ke7tA7hzfHUAfHemXx3D21kvgo94chaFW4xrHgPN4+F6DbMcq7oushzxTAqCGm7Pw+wEWJ4oNEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com; spf=pass smtp.mailfrom=ionos.com; dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b=T1MsoXKU; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b="T1MsoXKU"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ac2bb7ca40bso108322766b.3
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 23:38:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1746686301; x=1747291101; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uzuQCC5ghMJYEPnyKjKBV04i+zMfu41L9Xe8o16Wfbg=;
        b=T1MsoXKURtZr0vm0rVwyr+uIujKpJFnqaUv1deLXCt0yqoqt79HNaDuMRodGVoGawo
         uBEe31o6fObSQVozBQUlFZjzlrrvoqv7O7nbJhTyD/4EWZueRutbNhp0g6r5EXv/kWgZ
         6T2/LZUkdCuOsBvsNnTb2NHGsuqKLB2pq21Vjtoxgvce5LDlbhv+u/OqXggeKnpZz69d
         gq7HD9Bt85RV5jJEC1zRF5o9SqA6HWDDbhBKqmnJVSvfyBqTA5PtDhAjN3UoFIr8AxAc
         uw3hucINsFfKFN5+zvr856wrrPOQgRJaG2zKGTvKBdSjk3lz/rrsuKQaiRukc528vRq2
         oBIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746686301; x=1747291101;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uzuQCC5ghMJYEPnyKjKBV04i+zMfu41L9Xe8o16Wfbg=;
        b=DlvHBs+UEyeUGvf7hhWrfVJM5vOZhIOcb1l3tkHTqAy9M43jyawZzkU6NooTREXwCu
         0a+/sFACgPwyGa9EpZ3tfaaGvVgDKDAxLb/p1IWvYKbWWdnH59F9V/q092tH76uJzgXr
         SBUBSBT/F74LzQI6ROWdw7D6BEnd0fl+a/V6Q06wWdvhfkmu6OYnAV3EWBTmzK7nmilC
         KlEAPC/bY/bldM/xzco6FmVHmiRuZkbWjtYM/APUt+vobPOvKWS9nn0Ri10BO+PIC+hg
         41fIUVtv9W5OBgf457elIEkGUsnb1XafLE2ybLBtCInojlgSh2xmMxP2rVfJQchSxvAI
         FRHg==
X-Forwarded-Encrypted: i=1; AJvYcCViUlv7DmrOy8rOXueM6tph8Cd+Q/zjKWRcUfz67EildHtCDtw9HwquG9taWeJqqQLvrXaA3X+GEfwKzT4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxvJBl8d4dLKIy5ni0wBOYt8aiRko4zThoRKvbhxZjfK3eXiBLZ
	8Y16MqBcC3pDAxbOp9uQzVvM11c+cr9EOIjs5QRPRYIrSxZiRLOrXLDzplfnQyI5crTDEMqoRZV
	zGTP2aWYQ+dWnp6EoVh9fZ/wozEZkj4K0rYxbmw==
X-Gm-Gg: ASbGncspbi9VPyuLoSBjfnrBYxiLE5tXWaoKnvyocszAOS7kr+SbCXVTHHgikDgxeFk
	1/uQecStxxOzKNaVDCWXvj4Ed5K+HRky97qXsZ79zrjKuywPEWVAZ9VRW12JskrDOI6/l9qjAhX
	G4QUsD2M6xnYVb3mGrvWnAc42h+nwaLmiGyuDadB/8MZoVM5EGH5c=
X-Google-Smtp-Source: AGHT+IEJnhD8RI/Yrk0zkL8Hxbb9r+cPRYe1z8R9ozw2q2PITji7RSEHOIvkBsA2AYrTnza6IRBtheYc8zmJJnyV8kU=
X-Received: by 2002:a17:906:5003:b0:ad1:ea5e:207a with SMTP id
 a640c23a62f3a-ad1ea5e3cdemr473001266b.59.1746686300904; Wed, 07 May 2025
 23:38:20 -0700 (PDT)
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
Date: Thu, 8 May 2025 08:38:09 +0200
X-Gm-Features: ATxdqUEkKf35_oMQDpSf-yk8EpkbOq1qvyk_p06Buc6efrYr3tNFr-W5bWN9M4w
Message-ID: <CAKPOu+8Kc_2gs4FUhkGqjFDLZ+6AW2b93bqUd8o9vL8c_TriSg@mail.gmail.com>
Subject: Re: [PATCH] security/commoncap: don't assume "setid" if all ids are identical
To: "Andrew G. Morgan" <morgan@kernel.org>
Cc: "Serge E. Hallyn" <serge@hallyn.com>, Andy Lutomirski <luto@kernel.org>, paul@paul-moore.com, 
	jmorris@namei.org, kees@kernel.org, linux-security-module@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 8, 2025 at 5:32=E2=80=AFAM Andrew G. Morgan <morgan@kernel.org>=
 wrote:
> If a luser runs a setuid program, then the kernel will set this
> bprm->secureexec bit. Indeed, every time this program re-exec's
> itself, that bit will consistently be set. Today.
>
> However, with your change, that behavior will change. The first time
> the program is exec'd by luser this bit will be set. However, it will
> "surprisingly" not occur should the program exec itself again.

I had covered this case in my previous email already. This flag is
only used by begin_new_exec(), and the only consequence is resetting
pdeath_signal (point 4) and stack limit reset (point 5). I thought
both are no deal at all for the second exec - or are they? I don't
know.

> If you are unaware of this bit's purpose there is a nice writeup here:
>
> https://www.kernel.org/doc/html/v5.1/security/LSM.html

I don't see this document describing the purpose anywhere. It only
states that bprm_set_creds should set it "if a secure exec has
happened" but doesn't say what a "secure exec" is, and doesn't say
what is supposed to happen when it's set.

Is it really a "secureexec" if executing a non-suid program while
having effective!=3Dreal? (Currently: true, my patch: false)
Is it really a "secureexec" if executing a suid program but no actual
uid/gid changes occurred (no-op) because they're the same as before
(and no capabilities raised)? (Currently: true, my patch: false)

> See the "bprm_set_creds" paragraph. My concern is that there is an
> exploit vector associated with an abuser setting LD_LIBRARY_PATH=3D to
> something nefarious, and then invoking a setuid program that happens
> to re-exec itself for some reason. The first invocation will be as
> before, but when the binary re-exec's itself, I am concerned that this
> could cause the privileged binary to load an exploit.

How would resetting pdeath_signal and stack limit affect this problem?

LD_LIBRARY_PATH is an environment variable that's used by the
userspace linker, not by the kernel. Userspace doesn't have access to
the "secureexec" flag. The usual protection against
LD_LIBRARY_PATH/LD_PRELOAD attacks is that the glibc ld.so ignores (or
removes?) these when it observes real!=3Deffective. That check still
works with my patch, and has nothing to do with the "secureexec" flag,
does it?

> This has nothing to do with your interest in NO_NEW_PRIV but more to
> do with the legacy behavior changes like this are exposed to.

Yes, I understand your worries, and I can limit my patch to the
NO_NEW_PRIVS case, if you prefer that. But I think it is worth
exploring the legacy behavior and see if there is really a problem
(i.e. if there is really a userspace-visible effect), and if that
legacy behavior really makes sense. To me, it seems like the legacy
code doesn't make much sense; the checks for "secureexec" are wrong
currently, and maybe we can fix this without adding more complexity,
but by cutting unnecessary complexity away. Simpler code that is
easier to understand is less likely to have vulnerabilities.

Max
