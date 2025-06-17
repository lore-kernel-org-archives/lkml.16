Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 225B51DDA24
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 21:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750194963; cv=none; b=aRteXxEHml9lrDG+Dx2R1IBqmoHQs34NHTSzHHbkGERX5rVKjO0Ab6QaVCbMdoKIwdRa8GjcZemilgYMGAWqI0Q60vKSI92dLBxHE7gNSNUBv+vMMyteWNwwSj0t1LU/5+uAcHOm+bII6JAF2XIhtPy/lS5XeLHwqPcd+csYWCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750194963; c=relaxed/simple;
	bh=9eBtcygy47SZb5VaeO9DG1Ep4wTwbollzhARKjEHGfo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KxAmUQ5oFuXKYwTl7T+7nFE3dd3S6ANNAL1QWLfeM+tQBawirzYBsJSgnKDnV17pA/tMswJu69j95Cz/SRgV4DtJehd5mp6LAcwK+972soxlPy5sDTiV0S7AdpUDhTPygQFYE/dbMNGuqB7i9mRwR3qDbgRr3vcwrNN/I5fOLb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JmFCHOE5; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JmFCHOE5"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5f438523d6fso752a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 14:16:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750194960; x=1750799760; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9eBtcygy47SZb5VaeO9DG1Ep4wTwbollzhARKjEHGfo=;
        b=JmFCHOE5IPHZNxfmklG3p68R5XXx/0ZXZRgC8dpv8tADhYB7vwA8I+f2qXKfV7xF+t
         mrOwWi8wP0oVi0HP+J4ooT8c3HR4xdo1b5j5aolo9ygQyYbuYCYDHN0wadQC/0Q6HUv1
         ooaEz7URXhJG6OzCl35sn1R8zTVKzvc0xJET6ONsTXk145VOKgKCq5mwehh4Qr4E7wu9
         zaGVvJUgC+nBmS5N3m8TVqpPrIWXdwPrhh3MY/dLo9fJhWXiHedf2Z8Tr1yetydNEuaW
         pVoAwtlDRjE9jQu225R8JzTmVNI+35PTZoR2g7mLSKvth86acrvqOai3V69Ks8meXzxv
         FzNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750194960; x=1750799760;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9eBtcygy47SZb5VaeO9DG1Ep4wTwbollzhARKjEHGfo=;
        b=qFRqqzGKpP4DPut1+2u/KWvDiY/7y4Hihc0mrfRhW5JT2j4QVPLBLdrEkAZ3rGYxp3
         +XwbZNae/amyX0diRLtHfMCRh7Wo/O/ApwTgQKdGSP6GE0fNod9shHjmEaLnfop2s3vx
         KWqXqIshaN0k7VdEwl7Y06hPqO3/BEolsoe7Hcsr/tYCPkKxiseIJ/16ifPAe2DUaZmu
         pIH5n9XKNdScw21UOUzho/vzeAfl+cv6GFUC29y0pODKoJ3TBY2UJBOxdH916CA7h4Ml
         eenxPr1tHLAlNJeA7I/jKXSmiPzWgPRXTIARMWmY9esJzya+L6/BnY2WmNtcK7W3dzHQ
         sC7g==
X-Forwarded-Encrypted: i=1; AJvYcCUG/JJDUAk1rxTvgMjnvIx63K7wf7F5fCUcrfi3ovG4yR9BU3ps9fwjMAADFoPgyuUqYx3xL38jSJbr/yo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyvRvHWruuavxNNBc3q5C4Sacrkqg9m+kLcyjfTF3EwTGBRcozj
	sXNGGlvewblYBAu93JEyU5VcAghE0Q/S1uE27EqPiKMEP1iKKM9BiUHw/3av9BLxHp9l+11G114
	KUBZ0GKx4kq0eUVrLm5RS9LP8Xn7rrGWHtm1+344m
X-Gm-Gg: ASbGncthMAC8vA/266KefwQ/rTsWstHF0AxwismLC1LZPfG1aG7RkLPIrLSCj6+8T+e
	lUcO7li3tDEfrVOP3wErO3Yyo1B2/8Xqfxh8XGc4JsJ7wdkxloHBQBq/RO23u37kNLJH4mgc7F7
	3r/zi3TYO8QZRrVwe1Dd/buOSm9f9DFmpaP32D7HCzf9BE/IUSJ4BZ6KT2zjy+gI6R2IwcMDLg4
	Q==
X-Google-Smtp-Source: AGHT+IHSguIdelAkEXZw7KrekBLLZrXMrPoAP77usy+Fpa+804VQRdA4lcWnIyN3aCeWYBIHcg2/uwaXDI+XywBF11Y=
X-Received: by 2002:a50:d659:0:b0:606:f77b:7943 with SMTP id
 4fb4d7f45d1cf-608d2ea893amr273467a12.0.1750194960150; Tue, 17 Jun 2025
 14:16:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250617210950.1338107-1-almasrymina@google.com>
In-Reply-To: <20250617210950.1338107-1-almasrymina@google.com>
From: Mina Almasry <almasrymina@google.com>
Date: Tue, 17 Jun 2025 14:15:43 -0700
X-Gm-Features: AX0GCFtm4NiCq-JdE7LLy3ZIpgaVJe6qSvO_oE342Pmx2zZ8EF2vpAd3SdtCHbo
Message-ID: <CAHS8izMWiiHbfnHY=r5uCjHmDSDbWgsOOrctyuxJF3Q3+XLxWw@mail.gmail.com>
Subject: Re: [PATCH net v1] netmem: fix skb_frag_address_safe with unreadable skbs
To: netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	ap420073@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 17, 2025 at 2:09=E2=80=AFPM Mina Almasry <almasrymina@google.co=
m> wrote:
>
> skb_frag_address_safe() needs a check that the
> skb_frag_page exists check similar to skb_frag_address().
>
> Cc: ap420073@gmail.com
>

Sorry, I realized right after hitting send, I'm missing:

Fixes: 9f6b619edf2e ("net: support non paged skb frags")

I can respin after the 24hr cooldown.

--=20
Thanks,
Mina
