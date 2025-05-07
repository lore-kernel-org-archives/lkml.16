Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2B1D28EA5A
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 20:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746649529; cv=none; b=US4N1RUhI79pC0KDFiF9BLsay2U9kz3QTL57JskJCpx004QvJ2TXaAaIiv/3syyT2w7PD2IVj3qatWmB/6TW/qzYgLXxW91ekzhTcQLfXuCh/sErQ0hTZoh9XeREaP2z+gHiJYvUS+aMYWEntyRKCzA6aV8s6xl4EN4N29o6IwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746649529; c=relaxed/simple;
	bh=qdiPfeEduMFcY18UGwTytvzaR9eZwYZDCj1Ymp6ZXOg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HMwG07e0htRfRb4NMWcXzutSpfQwOzluL9+r3Z5p/EqZmcSFOYQK0ICAEzkDC8+3yU8pcp6yoo717gyl+2KmBH1MAFa7K+q7cLkToKtTneqrPF997tLHjUXkJWrt0xfNEHQhOz5D3zMaCu511E2syxpEpSefIMQQBmJYh1eTxb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=LQzqmrOH; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="LQzqmrOH"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-7082ad1355bso2686177b3.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 13:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1746649527; x=1747254327; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NALzzc7ouJeBPR1TUY0o8qCUJh5kyiSiCwpTtRH0S2Q=;
        b=LQzqmrOHVKzVpku5wUi78oaQrwRwbhtDWcpXCso8WejVRIGUrhyquzuEabtIpalxe/
         CcZMD2nPeFAQXkKLpl6Zz5RCE7uyWlV96LBixQA0CVs0YDYCTQYi4dIVm89HW6w67Rnq
         lmc5gevmbjPvcvwwrCL+D1EYwoKavGsSynG7d/utbJmBOAnrn1RDR7wRCY9RNrl3SJn8
         MlOKXZ7kqUsgjdPo5uwNzjAF50AXNJOQXyQtmFz/5t2pP8BurlZ2mScRKhA3tbdUvZdD
         Nl7PAD5VFHo3b3aoYMsScDafM6koSoEYm1v7Q37Q5ZaT4M+5xWh41pB5MdPYDIL1/36x
         VGpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746649527; x=1747254327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NALzzc7ouJeBPR1TUY0o8qCUJh5kyiSiCwpTtRH0S2Q=;
        b=EbHL2+fhs96Nbzb0LIUHnvdwRtj6IF8VankHOozFIiRl7LX1uvZsne9IBlsT8+JTcZ
         zPhGknV1doT5a8cDYr+On9xDn57SCKuhMkW89k7u0aXLsvlde+2ZFnj1BwncrDTIMWua
         PrS5m77ixRv4olPh4vw4p/6TCP/Hw0wmaNoflSQCv6c1GgKI2jiu5oaNBJlayAqAyRMW
         RdWu4rzxjq9sMkxvFgPETO+8EH/QeBa51fNv/hbFtGI2vBz+/qdbgQ0/ijRSeJ2ylTTk
         7crOIYUj/XBLY2Bgy9iqm9SfmpOarEQJUIoXM0D39Qk96RyigG2653OMBKmpQsUrujEX
         hwiw==
X-Forwarded-Encrypted: i=1; AJvYcCWkgXRSQY++RCmSBcisy8aQRa3njlVVJu+cnqFWsaFf1X54/BLLklC/rWOaz16dHDpAbtW88AP/XDZbtTk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyAafGqYoEyEMmO63uf3SsDp3cBixsFtxhAjkFXEUi0reksVtf6
	A5/d16/p9QQJ66p5UxxYcUjwcqJ3sNw31cndVj/aa3s4pNrmTc25Xwos3acpFt3EGmKzebyOL2z
	DmbYBwMjIiMNe7C4569ZoJMYMTzjc6GAZ2W/5
X-Gm-Gg: ASbGncs9EPLs5njoc9e7TQuAXgUS4j1c7belaOg7b+I6RNiV8AVSZP8WA+V8TP3F09Z
	u+EN6GTBepbcZE1tYtIOFUvsSnKr85t7Tq1O1dw3C1QAo0QKuOMu93jYNEXM3dGzvIf5bBKBSCN
	vZ6mj4CsOPoIJmttNNk/Vlpg==
X-Google-Smtp-Source: AGHT+IEnsTmJtfSd7Oi4sYpnW+x9F1ytxun5MpNFWBa6XR5ci2YLPQTnwDSO5rA4KRr9sVcjKs48yaHdzYejiKICMdQ=
X-Received: by 2002:a05:690c:3581:b0:708:100a:5797 with SMTP id
 00721157ae682-70a1da6eff0mr72099047b3.11.1746649526482; Wed, 07 May 2025
 13:25:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250506143254.718647-1-maxime.belair@canonical.com>
 <20250506143254.718647-3-maxime.belair@canonical.com> <9c68743f-5efa-4a77-a29b-d3e8f2b2a462@I-love.SAKURA.ne.jp>
In-Reply-To: <9c68743f-5efa-4a77-a29b-d3e8f2b2a462@I-love.SAKURA.ne.jp>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 7 May 2025 16:25:15 -0400
X-Gm-Features: ATxdqUGLFAcBMOosGYQgzrTfPBBKYyLh7ma_JO834Kmp4fDuZcqb-SMlNb5e7uk
Message-ID: <CAHC9VhRKwB4quqBtYQyxRqCX2C6fCgTbyAP3Ov+NdQ06t1aFdA@mail.gmail.com>
Subject: Re: [PATCH 2/3] lsm: introduce security_lsm_manage_policy hook
To: =?UTF-8?Q?Maxime_B=C3=A9lair?= <maxime.belair@canonical.com>
Cc: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>, 
	linux-security-module@vger.kernel.org, john.johansen@canonical.com, 
	jmorris@namei.org, serge@hallyn.com, mic@digikod.net, kees@kernel.org, 
	stephen.smalley.work@gmail.com, casey@schaufler-ca.com, 
	takedakn@nttdata.co.jp, linux-api@vger.kernel.org, apparmor@lists.ubuntu.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 7, 2025 at 6:41=E2=80=AFAM Tetsuo Handa
<penguin-kernel@i-love.sakura.ne.jp> wrote:
> On 2025/05/06 23:32, Maxime B=C3=A9lair wrote:
> > diff --git a/security/lsm_syscalls.c b/security/lsm_syscalls.c
> > index dcaad8818679..b39e6635a7d5 100644
> > --- a/security/lsm_syscalls.c
> > +++ b/security/lsm_syscalls.c
> > @@ -122,5 +122,10 @@ SYSCALL_DEFINE3(lsm_list_modules, u64 __user *, id=
s, u32 __user *, size,
> >  SYSCALL_DEFINE5(lsm_manage_policy, u32, lsm_id, u32, op, void __user *=
, buf, u32
> >               __user *, size, u32, flags)
> >  {
> > -     return 0;
> > +     size_t usize;
> > +
> > +     if (get_user(usize, size))
> > +             return -EFAULT;
> > +
> > +     return security_lsm_manage_policy(lsm_id, op, buf, usize, flags);
> >  }
>
> syzbot will report user-controlled unbounded huge size memory allocation =
attempt. ;-)
>
> This interface might be fine for AppArmor, but TOMOYO won't use this inte=
rface because
> TOMOYO's policy is line-oriented ASCII text data where the destination is=
 switched via
> pseudo=E2=80=91filesystem's filename ...

While Tetsuo's comment is limited to TOMOYO, I believe the argument
applies to a number of other LSMs as well.  The reality is that there
is no one policy ideal shared across LSMs and that complicates things
like the lsm_manage_policy() proposal.  I'm intentionally saying
"complicates" and not "prevents" because I don't want to flat out
reject something like this, but I think there needs to be a larger
discussion among the different LSM groups about what such an API
should look like.  We may not need to get every LSM to support this
new API, but we need to get something that would work for a
significant majority and would be general/extensible enough that we
would expect it to work with the majority of future LSMs (as much as
we can predict the future anyway).

--
paul-moore.com
