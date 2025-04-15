Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE08B19E7E2
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 01:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744681081; cv=none; b=R4Sf51pVxFy2CxsPsDFPyire3PwjqH8TLzayXTyXnEIwfFZNCiujVpnS5iKxjYvHgZuFEAb5PU2wRLL0+PGLfAfOel8MSQFFC9hdQIromUAVFAz9yrOsHsShRHyK4A24G0OFB/g9Kjrawk1aLkPbPiARvdxrKSPFNpFnwrMK11o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744681081; c=relaxed/simple;
	bh=nnSwVQEmzGQiBeSzekmrr/5D5+/Kj5ljs92bYT66phg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MZyIk5r7qxcWAP2sMgW/HIn2NTfnlZsB7OMlJRoJvXbJxHFCN2kuULPoI10cpchBWZ+G0AE2NJXj8AGCJS209KN24JpX0DkaozxJzRZ7pKhM4KWZ7zDWLoAAEJ+lZsLMnWG/cTl32n1eWdxx//DYcPp6M9qFxzd7qFRfi+vcFpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=UyGPpseq; arc=none smtp.client-ip=209.85.219.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="UyGPpseq"
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-e6e2a303569so3746339276.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 18:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1744681077; x=1745285877; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RmvfG1SQQQWNnAFrc4eRr2gOVcRDAxX6JXskDgWSkhk=;
        b=UyGPpseqMIr5FWt1t8/fTweMybHb8ICvimkGcv7SqUidNJyoA1rE3eqyyK4rkCYVAt
         JuesuxZderCvCHLu7J/wy2+5dgy5Ds/VAm3691Pem68xwhSqciezzHRCT8A6mBt+nPRx
         KBU41Gfl3MKy52eXSCr10GEQZyuvHKx1FrWdGUbeuIIvt6Rlh9DH1hxztlLec+ExxLQQ
         PWJNsQ9Gy3ZxwfmuMVRMar8Gamz+e0SX/blsUEDoet5FzTVA8Dh0GIZu6oSeIgvaReA8
         UUbjCMDY4uJ8kZrkDXv8HIhVc6jL5tzSHyeubtilCFb/H+91BY2/saK3ti2PvlqIXW1w
         H1ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744681077; x=1745285877;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RmvfG1SQQQWNnAFrc4eRr2gOVcRDAxX6JXskDgWSkhk=;
        b=OhMahjWwU9D/JWrcu3/AyMUfaHbsdk6az3UoDedM6vUtE6AoOH36CJFfB/o+gcrEOq
         wbqFuV0ovybs6kbPg7a8E2PXjE8oLXrUqF2nfk0iqoTWMf78VzoCTWBnGS4WFFZWBqGG
         8bjly7/saGUToDDTa91CEPmWogqFsjXFw/3OHh0vWcJqL2tPW/K4NOxtiTl5OUEqS/Bo
         P3KNiWYuTtpX9N2XdU+yG9oBuHMZU2Ee35bgiNTy2HpKFwgpyjKeur9rhSGzrmbpXXcT
         GWuSicOvrr+ggEyfuMQrlnAo9uYYsdUKZm724r4ECuLIxz1UGtnzrrkvDaksB2k91Fg/
         KzNw==
X-Forwarded-Encrypted: i=1; AJvYcCUGdrwP0O953Mp9b89U08+60d6jn7C5orqu0F+pJaL8WebkBPti1t3CMwwLkuUiRSPHIM3zH0qcSsH7H/g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1QXrIZ/rJYJiHpDB5WYKPoYkf0lpdrSaQuonoBsP3IFIb+Dif
	CZNVST2q9mE/7Sz1AD+pE8GaG/O+RDp97ycF9MLOZADHCQj5WLCaZldObW/IQB+d8d37xTEpXs4
	3rNx3hCeze1tke0KgluClPXipcUcQUmFeEaUq
X-Gm-Gg: ASbGncv9349sqaaqdTVFVIxidLyLIvMrFvWRXnY4z6JaVrii39JrcJhIdrmSUwcH7ev
	9TfejJwYBcBaOuvSZoFbfRhPDcGEFUvKJQyiVNR5YaFsI1KrRnevkEAp5om2tUPbjwRMcnF9+zG
	yz5Mu6YFOAkSjAAYR893VU+gJRxcPb8dPu
X-Google-Smtp-Source: AGHT+IGVFpWpZi+wTlwkHFutHe8bqQ5rjA+H2o0mhaXEz1HFA8h8I8OEvnDz+zZIg9Hq6o5FyhzxVV34XBFz3VTMiPA=
X-Received: by 2002:a05:6902:d43:b0:e63:ebbf:7ea with SMTP id
 3f1490d57ef6-e704df842b4mr23249055276.39.1744681077563; Mon, 14 Apr 2025
 18:37:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250404215527.1563146-2-bboscaccy@linux.microsoft.com>
 <d3ad9a7bb9eb68a3ae5dd18bf091825d@paul-moore.com> <87ikn6jwt2.fsf@microsoft.com>
In-Reply-To: <87ikn6jwt2.fsf@microsoft.com>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 14 Apr 2025 21:37:46 -0400
X-Gm-Features: ATxdqUFeWe8YQ9KNwKtLxVB-kJkAnedXLrtL9lJ0sVjc8DBpxOzeoo2ai7wuYBI
Message-ID: <CAHC9VhTugESMrL8=+b45j3rTKykypZN31in0-cq_FcQF+3nYCg@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] security: Hornet LSM
To: Blaise Boscaccy <bboscaccy@linux.microsoft.com>
Cc: Jonathan Corbet <corbet@lwn.net>, David Howells <dhowells@redhat.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, 
	James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Shuah Khan <shuah@kernel.org>, 
	=?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, 
	=?UTF-8?Q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Jarkko Sakkinen <jarkko@kernel.org>, 
	Jan Stancek <jstancek@redhat.com>, Neal Gompa <neal@gompa.dev>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, keyrings@vger.kernel.org, 
	linux-crypto@vger.kernel.org, linux-security-module@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	bpf@vger.kernel.org, llvm@lists.linux.dev, nkapron@google.com, 
	teknoraver@meta.com, roberto.sassu@huawei.com, xiyou.wangcong@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 14, 2025 at 4:46=E2=80=AFPM Blaise Boscaccy
<bboscaccy@linux.microsoft.com> wrote:
> Paul Moore <paul@paul-moore.com> writes:
> > On Apr  4, 2025 Blaise Boscaccy <bboscaccy@linux.microsoft.com> wrote:

...

> >> +static int hornet_check_binary(struct bpf_prog *prog, union bpf_attr =
*attr,
> >> +                           struct hornet_maps *maps)
> >> +{
> >> +    struct file *file =3D get_task_exe_file(current);
> >> +    const unsigned long markerlen =3D sizeof(EBPF_SIG_STRING) - 1;
> >> +    void *buf =3D NULL;
> >> +    size_t sz =3D 0, sig_len, prog_len, buf_sz;
> >> +    int err =3D 0;
> >> +    struct module_signature sig;
> >> +>> +        buf_sz =3D kernel_read_file(file, 0, &buf, INT_MAX, &sz, =
READING_EBPF);
> >> +    fput(file);
> >> +    if (!buf_sz)
> >> +            return -1;
> >
> > I'm pretty sure I asked you about this already off-list, but I can't
> > remember the answer so I'm going to bring this up again :)
> >
> > This file read makes me a bit nervous about a mismatch between the
> > program copy operation done in the main BPF code and the copy we do
> > here in kernel_read_file().  Is there not some way to build up the
> > buffer with the BPF program from the attr passed into this function
> > (e.g. attr.insns?)?
> >
>
> There is. That would require modifying the BPF_PROG_LOAD subcommand
> along with modifying the skeletobn generator to use it. I don't know if
> there is enough buy-in from the ebpf developers to do that
> currently. Tacking the signature to the end of of the light-skeleton
> binary allows Hornet to operate without modifying the bpf subsystem and
> is very similar to how module signing currently works. Modules have the
> advantage of having a working in-kernel loader, which makes all of this
> a non-issue with modules.
>
> > If there is some clever reason why all of this isn't an issue, it might
> > be a good idea to put a small comment above the kernel_read_file()
> > explaining why it is both safe and good.
> >
>
> Will do. I don't see this being an issue ...

My mistake, I spaced out a bit when looking at this and for some
reason thought it was reading the BPF program/lskel itself and not the
signature, meaning that the BPF that was being checked by Hornet was
not necessarily the same BPF that was actually loaded.  However,
that's not the case here, as you rightly point out it is just the
signature that is being read by the kernel_read_file() which shouldn't
be an issue.

Thanks for the correction and sorry for the noise :)

--=20
paul-moore.com
