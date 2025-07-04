Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3950E1E32C3
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 06:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751610984; cv=none; b=uTR8+zhXSQPb2BsY+Es6Ot3wzm0Qr0lR0R0ybTlVSEIvY3/O3yILRBMZIRasgdpFsbF4D6wqmvlyrTADEvqunyyE2Xfr9+w+d47R+aQkfjSGROvLMjD0q/uv5fvk4Y+uWCK5RH8460oXxRGMK/PxEzTQ2XtNKYLBJad5wluTQvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751610984; c=relaxed/simple;
	bh=nXSpNA8M4Ck5F6xOcSmyTSFtp5OvQquw+LlL0If80vA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NZQbuPMUZhsdk6wkLlgq4FX1CtcSaiDEZTLo6fbzXOZsEH1t5+E//zSrjkzcgweeoPaYUzD/UgRoI1GlnVXoykjdKkHdsMUrQl8I/3X20EDDvWVCiV1rv0hfsm9hx3w2z62Qges7bJL0fvBexCyhMaF3sx1OPVr5sPp1t9tjNJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Fr2MRKXD; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Fr2MRKXD"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3135f3511bcso704656a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 23:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751610982; x=1752215782; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WJhZIcrJpMNq0LUkRcjbdMcofmE/cfg4pDDuml2T7kw=;
        b=Fr2MRKXDn05olhMico18s0k38k00rZQcrm/hxFtAtpf+1ZBNX0jl8ewPTVwlMnXpZD
         W10FVAn6NjuzeEZTYjTtBim+n63FYDSmuKBxtctdRsJWZYrsXIsBklSDhbahq4RLFsTE
         Z6nfBaArBdQ4Wg5T7SYaihCgDr/pKrY1vYOk4zwpkb1p5ibcSFvORxlQv/g4x5WT9KTY
         vaTuaGm/BIsCMxyxxxJbjH1ZAZRapuvpyQZ740l20ton91HwquP0IgczuJ/aP5T4E4JZ
         8vlEyfgSBBA6fAVcMf5XXS9jw6WpNntVNrg0VAh8zFS49ce5ZN4extXS5bpCn5yU7mei
         5pqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751610982; x=1752215782;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WJhZIcrJpMNq0LUkRcjbdMcofmE/cfg4pDDuml2T7kw=;
        b=YpzINOmy2jjeT8QpKyBopIvJ8pBU4u2XRxN4q39fvwoITJ0gVTxMXwRsZlOrOog8b+
         8HRgVb77gAkTz7hD5rCPRtNJ3U+WIblWdGGm/oT+S0q4Y75VofzJzIn+pZSR2mGC2ELl
         ssFdRzQKe4qFpuJFzC9bEuVgKaEG0Azd4fMQandRFiaXBup8rd4TutudR3qPrMz9RbBq
         lvy8aPiYJvORDvHXbSnQ6fQNg8jWMSystTINcta6I4qenZS3ZHH857ychn/DtSolrsiD
         J9yPM+xhj9siWy9sd5ixii3tXWbmfNLL8rpGLPCAim5WN2Ni23j5KlZUehNAwgtv4ub6
         mtPg==
X-Gm-Message-State: AOJu0Yxqa1pXRYNQIGr/3Yf+ifZry9ofAKinZOxgCmigWtQSbBwG1UnA
	JT7jS/ng4jsQLrIxNz2a/GJOyTZIjXbGV2awJwlkN7Z1N49X2Oz5hEWv5EuNlSZPiQm6u3kziuh
	9gOx2agu742KWIyu7xnjnECQQrOllc7amF+mBKiuc
X-Gm-Gg: ASbGncvDynnsDO+CGwcEGTw1mKAYY7wSigck/Z9jG442xqM7J7h5ot+tlnWdNL1Cger
	b9MucLxwNDwz4St5qu8iMqlKs1LVcWDvTrXth9hbIvLFoMdAu9sG8lVL65n8z3okPvBTY9ugNGp
	ogARary4OFwddXERP9yqm2HoRzDJAaqsMhbE193vDr8CagZG+55D+YyIuq+J/aRUPK++uZ0PF49
	A==
X-Google-Smtp-Source: AGHT+IFZJazY0HHgsmXDU5VL6+IsYWgPntWi2l4OY+rLS1bM7IbcJrAefWDZk9LjfpG9/pk5+jRgPlYA4sQ2zX/VSVw=
X-Received: by 2002:a17:90b:3c91:b0:312:1d2d:18df with SMTP id
 98e67ed59e1d1-31aac4cc1dcmr2043413a91.23.1751610982275; Thu, 03 Jul 2025
 23:36:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250703222314.309967-1-aleksandr.mikhalitsyn@canonical.com> <20250703222314.309967-6-aleksandr.mikhalitsyn@canonical.com>
In-Reply-To: <20250703222314.309967-6-aleksandr.mikhalitsyn@canonical.com>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Thu, 3 Jul 2025 23:36:10 -0700
X-Gm-Features: Ac12FXzTg6232dhZE0BeMsDyx28vQJwZtDpAIWL-D4Azhs-fNYZ3MQuDeSy09GA
Message-ID: <CAAVpQUDdJgvUNUdbQeWkAOrkVbwP_-wAEsVjoiKCGB=Y=8=JUQ@mail.gmail.com>
Subject: Re: [PATCH net-next v3 5/7] af_unix: stash pidfs dentry when needed
To: Alexander Mikhalitsyn <aleksandr.mikhalitsyn@canonical.com>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Leon Romanovsky <leon@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Christian Brauner <brauner@kernel.org>, 
	Lennart Poettering <mzxreary@0pointer.de>, Luca Boccassi <bluca@debian.org>, 
	David Rheinsberg <david@readahead.eu>, Willem de Bruijn <willemb@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 3, 2025 at 3:23=E2=80=AFPM Alexander Mikhalitsyn
<aleksandr.mikhalitsyn@canonical.com> wrote:
>
> We need to ensure that pidfs dentry is allocated when we meet any
> struct pid for the first time. This will allows us to open pidfd
> even after the task it corresponds to is reaped.
>
> Basically, we need to identify all places where we fill skb/scm_cookie
> with struct pid reference for the first time and call pidfs_register_pid(=
).
>
> Tricky thing here is that we have a few places where this happends
> depending on what userspace is doing:
> - [__scm_replace_pid()] explicitly sending an SCM_CREDENTIALS message
>                         and specified pid in a numeric format
> - [unix_maybe_add_creds()] enabled SO_PASSCRED/SO_PASSPIDFD but
>                            didn't send SCM_CREDENTIALS explicitly
> - [scm_send()] force_creds is true. Netlink case, we don't need to touch =
it.
>
> Cc: linux-kernel@vger.kernel.org
> Cc: netdev@vger.kernel.org
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Eric Dumazet <edumazet@google.com>
> Cc: Jakub Kicinski <kuba@kernel.org>
> Cc: Paolo Abeni <pabeni@redhat.com>
> Cc: Simon Horman <horms@kernel.org>
> Cc: Leon Romanovsky <leon@kernel.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Christian Brauner <brauner@kernel.org>
> Cc: Kuniyuki Iwashima <kuniyu@google.com>
> Cc: Lennart Poettering <mzxreary@0pointer.de>
> Cc: Luca Boccassi <bluca@debian.org>
> Cc: David Rheinsberg <david@readahead.eu>
> Signed-off-by: Alexander Mikhalitsyn <aleksandr.mikhalitsyn@canonical.com=
>

Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
