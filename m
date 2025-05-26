Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D1611E1DE2;
	Mon, 26 May 2025 11:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748258195; cv=none; b=f8L+UOih8beutq/MfnHWP6nd21ZeMcmIPl31uLQ7XOcv4vZQQTHrruY60U/Nox0RZJtWqDnczyFaev3yPC0bGvQvahs+kVaUPBPJT04BlRUwgCxb0tQUAYXXnCItchvgziwn4+WOyvVNRhH4fYbFJLJUFrF1Nu4U4i4F01JSTu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748258195; c=relaxed/simple;
	bh=Opjk65paFLJ2yocp1B1kEaydI6C3FZxcuvHE6R2phXo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iUA9p7BNTCDt9PMq5oUVNiElE+glXbCAmWVJpx9IsQ0jDEnzkERZgXp9gpPbpXtVey5T3UkcWP/SqF8oTjyF8OIyk3yR9ieo9r3R1AFq9TySylZ0bO8L3OHnAkFAVwyHt7XtZr+vunMG1SRqSucjUy8VEXUlwPXE39m22M8he0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QhjIp0dF; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QhjIp0dF"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-234593b0613so7948935ad.1;
        Mon, 26 May 2025 04:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748258193; x=1748862993; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Opjk65paFLJ2yocp1B1kEaydI6C3FZxcuvHE6R2phXo=;
        b=QhjIp0dFLStGYBat9U8cICPoGYYC3Yen++Ln1ow2MC5YS04W/NQvBpIkT0jb8inQvi
         hBpcItrxVye4onrQG+2mazHbDKgYekktMW7eGWedz97pUS5/op34hel/RNzt8Aov4y44
         lXjdfiyCyLifzaNdF84yXGvG0ffaic0SSAjVEDzs7jXzy6RHxwgWNZd5FOwrD4BO9FRv
         +vAXA78AzdrZRq0trlG7blS1AijM0Cg6WmNzRWIB2Nzk2ZISC4vvl+UjJlOHMLZB60S/
         sSeQ1vCGgoL8a5Zhv2TMj8lwPXJZXBWKb7iGJLy3gDV2PsQfh46Ggn2pp+wjyDCSN6Jw
         50VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748258193; x=1748862993;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Opjk65paFLJ2yocp1B1kEaydI6C3FZxcuvHE6R2phXo=;
        b=HNiiMHHOO7RHAAeHuUQcL1vdKH7KaMFBAdtiqhU6+eXmt3vqmkLy3LBm2v8Epf6kek
         yyDZZeL54BbNvtSbZYMW61Jxn3BrjyKBZCMe7MDn3Q/AqK6/kDWuH0dT9AWgvVYw29FB
         XJkMbxXi/blL4stTcHR5SD5aiBKTQ4Om7vO6SyKO6vg618FsBWz6HsfCCiCA/HljdJxB
         OoQSrEK4GsyBQajNgcLsLCy1HI7gqzg6mtvSjW+fXg2yc6O7P0+tS1JyFw7ErTRFitKi
         P5pLgo/tEEjEK5rbhU5jVQ83Q96TBeHRJcCeqGLT5MuHxNNmSlRSmXceq0DmTQJxdzq2
         Sgeg==
X-Forwarded-Encrypted: i=1; AJvYcCUF8nrAJ6g3In2Eoe+x0gqvY6p4/qDHMfSCOjNv8EPDRSwxQOYvKT0dd1WYBiHNO+GJ7lItC7zm7qR9eFqk@vger.kernel.org, AJvYcCUzGFdBRxhzuSYV7y4a+r3h8NcWEHxLsn6gmDIptjb7vybE+D5ajjsXyCuQ5t8QuCJUduCESj60773D@vger.kernel.org
X-Gm-Message-State: AOJu0YzTQ9nZP6Dh6mSSK3K21dAQiGoyP/gVAawPDbQydum/rGPJWkfs
	sU25QVglyg78CiepcyAw6K0Cmr/kJ/b6GvGLvvtTXjQjC9BFSRbKMU2Yoiwy0bYOsRhkQApgtsk
	PpPmdP9njGB8JTppqSl5bjIqy0z/FSSM=
X-Gm-Gg: ASbGnctv+0MUYylCjMZKRsfzHf24UovayUAwPZc/1/MsrtOMBkqWVB3NkCZfO8fYsYJ
	RQT7nCB4Q+sDCdfS2zPfSyDqy0XNVCbvJZw5uSRJbS9o39PrHfw0uaoCM8fUsIjA+wcXb8RMKgi
	qoftanFrzWZ5B0o20ubTsuKtANS876Pg==
X-Google-Smtp-Source: AGHT+IFtzvYREQF4e5RGyWZ3F4MYtqkkNGOvg9UsSWp9ip8U8N2Jl9OoCM3bMnVLyNovfB23/E5xH1xXxzKgvocOJGI=
X-Received: by 2002:a17:90a:d60e:b0:30c:540b:9ba with SMTP id
 98e67ed59e1d1-3110f0f9b4cmr14756973a91.10.1748258193279; Mon, 26 May 2025
 04:16:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250526-fpg-nxp-imx93-frdm-v2-0-e5ad0efaec33@pengutronix.de> <20250526-fpg-nxp-imx93-frdm-v2-2-e5ad0efaec33@pengutronix.de>
In-Reply-To: <20250526-fpg-nxp-imx93-frdm-v2-2-e5ad0efaec33@pengutronix.de>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Mon, 26 May 2025 14:18:15 +0300
X-Gm-Features: AX0GCFtcQ3gPsieet4uz43pbRsMbpHjmv7-rKiXRxjWLyoqRErH-OX-1hcUkpwM
Message-ID: <CAEnQRZCn0bBgn_FHS1Dn_p_gOraoLzU_1pLiyKoJTrbdD=LP3Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: freescale: add support for NXP i.MX93 FRDM
To: Fabian Pflug <f.pflug@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 26, 2025 at 2:03=E2=80=AFPM Fabian Pflug <f.pflug@pengutronix.d=
e> wrote:
>
> The FRDM i.MX 93 development board is a low-cost and compact development
> board featuring the i.MX93 applications processor.
>
> It features:
> - Dual Cortex-A55
> - 2 GB LPDDR4X / LPDDR4
> - 32 GB eMMC5.1
> - MicroSD slot
> - GbE RJ45 x 2
> - USB2.0 1x Type C, 1x Type A
>
> This file is based upon the one provided by nxp in their own kernel and
> yocto meta layer for the device, but adapted for mainline.
>
> Signed-off-by: Fabian Pflug <f.pflug@pengutronix.de>

Hello Fabian,

Can you also add the original S-o-b to give credit to NXP
developers who started this?


https://github.com/nxp-imx-support/meta-imx-frdm/blob/lf-6.6.36-2.1.0/meta-=
imx-bsp/recipes-kernel/linux/linux-imx/0002-arm64-dts-add-i.MX93-11x11-FRDM=
-basic-support.patch

Signed-off-by: Haidong Zheng <haidong.zheng@nxp.com>
Signed-off-by: Danwei Luo <danwei.luo@nxp.com>
Signed-off-by: Lei Xu <lei.xu@nxp.com>
