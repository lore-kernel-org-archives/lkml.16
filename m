Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 940EF1DEFDA
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 23:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747352306; cv=none; b=hEllWH5EFKv6Xkw1nOCqDbEITAsZR7AQQwN99l7Xt63k1KvHSLwzCkgbhmkNu1DrUJQ7s0Yzaa6wwcr5IYkvHDJCFUtiAzBn1+7Kq7nBOqP4Q0/z06F7iAkPVQ9y8LRclG/LFwyCGDhNWpXo9FH9wGM29VGpo+Pgh0Y1bXB4UJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747352306; c=relaxed/simple;
	bh=sDoZnVVwmjfJ1zTso7SNNiQVWymvr6AfPd1tbt9Mveg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VsuqKH2vvzLNB3d4vOw+teBd87kVS0QjjE8uNcchs7HHLGeWpOS3ZGEe8TxvzpNgGT3PA/9K9EnNSgJuiQ5T8ODrTDdCCVTQxhaA1OIpcCwSVvYF9NbuzZXFjsPiwq0BoFozY+wyJKBdiYptHUrYXcIejWJwxnpg4xpEQMTdxuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=hUCF4aV3; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="hUCF4aV3"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-327ff195303so9533951fa.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 16:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1747352303; x=1747957103; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sDoZnVVwmjfJ1zTso7SNNiQVWymvr6AfPd1tbt9Mveg=;
        b=hUCF4aV3YRP1a6VsFTylnDxDqhgx1vhnj7nzQpMRBu+RS0iEouVLw+0Rc/HcKT33Je
         YM392jBuCIdnQoVBZR+eJlkHax14FKfue1Z+fv/iHB7IP2ef2RWN3dxwD0Z3NkzDh1fe
         NeHO+XDGIGe8A3rI0ZYb5KqHTtERW8DIPZMsI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747352303; x=1747957103;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sDoZnVVwmjfJ1zTso7SNNiQVWymvr6AfPd1tbt9Mveg=;
        b=VQqdR24CjAHBVhXjQud8KIheIUvUSOqJqGrXhL9YMWPlBogMIvkC+wdgfWvQG+UwIy
         s5Ls+219zLrzjYVfRz3XEsal846mEZIfPKJWeLOipxWCJyF6mephwAjYgFujhD+Zhn0X
         uqoaeSXo3yio0aOp+FBm5/fRkPdyq0Vt2zU+ZiyOiDbS/aRDXo9PFK97FFQSwuG5a69i
         ZpWm94v5BoS+AJrT6et2rRRSQ5kLFys5+Uk5+746xC/XynLUXV9KQSlBgIgmEgHuXEMg
         nPk67dKsy266ackEdT8oC+Lhy9UBVM7Un8KwHXbL+muv8WfUh7rq/v33tk9Xs1eqEMOt
         ZPpA==
X-Forwarded-Encrypted: i=1; AJvYcCXTOEyYcn8olj7cWZVpGot0HpU+Kshy+NusH9EDv5oMFbrKBAdfkjNl/WeDBSTTK0D6Zk18NW8Ztgv4H4g=@vger.kernel.org
X-Gm-Message-State: AOJu0YytAMPgZFhkc73mZbZY3SQMLMB/Gx7Tx5hPIaq/FUS66xjRTMWo
	zPZZRVLZJ0Bw+X+pEPpopbCMeQwi+jko/5DOGaB5BbAorFSgAZHvrSxstJJhrgU802Zu0uV6eqL
	R4NO80obGRxkJ/6SX2qXL1+vD26QmJ0IJHXsIPVBK
X-Gm-Gg: ASbGncuXf1KOJCNWOcoOcjIB4gLx/T+0EPF3+5LfqTowyamdr8mdvNPIWL3T3R3+9Z5
	XirEu8TchU9ehCCYTaFMngiIYKWyHHf+obbU9BicwAiu9ejepudU0np696irqM4x5oDtGcb2F6n
	tpivyILQSQSr1JcRFoKaAbNU/G3jS1HuGuFw==
X-Google-Smtp-Source: AGHT+IFCE+3RTB1vC1GAd0I+DdlUsdvxlENWxVNeYEBBdvtM6MWTnZEm9qDAWQw/oIMA9y+u8pGsJeckbb6GUI1ABG0=
X-Received: by 2002:a05:651c:324b:b0:30b:acad:d5ce with SMTP id
 38308e7fff4ca-3280772ee74mr4859821fa.21.1747352302585; Thu, 15 May 2025
 16:38:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250513210504.1866-1-ronak.doshi@broadcom.com>
 <20250515070250.7c277988@kernel.org> <CAP1Q3XQcPnjOYRb+G7hSDE6=GH=Yzat_oLM3PMREp-DWgfmT6w@mail.gmail.com>
 <20250515142551.1fee0440@kernel.org>
In-Reply-To: <20250515142551.1fee0440@kernel.org>
From: Ronak Doshi <ronak.doshi@broadcom.com>
Date: Thu, 15 May 2025 16:38:05 -0700
X-Gm-Features: AX0GCFvfz5jvedR3utgr23lCgKouQogx2vMwPIGGcBXJXkJAh4ITTsjdDpnmy1k
Message-ID: <CAP1Q3XT-2uD87bm-Ch7Oj49=0NBba6vdcwp7dAf51FfmwJhUew@mail.gmail.com>
Subject: Re: [PATCH net] vmxnet3: correctly report gso type for UDP tunnels
To: Jakub Kicinski <kuba@kernel.org>
Cc: Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org, 
	Guolin Yang <guolin.yang@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 15, 2025 at 2:25=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> Not sure if the stack itself cares, but drivers look at those
> fields for TSO. I see a call to skb_inner_transport_offset()
> in vmxnet3_parse_hdr(). One thing to try would be to configure
> the machine for forwarding so that the packet comes via LRO
> and leaves via TSO.

I see. Yes, drivers do check for it. Sure, let me update the patch to not s=
et
encapsulation.

Thanks,
Ronak
