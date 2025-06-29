Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCAB6224B00
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 21:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751233854; cv=none; b=Hl9eaFmmdLp/iO9aeMICOu5xbe1fxtXRlelpe0WCSSq2za2LH4rNyJIPFyllRh9oQ46J4zjVVrUVgSq5ClnTGSSk9eP/gR9IbOlBWKsEy1ojvFKGvMdc6wwgBKgs7KCkSfsGbtn9qvj2g+hTsw0kn6VtxWOYYC/8GbWfBqgQ4w0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751233854; c=relaxed/simple;
	bh=qO0rik26FBneJbzsa9ayRMc6c8wrTlvCm/fCbU3rTj4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nsecbAEG9ZbAOdTRp4xGMqGkNMnvncWxEYKuKRQNM+nbUQA1g3+J9EFk6tFNbI7XJ0MwaEaVefTZDQ57/cq+ty4N29+td3zpKrhDWkeRAsrTZ/oSdJLAUzo9fZybXDxl2x90GjrSxD0xUyfLVy1za1D2sQO5Pn1/pDe2Iw8hrfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=P9BKVx8e; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="P9BKVx8e"
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 39E8E3F519
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 21:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1751233850;
	bh=vxyvHsvR7bghBFrXwsxkgXknmV7/aeenDIgq9okrCzk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=P9BKVx8eW9ksbAAaFN/FQ7Cu45/DjCnezcqz94z0g7nPZpyT60QRpvDMAZtLCtkvP
	 vLe08C3kuHmGq1F3++Aj32xS3RRoghQy0QctYWPYVZPMJgkeqNnDLnPrsRqio2Txpz
	 MkD3OrbyjLcvEQfNB5PZZfbZRidLoLMoCbDDNdrcX948q++nXlauI8Azk6AKxQM1Me
	 Vf15eaNevi86u7CyVbTBMIZb0znQn2E/Adln8Mm1FeFHhKS6FjG9aa+WUFZ3q1ZYKV
	 22gsTFaQaVjp7Kb5Rs+IY0604KKS9pIgsblHvwiE1F+hBLP0L/43hQaBfdPIZEZfsD
	 EqoRrvyjmcG8Q==
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-4e7f690fc97so263662137.3
        for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 14:50:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751233849; x=1751838649;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vxyvHsvR7bghBFrXwsxkgXknmV7/aeenDIgq9okrCzk=;
        b=UMY7D/u+ldaOLgWngG/iH+tT1+cBo3sQmF88DTiWjxnk9CJXXFrJbyrtv3HEMNkik3
         C5ZilKWzhxyohT9XffZ2a0JQ0cfb9Dz3H7rEe8BBi1Gyr70/Su+OK8A3uBHw+1TeYHD9
         WXNzQ+0lPGGtKptRPwWJoOFd9qiroTLlstjpqEcHSqZ/ZxNUpRqXN/kUAN73RXj0J2Bj
         KjtPVyEsaVSikQkIca2ISVDN7Tm+ZM8NDlHVM4pCw1A887czsviHX9Z+cHOsNZXGCqGH
         FsjGLyUadh36ByI5BxXOnTOLnvsVjRAVtcE3l61KumrTEoZEyUlyZgHWE01WkOcoPuV/
         Do0A==
X-Gm-Message-State: AOJu0YxxMOjX953reyx+k0Q5R7sI3+h2rwB88Tl5IM/nbAG+Y+Iiun8x
	PGH7k6gZsX+MJ5xedT0yMpAAk9H0r57xqTqVO3h1R5xezMiFWMTBhGfz+nUS5reB8HnQKr1Yr/S
	YU80loInUQyvyk08RoJ2tGdG79Mkp2OXdcEMNgJ4MfXKoMEKM8gCqWN8Icp99twTiLkX+3c/WfW
	ENyBvNFsKEA3ErepTN+pxJHj85BAKGfZ8vY+5GdXG3aAzaV360YNFEBjnZ
X-Gm-Gg: ASbGncv/nZodG+3S+xCbNNtgBR18R8MJuZszOUPAeSFFXi1fyzVT+G2E5FFRyDiKI3p
	hskY3T8E2+CrhWDZq8cvTstMF8NRb8rAEp9Jzo6m9xCRMDIJNxsb1MLrAXgvbEdaJ+tMGMO2ITP
	wWITFO
X-Received: by 2002:a05:6102:3586:b0:4ec:c53f:bd10 with SMTP id ada2fe7eead31-4ee4f71e193mr6111404137.16.1751233849178;
        Sun, 29 Jun 2025 14:50:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE3putHMCnjEhjB4xKrKlaxAT+T0n2581zYJq5hWZq+70KQno6CFRHk1W0b4NAbY4BvechoGFe9nlB5GwpCag4=
X-Received: by 2002:a05:6102:3586:b0:4ec:c53f:bd10 with SMTP id
 ada2fe7eead31-4ee4f71e193mr6111395137.16.1751233848849; Sun, 29 Jun 2025
 14:50:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250629214004.13100-1-aleksandr.mikhalitsyn@canonical.com>
In-Reply-To: <20250629214004.13100-1-aleksandr.mikhalitsyn@canonical.com>
From: Aleksandr Mikhalitsyn <aleksandr.mikhalitsyn@canonical.com>
Date: Sun, 29 Jun 2025 23:50:37 +0200
X-Gm-Features: Ac12FXyuOv83FzEnLL7pcPZHj9NI8wpeuDQ4Pk25uk-jiPgsNBgmrOk7LgpucO8
Message-ID: <CAEivzxfLCdv1H6ye8pazG1jw5qiBvtCf2zxE1nom=ziNtwuNiA@mail.gmail.com>
Subject: Re: [PATCH net-next 0/6] allow reaped pidfds receive in SCM_PIDFD
To: kuniyu@amazon.com
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Willem de Bruijn <willemb@google.com>, Leon Romanovsky <leon@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Christian Brauner <brauner@kernel.org>, Lennart Poettering <mzxreary@0pointer.de>, 
	Luca Boccassi <bluca@debian.org>, David Rheinsberg <david@readahead.eu>, Simon Horman <horms@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear friends,

Please, ignore. I had to resent [1] the series because Kuniyuki
Iwashima's email in @amazon.com is no longer valid.

[1] https://lore.kernel.org/netdev/20250629214449.14462-1-aleksandr.mikhali=
tsyn@canonical.com/

Sorry for the inconvenience and extra noise.

Kind regards,
Alex

On Sun, Jun 29, 2025 at 11:40=E2=80=AFPM Alexander Mikhalitsyn
<aleksandr.mikhalitsyn@canonical.com> wrote:
>
> This is a logical continuation of a story from [1], where Christian
> extented SO_PEERPIDFD to allow getting pidfds for a reaped tasks.
>
> Git tree:
> https://github.com/mihalicyn/linux/commits/scm_pidfd_stale
>
> Series based on https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.g=
it/log/?h=3Dvfs-6.17.pidfs
>
> It does not use pidfs_get_pid()/pidfs_put_pid() API as these were removed=
 in a scope of [2].
> I've checked that net-next branch currently (still) has these obsolete fu=
nctions, but it
> will eventually include changes from [2], so it's not a big problem.
>
> Link: https://lore.kernel.org/all/20250425-work-pidfs-net-v2-0-450a19461e=
75@kernel.org/ [1]
> Link: https://lore.kernel.org/all/20250618-work-pidfs-persistent-v2-0-98f=
3456fd552@kernel.org/ [2]
>
> Cc: linux-kernel@vger.kernel.org
> Cc: netdev@vger.kernel.org
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Eric Dumazet <edumazet@google.com>
> Cc: Jakub Kicinski <kuba@kernel.org>
> Cc: Paolo Abeni <pabeni@redhat.com>
> Cc: Willem de Bruijn <willemb@google.com>
> Cc: Leon Romanovsky <leon@kernel.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Christian Brauner <brauner@kernel.org>
> Cc: Kuniyuki Iwashima <kuniyu@amazon.com>
> Cc: Lennart Poettering <mzxreary@0pointer.de>
> Cc: Luca Boccassi <bluca@debian.org>
> Cc: David Rheinsberg <david@readahead.eu>
>
> Alexander Mikhalitsyn (6):
>   af_unix: rework unix_maybe_add_creds() to allow sleep
>   af_unix: introduce unix_skb_to_scm helper
>   af_unix: introduce and use __scm_replace_pid() helper
>   af_unix: stash pidfs dentry when needed
>   af_unix: enable handing out pidfds for reaped tasks in SCM_PIDFD
>   selftests: net: extend SCM_PIDFD test to cover stale pidfds
>
>  include/net/scm.h                             |  46 +++-
>  net/core/scm.c                                |  13 +-
>  net/unix/af_unix.c                            |  76 ++++--
>  .../testing/selftests/net/af_unix/scm_pidfd.c | 217 ++++++++++++++----
>  4 files changed, 285 insertions(+), 67 deletions(-)
>
> --
> 2.43.0
>
