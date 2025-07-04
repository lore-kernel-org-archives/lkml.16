Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD087328B12
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 08:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751616169; cv=none; b=B32p17c4uhLhKOtyzcaF+HtbilAGlnnR2ZFQodVudAImMtqV0Fjf+n/VJulzxE4pcmvC0QCHgjqzGN1vL1Ag6UJNSpExdwfXNMeLE8RH1XVfQmV+D7TzMf09+o1R7855rLwYNi0V+Q91oSSLxuKc576riDEBrTGGb/u6q7gk2h4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751616169; c=relaxed/simple;
	bh=46Q1fd2UmAUeRYeGhPM7wSGhz2EFf4uCAOpm7Lsa8zU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NCc19mNYSeM3+Tid7wo7ZktBt50v4TTHsNcLHvt69dY2CzbbYvAsaEjuKhEB9UOjuiyOev1hu1fq2Lvxv6BF5m4DSQQl9TgCp9IC/8Wh60KZN0T4cKC9lofZXRVxC/9Xh8eXucYzyIeNEmTvCDyjzA+MXMBC2TRT8bZwlwwSp70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MllK1c7P; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MllK1c7P"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-55516abe02cso739185e87.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 01:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751616166; x=1752220966; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=46Q1fd2UmAUeRYeGhPM7wSGhz2EFf4uCAOpm7Lsa8zU=;
        b=MllK1c7PNs9qQQbLSM7G+74lLv8BXWTBxGZK299gH0fjH5la+q98CSR84sP76JXcg1
         k49QquKoLT2I+0t4QKL3DJZtCiPdGpkjmfsp+kYxFyEUFj18mWgHTl8kvm0SMkl32ywW
         LW+1xGIl0XbVJV2mfWFhUTg1AiBjcHEIDAL8C37FDRMNSos6/ddA1cudanLbzR5WFZo0
         k5oJnnRXdw3rv1C4V3BBlA5zev1PBcezg3wLPO23PBkuVXjyM/Ua6iThDN4KZr/bR+sH
         wupHSciSCbjnE8YURVmPK2HJS5dfdy/KyWqrALT2EAIT/zhkqFOpxePaV0KCfNR8x+Fn
         +OuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751616166; x=1752220966;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=46Q1fd2UmAUeRYeGhPM7wSGhz2EFf4uCAOpm7Lsa8zU=;
        b=eyCrO1BETweoj3eH46G50tIX1ZTFSwa8Q1WFzOtCPaMQQyE8r8U7LIU1VGBfsKCt63
         Nk7YiFTaq/eMh1xJMdTvR5vRGTqILHQsZ1F4h0MGnz7HRUZSpNO4Aj007bbBFhMcnrTU
         QAnxTO4qvGdlcOFqCYWq6OkbTRDZhm5lY2vbKidH6j5yYrcf3fRVKW3EJ/NQq9HJZ7t3
         ne+9Oh97nt33i+pz+oCEox0mayhMdUPDGAgraQO06OSeW+q8J90HASSEDCLKQI5RGYrp
         0vvPlFZ+TOopi0dobL8xISM4QznuoMFcbrZtI2ECvuATvLMUUKMB8XqF3esOYRpb46yo
         atkA==
X-Forwarded-Encrypted: i=1; AJvYcCXWZLEdRI+3f4e1pMnqsazZizz1Fh8Qf4A0Es62/4KoLB/nxVTv+WqVDPuKjyo2cfZUFtGmXKATWJnDCGA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxoJQp9c4S4Mb57E3UivZOPGZ+m1rW4CdjzdvJhZ606/gAjSWiu
	pvkuOUpe4M43oK0TFsB621kXrlOs3bpkBiUxYIEIEOSGgabuIy16PwBtLFfAp33bdMZeLH4e0Fy
	zMENJxb/ntS4j65BNOKGLOd3VndW89rZCy4e5uQBFew==
X-Gm-Gg: ASbGncv5hxd5NlpWPQS8ZPeKgQeu/7UGxhGJ2WwuH1dOBhr7/WtyG0rfFSTb1FWKSl7
	s6CZLQOWoqASgl1FtqAl5VK9sWHABjPiRSHz6oZWgcWPXAXa5GAAqAdd2XqPshBLgma3+HvtsFp
	MHrU0ES4Kb+tvwoDKYgJAGXSaBCeOYVF8DPUTWqIxgv8I=
X-Google-Smtp-Source: AGHT+IEViFXCMcn+u4hb5R0d0ojGEnFpfDhNI4g0r3Lc44CnC/koM/mbdYAwzUnF/KlRRn9NNEY5bmwt+E5RollIb+w=
X-Received: by 2002:a05:6512:1102:b0:550:e692:611b with SMTP id
 2adb3069b0e04-5565baa727cmr564962e87.16.1751616165679; Fri, 04 Jul 2025
 01:02:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250626080923.632789-1-paulk@sys-base.io> <20250626080923.632789-2-paulk@sys-base.io>
In-Reply-To: <20250626080923.632789-2-paulk@sys-base.io>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 4 Jul 2025 10:02:34 +0200
X-Gm-Features: Ac12FXzEoK3lIRrRhHYuQcLxyMKzE37BJ8MYgC7nOBJcQ6FysNDrbqPOTwFxTFY
Message-ID: <CACRpkdZ+kw0=X5L90Wuno9GjEi3pEnAV_bdJX=ELUxCbk5spRA@mail.gmail.com>
Subject: Re: [PATCH 1/5] pinctrl: sunxi: Fix a100 emac pin function name
To: Paul Kocialkowski <paulk@sys-base.io>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Andre Przywara <andre.przywara@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 26, 2025 at 10:11=E2=80=AFAM Paul Kocialkowski <paulk@sys-base.=
io> wrote:

> The Allwinner A100/A133 only has a single emac instance, which is
> referred to as "emac" everywhere. Fix the pin names to drop the
> trailing "0" that has no reason to be.
>
> Fixes: 473436e7647d ("pinctrl: sunxi: add support for the Allwinner A100 =
pin controller")
> Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>

This patch 1/5 applied to the pin control tree.

Yours,
Linus Walleij
