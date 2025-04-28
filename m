Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A02925D531
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 11:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745840638; cv=none; b=QckfxyIJ4DYX+bodM1Z61qNjyBoue2kK8n4FR/kgzfjaL9Mh4lZAiNIHL9SwDkjIB/wyOMYKIOS33ee0qn7L4X1MOGVj9ZKqI+RtNQWpOWQtwh23jluzoDryHPxYnhYVhJfwu9OOHnUmNqcuT2TWMNtN5hGJUafOIrK1k0E0CUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745840638; c=relaxed/simple;
	bh=ZyDowSCFBjbol/z7R9f+73E7pUMl3a1ZYbWk5IkH/xQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dS8/FIE1dqmIO69UsRipZmS/R79pKgxjyb9s1UDiOc0yA7V/Slb8YKx47GA87U78u6gHKrbS+P06HmFi8E72ugeJto1UoyTicDm9h+L3pF0Lybn0CjSO6qSAvfYg7I+b0ix1Ed7ji8V5G5Nsj3czniICjm7YGNN/kv+QbOah3C8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ionos.com; spf=pass smtp.mailfrom=ionos.com; dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b=FqjpakDH; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b="FqjpakDH"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ac3eb3fdd2eso815924866b.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 04:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1745840634; x=1746445434; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=27k8fTgb68nwgdu8HS5yYjoAdsGv+rXKJIohoNl+Pgo=;
        b=FqjpakDHi8d64/ewaDwjWyAn4ldF+gA+5uAVofqkxNVHF4WfqeJhaRP7sopTqgeH4t
         EAfw1qUwnJzkoq2HkZBKM7ybfO4X3J5t08hiVIyTpFsERVJWeTmU5XpWj5QrTUnlL2Ri
         QSQtVA2wRq1dFgyz0oU/gBo4gW9rEIQU2fwdq6siq3VInxZ0cSAQidLqXXASPcU71f/O
         w0asdYS8wb/Q8njcPm6Ip4MzieSI0AXezKXyuxtn8iLt0pQbCr/eSlvMbelVbcXhr6D5
         Pw80HMmj9d4Vn1O+PhAL4K4BBDDaaQMrvVikYslgnTc+2vkMEL0hOsnAmyj+dtsZULtz
         Wjnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745840634; x=1746445434;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=27k8fTgb68nwgdu8HS5yYjoAdsGv+rXKJIohoNl+Pgo=;
        b=cpclfTME8uioJxoVaDcQ7q9AiKgvM5TGbIeJ6yhW2eCq30N2rMvGEiQB4mvWw8cG3K
         5MEFM/WDXxLXfReuMh8CyVM0wOSsmL1wBsnFEgkxW+vSCPiapd5FTHtvdHbKni5xKnP4
         JTZ5TdfMiFn7I1FNEjWoARcKf+oz44JA1Y65rhJH+8EU3YShg70Oj/eOQInXKQwIS3ae
         gZfSBtGsdBPqG6rCFbi/+PUmrV8LftQncadPdshIXABtuebSfCHcqCAbCiS7BhKyVltl
         K76g+z0Fr60DtFdMBMNe44qOnvZjUzOSPMtbMAnRZZuvBMj1qE/HS2Qip4PpNRr0rJoT
         1tUg==
X-Forwarded-Encrypted: i=1; AJvYcCXqFqkyj9Ox3Ib36RdYt2DqM2oF36sUFxfHBAiuIcinPN97DC/7BgJJ6bl49XJyEiZry4n4wDvyvMRq86Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YzqT5G38iXC85/3k+8TkwLK7xc28tv+3d8QNJupynu6I59gh/GG
	74Z97KOcnTtGLjXVfnkGcGG8z389EqDU6+tLqbXooCHzYiMBFPRQoBohuMpCUA+723T21LjRjRf
	1NLMIjBV3x96bvu3bbAIeulee+wy9lT0wkR9Nrw==
X-Gm-Gg: ASbGncuRv5rltv55CVVEmZCb4SpgVzEbqpnO8Qe2Tf3RvhxgGuV1CYraIQVM1gimVWs
	jyG262EbrlWL2sjK0VTY4q6+S2DDDZnDh0xUMPbBYqlWIVSeFGYEBo2LnTE+b8bJV/RAApcWsTF
	ly68REkO3rLM3AH9dnGNHvbB/xenfX0DauXLSlryaZbV6R89yAi8s=
X-Google-Smtp-Source: AGHT+IEIxlQcqpaK22146mKPVF/W1IYohDS+XoqVdHfym0fkA015MpP1p5Wq8//LhK97ToEvNFs7AzHAd/74oFt6S6E=
X-Received: by 2002:a17:907:84a:b0:ace:55d8:227d with SMTP id
 a640c23a62f3a-ace73b469fbmr1238358666b.54.1745840634524; Mon, 28 Apr 2025
 04:43:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250306082615.174777-1-max.kellermann@ionos.com> <20250309151907.GA178120@mail.hallyn.com>
In-Reply-To: <20250309151907.GA178120@mail.hallyn.com>
From: Max Kellermann <max.kellermann@ionos.com>
Date: Mon, 28 Apr 2025 13:43:43 +0200
X-Gm-Features: ATxdqUEGitAegQk4E0Nyyno9BkuluE7h25YbBUSdFY1Sk1RfF3-WDjBztgA7tpc
Message-ID: <CAKPOu+_vTuZqsBLfRH+kyphiWAtRfWq=nKAcAYu=Wn2JBAkkYg@mail.gmail.com>
Subject: Re: [PATCH] security/commoncap: don't assume "setid" if all ids are identical
To: "Serge E. Hallyn" <serge@hallyn.com>
Cc: Andy Lutomirski <luto@kernel.org>, paul@paul-moore.com, jmorris@namei.org, 
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 9, 2025 at 4:19=E2=80=AFPM Serge E. Hallyn <serge@hallyn.com> w=
rote:
>
> On Thu, Mar 06, 2025 at 09:26:15AM +0100, Max Kellermann wrote:
> > If a program enables `NO_NEW_PRIVS` and sets up
> > differing real/effective/saved/fs ids, the effective ids are
> > downgraded during exec because the kernel believes it should "get no
> > more than they had, and maybe less".
> >
> > I believe it is safe to keep differing ids even if `NO_NEW_PRIVS` is
> > set.  The newly executed program doesn't get any more, but there's no
> > reason to give it less.
> >
> > This is different from "set[ug]id/setpcap" execution where privileges
> > may be raised; here, the assumption that it's "set[ug]id" if
> > effective!=3Dreal is too broad.
> >
> > If we verify that all user/group ids remain as they were, we can
> > safely allow the new program to keep them.
>
> Thanks, it's an interesting point.  Seems to mainly depend on what users
> of the feature have come to expect.
>
> Andy, what do you think?

Serge & Andy, what's your opinion on my patch?
