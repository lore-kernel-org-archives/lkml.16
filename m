Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4FC615CD74
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 08:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751359669; cv=none; b=Fc3hQDIkGcbqQkmBipDbPwQ4waLFmfFbg7Yg6K9lRLUsTKmia33D8nVwcL1KlrG38eTrrzQUMWDx3Shw6qT1Qip0N0Q++lslDwcjh/16aeHQ+vtUxaofBvVdzAGVRNuKnXv/TBHEoWSIiZ/mqixp5ZVezG3Spp3936k6xMbzrVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751359669; c=relaxed/simple;
	bh=5ikLTc8iKzNYke9+vz4Tcgp3xgvRhKTpysolE+c/wEA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lvv4hTBAEAPJWo1Jezx9fPPwubGtwuoyzkKHwLTjKwTX1Ok+QZqtgrWnEjNSqM7FCEDrXRUEETzQA9ametRyTMgmPcD0nhvYizSbDurCBs58Uqvy/0jouCunm3EXugyxXDVz4qOzX2yIJ0SjWVLHBcPb4dMl7oUMieGK+3A4vRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=k68trykb; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="k68trykb"
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id CB6853F697
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 08:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1751359665;
	bh=5ikLTc8iKzNYke9+vz4Tcgp3xgvRhKTpysolE+c/wEA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=k68trykbqPYDGrWevIXaPjrBHYlOdfP3sCDqv8DDpw+JMXvsXWPAz0N3maLHM2EK3
	 0pk7dXXds9NCaS5z+n8n/aD3Apm5CUJnSbWdKjbSsxK2azialV6lJAU8barajhwLOq
	 KyRE2RFHqp4HAe5i/Vr4u8RrZbXY/DX6I6tMuleC0xXAyXo/WocoaHzBOAziKALGH7
	 1swqWN8pwsbVRFHIXE83l/LBiG651Dt8Y9k6lq7s9SwZvdLJC3qwazaQlHErNth3Zq
	 ZIVUTz3W+7ceXY6dIdq5XcRFGjs1v3+k82Q3+ZYA4/fVYpbDtkPPNjubmmSBDbn+7q
	 IXNVhnlKb5kag==
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-87ece544f24so3934268241.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 01:47:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751359665; x=1751964465;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5ikLTc8iKzNYke9+vz4Tcgp3xgvRhKTpysolE+c/wEA=;
        b=T16EXrKzKAf3+/x8c0+Gem1RAxXojy/pFHh1vJ9bk5dk/VE0Q4YMHuDsupg+/BXcYI
         rgOkKmnHIg2Xhx3kj9kNZIacpluJTeKRkSxA5G/Xrsy0zzQwgLcJtdgP3SRHTvaJLPnl
         vAwo2QK/csz4bTs1kjPwHEt0n1q07DykyDlKO/lr11zwnZWTCtno5q68pk+paaztvtuU
         3HByXlyyBZY0Et1M7lQB5h/ovhmZ6Czn+RosMgYFRIDf3/34aWawQXiCgO89fSmi/7MJ
         CbFUx1AMx2bPMlg6xXK+t6I45hAh//1wqwBqCDEVGgBvdE9dqsPQC7zT0s+O716wN6ND
         33cw==
X-Forwarded-Encrypted: i=1; AJvYcCUOCd5DnoseGm/RFHXcCsJN+XKrsx7zcNVPOshEddW/12JmMk+eQndf8G77onGaTg9WOi3UoLj1Fuv4Sqw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYMn2j7UWczSNz2hDF5WCqyz12cuM/j2/yDQDq5cIFBvs4ADlz
	X6eEDBBZlhDjLjYnMkJsgmRaFhuNQoRtKxZNzZry1nV/AkmL+mFrShqWcuAojS24/tnGNZzD8r1
	G1sh3Ms4VVjZCfFa4nlyNwpraHXQdcUk1XG2kkt6BP9pSdaoyswTQnnpSv51X/AmiywxGrQ056z
	88cZzBZ3JdnnupRfY26EB2EB97Iigk1vTWZ2nfEhFPIBgISCUX1xLao7nC
X-Gm-Gg: ASbGncsEZ9mHmErFhhO0QDisWffZyu3GAva1iZPTJZznghCGU91GtRm8jrfe7n1AQzu
	1xrvjFs82Hvi7HVc+EEDVrmgPlr9MWwuIX3KIsRzC50UoMK5KLcFfcGA5SjfHPHLnKE42O0QTrW
	IxtqH2
X-Received: by 2002:a05:6102:2b8d:b0:4e2:a235:24d1 with SMTP id ada2fe7eead31-4f143b1764dmr1631178137.4.1751359664861;
        Tue, 01 Jul 2025 01:47:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG/XfNIm44PW5VunFf6h0jOcW1yP6L42lTuRUgGXOj4POf34vLlfU9zPs6f8E7vyoPOSBamW1MimVgR8iVOnwE=
X-Received: by 2002:a05:6102:2b8d:b0:4e2:a235:24d1 with SMTP id
 ada2fe7eead31-4f143b1764dmr1631166137.4.1751359664487; Tue, 01 Jul 2025
 01:47:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250629214449.14462-1-aleksandr.mikhalitsyn@canonical.com>
 <20250629214449.14462-7-aleksandr.mikhalitsyn@canonical.com> <20250701-gehege-portrait-c098442c73d1@brauner>
In-Reply-To: <20250701-gehege-portrait-c098442c73d1@brauner>
From: Aleksandr Mikhalitsyn <aleksandr.mikhalitsyn@canonical.com>
Date: Tue, 1 Jul 2025 10:47:31 +0200
X-Gm-Features: Ac12FXyvlb-oWVV4ZdKdWiFUglPTeWBh1qsmwVkifm-1RfJ3O1YjwqQVr7X_3U8
Message-ID: <CAEivzxfULsywKKuYM+T-5AMSQdF7ZyG85=PEJ0KZ0__j-B6=xw@mail.gmail.com>
Subject: Re: [RESEND PATCH net-next 6/6] selftests: net: extend SCM_PIDFD test
 to cover stale pidfds
To: Christian Brauner <brauner@kernel.org>
Cc: kuniyu@google.com, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	Shuah Khan <shuah@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Lennart Poettering <mzxreary@0pointer.de>, 
	Luca Boccassi <bluca@debian.org>, David Rheinsberg <david@readahead.eu>, 
	Kuniyuki Iwashima <kuniyu@amazon.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 1, 2025 at 9:59=E2=80=AFAM Christian Brauner <brauner@kernel.or=
g> wrote:
>
> On Sun, Jun 29, 2025 at 11:44:43PM +0200, Alexander Mikhalitsyn wrote:
> > Extend SCM_PIDFD test scenarios to also cover dead task's
> > pidfd retrieval and reading its exit info.
> >
> > Cc: linux-kselftest@vger.kernel.org
> > Cc: linux-kernel@vger.kernel.org
> > Cc: netdev@vger.kernel.org
> > Cc: Shuah Khan <shuah@kernel.org>
> > Cc: "David S. Miller" <davem@davemloft.net>
> > Cc: Eric Dumazet <edumazet@google.com>
> > Cc: Jakub Kicinski <kuba@kernel.org>
> > Cc: Paolo Abeni <pabeni@redhat.com>
> > Cc: Simon Horman <horms@kernel.org>
> > Cc: Christian Brauner <brauner@kernel.org>
> > Cc: Kuniyuki Iwashima <kuniyu@google.com>
> > Cc: Lennart Poettering <mzxreary@0pointer.de>
> > Cc: Luca Boccassi <bluca@debian.org>
> > Cc: David Rheinsberg <david@readahead.eu>
> > Signed-off-by: Alexander Mikhalitsyn <aleksandr.mikhalitsyn@canonical.c=
om>
> > ---
>
> Thanks for the tests!
> Reviewed-by: Christian Brauner <brauner@kernel.org>

Thanks for off-list discussions/review and help too, Christian! ;-)
