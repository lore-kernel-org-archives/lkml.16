Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CAF52550A3
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 06:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751610759; cv=none; b=X5nC4sEVUWgvUSXncWEIRMhOOF+hZOzPczUuwzUjmE/cjvsRmrqQ9dmM2Numw8f60vmBcmAdTHY5n+0xzQsoZ+zuArHOD88EikyeO+osHrplhPfxGByH1i4xqBrkDYSDoitvf8mnpFl4Dm0cFaGv30cjYswXrx7f8MtG1Ydhq98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751610759; c=relaxed/simple;
	bh=bW38HoOG8BJ8/lcEADwqe31KzLD4Xuz2XljmttWHZwY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j+OTY5i9TKuMuUVPkAAs4iD6mHyGzCI70Ra2los3NR9gOIh2GrD+WeuOVWeVlGPtG8lQK+yyNVdNCsoXw19bEryNRGWwTWVulQNXEz4rLtVkgC2PTX01o150w7fDy04itlp6rJeXxyuGUPOYPVl5Hjw7xNYzCYTbaXJFgKQzHiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Gwra00Ve; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Gwra00Ve"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-234b9dfb842so6434035ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 23:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751610757; x=1752215557; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bW38HoOG8BJ8/lcEADwqe31KzLD4Xuz2XljmttWHZwY=;
        b=Gwra00Ve2WpbFkfA3MHjfRAb+2hYV0wcKLZxGedQOLR0sInb7pKV2CAQ/e0zGJI9EF
         swPykQfUKBsF2RO6c7aIzjQ6IlybgmBUik0U5KJxvkt1ivJnbdhi5Xzqie23H1gNupqW
         Gnx+ciMvchigN5R2IFq35CsinRUVFV+Z8mFFlTdxXv7oRaY/xyf+nGEwyR9aHTBnjoOL
         iRGl0IfimuHwft36xJqbrXzbrobgQsAvMSXKSpYywZ/uokE5jR443r47fD3g8JTNz9Dm
         rRNUiiZ32ejfa5DEbDeRhi+pZyb5U7YjKItQ40gKC0t4cakA7Ec+1IYPd8vHXeB4EdQH
         bH0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751610757; x=1752215557;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bW38HoOG8BJ8/lcEADwqe31KzLD4Xuz2XljmttWHZwY=;
        b=In9DTPNz55O9o6E7EBL1ZLueF9M+ZGPNPhJeVQmUoZOcxdgf3FaeE0eFZgmW3iSPY0
         PAnen2lusJ1gmvkNleCfx7ehUWPnVKm2AfuzL6f51M+93ffFvB7MJPAkOquyt4o0z9FW
         wcQjKiN736jVoa9lnpeDdXpumoDCfTJhs+cO/g3otunDG0kVzmQLobQrIrh+iJK+Vq9c
         sm5k2rho4tceB1Y3g+PniUeKfsFS1D7XQlFY0JS02PxgAWZ2pVWisi3urXdAqmLZK8jt
         /mAjg0bWTaCeqEiAz0Xy/NAuv+l7+WCDOst3zdne7sgxo4PcUnlgcrAEQ1t6eg7/lGwL
         3EuA==
X-Gm-Message-State: AOJu0YyRfYmT/67um4LyC870qAUBI/aYafrmkZe6e18/WXNSu/dvV/FF
	kaKeS7yqacQ+1Td124adwEraQ0ANLtDeUUvLsDlNm2Z0WfbP3nHfSTXHq5Onv8aJiyVR0qYORA6
	TyZjh48AryV5xmY7nIA0i/1w64t4Pk3dTZ3l925It
X-Gm-Gg: ASbGncurNpzDX5VgaC5rnG8nop4uOfYYWbVaBIXYCReN2+Oyw7a61b2b6CkZV7+5Szm
	glDYQAFTHb6pmBk7u7GjlD6rS6xQe4FBM5OyTZsVKSD486bkhG1M9HQbXBaroFtTGpvts3dgUqv
	qPbCXcy2XO/r0TBW5ql5RQ/XNBawmGI8G7MKzBNcG57/9F2Qv364bAnAyv4BugdKjE6Aa4mElzy
	g==
X-Google-Smtp-Source: AGHT+IFlijuScf5GueouIoSdy88ZOExg3BGfGXdnU6iWiUuGJdQ2+xVWlfMMrPj+fBM2GhpLJI1c/WPx7/X7ynDsFLM=
X-Received: by 2002:a17:90b:3c0c:b0:312:2bb:aa89 with SMTP id
 98e67ed59e1d1-31aadda369bmr1398712a91.20.1751610757304; Thu, 03 Jul 2025
 23:32:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250703222314.309967-1-aleksandr.mikhalitsyn@canonical.com> <20250703222314.309967-2-aleksandr.mikhalitsyn@canonical.com>
In-Reply-To: <20250703222314.309967-2-aleksandr.mikhalitsyn@canonical.com>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Thu, 3 Jul 2025 23:32:25 -0700
X-Gm-Features: Ac12FXzzwNLoSRxnyRclSXtaCVD4LfgoskTv8fLUOj3llCpKrCJ4FQuvzqJiyKw
Message-ID: <CAAVpQUB9UMXorFPUKV969NQHont6EM2RYz3xUmT-nNqVATmTFw@mail.gmail.com>
Subject: Re: [PATCH net-next v3 1/7] af_unix: rework unix_maybe_add_creds() to
 allow sleep
To: Alexander Mikhalitsyn <aleksandr.mikhalitsyn@canonical.com>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Leon Romanovsky <leon@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Christian Brauner <brauner@kernel.org>, 
	Lennart Poettering <mzxreary@0pointer.de>, Luca Boccassi <bluca@debian.org>, 
	David Rheinsberg <david@readahead.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 3, 2025 at 3:23=E2=80=AFPM Alexander Mikhalitsyn
<aleksandr.mikhalitsyn@canonical.com> wrote:
>
> As a preparation for the next patches we need to allow sleeping
> in unix_maybe_add_creds() and also return err. Currently, we can't do
> that as unix_maybe_add_creds() is being called under unix_state_lock().
> There is no need for this, really. So let's move call sites of
> this helper a bit and do necessary function signature changes.
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
> Reviewed-by: Christian Brauner <brauner@kernel.org>

Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
